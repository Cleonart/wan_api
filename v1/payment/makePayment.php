<?php

	
	require '../../configuration.php';

	if(isset($_GET['id_payment'])){
		$id_payment			= $_GET['id_payment'];
		$nominal			= $_GET['nominal'];
		$payment_date		= $_GET['payment_date'];
		$data = $dale->kueri("INSERT INTO `payment`(`id_payment`, `nominal`, `payment_date`, `payment_status`) 
							  VALUES ('".$id_payment."',
							  		  '".$nominal."',
							  		  '".$payment_date."',
							  		  1)");
		echo $data;
	}


?>