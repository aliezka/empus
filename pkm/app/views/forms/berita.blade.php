<script src="{{ asset('assets/js/vendor/select2/select2.js') }}"></script>
<link rel="stylesheet" href="{{ asset('assets/js/vendor/select2/select2.css') }}">

<script type="text/javascript">
	$(document).ready(function(){
		$("#instansi").select2({
			// multiple:true
		});

		$("#pelayanan").select2({
			// multiple:true
		});
	});
</script>

<section id="content" class="main-content snap-content frm-ins">
	<div class="row">
		<div class="small-12 medium-12 columns grid-control">
			<ul class="breadcrumbs">
				<li><a href="#">Admin</a></li>
				<li><a href="#">Berita</a></li>
				<li class="current"><a href="#">create</a></li>
			</ul>
		</div>
	</div>

	{{ Form::open(array('files'=> true, 'data-abide')) }}
		<div class="row">
			<div class="small-12 columns">

				<div class="row">
					<div class="small-3 columns">
						<label for="name" class="right inline">Instansi</label>
					</div>
					<div class="small-9 columns">
						<?php $List = $Instansi->lists('name', 'id'); ?>
						{{ Form::select('instansi[]', $List, null, array('multiple' => 'multiple', 'id' => 'instansi', 'placeholder' => 'nama', 'style' => 'height:auto;width:100%')) }}
					</div>
				</div><!-- end of row -->

				<div class="row">
					<div class="small-3 columns">
						<label for="name" class="right inline">Pelayanan</label>
					</div>
					<div class="small-9 columns">
						<?php $List = $Pelayanan->lists('name', 'id'); ?>
						{{ Form::select('pelayanan[]', $List, null, array('multiple' => 'multiple', 'id' => 'pelayanan', 'placeholder' => 'Pelayanan', 'style' => 'height:auto;width:100%')) }}
					</div>
				</div><!-- end of row -->

				<div class="row">
					<div class="small-3 columns">
						<label for="title" class="right inline">Judul</label>
					</div>
					<div class="small-9 columns {{ $errors->first('title') ? 'error' : null }}">
						<div class="name-field">
							{{ Form::text('title', null, array('placeholder' => 'Judul', 'required')) }}
							<small class="error">{{ $errors->first('title') ? $errors->first('title') : 'Judul harus diisi' }}</small>
						</div>
					</div>
				</div><!-- end of row -->

				<div class="row">
					<div class="small-3 columns">
						<label for="desc" class="right inline">Isi</label>
					</div>
					<div class="small-9 columns {{ $errors->first('desc') ? 'error' : null }}">
						<div class="description-field">
							{{ Form::textarea('desc', null, ['rows' => '5', 'placeholder' => 'Deskripsi', 'required']) }}
							<small class="error">{{ $errors->first('desc') ? $errors->first('desc') : 'Isi berita harus diisi' }}</small>
						</div>
					</div>
				</div><!-- end of row -->

				<div class="row">
					<div class="small-3 columns">
						<label for="image" class="right">Image</label>
					</div>
					<div class="small-9 columns">
						{{ Form::file('image') }}
					</div>
				</div><!-- end of row -->

				<div class="row">
					<div class="small-3 columns">
					</div>
					<div class="small-9 columns">
						{{ Form::submit('Save', [ 'class' => 'button primary small' ]) }}
						<a href="" class="button secondary small">Cancel</a>
					</div>
				</div><!-- end of row -->

				<div class="row">
				</div>
			</div>
		</div>
	{{ Form::close() }}
</section>