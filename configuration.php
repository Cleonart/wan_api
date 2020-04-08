<?php
	
	require 'dale.php';

	$HOST = "127.0.0.1";
	$DATABASE = "database";
	$USERNAME = "root";
	$PASSWORD = "";

	$dale = new dale();

	$dale->konek_ke_database($HOST, $DATABASE,$USERNAME,$PASSWORD);

?>