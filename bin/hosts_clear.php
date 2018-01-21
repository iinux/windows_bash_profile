<?php

echo "testphp start...\n";

function dd($var)
{
    var_dump($var);
    die(0);
}
$outputFile = 'ip';

$fileData = explode("\r\n", file_get_contents('hosts'));
$successIp = [];
$failIp = [];

foreach ($fileData as $row) {
    preg_match_all("/^([\d\.]+)\s+([\w\-\.]+)$/", $row, $matches);

    if (!isset($matches[1][0])) {
        echo "find remark\n";
        file_put_contents($outputFile, "$row\n", FILE_APPEND);
        continue;
    }

    $ip = $matches[1][0];

    if (isset($successIp[$ip])) {
        echo "find success ip $ip adding...\n";
        file_put_contents($outputFile, "$row\n", FILE_APPEND);
        continue;
    }

    if (isset($failIp[$ip])) {
        echo "find fail ip $ip skipping...\n";
        continue;
    }

    $port = 443;
    try {
        $address = "tcp://$ip:$port";
        if (!$resource = @stream_socket_client($address, $errno, $errstr, 5.0, 4)) {
            $message = trim($errstr);
            $code = $errno;
            // $message = mb_convert_encoding($message, 'utf-8', 'gbk');
            echo "$address $message $code\n";
            $failIp[$ip] = true;
            continue;
        }
    } catch (\Exception $e) {
        echo $e->getMessage() . "\n";
        $failIp[$ip] = true;
        continue;
    }

    echo "open the $address\n";
    file_put_contents($outputFile, "$row\n", FILE_APPEND);
    $successIp[$ip] = true;
}
