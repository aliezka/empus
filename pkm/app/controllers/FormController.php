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
						'order' => ' required | numeric | min:0 ',
						'title' => ' required | alpha_spaces | min:3 ',
						'desc' => ' min:4 | unique:persyaratan,order',
						'image' => ' image '
					);
			
			$validator = Validator::make(Input::all(), $rules);
			if ($validator->fails()) { 
				Log::warning($validator->messages()->all());
				return Redirect::to('dashboard/pelayanan/persyaratan/'.$id.'/form')
					->withInput(Input::except('image'))
					->withErrors($validator);
			} else {
				$Persyaratan = new Persyaratan;
				$Persyaratan->fill(Input::all());
				$Persyaratan->pelayanan()->associate($Pelayanan);
				$Persyaratan->save();

				// Image
				$FileName = $Persyaratan->id;
				$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

				Input::file('image')->move(Config::get('empus.persyaratan_img'), $FileName);

				$PersyaratanImg = new PersyaratanImg;
				$PersyaratanImg->img = $FileName;
				$PersyaratanImg->persyaratan()->associate($Persyaratan);
				$PersyaratanImg->save();
				// End Image

				// Desc
				$PersyaratanDesc = new PersyaratanDesc;
				$PersyaratanDesc->desc = Input::get('desc');
				$PersyaratanDesc->persyaratan()->associate($Persyaratan);
				$PersyaratanDesc->save();
				// End Desc

				return Redirect::to('/');
			}
		} else {
			return Redirect::to('dashboard/pelayanan');	
		}
	}

	function prosedur($id) { 
		$Prosedur = Pelayanan::find($id);
		if ($Prosedur) {
			$this->layout = View::make('layouts.admin');
			$this->layout->content = View::make('forms.prosedur')->with('Prosedur', $Prosedur);
		} else {
			return Redirect::to('dashboard/prosedur');	
		}
	}

	function sProsedur($id) {
		$Pelayanan = Pelayanan::find($id);
		if ($Pelayanan) {
			$rules = array(
						'order' => ' required | numeric | min:0 ',
						'title' => ' required | alpha_spaces | min:3 ',
						'desc' => ' min:4 ',
						'image' => ' image '
					);
			
			$validator = Validator::make(Input::all(), $rules);
			if ($validator->fails()) { 
				Log::warning($validator->messages()->all());
				return Redirect::to('dashboard/pelayanan/prosedur/'.$id.'/form')
					->withInput(Input::except('image'))
					->withErrors($validator);
			} else {
				$Prosedur = new Prosedur ;
				$Prosedur->fill(Input::all());
				$Prosedur->pelayanan()->associate($Pelayanan);
				$Prosedur->save();

				// Image
				$FileName = $Prosedur->id;
				$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

				Input::file('image')->move(Config::get('empus.persyaratan_img'), $FileName);

				$ProsedurImg = new ProsedurImg;
				$ProsedurImg->img = $FileName;
				$ProsedurImg->prosedur()->associate($Prosedur);
				$ProsedurImg->save();
				// End Image

				// Desc
				$ProsedurDesc = new ProsedurDesc;
				$ProsedurDesc->desc = Input::get('desc');
				$ProsedurDesc->prosedur()->associate($Prosedur);
				$ProsedurDesc->save();
				// End Desc

				return Redirect::to('/');
			}
		} else {
			return Redirect::to('dashboard/prosedur');	
		}
	}
}