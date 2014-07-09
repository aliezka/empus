<?php

class ProfileController extends BaseController{
	function __construct(){
	}

	function detail($id=null){
		if (!Auth::user())
			return Redirect::to('login');
		
		if (is_null($id))
			$User = Auth::user();
		else if(!is_null($id) && $id == Auth::user()->id)
			$User = User::find($id);
		else if(!is_null($id) && $id != Auth::user()->id)
			return Redirect::to('user');

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('profiles.detail')
			->with('User',$User)
			->with('Opini',$Opini);
	}
}

?>