<?php
// Load M-Pesa API configuration
include 'components/connect.php'; // This file should contain your API credentials and configurations

if (isset($_POST['mpesa_submit'])) {
    $consumer_key = 'Bl3k44anQFWSILWoDTCIZs2q9QllDv3j';
    $consumer_secret = 'TGAjfR5yslt7cqv8';
    $Business_Code = '174379';
    $Passkey = 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919';
    $Type_of_Transaction = 'CustomerPayBillOnline';
    $Token_URL = 'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials';
    $OnlinePayment = 'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';
    $CallBackURL = 'https://2f50f430.ngrok.io/callback.php?key=your password';
    $phone_number = $_POST['phone_number'];
    $phone_number = preg_replace('/[^0-9]/', '', $phone_number); 
    $phone_number = '+254' . ltrim($phone_number, '0');
    $total_price = $_POST['total_price'];
    $Time_Stamp = date("Ymdhis");
    $password = base64_encode($Business_Code . $Passkey . $Time_Stamp);

    $curl_Token = curl_init();
    curl_setopt($curl_Token, CURLOPT_URL, $Token_URL);
    $credentials = base64_encode($consumer_key . ':' . $consumer_secret);
    curl_setopt($curl_Token, CURLOPT_HTTPHEADER, array('Authorization: Basic ' . $credentials));
    curl_setopt($curl_Token, CURLOPT_HEADER, false);
    curl_setopt($curl_Token, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl_Token, CURLOPT_SSL_VERIFYPEER, false);
    $curl_Token_response = curl_exec($curl_Token);
    $token = json_decode($curl_Token_response)->access_token;

    // Construct STK push request data
    $STKPushData = array(
        'BusinessShortCode' => $Business_Code,
        'Password' => $password,
        'Timestamp' => $Time_Stamp,
        'TransactionType' => $Type_of_Transaction,
        'Amount' => $total_price,
        'PartyA' => $phone_number,
        'PartyB' => $Business_Code,
        'PhoneNumber' => $phone_number,
        'CallBackURL' => $CallBackURL,
        'AccountReference' => 'Duka',
        'TransactionDesc' => 'Lipa na Mpesa',
    );

    $STKPushDataJSON = json_encode($STKPushData);

    // Send STK push request
    $curl_STKPush = curl_init();
    curl_setopt($curl_STKPush, CURLOPT_URL, 'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest');
    curl_setopt($curl_STKPush, CURLOPT_HTTPHEADER, array('Content-Type:application/json', 'Authorization:Bearer ' . $token));
    curl_setopt($curl_STKPush, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl_STKPush, CURLOPT_POST, true);
    curl_setopt($curl_STKPush, CURLOPT_POSTFIELDS, $STKPushDataJSON);
    curl_setopt($curl_STKPush, CURLOPT_SSL_VERIFYPEER, 0);
    curl_setopt($curl_STKPush, CURLOPT_SSL_VERIFYHOST, 0);
    $curl_STKPush_response = json_decode(curl_exec($curl_STKPush), true);


    // Assuming the M-Pesa API response is successful
    $transaction_id = 'generated_transaction_id'; // Replace with actual transaction ID

    // Record the transaction in your database
    // Establish database connection and insert the transaction details
    include 'components/connect.php'; // Include your database connection code

    $insert_transaction = $conn->prepare("INSERT INTO `mpesa_transactions` (user_id, transaction_id, phone_number, total_price) VALUES (?,?,?,?)");
    $insert_transaction->execute([$user_id, $transaction_id, $phone_number, $total_price]);

    // Redirect or display a success message to the user
    header("Location: payment_success.php"); // Redirect to a success page
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Your HTML head content here -->
</head>

<body>
    <!-- Your HTML body content here -->

    <form action="" method="POST">
        <input type="hidden" name="total_price" value="<?= $grand_total; ?>">
        <div class="inputBox">
            <span>Phone Number (for M-Pesa):</span>
            <input type="text" name="phone_number" placeholder="Enter phone number" class="box" required>
        </div>
        <input type="submit" name="mpesa_submit" class="btn <?= ($grand_total > 1) ? '' : 'disabled'; ?>" value="Pay with M-Pesa">
    </form>

    <!-- Your HTML footer content here -->
</body>

</html>