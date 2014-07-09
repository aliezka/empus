<section id="content" class="main-content snap-content instansi">
	<div class="row">
		<div class="small-12 columns">
			<h6>{{ $Pelayanan->name }}</h6>
			<p>{{ nl2br($Pelayanan->desc->desc) }}</p>
		</div>
	</div>
	<div class="row">
		<div class="small-12 columns wide-panel">
			<div class="panel">
				<div class="panel-heading">
					<h6><i class="fa fa-files-o"></i>Persyaratan</h6>
				</div>
				<div class="panel-body">
					<ul>
						@foreach ($Pelayanan->persyaratan as $Persyaratan)
							<li>
								<a href="#">
									<div class="row">
										<span>{{ $Persyaratan->title }}</span>
									</div>
								</a>
							</li>
						@endforeach
					</ul>
				</div>
				<!-- end of panel body -->
			</div>
			<!-- end of panel -->

			<div class="panel">
				<div class="panel-heading">
					<h6><i class="fa fa-check-square-o"></i>Prosedur</h6>
				</div>
				<div class="panel-body">
					<ul>
						@foreach ($Pelayanan->prosedur as $Prosedur)
							<li>
								<a href="#">
									<div class="row">
										<span>{{ $Prosedur->title }}</span>
									</div>
								</a>
							</li>
						@endforeach
					</ul>
				</div>
				<!-- end of panel body -->
			</div>
			<!-- end of panel -->
		</div>
		<!-- end of col -->
	</div>
	<!-- end of row -->
</section>
<!-- end of content section -->  