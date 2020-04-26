<?php
	
	require 'dale.php';
	
	// Set timezone 
	date_default_timezone_set('Asia/Makassar'); 

	$HOST = "127.0.0.1";
	$DATABASE = "database";
	$USERNAME = "root";
	$PASSWORD = "";

	$dale = new dale();
	
  	$dale->konek_ke_database($HOST, $DATABASE,$USERNAME,$PASSWORD);

?>