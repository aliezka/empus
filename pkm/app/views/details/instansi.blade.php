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
			<!--<div class="panel">
				<div class="panel-heading">
					<h6><i class="fa fa-smile-o"></i>Pelayanan</h6>
				</div>
				<div class="panel-body">
					<ul>
						@foreach ($Instansi->pelayanan as $Pelayanan)
							<li>
								<a href="#">
									<div class="row">
										<span>{{ $Pelayanan->name }}</span>
									</div>
								</a>
							</li>
						@endforeach
					</ul>
				</div>
			</div>!-->
			
			<div class="panel">
				<div class="panel-heading">
					<h6><i class="fa fa-smile-o"></i>Pelayanan</h6>
				</div>
				<div class="panel-body">
					<dl class="accordion" data-accordion>
						@foreach ($InstansiPelayanan as $List)
						<dd class="accordion-navigation">
							<a href="#panel2">{{ $List->pelayanan->name }}</a>
							<div id="panel2" class="content">
								{{ nl2br($List->pelayanan->desc->desc) }}
								<br>
								<br>
								<a href="{{ URL::to('pelayanan/'.$Pelayanan->id) }}" class="add button tiny">Detail</a>
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
						<li>
							<a href="#">
								<div class="row">
									<div class="small-3 columns">
										<img src="img/profile-picture.jpg" width="50">
									</div>
									<div class="small-9 columns">
										<h6>Petugas kelurahan ramah</h6>
										<span class="radius label">Opini</span>
										<span class="secondary radius label"><small class="fa fa-comment"></small>4</span>
										<small>24 Mei 2014</small>
										<p>Petugas kelurahan ramah dan santun. Mereka dengan senang hati membantu keperluan kami.</p>
									</div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="row">
									<div class="small-3 columns">
										<img src="img/profile-picture.jpg" width="50">
									</div>
									<div class="small-9 columns">
										<h6>Petugas kelurahan ramah</h6>
										<span class="radius alert label">Pengaduan</span>
										<span class="secondary radius label"><small class="fa fa-comment"></small>4</span>
										<small>24 Mei 2014</small>
										<p>Petugas kelurahan ramah dan santun. Mereka dengan senang hati membantu keperluan kami.</p>
									</div>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- end of col -->
	</div>
	<!-- end of row -->
</section>