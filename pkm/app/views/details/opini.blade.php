<section id="content" class="main-content snap-content">
	<div class="row">
		<div class="small-12 medium-6 columns wide-panel">
			<div class="panel panel-opini"> 
				<div class="panel-body">
					<div class="row">
						<div class="small-3 columns">
							<img src="img/profile-picture.jpg" alt="" width="65" height="65">
						</div>
						<div class="small-9 columns">
							<div class="info">
							<small class="name">{{ $Opini->person->name }}</small>
								<small class="date">{{ $Opini->created_at }}</small>
							</div>
							<h6>{{ $Opini->title }}</h6>
							<div class="instansi">{{ opiniTag($Opini->id) }}</div>
							<?php $Type = Config::get('empus.opini_type'); ?>
							<span class="radius label {{ $Opini->type == 3 ? 'success' : null }} {{ $Opini->type == 2 ? 'alert' : null }} ">{{ $Type[$Opini->type] }}</span>
						</div>
					</div>
					<div class="row">
						<div class="small-12 columns">
							<p>{{ nl2br($Opini->desc->desc) }}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	

	<div class="row">
		<div class="small-12 medium-6 columns wide-panel komentar">
			<div class="komentar-head">
				<div class="num">{{ $Opini->komentar->count() }} komentar</div>
				{{ Form::open(array('data-abide', 'url' => 'opini/'.$Opini->id.'/komentar')) }}
					<div class="description-field">
						{{ Form::textarea('desc', null, ['rows' => '1', 'placeholder' => 'Deskripsi Opini', 'required']) }}
						<small class="error">Komentar harus diisi</small>
					</div>

					<div class="description-field">
						{{ Form::submit('Save', ['id' => 'submit', 'class' => 'button primary tiny']) }}
					</div>
				{{ Form::close() }}
			</div>
			<ul>
				@foreach ($Opini->komentar->all() as $Komentar)
				<li>
					<div class="row">
						<div class="small-2 columns">
							<img src="img/profile-picture.jpg" alt="" width="65" height="65">
						</div>
						<div class="small-10 columns">
							<div class="info">
								<small class="name">{{ $Komentar->person->name }} </small>
								<small class="date">{{ $Komentar->created_at }}</small>
							</div>
							<p>{{ nl2br($Komentar->desc->desc) }}</p>
						</div>
					</div>
				</li>
				@endforeach
			</ul>
		</div>
	</div>
</section>  