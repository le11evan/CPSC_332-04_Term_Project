<?php

DEFINE ('DB_USER', '<assigned account username');
DEFINE ('DB_PASSWORD', '<assigned account password>');
DEFINE ('DB_HOST', '<host of DB>');
DEFINE ('DB_NAME', '<assigned DB name>');

$dbc = @connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME)
OR die('ERROR: Could not connect to MySQL ' .
        mysqli_connect_error());

?>