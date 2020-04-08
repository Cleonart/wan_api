<?php
	
	require '../../configuration.php';
	
	if(isset($_GET['uid'])){
		$bebas = $_GET['uid'];
		$data = $dale->kueri("SELECT * FROM shopping_cart 
							  WHERE `id_user` = '".$bebas."' AND
							  `shopping_cart_status` = 1 ");
		echo $data;
	}
	
?>