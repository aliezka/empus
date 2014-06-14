<?php

class ListController extends BaseController {
	protected $perPage = 15;
	protected $offset;

	function __construct() {
		\Debugbar::disable();
		$this->offset = Input::get('offset', 0);
	}
	
	function instansi() {
		$Instansi = new Instansi;
		$Instansi->skip($this->offset)->take($this->perPage);

		$Lists = $Instansi->get();

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('lists.instansi')->with('lists', $Lists);
	}
	
	function pelayanan() {
		$Pelayanan = new Pelayanan;
		$Pelayanan->skip($this->offset)->take($this->perPage);

		$Lists = $Pelayanan->get();

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('lists.pelayanan')->with('lists', $Lists);
	}
}