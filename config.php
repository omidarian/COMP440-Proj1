<?php

    //$con = mysqli_connect("localhost","root","root") or die("unable to connet");
    //mysqli_select_db($con,"user");
	$host = 'localhost';
	$user = 'root';
	$pass = '';
	$db = 'login';
	
	/* $conn = mysqli_connect($host,$user,$pass);
	
	$sql = 'CREATE Database login1';
	mysqli_close($conn);
	$db = 'login1'; */
	
	/* $connn = mysqli_connect($host, $user, $pass, $db);  
	
	$sql = "CREATE TABLE `login`.`user` ( `username` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL , `password` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ) ENGINE = InnoDB" ;
	mysqli_close($connn);   */
	
	$con = mysqli_connect($host, $user, $pass, $db);  
    if(mysqli_connect_errno()) {  
        die("Failed to connect with MySQL: ". mysqli_connect_error());  
    }  
?>