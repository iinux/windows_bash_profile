<?php

echo "testphp start...\n";

$fileName = 'Google-IPs.html';
$fileUrl = 'https://raw.githubusercontent.com/justjavac/Google-IPs/master/README.md';

echo "read from cache file $fileName \n";
$htmlData = @file_get_contents($fileName);

if (!$htmlData) {
    echo "read from cache fail, read from $fileUrl \n";
    $htmlData = file_get_contents($fileUrl);
    echo "write cache \n";
    file_put_contents($fileName, $htmlData);
}

preg_match_all("/http:\/\/([\d\.]+)/", $htmlData, $matches);

echo "match data: \n";
var_dump($matches);

$port = 443;
foreach ($matches[1] as $ip) {
    try {
        $address = "tcp://$ip:$port";
        if (!$resource = @stream_socket_client($address, $errno, $errstr, 5.0, 4)) {
            $message = trim($errstr);
            $code = $errno;
            $message = mb_convert_encoding($message, 'utf-8', 'gbk');
            echo "$address $message $code\n";
            continue;
        }
    } catch (\Exception $e) {
        echo $e->getMessage() . "\n";
        continue;
    }

    echo "open the $address\n";
}
