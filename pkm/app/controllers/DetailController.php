<?php

class DetailController extends BaseController{
	function __construct(){

	}

	public function dashboard(){
		echo "Dashboard.";
	}

	public function instansi($id) {
		$Instansi = Instansi::find($id);

		$InstansiProfileTelepon = !is_null($id) ? InstansiProfile::where('instansi_id', '=', $id)->where('profile_id', '=', 1)->first() : null;
		$InstansiProfileAlamat = !is_null($id) ? InstansiProfile::where('instansi_id', '=', $id)->where('profile_id', '=', 4)->first() : null;

		$InstansiProfileTelepon = isset($InstansiProfileTelepon->text) ? $InstansiProfileTelepon->text : null;
		$InstansiProfileAlamat = isset($InstansiProfileAlamat->text) ? $InstansiProfileAlamat->text : null;

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('details.instansi')
			->with('Instansi', $Instansi)
			->with('InstansiProfileTelepon', $InstansiProfileTelepon)
			->with('InstansiProfileAlamat', $InstansiProfileAlamat);
	}
}

?>