<?php
session_start();
$allMember = $_SESSION["allMember"];
if (isset($_SESSION["username"])) {
    $username = $_SESSION["username"];
    session_write_close();
} else {
    // since the username is not set in session, the user is not-logged-in
    // he is trying to access this page unauthorized
    // so let's clear all session variables and redirect him to index
    session_unset();
    session_write_close();
    $url = "./index.php";
    header("Location: $url");
}

?>
<HTML>
<HEAD>
<TITLE>Welcome</TITLE>
<link href="assets/css/phppot-style.css" type="text/css"
	rel="stylesheet" />
<link href="assets/css/user-registration.css" type="text/css"
	rel="stylesheet" />
</HEAD>
<BODY>
	<div class="phppot-container">
		<div class="page-header">
			<span class="login-signup"><a href="logout.php">Logout</a></span>
		</div>
		<div class="page-content">Welcome <?php echo $username;?></div>
         
        <?php
        $con=mysqli_connect("localhost","root","","facebook implementation");
        $res = mysqli_query($con,"select * from Users");
        $bool=0;
        while ($data = mysqli_fetch_assoc($res)) { 
            echo "<div class='page-content'>",  $name = $data['name'];
            echo  "|", $mobile = $data['email'];
            echo  "|",  $email = $data['phone'];
            echo  "|",  $email = $data['Age'];
            echo "</div>";
        }
    ?>
        </div>
        <?php 
        
        ?>
	</div>
</BODY>
</HTML>
