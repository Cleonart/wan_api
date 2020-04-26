<?php
	
	require '';

	function recordPayment($payment_id, $id_customer_order, $payment_method, $nominal, $payment_exp_time, $payment_status){

		$data = $dale->kueri("INSERT INTO `payment` 
							(`id_payment`, 
							 `id_customer_order`, 
							 `payment_method`, 
							 `nominal`, 
							 `payment_date`, 
							 `payment_exp_time`, 
							 `payment_status`) 
							 VALUES 
							('13131', 
							 '12', 
							 '232', 
							 '213', 
							 '".date("Y-m-d H:i:s")."',
							 '323', 
							 '1323');");
	}

?>