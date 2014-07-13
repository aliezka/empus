@if (Session::get('fMessage')) 
	<div id="fMessage" class="reveal-modal" data-reveal>
		<p>{{ Session::get('fMessage') }}</p>
		<a class="close-reveal-modal">&#215;</a>
	</div>

	<script type="text/javascript">
	$(document).ready(function(){$('#fMessage').foundation('reveal', 'open')});
	</script>
@endif