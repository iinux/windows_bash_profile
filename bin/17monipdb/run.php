<?php
require 'IP.class.php';
//var_dump($argv);
$i = IP::find($argv[1]);
echo implode(" ", $i)."\n";
