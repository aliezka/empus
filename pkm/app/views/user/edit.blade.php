<section id="content" class="main-content snap-content">

	<div class="row login">
		<div class="small-12 medium-4 medium-centered columns wide-panel">
			<div class="panel-heading hide-for-small-only">
				<h5>Ubah Profile</h5>
			</div>
			<div class="row">
				{{ Form::open(array('role' => 'form', 'class' => 'form-signin', 'data-abide', 'enctype'=>'multipart/form-data')) }}
					<div class="small-12 columns">
						<div class="nama-field {{ $errors->first('name') ? 'error' : null }}">
							{{ Form::text('name', $User->person->name, array('placeholder' => 'Nama Lengkap', 'autofocus', 'required')) }}
							<small class="error">{{ $errors->first('name') ? $errors->first('name') : 'Nama harus diisi' }}</small>
						</div>
						<div class="email-field {{ $errors->first('username') ? 'error' : null }}">
							{{ Form::email('username', $User->email, array('class' => 'form-control', 'placeholder' => 'Email address', 'required')) }}
							<small class="error">{{ $errors->first('username') ? $errors->first('username') : 'Email tidak valid' }}</small>
						</div>
						<div class="small-12 columns {{ $errors->first('image') ? 'error' : null }}">
							{{ Form::file('image') }}
							@if (!is_null($User->person->img))
								@if ($errors->first('image')) 
									<small class="error">{{ $errors->first('image') }}</small>
								@else
									<div class="">Upload gambar baru untuk mengubah gambar.</div>
									<div class="th">
										<img src="{{checkImage(!is_null($User->person->img)? $User->person->img->img : null,'person')}}" width="65">
									</div>
								@endif
							@else 
								<small class="error">File harus diisi</small>
							@endif
						</div>
						<div class="text-field">
							<p>Masukan password lama dan password baru untuk mengganti password.</p>
						</div>
						<div class="password-field {{ $errors->first('old-password') ? 'error' : null }}">
							{{ Form::password('old-password', array('class' => 'form-control', 'placeholder' => 'Password lama', 'id' => 'password')) }}
							<small class="error">{{ $errors->first('old-password') }}</small>
						</div>
						<div class="password-field {{ $errors->first('new-password') ? 'error' : null }}">
							{{ Form::password('new-password', array('class' => 'form-control', 'placeholder' => 'Password Baru', 'id' => 'new-password')) }}
							<small class="error">{{ $errors->first('new-password') }}</small>
						</div>

						@if (Auth::user())
							@if (Auth::user()->role->contains(1))
								<fieldset>
									<legend>Role</legend>
									<ul>
										<?php $Roles = Config::get('empus.roles', array()); ?>
										@foreach ($Roles as $Index => $Role)
											<li>
												{{ Form::checkbox('roles[]', $Index, $User->role->contains($Index), array('id' => 'checkbox1')) }} {{ Form::label('checkbox1', $Role) }}
											</li>
										@endforeach
									</ul>
								</fieldset>
							@endif
						@endif
					</div>
					<div class="small-12 medium-12 columns text-center">
						<input type="submit" value="Save" class="button expand">
					</div>
				{{ Form::close() }}
			</div>
		</div>
	</div>
</section>