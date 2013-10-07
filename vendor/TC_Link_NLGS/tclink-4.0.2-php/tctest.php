<?php
	// The ugly bit of code below loads the TCLink extension if it is not
	// already.  You can skip all of this if "extension=tclink.so" is in
	// your php.ini, or you can make a single call to dl("tclink") if
	// tclink.so is in your PHP extensions path ("extension_dir").
	if (!extension_loaded("tclink"))
	{
        echo "TCLink not loaded.  Try running as `php -d extension=modules/tclink.so tctest.php`\n";
        exit(1);
	}

	print "\nTCLink version " . tclink_getversion() . "\n";
	print "Sending transaction...";

	// Build a hash containing our parameters
	$params['custid'] = 'XXXX';
	$params['password'] = 'PPPP';
	$params['action'] = 'sale';
	$params['media'] = 'cc';
	$params['cc'] = '4111111111111111';
	$params['exp'] = '0110';
	$params['amount'] = '100';
	$params['name'] = 'Joe PHP';

	// Send the hash to TrustCommerce for processing
	$result = tclink_send($params);

	print "done!\n\nTransaction results:\n";

	// Print out all parameters returned
	while (list($key, $val) = each($result))
		print "\t$key=$val\n";
?>

