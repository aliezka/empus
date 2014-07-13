<section id="content" class="main-content snap-content">
	<div class="row">
		<div class="small-12 medium-12 columns grid-control">
			<ul class="breadcrumbs">
				<li><a href="#">Admin</a></li>
				<li class="current"><a href="#">Instansi</a></li>
			</ul>
		</div>
	</div>

	<div class="row">
		<div class="small-12 medium-6 columns grid-control">
			<a href="{{ URL::to('dashboard/instansi/form') }}" class="button primary small">Create</a>
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
						<th>Nama Instansi</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					@foreach ($lists as $Count => $list) 
						<tr>
							<td>{{ $Count + 1 }}</td>
							<td><a href="{{ URL::to('dashboard/instansi/form/'.$list->id) }}">{{ $list->name }}</a></td>
							<td class="grid-buttons"><a href="{{ URL::to('dashboard/instansi/'.$list->id.'/delete') }}" title="delete" class="delbutton"><i class="fa fa-times"></i></a></td>
						</tr>
					@endforeach
				</tbody>
			</table>
		</div><!-- end of col -->
	</div><!-- end of row -->
</section>  