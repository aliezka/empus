<?php

class ListController extends BaseController {
	protected $perPage = 15;

	function __construct() {
		\Debugbar::disable();
	}
	
	function instansi($offset = 0) {
		$Instansi = new Instansi;
		$Instansi->skip($offset)->take($this->perPage);

		$Lists = $Instansi->get();

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('lists.instansi')->with('lists', $Lists);
	}
}