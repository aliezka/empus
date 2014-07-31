<section id="content" class="main-content snap-content profile">
    <div class="row">
        <div class="small-12 medium-6 columns wide-panel">
            <div class="panel">
                <div class="panel-heading">
                    <span><i class="fa fa-user"></i>Profile</span>
                    <a href="{{ URL::to('user/'.$User->id.'/edit') }}" class="button secondary tiny right"><i class="fa fa-pencil"></i></a>
                </div>
                <div class="panel-body">
                    <ul>
                        <li>
                            <div class="row">
                                <div class="small-3 columns">
                                    <img src="{{!is_null($User->person->img) ? asset('assets/img/person/'.$User->person->img->img) : Config::get('empus.profile_img')}}" alt="" height="75" height="75">
                                </div>
                                <div class="small-9 columns">
                                    <h6>{{!is_null($User->person) ? $User->person->name :""}}</h6>
                                    <p>{{$User->email}}</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="small-12 medium-6 columns wide-panel">
            <div class="panel">
                <div class="panel-heading">
                    <span><i class="fa fa-comments-o"></i>Opini Anda</span>
                    <a href="{{URL::to('user/'.$User->id.'/opini')}}" class="button secondary tiny right"><i class="fa fa-list"></i></a>
                </div>
                <div class="panel-body">
                    <ul>
                        @foreach($Opini as $opini)
                        <li>
                            <a href="{{URL::to('opini',$opini->id)}}" >
                                <div class="row">
                                    <div class="small-12 columns">
                                        <small>{{humanTiming(strtotime($opini->created_at))}} yang lalu</small>
                                        <h6>{{$opini->title}}</h6>
                                        <?php 
                                            $Type = Config::get('empus.opini_type'); 
                                            $Status = Config::get('empus.opini_status'); 
                                            $Color = Config::get('empus.opini_color'); 
                                        ?>
                                        <span class="label secondary radius"><small class="fa fa-comment"></small>{{$opini->komentar->count()}}</span>
                                        <span class="radius label {{ $opini->type == 3 ? 'success' : null }} {{ $opini->type == 2 ? 'alert' : null }} ">{{ $Type[$opini->type] }}</span>
                                        <span class="label radius {{$Color[$opini->status]}}">{{$Status[$opini->status]}}</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        @endforeach
                        @if(count($User->person->opini)<1)
                        <li>
                            <div class="row">
                                <div class="small-12 columns">
                                    anda belum menulis opini
                                </div>
                            </div>
                        </li>
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="small-12 medium-6 columns wide-panel">
            <div class="panel">
                <div class="panel-heading">
                    <span><i class="fa fa-bell-o"></i>Notifikasi</span>
                    <a href="{{URL::to('user/'.$User->id.'/opini')}}" class="button secondary tiny right"><i class="fa fa-list"></i></a>
                </div>
                <div class="panel-body">
                    <ul>
                        @foreach($Notifikasi as $not)
                        <li>
                            <a href="{{URL::to('opini/'.$not->notification->opini_id.'/notified')}}" >
                                <div class="row">
                                    <div class="small-12 columns">
                                        <small>{{humanTiming(strtotime($not->updated_at))}} yang lalu</small>
                                        <h6>{{$not->notification->title}}</h6>
                                        <?php 
                                            $Type = Config::get('empus.opini_type'); 
                                            $Status = Config::get('empus.opini_status'); 
                                            $Color = Config::get('empus.opini_color'); 
                                        ?>
                                        <span class="label secondary radius"><small class="fa fa-comment"></small>{{$not->notification->opini->komentar->count()}}</span>
                                        <span class="radius label {{ $not->notification->opini->type == 3 ? 'success' : null }} {{ $not->notification->opini->type == 2 ? 'alert' : null }} ">{{ $Type[$not->notification->opini->type] }}</span>
                                        <span class="label radius {{$Color[$not->notification->opini->status]}}">{{$Status[$not->notification->opini->status]}}</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        @endforeach
                        @if(count($Notifikasi)<1)
                        <li>
                            <div class="row">
                                <div class="small-12 columns">
                                    anda belum menulis opini
                                </div>
                            </div>
                        </li>
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>