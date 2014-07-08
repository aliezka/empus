<section id="content" class="main-content snap-content berita">
	<div class="row">
		<div class="small-12 medium-6 columns wide-panel">
			<div class="panel"> 
				<div class="panel-body">
					<ul>
						@foreach ($lists as $list) 
						<li>
							<a href="{{ URL::to('berita/'.$list->id) }}">
								<div class="row">
									<div class="small-3 columns">
										<img src="img/kantor-camat1-small.jpg" alt="" height="75" height="75">
									</div>
									<div class="small-9 columns">
										<h6>{{ $list->title }}</h6>
										<div class="date">{{ $list->created_at }}</div>
										<div class="tags"><i class="fa fa-tags"></i>Kelurahan Menteng</div>
									</div>
								</div>
								<div class="row">
									<div class="small-12 columns">
										<p>{{ $list->desc->desc or null }}</p>
									</div>
								</div>
							</a>
						</li>
						@endforeach
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>