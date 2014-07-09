<?php

class DetailController extends BaseController{
	function __construct(){

	}

	public function dashboard(){
		echo "Dashboard.";
	}

	public function instansi($id) {
		$Instansi = Instansi::findOrFail($id);

		$InstansiProfileTelepon = !is_null($id) ? InstansiProfile::where('instansi_id', '=', $id)->where('profile_id', '=', 1)->first() : null;
		$InstansiProfileAlamat = !is_null($id) ? InstansiProfile::where('instansi_id', '=', $id)->where('profile_id', '=', 4)->first() : null;

		$InstansiProfileTelepon = isset($InstansiProfileTelepon->text) ? $InstansiProfileTelepon->text : null;
		$InstansiProfileAlamat = isset($InstansiProfileAlamat->text) ? $InstansiProfileAlamat->text : null;

		$InstansiPelayanan = InstansiPelayanan::where('instansi_id', '=', $id)->get();

		$OpiniTag = OpiniTag::where('instansi_id', '=', $id)->get();

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('details.instansi')
			->with('Instansi', $Instansi)
			->with('InstansiProfileTelepon', $InstansiProfileTelepon)
			->with('InstansiProfileAlamat', $InstansiProfileAlamat)
			->with('InstansiPelayanan', $InstansiPelayanan)
			->with('OpiniTag', $OpiniTag);
	}

	public function pelayanan($id) {
		$Pelayanan = Pelayanan::findOrFail($id);

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('details.pelayanan')
			->with('Pelayanan', $Pelayanan);
	}

	public function berita($id) {
		$Berita = Berita::findOrFail($id);

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('details.berita')
			->with('Berita', $Berita);
	}

	public function opini($id) {
		$Opini = Opini::findOrFail($id);

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('details.opini')
			->with('Opini', $Opini);
	}
}

?>