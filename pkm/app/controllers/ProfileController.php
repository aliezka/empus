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

	function gDetail($id=null){
		$User = Auth::user();

		if ($id != Auth::user()->id) {
			return Redirect::to('gov/'.Auth::user()->id);
		}

		$Opini = $User->person->opini()
							  ->take(5)
							  ->orderBy('created_at','desc')
							  ->get();
		$Instansi = Instansi::find($User->person->id);

		$InstansiProfileTelepon = !is_null($id) ? InstansiProfile::where('instansi_id', '=', $id)->where('profile_id', '=', 1)->first() : null;
		$InstansiProfileAlamat = !is_null($id) ? InstansiProfile::where('instansi_id', '=', $id)->where('profile_id', '=', 4)->first() : null;

		$InstansiProfileTelepon = isset($InstansiProfileTelepon->text) ? $InstansiProfileTelepon->text : null;
		$InstansiProfileAlamat = isset($InstansiProfileAlamat->text) ? $InstansiProfileAlamat->text : null;

		$InstansiPelayanan = InstansiPelayanan::where('instansi_id', '=', $id)->get();

		$OpiniTag = OpiniTag::where('instansi_id','=',!is_null(Auth::user()->person->instansi)?Auth::user()->person->instansi->id:'')
						->take(3)->get();
		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('profiles.gDetail')
			->with('InstansiProfileTelepon', $InstansiProfileTelepon)
			->with('InstansiProfileAlamat', $InstansiProfileAlamat)
			->with('InstansiPelayanan', $InstansiPelayanan)
			->with('OpiniTag', $OpiniTag)
			->with('User',$User);

	}


}

?>