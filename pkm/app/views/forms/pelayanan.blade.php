<section id="content" class="main-content snap-content frm-ins">
	<div class="row">
		<div class="small-12 medium-12 columns grid-control">
			<ul class="breadcrumbs">
				<li><a href="{{ URL::to('dashboard') }}">Admin</a></li>
				<li><a href="{{ URL::to('dashboard/pelayanan') }}">Pelayanan</a></li>
				<li class="current"><a href="#">create</a></li>
			</ul>
		</div>
	</div>

	{{ Form::open(['data-abide']) }}
	<div class="row">
		<div class="small-12 columns">
			<div class="row">
				<div class="small-3 columns">
					<label for="name" class="right inline">Nama</label>
				</div>
				<div class="small-9 columns {{ $errors->first('name') ? 'error' : null }}">
					{{ Form::text('name', isset($Pelayanan->name) ? $Pelayanan->name : null, array('placeholder' => 'Nama Pelayanan', 'required', 'autofocus')) }}
					<small class="error">{{ $errors->first('name') ? $errors->first('name') : 'Nama pelayanan harus diisi' }}</small>
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
					<label for="name" class="right inline">Deskripsi</label>
				</div>
				<div class="small-9 columns {{ $errors->first('desc') ? 'error' : null }}">
					{{ Form::textarea('desc', isset($Pelayanan->desc->desc) ? $Pelayanan->desc->desc : null, ['rows' => '5', 'placeholder' => 'Deskripsi Pelayanan', 'required']) }}
					<small class="error">{{ $errors->first('desc') ? $errors->first('desc') : 'Deskripsi pelayanan harus diisi' }}</small>
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

	@if(!is_null($Pelayanan))
	<div class="row">
		<div class="small-3 columns">
		</div>
		<div class="small-9 columns">
			<fieldset>
				<legend>Persyaratan</legend>
				<ol>

					@foreach ($Persyaratan as $PersyaratanL)
						<li>
							<a href="{{ URL::to('dashboard/pelayanan/'.$Pelayanan->id.'/persyaratan/'.$PersyaratanL->id) }}">{{ $PersyaratanL->title }}</a>
						</li>
					@endforeach
				</ol>
				<a href="{{ URL::to('dashboard/pelayanan/'.$Pelayanan->id.'/persyaratan/form') }}" class="button secondary tiny">Tambah</a>
			</fieldset>
			<fieldset>
				<legend>Prosedur</legend>
				<ol>
					@foreach ($Prosedur as $ProsedurL)
						<li>
							<a href="{{ URL::to('dashboard/pelayanan/'.$Pelayanan->id.'/prosedur/'.$ProsedurL->id) }}">{{ $ProsedurL->title }}</a>
						</li>
					@endforeach
				</ol>
				<a href="{{ URL::to('dashboard/pelayanan/'.$Pelayanan->id.'/prosedur/form') }}" class="button secondary tiny">Tambah</a>
			</fieldset>
		</div>
	</div><!-- end of row -->
	@endif
</section>