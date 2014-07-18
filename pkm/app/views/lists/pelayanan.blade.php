<section id="content" class="main-content snap-content">
	<div class="row">
		<div class="small-12 medium-12 columns grid-control">
			<ul class="breadcrumbs">
				<li><a href="#">Admin</a></li>
				<li class="current"><a href="#">Pelayanan</a></li>
			</ul>
		</div>
	</div>

	<div class="row">
		<div class="small-12 medium-6 columns grid-control">
			<a href="{{ URL::to('dashboard/pelayanan/form') }}" class="button primary small">Create</a>
		</div>
		<div class="small-12 medium-6 columns">
			{{ Form::open() }}
				{{ Form::input('text', 'search', Input::get('search', null), ['placeholder' => 'search']) }}
			{{ Form::close() }}
		</div>
	</div>
	<div class="row">
		<div class="small-12 medium-12 columns">
			<table class="grid">
				<thead>
					<tr>
						<th>No</th>
						<th>Pelayanan</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					@foreach ($lists as $Count => $list) 
						<tr>
							<td>{{ $Count + 1 }}</td>
							<td><a href="{{ URL::to('dashboard/pelayanan/form/'.$list->id) }}">{{ $list->name }}</a></td>
							<td class="grid-buttons"><a href="" title="delete" class="delbutton"><i class="fa fa-times"></i></a></td>
						</tr>
					@endforeach
				</tbody>
			</table>
		</div><!-- end of col -->
	</div><!-- end of row -->
	
	<div class="row">
		<div class="small-12 medium-6 medium-centered columns">
			{{$lists->links()}}
		</div>
	</div>
</section>  