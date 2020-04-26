<?php

	// user vendor type adalah variabel untuk menentukan
	// jenis layanan dari vendor yang akan diambil

	function getVendorProduct(){

	}

	function getVendorServices($dale, $vendor_id){

		$data = $dale->kueri("SELECT a.`id_service` as product_id,
									 a.`name_service` as product_name,
									 a.`price_service` as product_price
									 a.`service_description` as product_desc
			                  FROM   `service`  as a
			                  INNER JOIN `user` as b
			                  ON a.`provider_service` = b.`id_user`
							  WHERE  `provider_service` = '".$vendor_id."' 
							  GROUP BY a.`provider_service_group`");

		return json_decode($data);
	}

	function getSpecificProductFromShoppingCart($dale, $product_id){

		// mengambil data jika tersedia di shopping cart
		$shopCart = $dale->kueri("SELECT *
								  FROM   `shopping_cart` 
								  WHERE  id_service_product = '".$product_id."'");

		return json_decode($shopCart);

	}

	function getSpecificProduct($dale, $product_id){
		$cart = getSpecificProductFromShoppingCart($dale, $product_id);
		$data = $dale->kueri("SELECT a.`id_service` as product_id,
									 a.`name_service` as product_name,
									 a.`price_service` as product_price,
									 a.`service_description` as product_desc
			                  FROM   `service` as a
							  WHERE  a.`id_service` = '".$product_id."'");
		
		// merubah format json menjadi array
		$data = json_decode($data);
		$product = [];
		
		$product['product_id']    = $data[0] -> product_id;
		$product['product_name']  = $data[0] -> product_name;
		$product['product_price'] = $data[0] -> product_price;
		$product['product_desc']  = $data[0] -> product_desc;
		$product['product_qty']   = 1;

		// jika data tersedia di shopping cart, maka gunakan jumlah yang ada di shopping cart
		if(sizeof($cart) > 0){
			$product['product_qty'] = $cart[0] -> shopcart_qty;
		}	

		return $product;
	}

	// mengambil semua vendor yang sedang online atapun offline pada 1 layanan
	function getVendors($dale, $user_vendor_type){

		$data = $dale->kueri("SELECT `id_user`,`name_user`,`pic_user`,`phone_num_user` 
			                  FROM   `user` 
							  WHERE  `user_type`        = '2' AND 
							 		 `user_vendor_type` = '".$user_vendor_type."'");

		return json_decode($data);
	}

	// mengambil semua vendor online dari 1 layanan
	function getOnlineVendors($dale, $user_vendor_type){

		$data = $dale->kueri("SELECT `id_user`,`name_user`,`pic_user`,`phone_num_user`
			                  FROM   `user` 
							  WHERE  `user_type`          = '2' AND 
							 		 `user_vendor_type`   = '".$user_vendor_type."' AND
							 		 `user_vendor_online` = 1");

		return json_decode($data);
	}

	// mengambil semua vendor online dari 1 layanan
	function getSpecificVendor($dale, $vendor_id){

		$data = $dale->kueri("SELECT `id_user`,`name_user`,`pic_user`,`phone_num_user`,`vendor_short_desc`
			                  FROM   `user` 
							  WHERE  `id_user`= '".$vendor_id."'");

		return json_decode($data);
	}

?>