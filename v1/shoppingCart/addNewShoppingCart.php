<?php
	
	require '../../configuration.php';
	$mydate=getdate(date("U"));

	if(isset($_GET['id_user'])){
		// id shopping cart
		// format : JENIS_PROVIDER.TANGGAL.XXX
		$id_servive_product	= $_GET['id_service_product'];
		$id_shopcart		= $id_servive_product.$mydate["mday"].$mydate["mon"].rand(100,999);
		$id_user			= $_GET['id_user'];
		$shopcart_qty		= $_GET['shopcart_qty'];
		$shopcart_price		= $_GET['shopcart_price'];
		$data = $dale->kueri("INSERT INTO `shopping_cart`(`id_shopcart`, `id_user`, `id_service_product`, 					`shopcart_qty`,`shopcart_price`, `shopping_cart_status`) 
							  VALUES ('".$id_shopcart."',
							  		  '".$id_user."',
							  		  '".$id_servive_product."',
							  		  '".$shopcart_qty."',
							  		  '".$shopcart_price."',
							  		  1)");
		echo $data;
	}

?>