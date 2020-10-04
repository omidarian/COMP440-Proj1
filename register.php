<?php
    require 'config.php';
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> Registration Page</title>
<link rel="stylesheet" href="style.css">
</head>
<body style="background-color:#95a5a6">
    <div id="main-wrapper" align="center">
        <p>Welcome to Registration Form</p>
        <!-- Form of input data-->
        <form action="create.php" method="post">
            <label>Username:</label>
            <input name="user" type="text" class="inputvalues" placeholder="Type your username" size="30" required> <br><br>
            <label> Password:</label>
            <input name="pass" type="password" class="inputvalues" placeholder="Type your password" size="30" required><br><br>
            <label> Confirm Password:</label>
            <input name="conPassword" type="password" class="inputvalues" placeholder="Confirm password"size="22" required><br><br>
            <input name="subButton" type="submit" id="signUpButton" value="Sign Up"/>
            <a href="index.php"><input type="button" id="backButton" value="Back to Login"/></a>
        </form>
        
    </div>
    <div id="resultDiv" align="center"></div>

    <?php
        if(isset($_POST['subButton']))
        {
            //echo '<script type="text/javascript"> alert("Sign Up button clicked") </script>';
        }
    ?>

</body>
</html>