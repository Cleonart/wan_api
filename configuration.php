<?php
	
	require 'dale.php';

	$HOST = "127.0.0.1";
	$DATABASE = "database";
	$USERNAME = "root";
	$PASSWORD = "";
	$dale->konek_ke_database($HOST, $DATABASE,$USERNAME,$PASSWORD);
  	$conn = mysqli_connect($HOST, $DATABASE,$USERNAME,$PASSWORD);

?>