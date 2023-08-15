<?php

include 'components/connect.php';

session_start();

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
} else {
    $user_id = '';
};

include 'components/wishlist_cart.php';

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coinbase</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

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

    <section>
        <div class="container">
            <img src="images/Coinbase.png" style="width:300px; align-items:center">
            
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
        <div>
        <a class="btn" href="https://commerce.coinbase.com/checkout/43c46134-2613-458a-8c12-bff52637e32d">
                Pay with Crypto
            </a>
            <script src="https://commerce.coinbase.com/v1/checkout.js?version=201807">
            </script>
        </div>
    </section>

    <?php include 'components/footer.php'; ?>

    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <script src="js/script.js"></script>

</body>

</html>