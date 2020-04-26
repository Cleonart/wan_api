<?php
	
	require '../../configuration.php';
	require './getVendorAndServices.php';

	if(isset($_GET['product_id'])){
		echo json_encode(getSpecificProduct($dale, $_GET['product_id']));
	}

?>