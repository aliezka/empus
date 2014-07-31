

<section id="content" class="main-content snap-content">
	<div class="row">
		<div class="small-12 medium-6 columns wide-panel">
			<div class="panel"> 
				<div class="panel-heading">
                    <h5><i class="fa fa-building-o"></i>Instansi</h5>
                </div>
				<div class="panel-body">
					<ul>
						@foreach ($lists as $Count => $list)
							<li>
								<a href="{{ URL::to('instansi/'.$list->id) }}">
									<div class="row">
										<div class="small-3 columns">
											<img src="{{ checkImageThumb(!is_null($list->img) ? $list->img->img : null,'instansi') }}">
										</div>
										<div class="small-9 columns">
											<h6>{{ $list->name }}</h6>
											<p>{{ $list->desc->desc }}</p>
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