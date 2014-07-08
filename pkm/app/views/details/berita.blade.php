<section id="content" class="main-content snap-content berita-detail">
	<div class="row">
		@if (isset($Berita->img->img))
			<div class="banner" style="background-image: url({{ asset('assets/img/berita/'.$Berita->img->img) }})"></div>
		@endif
	</div>
	<div class="row">
		<div class="small-12 columns">
			<h6>{{ $Berita->title }}</h6>
			<p>{{ isset($Berita->desc->desc) ? nl2br($Berita->desc->desc) : null }}</p>
		</div>
	</div>
	<div class="row">
		<div class="small-12 columns wide-panel">

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
<!-- end of content section --> 