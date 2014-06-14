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

	<div class="row">
		<div class="small-12">
			<div class="row">
				<div class="small-3 columns">
				</div>
				<div class="small-9 columns">
					<!-- <h2>Instansi</h2> -->
				</div>
			</div>
			<!-- end of row -->
		</div>
	</div>
	{{ Form::open(array('data-abide')) }}
		<div class="row">
			<div class="small-12 columns">
				<div class="row">
					<div class="small-3 columns">
						<label for="name" class="right inline">Isi</label>
					</div>
					<div class="small-9 columns">
						<div class="description-field">
							{{ Form::textarea('desc', null, ['rows' => '5', 'placeholder' => 'Deskripsi Opini', 'required']) }}
							<small class="error">Isi harus diisi</small>
						</div>
					</div>
				</div><!-- end of row -->

				<div class="row">
					<div class="small-3 columns">
					</div>
					<div class="small-9 columns">
						{{ Form::submit('Save', ['id' => 'submit', 'class' => 'button primary small']) }}
						<a href="{{ URL::to('public/opini') }}" class="button secondary small">Cancel</a>
					</div>
				</div><!-- end of row -->
			</div>
		</div>
	{{ Form::close() }}
</section>