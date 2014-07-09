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
		$Instansi->skip($this->offset)->take($this->perPage);

		$Lists = $Instansi->get();

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('lists.instansi')->with('lists', $Lists);
	}

	function pInstansi() {
		$Instansi = new Instansi;
		$Instansi->skip($this->offset)->take($this->perPage);

		$Lists = $Instansi->get();

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('lists.pInstansi')->with('lists', $Lists);
	}
	
	function pelayanan() {
		$Pelayanan = new Pelayanan;
		$Pelayanan->skip($this->offset)->take($this->perPage);

		$Lists = $Pelayanan->get();

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('lists.pelayanan')->with('lists', $Lists);
	}
	
	function pPelayanan() {
		$Pelayanan = new Pelayanan;
		$Pelayanan->skip($this->offset)->take($this->perPage);

		$Lists = $Pelayanan->get();

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('lists.pPelayanan')->with('lists', $Lists);
	}
	
	function berita() {
		$Berita = new Berita;
		$Berita->skip($this->offset)->take($this->perPage);

		$Lists = $Berita->get();

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('lists.berita')->with('lists', $Lists);
	}
	
	function pBerita() {
		$Berita = new Berita;
		$Berita->skip($this->offset)->take($this->perPage);

		$Lists = $Berita->get();

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('lists.pBerita')->with('lists', $Lists);
	}
}