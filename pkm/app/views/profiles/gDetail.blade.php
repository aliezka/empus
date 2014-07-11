<section id="content" class="main-content snap-content profile">
    <div class="row">
        <div class="small-12 medium-6 columns wide-panel">
            <div class="panel">
                <div class="panel-heading">
                    <span><i class="fa fa-user"></i>Profile</span>
                    <a href="#" class="button secondary tiny right"><i class="fa fa-pencil"></i></a>
                </div>
                <div class="panel-body">
                    <ul>
                        <li>
                            <div class="row">
                                <div class="small-3 columns">
                                    <img src="{{!is_null($User->img) ? $User->img->img : Config::get('empus.kelurahan_thumb_img')}}" alt="" height="75" height="75">
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
                    <span><i class="fa fa-comments-o"></i>Opini</span>
                    <a href="{{URL::to('gov/'.$User->id.'/opini')}}" class="button secondary tiny right"><i class="fa fa-list"></i></a>
                </div>
                <div class="panel-body">
                    <ul>
                        @foreach($OpiniTag as $Opini)
                        <li>
                            <a href="{{URL::to('opini',$Opini->opini->id)}}" >
                                <div class="row">
                                    <div class="small-12 columns">
                                        <small>{{humanTiming(strtotime($Opini->opini->created_at))}} yang lalu</small>
                                        <h6>{{$Opini->opini->title}}</h6>
                                        <span class="label secondary radius"><small class="fa fa-comment"></small>{{$Opini->opini->komentar->count()}}</span>
                                        <span class="label radius">Opini</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        @endforeach
                        @if(empty($OpiniTag->count()))
                        <li>
                            <div class="row">
                                <div class="small-12 columns">
                                    belum ada opini
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