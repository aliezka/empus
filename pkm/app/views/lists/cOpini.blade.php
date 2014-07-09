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
                                        <img src="img/profile-picture.jpg" width="50">
                                    </div>
                                    <div class="small-9 columns">
                                        <h6>{{ $opini->title }}</h6>
                                        <?php $Type = Config::get('empus.opini_type'); ?>
                                        <span class="radius label {{ $opini->type == 3 ? 'success' : null }} {{ $opini->type == 2 ? 'alert' : null }} ">{{ $Type[$opini->type] }}</span>
                                        <span class="secondary radius label"><small class="fa fa-comment"></small>4</span>
                                        <small>{{ $opini->created_at }}</small>
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