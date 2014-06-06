<?php

class FormController extends BaseController {
	function __construct() {
		\Debugbar::disable();
	}

	function instansi() {
		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('forms.instansi');
	}

	function sInstansi() {
		$rules = array(
					'name' => ' required | alpha_spaces | min:3 ',
					'desc' => ' required | min:4 ',
					'image' => ' required | image '
				);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			return Redirect::to('dashboard/instansi/form')
				->withInput(Input::except('image'))
				->withErrors($validator);
		} else {
			$Instansi = new Instansi;
			$Instansi->name = Input::get('name');
			$Instansi->save();

			// Image
			$FileName = $Instansi->id;
			$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

			Input::file('image')->move(Config::get('empus.instansi_img'), $FileName);

			$InstansiImg = new InstansiImg;
			$InstansiImg->img = $FileName;
			$InstansiImg->instansi()->associate($Instansi);
			$InstansiImg->save();
			// End Image

			// Desc
			$InstansiDesc = new InstansiDesc;
			$InstansiDesc->desc = Input::get('desc');
			$InstansiDesc->instansi()->associate($Instansi);
			$InstansiDesc->save();
			// End Desc

			return Redirect::to('/');
		}
	}

	function pelayanan() {
		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('forms.pelayanan');
	}

	function sPelayanan() {
		$rules = array(
					'name' => ' required | alpha_spaces | min:3 ',
					'desc' => ' required | min:4 '
				);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			return Redirect::to('dashboard/pelayanan/form')
				->withInput(Input::all())
				->withErrors($validator);
		} else {
			$Pelayanan = new Pelayanan;
			$Pelayanan->name = Input::get('name');
			$Pelayanan->save();

			// Desc
			$PelayananDesc = new PelayananDesc;
			$PelayananDesc->desc = Input::get('desc');
			$PelayananDesc->pelayanan()->associate($Pelayanan);
			$PelayananDesc->save();
			// End Desc

			return Redirect::to('/');
		}
	}

	function persyaratan($id) {
		$Pelayanan = Pelayanan::find($id);
		if ($Pelayanan) {
			$this->layout = View::make('layouts.admin');
			$this->layout->content = View::make('forms.persyaratan')->with('Pelayanan', $Pelayanan);
		} else {
			return Redirect::to('dashboard/pelayanan');	
		}
	}

	function sPersyaratan($id) {
		$Pelayanan = Pelayanan::find($id);
		if ($Pelayanan) {
			$rules = array(
						'name' => ' required | alpha_spaces | min:3 ',
						'desc' => ' required | min:4 ',
						'image' => ' required | image '
					);
			
			$validator = Validator::make(Input::all(), $rules);
			if ($validator->fails()) { 
				return Redirect::to('dashboard/instansi/form')
					->withInput(Input::except('image'))
					->withErrors($validator);
			} else {
				$Persyaratan = new Persyaratan;
				$Persyaratan->name = Input::get('name');
				$Persyaratan->pelayanan()->associate($Pelayanan);
				$Persyaratan->save();

				// Image
				$FileName = $Persyaratan->id;
				$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

				Input::file('image')->move(Config::get('empus.persyaratan_img'), $FileName);

				$PersyaratanImg = new PersyaratanImg;
				$PersyaratanImg->img = $FileName;
				$PersyaratanImg->instansi()->associate($Persyaratan);
				$PersyaratanImg->save();
				// End Image

				// Desc
				$PersyaratanDesc = new PersyaratanDesc;
				$PersyaratanDesc->desc = Input::get('desc');
				$PersyaratanDesc->instansi()->associate($Persyaratan);
				$PersyaratanDesc->save();
				// End Desc

				return Redirect::to('/');
			}
		} else {
			return Redirect::to('dashboard/pelayanan');	
		}
	}
}