<section id="content" class="main-content snap-content frm-ins">
	<div class="row">
		<div class="small-12 medium-12 columns grid-control">
			<ul class="breadcrumbs">
				<li><a href="#">Admin</a></li>
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
					<label for="name" class="right inline">Nama</label>
				</div>
				<div class="small-9 columns {{ $errors->first('name') ? 'error' : null }}">
					<div class="name-field">
						{{ Form::text('name', isset($Instansi->name) ? $Instansi->name : null, array('placeholder' => 'Nama Intansi', 'required', 'autofocus')) }}
						<small class="error">{{ $errors->first('name') ? $errors->first('name') : 'Nama harus diisi' }}</small>
					</div>
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
					<label for="name" class="right inline">Isi</label>
				</div>
				<div class="small-9 columns {{ $errors->first('desc') ? 'error' : null }}">
					<div class="description-field">
						{{ Form::textarea('desc', isset($Instansi->desc->desc) ? $Instansi->desc->desc : null, ['rows' => '5', 'placeholder' => 'Deskripsi Instansi', 'required']) }}
						<small class="error">Isi harus diisi</small>
					</div>
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
					<label for="image" class="right">Image</label>
				</div>
				<div class="small-9 columns {{ $errors->first('image') ? 'error' : null }}">
					{{ Form::file('image', [ isset($Instansi->img->img) ? null : 'required' ]) }}
					@if (isset($Instansi->img->img)) 
						@if ($errors->first('image')) 
							<small class="error">{{ $errors->first('image') }}</small>
						@else
							<label for="image" class="left">Upload gambar baru untuk mengubah gambar.</label>
						@endif
					@else 
						<small class="error">File harus diisi</small>
					@endif
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
				</div>
				<div class="small-9 columns">
					<fieldset>
						<legend>Pelayanan</legend>
						<ul>
							@foreach ($Pelayanan as $List)
								<li>
									{{ Form::checkbox('pelayanan[]', $List->id, is_object($Instansi) ? $Instansi->pelayanan->find($List->id) : null ? 1 : 0, array('id' => 'checkbox1')) }}{{ Form::label('checkbox1', $List->name) }}
								</li>
							@endforeach
						</ul>
					</fieldset>
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