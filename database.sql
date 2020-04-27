-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2020 at 01:51 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id_category_product` int(5) NOT NULL,
  `name_category_product` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id_category_product`, `name_category_product`) VALUES
(1, 'Air isi ulang'),
(2, 'Air isi ulang dengan galon'),
(3, 'Print'),
(4, 'Scan');

-- --------------------------------------------------------

--
-- Table structure for table `customer_feedback`
--

CREATE TABLE `customer_feedback` (
  `id_customer_feedback` int(10) NOT NULL,
  `customer_feedback` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `id_cust_order` int(10) NOT NULL,
  `date_order` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_order_paid` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_order` int(10) NOT NULL,
  `total_price_order` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`id_cust_order`, `date_order`, `date_order_paid`, `status_order`, `total_price_order`) VALUES
(1, '2020-03-12 21:16:47', '2020-03-12 21:16:47', 3, 29888);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id_location` int(10) NOT NULL,
  `latitude_location` float NOT NULL,
  `longitude_location` float NOT NULL,
  `street_name_location` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_shopcart` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  `note` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_cancellation`
--

CREATE TABLE `order_cancellation` (
  `id_order_cancellation` int(15) NOT NULL,
  `time_order_cancellation` datetime NOT NULL,
  `void_order_cancellation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `id_order_history` int(10) NOT NULL,
  `id_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_history`
--

INSERT INTO `order_history` (`id_order_history`, `id_order`) VALUES
(220010101, 220010101),
(220010101, 220010101);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `id_customer_order` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `nominal` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_exp_time` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id_payment`, `id_customer_order`, `payment_method`, `nominal`, `payment_date`, `payment_exp_time`, `payment_status`) VALUES
(1212, 1212, 1212, 1212, '2020-04-24 08:44:38', 121, 11),
(13131, 12, 232, 213, '2020-04-07 00:00:00', 323, 1323),
(130420, 0, 0, 999021, '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(5) NOT NULL,
  `provider_product` varchar(100) DEFAULT NULL,
  `name_product` varchar(30) NOT NULL,
  `expired_date` date NOT NULL,
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `provider_product`, `name_product`, `expired_date`, `date_in`, `date_out`, `quantity`, `price`) VALUES
(1101, NULL, 'Air Galon Aqua', '2020-05-01', '2020-03-02', '0000-00-00', 25, 17500),
(1102, NULL, 'Air Galon Ake', '2020-05-01', '2020-03-02', '0000-00-00', 15, 15000),
(1103, NULL, 'Air Galon Aqua + Galon', '2020-05-01', '2020-03-02', '0000-00-00', 25, 90000);

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id_promotion` int(10) NOT NULL,
  `name_promotion` varchar(10) NOT NULL,
  `from_promotion` datetime NOT NULL,
  `to_promotion` datetime NOT NULL,
  `content_promotion` varchar(100) NOT NULL,
  `amount_promotion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id_rating` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `rating_range` int(11) NOT NULL,
  `comment` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id_service` int(15) NOT NULL,
  `name_service` varchar(30) NOT NULL,
  `provider_service` varchar(30) NOT NULL,
  `provider_type_service` varchar(30) NOT NULL,
  `provider_service_group` varchar(100) NOT NULL,
  `time_booking_service` time(6) NOT NULL,
  `duration_service` time(6) NOT NULL,
  `service_description` varchar(100) NOT NULL,
  `price_service` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id_service`, `name_service`, `provider_service`, `provider_type_service`, `provider_service_group`, `time_booking_service`, `duration_service`, `service_description`, `price_service`) VALUES
(1446, 'Self Nail #1', '202100003', '180', '# Gaoel', '00:00:00.000000', '00:00:00.000000', '', 30000),
(11101, 'Make Up', '202100002', '01', '#Make Up', '00:00:00.000000', '00:00:00.000000', '', 50000),
(12102, 'Blow', '202100002', '01', '#Perawatan', '00:00:00.000000', '00:00:00.000000', 'Blow cepat dengan kipas angin tenaga nuklir', 75000);

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `id_service_type` int(15) NOT NULL,
  `name_service_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id_shopcart` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_service_product` int(11) NOT NULL,
  `shopcart_qty` int(11) NOT NULL DEFAULT '0',
  `shopcart_price` int(11) NOT NULL,
  `shopcart_price_total` int(11) NOT NULL DEFAULT '0',
  `shopcart_note` varchar(100) NOT NULL,
  `shopping_cart_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopping_cart`
--

INSERT INTO `shopping_cart` (`id_shopcart`, `id_user`, `id_service_product`, `shopcart_qty`, `shopcart_price`, `shopcart_price_total`, `shopcart_note`, `shopping_cart_status`) VALUES
(2841789, 2020001, 1446, 1, 30000, 30000, 'Sesuai pesanan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(8) NOT NULL,
  `name_user` varchar(50) NOT NULL,
  `email_user` varchar(25) NOT NULL,
  `phone_num_user` varchar(15) NOT NULL,
  `pic_user` varchar(200) NOT NULL,
  `user_type` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `user_vendor_type` int(11) DEFAULT NULL,
  `user_vendor_online` int(11) NOT NULL DEFAULT '0',
  `vendor_short_desc` varchar(50) DEFAULT NULL,
  `regis_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `email_user`, `phone_num_user`, `pic_user`, `user_type`, `balance`, `user_vendor_type`, `user_vendor_online`, `vendor_short_desc`, `regis_date`) VALUES
(20100001, 'Clementine', 'clem@user.com', '081234567898', '/usr/20100001/prof_pic.jpg', 1, 50000, NULL, 0, NULL, '2020-03-08'),
(20200001, 'Marcelino', 'pasuhuk@print.com', '087654332123', '/usr/20200001/prof_pic.jpg', 1, 10000, NULL, 0, NULL, '2020-03-09'),
(202100002, 'Stark Spa', 'stark_spa@yahoo.co.id', '08823335555', 'https://images.unsplash.com/photo-1587802480811-4be6efcdf373?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80', 2, 10000, 180, 1, 'Make up and Little Spa', '2020-04-15'),
(202100003, 'Evan Spa', 'evans@gmail.com', '02932932', 'https://images.unsplash.com/photo-1587802480811-4be6efcdf373?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80\r\n\r\n', 2, 10000, 180, 1, 'Salon', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id_user_type` int(11) NOT NULL,
  `name_user_type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id_user_type`, `name_user_type`) VALUES
(1, 'customer'),
(2, 'vendor'),
(3, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id_category_product`);

--
-- Indexes for table `customer_feedback`
--
ALTER TABLE `customer_feedback`
  ADD PRIMARY KEY (`id_customer_feedback`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`id_cust_order`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`);

--
-- Indexes for table `order_cancellation`
--
ALTER TABLE `order_cancellation`
  ADD PRIMARY KEY (`id_order_cancellation`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id_promotion`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id_rating`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`id_service_type`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id_shopcart`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id_user_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id_category_product` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `id_cust_order` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id_user_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
