@extends('backend.layouts.app')
@section('content')
  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="textWhite">Add New User</h1>
          </div>
        </div>
      </div>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <form action="{{ route('admin.users.insert') }}" method="post">
                @csrf
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Name *</label>
                        <input type="text" class="form-control" name="name" value="{{ old('name') }}" placeholder="Full Name" required>
                        <span class="text-danger">{{ $errors->has('name') ? $errors->first('name') : "" }}</span>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Email *</label>
                        <input type="email" class="form-control" name="email" value="{{ old('email') }}" placeholder="Email Address" required>
                        <span class="text-danger">{{ $errors->has('email') ? $errors->first('email') : "" }}</span>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Phone</label>
                        <input type="text" class="form-control" name="phone" value="{{ old('phone') }}" placeholder="Phone Number">
                        <span class="text-danger">{{ $errors->has('phone') ? $errors->first('phone') : "" }}</span>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Login Mode *</label>
                        <select class="form-control" name="login_mode" id="login_mode" required>
                          <option value="">Select Login Mode</option>
                          <option value="guest" {{ old('login_mode') == 'guest' ? 'selected' : '' }}>Guest</option>
                          <option value="pro" {{ old('login_mode') == 'pro' ? 'selected' : '' }}>Pro</option>
                        </select>
                        <span class="text-danger">{{ $errors->has('login_mode') ? $errors->first('login_mode') : "" }}</span>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Password *</label>
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                        <span class="text-danger">{{ $errors->has('password') ? $errors->first('password') : "" }}</span>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Confirm Password *</label>
                        <input type="password" class="form-control" name="password_confirmation" placeholder="Confirm Password" required>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6" id="package_section" style="display: none;">
                      <div class="form-group">
                        <label>Package (for Pro users)</label>
                        <select class="form-control" name="package_id">
                          <option value="">Select Package</option>
                          @foreach($pricings as $pricing)
                            <option value="{{ $pricing->id }}" {{ old('package_id') == $pricing->id ? 'selected' : '' }}>
                              {{ $pricing->package_name }} - {{ $pricing->package_duration }} days
                            </option>
                          @endforeach
                        </select>
                        <span class="text-danger">{{ $errors->has('package_id') ? $errors->first('package_id') : "" }}</span>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Status *</label>
                        <select class="form-control" name="status" required>
                          <option value="0" {{ old('status') == '0' ? 'selected' : '' }}>Active</option>
                          <option value="1" {{ old('status') == '1' ? 'selected' : '' }}>Inactive</option>
                        </select>
                        <span class="text-danger">{{ $errors->has('status') ? $errors->first('status') : "" }}</span>
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Create User</button>
                  <a href="{{ route('admin.users.index') }}" class="btn btn-secondary ml-2">Cancel</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <script>
    // Show/hide package section based on login mode
    document.getElementById('login_mode').addEventListener('change', function() {
      const packageSection = document.getElementById('package_section');
      if (this.value === 'pro') {
        packageSection.style.display = 'block';
      } else {
        packageSection.style.display = 'none';
      }
    });

    // Check on page load
    document.addEventListener('DOMContentLoaded', function() {
      const loginMode = document.getElementById('login_mode').value;
      const packageSection = document.getElementById('package_section');
      if (loginMode === 'pro') {
        packageSection.style.display = 'block';
      }
    });
  </script>
@endsection