<?php

class ProfileController extends BaseController{
	function __construct(){
	}

	function detail($id=null){
		$User = Auth::user();

		if ($id != Auth::user()->id) {
			return Redirect::to('user/'.Auth::user()->id);
		}

		$Opini = $User->person->opini()
							  ->take(5)
							  ->orderBy('created_at','desc')
							  ->get();

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('profiles.detail')
			->with('Opini',$Opini)
			->with('User',$User);
	}
}

?>