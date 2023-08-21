-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2023 at 10:32 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 1, 'test', 'test@gmail.com', '0714802596', 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 1, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, qwetu apartment, 2nd floor, door 12, westlands, Nairobi, Kenya - 00200', 'Blender (10000 x 1) - ', 10000, '2023-07-12', 'completed'),
(2, 1, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'cypto-currency', 'flat no. 62157 – 00200, Nairobi, Kenya, Catholic university, Karen, Nairobi, Kenya - 00200', 'Camera (45000 x 1) - ', 45000, '2023-07-12', 'completed'),
(3, 1, 'Collins Kaiser', '0714802596', 'collinskaiser@outlook.com', 'Mpesa', 'flat no. 40200-356, qwetu apartment, 2nd floor, door 12, Kisii, Nairobi, Kenya - 00100', 'Fridge (50000 x 1) - ', 50000, '2023-08-09', 'completed'),
(4, 1, 'Collins Kaiser Nyach', '0714802596', 'collinsnyachoti@gmail.com', '', 'flat no. 62157 – 00200, Nairobi, Kenya, qwetu apartment, 2nd floor, door 12, Nairobi, Nairobi, Kenya - 00200', 'Blender (10000 x 1) - ', 10000, '2023-08-09', 'pending'),
(5, 1, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, wdwdwdw, Nairobi, Nairobi, Kenya - 00200', 'Camera (45000 x 1) - ', 45000, '2023-08-11', 'pending'),
(6, 1, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, dsds, Nairobi, Nairobi, Kenya - 00200', 'Camera (45000 x 1) - ', 45000, '2023-08-11', 'pending'),
(7, 1, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, ssass, Nairobi, Nairobi, Kenya - 00200', 'Blender (10000 x 1) - ', 10000, '2023-08-11', 'pending'),
(8, 1, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'cash on delivery', 'flat no. 62157 – 00200, Nairobi, Kenya, qwqwq, Nairobi, Nairobi, Kenya - 00200', 'Blender (10000 x 1) - ', 10000, '2023-08-11', 'pending'),
(9, 1, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, erre, Nairobi, Nairobi, Kenya - 00200', 'Blender (10000 x 1) - ', 10000, '2023-08-13', 'pending'),
(10, 1, 'Collins Kaiser Nyach', '0793689008', 'collinskaiser@outlook.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, eeee, Nairobi, Nairobi, Kenya - 00200', 'Blender (10000 x 1) - ', 10000, '2023-08-13', 'pending'),
(11, 1, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, fcftf, Nairobi, Nairobi, Kenya - 00200', 'Fridge (50000 x 1) - ', 50000, '2023-08-14', 'pending'),
(12, 1, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, fffff, Nairobi, Nairobi, Kenya - 00200', 'Blender (10000 x 1) - ', 10000, '2023-08-14', 'completed'),
(13, 1, 'Collins Nyachoti', '0714802596', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. Catholic university of East Africa, mnmknmk, Nairobi, Nairobi, Kenya - 00100', 'Camera (45000 x 1) - ', 45000, '2023-08-14', 'pending'),
(14, 1, 'Collins Kaiser', '0793689008', 'collinsnyachoti@gmail.com', 'cash on delivery', 'flat no. 62157 – 00200, Nairobi, Kenya, qwetu apartment, 2nd floor, door 12, Nairobi, Nairobi, Kenya - 00200', 'Asus Laptop (130000 x 1) - ', 130000, '2023-08-15', 'pending'),
(15, 1, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, qwetu apartment, 2nd floor, door 12, Nairobi, Nairobi, Kenya - 00200', 'Camera (45000 x 1) - ', 45000, '2023-08-15', 'pending'),
(16, 2, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, qwetu apartment, 2nd floor, door 12, Nairobi, Nairobi, Kenya - 00200', 'Blender (10000 x 1) - ', 10000, '2023-08-15', 'pending'),
(17, 2, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, qwetu apartment, 2nd floor, door 12, Nairobi, Nairobi, Kenya - 00200', 'Blender (10000 x 1) - ', 10000, '2023-08-15', 'pending'),
(18, 2, 'Collins Kaiser', '0714802596', 'collinskaiser@outlook.com', 'cypto-currency', 'flat no. 40200-356, qwetu apartment, 2nd floor, door 12, Kisii, Nairobi, Kenya - 2134', 'VERSACE Dylos Automatic Watch (114872 x 1) - ', 114872, '2023-08-16', 'pending'),
(19, 2, 'Collins Nyachoti', '0714802596', 'collinsnyachoti@gmail.com', 'cypto-currency', 'flat no. Catholic university of East Africa, qwetu apartment, 2nd floor, door 12, Nairobi, Nairobi, Kenya - 00100', 'Blender (10000 x 1) - ', 10000, '2023-08-16', 'pending'),
(20, 2, 'Collins Kaiser', '0714802596', 'collinskaiser@outlook.com', 'cypto-currency', 'flat no. 40200-356, qwetu apartment, 2nd floor, door 12, Kisii, Nairobi, Kenya - 10233', 'Blender (10000 x 1) - ', 10000, '2023-08-16', 'pending'),
(21, 2, 'Jackline Nyaboke', '0793689008', 'collinsnyachoti@gmail.com', 'cypto-currency', 'flat no. 62157 – 00200, Nairobi, Kenya, 1234, Nairobi, Nairobi, Kenya - 00200', 'Fridge (50000 x 1) - ', 50000, '2023-08-16', 'pending'),
(22, 2, 'Collins Nyachoti', '0714802596', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. Catholic university of East Africa, 1234, Nairobi, Nairobi, Kenya - 00100', 'Blender (10000 x 1) - ', 10000, '2023-08-16', 'pending'),
(23, 2, 'Collins Kaiser', '0714802596', 'collinskaiser@outlook.com', 'crypto-currency', 'flat no. 40200-356, qwetu apartment, 2nd floor, door 12, Kisii, Nairobi, Kenya - 00200', 'Samsung TV (80468 x 1) - ', 80468, '2023-08-16', 'pending'),
(24, 2, 'Collins Kaiser Nyach', '0793689008', 'collinskaiser@outlook.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, qwetu apartment, 2nd floor, door 12, Nairobi, Nairobi, Kenya - 00200', 'Blender (10000 x 1) - Fridge (50000 x 1) - ', 60000, '2023-08-16', 'pending'),
(25, 2, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'crypto-currency', 'flat no. 62157 – 00200, Nairobi, Kenya, qwetu apartment, 2nd floor, door 12, Nairobi, Nairobi, Kenya - 00200', 'Camera (45000 x 1) - SAMSUNG Galaxy S23 Ultra Cell Phone (143806 x 1) - ', 188806, '2023-08-16', 'pending'),
(26, 2, 'Collins Kaiser Nyach', '0793689008', 'collinsnyachoti@gmail.com', 'mpesa', 'flat no. 62157 – 00200, Nairobi, Kenya, qwetu apartment, 2nd floor, door 12, Nairobi, Nairobi, Kenya - 00200', 'Fridge (50000 x 1) - ', 50000, '2023-08-16', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(1, 'Camera', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 45000, 'camera-1.webp', 'camera-2.webp', 'camera-3.webp'),
(2, 'Blender', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 10000, 'mixer-1.webp', 'mixer-2.webp', 'mixer-2.webp'),
(3, 'Fridge', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 50000, 'fridge-1.webp', 'fridge-3.webp', 'fridge-2.webp'),
(4, 'Asus Laptop', 'ASUS ROG Strix G15 G513IC-HN004W, AMD Ryzen 7 4800H, 16GB DDR4 3200, 512GB PCIe 3.0 NVMe M.2 SSD, NVIDIA GeForce RTX 3050 4GB GDDR6 Graphics, Windows 11 Home, 15.6&#34; FHD 144Hz, No ODD, Wi-Fi 6 (802.11ax) (Dual band) 2*2 + Bluetooth 5.1, Backlit Chiclet Keyboard 4-Zone RGB, Aura Sync Light Bar, Eclipse Gray, 1 Year Warranty, Ports: One USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC, Three USB 3.2 Gen 1 Type-A, One HDMI 2.0b, One 3.5mm Combo Audio Jack - 90NR0502-M003M0', 130000, 'Asus.jpeg', 'Asus1.jpeg', 'Asus2.jpeg'),
(5, 'VERSACE Dylos Automatic Watch', 'Package Dimensions ‏ : ‎ 6.42 x 6.3 x 5.08 inches; 6.46 Ounces\r\nItem model number ‏ : ‎ VAG020016\r\nDepartment ‏ : ‎ Mens\r\nDate First Available ‏ : ‎ September 21, 2016\r\nManufacturer ‏ : ‎ Versace\r\nASIN ‏ : ‎ B01LZK2UZ8', 114872, 'watch.jpg', 'watch2.jpg', 'watch3.jpg'),
(6, 'SAMSUNG Galaxy S23 Ultra Cell Phone', 'CAPTURE THE NIGHT IN LOW LIGHT: Whether you’re headed to a concert or romantic night out, there’s no such thing as bad lighting with Night Mode; Galaxy S23 Ultra lets you capture epic content in any setting with stunning Nightography.Aperture - Rear: 200MP (f/1.7), 12MP (f/2.2), 10MP (f/2.4), 10MP (f/4.9), Front: 12MP (f/2.2). Flaw Detection : Yes. Wireless Powershare : Yes.\r\nHIGHEST PHONE CAMERA RESOLUTION: Create crystal-clear content worth sharing with Galaxy S23 Ultra’s 200MP camera — the hi', 143806, 'phone.jpg', 'phone2.jpg', 'phone.jpg'),
(7, 'Samsung TV', '\r\nScreen Size	55 Inches\r\nBrand	SAMSUNG\r\nSupported Internet Services	Browser\r\nDisplay Technology	LED\r\nProduct Dimensions	2.4&#34;D x 48.4&#34;W x 27.8&#34;H\r\nResolution	4K\r\nRefresh Rate	60 Hz\r\nSpecial Feature	Hybrid Log Gamma, Film Mode, UHD Mastering Engine, Closed Caption, Clock Backup Supply, LYNK REACH 4.0, Contrast Enhancer, PurColor, Auto Channel Search, Auto Motion Plus, Audio Return Channel (ARC), Wake-up Timer, Energy Saving Mode, Parental Control, Music Player, Auto Power Off, Connect S', 80468, 'tv.jpg', 'tv2.jpg', 'tv3.jpg'),
(8, 'ASUS ROG Gaming Mouse', 'Brand	ASUS\r\nColor	BLACK\r\nConnectivity Technology	Bluetooth, USB, Radio Frequency\r\nSpecial Feature	ROG AIMPOINT OPTICAL SENSOR, 54 G ULTRALIGHT DESIGN, ROG SPEEDNOVA WIRELESS TECHNOLOGY\r\nMovement Detection Technology', 14251, 'mouse.jpg', 'mouse1.jpg', 'mouse2.jpg'),
(9, 'INTERGREAT Portable Washing Machine', 'Easy Operation&Glass Cover】: Adopt simplest operation panel--Separate washer and spin time control and 2 washing selection( Gentle, Normal according to your quantity of clothes). Compared to plastic cover, the glass cover of small washer make it more study, delicate, more clear to check working process\r\n【Large Capacity and Powerful】: Mini lavadora, but large capacity. 8 lbs for washer and 7 lbs for spin tub, what’s more, the spin tub is made of stainless steel, for long term use. Also, our apart', 19433, 'machine.jpg', 'machine1.jpg', 'machine2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `ID` int(11) NOT NULL,
  `MerchantRequestID` varchar(500) NOT NULL,
  `CheckoutRequestID` varchar(500) NOT NULL,
  `ResultCode` varchar(500) NOT NULL,
  `Amount` int(11) NOT NULL,
  `MpesaReceiptNumber` varchar(500) NOT NULL,
  `PhoneNumber` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'test', 'test@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(2, '123', '123@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(3, '1', '2@gmail.com', '356a192b7913b04c54574d18c28d46e6395428ab');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
