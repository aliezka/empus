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

	{{ Form::open(array('files'=> true)) }}
	<div class="row">
		<div class="small-12 columns">
			<div class="row">
				<div class="small-3 columns">
					<label for="name" class="right inline">Urutan</label>
				</div>
				<div class="small-9 columns">
					{{ Form::text('order', null, array('placeholder' => 'Urutan', 'required', 'autofocus')) }}
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
					<label for="name" class="right inline">Hal</label>
				</div>
				<div class="small-9 columns">
					{{ Form::text('title', null, array('placeholder' => 'Perihal Prosedur', 'required')) }}
				</div>
			</div><!-- end of row -->

			<div class="row">
				<div class="small-3 columns">
					<label for="name" class="right inline">Deskripsi</label>
				</div>
				<div class="small-9 columns">
					{{ Form::textarea('desc', null, ['rows' => '5', 'placeholder' => 'Deskripsi Prosedur', 'id' => 'name']) }}
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