<?php
	
	// mengambil semua layanan yang disediakan oleh vendor

	require '../../configuration.php';
	require './getVendorAndServices.php';

	if(isset($_GET['vendor_id'])){
		
		$vendor_data = getSpecificVendor($dale, $_GET['vendor_id']);
		$vendor_id = $vendor_data[0] -> id_user;
		$vendor_name = $vendor_data[0] -> name_user;
		$vendor_desc = $vendor_data[0] -> vendor_short_desc;
		$vendor_img = $vendor_data[0] -> pic_user;

		$data = array('vendor_id'      =>  $vendor_id,
					  'vendor_name'    =>  $vendor_name,
					  'vendor_desc'    =>  $vendor_desc,
					  'vendor_img'     =>  $vendor_img,
					  'vendor_rating'  =>  '4',
					  'vendor_product' => getVendorServices($dale, $_GET['vendor_id']) );
		echo json_encode($data);
	}

?>