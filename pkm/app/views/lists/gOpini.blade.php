<section id="content" class="main-content snap-content">
    <div class="row">
        <div class="small-12 medium-6 columns wide-panel">
            <div class="panel panel-opini">
                <div class="panel-heading">
                    <span class="header"><i class="fa fa-comment-o"></i>Opini Publik</span>
                </div>

                <div class="panel-body">
                    <ul>
                        @foreach ($OpiniTag as $Opini) 
                        <li>
                            <a href="{{ URL::to('opini/'.$Opini->opini->id) }}">
                                <div class="row">
                                    <div class="small-3 columns">
                                        <img src="{{checkImage(!is_null($Opini->opini->person->img)? $Opini->opini->person->img->img : null,'profile')}}" width="50">
                                    </div>
                                    <div class="small-9 columns">
                                        <div class="info">
                                            <small class="name">{{$Opini->opini->person->name}} </small>
                                            <small class="date right">{{humanTiming($Opini->opini->created_at->timestamp)}}</small>
                                        </div>
                                        <h6>{{ $Opini->opini->title }}</h6>
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
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section> 