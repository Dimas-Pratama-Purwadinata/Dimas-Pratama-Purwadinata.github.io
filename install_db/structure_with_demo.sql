-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2020 at 05:26 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `structure_with_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_details`
--

CREATE TABLE `category_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(120) NOT NULL,
  `category_description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_details`
--

INSERT INTO `category_details` (`id`, `category_name`, `category_description`) VALUES
(20, 'Bibit Buah', 'Apel'),
(21, 'Bibit Buah', 'Anggur'),
(22, 'Bibit Buah', 'Mangga'),
(23, 'Bibit Sayur', 'Bayam'),
(24, 'Bibit Sayur', 'Brokoli'),
(25, 'Bibit Sayur', 'Buncis'),
(26, 'Bibit Buah', 'Jambu'),
(27, 'Bibit Buah', 'Duku'),
(28, 'Bibit Herba', 'Basil'),
(29, 'Bibit Herba', 'Sage'),
(30, 'Bibit Herba', 'Mint'),
(31, 'Bibit Sayur', 'Bawang'),
(32, 'Bibit Buah', 'Delima'),
(33, 'Bibit Buah', 'Jeruk'),
(34, 'Bibit Herba', 'Kucai'),
(35, 'Bibit Sayur', 'Cabe'),
(36, 'Bulk Sayur', 'Kubis');

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `customer_address` varchar(500) NOT NULL,
  `customer_contact1` varchar(100) NOT NULL,
  `customer_contact2` varchar(100) DEFAULT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`id`, `customer_name`, `customer_address`, `customer_contact1`, `customer_contact2`, `balance`) VALUES
(8, 'Nafis', 'Perumahan Tegal Besar No. 26', '7787876786', '989898988', 0),
(9, 'Nadhif', 'Jalan Jawa III No. 10', '7787876786', '989898988', 0),
(10, 'Romi', 'Perumahan Pondok Indah No. 11', '7787876786', '989898988', 0),
(11, 'Bambang', 'Jalan Rambutan IV No. 30', '7787876786', '989898988', 0),
(12, 'Edi', 'Perumahan Gunung Batu Indah No. 23', '7787876786', '989898988', 0),
(13, 'Rizki', 'Perumahan Taman Gading No. 08', '7787876786', '989898988', 80),
(14, 'Samsul', 'Perumahan Muktisari Blok AB 07', '7787876786', '989898988', 6240),
(15, 'Dhafin', 'Jalan Kalimantan II No. 04', '7787876786', '989898988', 0),
(16, 'Joko', 'Perumahan Permata Blok BB 07', '7787876786', '989898988', 1810),
(17, 'Muklis', 'Jalan Mangga Manis III No. 19', '7787876786', '989898988', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock_avail`
--

CREATE TABLE `stock_avail` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_avail`
--

INSERT INTO `stock_avail` (`id`, `name`, `quantity`) VALUES
(22, 'Cello griper', 29),
(23, 'techo tip', 90),
(24, 'cello', 22),
(25, 'ceParker Urban Fashion ', 20),
(26, 'Satzuma Diamante Pen', 20),
(27, 'Lamy Mod 17 Safari Matt ...', 30);

-- --------------------------------------------------------

--
-- Table structure for table `stock_details`
--

CREATE TABLE `stock_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `stock_id` varchar(120) NOT NULL,
  `stock_name` varchar(120) NOT NULL,
  `stock_quatity` int(11) NOT NULL,
  `supplier_id` varchar(250) NOT NULL,
  `company_price` decimal(10,2) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `category` varchar(120) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expire_date` datetime NOT NULL,
  `uom` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_details`
--

INSERT INTO `stock_details` (`id`, `stock_id`, `stock_name`, `stock_quatity`, `supplier_id`, `company_price`, `selling_price`, `category`, `date`, `expire_date`, `uom`) VALUES
(34, 'ST1', 'Apel', 0, 'arjun', '9.00', '10.00', 'Bibit Buah', '2013-08-15 03:01:01', '2020-12-30 00:00:00', ''),
(35, 'ST35', 'Anggur', 0, 'sadham', '8.00', '10.00', 'Bibit Buah', '2013-08-15 03:01:50', '2020-12-30 00:00:00', ''),
(36, 'ST36', 'Mint', 0, 'sadham', '7.00', '10.00', 'Bibit Herba', '2013-08-15 03:02:08', '2020-12-30 00:00:00', ''),
(37, 'ST37', 'Bayam', 0, 'Bibit Sayur', '1000.00', '1100.00', 'pen', '2013-08-15 03:03:30', '2020-12-30 00:00:00', ''),
(38, 'ST38', 'Cabe', 0, 'Bibit Sayur', '500.00', '550.00', 'pen', '2013-08-15 03:03:52', '2020-12-30 00:00:00', ''),
(39, 'ST39', 'Brokoli', 0, 'Bibit Sayur', '1980.00', '2000.00', 'pen', '2013-08-15 03:04:17', '2020-12-30 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `stock_entries`
--

CREATE TABLE `stock_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `stock_id` varchar(120) NOT NULL,
  `stockidnumber` int(11) NOT NULL,
  `stock_name` varchar(260) NOT NULL,
  `stock_supplier_name` varchar(200) NOT NULL,
  `category` varchar(120) NOT NULL,
  `quantity` int(11) NOT NULL,
  `company_price` decimal(10,2) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `opening_stock` int(11) NOT NULL,
  `closing_stock` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `username` varchar(120) NOT NULL,
  `type` varchar(50) NOT NULL,
  `salesid` varchar(120) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `mode` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `due` datetime NOT NULL,
  `subtotal` int(11) NOT NULL,
  `count1` int(11) NOT NULL,
  `billnumber` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_entries`
--

INSERT INTO `stock_entries` (`id`, `stock_id`, `stockidnumber`, `stock_name`, `stock_supplier_name`, `category`, `quantity`, `company_price`, `selling_price`, `opening_stock`, `closing_stock`, `date`, `username`, `type`, `salesid`, `total`, `payment`, `balance`, `mode`, `description`, `due`, `subtotal`, `count1`, `billnumber`) VALUES
(261, 'PR261', 261, 'Apel', 'arjun', '', 1000, '9.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '9000.00', '9000.00', '0.00', 'cheque', 'uouo', '2020-12-30 00:00:00', 9000, 1, 'BILL-126'),
(262, 'PR262', 262, 'Anggur', 'ram', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '2020-12-30 00:00:00', 8000, 1, 'BILL-126'),
(263, 'PR263', 263, 'Jeruk', 'Monish', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '2020-12-30 00:00:00', 8000, 1, 'BILL-126'),
(264, 'PR264', 264, 'Mint', 'vignesh', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '2020-12-30 00:00:00', 8000, 1, 'BILL-126'),
(265, 'PR265', 265, 'Brokoli', 'Monish', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '2020-12-30 00:00:00', 8000, 1, 'BILL-126'),
(266, 'PR266', 266, 'Bayam', 'ram', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '2020-12-30 00:00:00', 8000, 1, 'BILL-126'),
(267, 'PR267', 267, 'Cabe', 'Monish', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '2020-12-30 00:00:00', 8000, 1, 'BILL-126'),
(268, 'PR268', 268, 'Bawang', 'satheesh', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '2020-12-30 00:00:00', 8000, 1, 'BILL-126'),
(269, 'PR269', 269, 'Sage', 'Monish', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '2020-12-30 00:00:00', 8000, 1, 'BILL-126'),
(270, 'PR270', 270, 'Basil', 'sadham', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '2020-12-30 00:00:00', 8000, 1, 'BILL-127'),
(271, 'PR271', 271, 'Mangga', 'ram', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '2020-12-30 00:00:00', 8000, 1, 'BILL-127'),
(272, 'PR272', 272, 'Buncis', 'Monish', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '2020-12-30 00:00:00', 8000, 1, 'BILL-127');

-- --------------------------------------------------------

--
-- Table structure for table `stock_sales`
--

CREATE TABLE `stock_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `transactionid` varchar(250) NOT NULL,
  `transidnumber` int(11) NOT NULL,
  `stock_name` varchar(200) NOT NULL,
  `category` varchar(120) NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `username` varchar(120) NOT NULL,
  `customer_id` varchar(120) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `payment` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `tax` decimal(10,0) NOT NULL,
  `tax_dis` varchar(100) NOT NULL,
  `dis_amount` decimal(10,0) NOT NULL,
  `grand_total` decimal(10,0) NOT NULL,
  `due` date NOT NULL,
  `mode` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `count1` int(11) NOT NULL,
  `billnumber` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_sales`
--

INSERT INTO `stock_sales` (`id`, `transactionid`, `transidnumber`, `stock_name`, `category`, `supplier_name`, `selling_price`, `quantity`, `amount`, `date`, `username`, `customer_id`, `subtotal`, `payment`, `balance`, `discount`, `tax`, `tax_dis`, `dis_amount`, `grand_total`, `due`, `mode`, `description`, `count1`, `billnumber`) VALUES
(20, 'SL263', 263, 'Apel', '', '', '10.00', '10.00', '100.00', '2013-08-15', 'admin', 'jacob', '90.00', '10.00', '80.00', '10', '87879', 'bnmnbmn', '10', '100', '1970-01-01', 'cheque', 'uuuoiuo', 1, 'BILL-126'),
(21, 'SL264', 264, 'Mangga', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(22, 'SL265', 265, 'Brokoli', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(23, 'SL266', 266, 'Jeruk', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(24, 'SL267', 267, 'Bayam', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(25, 'SL268', 268, 'Bawang', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(26, 'SL269', 269, 'Mint', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(27, 'SL270', 270, 'Delima', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'jerin', '1900.00', '190.00', '1810.00', '0', '78', 'hjhjkh', '100', '2000', '1970-01-01', 'cheque', 'khksg', 1, 'BILL-127'),
(28, 'SL270', 270, 'Duku', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'jerin', '1900.00', '190.00', '1810.00', '0', '78', 'hjhjkh', '100', '2000', '1970-01-01', 'cheque', 'khksg', 2, 'BILL-127'),
(29, 'SL271', 271, 'Cabe', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(30, 'SL272', 272, 'Basil', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127');

-- --------------------------------------------------------

--
-- Table structure for table `stock_user`
--

CREATE TABLE `stock_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `answer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_user`
--

INSERT INTO `stock_user` (`id`, `username`, `password`, `user_type`, `answer`) VALUES
(2, 'admin', 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `store_details`
--

CREATE TABLE `store_details` (
  `name` varchar(100) NOT NULL,
  `log` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `web` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_details`
--

INSERT INTO `store_details` (`name`, `log`, `type`, `address`, `place`, `city`, `phone`, `email`, `web`, `pin`) VALUES
('sdfds', 'posnic.png', 'png', 'fds', 'fsdf', 'sdf', '4354354353', 'sdkjlfs@lkfjsdl.com', 'www.google.com', 'sdfds');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_details`
--

CREATE TABLE `supplier_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `supplier_address` varchar(500) NOT NULL,
  `supplier_contact1` varchar(100) NOT NULL,
  `supplier_contact2` varchar(100) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_details`
--

INSERT INTO `supplier_details` (`id`, `supplier_name`, `supplier_address`, `supplier_contact1`, `supplier_contact2`, `balance`) VALUES
(37, 'Pa Harto', 'Perumahan Pakem Mulia No. 15', '7787876786', '89798', 0),
(38, 'Bu Yuni', 'Jalan Kramat Jaya Baru 3 No. 14', '7787876786', '9539126325', 0),
(39, 'PT Sukabumi', 'Jalan Pulo Raya V No.14', '7787876786', '9539126325', 0),
(40, 'Ojan', 'Perumahan Griya Agung Permai No. 30', '7787876786', '9539126325', 0),
(41, 'PT Sukamaju', 'Jalan Menteng Granit No. 16', '7787876786', '9539126325', 0),
(42, 'UKM Sayur', 'Jalan Kran V no.21', '7787876786', '9539126325', 0),
(43, 'Firman', 'Jalan Setiabudi Tengah No. 3', '7787876786', '9539126325', 0),
(44, 'Daffa', 'Perumahan Gunung Sahari XI No. 24', '7787876786', '9539126325', 0),
(45, 'Suci', 'Jalan Kemuning Raya No. 01 ', '7787876786', '9539126325', 0),
(46, 'Nana', 'Perumahan Flamboyan Bawah III No. 128', '7787876786', '9539126325', 0),
(47, 'Pa Dendi', 'Perumahan Taman Lagura Indah Blok L4 No.2', '7787876786', '9539126325', 0),
(48, 'Koperasi 231', 'Jl. Raya Jatinegara Kaum No. 23', '7787876786', '9539126325', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `customer` varchar(250) NOT NULL,
  `supplier` varchar(250) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `payment` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `due` datetime NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rid` varchar(120) NOT NULL,
  `receiptid` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uom_details`
--

CREATE TABLE `uom_details` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(120) NOT NULL,
  `spec` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uom_details`
--

INSERT INTO `uom_details` (`id`, `name`, `spec`) VALUES
(0000000006, 'UOM1', 'UOM1 Specification'),
(0000000007, 'UOM2', 'UOM2 Specification'),
(0000000008, 'UOM3', 'UOM3 Specification'),
(0000000009, 'UOM4', 'UOM4 Specification');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_details`
--
ALTER TABLE `category_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_avail`
--
ALTER TABLE `stock_avail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_details`
--
ALTER TABLE `stock_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_entries`
--
ALTER TABLE `stock_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_sales`
--
ALTER TABLE `stock_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_user`
--
ALTER TABLE `stock_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_details`
--
ALTER TABLE `supplier_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uom_details`
--
ALTER TABLE `uom_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_details`
--
ALTER TABLE `category_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `stock_avail`
--
ALTER TABLE `stock_avail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `stock_details`
--
ALTER TABLE `stock_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `stock_entries`
--
ALTER TABLE `stock_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT for table `stock_sales`
--
ALTER TABLE `stock_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `stock_user`
--
ALTER TABLE `stock_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier_details`
--
ALTER TABLE `supplier_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `uom_details`
--
ALTER TABLE `uom_details`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
