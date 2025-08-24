@extends('backend.layouts.app')
@section('content')
<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6 pb-2 pb-sm-0">
          <h1 class="textWhite">Edit User</h1>
        </div>
        <div class="col-sm-6">
          <div class="float-sm-right">
            <a href="{{ url('admin/users') }}" class="btn btn-secondary">
              <i class="fas fa-arrow-left"></i> Back to Users
            </a>
          </div>
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
            <div class="card-header">
              <h3 class="card-title">Edit User Information</h3>
            </div>
            <form action="{{ url('admin/users/update-info') }}" method="POST">
              @csrf
              <input type="hidden" name="user_id" value="{{ $user->id }}">
              
              <div class="card-body">
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="name">Name <span class="text-danger">*</span></label>
                      <input type="text" class="form-control" id="name" name="name" value="{{ $user->name }}" required>
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="email">Email</label>
                      <input type="email" class="form-control" id="email" name="email" value="{{ $user->email }}">
                    </div>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="phone">Phone Number</label>
                      <input type="text" class="form-control" id="phone" name="phone" value="{{ $user->phone }}">
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="login_mode">Login Mode <span class="text-danger">*</span></label>
                      <select class="form-control" id="login_mode" name="login_mode" required>
                        <option value="guest" {{ $user->login_mode === 'guest' ? 'selected' : '' }}>Guest</option>
                        <option value="pro" {{ $user->login_mode === 'pro' ? 'selected' : '' }}>Pro</option>
                      </select>
                    </div>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="status">Status <span class="text-danger">*</span></label>
                      <select class="form-control" id="status" name="status" required>
                        <option value="1" {{ $user->status == 1 ? 'selected' : '' }}>Active</option>
                        <option value="0" {{ $user->status == 0 ? 'selected' : '' }}>Inactive</option>
                      </select>
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="password">New Password (Leave empty to keep current)</label>
                      <input type="password" class="form-control" id="password" name="password" placeholder="Enter new password">
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="card-footer">
                <button type="submit" class="btn btn-primary">
                  <i class="fas fa-save"></i> Update User
                </button>
                <a href="{{ url('admin/users') }}" class="btn btn-secondary">
                  <i class="fas fa-times"></i> Cancel
                </a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
@endsection

@push('scripts')
<script>
  $(document).ready(function() {
    // Handle form submission
    $('form').on('submit', function(e) {
      e.preventDefault();
      const form = $(this);
      const formData = new FormData(this);

      $.ajax({
        url: form.attr('action'),
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
          successToast(response.message || 'User updated successfully');
          window.location.href = '{{ url("admin/users") }}';
        },
        error: function(xhr) {
          if (xhr.responseJSON && xhr.responseJSON.errors) {
            const errors = xhr.responseJSON.errors;
            for (const key in errors) {
              errorToast(errors[key][0]);
            }
          } else {
            errorToast('Failed to update user.');
          }
        }
      });
    });
  });
</script>
@endpush