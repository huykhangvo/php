<?php
$host = "sql10.freemysqlhosting.net";
$user = "sql10378324";
$password = "PHBihFvxMm";
$database = "sql10378324";
$con = mysqli_connect($host, $user, $password, $database);
if (mysqli_connect_errno()){
    echo "Connection Fail: ".mysqli_connect_errno();exit;
}
