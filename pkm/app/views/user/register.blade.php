<section id="content" class="main-content snap-content">

	<div class="row login">
		<div class="small-12 medium-4 medium-centered columns">
			<div class="panel">
				<div class="panel-heading hide-for-small-only">
					<h5>Register</h5>
				</div>
				<div class="panel-body">
					<div class="row">
						{{ Form::open(array('role' => 'form', 'class' => 'form-signin', 'data-abide')) }}
							<div class="small-12 columns">
								<div class="nama-field">
									{{ Form::text('name', null, array('placeholder' => 'Nama Lengkap', 'required')) }}
									<small class="error">Nama harus diisi</small>
								</div>
								<div class="email-field">
									{{ Form::email('username', null, array('class' => 'form-control', 'placeholder' => 'Email address', 'autofocus', 'required')) }}
									<small class="error">Email tidak valid</small>
								</div>
								<div class="password-field">
									{{ Form::password('password', array('class' => 'form-control', 'placeholder' => 'Password', 'required', 'id' => 'password')) }}
									<small class="error">Password harus diisi</small>
								</div>
								<div class="password_conf-field">
									{{ Form::password('password_confirmation', array('class' => 'form-control', 'placeholder' => 'Password Confirmation', 'required', 'data-equalto' => 'password')) }}
									<small class="error">Tidak sesuai dengan password</small>
								</div>
							</div>
							<div class="small-12 medium-12 columns text-center">
								<input type="submit" value="Login" class="button expand">
								
								<a href="" class="tiny secondary reg">Lupa Password</a> <span class="divider">|</span>
								<a href="{{ URL::to('register') }}" class="tiny secondary reg">Register</a>
							</div>
						{{ Form::close() }}
					</div>
					
					@if (Session::has('message'))
					<div class="row">
						<small class="error">{{ Session::get('message') }}</small>
					</div>
					@endif
				</div>
			</div>
		</div>
	</div>
</section>