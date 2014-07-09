<!doctype html>
<html class="no-js" lang="en">
	<head>
		<meta charset="utf-8" />
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<title>EMPUS | Welcome</title>

		<!-- CSS -->
		<link rel="stylesheet" href="{{ asset('assets/css/foundation.css') }}" />
		<link rel="stylesheet" href="{{ asset('assets/css/snap.css') }}" />
		<link rel="stylesheet" href="{{ asset('assets/css/snap-drawer.css') }}" />
		<link rel="stylesheet" href="{{ asset('assets/vendor/fontawesome/css/font-awesome.min.css') }}" />
		<link rel="stylesheet" href="{{ asset('assets/css/main.css') }}" />
		<link rel="stylesheet" href="{{ asset('assets/css/responsive.css') }}" />
		<!-- END CSS -->

		<!-- JS -->
		<script src="{{ asset('assets/js/vendor/jquery.js') }}"></script>
		<script src="{{ asset('assets/js/vendor/modernizr.js') }}"></script>
		<script src="{{ asset('assets/js/foundation/foundation.js') }}"></script>
		<!-- END JS -->
	</head>
	<body>
		<!-- DRAWERS -->
		<div class="snap-drawers">
			<div class="snap-drawer snap-drawer-left">
				<aside class="">
					<ul class="off-canvas-list">
						<li><a href="{{ URL::to('/') }}"><i class="fa fa-home"></i>Beranda</a></li>
						<li><a href="{{ URL::to('instansi') }}"><i class="fa fa-building-o"></i>Instansi</a></li>
						<li><a href="{{ URL::to('pelayanan') }}"><i class="fa fa-smile-o"></i>Pelayanan</a></li>
						<li><a href="{{ URL::to('berita') }}"><i class="fa fa-bullhorn"></i>Berita</a></li>
						<li><a href="{{ URL::to('opini') }}"><i class="fa fa-comments-o"></i>Opini Publik</a></li>
						@if (Auth::user()) 
							<li><a href="{{ URL::to('setting') }}"><i class="fa fa-cog"></i>Pengaturan</a></li>
							<li><a href="{{ URL::to('logout') }}"><i class="fa fa-sign-in"></i>Logout</a></li>
						@else
							<li><a href="{{ URL::to('login') }}"><i class="fa fa-sign-in"></i>Login</a></li>
						@endif
					</ul>
				</aside>
			</div> 
		</div>  
		<!-- END DRAWERS -->

		<nav class="tab-bar">
			<section class="left-small">
				<a id="open-left" class="left-off-canvas-toggle" >
					<span class="fa fa-bars">
						<span>EMPUS</span>
					</span>
				</a>
			</section>
			<section class="middle tab-bar-section">
				<h1 class="title"></h1>
			</section>

			<section class="right-small">
				<a ><span class="fa fa-search"></span></a>
			</section>
		</nav>

		
		<div class="fixed">
			<nav class="top-bar">
				<ul class="title-area">
					<li class="name">
						<hi><a href="{{ URL::to('/') }}">EMPUS</a></hi>
					</li>
				</ul>
				<section class="top-bar-section">
					<ul class="left">
						<li><a href="{{ URL::to('instansi') }}">Instansi</a></li>
						<li><a href="{{ URL::to('pelayanan') }}">Pelayanan</a></li>
						<li><a href="{{ URL::to('berita') }}">Berita</a></li>
						<li><a href="{{ URL::to('opini') }}">Opini</a></li>
						<li><a href=""></a></li>
					</ul>
				</section>
				<section class="top-bar-section">
					<ul class="right">
						@if (Auth::user()) 
							<li><a href="{{ URL::to('logout') }}">Logout</a></li>
						@else
							<li><a href="{{ URL::to('login') }}" >Login</a></li>
						@endif
					</ul>
				</section>
			</nav>
		</div>

		<!-- CONTENT -->
		{{ !empty($content) ? $content : null }}
		<!-- END CONTENT -->
		
		<script src="{{ asset('assets/js/vendor/fastclick.js') }}"></script>
		<script src="{{ asset('assets/js/vendor/iscroll.js') }}"></script>
		<script src="{{ asset('assets/js/vendor/snap.js') }}"></script>
		<script src="{{ asset('assets/js/foundation.min.js') }}"></script>
		<script src="{{ asset('assets/js/foundation/foundation.offcanvas.js') }}"></script>
		<script src="{{ asset('assets/js/foundation/foundation.abide.js') }}"></script>

		<script>
			$(document).foundation();

			window.addEventListener('load', function() {
				//initiate Fastclick
				new FastClick(document.body);
				//initiate iscroll
				// var myScroll = new IScroll('.main-content');
				// initiate snap
			}, false);
			
			var snapper = new Snap({
				element: document.getElementById('content'),
				touchToDrag: false,
				disable: 'right'
			});
		</script>

		<script src="{{ asset('assets/js/main.js') }}"></script>
	</body>
</html>
