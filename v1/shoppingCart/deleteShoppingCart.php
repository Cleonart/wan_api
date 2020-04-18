<?php
	
	require '../../configuration.php';
	
	if(isset($_GET['id_shopcart'])){
		$buang = $_GET['id_shopcart'];
		$data = $dale->kueri("DELETE FROM shopping_cart 
							  WHERE `id_shopcart` = '".$buang."'");
		echo $data;
	}
	
?>