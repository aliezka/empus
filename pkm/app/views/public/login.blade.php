<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/signin.css') }}">

<div class="container">
	{{ Form::open(array('role' => 'form', 'class' => 'form-signin')) }}
		<h2 class="form-signin-heading">So, you are?</h2>
		
		{{ Form::email('username', Input::get('username'), array('class' => 'form-control', 'placeholder' => 'Email address', 'autofocus')) }}
		<p>
			{{ $errors->first('username') }}
		</p>
		{{ Form::password('password', array('class' => 'form-control', 'placeholder' => 'Password')) }}
		<p>
			{{ $errors->first('password') }}
		</p>

		<div class="row-fluid">
			<div class="span12">
				{{ Form::label('name', 'Name') }}
			</div>
		</div>
		<div class="row-fluid name">
			<div class="span12">
				{{ Form::text('name', null, array('class' => 'form-control', 'placeholder' => 'Full name')) }}
				<p>
					{{ $errors->first('name') }}
				</p>
			</div>
		</div>

		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
	{{ Form::close() }}
</div>