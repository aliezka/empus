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

	{{ Form::open(array('files'=> true)) }}
	<div class="row">
		<div class="small-12 columns">
			<div class="row">
				<div class="small-3 columns">
					<label for="name" class="right inline">Nama</label>
				</div>
				<div class="small-9 columns">
					{{ Form::text('name', null, array('placeholder' => 'Nama Intansi', 'required', 'autofocus')) }}
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
					<label for="name" class="right inline">Deskripsi</label>
				</div>
				<div class="small-9 columns">
					{{ Form::textarea('desc', null, ['rows' => '5', 'placeholder' => 'Deskripsi Instansi', 'id' => 'name']) }}
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
					<label for="image" class="right">Image</label>
				</div>
				<div class="small-9 columns">
					{{ Form::file('image', [ 'id' => 'image' ]) }}
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
				</div>
				<div class="small-9 columns">
					<fieldset>
						<legend>Pelayanan</legend>
						<ul>
							<li>
								{{ Form::checkbox('pelayanan[]', 0, 0, array('id' => 'checkbox1')) }}{{ Form::label('checkbox1', 'Kartu Tanda Penduduk') }}
							</li>
							<li>
								{{ Form::checkbox('pelayanan[]', 0, 0, array('id' => 'checkbox2')) }}{{ Form::label('checkbox2', 'Kartu Keluarga') }}
							</li>
							<li>
								{{ Form::checkbox('pelayanan[]', 0, 0, array('id' => 'checkbox3')) }}{{ Form::label('checkbox3', 'Akta Lahir') }}
							</li>
							<li>
								{{ Form::checkbox('pelayanan[]', 0, 0, array('id' => 'checkbox4')) }}{{ Form::label('checkbox4', 'Akta Kematian') }}
							</li>
							<li>
								{{ Form::checkbox('pelayanan[]', 0, 0, array('id' => 'checkbox5')) }}{{ Form::label('checkbox5', 'Surat Perceraian') }}
							</li>
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