<section id="content" class="main-content snap-content berita">
	<div class="row">
		<div class="small-12 medium-6 columns wide-panel">
			<div class="panel"> 
				<div class="panel-heading">
		            <h5><i class="fa fa-bullhorn"></i>Berita</h5>
		        </div>
				<div class="panel-body">
					<ul>
						@foreach ($lists as $list) 
						<li>
							<a href="{{ URL::to('berita/'.$list->id) }}">
								<div class="row">
									<div class="small-3 columns">
										<img src="{{ checkImageThumb(!is_null($list->img) ? $list->img->img : null,'berita') }}" alt="" height="75" height="75">
									</div>
									<div class="small-9 columns">
										<h6>{{ $list->title }}</h6>
										<div class="date">{{ $list->created_at }}</div>
										
										<?php $tag = beritaTag($list->id); ?>
										@if (!empty($tag))
										<div class="tags"><i class="fa fa-tags"></i>
											{{ $tag }}
										</div>
										@endif
									</div>
								</div>
								<div class="row">
									<div class="small-12 columns">
										<p>{{ !is_null($list->desc) ? substr($list->desc->desc,0,strpos($list->desc->desc,' ',140)).' ...' : null }}</p>
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