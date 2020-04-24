<?php
	
	// *********************************************************************
	// API TOP UP
	// how to use : 
	// http://127.0.0.1/api/v1/payment/topUp.php?token=USER_ID.JUMLAH_TOP_UP
	// =====================================================================
	// contoh :
	// http://127.0.0.1/api/v1/payment/topUp.php?token=20100001.10000 
	// =====================================================================
	
	require '../../configuration.php';

	$minimal_top_up = 10000; // minimum top up bisa diatur disini
	$error = [];

	function topUp($dale, $token){

		// memecah string dan mengambil user_id dan jumlah topup
		$token = explode(".", $_GET['token']);

		// jika parameter user_id dan jumlah top up tersedia
		if(sizeof($token) > 1){
			$id_user = $token[0];
			$top_up_amount = $token[1];

			// melakukan validasi jika pengguna dengan id_user yang dimaksud dapat ditemukan
			$data = $dale->kueri("SELECT * FROM user 
							      WHERE `id_user` = '".$id_user."'");
			$data = json_decode($data);

			// jika pengguna tidak ditemukan
			if(sizeof($data) == 0){
				$error['error_code'] = "PENGGUNA_DENGAN_ID_" . $id_user . "_TIDAK_DITEMUKAN";
				$error['error_msg']  = "Maaf, nampaknya pengguna ini tidak dapat ditemukan";
				return json_encode($error);
			}

			// jika nilai top up tidak mencapai jumlah minimum top up
			if($top_up_amount < $GLOBALS['minimal_top_up']){
				$error['error_code'] = "MINIMAL_NILAI_TOP_UP_RP".$GLOBALS['minimal_top_up'];
				$error['error_msg']  = "Saldo untuk top up terlalu sedikit, coba lagi dengan jumlah diatas Rp. " . $GLOBALS['minimal_top_up'];
				return json_encode($error);
			}

			// jika semua data valid, maka proses top up dapat dilakukan
			$jumlah_setelah_top_up = $top_up_amount + $data[0] -> balance;
			$data = $dale->kueri("UPDATE `user` 
								  SET    `balance` = '".$jumlah_setelah_top_up."' 
								  WHERE  `id_user` = '".$id_user."'");

			$error['error_code'] = "TOP_UP_BERHASIL";
			$error['error_msg']  = "Top up berhasil dilakukan, terima kasih :)";
			return json_encode($error);
		}
	}

	if(isset($_GET['token'])){
		echo topUp($dale, $_GET['token']);
	}

?>