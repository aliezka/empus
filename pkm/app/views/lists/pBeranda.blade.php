<section id="content" class="main-content snap-content">
            <!-- Topnav -->
            <!-- <div class="fixed"> -->
            <!-- </div>  -->
            <!-- End of Topnav -->
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
                                                <img src="{{ !is_null($instansi->img) ? $instansi->img->img :"" }}" alt="" height="75" height="75">
                                            </div>
                                            <div class="small-9 columns">
                                                <h6>{{$instansi->name}}</h6>
                                                <p>{{!is_null($instansi->desc) ? $instansi->desc->desc :""}}</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                @endforeach
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
                                    <a href="{{ URL::to('pelayanan/',$pelayanan->id) }}" >
                                         <div class="row">
                                            
                                            <div class="small-12 columns">
                                                <h6>{{$pelayanan->name}}</h6>
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
                                    <a href="#" >
                                        <div class="row">
                                            <div class="small-3 columns">
                                                <img src="{{!is_null($berita->img) ? $berita->img->img:""}}" alt="" height="75" height="75">
                                            </div>
                                            <div class="small-9 columns">
                                                <h6>{{$berita->title}}</h6>
                                                <p>{{!is_null($berita->desc) ? $berita->desc->desc:""}} </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                @endforeach
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
                                    <a href="{{ URL::to('opini/',$opini->id)}}" >
                                        <div class="row">
                                            <div class="small-3 columns">
                                                <img src="img/profile-picture.jpg" width="75">
                                            </div>
                                            <div class="small-9 columns">
                                                <h6>{{$opini->title}}</h6>
                                                <p>{{!is_null($opini->desc) ? $opini->desc->desc:""}}</p>
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