<section id="content" class="main-content snap-content frm-ins">
	<div class="row">
		<div class="small-12 medium-12 columns grid-control">
			<ul class="breadcrumbs">
				<li><a href="{{ URL::to('dashboard') }}">Admin</a></li>
				<li><a href="#">Instansi</a></li>
				<li class="current"><a href="#">create</a></li>
			</ul>
		</div>
	</div>

	{{ Form::open(array('files'=> true, 'data-abide')) }}
	<div class="row">
		<div class="small-12 columns">
			<div class="row">
				<div class="small-3 columns">
					<label for="name" class="right inline">Urutan</label>
				</div>
				<div class="small-9 columns {{ $errors->first('order') ? 'error' : null }} ">
					{{ Form::text('order', null, array('placeholder' => 'Urutan', 'required', 'autofocus')) }}
					<small class="error">{{ $errors->first('order') ? $errors->first('order') : 'Nomor Urutan harus diisi' }}</small>
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
					<label for="name" class="right inline">Hal</label>
				</div>
				<div class="small-9 columns {{ $errors->first('title') ? 'error' : null }} ">
					{{ Form::text('title', null, array('placeholder' => 'Perihal Persyaratan', 'required')) }}
					<small class="error">{{ $errors->first('title') ? $errors->first('title') : 'Hal harus diisi' }}</small>
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
					<label for="name" class="right inline">Deskripsi</label>
				</div>
				<div class="small-9 columns {{ $errors->first('desc') ? 'error' : null }} ">
					{{ Form::textarea('desc', null, ['rows' => '5', 'placeholder' => 'Deskripsi Perihal']) }}
					<small class="error">{{ $errors->first('desc') ? $errors->first('desc') : null }}</small>
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
					<label for="image" class="right">Image</label>
				</div>
				<div class="small-9 columns">
					{{ Form::file('image') }}
					<small class="error">{{ $errors->first('image') ? $errors->first('image') : null }}</small>
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
				</div>
				<div class="small-9 columns">
					{{ Form::submit('Save', [ 'class' => 'button primary small' ]) }}
					<a href="{{ URL::to('dashboard') }}" class="button secondary small">Cancel</a>
				</div>
			</div><!-- end of row -->

			<div class="row">
			</div>
		</div>
	</div>
	{{ Form::close() }}
</section>