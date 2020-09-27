<?php

?>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> Login Page</title>
<link rel="stylesheet" href="style.css">
</head>
<body style="background-color:#95a5a6">
    <div id="main-wrapper" align="center">
        <p>Welcome to Login Form</p>
        <!-- Form of input data-->
        <form action="index.php" method="post">
            <label>Username:</label>
            <input type="text" class="inputvalues" id="usrName" placeholder="Type your username" size="30"><br><br>
            <label> Password:</label>
            <input type="password" class="inputvalues" placeholder="Type your password" size="30"><br><br>
            <input type="submit" id="logButton" value="Login"/>
            <input type="button" id="regButton" value="Register"/>
        </form>
        
    </div>
    <div id="resultDiv" align="center"></div>

</body>
</html>