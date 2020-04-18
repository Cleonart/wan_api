<?php
	
	require '../../configuration.php';

	if(isset($_GET['id_rating'])){
		$rate = $_GET['id_rating'];
		$data = $dale->kueri("SELECT * FROM rating 
							  WHERE `id_rating` = '".$rate."'");
		echo $data;
	}
	
?>