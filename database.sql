-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Mar 2020 pada 15.43
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppl`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_product`
--

CREATE TABLE `category_product` (
  `id_category_product` int(5) NOT NULL,
  `name_category_product` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category_product`
--

INSERT INTO `category_product` (`id_category_product`, `name_category_product`) VALUES
(1, 'Air isi ulang'),
(2, 'Air isi ulang dengan galon'),
(3, 'Print'),
(4, 'Scan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_feedback`
--

CREATE TABLE `customer_feedback` (
  `id_customer_feedback` int(10) NOT NULL,
  `customer_feedback` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_order`
--

CREATE TABLE `customer_order` (
  `id_cust_order` int(10) NOT NULL,
  `date_order` datetime NOT NULL DEFAULT current_timestamp(),
  `date_order_paid` datetime NOT NULL DEFAULT current_timestamp(),
  `status_order` int(10) NOT NULL,
  `total_price_order` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer_order`
--

INSERT INTO `customer_order` (`id_cust_order`, `date_order`, `date_order_paid`, `status_order`, `total_price_order`) VALUES
(1, '2020-03-12 21:16:47', '2020-03-12 21:16:47', 3, 29888);

-- --------------------------------------------------------

--
-- Struktur dari tabel `location`
--

CREATE TABLE `location` (
  `id_location` int(10) NOT NULL,
  `latitude_location` float NOT NULL,
  `longitude_location` float NOT NULL,
  `street_name_location` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_cancellation`
--

CREATE TABLE `order_cancellation` (
  `id_order_cancellation` int(15) NOT NULL,
  `time_order_cancellation` datetime NOT NULL,
  `void_order_cancellation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_history`
--

CREATE TABLE `order_history` (
  `id_order_history` int(10) NOT NULL,
  `id_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `order_history`
--

INSERT INTO `order_history` (`id_order_history`, `id_order`) VALUES
(220010101, 220010101);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id_product` int(5) NOT NULL,
  `name_product` varchar(30) NOT NULL,
  `expired_date` date NOT NULL,
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id_product`, `name_product`, `expired_date`, `date_in`, `date_out`, `quantity`, `price`) VALUES
(1101, 'Air Galon Aqua', '2020-05-01', '2020-03-02', '0000-00-00', 25, 17500),
(1102, 'Air Galon Ake', '2020-05-01', '2020-03-02', '0000-00-00', 15, 15000),
(1103, 'Air Galon Aqua + Galon', '2020-05-01', '2020-03-02', '0000-00-00', 25, 90000);

-- --------------------------------------------------------
 --
-- Struktur dari tabel `promotion`
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
-- Struktur dari tabel `service`
--

CREATE TABLE `service` (
  `id_service` int(15) NOT NULL,
  `name_service` varchar(30) NOT NULL,
  `provider_service` varchar(30) NOT NULL,
  `provider_type_service` varchar(30) NOT NULL,
  `time_booking_service` time(6) NOT NULL,
  `duration_service` time(6) NOT NULL,
  `price_service` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_type`
--

CREATE TABLE `service_type` (
  `id_service_type` int(15) NOT NULL,
  `name_service_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(8) NOT NULL,
  `name_user` varchar(50) NOT NULL,
  `email_user` varchar(25) NOT NULL,
  `phone_num_user` varchar(15) NOT NULL,
  `pic_user` varchar(100) NOT NULL,
  `user_type` int(11) NOT NULL,
  `regis_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `email_user`, `phone_num_user`, `pic_user`, `user_type`, `regis_date`) VALUES
(20100001, 'Clementine', 'clem@user.com', '081234567898', '/usr/20100001/prof_pic.jpg', 1, '2020-03-08'),
(20200001, 'Marcelino', 'pasuhuk@print.com', '087654332123', '/usr/20200001/prof_pic.jpg', 1, '2020-03-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_type`
--

CREATE TABLE `user_type` (
  `id_user_type` int(11) NOT NULL,
  `name_user_type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_type`
--

INSERT INTO `user_type` (`id_user_type`, `name_user_type`) VALUES
(1, 'customer'),
(2, 'vendor'),
(3, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id_category_product`);

--
-- Indeks untuk tabel `customer_feedback`
--
ALTER TABLE `customer_feedback`
  ADD PRIMARY KEY (`id_customer_feedback`);

--
-- Indeks untuk tabel `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`id_cust_order`);

--
-- Indeks untuk tabel `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`);

--
-- Indeks untuk tabel `order_cancellation`
--
ALTER TABLE `order_cancellation`
  ADD PRIMARY KEY (`id_order_cancellation`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Indeks untuk tabel `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id_promotion`);

--
-- Indeks untuk tabel `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- Indeks untuk tabel `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`id_service_type`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id_user_type`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id_category_product` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `id_cust_order` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id_user_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
