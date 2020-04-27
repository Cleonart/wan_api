<?php
	
	require '../../configuration.php';
	require '../serviceMainMenu/getVendorAndServices.php';

	if(isset($_POST['id_user']) &&
	   isset($_POST['id_service_product']) &&
	   isset($_POST['shopcart_qty']) &&
	   isset($_POST['shopcart_price']) &&
	   isset($_POST['shopcart_note'])){

	   $mydate = getdate(date("U"));

	   $id_shopcart		     = $mydate["mday"].$mydate["mon"].rand(1000,9999);
	   $id_user 		     = $_POST['id_user'];
	   $id_service_product   = $_POST['id_service_product'];
	   $shopcart_qty 	     = $_POST['shopcart_qty'];
	   $shopcart_price 	     = $_POST['shopcart_price'];
	   $shopcart_price_total = $shopcart_qty * $shopcart_price;
	   $shopcart_note        = $_POST['shopcart_note'];
	   $shopcart_status      = 1;

	   $itemSudahAda = productExistInShoppingCart($dale, $id_service_product, $id_user);
	   
	   if($itemSudahAda != null){
	   		$id_shopcart = $itemSudahAda;
	   }

	   $data = $dale->kueri("INSERT INTO `shopping_cart` 
							 SET id_shopcart          = '".$id_shopcart."', 
							  	 id_user              = '".$id_user."', 
							  	 id_service_product   = '".$id_service_product."',
							  	 shopcart_qty         = '".$shopcart_qty."', 
							  	 shopcart_price       = '".$shopcart_price."',
							  	 shopcart_price_total = '".$shopcart_price_total."', 
							  	 shopcart_note        = '".$shopcart_note."',
							  	 shopping_cart_status = '".$shopcart_status."'
							  ON DUPLICATE KEY UPDATE 
							  	 id_user              = '".$id_user."', 
							  	 id_service_product   = '".$id_service_product."',
							  	 shopcart_qty         = '".$shopcart_qty."', 
							  	 shopcart_price       = '".$shopcart_price."',
							  	 shopcart_price_total = '".$shopcart_price_total."', 
							  	 shopcart_note        = '".$shopcart_note."',
							  	 shopping_cart_status = '".$shopcart_status."'");

	   echo json_encode(array("kode" => "SUCCESS"));
	}
	else{
		echo json_encode(array("error" => "ERROR"));
	}
	

?>