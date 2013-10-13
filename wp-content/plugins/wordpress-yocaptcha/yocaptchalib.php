<?
function url_encode ($data) {
        $req = "";
        foreach ( $data as $key => $value )
                $req .= $key . '=' . urlencode( stripslashes($value) ) . '&';

        $req=substr($req,0,strlen($req)-1);

        return $req;
}


function http_post_request($host, $path, $data, $port = 80) {

        $req = url_encode ($data);

        $http_request  = "POST $path HTTP/1.0\r\n";
        $http_request .= "Host: $host\r\n";
        $http_request .= "Content-Type: application/x-www-form-urlencoded;\r\n";
        $http_request .= "Content-Length: " . strlen($req) . "\r\n";
        $http_request .= "User-Agent: yocaptcha/PHP\r\n";
        $http_request .= "\r\n";
        $http_request .= $req;

        $response = '';
        if( false == ( $fs = @fsockopen($host, $port, $errno, $errstr, 10) ) ) {
                die ('Could not open socket');
        }

        fwrite($fs, $http_request);

        while ( !feof($fs) )
                $response .= fgets($fs, 1160); // One TCP-IP packet
        fclose($fs);
//        $response = explode("\r\n\r\n", $response, 2);

        return $response;
}


function get_html ($pubkey, $place,$col)
{
	if (strlen($pubkey) != 32 ) {
		die ("To use yocaptcha you must get an API key from xxx");
	}
	
                $server = 'http://www.innovese.com/yocaptcha/api/';
           return file_get_contents($server.'ad.php?publickey='.$pubkey.'&placement='.$place.'&color='.$col);

   
}

class yoCaptcha {
        var $is_valid;
        var $error;
}


function verify_form($privkey, $session, $answer)
{
$yocaptcha_response = new yoCaptcha();
                $yocaptcha_response->is_valid = 0;
                $yocaptcha_response->error = 'invalid-keys';

if(strlen($privkey) != 32)
{
return $yocaptcha_response;
}

//$resp = http_post_request('http://www.innovese.com/yocaptcha/api/', 'verify.php', array (
//                                                 'privatekey' => $privkey,
//                                                 'publickey' => $pubkey,
  //                                               'session' => $session,
    //                                             ));


$resp = file_get_contents("http://www.innovese.com/yocaptcha/api/verify.php?privatekey=".$privkey."&session=".$session."&answer=".$answer);


if($resp == "passed")
                $yocaptcha_response->is_valid = 1;
else if($resp == "failed")
{
               $yocaptcha_response->is_valid = 0;
               $yocaptcha_response->error = "incorrect-answer";
}
else
{
               $yocaptcha_response->is_valid = 0;
               $yocaptcha_response->error = "invalid-keys";
}
return $yocaptcha_response;
}