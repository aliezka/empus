

<section id="content" class="main-content snap-content">
	<div class="row">
		<div class="small-12 medium-6 columns wide-panel">
			<div class="panel"> 
				<div class="panel-body">
					<ul>
						@foreach ($lists as $Count => $list)
							<li>
								<a href="{{ URL::to('dashboard/instansi/form/'.$list->id) }}">
									<div class="row">
										<div class="small-12 columns">
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