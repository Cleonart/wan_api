<?php
	
	require '../../configuration.php';
	require './getVendorAndServices.php';

	if(isset($_GET['product_id']) && isset($_GET['id_user'])){
		echo json_encode(getSpecificProduct($dale, $_GET['product_id'], $_GET['id_user']));
	}

?>