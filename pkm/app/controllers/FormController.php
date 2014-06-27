<?php

class FormController extends BaseController {
	function __construct() {
		\Debugbar::disable();
	}

	function instansi($id = null) {
		$Pelayanan = Pelayanan::all();
		$Instansi = !is_null($id) ? Instansi::find($id) : null;

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('forms.instansi')
			->with('Pelayanan', $Pelayanan)
			->with('Instansi', $Instansi);
	}

	function sInstansi($id = null) {
		$Pelayanan = Pelayanan::all();
		$Instansi = !is_null($id) ? Instansi::find($id) : new Instansi;

		$rules = array(
					'name' => ' required | alpha_spaces | min:3 | unique:instansi,name',
					'desc' => ' required | min:4 ',
					'image' => ' required | image '
				);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			$Path = 'dashboard/instansi/form';
			$Path .= !is_null($id) ? '/'.$id : null;

			return Redirect::to($Path)
				->with('Pelayanan', $Pelayanan)
				->with('Instansi', $Instansi)
				->withInput(Input::except('image'))
				->withErrors($validator);
		} else {
			$Instansi->name = Input::get('name');
			$Instansi->save();

			// Image
			if (Input::hasFile('image')) {
				$FileName = $Instansi->id;
				$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

				Input::file('image')->move(Config::get('empus.instansi_img'), $FileName);
				
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
			if (!is_null($id)) {
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
				$Instansi->pelayanan()->delete($Diff);
			}

			if (count(Input::get('pelayanan', array())) > 0) {
				$pelList = new InstansiPelayanan;
				foreach (Input::get('pelayanan') as $p) {
					$pelList->instansi_id = $Instansi->id;
					$pelList->pelayanan_id = $p;

					if (!$pelList->where('instansi_id', '=', $Instansi->id)->where('pelayanan_id', '=', $p)->count() > 0) {
						$pelList->save();
					}
				}
			}
			// End Pelayanan
			
			return Redirect::to('/');
		}
	}

	function pelayanan() {
		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('forms.pelayanan');
	}

	function sPelayanan() {
		$rules = array(
					'name' => ' required | alpha_spaces | min:3 | unique:pelayanan,name',
					'desc' => ' required | min:4 '
				);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Log::warning($validator->messages()->all());
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
						'desc' => ' min:4 | unique:persyaratan,order,null,null,pelayanan_id,'.$id,
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

	function opini($object, $id) {
		// Object
		$Associate = null;
		switch ($object) {
			case 'instansi_pelayanan':
				$Associate = InstansiPelayanan::find($id);
				break;
			case 'instansi':
				$Associate = Instansi::find($id);
				break;
			case 'pelayanan':
				$Associate = Pelayanan::find($id);
				break;
			default:
				
				break;
		} 

		if (!$Associate) {
			return Redirect::to('/');
		}

		$this->layout = View::make('layouts.segi');
		$this->layout->content = View::make('forms.opini');
	}

	function sOpini($object, $id) { 
		$rules = array(
					'title' => ' required | alpha_spaces | min:3 ',
					'type' => ' required ',
					'desc' => ' required | min:4 ',
					'image' => ' image '
				);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Log::warning($validator->messages()->all());
			return Redirect::to('dashboard/pelayanan/prosedur/'.$id.'/form')
				->withInput(Input::except('image'))
				->withErrors($validator);
		} else {
			$Opini = new Opini;
			$OpiniImg = new OpiniImg;
			$OpiniDesc = new OpiniDesc;

			DB::transaction(function() use ($Opini, $OpiniImg, $OpiniDesc, $object, $id) {
				$Opini->fill(Input::all());
				$Opini->person()->associate(Auth::user());
				$Opini->save();

				// Image
				if (Input::hasFile('image')) {
					$FileName = $Prosedur->id;
					$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

					Input::file('image')->move(Config::get('empus.persyaratan_img'), $FileName);

					
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
			
			return Redirect::to('/');
		}
	}

	function komentar($opini) { 
		$Opini = Opini::find($opini);
		if ($Opini) {
			$this->layout = View::make('layouts.segi');
			$this->layout->content = View::make('forms.komentar');
		} else {
			return Redirect::to('dashboard/prosedur');	
		}
	}

	function sKomentar($opini) {
		$Opini = Opini::find($opini);
		if ($Opini) {
			$rules = array(
						'desc' => ' required | min:4 '
					);
			
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

				// Desc
				$KomentarDesc = new KomentarDesc;
				$KomentarDesc->desc = Input::get('desc');
				$KomentarDesc->komentar()->associate($Komentar);
				$KomentarDesc->save();
				// End Desc

				return Redirect::to('/');
			}
		} else {
			return Redirect::to('dashboard/prosedur');	
		}
	}

	function berita($id = null) {
		$Pelayanan = Pelayanan::all();
		$Instansi = Instansi::all();

		$this->layout = View::make('layouts.admin');
		$this->layout->content = View::make('forms.berita')
			->with('Pelayanan', $Pelayanan)
			->with('Instansi', $Instansi);
	}

	function sBerita() {
		$rules = array(
					'instansi' => ' array ',
					'pelayanan' => ' array ',
					'title' => ' required | min:4 ',
					'desc' => ' required | min:4 ',
					'image' => ' image '
				);

		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) { 
			Log::warning($validator->messages()->all());
			return Redirect::to('dashboard/berita/form')
				->withInput(Input::except('image'))
				->withErrors($validator);
		} else {
			$Berita = new Berita;
			$Berita->fill(Input::all());
			$Berita->save();

			// Image
			if (Input::hasFile('image')) {
				$FileName = $Berita->id;
				$FileName .= '.'.Input::file('image')->getClientOriginalExtension();

				Input::file('image')->move(Config::get('empus.berita_img'), $FileName);

				$BeritaImg = new BeritaImg;
				$BeritaImg->img = $FileName;
				$BeritaImg->berita()->associate($Berita);
				$BeritaImg->save();
			}
			// End Image

			// Desc
			$BeritaDesc = new BeritaDesc;
			$BeritaDesc->desc = Input::get('desc');
			$BeritaDesc->berita()->associate($Berita);
			$BeritaDesc->save();
			// End Desc

			DB::transaction(function() use($Berita) {
				// Instansi
				$BeritaInstansi = new BeritaInstansi;
				$Arr = Input::get('instansi', array());
				foreach ($Arr as $Ar) {
					$BeritaInstansi->berita()->associate($Berita);
					$BeritaInstansi->instansi()->associate(Instansi::find($Ar));
					$BeritaInstansi->save();
				}

				// Pelayanan
				$BeritaPelayanan = new BeritaPelayanan;
				$Arr = Input::get('pelayanan');
				foreach ($Arr as $Ar) {
					$BeritaPelayanan->berita()->associate($Berita);
					$BeritaPelayanan->pelayanan()->associate(Pelayanan::find($Ar));
					$BeritaPelayanan->save();
				}
			});

			return Redirect::to('/');
		}
	}
}