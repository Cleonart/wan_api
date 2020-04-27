<?php
	
	require '../../configuration.php';
	
	if(isset($_GET['id_user'])){

		$id   = $_GET['id_user'];

		$final_cart = [];

		$cartForProduct = getShoppingCart($dale, $id, "product");
		$cartForService = getShoppingCart($dale, $id, "service");

		if($cartForService != []){
			$final_cart = array_merge($final_cart, $cartForService);
		}

		
		if($cartForProduct != false){
			$final_cart = array_merge($final_cart, $cartForProduct);
		}

		echo json_encode($final_cart);
		
	}

	function getShoppingCart($dale, $id_user, $type){

		// mengambil semua shopping cart untuk kategori produk
		$mengambilDataVendor = $dale->kueri("SELECT DISTINCT c.`name_user` as vendor_name, c.`id_user` as vendor_id
											 FROM `shopping_cart` as a 
											 INNER JOIN `$type` as b 
											 	ON  a.`id_service_product` = b.`id_$type`
											 INNER JOIN `user` as c
											 	ON  b.`provider_$type` = c.`id_user`
											 WHERE a.`id_user` = '".$id_user."'");

		$dataVendor = json_decode($mengambilDataVendor);
		$cart       = [];

		if(sizeof($dataVendor) > 0){
			$i = 0;
			for($i; $i < sizeof($dataVendor); $i++){
				$cart[$i]['vendor_name'] = $dataVendor[$i] -> vendor_name;
				$cart[$i]['vendor_products'] = [];
				$j = 0;
				$mengambilItemKeranjang = $dale->kueri("SELECT a.`id_service_product` as product_id, 
													   b.`name_$type` as product_name,
													   a.`shopcart_qty` as product_qty,
													   a.`shopcart_price` as product_price
												FROM `shopping_cart` as a
												INNER JOIN $type as b 
													ON a.`id_service_product` = b.`id_$type`
												INNER JOIN `user` as c
													ON b.`provider_$type` = c.`id_user` 
												WHERE c.`id_user` = '".$dataVendor[$i] -> vendor_id."'");
				$item       = json_decode($mengambilItemKeranjang);
				for($j; $j < sizeof($item); $j++){
					$cart[$i]['vendor_products'][$j]['product_id']   = $item[$j] -> product_id;
					$cart[$i]['vendor_products'][$j]['product_name'] = $item[$j] -> product_name;
					$cart[$i]['vendor_products'][$j]['product_qty']   = $item[$j] -> product_qty;
					$cart[$i]['vendor_products'][$j]['product_price'] = $item[$j] -> product_price;
				}
			}
		}

		return $cart;
	}
	
?>