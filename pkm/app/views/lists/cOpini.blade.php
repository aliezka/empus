<section id="content" class="main-content snap-content">

    <div class="row">
        <div class="small-12 medium-6 columns wide-panel">
            <div class="panel panel-opini">
                <div class="panel-heading">
                    <span class="header"><i class="fa fa-comment-o"></i>Opini Publik</span>
                </div>

                <div class="panel-body">
                    <ul>
                        @foreach ($Opini as $opini) 
                        <li>
                            <a href="{{ URL::to('opini/'.$opini->id) }}">
                                <div class="row">
                                    <div class="small-3 columns">
                                        <img src="{{checkImage(!is_null($opini->person->img)? $opini->person->img->img : null,'person')}}" width="50">
                                    </div>
                                    <div class="small-9 columns">
                                        <div class="info">
                                            <small class="name">{{$opini->person->name}} </small>
                                            <small class="date right">{{humanTiming($opini->created_at->timestamp)}}</small>
                                        </div>
                                        <h6>{{ $opini->title }}</h6>
                                        <?php 
                                            $Type = Config::get('empus.opini_type'); 
                                            $Status = Config::get('empus.opini_status'); 
                                            $Color = Config::get('empus.opini_color'); 
                                        ?>
                                        <span class="secondary radius label"><small class="fa fa-comment"></small>{{ $opini->komentar->count() }}</span>
                                        <span class="radius label {{ $opini->type == 3 ? 'success' : null }} {{ $opini->type == 2 ? 'alert' : null }} ">{{ $Type[$opini->type] }}</span>
                                        <span class="label radius {{$Color[$opini->status]}}">{{$Status[$opini->status]}}</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="small-12 columns">
                                        <p>{{ $opini->desc->desc }}</p>
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