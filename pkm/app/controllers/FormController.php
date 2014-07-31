<?php

class FormController extends BaseController {
	function __construct() {
		\Debugbar::disable();
	}

	function instansi($id = null) {
		$Pelayanan = Pelayanan::all();

		if(Auth::user()->hasRole('Administrator'))
			$Instansi = !is_null($id) ? Instansi::find($id) : null;
		else
			$Instansi = !is_null($id) ? Instansi::where( 'person_id','=',Auth::user()->person->id )->get()->first() : null;
		
		$InstansiProfileTelepon = !is_null($id) ? InstansiProfile::where('instansi_id', '=', $id)->where('profile_id', '=', 1)->first() : null;
		$InstansiProfileAlamat = !is_null($id) ? InstansiProfile::where('instansi_id', '=', $id)->where('profile_id', '=', 4)->first() : null;

		$InstansiProfileTelepon = isset($InstansiProfileTelepon->text) ? $InstansiProfileTelepon->text : null;
		$InstansiProfileAlamat = isset($InstansiProfileAlamat->text) ? $InstansiProfileAlamat->text : null;
		
		$PersonArray = array();
		if (Auth::user()->hasRole('Administrator')) {
			$Users = User::whereHas('role', function($query){
								$query->where('role_id','=','3');
							})->with('person')->get();
			$PersonArray = array(''=>'Pilih User');
			foreach ($Users as $User) {
				$PersonArray[$User->person->id] = $User->person->name;
			}	
		}

		if(Auth::user()->hasRole('Administrator'))
			$this->layout = View::make('layouts.admin');
		else
			$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('forms.instansi')
			->with('PersonArray', $PersonArray)
			->with('Pelayanan', $Pelayanan)
			->with('Instansi', $Instansi)
			->with('InstansiProfileTelepon', $InstansiProfileTelepon)
			->with('InstansiProfileAlamat', $InstansiProfileAlamat);
	}

	function sInstansi($id = null) {
		$Pelayanan = Pelayanan::all();

		if(Auth::user()->hasRole('Administrator'))
			$Instansi = !is_null($id) ? Instansi::findOrFail($id) : new Instansi;
		else
			$Instansi = !is_null($id) ? Instansi::where( 'person_id','=',Auth::user()->person->id )->get()->first() : null;

		$rules = array(
					'desc' => ' required | min:4 ',
					// 'image' => ' required | image ',
					'alamat' => ' min:4 ',
					'telepon' => ' min:3 ',
					'person_id' => ' numeric'
				);

		// $rules += !is_null($id) ? array('image' => ' image ') : array('image' => ' required | image ');

		$rule_name = is_null($id) ? array('name' => ' required | alpha_spaces | min:3 | unique:instansi,name') : $Instansi->name == Input::get('name', null) ? array() : array('name' => ' required | alpha_spaces | min:3 | unique:instansi,name');
		$rule_person = Auth::user()->hasRole('Administrator') ? array('person_id' => ' required | numeric') : array();

		$rules += $rule_name;
		$rules += $rule_person;
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			if (Auth::user()->hasRole('Administrator')) {
				$Path = 'dashboard/instansi/form';
				$Path .= !is_null($id) ? '/'.$id : null;
			} else
				$Path = "gov/$id/edit";

			return Redirect::to($Path)
				->with('Pelayanan', $Pelayanan)
				->with('Instansi', $Instansi)
				->withInput(Input::except('image'))
				->withErrors($validator);
		} else {
			$Instansi->name = Input::get('name');

			if(Auth::user()->hasRole('Administrator') && Input::get('person_id'))
				$Instansi->person_id = Input::get('person_id');


			$Instansi->save();

			// Alamat
			if (Input::get('alamat')) {
				if ($InstansiProfile = InstansiProfile::where('instansi_id', '=', $Instansi->id)->where('profile_id', '=', 4)->first()) {
					$InstansiProfile->text = Input::get('alamat'); 
					$InstansiProfile->save();
				} else {
					$InstansiProfile = new InstansiProfile;

					$InstansiProfile->instansi()->associate($Instansi);
					$InstansiProfile->profile()->associate(Profile::find(4));
					$InstansiProfile->text = Input::get('alamat'); 
					
					$InstansiProfile->save();
				}
			}
			// End Alamat

			// Telepon
			if (Input::get('telepon')) {
				if ($InstansiProfile = InstansiProfile::where('instansi_id', '=', $Instansi->id)->where('profile_id', '=', 1)->first()) {
					$InstansiProfile->text = Input::get('telepon'); 
					$InstansiProfile->save();
				} else {
					$InstansiProfile = new InstansiProfile;

					$InstansiProfile->instansi()->associate($Instansi);
					$InstansiProfile->profile()->associate(Profile::find(1));
					$InstansiProfile->text = Input::get('telepon'); 
					
					$InstansiProfile->save();
				}
			}
			// End Telepon
			
			// Image
			if (Input::hasFile('image')) {
				$FileName = $Instansi->id;
				$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

				Input::file('image')->move(Config::get('empus.path_instansi_img'), $FileName);
				
				if (!is_null($id)) {
					InstansiImg::where('instansi_id', '=', $id)->update(['img' => $FileName]);
				} else {
					$InstansiImg = new InstansiImg;
					$InstansiImg->instansi()->associate($Instansi);
					$InstansiImg->img = $FileName;
					$InstansiImg->save();
				}
			}
			// End Image

			// Desc
			if (InstansiDesc::where('instansi_id', '=', $id)->count() > 0) {
				InstansiDesc::where('instansi_id', '=', $id)->update(['desc' => Input::get('desc')]);
			} else {
				$InstansiDesc = new InstansiDesc;
				$InstansiDesc->instansi()->associate($Instansi);
				$InstansiDesc->desc = Input::get('desc');
				$InstansiDesc->save();
			}
			// End Desc

			// Pelayanan
			$Pelayanan = array();
			$RPelayanan = $Instansi->pelayanan;

			foreach ($RPelayanan as $R) {
				$Pelayanan[] = $R->id;
			} 

			$Diff = array_diff($Pelayanan, Input::get('pelayanan', array()));
			if (count($Diff) > 0) {
				$Instansi->pelayanan_list()->delete($Diff);
			}

			if (count(Input::get('pelayanan', array())) > 0) {
				foreach (Input::get('pelayanan') as $p) {
					$pelList = new InstansiPelayanan;
					$pelList->instansi_id = $Instansi->id;
					$pelList->pelayanan_id = $p;

					if (!$pelList->where('instansi_id', '=', $Instansi->id)->where('pelayanan_id', '=', $p)->count() > 0) {
						$pelList->save();
					}
				}
			}
			// End Pelayanan
			$url = Auth::user()->hasRole('Administrator') ? "dashboard/instansi" : "gov/$id";
			return Redirect::to($url);
		}
	}

	function dInstansi($id) {
		$Instansi = Instansi::findOrFail($id);
		$InstansiName = $Instansi->name;
		$Instansi->delete();

		return Redirect::to('dashboard/instansi')
				->with('fMessage', 'Instansi '.$InstansiName.' successfully deleted.');
	}

	function pelayanan($id = null) {
		$Pelayanan = !is_null($id) ? Pelayanan::find($id) : null;
		$Persyaratan = isset($Pelayanan->id) ? Persyaratan::where('pelayanan_id', '=', $Pelayanan->id)->orderBy('order', 'asc')->get() : new Persyaratan;
		$Prosedur = isset($Pelayanan->id) ? Prosedur::where('pelayanan_id', '=', $Pelayanan->id)->orderBy('order', 'asc')->get() : new Prosedur;

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('forms.pelayanan')
			->with('Pelayanan', $Pelayanan)
			->with('Persyaratan', $Persyaratan)
			->with('Prosedur', $Prosedur);
	}

	function sPelayanan($id = null) {
		$Pelayanan = !is_null($id) ? Pelayanan::find($id) : new Pelayanan;

		$rules = array(
					'desc' => ' required | min:4 '
				);

		$rule_name = is_null($id) ? array('name' => ' required | alpha_spaces | min:3 | unique:instansi,name') : $Pelayanan->name == Input::get('name', null) ? array() : array('name' => ' required | alpha_spaces | min:3 | unique:instansi,name');

		$rules += $rule_name; 
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Log::warning($validator->messages()->all());
			return Redirect::to('dashboard/pelayanan/form')
				->with('Pelayanan', $Pelayanan)
				->withInput(Input::all())
				->withErrors($validator);
		} else {
			$Pelayanan->name = Input::get('name');
			$Pelayanan->save();

			// Desc
			if (!is_null($id)) {
				PelayananDesc::where('pelayanan_id', '=', $id)->update(['desc' => Input::get('desc')]);
			} else {
				$PelayananDesc = new PelayananDesc;
				$PelayananDesc->desc = Input::get('desc');
				$PelayananDesc->pelayanan()->associate($Pelayanan);
				$PelayananDesc->save();
			}
			// End Desc

			return Redirect::to('dashboard/pelayanan');
		}
	}

	function dPelayanan($id) {
		$Pelayanan = Pelayanan::findOrFail($id);
		$PelayananName = $Pelayanan->name;
		$Pelayanan->delete();

		return Redirect::to('dashboard/pelayanan')
				->with('fMessage', 'Pelayanan '.$PelayananName.' successfully deleted.');
	}

	function persyaratan($pelayanan_id, $persyaratan_id = null) {
		$Pelayanan = Pelayanan::findOrFail($pelayanan_id);
		$Persyaratan = !is_null($persyaratan_id) ? Persyaratan::findOrFail($persyaratan_id) : new Persyaratan;

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('forms.persyaratan')
			->with('Pelayanan', $Pelayanan)
			->with('Persyaratan', $Persyaratan);
	}

	function sPersyaratan($pelayanan_id, $persyaratan_id = null) {
		$Pelayanan = Pelayanan::findOrFail($pelayanan_id);
		$Persyaratan = !is_null($persyaratan_id) ? Persyaratan::findOrFail($persyaratan_id) : new Persyaratan;

		$rules = array(
					'title' => ' required | min:3 ',
					'desc' => ' min:4 ',
					'image' => ' image '
				);

		$rules += $Persyaratan->order == Input::get('order') ? array('order' => ' required | numeric | min:0 ') : array('order' => ' required | numeric | min:0 | unique:persyaratan,order,null,null,pelayanan_id,'.$pelayanan_id);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Log::warning($validator->messages()->all());
			return Redirect::to('dashboard/pelayanan/'.$pelayanan_id.'/persyaratan/'.(!is_null($persyaratan_id) ? $persyaratan_id : 'form'))
				->withInput(Input::except('image'))
				->withErrors($validator);
		} else {
			$Persyaratan->fill(Input::all());
			$Persyaratan->pelayanan()->associate($Pelayanan);
			$Persyaratan->save();

			// Image
			if (Input::hasFile('image')) {
				$FileName = $Persyaratan->id;
				$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

				Input::file('image')->move(Config::get('empus.path_persyaratan_img'), $FileName);
				
				if (!is_null($persyaratan_id)) {
					PersyaratanImg::where('persyaratan_id', '=', $persyaratan_id)->update(['img' => $FileName]);
				} else {
					$PersyaratanImg = new PersyaratanImg;
					$PersyaratanImg->persyaratan()->associate($Persyaratan);
					$PersyaratanImg->img = $FileName;
					$PersyaratanImg->save();
				}
			}
			// End Image

			// Desc
			if (PersyaratanDesc::where('persyaratan_id', '=', $persyaratan_id)->count() > 0) {
				PersyaratanDesc::where('persyaratan_id', '=', $persyaratan_id)->update(['desc' => Input::get('desc')]);
			} else {
				$PersyaratanDesc = new PersyaratanDesc;
				$PersyaratanDesc->persyaratan()->associate($Persyaratan);
				$PersyaratanDesc->desc = Input::get('desc');
				$PersyaratanDesc->save();
			}
			// End Desc

			return Redirect::to('dashboard/pelayanan/form/'.$pelayanan_id);
		}
	}

	function prosedur($pelayanan_id, $prosedur_id = null) {
		$Pelayanan = Pelayanan::findOrFail($pelayanan_id);
		$Prosedur = !is_null($prosedur_id) ? Prosedur::findOrFail($prosedur_id) : new Prosedur;

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('forms.prosedur')
			->with('Pelayanan', $Pelayanan)
			->with('Prosedur', $Prosedur);
	}

	function sProsedur($pelayanan_id, $prosedur_id = null) {
		$Pelayanan = Pelayanan::findOrFail($pelayanan_id);
		$Prosedur = !is_null($prosedur_id) ? Prosedur::findOrFail($prosedur_id) : new Prosedur;

		$rules = array(
					'title' => ' required | min:3 ',
					'desc' => ' min:4 ',
					'image' => ' image '
				);

		$rules += $Prosedur->order == Input::get('order') ? array('order' => ' required | numeric | min:0 ') : array('order' => ' required | numeric | min:0 | unique:prosedur,order,null,null,pelayanan_id,'.$pelayanan_id);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Log::warning($validator->messages()->all());
			return Redirect::to('dashboard/pelayanan/'.$pelayanan_id.'/prosedur/'.(!is_null($prosedur_id) ? $prosedur_id : 'form'))
				->withInput(Input::except('image'))
				->withErrors($validator);
		} else {
			$Prosedur->fill(Input::all());
			$Prosedur->pelayanan()->associate($Pelayanan);
			$Prosedur->save();

			// Image
			if (Input::hasFile('image')) {
				$FileName = $Prosedur->id;
				$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

				Input::file('image')->move(Config::get('empus.path_prosedur_img'), $FileName);
				
				if (!is_null($prosedur_id)) {
					ProsedurImg::where('prosedur_id', '=', $prosedur_id)->update(['img' => $FileName]);
				} else {
					$ProsedurImg = new ProsedurImg;
					$ProsedurImg->prosedur()->associate($Prosedur);
					$ProsedurImg->img = $FileName;
					$ProsedurImg->save();
				}
			}
			// End Image

			// Desc
			if (ProsedurDesc::where('prosedur_id', '=', $prosedur_id)->count() > 0) {
				ProsedurDesc::where('prosedur_id', '=', $prosedur_id)->update(['desc' => Input::get('desc')]);
			} else {
				$ProsedurDesc = new ProsedurDesc;
				$ProsedurDesc->prosedur()->associate($Prosedur);
				$ProsedurDesc->desc = Input::get('desc');
				$ProsedurDesc->save();
			}
			// End Desc

			return Redirect::to('dashboard/pelayanan/form/'.$pelayanan_id);
		}
	}

	function opiniAssociate($object, $id) {
		$Associate = null;
		switch ($object) {
			case 'instansi_pelayanan':
				$Associate = InstansiPelayanan::findOrFail($id);
				break;
			case 'instansi':
				$Associate = Instansi::findOrFail($id);
				break;
			case 'pelayanan':
				$Associate = Pelayanan::findOrFail($id);
				break;
			default:
				
				break;
		}

		return $Associate;
	}

	function opini($object, $id) {
		// Object
		$Associate = $this->opiniAssociate($object, $id);

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('forms.opini')
			->with('Object', $Associate)
			->with('Type', $object)

			->with('Berita', null)
			->with('Instansi', null);
	}

	function sOpini($object, $id) { 
		// Object
		$Associate = $this->opiniAssociate($object, $id);

		$rules = array(
					'title' => ' required | alpha_spaces | min:3 ',
					'type' => ' required | numeric ',
					'desc' => ' required | min:4 ',
					'image' => ' image '
				);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Log::warning($validator->messages()->all());
			return Redirect::to('opini/'.$object.'/'.$id.'/form')
				->withInput(Input::except('image'))
				->withErrors($validator);
		} else {
			$Opini = new Opini;
			$OpiniImg = new OpiniImg;
			$OpiniDesc = new OpiniDesc;

			DB::transaction(function() use ($Associate, $Opini, $OpiniImg, $OpiniDesc, $object, $id) {
				$Opini->fill(Input::all());
				$Opini->person()->associate(Auth::user()->person);
				$Opini->save();

				// Image
				if (Input::hasFile('image')) {
					$FileName = $Opini->id;
					$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

					Input::file('image')->move(Config::get('empus.path_persyaratan_img'), $FileName);

					$OpiniImg->img = $FileName;
					$OpiniImg->opini()->associate($Opini);
					$OpiniImg->save();
				}
				// End Image

				// Desc
				$OpiniDesc->desc = Input::get('desc');
				$OpiniDesc->opini()->associate($Opini);
				$OpiniDesc->save();
				// End Desc

				// Object
				$Associate = $Pivot = null;
				switch ($object) {
					case 'instansi_pelayanan':
						$Associate = InstansiPelayanan::find($id);

						$Pivot = new OpiniInstansiPelayanan;
						$Pivot->instansi_pelayanan()->associate($Associate);
						break;
					case 'instansi':
						$Associate = Instansi::find($id);

						$Pivot = new OpiniInstansi;
						$Pivot->instansi()->associate($Associate);
						break;
					case 'pelayanan':
						$Associate = Pelayanan::find($id);
						break;
					default:
						
						break;
				}
				$Pivot->opini()->associate($Opini);
				$Pivot->save();
				// End Object
			});
			
			nopini($Opini->id);

			return Redirect::to('opini/'.$Opini->id);
		}
	}

	function komentar($opini) { 
		if (Request::segment(1) == 'opini' && Request::segment(3) == 'komentar') {
			return Redirect::to('opini/'.Request::segment(2));
		}

		$Opini = Opini::findOrFail($opini);
		
		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('forms.komentar');
	}

	function sKomentar($opini) {
		$Opini = Opini::findOrFail($opini);
		$rules = array('desc' => ' required | min:4 ');

		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Log::warning($validator->messages()->all());
			return Redirect::to('komentar/'.$opini.'/form')
				->withInput(Input::except('image'))
				->withErrors($validator);
		} else {
			$Komentar = new Komentar;
			$Komentar->opini()->associate($Opini);
			$Komentar->person()->associate(Auth::user()->person);
			$Komentar->save();

			nkomentar($Komentar->id);

			// Desc
			$KomentarDesc = new KomentarDesc;
			$KomentarDesc->desc = Input::get('desc');
			$KomentarDesc->komentar()->associate($Komentar);
			$KomentarDesc->save();
			// End Desc

			return Redirect::to('opini/'.$opini);
		}
	}

	function sStatus($opini) {
		$Opini = Opini::findOrFail($opini);
		$rules = array('status' => ' required | numeric ');

		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Log::warning($validator->messages()->all());
			return Redirect::to('opini/'.$opini)
				->withErrors($validator);
		} else {
			$Opini->status = Input::get('status');
			$Opini->save();

			nstatus($Opini->id);

			return Redirect::to('opini/'.$opini);
		}
	}

	function berita($id = null) {
		$Pelayanan = Pelayanan::all();
		$Instansi = Instansi::all();
		$Berita = !is_null($id) ? Berita::find($id) : null;

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('forms.berita')
			->with('Pelayanan', $Pelayanan)
			->with('Instansi', $Instansi)
			->with('Berita', $Berita);
	}

	function sBerita($id=null) {
		$rules = array(
					'instansi' => ' array ',
					'pelayanan' => ' array ',
					'title' => ' required | min:4 ',
					'desc' => ' required | min:4 ',
					'image' => ' image '
				);

		$Berita = !is_null($id) ? Berita::findOrFail($id) : new Berita;

		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Log::warning($validator->messages()->all());
			return Redirect::to('dashboard/berita/form')
				->withInput(Input::except('image'))
				->withErrors($validator);
		} else {
			$Berita->fill(Input::all());
			$Berita->save();

			// Image
			if (Input::hasFile('image')) {
				$FileName = $Berita->id;
				$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

				Input::file('image')->move(Config::get('empus.path_berita_img'), $FileName);

				if (!is_null($id)) {
					BeritaImg::where('berita_id', '=', $id)->update(['img' => $FileName]);
				} else {
					$BeritaImg = new BeritaImg;
					$BeritaImg->img = $FileName;
					$BeritaImg->berita()->associate($Berita);
					$BeritaImg->save();
				}
			}
			// End Image

			// Desc
			if (BeritaDesc::where('berita_id', '=', $id)->count() > 0) {
				BeritaDesc::where('berita_id', '=', $id)->update(['desc' => Input::get('desc')]);
			} else {
				$BeritaDesc = new BeritaDesc;
				$BeritaDesc->desc = Input::get('desc');
				$BeritaDesc->berita()->associate($Berita);
				$BeritaDesc->save();
			}
			// End Desc

			// Pelayanan
			$Pelayanan = array();
			$RPelayanan = $Berita->pelayanan;

			foreach ($RPelayanan as $R) {
				$Pelayanan[] = $R->id;
			} 

			$Diff = array_diff($Pelayanan, Input::get('pelayanan', array()));
			if (count($Diff) > 0) {
				$Berita->pelayanan_list()->delete($Diff);
			}

			if (count(Input::get('pelayanan', array())) > 0) {
				foreach (Input::get('pelayanan') as $Ar) {
					$BeritaPelayanan = new BeritaPelayanan;
					if ($BeritaPelayanan->where('berita_id', '=', $Berita->id)->where('pelayanan_id', '=', $Ar)->count() == 0) {
						$BeritaPelayanan->berita()->associate($Berita);
						$BeritaPelayanan->pelayanan()->associate(Pelayanan::find($Ar));

						$BeritaPelayanan->save();
					}
				}
			}
			// End Pelayanan

			// Instansi
			$Instansi = array();
			$RInstansi = $Berita->instansi;

			foreach ($RInstansi as $R) {
				$Instansi[] = $R->id;
			} 

			$Diff = array_diff($Instansi, Input::get('instansi', array()));
			if (count($Diff) > 0) {
				$Berita->instansi_list()->delete($Diff);
			}

			if (count(Input::get('instansi', array())) > 0) {
				foreach (Input::get('instansi') as $Ar) {
					$BeritaInstansi = new BeritaInstansi;
					if ($BeritaInstansi->where('berita_id', '=', $Berita->id)->where('instansi_id', '=', $Ar)->count() == 0) {
						$BeritaInstansi->berita()->associate($Berita);
						$BeritaInstansi->instansi()->associate(Instansi::find($Ar));

						$BeritaInstansi->save();
					}
				}
			}
			// End Instansi

			return Redirect::to('berita/'.$Berita->id);
		}
	}

	function dBerita($id) {
		$Berita = Berita::findOrFail($id);
		$BeritaName = $Berita->name;
		$Berita->delete();

		return Redirect::to('dashboard/pelayanan')
				->with('fMessage', 'News '.$BeritaName.' successfully deleted.');
	}

	function notified($Opini_id) {
		notified($Opini_id, Auth::user()->id);
		return Redirect::to('opini/'.$Opini_id);
	}
}