<?php

class ListController extends BaseController {
	protected $perPage = 15;
	protected $offset;

	function __construct() {
		\Debugbar::disable();
		$this->offset = Input::get('offset', 0);
	}
	
	function pBeranda(){
		$Instansi  = Instansi::orderBy('ts_created', 'desc')->take(3)->get();
		$Pelayanan = Pelayanan::orderBy('ts_created', 'desc')->take(3)->get();
		$Berita    = Berita::orderBy('created_at', 'desc')->take(3)->get();
		$Opini     = Opini::orderBy('created_at', 'desc')->take(3)->get();

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('lists.pBeranda')
			->with('Instansi', $Instansi)
			->with('Pelayanan', $Pelayanan)
			->with('Berita', $Berita)	
			->with('Opini', $Opini);	
	}

	function instansi() {
		$Instansi = new Instansi;
		if (Input::get('search')) {
			$Instansi = Instansi::where('name', 'like', '%'.Input::get('search').'%');
		}

		$Lists = $Instansi->get();

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('lists.instansi')->with('lists', $Lists);
	}

	function pInstansi() {
		$Instansi = new Instansi;
		if (Input::get('search')) {
			$Instansi = Instansi::where('name', 'like', '%'.Input::get('search').'%');
		}
		
		$Lists = $Instansi->get();

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('lists.pInstansi')->with('lists', $Lists);
	}
	
	function pelayanan() {
		$Pelayanan = new Pelayanan;
		if (Input::get('search')) {
			$Pelayanan = Pelayanan::where('name', 'like', '%'.Input::get('search').'%');
		}

		$Lists = $Pelayanan->get();

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('lists.pelayanan')->with('lists', $Lists);
	}
	
	function pPelayanan() {
		$Pelayanan = new Pelayanan;
		if (Input::get('search')) {
			$Pelayanan = Pelayanan::where('name', 'like', '%'.Input::get('search').'%');
		}
		$Lists = $Pelayanan->get();

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('lists.pPelayanan')->with('lists', $Lists);
	}
	
	function berita() {
		$Berita = new Berita;
		if (Input::get('search')) {
			$Berita = Berita::where('title', 'like', '%'.Input::get('search').'%');
		}
		$Lists = $Berita->get();

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('lists.berita')->with('lists', $Lists);
	}
	
	function pBerita() {
		$Berita = new Berita;
		if (Input::get('search')) {
			$Berita = Berita::where('title', 'like', '%'.Input::get('search').'%');
		}
		$Lists = $Berita->get();

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('lists.pBerita')->with('lists', $Lists);
	}

	function Opini(){
		$Opini = new Opini;
		if (Input::get('search')) {
			$Opini = Opini::where('title', 'like', '%'.Input::get('search').'%');
		}

		$Opini = Opini::orderBy('created_at','desc')
						->get();
		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('lists.cOpini')->with('Opini', $Opini);
	}

	function cOpini(){
		$Opini = Opini::where('person_id','=',Auth::user()->person->id)
						->orderBy('created_at','desc')
						->get();
		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('lists.cOpini')->with('Opini', $Opini);
	}

	function gOpini(){
		$OpiniTag = OpiniTag::where('instansi_id','=',!is_null(Auth::user()->person->instansi)?Auth::user()->person->instansi->id:'')
						->get();
		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('lists.gOpini')->with('OpiniTag', $OpiniTag);
	}

	function user() {
		$User = new User;
		$Lists = $User->get();

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('lists.user')->with('Lists', $Lists);

	}
}