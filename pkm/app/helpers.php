<?php
	function beritaTag($Id) {
		$Berita = Berita::findOrFail($Id);
		$Return = null;

		foreach ($Berita->tag->all() as $count => $list) {
			$Return .= $count == 0 ? '' : ', ';
			if ($list->type == 'instansi') {
				$Res = Instansi::findOrFail($list->tag_id);
				$Return .= $Res->name;
			} else {
				$Res = Pelayanan::findOrFail($list->tag_id);
				$Return .= $Res->name;
			}
		}

		return $Return;
	}