<?php
    require 'config.php';
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> Welcome Page</title>
<link rel="stylesheet" href="style.css">
</head>
<body style="background-color:#95a5a6">
    <div id="main-wrapper" align="center">
        <p>Welcome Page</p>
        <h2>Welcome 
            <?php echo $_SESSION['username']?>
        </h2>
        <!-- Form of input data-->
        <form action="index.php" method="post">
            <input type="submit" id="logOutButton" value="Log Out"/>
        </form>
        
    </div>
    <div id="resultDiv" align="center"></div>

</body>
</html>