<section id="content" class="main-content snap-content instansi">
	<div class="row">
		<div class="small-12 medium-12 columns">
		@if(get_class($Object) == 'InstansiPelayanan')
			<h6>{{ $Object->pelayanan->name }}</h6>
			<p>{{ nl2br($Object->pelayanan->desc->desc) }}</p>
		@else
			<h6>{{ $Object->name }}</h6>
			<p>{{ nl2br($Object->desc->desc) }}</p>
		@endif
		</div>
	</div>
	<div class="row">
		<div class="small-12 columns wide-panel">
			<div class="panel panel-opini">
				<div class="panel-heading">
					<span class="header"><i class="fa fa-comment-o"></i>Masukkan Opini Anda</span>
				</div>
				<div class="panel-body">
					{{ Form::open(array('files'=> true, 'data-abide')) }}
						<div class="small-12 columns {{ $errors->first('type') ? 'error' : null }}">
							<?php $List = array('' => 'Pilih Jenis Opini') + Config::get('empus.opini_type', array()); ?>
							{{ Form::select('type', $List, null, array('placeholder' => 'Tipe', 'required', 'autofocus' => 'autofocus')) }}
							<small class="error">{{ $errors->first('type') ? $errors->first('type') : 'Tipe opini harus diisi' }}</small>
						</div>

						<div class="small-12 columns {{ $errors->first('desc') ? 'error' : null }}">
							<div class="description-field">
								{{ Form::text('title', null, array('placeholder' => 'Judul', 'required')) }}
								<small class="error">{{ $errors->first('title') ? $errors->first('title') : 'Judul harus diisi' }}</small>
							</div>
						</div>

						<div class="small-12 columns {{ $errors->first('desc') ? 'error' : null }}">
							<div class="description-field">
								{{ Form::textarea('desc', null, ['rows' => '5', 'placeholder' => 'Deskripsi', 'required']) }}
								<small class="error">{{ $errors->first('desc') ? $errors->first('desc') : 'Isi berita harus diisi' }}</small>
							</div>
						</div>
						
						<div class="small-12 columns {{ $errors->first('image') ? 'error' : null }}">
							<div class="description-field">
								{{ Form::file('image') }}
								<small class="error">{{ $errors->first('image') ? $errors->first('image') : 'Isi berita harus diisi' }}</small>
							</div>
						</div>
						<br>
						{{ Form::submit('Save', [ 'class' => 'button expand small' ]) }}
					{{ Form::close() }}
				</div>
			</div>
		</div>
		<!-- end of col -->
	</div>
	<!-- end of row -->
</section>
<!-- end of content section -->