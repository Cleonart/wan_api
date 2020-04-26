<?php
	
	// mengambil semua vendor yang sedang online
	// Referensi - Dev menggunakan kode dibawah untuk mengambil vendor 
	// 			   yang spesifik pada layanannya masing-masing
	
	// Kode Vendor
	// ChilyoHouze : 180
	// Print       : 210
	// Wafil       : 120
	// Tukangku    : 220

	require '../../configuration.php';
	require './getVendorAndServices.php';

	if(isset($_GET['user_vendor_type'])){
		echo json_encode(getOnlineVendors($dale, $_GET['user_vendor_type']));
	}

?>