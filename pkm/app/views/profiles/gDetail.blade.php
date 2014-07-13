<section id="content" class="main-content snap-content profile">
    <div class="row">
        <div class="small-12 medium-6 columns wide-panel">
            <div class="panel">
                <div class="panel-heading">
                    <span><i class="fa fa-building-o"></i>Profile Kelurahan</span>
                    <a href="{{URL::to('gov/'.$User->person->instansi->id.'/edit')}}" class="button secondary tiny right"><i class="fa fa-pencil"></i></a>
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
                    <a href="{{URL::to('gov/'.$User->person->instansi->id.'/opini')}}" class="button secondary tiny right"><i class="fa fa-list"></i></a>
                </div>
                <div class="panel-body">
                    <ul>
                        @foreach($OpiniTag as $Opini)
                        <li>
                            <a href="{{ URL::to('opini', $Opini->opini->id)}}">
                                <div class="row">
                                    <div class="small-3 columns">
                                        <img src="{{checkImageThumb(!is_null($Opini->opini->person->img) ? $Opini->opini->person->img->img : null,'profile')}}" width="75">
                                    </div>
                                    <div class="small-9 columns">
                                        <div class="info">
                                            <small class="name">{{$Opini->opini->person->name}} </small>
                                            <small class="date right">{{humanTiming($Opini->opini->created_at->timestamp)}}</small>
                                        </div>
                                        <h6>{{$Opini->opini->title}}</h6>
                                        <?php 
                                            $Type = Config::get('empus.opini_type'); 
                                            $Status = Config::get('empus.opini_status'); 
                                            $Color = Config::get('empus.opini_color'); 
                                        ?>
                                        <span class="secondary radius label"><small class="fa fa-comment"></small>{{ $Opini->opini->komentar->count() }}</span>
                                        <span class="radius label {{ $Opini->opini->type == 3 ? 'success' : null }} {{ $Opini->opini->type == 2 ? 'alert' : null }} ">{{ $Type[$Opini->opini->type] }}</span>
                                        <span class="label radius {{$Color[$Opini->opini->status]}}">{{$Status[$Opini->opini->status]}}</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="small-12 columns">
                                        <p>{{ $Opini->opini->desc->desc }}</p>
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