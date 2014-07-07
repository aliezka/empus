<section id="content" class="main-content snap-content instansi">
	<div class="row">
		<div class="banner" style="background-image: url({{ asset('assets/img/instansi/'.$Instansi->img->img) }})">
		</div>
	</div>
	<div class="row">
		<div class="small-12 columns wide-panel">
			<h6>{{ $Instansi->name }}</h6>
			<p>{{ nl2br($Instansi->desc->desc) }}</p>
			<div class="panel info"> 
				<div class="panel-body">
					<ul>
						@if (!is_null($InstansiProfileAlamat))
						<li>
							<i class="fa fa-map-marker"></i><span>{{ nl2br($InstansiProfileAlamat) }}</span>
						</li>
						@endif

						@if (!is_null($InstansiProfileTelepon))
						<li>
							<i class="fa fa-phone"></i><span>{{ $InstansiProfileTelepon }}</span>
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
				<!-- end of panel body -->
			</div>
			<!-- end of panel -->

			<div class="panel panel-opini">
				<div class="panel-heading">
					<h6><i class="fa fa-comment-o"></i>Opini Publik</h6>
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