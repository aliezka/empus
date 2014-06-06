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
		if (Input::hasFile('image')) {
			echo Input::file('image')->getRealPath();
		}

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
}