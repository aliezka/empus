<section id="content" class="main-content snap-content">
    <div class="row">
        <div class="small-12 medium-6 columns wide-panel">
            <div class="panel panel-opini">
                <div class="panel-heading">
                    <span class="header"><i class="fa fa-comment-o"></i>Opini Publik</span>
                </div>

                <div class="panel-body">
                    <ul>
                        @foreach ($OpiniTag as $opiniTag) 
                        <li>
                            <a href="{{ URL::to('opini/'.$opiniTag->opini->id) }}">
                                <div class="row">
                                    <div class="small-3 columns">
                                        <img src="img/profile-picture.jpg" width="50">
                                    </div>
                                    <div class="small-9 columns">
                                        <h6>{{ $opiniTag->opini->title }}</h6>
                                        <?php $Type = Config::get('empus.opini_type'); ?>
                                        <span class="radius label {{ $opiniTag->opini->type == 3 ? 'success' : null }} {{ $opiniTag->opini->type == 2 ? 'alert' : null }} ">{{ $Type[$opiniTag->opini->type] }}</span>
                                        <span class="secondary radius label"><small class="fa fa-comment"></small>{{$opiniTag->opini->komentar->count()}}</span>
                                        <small>{{ $opiniTag->opini->created_at }}</small>
                                        <p>{{ $opiniTag->opini->desc->desc }}</p>
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