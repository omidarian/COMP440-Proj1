<?php
    include('config.php');
		$username = $_POST['user'];  
		$password = $_POST['pass'];  
      
        //to prevent from mysqli injection  
        /* $username = stripcslashes($username);   */
        /* $password = stripcslashes($password);   */
        /* $username = $mysqli->escape_string($username);   */
		/* $password = mysqli_escape_string($password); */
        /* $password = mysqli_escape_string(password_hash($password, PASSWORD_BCRYPT));  */
		/* $hash = mysqli_escape_string(md5( rand(0,1000))); */
      
        $result = "select *from users where username = '$username'";  
        $count = mysqli_num_rows(mysqli_query($con, $result));
		if ( $count > 0){
			$SESSION['message'] = 'Username already exists!';
			echo 'username already exists!';
			die;
		}
		else{
			$sql = "INSERT INTO users "." VALUES ('$username', '$password')";
			if (mysqli_query($con, $sql)) {
				  echo "New record created successfully";
			} else {
				  echo "Error: " . $sql . "<br>" . mysqli_error($con);
			}
		}
		
		//$row = mysqli_fetch_array($result, MYSQLI_ASSOC);  
        $count = mysqli_num_rows(mysqli_query($con, $result));
		
        if($count == 1){  
            echo "<h1><left> Registration successful </left></h1>";  
			require 'welcome.php';
        }  
        else{  
            echo "<h1> Login failed. Invalid username or password.</h1>";  
			echo $count;
        }
?>