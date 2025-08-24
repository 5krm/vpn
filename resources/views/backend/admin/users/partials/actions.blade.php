<td>
  <div style="display: flex; gap: 2px; flex-wrap: wrap;">
    <!-- Edit User Info Button -->
    <a href="{{ url('admin/users/' . $user->id . '/edit') }}" class="btn btn-sm btn-info" title="Edit User Info">
      <i class="fas fa-edit"></i>
    </a>
    
    <!-- Edit Package Button -->
    <button
      type="button"
      class="btn btn-sm btn-primary edit-user-btn"
      data-id="{{ $user->id }}"
      data-toggle="modal"
      data-target="#modal-edit-user"
      title="Edit Package"
      {{ is_null($user->userPackageDetails) ? 'disabled' : '' }}
    >
      <i class="fas fa-box"></i>
    </button>
    
    <!-- Toggle Status Button -->
    <button 
      type="button" 
      class="btn btn-sm {{ $user->status === 0 ? 'btn-warning' : 'btn-success' }} toggle-status-btn" 
      data-id="{{ $user->id }}"
      title="{{ $user->status === 0 ? 'Deactivate' : 'Activate' }} User"
    >
      <i class="fas {{ $user->status === 0 ? 'fa-ban' : 'fa-check' }}"></i>
    </button>
    
    <!-- Pro/Guest Toggle Buttons -->
    @if($user->login_mode === 'guest')
      <button 
        type="button" 
        class="btn btn-sm btn-success upgrade-pro-btn" 
        data-id="{{ $user->id }}"
        title="Upgrade to Pro"
      >
        <i class="fas fa-arrow-up"></i> Pro
      </button>
    @else
      <button 
        type="button" 
        class="btn btn-sm btn-secondary downgrade-guest-btn" 
        data-id="{{ $user->id }}"
        title="Downgrade to Guest"
      >
        <i class="fas fa-arrow-down"></i> Guest
      </button>
    @endif
    
    <!-- Delete Button -->
    <button 
      type="button" 
      class="btn btn-sm btn-danger delete-user-btn" 
      data-id="{{ $user->id }}"
      title="Delete User"
    >
      <i class="fas fa-trash"></i>
    </button>
  </div>
</td>

