<section id="content" class="main-content snap-content berita-detail">
	<div class="row">
		<div class="banner" style="background-image: url({{ checkImage(!is_null($Berita->img)? $Berita->img->img : null,'berita') }})"></div>
	</div>
	<div class="row">
		<div class="small-12 columns">
			<h6>{{ $Berita->title }}</h6>
			<small class="date">{{ humanTiming($Berita->created_at->timestamp) }}</small>
			<p>{{ isset($Berita->desc->desc) ? nl2br($Berita->desc->desc) : null }}</p>
		</div>
	</div>
	<!-- end of row -->
</section>
<!-- end of content section --> 