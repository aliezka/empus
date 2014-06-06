<section id="content" class="main-content snap-content">
	<div class="row login">
		<div class="small-12 medium-4 medium-centered columns wide-panel">
				<div class="panel-heading hide-for-small-only">
					<h5>Login</h5>
				</div>
				<div class="row">
					{{ Form::open(array('role' => 'form', 'class' => 'form-signin', 'data-abide')) }}
						<div class="small-12 columns">
							<div class="email-field">
								{{ Form::email('username', null, array('class' => 'form-control', 'placeholder' => 'Email address', 'autofocus', 'required')) }}
								<small class="error">Email tidak valid</small>
							</div>
							<div class="password-field">
								{{ Form::password('password', array('class' => 'form-control', 'placeholder' => 'Password', 'required')) }}
								<small class="error">Password harus diisi</small>
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
</section>

