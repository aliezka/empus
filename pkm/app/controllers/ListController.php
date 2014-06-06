<?php

class ListController extends BaseController {
	function __construct() {
		\Debugbar::disable();
	}
	
	function instansi() {
		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('lists.instansi');
	}
}