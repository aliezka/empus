<section id="content" class="main-content snap-content instansi">
	<div class="row">
		<div class="banner" style="background-image: url({{ asset('assets/img/instansi/'.$Instansi->img->img) }})">
		</div>
	</div>
	<div class="row">
		<div class="small-12 columns">
			<h6>{{ $Instansi->name }}</h6>
			<p>{{ nl2br($Instansi->desc->desc) }}</p>
			<div class="panel info"> 
				<div class="panel-body kontak">
					<ul>
						@if (!is_null($InstansiProfileAlamat))
						<li>
							<div class="icon"><i class="fa fa-map-marker"></i></div>
							<div>{{ nl2br($InstansiProfileAlamat) }}</div>
						</li>
						@endif

						@if (!is_null($InstansiProfileTelepon))
						<li>
							<div class="icon"><i class="fa fa-phone"></i></div>
							<div>{{ $InstansiProfileTelepon }}</div>
						</li>
						@endif
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="small-12 columns wide-panel">
			
			<div class="panel">
				<div class="panel-heading">
					<h6><i class="fa fa-smile-o"></i>Pelayanan</h6>
				</div>
				<div class="panel-body">
					<dl class="accordion" data-accordion>
						@foreach ($InstansiPelayanan as $List)
						<dd class="accordion-navigation">
							<a href="#panel{{ $List->pelayanan->id }}">{{ $List->pelayanan->name }}</a>
							<div id="panel{{ $List->pelayanan->id }}" class="content">
								{{ nl2br($List->pelayanan->desc->desc) }}
								<br>
								<br>
								<a href="{{ URL::to('pelayanan/'.$List->pelayanan_id) }}" class="add button tiny">Detail</a>
								<a href="{{ URL::to('opini/instansi_pelayanan/'.$List->id.'/form') }}" class="add button tiny">Tambah Opini</a>
							</div>
						</dd>
						@endforeach
					</dl>
				</div>
				<!-- end of panel body -->
			</div>
			<!-- end of panel -->

			<div class="panel panel-opini">
				<div class="panel-heading">
					<span class="header"><i class="fa fa-comment-o"></i>Opini Publik</span>
					<a href="{{ URL::to('opini/instansi/') }}" class="add button tiny">Tambah</a>
				</div>

				<div class="panel-body">
					<ul>
						@foreach ($OpiniTag as $Opini) 
						<li>
							<a href="{{ URL::to('opini/'.$Opini->opini->id) }}">
								<div class="row">
									<div class="small-3 columns">
										<img src="img/profile-picture.jpg" width="50">
									</div>
									<div class="small-9 columns">
										<h6>{{ $Opini->opini->title }}</h6>
										<?php $Type = Config::get('empus.opini_type'); ?>
										<span class="radius label {{ $Opini->opini->type == 3 ? 'success' : null }} {{ $Opini->opini->type == 2 ? 'alert' : null }} ">{{ $Type[$Opini->opini->type] }}</span>
										<span class="secondary radius label"><small class="fa fa-comment"></small>{{ $Opini->opini->komentar->count() }}</span>
										<small>{{ $Opini->opini->created_at }}</small>
										<p>{{ $Opini->opini->desc->desc }}</p>
									</div>
								</div>
							</a>
						</li>
						@endforeach
					</ul>
				</div>
			</div>
		</div>
		<!-- end of col -->
	</div>
	<!-- end of row -->
</section>