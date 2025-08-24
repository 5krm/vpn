<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\PackagePricing;
use App\Models\UserPackage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use DataTables;

class UserController extends Controller
{
    protected $user;

    public function __construct()
    {
        $this->user = Auth::guard('admin')->user();
    }

    /**
     * Display a listing of users
     */
    public function index(Request $request) {
        if (is_null($this->user) || !$this->user->can('user.view')) {
            abort(403, 'Access Denied: You do not have permission to view users.');
        }

        $headerTitle = 'User List';
        $pricings = PackagePricing::get();

        if ($request->ajax()) {
            $query = User::with(['userPackageDetails.packagePricing'])->select('users.*');
        
            // Apply status filter if present
            if (isset($request->status_filter) && $request->status_filter !== '') {
                $query->where('status', $request->status_filter);
            }
        
            // Apply default sorting if no sorting is passed from DataTables
            if (!$request->has('order') || empty($request->order)) {
                $query->orderBy('users.created_at', 'desc'); 
            }

            return DataTables::of($query)
                        ->editColumn('status', function($user) {
                            return $user->status === 0 
                                ? '<span class="badge badge-success">Active</span>' 
                                : '<span class="badge badge-secondary">Inactive</span>';
                        })
                        ->editColumn('login_mode', function($user) {
                            return $user->login_mode === 'pro' 
                                ? '<span class="badge badge-primary">Pro</span>' 
                                : '<span class="badge badge-info">Guest</span>';
                        })
                        ->editColumn('user_package_details.package_pricing.package_name', function ($user) {
                            return $user->userPackageDetails->packagePricing->package_name ?? 'N/A';
                        })
                        ->addColumn('actions', function($user) {
                            return view('backend.admin.users.partials.actions', compact('user'))->render();
                        })
                        ->rawColumns(['status', 'login_mode', 'actions'])
                        ->make(true);
        }

        return view('backend.admin.users.index', compact('headerTitle', 'pricings'));
    }

    /**
     * Show the form for creating a new user
     */
    public function add() {
        $data['headerTitle'] = 'Add New User';
        $data['pricings'] = PackagePricing::where('status', 0)->get();

        return view('backend.admin.users.add', $data);
    }

    /**
     * Store a newly created user in storage
     */
    public function insert(Request $request) {

        $request->validate([
            'name' => 'required|string|max:255',
            'email' => ['required', 'email', 'max:255', Rule::unique('users', 'email')],
            'phone' => 'nullable|string|max:20',
            'password' => 'required|string|min:8|confirmed',
            'login_mode' => 'required|in:guest,pro',
            'package_id' => 'nullable|exists:package_pricings,id',
            'status' => 'required|in:0,1'
        ]);

        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->password = Hash::make($request->password);
        $user->login_mode = $request->login_mode;
        $user->status = $request->status;
        $user->is_verified = 1; // Admin created users are verified by default
        $user->device_id = 'admin_created_' . time(); // Generate unique device_id for admin created users
        $user->expires_at = now()->addYears(10); // Set expiry to 10 years for admin created users
        $user->save();

        // Assign package if selected and user is pro
        if ($request->package_id && $request->login_mode === 'pro') {
            $pricing = PackagePricing::findOrFail($request->package_id);
            
            $packageDuration = $pricing->package_duration;
            $purchaseTime = now();
            $expireTime = $purchaseTime->copy()->addDays($packageDuration);

            UserPackage::create([
                'user_id' => $user->id,
                'package_id' => $request->package_id,
                'package_duration' => $packageDuration,
                'purchased_at' => $purchaseTime,
                'expires_at' => $expireTime,
            ]);
        }

        return redirect('admin/users')->with("success", "User successfully created");
    }

    /**
     * Show the form for editing the specified user
     */
    public function edit($id) {
        $data['user'] = User::with('userPackageDetails')->find($id);

        if(!empty($data['user'])) {
            $data['headerTitle'] = 'Edit User';
            $data['pricings'] = PackagePricing::where('status', 0)->get();

            return view('backend.admin.users.edit', $data);
        } else {
            abort(404);
        }
    }

    /**
     * Update user basic information
     */
    public function updateUserInfo(Request $request) {

        $user = User::find($request->user_id);
        
        if (!$user) {
            return back()->with('error', 'User not found.');
        }

        $request->validate([
            'name' => 'required|string|max:255',
            'email' => [
                'required', 
                'email', 
                'max:255', 
                Rule::unique('users', 'email')->ignore($user->id)
            ],
            'phone' => 'nullable|string|max:20',
            'password' => 'nullable|string|min:8|confirmed',
            'login_mode' => 'required|in:guest,pro',
            'status' => 'required|in:0,1'
        ]);

        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->login_mode = $request->login_mode;
        $user->status = $request->status;
        
        if ($request->password) {
            $user->password = Hash::make($request->password);
        }
        
        $user->save();

        return redirect('admin/users')->with("success", "User information successfully updated");
    }

    /**
     * Get user by ID for AJAX requests
     */
    public function getUserById($id) {
        if (is_null($this->user) || !$this->user->can('user.edit')) {
            abort(403, 'Access Denied: You do not have permission to view user details.');
        }

        $user = User::with(['userPackageDetails'])->findOrFail($id);

        return response()->json(['user' => $user]);
    }

    /**
     * Update user package
     */
    public function update(Request $request)
    {

        $request->validate([
            'user_id' => 'required|exists:users,id',
            'package_id' => 'nullable|exists:package_pricings,id', 
        ]);

        $user = User::findOrFail($request->user_id);

        if ($request->package_id) {
            $pricing = PackagePricing::findOrFail($request->package_id);

            $packageDuration = $pricing->package_duration;
            $purchaseTime = now();
            $expireTime = $purchaseTime->copy()->addDays($packageDuration); 

            $userPackage = UserPackage::updateOrCreate(
                ['user_id' => $user->id],
                [
                    'package_id' => $request->package_id,
                    'package_duration' => $packageDuration,
                    'purchased_at' => $purchaseTime,
                    'expires_at' => $expireTime,
                ]
            );

            return response()->json(['success' => 'User package successfully updated']);
        }

        return response()->json(['success' => 'No package selected.'], 400);
    }

    /**
     * Toggle user status (activate/deactivate)
     */
    public function toggleStatus($id) {
        $user = User::find($id);

        if (empty($user)) {
            return response()->json(['error' => 'User not found.'], 404);
        }

        // Toggle status: 0 = active, 1 = inactive
        $user->status = $user->status === 0 ? 1 : 0;
        $user->save();

        $statusText = $user->status === 0 ? 'activated' : 'deactivated';
        
        return response()->json(['success' => "User successfully {$statusText}"]);
    }

    /**
     * Upgrade user to Pro
     */
    public function upgradeToPro($id) {
        $user = User::find($id);

        if (empty($user)) {
            return response()->json(['error' => 'User not found.'], 404);
        }

        if ($user->login_mode === 'pro') {
            return response()->json(['error' => 'User is already a Pro user.'], 400);
        }

        $user->login_mode = 'pro';
        $user->save();
        
        return response()->json(['success' => 'User successfully upgraded to Pro']);
    }

    /**
     * Downgrade user to Guest
     */
    public function downgradeToGuest($id) {
        $user = User::find($id);

        if (empty($user)) {
            return response()->json(['error' => 'User not found.'], 404);
        }

        if ($user->login_mode === 'guest') {
            return response()->json(['error' => 'User is already a Guest user.'], 400);
        }

        $user->login_mode = 'guest';
        $user->save();

        // Remove user package if exists
        UserPackage::where('user_id', $user->id)->delete();
        
        return response()->json(['success' => 'User successfully downgraded to Guest']);
    }

    /**
     * Delete the specified user
     */
    public function delete($id) {
        $user = User::find($id);

        if (empty($user)) {
            abort(404);  
        }

        if ($user->profile_image && file_exists(public_path($user->profile_image))) {
            unlink(public_path($user->profile_image));
        }

        $user->tokens()->delete(); 
        $user->delete();

        return response()->json(['success' => 'User successfully deleted']);
    }
}
