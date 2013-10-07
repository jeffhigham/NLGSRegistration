<?
	// Sends the transaction to us and processes the response into a
	// standard PHP array.
	function curl_tc_send($fields_to_send)
	{
		$post_string = '';
		$use_amp = 0;
		foreach ($fields_to_send as $key => $value)
		{
			if ($use_amp) $post_string .= '&';
			$post_string .= "$key=$value";
			$use_amp = 1;
		}
		$curl_object = curl_init('https://vault.trustcommerce.com/trans/');
		curl_setopt($curl_object, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($curl_object, CURLOPT_POST, 1);
		curl_setopt($curl_object, CURLOPT_POSTFIELDS, $post_string);
	
		$unformatted_results = curl_exec($curl_object);
		curl_close($curl_object);
		$result_array = explode("\n", $unformatted_results);
		$tclink_results = array();
		foreach ($result_array as $key => $value)
		{
			$key_pair = explode('=', $value);
			if (count($key_pair) == 2)
			{
				$tclink_results[$key_pair[0]] = $key_pair[1];
			}
		}
		return $tclink_results;
	}
	
	$transaction = array(
		'custid' => 'XXXX',
		'password' => 'PPPP',
		'action' => 'preauth',
		'amount' => '100',
		'cc' => '4111111111111111',
		'exp' => '1213',
		'address1' => '123 Anywhere St',
		'zip' => '92606'
	);
	
	print_r(curl_tc_send($transaction));
	
?>
