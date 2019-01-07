<?php
header("Content-Type: text/plain; charset=UTF-8");
echo "USERNAME : ".$_POST["USERNAME"]."\n";
echo "PASSWORD : ".$_POST["PASSWORD"]."\n";
echo "SERVER_SOFTWARE : ".$_SERVER["SERVER_SOFTWARE"]."\n";
echo "SERVER_NAME : ".$_SERVER["SERVER_NAME"]."\n";
echo "GATEWAY INTERFACE : ".$_SERVER["GATEWAY_INTERFACE"]."\n";
echo "SERVER_PROTOCOL :  : ".$_POST["SERVER_PROTOCOL"]."\n";
echo "SERVER_PORT : ".$_POST["SERVER_PORT"]."\n";
echo "REQUEST_METHOD : ".$_SERVER["REQUEST_METHOD"]."\n";
echo "HTTP_ACCEPT : ".$_SERVER["HTTP_ACCEPT"]."\n";
echo "SCRIPT_NAME : ".$_SERVER["SCRIPT_NAME"]."\n";
echo "QUERY_STRING : ".$_SERVER["QUERY_STRING"]."\n";
echo "REMOTE_HOST : ".$_SERVER["REMOTE_HOST"]."\n";
echo "REMOTE_ADDR : ".$_SERVER["REMOTE_ADDR"]."\n";

//var_dump($_SERVER);
?>
