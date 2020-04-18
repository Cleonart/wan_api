<?php
	
	require '../../configuration.php';

	if(isset($_GET['id_order'])){
		$id_rating			= $_GET['id_rating'];
		$id_user			= $_GET['id_user'];
		$id_servive_product	= $_GET['id_service_product'];
		$rating_range		= $_GET['rating_range'];
		$comment			= $_GET['comment'];
		$data = $dale->kueri("INSERT INTO `rating`(`id_rating`, `id_user`, `id_service_product`,
										  `rating_range`,`comment`) 
							  VALUES ('".$id_rating."',
							  		  '".$id_user."',
							  		  '".$id_service_product."',
							  		  '".$rating_range."',
							  		  '".$comment."')");
		echo $data;
	}

?>