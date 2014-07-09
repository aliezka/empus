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
	<!-- end of row -->
</section>
<!-- end of content section --> 