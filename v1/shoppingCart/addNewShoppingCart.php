<?php
	
	require '../../configuration.php';

	if(isset($_GET['id_user'])){
		$id_shopcart	    = $_GET['id_shopcart'];
		$id_user    	    = $_GET['id_user'];
		$id_servive_product = $_GET['id_service_product'];
		$shopcart_qty       = $_GET['shopcart_qty'];
		$shopcart_price       = $_GET['shopcart_price'];
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