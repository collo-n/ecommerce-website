<?php
include 'components/connect.php';
session_start();

if(isset($_SESSION['user_id'])){
    $user_id = $_SESSION['user_id'];
 }else{
    $user_id = '';
 };

if(isset($_POST['object']) && $_POST['object'] == 'forgot') {
    $email = $_POST['email'];
    $conn = mysqli_connect('localhost', 'root', '', 'shop_db');

    // Check if email exists in the database
    $check_query = "SELECT * FROM `users` WHERE email = '$email'";
    $check_result = mysqli_query($conn, $check_query);

    if(mysqli_num_rows($check_result) > 0) { // Email exists
        if($_POST['newpassword'] == $_POST['confirmpassword']) {
            $password = $_POST['newpassword']; // Fetch the new password
            $hash = sha1($password); // Hash the password using sha1

            $update = "UPDATE `users` SET `password` = '$hash' WHERE email = '$email' ";
            $result = mysqli_query($conn, $update);

            $error_message = "Your new password has reset successfully, you can now login."; // Set your error message here
            echo "<script>alert('" . addslashes($error_message) . "'); window.location.href = 'user_login.php';</script>";
            exit;
        } else {
            $error_message = "Password does not match"; // Set your error message here
            echo "<script>alert('" . addslashes($error_message) . "'); window.location.href = 'forgetpass.php';</script>";
            exit;
        }
    } else {
        $error_message = "Email does not exist"; // Set your error message here
        echo "<script>alert('" . addslashes($error_message) . "'); window.location.href = 'forgetpass.php';</script>";
        exit; // Make sure to exit after redirect
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Forgot Password</title>
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">
</head>
<body> 
<?php include 'components/user_header.php'; ?>

<section class="form-container">
    <form class="form-signin" method="post">       
        <h2>Forgot Password</h2><br/>
            <input type="email" class="box" name="email" placeholder="Email Your Username" required="" autofocus="" />
        <br/>
        <input type="password" class="box" name="newpassword" placeholder="New Password" required=""/><br/>
        <input type="password" class="box" name="confirmpassword" placeholder="Confirm New Password" required=""/>
        <br/>
        <button class="btn" type="submit">Submit</button>   
        <input type="hidden" name="object" value="forgot"/>
    </form>
</section>

<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>
