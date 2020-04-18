<?php
	
	require '../../configuration.php';

	if(isset($_GET['payid'])){
		$pembayaran = $_GET['payid'];
		$data = $dale->kueri("SELECT * FROM payment 
							  WHERE `id_payment` = '".$pembayaran."' AND
							  `shopping_cart_status` = 1 ");
		echo $data;
	}
	
?>