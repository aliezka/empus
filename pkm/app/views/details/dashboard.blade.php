<script src="{{ asset('assets/js/vendor/highcharts/js/highcharts.js') }}"></script>
<section id="content" class="main-content snap-content dashboard">
	<div class="row">
		<div class="small-12 columns">
			<div class="panel">
				<div class="panel-body">
					<div id="graph"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="small-2 columns">
			<div class="panel">
				<div class="panel-heading">Page Views</div>
				<div class="panel-body">
					<img class="page-views-loading" src="" alt="">
					<span class="page-views"></span>
					
				</div>
			</div>
		</div>
		<div class="small-3 columns">
			<div class="panel">
				<div class="panel-heading">Unique Page Views</div>
				<div class="panel-body">
					<img class="unique-page-views-loading" src="" alt="">
					<span class="unique-page-views"></span>
				
				</div>
			</div>
		</div>
		<div class="small-3 columns">
			<div class="panel">
				<div class="panel-heading">Avg. Time on Page</div>
				<div class="panel-body">
					<img class="average-time-loading" src="" alt="">
					<span class="average-time-on-page"></span>
				
				</div>
			</div>
		</div>
		<div class="small-2 columns">
			<div class="panel">
				<div class="panel-heading">Bounce Rate</div>
				<div class="panel-body">
					<img class="bounce-rate-loading" src="" alt="">
					<span class="entrance-bounce-rate"></span>
				
				</div>
			</div>
		</div>
		<div class="small-2 columns">
			<div class="panel">
				<div class="panel-heading">Exit Rate</div>
				<div class="panel-body">
					<img class="exit-rate-loading" src="" alt="">
					<span class="exit-rate"></span>
				
				</div>
			</div>
		</div>

	</div>
</section>