<section id="content" class="main-content snap-content">
            <div class="row">
                <div class="small-12 medium-6 columns wide-panel">
                    <div class="panel">
                        <div class="panel-heading">
                            <h5><i class="fa fa-building-o"></i>Instansi</h5>
                        </div>
                        <div class="panel-body">
                            <ul>
                                @foreach ($Instansi as $instansi)
                                <li>
                                    <a href="{{ URL::to('instansi/'.$instansi->id) }}">
                                        <div class="row">
                                            <div class="small-3 columns">
                                                <img src="{{checkImageThumb(!is_null($instansi->img) ? $instansi->img->img : null,'kelurahan')}}" alt="" height="75" height="75">
                                            </div>
                                            <div class="small-9 columns">
                                                <h6>{{$instansi->name}}</h6>
                                                <p>{{!is_null($instansi->desc) ? $instansi->desc->desc :""}}</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                @endforeach
                                @if(Instansi::all()->count()>3)
                                <li class="limore">
                                    <a href="{{URL::to('instansi')}}">
                                        <div class="row">
                                            <div class="small-12 columns">
                                                <span>Lihat lebih banyak</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                @endif
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="small-12 medium-6 columns wide-panel">
                    <div class="panel">
                        <div class="panel-heading">
                            <h5><i class="fa fa-smile-o"></i>Pelayanan</h5>
                        </div>
                        <div class="panel-body">
                            <ul>
                                @foreach ($Pelayanan as $pelayanan)
                                <li>
                                    <a href="{{ URL::to('pelayanan',$pelayanan->id) }}" >
                                         <div class="row">
                                            
                                            <div class="small-12 columns">
                                                <h6>{{$pelayanan->name}}</h6>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                @endforeach
                                @if(Pelayanan::all()->count()>3)
                                <li class="limore">
                                    <a href="{{URL::to('pelayanan')}}">
                                        <div class="row">
                                            <div class="small-12 columns">
                                                <span>Lihat lebih banyak</span>
                                            </div>
                                        </div>
                                    </a>
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
                            <h5><i class="fa fa-bullhorn"></i>Berita</h5>
                        </div>
                        <div class="panel-body">
                            <ul>
                                @foreach($Berita as $berita)
                                <li>
                                    <a href="{{ URL::to('berita', $berita->id)}}">
                                        <div class="row">
                                            <div class="small-3 columns">
                                                <img src="{{checkImageThumb(!is_null($berita->img) ? $berita->img->img : null,'berita')}}" alt="" height="75" height="75">
                                            </div>
                                            <div class="small-9 columns">
                                                <h6>{{$berita->title}}</h6>
                                                <p>{{!is_null($berita->desc) ? $berita->desc->desc:""}} </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                @endforeach
                                @if(Berita::all()->count()>3)
                                <li class="limore">
                                    <a href="{{URL::to('berita')}}">
                                        <div class="row">
                                            <div class="small-12 columns">
                                                <span>Lihat lebih banyak</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                @endif
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="small-12 medium-6 columns wide-panel">
                    <div class="panel">
                        <div class="panel-heading">
                            <h5><i class="fa fa-comments-o"></i>Opini Publik</h5>
                        </div>
                        <div class="panel-body">
                            <ul>
                                @foreach($Opini as $opini)
                                <li>
                                    <a href="{{ URL::to('opini', $opini->id)}}">
                                        <div class="row">
                                            <div class="small-3 columns">
                                                <img src="{{checkImageThumb(!is_null($opini->person->img) ? $opini->person->img->img : null,'person')}}" width="75">
                                            </div>
                                            <div class="small-9 columns">
                                                <div class="info">
                                                    <small class="name">{{$opini->person->name}} </small>
                                                    <small class="date right">{{humanTiming($opini->created_at->timestamp)}}</small>
                                                </div>
                                                <h6>{{$opini->title}}</h6>
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
                                @if(Opini::all()->count()>3)
                                <li class="limore">
                                    <a href="{{URL::to('opini')}}">
                                        <div class="row">
                                            <div class="small-12 columns">
                                                <span>Lihat lebih banyak</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                @endif
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>  