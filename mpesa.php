<?php
include 'components/connect.php';

session_start();

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
} else {
    $user_id = '';
    header('location:user_login.php');
};

//YOU MPESA API KEYS
$consumerKey = "Bl3k44anQFWSILWoDTCIZs2q9QllDv3j"; //Fill with your app Consumer Key
$consumerSecret = "TGAjfR5yslt7cqv8"; //Fill with your app Consumer Secret
//ACCESS TOKEN URL
$access_token_url = 'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials';
$headers = ['Content-Type:application/json; charset=utf8'];
$curl = curl_init($access_token_url);
curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($curl, CURLOPT_HEADER, FALSE);
curl_setopt($curl, CURLOPT_USERPWD, $consumerKey . ':' . $consumerSecret);
$result = curl_exec($curl);
$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
$result = json_decode($result);
$access_token = $result->access_token;
curl_close($curl);

date_default_timezone_set('Africa/Nairobi');
$processrequestUrl = 'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';
$callbackurl = 'https://1c95-105-161-14-223.ngrok-free.app/MPEsa-Daraja-Api/callback.php';
$passkey = "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919";
$BusinessShortCode = '174379';
$Timestamp = date('YmdHis');
$stkpushheader = ['Content-Type:application/json', 'Authorization:Bearer ' . $access_token];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $money = $_POST['money'];
    $phone = $_POST['phone'];

    // ENCRYPT DATA TO GET PASSWORD
    $Password = base64_encode($BusinessShortCode . $passkey . $Timestamp);

    // INITIATE CURL
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $processrequestUrl);
    curl_setopt($curl, CURLOPT_HTTPHEADER, $stkpushheader); // setting custom header
    $curl_post_data = array(
        // Fill in the request parameters with valid values
        'BusinessShortCode' => $BusinessShortCode,
        'Password' => $Password,
        'Timestamp' => $Timestamp,
        'TransactionType' => 'CustomerPayBillOnline',
        'Amount' => $money,
        'PartyA' => $phone,
        'PartyB' => $BusinessShortCode,
        'PhoneNumber' => $phone,
        'CallBackURL' => $callbackurl,
        'AccountReference' => 'Duka',
        'TransactionDesc' => 'Lipa na mpesa'
    );

    $data_string = json_encode($curl_post_data);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
    $curl_response = curl_exec($curl);

    // ECHO RESPONSE
    $data = json_decode($curl_response);
    $CheckoutRequestID = $data->CheckoutRequestID;
    $ResponseCode = $data->ResponseCode;
    if ($ResponseCode == "0") {
        $message = "Payment Successful"; // Set your error message here
        echo "<script>alert('" . addslashes($message) . "'); window.location.href = 'orders.php';</script>";
        exit;
    }
    curl_close($curl);

    /*try {
        $db_name = 'mysql:host=localhost;dbname=shop_db';
        $user_name = 'root';
        $user_password = '';
        $conn = new PDO("dbname=$db_name", $user_name, $user_name);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Process callback response
        $stkCallbackResponse = file_get_contents('php://input');
        $data = json_decode($stkCallbackResponse);

        $MerchantRequestID = $data->Body->stkCallback->MerchantRequestID;
        $CheckoutRequestID = $data->Body->stkCallback->CheckoutRequestID;
        $ResultCode = $data->Body->stkCallback->ResultCode;
        $Amount = $data->Body->stkCallback->CallbackMetadata->Item[0]->Value;
        $TransactionId = $data->Body->stkCallback->CallbackMetadata->Item[1]->Value;
        $UserPhoneNumber = $data->Body->stkCallback->CallbackMetadata->Item[4]->Value;

        // Check if the transaction was successful
        if ($ResultCode == 0) {
            // Insert transaction details into the database using prepared statement
            $stmt = $conn->prepare("INSERT INTO transactions (MerchantRequestID, CheckoutRequestID, ResultCode, Amount, MpesaReceiptNumber, PhoneNumber) VALUES (?, ?, ?, ?, ?, ?)");
            $stmt->execute([$MerchantRequestID, $CheckoutRequestID, $ResultCode, $Amount, $TransactionId, $UserPhoneNumber]);

            $message = "Payment Successful"; // Set your error message here
            echo "<script>alert('" . addslashes($message) . "'); window.location.href = 'orders.php';</script>";
            exit;
        }
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }*/
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mpesa</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">
    <style>
        .container {
            text-align: center;
        }

        .container img {
            vertical-align: middle;
        }
    </style>
</head>

<body>

    <?php include 'components/user_header.php'; ?>
    <div class="container">
        <img src="images/Mpesa.png" style="width:500px">
    </div>
    <div class="display-orders">
        <?php
        $user_id = $_SESSION['user_id'];

        $select_orders = $conn->prepare("SELECT total_products, total_price FROM orders WHERE user_id = ?");
        $select_orders->execute([$user_id]);

        if ($select_orders->rowCount() > 0) {
            $orders_data = $select_orders->fetch(PDO::FETCH_ASSOC);

            $total_products = $orders_data['total_products'];
            $grand_total = $orders_data['total_price'];

            echo '<p>Total Products: ' . $total_products . '</p>';
            echo '<p>Total Price: Ksh' . $grand_total . '/-</p>';
        } else {
            echo '<p class="empty">No orders found for this user.</p>';
        }
        ?>
    </div>
    <section class="form-container">
        <form method="post" action="">
            <p>Amount:</p>
            <input type="text" name="money" id="money" class="box" required><br><br>

            <p>Phone Number:</p>
            <input type="text" name="phone" id="phone" class="box" required><br><br>

            <button class="btn" type="submit">Submit</button>
        </form>
    </section>

    <?php include 'components/footer.php'; ?>

</body>

</html>