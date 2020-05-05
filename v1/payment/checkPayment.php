<?php
	
	require '../shoppingCart/getAllShoppingCart.php';

	if(isset($_GET['user'])){
		$id_user = $_GET['user'];
		getAllItemShoppingCart($dale, $id_user);
	}
	
?>