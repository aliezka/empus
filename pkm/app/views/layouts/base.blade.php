<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>{{ !empty($titlePage) ? 'EMPUS : '.$titlePage : 'EMPUS' }}</title>

		<!-- Bootstrap -->
		<link href="{{ asset('assets/css/bootstrap.min.css') }}" rel="stylesheet">

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		<script src="{{ asset('assets/js/html5shiv.js') }}"></script>
		<script src="{{ asset('assets/js/respond.min.js') }}"></script>
		<![endif]-->

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="{{ asset('assets/js/jquery.min.js') }}"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
	</head>
	<body>
		{{ !empty($content) ? $content : null }}
	</body>
</html>