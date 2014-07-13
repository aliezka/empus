<section id="content" class="main-content snap-content">

    <div class="row">
        <div class="small-12 medium-6 columns wide-panel">
            <div class="panel panel-opini">
                <div class="panel-heading">
                    <span class="header"><i class="fa fa-users"></i>Pengguna</span>
                </div>

                <div class="panel-body">
                    <ul>
                        @foreach ($Lists as $User) 
                        <li>
                            <a href="{{ URL::to('user/'.$User->id) }}">
                                <div class="row">
                                    <div class="small-3 columns">
                                        <img src="{{checkImage(!is_null($User->person->img)? $User->person->img->img : null,'person')}}" width="50">
                                    </div>
                                    <div class="small-9 columns">
                                        <div class="info">
                                            <?php 
                                                $Lists = $User->role->lists('role');
                                                $Lists = implode(', ', $Lists);
                                            ?>
                                            <small class="name">{{ $Lists }} </small>
                                            <small class="date right">{{ $User->created_at }}</small>
                                        </div>
                                        <h6>{{ $User->person->name }}</h6>
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