-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2022 at 07:58 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nns_purchasing`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_fiscal_years`
--

CREATE TABLE `acc_fiscal_years` (
  `id` int(100) NOT NULL,
  `fy_start_date` date NOT NULL,
  `fy_end_date` date NOT NULL,
  `fy_year` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `acc_fiscal_years`
--

INSERT INTO `acc_fiscal_years` (`id`, `fy_start_date`, `fy_end_date`, `fy_year`, `status`, `company_id`) VALUES
(13, '2020-01-01', '2021-12-31', '2020', 'inactive', 21),
(14, '2019-09-01', '2019-12-31', '2019', 'inactive', 22),
(15, '2019-10-01', '2019-10-31', '23234', 'inactive', 26),
(16, '2020-10-01', '2021-06-30', '2020-21', 'inactive', 22),
(17, '2021-01-01', '2021-12-31', '2021', 'inactive', 21),
(18, '2021-01-05', '2022-10-04', '2021', 'inactive', 23),
(19, '2022-01-01', '2022-12-31', '2022', 'active', 21);

-- --------------------------------------------------------

--
-- Table structure for table `acc_payments`
--

CREATE TABLE `acc_payments` (
  `id` int(10) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(255) NOT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `payment_date` date NOT NULL,
  `description` text,
  `name` varchar(100) NOT NULL,
  `amount` double(10,4) NOT NULL,
  `account_code` varchar(100) NOT NULL,
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `tax_amount` decimal(10,3) NOT NULL DEFAULT '0.000',
  `supplier_invoice_no` varchar(100) DEFAULT NULL,
  `entry_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('4bfg50b4d3qvu7ud7jenj8q8lts6bs7e', '::1', 1655218531, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635353231383533313b),
('4lj94uf9m2i7gee4894fdl3l5i3q93s1', '::1', 1655217028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635353231363933353b6c616e677c733a323a22656e223b757365726e616d657c733a353a2261646d696e223b757365725f69647c733a323a223132223b66756c6c5f6e616d657c733a363a2264656d6f2031223b726f6c657c733a353a2261646d696e223b636f6d70616e795f69647c733a323a223231223b636f6d70616e795f6e616d657c733a333a224e4e53223b74696d655f7a6f6e657c733a31343a22416d65726963612f43616e63756e223b6d756c74695f63757272656e63797c733a313a2230223b686f6d655f63757272656e63795f636f64657c4e3b686f6d655f63757272656e63795f73796d626f6c7c4e3b66795f796561727c733a343a2232303232223b66795f73746172745f646174657c733a31303a22323032322d30312d3031223b66795f656e645f646174657c733a31303a22323032322d31322d3331223b),
('chflqid169bjhpmu1pfn230lspe2fmfj', '::1', 1655219467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635353231393236323b6c616e677c733a323a22656e223b757365726e616d657c733a353a2261646d696e223b757365725f69647c733a323a223132223b66756c6c5f6e616d657c733a363a2264656d6f2031223b726f6c657c733a353a2261646d696e223b636f6d70616e795f69647c733a323a223231223b636f6d70616e795f6e616d657c733a333a224e4e53223b74696d655f7a6f6e657c733a31343a22416d65726963612f43616e63756e223b6d756c74695f63757272656e63797c733a313a2230223b686f6d655f63757272656e63795f636f64657c4e3b686f6d655f63757272656e63795f73796d626f6c7c4e3b66795f796561727c733a343a2232303232223b66795f73746172745f646174657c733a31303a22323032322d30312d3031223b66795f656e645f646174657c733a31303a22323032322d31322d3331223b),
('nag4n6jq81ghvsdufcilg9nuns280uch', '::1', 1655218533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635353231383239323b6c616e677c733a323a22656e223b757365726e616d657c733a353a2261646d696e223b757365725f69647c733a323a223132223b66756c6c5f6e616d657c733a363a2264656d6f2031223b726f6c657c733a353a2261646d696e223b636f6d70616e795f69647c733a323a223231223b636f6d70616e795f6e616d657c733a333a224e4e53223b74696d655f7a6f6e657c733a31343a22416d65726963612f43616e63756e223b6d756c74695f63757272656e63797c733a313a2230223b686f6d655f63757272656e63795f636f64657c4e3b686f6d655f63757272656e63795f73796d626f6c7c4e3b66795f796561727c733a343a2232303232223b66795f73746172745f646174657c733a31303a22323032322d30312d3031223b66795f656e645f646174657c733a31303a22323032322d31322d3331223b),
('pnrkafl1e2go845tj41ufh6l6uegj9l1', '::1', 1655218718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635353231383636373b6c616e677c733a323a22656e223b757365726e616d657c733a353a2261646d696e223b757365725f69647c733a323a223132223b66756c6c5f6e616d657c733a363a2264656d6f2031223b726f6c657c733a353a2261646d696e223b636f6d70616e795f69647c733a323a223231223b636f6d70616e795f6e616d657c733a333a224e4e53223b74696d655f7a6f6e657c733a31343a22416d65726963612f43616e63756e223b6d756c74695f63757272656e63797c733a313a2230223b686f6d655f63757272656e63795f636f64657c4e3b686f6d655f63757272656e63795f73796d626f6c7c4e3b66795f796561727c733a343a2232303232223b66795f73746172745f646174657c733a31303a22323032322d30312d3031223b66795f656e645f646174657c733a31303a22323032322d31322d3331223b);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `date_created` date NOT NULL,
  `fy_start` date NOT NULL,
  `fy_end` date NOT NULL,
  `currency_symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currency_id` int(10) NOT NULL,
  `cur_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `locked` tinyint(1) NOT NULL,
  `expire` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_zone` varchar(244) COLLATE utf8_unicode_ci NOT NULL,
  `is_multi_currency` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `address`, `email`, `contact_no`, `image`, `status`, `date_created`, `fy_start`, `fy_end`, `currency_symbol`, `currency_id`, `cur_datetime`, `locked`, `expire`, `time_zone`, `is_multi_currency`) VALUES
(20, 'Khybersoft', 'Deans Trade Center Peshawar', 'ahsankhan50@gmail.com', '03459079213', 'min-logo.jpg', 'active', '0000-00-00', '0000-00-00', '0000-00-00', '', 91, '2017-09-24 02:04:09', 0, '1596622649', 'Asia/Karachi', 1),
(21, 'NNS', '', '', '', '', 'active', '0000-00-00', '0000-00-00', '0000-00-00', '', 0, '2017-10-20 05:42:29', 1, '1660882149', 'America/Cancun', 0),
(22, 'test username', 'FF852 Deans Trade Center', 'test@mail.com', '123123123', '', 'active', '0000-00-00', '0000-00-00', '0000-00-00', '', 91, '2020-10-25 07:56:52', 1, '1613980612', 'Asia/Karachi', 0),
(23, 'Test', 'test address', 'test@gmail.com', '340934292834', '', 'active', '0000-00-00', '0000-00-00', '0000-00-00', '', 20, '2021-01-04 08:35:22', 1, '1620117322', 'America/Cancun', 0);

-- --------------------------------------------------------

--
-- Table structure for table `farm_feeding`
--

CREATE TABLE `farm_feeding` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `ibn_1` int(11) NOT NULL,
  `ibn_2` int(11) NOT NULL,
  `ibn_3` int(11) NOT NULL,
  `ibn_qty_1` decimal(10,5) NOT NULL,
  `ibn_qty_2` decimal(10,5) NOT NULL,
  `ibn_qty_3` decimal(10,5) NOT NULL,
  `pond_no` decimal(10,0) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farm_feeding`
--

INSERT INTO `farm_feeding` (`id`, `date`, `item_id`, `ibn_1`, `ibn_2`, `ibn_3`, `ibn_qty_1`, `ibn_qty_2`, `ibn_qty_3`, `pond_no`, `unit_id`, `date_created`, `date_updated`) VALUES
(71, '2022-04-01', 24, 49, 0, 0, '76.30000', '0.00000', '0.00000', '5', 32, '2022-04-01', '2022-04-08 02:42:43'),
(72, '2022-04-08', 27, 52, 0, 0, '0.46000', '0.00000', '0.00000', '1', 0, '2022-04-08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `farm_grinding`
--

CREATE TABLE `farm_grinding` (
  `id` int(11) NOT NULL,
  `harvest_date` date NOT NULL,
  `grinding_date` date DEFAULT NULL,
  `batch_code` varchar(100) DEFAULT NULL,
  `pond_no` decimal(10,0) DEFAULT NULL,
  `qty` decimal(10,5) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `fsms` varchar(111) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farm_grinding`
--

INSERT INTO `farm_grinding` (`id`, `harvest_date`, `grinding_date`, `batch_code`, `pond_no`, `qty`, `unit_id`, `delivery_date`, `fsms`, `date_created`, `date_updated`) VALUES
(3, '2021-03-01', '2021-04-05', '21C0101', '4', '10.00000', 32, '2021-04-06', 'Approved', '2021-05-13', NULL),
(4, '2021-03-01', '0001-01-01', '21C0102', '6', '17.10000', 32, '2021-04-06', 'Reject', '2021-05-13', '2021-06-19 03:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `farm_harvest`
--

CREATE TABLE `farm_harvest` (
  `id` int(11) NOT NULL,
  `harvest_date` date NOT NULL,
  `pond_no` decimal(10,5) DEFAULT NULL,
  `unpressed_biomass` decimal(10,5) DEFAULT NULL,
  `pressed_biomass` decimal(10,5) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farm_harvest`
--

INSERT INTO `farm_harvest` (`id`, `harvest_date`, `pond_no`, `unpressed_biomass`, `pressed_biomass`, `unit_id`, `status`, `date_created`, `date_updated`) VALUES
(9, '2022-04-01', '5.00000', '190.00000', '104.60000', 32, 'Approved', '2022-04-01', '2022-04-08 02:42:59'),
(10, '2022-04-01', '10.00000', '170.00000', '90.00000', 32, 'Approved', '2022-04-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `farm_inventory`
--

CREATE TABLE `farm_inventory` (
  `id` int(11) NOT NULL,
  `prod_product_id` int(11) NOT NULL,
  `ibn` varchar(200) DEFAULT NULL,
  `in_qty` decimal(10,5) DEFAULT '0.00000',
  `out_qty` decimal(10,5) DEFAULT '0.00000',
  `out_date` date DEFAULT NULL,
  `in_date` date NOT NULL,
  `balance` decimal(10,5) DEFAULT NULL,
  `moq` varchar(200) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `waste` decimal(10,5) DEFAULT '0.00000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farm_inventory`
--

INSERT INTO `farm_inventory` (`id`, `prod_product_id`, `ibn`, `in_qty`, `out_qty`, `out_date`, `in_date`, `balance`, `moq`, `date_created`, `date_updated`, `status`, `waste`) VALUES
(49, 24, '22A1901', '2800.00000', '76.30000', '2022-04-08', '2022-04-01', NULL, 'Yes', '2022-04-01 03:42:08', NULL, 'Approved', '0.00000'),
(50, 26, '21I3001', '73.40000', '0.00000', NULL, '2022-04-01', NULL, 'Yes', '2022-04-01 03:42:49', NULL, 'Approved', '0.00000'),
(51, 25, '21H2602', '109.30000', '0.00000', NULL, '2022-04-01', NULL, 'Yes', '2022-04-01 03:43:21', NULL, 'Approved', '0.00000'),
(52, 27, '21H2601', '74.10000', '0.46000', '2022-04-08', '2022-04-01', NULL, 'Yes', '2022-04-01 03:43:57', NULL, 'Approved', '0.00000'),
(53, 28, '18F2005', '163.70000', '0.00000', NULL, '2022-04-01', NULL, 'Yes', '2022-04-01 03:44:39', NULL, 'Approved', '0.00000'),
(54, 29, '21K1702', '30.00000', '0.00000', NULL, '2022-04-01', NULL, 'Yes', '2022-04-01 03:45:28', NULL, 'Approved', '0.00000'),
(55, 30, '22B2301', '657.00000', '0.00000', NULL, '2022-04-01', NULL, 'Yes', '2022-04-01 03:46:02', NULL, 'Approved', '0.00000'),
(56, 31, '21H2001', '275.00000', '0.00000', NULL, '2022-04-01', NULL, 'Yes', '2022-04-01 03:46:40', NULL, 'Approved', '0.00000');

-- --------------------------------------------------------

--
-- Table structure for table `farm_inventory_detail`
--

CREATE TABLE `farm_inventory_detail` (
  `id` int(11) NOT NULL,
  `out_qty` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `out_date` date DEFAULT NULL,
  `inventory_id` int(20) NOT NULL,
  `feeding_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farm_inventory_detail`
--

INSERT INTO `farm_inventory_detail` (`id`, `out_qty`, `out_date`, `inventory_id`, `feeding_id`) VALUES
(42, '76.30000', '2022-04-01', 49, 71),
(43, '0.46000', '2022-04-08', 52, 72);

-- --------------------------------------------------------

--
-- Table structure for table `finance_charges`
--

CREATE TABLE `finance_charges` (
  `id` int(100) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_charges`
--

INSERT INTO `finance_charges` (`id`, `company_id`, `name`, `status`, `date_created`, `description`) VALUES
(1, 21, 'Charges 1', 1, '2022-06-02 12:40:56', '');

-- --------------------------------------------------------

--
-- Table structure for table `finance_deductions`
--

CREATE TABLE `finance_deductions` (
  `id` int(100) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_deductions`
--

INSERT INTO `finance_deductions` (`id`, `company_id`, `name`, `status`, `date_created`, `description`) VALUES
(1, 21, 'Deduction 1', 1, '2022-06-02 12:40:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `finance_expenses`
--

CREATE TABLE `finance_expenses` (
  `id` int(10) NOT NULL,
  `date_issued` varchar(20) NOT NULL,
  `payment_for_id` int(100) DEFAULT NULL,
  `expense_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expense_date` date NOT NULL,
  `category_id` int(100) DEFAULT NULL,
  `user_id` int(100) NOT NULL,
  `amount` decimal(10,0) DEFAULT '0',
  `change` decimal(10,0) DEFAULT '0',
  `payment_method_id` int(100) DEFAULT NULL,
  `approval` varchar(100) DEFAULT NULL,
  `receipted` varchar(11) DEFAULT NULL,
  `cross_checked` varchar(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_expenses`
--

INSERT INTO `finance_expenses` (`id`, `date_issued`, `payment_for_id`, `expense_time`, `expense_date`, `category_id`, `user_id`, `amount`, `change`, `payment_method_id`, `approval`, `receipted`, `cross_checked`, `company_id`, `note`) VALUES
(9, '2022-05-01', 0, '2022-05-01 11:58:25', '2022-05-01', 0, 12, '3700', '2100', 0, 'STI', 'Yes', 'Yes', 21, 'the quick borwn fosx'),
(10, '2022-05-21', 2, '2022-05-21 09:52:40', '2022-05-21', 0, 12, '6000', '5400', 2, 'STI', 'Yes', 'Yes', 21, ''),
(11, '2022-05-21', 3, '2022-05-21 10:07:31', '2022-05-21', 3, 12, '1000', '600', 1, 'STI', 'Yes', 'Yes', 21, 'asdfasdf');

-- --------------------------------------------------------

--
-- Table structure for table `finance_expenses_items`
--

CREATE TABLE `finance_expenses_items` (
  `id` int(10) NOT NULL,
  `expense_id` int(10) NOT NULL DEFAULT '0',
  `expense_item_id` int(100) DEFAULT NULL,
  `item_content` text,
  `amount` decimal(15,4) DEFAULT NULL,
  `subcategory_id` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_expenses_items`
--

INSERT INTO `finance_expenses_items` (`id`, `expense_id`, `expense_item_id`, `item_content`, `amount`, `subcategory_id`) VALUES
(1, 4, 1, NULL, NULL, NULL),
(2, 4, 2, NULL, NULL, NULL),
(3, 5, 1, NULL, NULL, NULL),
(9, 8, 1, NULL, '333.0000', 1),
(10, 8, 2, NULL, '444.0000', 2),
(11, 10, 1, NULL, '600.0000', 1),
(12, 11, 1, NULL, '400.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `finance_exp_items`
--

CREATE TABLE `finance_exp_items` (
  `id` int(100) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_exp_items`
--

INSERT INTO `finance_exp_items` (`id`, `company_id`, `name`, `status`, `date_created`) VALUES
(1, 21, 'Item 1', 1, '2022-05-17 17:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `finance_exp_paymentfor`
--

CREATE TABLE `finance_exp_paymentfor` (
  `id` int(100) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_exp_paymentfor`
--

INSERT INTO `finance_exp_paymentfor` (`id`, `company_id`, `name`, `status`, `date_created`) VALUES
(2, 21, 'DHL', 1, '2022-05-17 16:34:47'),
(3, 21, 'Payroll', 1, '2022-05-17 16:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `finance_exp_paymentmethod`
--

CREATE TABLE `finance_exp_paymentmethod` (
  `id` int(100) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_exp_paymentmethod`
--

INSERT INTO `finance_exp_paymentmethod` (`id`, `company_id`, `name`, `status`, `date_created`) VALUES
(1, 21, 'Cash', 1, '2022-05-17 16:48:39'),
(2, 21, 'Bank Transfer', 1, '2022-05-17 16:48:49');

-- --------------------------------------------------------

--
-- Table structure for table `finance_exp_subcategory`
--

CREATE TABLE `finance_exp_subcategory` (
  `id` int(100) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_exp_subcategory`
--

INSERT INTO `finance_exp_subcategory` (`id`, `company_id`, `name`, `status`, `date_created`, `category_id`) VALUES
(1, 21, 'sub category 1', 1, '2022-05-17 17:01:19', NULL),
(2, 21, 'DHL 1', 1, '2022-06-01 15:43:25', 3);

-- --------------------------------------------------------

--
-- Table structure for table `finance_payment_summary`
--

CREATE TABLE `finance_payment_summary` (
  `id` int(100) NOT NULL,
  `sale_id` int(100) NOT NULL,
  `amount` double(18,2) NOT NULL,
  `payment_term_id` int(10) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `payment_method_file` varchar(200) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `finance_sales`
--

CREATE TABLE `finance_sales` (
  `sale_id` int(10) NOT NULL,
  `invoice_no` varchar(20) NOT NULL,
  `company_id` int(255) NOT NULL,
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_date` date NOT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `user_id` int(100) NOT NULL,
  `account` varchar(255) NOT NULL COMMENT 'cash or credit',
  `charges_total` decimal(10,0) DEFAULT '0',
  `deduction_total` decimal(18,0) DEFAULT NULL,
  `description` text,
  `discount_value` decimal(10,4) DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT '0',
  `balance` decimal(18,0) DEFAULT NULL,
  `currency_id` int(10) DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_date` varchar(100) DEFAULT NULL,
  `payment_terms_id` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_sales`
--

INSERT INTO `finance_sales` (`sale_id`, `invoice_no`, `company_id`, `sale_time`, `sale_date`, `customer_id`, `user_id`, `account`, `charges_total`, `deduction_total`, `description`, `discount_value`, `total_amount`, `balance`, `currency_id`, `created_on`, `delivery_date`, `payment_terms_id`, `status`) VALUES
(1, '001', 21, '2022-05-01 09:26:53', '2022-05-01', 8, 12, 'cash', '0', NULL, 'this is description for new invoice. the quick brown fox jumps over the lazy dogs.', '0.0000', '4020', NULL, 0, '2022-05-01 09:26:53', '2022-06-01', 50, 'Paid'),
(2, '002', 21, '2022-05-01 09:36:59', '2022-05-01', 10, 12, 'cash', '0', NULL, 'asdfadfasdfas', '0.0000', '1221', NULL, 0, '2022-05-01 09:36:59', '2022-05-14', 100, 'Unpaid'),
(3, '003', 21, '2022-05-01 09:40:12', '2022-05-01', 13, 12, 'cash', '0', NULL, '', '0.0000', '555', NULL, 0, '2022-05-01 09:40:12', '2022-05-01', 50, 'Paid'),
(8, '005', 21, '2022-05-01 10:33:07', '2022-05-01', 8, 12, 'cash', '500', '32', 'the quick brown fox jumps over the lazy dogs', '0.0000', '1100', NULL, 0, '2022-05-01 10:33:07', '2022-05-01', 50, 'Unpaid'),
(9, '006', 21, '2022-05-01 11:06:58', '2022-05-01', 8, 12, 'cash', '2998', '5000', 'another  inoiveie', '0.0000', '47500', NULL, 0, '2022-05-01 11:06:58', '2022-05-01', 50, 'Paid'),
(10, '007', 21, '2022-06-03 16:05:16', '2022-06-03', 8, 12, 'cash', '20', '10', 'sdfsdfsd', '0.0000', '500', NULL, 0, '2022-06-03 16:05:16', '2022-06-03', 1, 'Paid'),
(11, '007', 21, '2022-06-13 17:10:33', '2022-06-13', 8, 12, 'cash', '22', '43', '', '0.0000', '455', NULL, 0, '2022-06-13 17:10:33', '2022-06-13', 1, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `finance_sales_charges`
--

CREATE TABLE `finance_sales_charges` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `invoice_no` varchar(150) NOT NULL,
  `charges_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `qty` decimal(18,0) NOT NULL,
  `price` decimal(18,0) NOT NULL,
  `sale_date` date NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_sales_charges`
--

INSERT INTO `finance_sales_charges` (`id`, `sale_id`, `invoice_no`, `charges_id`, `description`, `qty`, `price`, `sale_date`, `date_created`) VALUES
(3, 8, '005', 0, 'charges desc 1', '1', '500', '2022-05-01', '2022-05-01 05:33:07'),
(4, 9, '006', 0, 'charges desc 1', '2', '1499', '2022-05-01', '2022-05-01 06:06:58'),
(5, 10, '007', 1, 'charges desc 1', '1', '20', '2022-06-03', '2022-06-03 11:05:16'),
(6, 11, '007', 1, '', '1', '22', '2022-06-13', '2022-06-13 12:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `finance_sales_deduction`
--

CREATE TABLE `finance_sales_deduction` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `invoice_no` varchar(150) NOT NULL,
  `deduction_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `qty` decimal(18,0) NOT NULL,
  `price` decimal(18,0) NOT NULL,
  `sale_date` date NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_sales_deduction`
--

INSERT INTO `finance_sales_deduction` (`id`, `sale_id`, `invoice_no`, `deduction_id`, `description`, `qty`, `price`, `sale_date`, `date_created`) VALUES
(3, 8, '005', 0, 'charges desc 1', '1', '32', '2022-05-01', '2022-05-01 05:33:07'),
(4, 9, '006', 0, 'charges desc 1', '2', '2500', '2022-05-01', '2022-05-01 06:06:58'),
(5, 10, '007', 1, 'charges desc 1', '1', '10', '2022-06-03', '2022-06-03 11:05:16'),
(6, 11, '007', 1, '', '1', '43', '2022-06-13', '2022-06-13 12:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `finance_sales_items`
--

CREATE TABLE `finance_sales_items` (
  `sale_item_id` int(10) NOT NULL,
  `invoice_no` varchar(20) NOT NULL,
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `item_content` text,
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_sold` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,4) NOT NULL,
  `item_unit_price` decimal(15,4) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  `unit_id` int(20) DEFAULT NULL,
  `currency_id` int(10) DEFAULT NULL,
  `company_id` int(20) NOT NULL,
  `discount_value` decimal(10,4) DEFAULT NULL,
  `tax_id` int(20) NOT NULL DEFAULT '0',
  `tax_rate` int(20) NOT NULL DEFAULT '0',
  `inventory_acc_code` varchar(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_sales_items`
--

INSERT INTO `finance_sales_items` (`sale_item_id`, `invoice_no`, `sale_id`, `item_id`, `item_content`, `description`, `serialnumber`, `line`, `quantity_sold`, `item_cost_price`, `item_unit_price`, `discount_percent`, `unit_id`, `currency_id`, `company_id`, `discount_value`, `tax_id`, `tax_rate`, `inventory_acc_code`) VALUES
(1, '001', 1, 24, '25 kgs', 'this is description for new in', NULL, 0, '2.00', '0.0000', '600.0000', 0, 5, NULL, 21, NULL, 0, 0, ''),
(2, '001', 1, 37, '60 capsules x 500 mg', 'this is description for new in', NULL, 0, '3.00', '0.0000', '500.0000', 0, 6, NULL, 21, NULL, 0, 0, ''),
(3, '001', 1, 29, '45 kgs', 'this is description for new in', NULL, 0, '4.00', '0.0000', '330.0000', 0, 7, NULL, 21, NULL, 0, 0, ''),
(4, '002', 2, 24, '25 kgs', 'asdfadfasdfas', NULL, 0, '1.00', '0.0000', '555.0000', 0, 5, NULL, 21, NULL, 0, 0, ''),
(5, '002', 2, 25, '25 kgs', 'asdfadfasdfas', NULL, 0, '1.00', '0.0000', '666.0000', 0, 5, NULL, 21, NULL, 0, 0, ''),
(6, '003', 3, 24, '25 kgs', '', NULL, 0, '1.00', '0.0000', '555.0000', 0, 5, NULL, 21, NULL, 0, 0, ''),
(16, '005', 8, 24, '25 kgs', 'the quick brown fox jumps over', NULL, 0, '1.00', '0.0000', '500.0000', 0, 5, NULL, 21, NULL, 0, 0, ''),
(17, '005', 8, 25, '25 kgs', 'the quick brown fox jumps over', NULL, 0, '1.00', '0.0000', '600.0000', 0, 6, NULL, 21, NULL, 0, 0, ''),
(18, '006', 9, 27, '25 kgs', 'another  inoiveie', NULL, 0, '2.00', '0.0000', '5000.0000', 0, 5, NULL, 21, NULL, 0, 0, ''),
(19, '006', 9, 33, '60 capsules x 500 mg', 'another  inoiveie', NULL, 0, '4.00', '0.0000', '6000.0000', 0, 6, NULL, 21, NULL, 0, 0, ''),
(20, '006', 9, 41, '90 capsules x 500 mg', 'another  inoiveie', NULL, 0, '3.00', '0.0000', '4500.0000', 0, 6, NULL, 21, NULL, 0, 0, ''),
(21, '007', 10, 24, '25 kgs', 'sdfsdfsd', NULL, 0, '1.00', '0.0000', '500.0000', 0, 5, NULL, 21, NULL, 0, 0, ''),
(22, '007', 11, 25, '25 kgs', '', NULL, 0, '1.00', '0.0000', '455.0000', 0, 0, NULL, 21, NULL, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `finance_sales_pay_terms`
--

CREATE TABLE `finance_sales_pay_terms` (
  `id` int(100) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finance_sales_pay_terms`
--

INSERT INTO `finance_sales_pay_terms` (`id`, `company_id`, `name`, `status`, `date_created`) VALUES
(1, 21, '50%', 1, '2022-06-03 15:27:30'),
(2, 21, '100%', 1, '2022-06-03 15:27:37');

-- --------------------------------------------------------

--
-- Table structure for table `hr_employees`
--

CREATE TABLE `hr_employees` (
  `id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suffix` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nick_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emergency_contact` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `employment_status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hire_date` date DEFAULT NULL,
  `job_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marital_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emp_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_hours` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contract` tinyint(1) DEFAULT NULL,
  `bpi_account` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pag_ibig` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sss` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL,
  `poineer` tinyint(1) DEFAULT NULL,
 `ncr` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
 `working_hour_from` time DEFAULT NULL,
 `working_hour_to` time DEFAULT NULL,
 `basic_salary` decimal(18,0) DEFAULT NULL,
 `food_allow` decimal(18,0) DEFAULT NULL,
 `other_allow` decimal(18,0) DEFAULT NULL,
 `transportation_allow` decimal(18,0) DEFAULT NULL,
 `tracking_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
 `card_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hr_employees`
--

INSERT INTO `hr_employees` (`id`, `company_id`, `first_name`, `last_name`, `middle_name`, `suffix`, `nick_name`, `address`, `email`, `contact`, `emergency_contact`, `dob`, `gender`, `status`, `employment_status`, `hire_date`, `job_type`, `picture`, `marital_status`, `emp_no`, `position`, `department`, `working_hours`, `contract`, `bpi_account`, `card_no`, `tracking_no`, `tin`, `phic`, `pag_ibig`, `sss`, `created_on`, `updated_on`) VALUES
(1, 0, 'Ahsan', 'Ullah', 'khan', '', '', 'FF852 Deans Trade Center', NULL, '234234', NULL, '2022-04-01', 'male', 'Active', '', '0000-00-00', '', NULL, 'Single', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '2022-04-24 07:55:49', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `module` varchar(255) NOT NULL,
  `host_ip` varchar(25) NOT NULL,
  `user` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `user_agent` varchar(100) NOT NULL,
  `message_title` varchar(255) NOT NULL,
  `message_desc` text NOT NULL,
  `company_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `date`, `module`, `host_ip`, `user`, `url`, `user_agent`, `message_title`, `message_desc`, `company_id`) VALUES
(0, '2022-05-24 13:47:07', 'Admin', '::1', 'admin', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.6', '', 'admin User logged in by admin', 21),
(0, '2022-06-01 08:58:29', 'Admin', '::1', 'admin', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.6', '', 'admin User logged in by admin', 21),
(0, '2022-06-02 01:10:36', 'Admin', '::1', 'admin', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Sa', '', 'admin User logged in by admin', 21),
(0, '2022-06-02 07:24:19', 'Admin', '::1', 'admin', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Sa', '', 'admin User logged in by admin', 21),
(0, '2022-06-03 10:20:43', 'Admin', '::1', 'admin', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Sa', '', 'admin User logged in by admin', 21),
(0, '2022-06-04 02:55:27', 'Admin', '::1', 'admin', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Sa', '', 'admin User logged in by admin', 21),
(0, '2022-06-04 09:15:46', 'Admin', '::1', 'admin', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Sa', '', 'admin User logged in by admin', 21),
(0, '2022-06-13 12:01:50', 'Admin', '::1', 'admin', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Sa', '', 'admin User logged in by admin', 21),
(0, '2022-06-14 09:29:49', 'Admin', '::1', 'admin', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Sa', '', 'admin User logged in by admin', 21);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(255) NOT NULL,
  `parent_id` int(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_ur` varchar(50) NOT NULL,
  `title_ar` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `path` varchar(50) NOT NULL,
  `sort` varchar(10) NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `parent_id`, `name`, `title`, `title_ur`, `title_ar`, `icon`, `path`, `sort`, `status`) VALUES
(1, 0, 'Dashboard', 'Dashboard', 'ڈیش بورڈ', 'لوحة القيادة', 'icon-home', '#', '', 'active'),
(2, 0, 'pos', 'Menu', 'MENU', 'MENU', 'fa fa-list', '#', '', 'active'),
(3, 0, 'accounts', 'Accounts', 'اکاؤنٹس', 'حسابات', 'fa fa-th-large', '#', '', 'inactive'),
(4, 0, 'trans', 'Purchases', 'لین دین', 'المعاملات', 'fa fa-exchange', '#', '', 'active'),
(5, 0, 'reports', 'Reports', 'رپورٹیں', 'تقارير', 'fa fa-bar-chart-o fa', '#', '', 'active'),
(6, 0, 'settings', 'Settings', 'ترتیبات', 'الإعدادات', 'fa fa-bar-chart-o fa', '#', '', 'inactive'),
(7, 2, 'C_categories', 'Categories', 'اقسام', 'التصنيفات', 'fa fa-table fa-fw', 'C_categories', '10', 'active'),
(8, 2, 'C_suppliers', 'Suppliers', 'دکاندار', 'الموردين', 'fa fa-table fa-fw', 'C_suppliers', '20', 'active'),
(9, 2, 'Items', 'Products', 'مصنوعات اور خدمات', 'المنتجات والخدمات', 'fa fa-files-o fa-fw', 'Items', '40', 'active'),
(10, 2, 'Colors', 'Colors', 'رنگ', 'الألوان', 'fa fa-files-o fa-fw', 'Colors', '50', 'inactive'),
(11, 2, 'Sizes', 'Sizes', 'سائز', 'الأحجام', 'fa fa-edit fa-fw', 'Sizes', '60', 'inactive'),
(12, 4, 'C_receivings', 'Purchases', 'خریداری', 'المشتريات', 'fa fa-edit fa-fw', 'C_receivings/allPurchases', '10', 'active'),
(13, 4, 'C_sales', 'Sales', 'فروخت', 'مبيعات', 'fa fa-files-o fa-fw', 'C_sales/allSales', '20', 'inactive'),
(14, 3, 'C_groups', 'Chart of Accounts', 'اکاؤنٹس کا چارٹ', 'جدول الحسابات', 'fa fa-files-o fa-fw', 'C_groups', '10', 'active'),
(15, 3, 'C_ledgers', 'Ledgers', '', '', 'fa fa-files-o fa-fw', 'C_ledgers', '20', 'inactive'),
(16, 3, 'C_entries', 'Journal Entries', 'جرنل اندراج', 'إدخالات دفتر اليومية', 'fa fa-files-o fa-fw', 'C_entries', '30', 'active'),
(17, 5, 'C_salesreport', 'Sales Report', 'فروخت رپورٹ', 'تقرير المبيعات', 'fa fa-files-o fa-fw', 'C_salesreport', '10', 'inactive'),
(18, 5, 'C_receivingsreport', 'Purchase Report', ' خریداری رپورٹ', 'تقرير الشراء', 'fa fa-files-o fa-fw', 'C_receivingsreport', '20', 'active'),
(19, 5, 'C_trial_balance', 'Trial Balance', 'سماعت توازن', 'ميزان المراجعة', 'fa fa-files-o fa-fw', 'C_trial_balance', '30', 'inactive'),
(20, 6, 'C_fyear', 'Fiscal Year', 'مالی سال', 'السنة المالية', 'fa fa-files-o fa-fw', 'C_fyear', '10', 'inactive'),
(21, 2, 'C_employees', 'Employees', 'ملازمین', 'الموظفين', 'fa fa-files-o fa-fw', 'C_employees', '30', 'inactive'),
(22, 2, 'C_customers', 'Customers', 'گاهک', 'الزبائن', 'fa fa-files-o fa-fw', 'C_customers', '31', 'inactive'),
(23, 5, 'C_profitloss', 'Profit & Loss', 'نفع اور نقصان', 'خسارة الأرباح', '', 'C_profitloss', '40', 'inactive'),
(24, 5, 'C_balancesheet', 'Balance Sheet', 'بیلنس شیٹ', 'ورقة التوازن', '', 'C_balancesheet', '41', 'inactive'),
(25, 2, 'C_locations', 'Locations', 'مقامات', 'المواقع', '', 'C_locations', '65', 'inactive'),
(26, 4, 'C_expenses', 'Expenses', 'اخراجات', 'نفقات', 'fa fa-files-o fa-fw', 'C_expenses/allPayments', '30', 'inactive'),
(27, 5, 'C_yearreport', 'Annual Report', 'سالانہ رپورٹ', 'تقرير سنوي', '', 'C_yearreport', '50', 'inactive'),
(28, 2, 'C_banking', 'Banking', 'بینک', 'الخدمات المصرفية', '', 'C_banking', '32', 'inactive'),
(29, 2, 'C_units', 'Units', 'یونٹ', 'الوحدات', '', 'C_units', '55', 'active'),
(30, 2, 'C_eventCalendar', 'Calendar', 'بکنگ / منصوبہ بندی', 'التقويم', '', 'C_eventCalendar', '53', 'inactive'),
(31, 1, 'C_dashboard', 'View', 'ڈیش بورڈ', 'رأي', '', 'C_dashboard', '10', 'active'),
(32, 2, 'C_areas', 'Employee Area', 'ملازم ایریا', 'منطقة الموظف', '', 'C_areas', '58', 'inactive'),
(33, 0, 'mfg', 'Manufacturing', 'مینوفیکچرنگ', 'تصنيع', 'fa fa-list', '#', '', 'inactive'),
(34, 33, 'C_workcenters', 'Work Centers', 'کام کے مراکز', 'مراكز العمل', '', 'C_workcenters', '10', 'active'),
(35, 33, 'C_workorders', 'Work Orders', 'کام کے احکامات', 'طلبات العمل', '', 'C_workorders', '15', 'active'),
(36, 33, 'C_billofmaterial', 'Bill of Material', 'اشیا کا حساب', 'فاتورة المواد', '', 'C_billofmaterial', '20', 'active'),
(37, 4, 'C_estimate', 'Estimates', 'فروخت', 'مبيعات', 'fa fa-files-o fa-fw', 'C_estimate/allestimate', '20', 'inactive'),
(38, 4, 'C_purchaseOrders', 'Purchase Orders', 'خریداری', 'المشتريات', 'fa fa-edit fa-fw', 'C_purchaseOrders/allPurchaseorders', '10', 'inactive'),
(39, 4, 'C_samples', 'Samples', 'خریداری', 'المشتريات', 'fa fa-edit fa-fw', 'C_samples', '11', 'active'),
(40, 5, 'C_categoryReport', 'Category Report', 'Category Report', 'Category Report', '', 'C_categoryReport', '41', 'active'),
(41, 5, 'C_volumeReport', 'Volume Report', 'volumeReport', 'Volume Report', '', 'C_volumeReport', '42', 'active'),
(42, 2, 'C_shipping_terms', 'Shipping Terms', 'یونٹ', 'الوحدات', '', 'C_shipping_terms', '56', 'active'),
(43, 4, 'C_sourcing', 'Sourcing', 'خریداری', 'المشتريات', 'fa fa-edit fa-fw', 'C_sourcing', '12', 'active'),
(44, 4, 'C_logistics_fees', 'Logistics Fees', 'خریداری', 'المشتريات', 'fa fa-edit fa-fw', 'C_logistics_fees', '13', 'active'),
(45, 4, 'C_claims', 'Claims', 'خریداری', 'المشتريات', 'fa fa-edit fa-fw', 'C_claims', '14', 'active'),
(46, 5, 'C_logisticsReport', 'Logistics Fee Report', 'logisticsReport', 'Logistics Report', '', 'C_logisticsReport', '43', 'active'),
(47, 4, 'C_incomingProducts', 'Incoming Products', 'C_incomingProducts', 'C_incomingProducts', 'fa fa-edit fa-fw', 'C_incomingProducts', '15', 'active'),
(48, 4, 'C_purchase_requests', 'Purchase Requests', 'C_purchase_requests', 'C_purchase_requests', 'fa fa-edit fa-fw', 'C_purchase_requests', '16', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `pos_categories`
--

CREATE TABLE `pos_categories` (
  `id` int(100) NOT NULL,
  `company_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `long_desc` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `parent_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_categories`
--

INSERT INTO `pos_categories` (`id`, `company_id`, `name`, `short_desc`, `long_desc`, `status`, `parent_id`) VALUES
(2, 21, 'Packaging Materials', '', '    ', 'active', 0),
(3, 21, 'Raw Materials', '', '    ', 'active', 0),
(7, 21, 'Farm', '', '', 'active', 0),
(8, 21, 'Print Materials', '', '', 'active', 0),
(9, 21, 'Machines & Equipment', '', '', 'active', 0),
(10, 21, 'Essential Oils', '', '', 'active', 0),
(11, 21, 'Disposables', '', '', 'active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pos_claims`
--

CREATE TABLE `pos_claims` (
  `id` int(100) NOT NULL,
  `company_id` int(255) NOT NULL,
  `receiving_id` int(100) NOT NULL,
  `supplier_id` int(150) DEFAULT NULL,
  `ncr` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `comments` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_claims`
--

INSERT INTO `pos_claims` (`id`, `company_id`, `receiving_id`, `supplier_id`, `ncr`, `status`, `date_created`, `comments`) VALUES
(19, 21, 548, NULL, 'Submitted', 'Approved', '2022-01-28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pos_currencies`
--

CREATE TABLE `pos_currencies` (
  `id` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `symbol` varchar(25) DEFAULT NULL,
  `thousand_separator` varchar(10) DEFAULT NULL,
  `decimal_separator` varchar(10) DEFAULT NULL,
  `company_id` int(20) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_currencies`
--

INSERT INTO `pos_currencies` (`id`, `country`, `name`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `company_id`, `status`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', 4, 1),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', 4, 1),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', 4, 1),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', 4, 1),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', 4, 1),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', 4, 1),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', 4, 1),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', 4, 1),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', 4, 1),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', 4, 1),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', 4, 1),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', 4, 1),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', 4, 1),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', 4, 1),
(16, 'Botswana', 'Pulas', 'BWP', 'P', ',', '.', 4, 1),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', 4, 1),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', 4, 1),
(19, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£', ',', '.', 4, 1),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', 4, 1),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', 4, 1),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', 4, 1),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', 4, 1),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', 4, 1),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', 4, 1),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', 4, 1),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', 4, 1),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', 4, 1),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', 4, 1),
(30, 'Cyprus', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', 4, 1),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', 4, 1),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', 4, 1),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', 4, 1),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', 4, 1),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', 4, 1),
(37, 'England (United Kingdom)', 'Pounds', 'GBP', '£', ',', '.', 4, 1),
(38, 'Euro', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', 4, 1),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', 4, 1),
(41, 'France', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(42, 'Ghana', 'Cedis', 'GHC', '¢', ',', '.', 4, 1),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', 4, 1),
(44, 'Greece', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', 4, 1),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', 4, 1),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', 4, 1),
(48, 'Holland (Netherlands)', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', 4, 1),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', 4, 1),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', 4, 1),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', 4, 1),
(53, 'India', 'Rupees', 'INR', 'Rp', ',', '.', 4, 1),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', 4, 1),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', 4, 1),
(56, 'Ireland', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', 4, 1),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', 4, 1),
(59, 'Italy', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', 4, 1),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', 4, 1),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', 4, 1),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', 4, 1),
(64, 'Korea (North)', 'Won', 'KPW', '₩', ',', '.', 4, 1),
(65, 'Korea (South)', 'Won', 'KRW', '₩', ',', '.', 4, 1),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', 4, 1),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', 4, 1),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', 4, 1),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', 4, 1),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', 4, 1),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', 4, 1),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', 4, 1),
(73, 'Luxembourg', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', 4, 1),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', 4, 1),
(76, 'Malta', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', 4, 1),
(78, 'Mexico', 'Pesos', 'MX', '$', ',', '.', 4, 1),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', 4, 1),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', 4, 1),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', 4, 1),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', 4, 1),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', 4, 1),
(84, 'Netherlands', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', 4, 1),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', 4, 1),
(87, 'Nigeria', 'Nairas', 'NG', '₦', ',', '.', 4, 1),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', 4, 1),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', 4, 1),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', 4, 1),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', 4, 1),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', 4, 1),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', 4, 1),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', 4, 1),
(95, 'Philippines', 'Pesos', 'PHP', '₱', ',', '.', 4, 1),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', 4, 1),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', 4, 1),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', 4, 1),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', 4, 1),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', 4, 1),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', 4, 1),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', 4, 1),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', 4, 1),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', 4, 1),
(105, 'Slovenia', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', 4, 1),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', 4, 1),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', 4, 1),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', 4, 1),
(110, 'Spain', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', 4, 1),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', 4, 1),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', 4, 1),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', 4, 1),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', 4, 1),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', 4, 1),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', 4, 1),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', 4, 1),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', 4, 1),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', 4, 1),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', 4, 1),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', 4, 1),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', 4, 1),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', 4, 1),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', 4, 1),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', 4, 1),
(127, 'Vatican City', 'Euro', 'EUR', '€', ',', '.', 4, 1),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', 4, 1),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', 4, 1),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', 4, 1),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pos_customers`
--

CREATE TABLE `pos_customers` (
  `id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `store_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `posting_type_id` int(100) NOT NULL,
  `currency_id` int(10) DEFAULT '0',
  `op_balance_dr` decimal(10,4) DEFAULT '0.0000',
  `op_balance_cr` decimal(10,4) DEFAULT '0.0000',
  `exchange_rate` decimal(10,4) DEFAULT '0.0000',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `acc_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `isCustomer` tinyint(1) NOT NULL DEFAULT '1',
  `passport_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `passport_issue_date` date DEFAULT NULL,
  `passport_expiry_date` date DEFAULT NULL,
  `father_name` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_customer_payment_history`
--

CREATE TABLE `pos_customer_payment_history` (
  `id` int(20) NOT NULL,
  `customer_id` int(20) NOT NULL,
  `invoice_no` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sales_invoice_no` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(20,4) NOT NULL,
  `company_id` int(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_employees`
--

CREATE TABLE `pos_employees` (
  `id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `salary_acc_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cash_acc_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `hire_date` date DEFAULT NULL,
  `job_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cnic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `father_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_employee_payments`
--

CREATE TABLE `pos_employee_payments` (
  `id` int(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `employee_id` int(100) NOT NULL,
  `account_code` varchar(100) NOT NULL,
  `dueTo_acc_code` varchar(100) NOT NULL,
  `debit` double(15,4) NOT NULL,
  `credit` double(15,4) NOT NULL,
  `narration` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  `company_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_emp_modules`
--

CREATE TABLE `pos_emp_modules` (
  `id` int(100) NOT NULL,
  `emp_id` int(100) NOT NULL,
  `module_id` int(100) NOT NULL,
  `sub_module` int(20) DEFAULT '0',
  `can_create` tinyint(1) DEFAULT '0',
  `can_update` tinyint(1) DEFAULT '0',
  `can_delete` tinyint(1) DEFAULT '0',
  `createn_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pos_emp_modules`
--

INSERT INTO `pos_emp_modules` (`id`, `emp_id`, `module_id`, `sub_module`, `can_create`, `can_update`, `can_delete`, `createn_on`) VALUES
(84, 2, 1, 0, 0, 0, 0, '2017-09-05 06:54:18'),
(85, 2, 2, 0, 0, 0, 0, '2017-09-05 06:54:18'),
(86, 2, 3, 0, 0, 0, 0, '2017-09-05 06:54:19'),
(87, 2, 4, 0, 0, 0, 0, '2017-09-05 06:54:19'),
(95, 3, 1, 0, 0, 0, 0, '2017-09-05 09:12:17'),
(96, 3, 2, 0, 0, 0, 0, '2017-09-05 09:12:17'),
(97, 3, 3, 0, 0, 0, 0, '2017-09-05 09:12:17'),
(98, 3, 4, 0, 0, 0, 0, '2017-09-05 09:12:17'),
(99, 3, 5, 0, 0, 0, 0, '2017-09-05 09:12:17'),
(100, 1, 1, 0, 0, 0, 0, '2017-09-06 05:49:58'),
(101, 1, 2, 0, 0, 0, 0, '2017-09-06 05:49:58'),
(102, 1, 3, 0, 0, 0, 0, '2017-09-06 05:49:58'),
(103, 1, 4, 0, 0, 0, 0, '2017-09-06 05:49:58'),
(104, 1, 5, 0, 0, 0, 0, '2017-09-06 05:49:58'),
(105, 5, 1, 0, 0, 0, 0, '2017-09-06 07:55:31'),
(106, 5, 2, 0, 0, 0, 0, '2017-09-06 07:55:31'),
(107, 5, 3, 0, 0, 0, 0, '2017-09-06 07:55:31'),
(108, 5, 4, 0, 0, 0, 0, '2017-09-06 07:55:31'),
(109, 5, 5, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(110, 5, 8, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(111, 5, 9, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(112, 5, 11, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(113, 5, 12, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(114, 5, 13, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(115, 5, 14, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(116, 5, 16, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(117, 5, 17, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(118, 5, 18, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(119, 5, 19, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(120, 5, 21, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(121, 5, 22, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(122, 5, 23, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(123, 5, 24, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(124, 5, 25, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(125, 5, 26, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(126, 5, 27, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(127, 5, 28, 0, 0, 0, 0, '2017-09-06 07:55:32'),
(133, 6, 1, 0, 0, 0, 0, '2017-09-06 08:13:00'),
(134, 6, 2, 0, 0, 0, 0, '2017-09-06 08:13:00'),
(135, 6, 3, 0, 0, 0, 0, '2017-09-06 08:13:00'),
(136, 6, 4, 0, 0, 0, 0, '2017-09-06 08:13:00'),
(137, 6, 5, 0, 0, 0, 0, '2017-09-06 08:13:00'),
(138, 7, 1, 0, 0, 0, 0, '2017-09-07 01:53:04'),
(139, 7, 2, 0, 0, 0, 0, '2017-09-07 01:53:04'),
(140, 7, 3, 0, 0, 0, 0, '2017-09-07 01:53:04'),
(141, 7, 4, 0, 0, 0, 0, '2017-09-07 01:53:05'),
(142, 7, 5, 0, 0, 0, 0, '2017-09-07 01:53:05'),
(143, 8, 1, 0, 0, 0, 0, '2017-09-15 02:53:43'),
(144, 8, 2, 0, 0, 0, 0, '2017-09-15 02:53:44'),
(145, 8, 3, 0, 0, 0, 0, '2017-09-15 02:53:44'),
(146, 8, 4, 0, 0, 0, 0, '2017-09-15 02:53:44'),
(147, 8, 5, 0, 0, 0, 0, '2017-09-15 02:53:44'),
(163, 10, 1, 0, 0, 0, 0, '2017-09-24 22:28:29'),
(164, 10, 2, 0, 0, 0, 0, '2017-09-24 22:28:29'),
(165, 10, 3, 0, 0, 0, 0, '2017-09-24 22:28:29'),
(166, 10, 4, 0, 0, 0, 0, '2017-09-24 22:28:30'),
(167, 10, 5, 0, 0, 0, 0, '2017-09-24 22:28:30'),
(168, 11, 1, 0, 0, 0, 0, '2017-09-26 03:02:33'),
(169, 11, 2, 0, 0, 0, 0, '2017-09-26 03:02:33'),
(170, 11, 3, 0, 0, 0, 0, '2017-09-26 03:02:33'),
(171, 11, 4, 0, 0, 0, 0, '2017-09-26 03:02:33'),
(172, 11, 5, 0, 0, 0, 0, '2017-09-26 03:02:33'),
(1053, 14, 1, 0, 0, 0, 0, '2019-10-30 18:11:40'),
(1054, 14, 2, 0, 0, 0, 0, '2019-10-30 18:11:40'),
(1055, 14, 3, 0, 0, 0, 0, '2019-10-30 18:11:40'),
(1056, 14, 4, 0, 0, 0, 0, '2019-10-30 18:11:40'),
(1057, 14, 5, 0, 0, 0, 0, '2019-10-30 18:11:40'),
(1058, 15, 1, 0, 0, 0, 0, '2019-10-30 18:20:49'),
(1059, 15, 2, 0, 0, 0, 0, '2019-10-30 18:20:49'),
(1060, 15, 3, 0, 0, 0, 0, '2019-10-30 18:20:49'),
(1061, 15, 4, 0, 0, 0, 0, '2019-10-30 18:20:49'),
(1062, 15, 5, 0, 0, 0, 0, '2019-10-30 18:20:49'),
(1063, 15, 0, 17, 0, 0, 0, '2019-10-30 18:20:49'),
(1064, 15, 0, 18, 0, 0, 0, '2019-10-30 18:20:49'),
(1065, 15, 0, 19, 0, 0, 0, '2019-10-30 18:20:49'),
(1066, 15, 0, 23, 0, 0, 0, '2019-10-30 18:20:49'),
(1067, 15, 0, 24, 0, 0, 0, '2019-10-30 18:20:49'),
(1068, 15, 0, 9, 0, 0, 0, '2019-10-30 18:20:49'),
(1069, 15, 0, 30, 0, 0, 0, '2019-10-30 18:20:49'),
(1070, 15, 0, 29, 0, 0, 0, '2019-10-30 18:20:49'),
(1071, 15, 0, 11, 0, 0, 0, '2019-10-30 18:20:49'),
(1072, 15, 0, 25, 0, 0, 0, '2019-10-30 18:20:49'),
(1073, 16, 1, 0, 0, 0, 0, '2019-10-30 18:37:16'),
(1074, 17, 1, 0, 0, 0, 0, '2019-10-30 18:41:54'),
(1075, 18, 1, 0, 0, 0, 0, '2019-10-30 18:45:31'),
(1076, 19, 1, 0, 0, 0, 0, '2019-10-30 18:48:24'),
(1077, 19, 0, 31, 0, 0, 0, '2019-10-30 18:48:24'),
(1078, 19, 2, 0, 0, 0, 0, '2019-10-30 18:48:24'),
(1079, 19, 0, 7, 0, 0, 0, '2019-10-30 18:48:24'),
(1080, 19, 0, 8, 0, 0, 0, '2019-10-30 18:48:24'),
(1081, 19, 0, 21, 0, 0, 0, '2019-10-30 18:48:24'),
(1082, 19, 0, 22, 0, 0, 0, '2019-10-30 18:48:25'),
(1083, 19, 0, 28, 0, 0, 0, '2019-10-30 18:48:25'),
(1084, 19, 0, 9, 0, 0, 0, '2019-10-30 18:48:25'),
(1085, 19, 0, 30, 0, 0, 0, '2019-10-30 18:48:25'),
(1086, 19, 0, 29, 0, 0, 0, '2019-10-30 18:48:25'),
(1087, 19, 0, 11, 0, 0, 0, '2019-10-30 18:48:25'),
(1088, 19, 0, 25, 0, 0, 0, '2019-10-30 18:48:25'),
(1089, 19, 3, 0, 0, 0, 0, '2019-10-30 18:48:25'),
(1090, 19, 0, 14, 0, 0, 0, '2019-10-30 18:48:25'),
(1091, 19, 0, 16, 0, 0, 0, '2019-10-30 18:48:25'),
(1092, 19, 4, 0, 0, 0, 0, '2019-10-30 18:48:25'),
(1093, 19, 0, 12, 0, 0, 0, '2019-10-30 18:48:25'),
(1094, 19, 0, 13, 0, 0, 0, '2019-10-30 18:48:25'),
(1095, 19, 0, 26, 0, 0, 0, '2019-10-30 18:48:25'),
(1096, 19, 5, 0, 0, 0, 0, '2019-10-30 18:48:25'),
(1097, 19, 0, 17, 0, 0, 0, '2019-10-30 18:48:25'),
(1098, 19, 0, 18, 0, 0, 0, '2019-10-30 18:48:25'),
(1099, 19, 0, 19, 0, 0, 0, '2019-10-30 18:48:25'),
(1100, 19, 0, 23, 0, 0, 0, '2019-10-30 18:48:25'),
(1101, 19, 0, 24, 0, 0, 0, '2019-10-30 18:48:25'),
(1102, 19, 0, 27, 0, 0, 0, '2019-10-30 18:48:26'),
(1366, 24, 1, 0, 0, 0, 0, '2020-10-25 07:56:52'),
(1367, 24, 0, 31, 0, 0, 0, '2020-10-25 07:56:53'),
(1368, 24, 2, 0, 0, 0, 0, '2020-10-25 07:56:53'),
(1369, 24, 0, 7, 0, 0, 0, '2020-10-25 07:56:53'),
(1370, 24, 0, 8, 0, 0, 0, '2020-10-25 07:56:53'),
(1371, 24, 0, 21, 0, 0, 0, '2020-10-25 07:56:53'),
(1372, 24, 0, 22, 0, 0, 0, '2020-10-25 07:56:53'),
(1373, 24, 0, 28, 0, 0, 0, '2020-10-25 07:56:53'),
(1374, 24, 0, 9, 0, 0, 0, '2020-10-25 07:56:53'),
(1375, 24, 0, 30, 0, 0, 0, '2020-10-25 07:56:54'),
(1376, 24, 0, 29, 0, 0, 0, '2020-10-25 07:56:54'),
(1377, 24, 0, 11, 0, 0, 0, '2020-10-25 07:56:54'),
(1378, 24, 0, 25, 0, 0, 0, '2020-10-25 07:56:54'),
(1379, 24, 3, 0, 0, 0, 0, '2020-10-25 07:56:54'),
(1380, 24, 0, 14, 0, 0, 0, '2020-10-25 07:56:54'),
(1381, 24, 0, 16, 0, 0, 0, '2020-10-25 07:56:54'),
(1382, 24, 4, 0, 0, 0, 0, '2020-10-25 07:56:54'),
(1383, 24, 0, 12, 0, 0, 0, '2020-10-25 07:56:54'),
(1384, 24, 0, 38, 0, 0, 0, '2020-10-25 07:56:54'),
(1385, 24, 0, 13, 0, 0, 0, '2020-10-25 07:56:54'),
(1386, 24, 0, 37, 0, 0, 0, '2020-10-25 07:56:54'),
(1387, 24, 0, 26, 0, 0, 0, '2020-10-25 07:56:54'),
(1388, 24, 5, 0, 0, 0, 0, '2020-10-25 07:56:54'),
(1389, 24, 0, 17, 0, 0, 0, '2020-10-25 07:56:54'),
(1390, 24, 0, 18, 0, 0, 0, '2020-10-25 07:56:54'),
(1391, 24, 0, 19, 0, 0, 0, '2020-10-25 07:56:54'),
(1392, 24, 0, 23, 0, 0, 0, '2020-10-25 07:56:54'),
(1393, 24, 0, 24, 0, 0, 0, '2020-10-25 07:56:54'),
(1394, 24, 0, 27, 0, 0, 0, '2020-10-25 07:56:54'),
(1395, 24, 33, 0, 0, 0, 0, '2020-10-25 07:56:54'),
(1396, 24, 0, 34, 0, 0, 0, '2020-10-25 07:56:54'),
(1397, 24, 0, 35, 0, 0, 0, '2020-10-25 07:56:54'),
(1398, 24, 0, 36, 0, 0, 0, '2020-10-25 07:56:54'),
(1430, 0, 1, 0, 0, 0, 0, '2021-01-04 08:35:22'),
(1431, 0, 0, 31, 0, 0, 0, '2021-01-04 08:35:22'),
(1432, 0, 2, 0, 0, 0, 0, '2021-01-04 08:35:22'),
(1433, 0, 0, 7, 0, 0, 0, '2021-01-04 08:35:22'),
(1434, 0, 0, 8, 0, 0, 0, '2021-01-04 08:35:22'),
(1435, 0, 0, 9, 0, 0, 0, '2021-01-04 08:35:22'),
(1436, 0, 0, 29, 0, 0, 0, '2021-01-04 08:35:22'),
(1437, 0, 4, 0, 0, 0, 0, '2021-01-04 08:35:22'),
(1438, 0, 0, 12, 0, 0, 0, '2021-01-04 08:35:22'),
(1439, 0, 0, 39, 0, 0, 0, '2021-01-04 08:35:22'),
(1440, 0, 5, 0, 0, 0, 0, '2021-01-04 08:35:22'),
(1441, 0, 0, 18, 0, 0, 0, '2021-01-04 08:35:22'),
(1442, 0, 0, 40, 0, 0, 0, '2021-01-04 08:35:22'),
(1443, 0, 0, 41, 0, 0, 0, '2021-01-04 08:35:22'),
(1683, 25, 1, 0, 0, 0, 0, '2021-01-28 06:43:10'),
(1684, 25, 0, 31, 0, 0, 0, '2021-01-28 06:43:10'),
(1685, 25, 2, 0, 0, 0, 0, '2021-01-28 06:43:10'),
(1686, 25, 0, 7, 0, 0, 0, '2021-01-28 06:43:10'),
(1687, 25, 0, 8, 0, 0, 0, '2021-01-28 06:43:10'),
(1688, 25, 0, 9, 0, 0, 0, '2021-01-28 06:43:10'),
(1689, 25, 0, 29, 0, 0, 0, '2021-01-28 06:43:10'),
(1690, 25, 0, 42, 0, 0, 0, '2021-01-28 06:43:10'),
(1691, 25, 4, 0, 0, 0, 0, '2021-01-28 06:43:10'),
(1692, 25, 0, 12, 0, 0, 0, '2021-01-28 06:43:10'),
(1693, 25, 0, 39, 0, 0, 0, '2021-01-28 06:43:10'),
(1694, 25, 0, 43, 0, 0, 0, '2021-01-28 06:43:10'),
(1695, 25, 0, 44, 0, 0, 0, '2021-01-28 06:43:10'),
(1696, 25, 0, 45, 0, 0, 0, '2021-01-28 06:43:10'),
(1697, 25, 0, 47, 0, 0, 0, '2021-01-28 06:43:10'),
(1698, 25, 0, 48, 0, 0, 0, '2021-01-28 06:43:10'),
(1699, 25, 5, 0, 0, 0, 0, '2021-01-28 06:43:10'),
(1700, 25, 0, 18, 0, 0, 0, '2021-01-28 06:43:10'),
(1701, 25, 0, 40, 0, 0, 0, '2021-01-28 06:43:10'),
(1702, 25, 0, 41, 0, 0, 0, '2021-01-28 06:43:10'),
(1703, 25, 0, 46, 0, 0, 0, '2021-01-28 06:43:10'),
(1704, 26, 1, 0, 0, 0, 0, '2021-01-28 06:43:59'),
(1705, 26, 0, 31, 0, 0, 0, '2021-01-28 06:43:59'),
(1706, 26, 2, 0, 0, 0, 0, '2021-01-28 06:43:59'),
(1707, 26, 0, 7, 0, 0, 0, '2021-01-28 06:43:59'),
(1708, 26, 0, 8, 0, 0, 0, '2021-01-28 06:43:59'),
(1709, 26, 0, 9, 0, 0, 0, '2021-01-28 06:43:59'),
(1710, 26, 0, 29, 0, 0, 0, '2021-01-28 06:43:59'),
(1711, 26, 0, 42, 0, 0, 0, '2021-01-28 06:43:59'),
(1712, 26, 4, 0, 0, 0, 0, '2021-01-28 06:43:59'),
(1713, 26, 0, 12, 0, 0, 0, '2021-01-28 06:43:59'),
(1714, 26, 0, 39, 0, 0, 0, '2021-01-28 06:43:59'),
(1715, 26, 0, 43, 0, 0, 0, '2021-01-28 06:43:59'),
(1716, 26, 0, 44, 0, 0, 0, '2021-01-28 06:43:59'),
(1717, 26, 0, 45, 0, 0, 0, '2021-01-28 06:43:59'),
(1718, 26, 0, 47, 0, 0, 0, '2021-01-28 06:43:59'),
(1719, 26, 0, 48, 0, 0, 0, '2021-01-28 06:43:59'),
(1720, 26, 5, 0, 0, 0, 0, '2021-01-28 06:43:59'),
(1721, 26, 0, 18, 0, 0, 0, '2021-01-28 06:43:59'),
(1722, 26, 0, 40, 0, 0, 0, '2021-01-28 06:43:59'),
(1723, 26, 0, 41, 0, 0, 0, '2021-01-28 06:43:59'),
(1724, 26, 0, 46, 0, 0, 0, '2021-01-28 06:43:59'),
(1725, 28, 1, 0, 0, 0, 0, '2021-01-28 06:45:15'),
(1726, 28, 2, 0, 0, 0, 0, '2021-01-28 06:45:15'),
(1727, 28, 4, 0, 0, 0, 0, '2021-01-28 06:45:15'),
(1728, 28, 5, 0, 0, 0, 0, '2021-01-28 06:45:15'),
(1729, 28, 0, 18, 0, 0, 0, '2021-01-28 06:45:15'),
(1730, 28, 0, 40, 0, 0, 0, '2021-01-28 06:45:15'),
(1731, 28, 0, 41, 0, 0, 0, '2021-01-28 06:45:15'),
(1732, 28, 0, 46, 0, 0, 0, '2021-01-28 06:45:15'),
(1733, 28, 0, 45, 0, 0, 0, '2021-01-28 06:45:15'),
(1734, 28, 0, 47, 0, 0, 0, '2021-01-28 06:45:15'),
(1735, 28, 0, 48, 0, 0, 0, '2021-01-28 06:45:15'),
(1756, 30, 1, 0, 0, 0, 0, '2021-02-18 08:04:34'),
(1757, 30, 0, 31, 0, 0, 0, '2021-02-18 08:04:34'),
(1758, 30, 2, 0, 0, 0, 0, '2021-02-18 08:04:34'),
(1759, 30, 0, 8, 0, 0, 0, '2021-02-18 08:04:34'),
(1760, 30, 4, 0, 0, 0, 0, '2021-02-18 08:04:34'),
(1761, 30, 0, 12, 0, 0, 0, '2021-02-18 08:04:34'),
(1762, 30, 0, 44, 0, 0, 0, '2021-02-18 08:04:34'),
(1763, 30, 0, 45, 0, 0, 0, '2021-02-18 08:04:34'),
(1764, 30, 5, 0, 0, 0, 0, '2021-02-18 08:04:34'),
(1765, 30, 0, 18, 0, 0, 0, '2021-02-18 08:04:34'),
(1766, 30, 0, 40, 0, 0, 0, '2021-02-18 08:04:34'),
(1767, 30, 0, 41, 0, 0, 0, '2021-02-18 08:04:34'),
(1768, 30, 0, 46, 0, 0, 0, '2021-02-18 08:04:34'),
(1792, 32, 1, 0, 0, 0, 0, '2021-11-18 07:59:06'),
(1793, 32, 4, 0, 0, 0, 0, '2021-11-18 07:59:06'),
(1794, 32, 0, 12, 0, 0, 0, '2021-11-18 07:59:06'),
(1795, 32, 0, 39, 0, 0, 0, '2021-11-18 07:59:06'),
(1796, 32, 0, 44, 0, 0, 0, '2021-11-18 07:59:06'),
(1797, 32, 0, 47, 0, 0, 0, '2021-11-18 07:59:06'),
(1798, 32, 0, 48, 0, 0, 0, '2021-11-18 07:59:06'),
(1799, 33, 1, 0, 0, 0, 0, '2022-01-17 09:09:04'),
(1800, 33, 2, 0, 0, 0, 0, '2022-01-17 09:09:04'),
(1801, 33, 4, 0, 0, 0, 0, '2022-01-17 09:09:04'),
(1802, 33, 5, 0, 0, 0, 0, '2022-01-17 09:09:04'),
(1803, 33, 0, 18, 0, 0, 0, '2022-01-17 09:09:04'),
(1804, 33, 0, 40, 0, 0, 0, '2022-01-17 09:09:04'),
(1805, 33, 0, 41, 0, 0, 0, '2022-01-17 09:09:04'),
(1806, 33, 0, 46, 0, 0, 0, '2022-01-17 09:09:04'),
(1807, 33, 0, 45, 0, 0, 0, '2022-01-17 09:09:04'),
(1808, 33, 0, 47, 0, 0, 0, '2022-01-17 09:09:04'),
(1809, 33, 0, 48, 0, 0, 0, '2022-01-17 09:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `pos_inventory`
--

CREATE TABLE `pos_inventory` (
  `trans_id` int(11) NOT NULL,
  `company_id` int(255) NOT NULL,
  `trans_item` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_inventory` int(11) NOT NULL DEFAULT '0',
  `invoice_no` varchar(20) DEFAULT NULL,
  `cost_price` decimal(10,4) DEFAULT '0.0000',
  `unit_price` decimal(10,4) DEFAULT '0.0000',
  `delivery_date` varchar(50) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_inventory`
--

INSERT INTO `pos_inventory` (`trans_id`, `company_id`, `trans_item`, `trans_user`, `trans_date`, `trans_comment`, `trans_inventory`, `invoice_no`, `cost_price`, `unit_price`, `delivery_date`, `currency_id`) VALUES
(2, 21, 1, 12, '2020-12-03 10:28:21', 'KSRECV', 1, 'R1', '300.0000', '400.0000', NULL, NULL),
(3, 21, 1, 12, '2020-12-03 14:04:43', 'KSRECV', 1, 'R2', '300.0000', '400.0000', NULL, NULL),
(4, 21, 1, 12, '2020-12-03 14:11:06', 'KSRECV', 1, 'R3', '300.0000', '400.0000', NULL, NULL),
(23, 21, 18, 12, '2020-12-09 14:35:54', 'KSRECV', 1, 'PO3', '15.0000', '0.0000', NULL, NULL),
(32, 21, 19, 12, '2020-12-10 09:22:49', 'KSRECV', 1, 'PO-003.20', '15.0000', '0.0000', NULL, NULL),
(33, 21, 19, 12, '2020-12-10 09:26:09', 'KSRECV', 1, 'PO-004.20', '15.0000', '0.0000', NULL, NULL),
(34, 21, 19, 12, '2020-12-10 09:30:49', 'KSRECV', 1, 'PO-004.20', '15.0000', '0.0000', NULL, NULL),
(36, 21, 19, 12, '2020-12-10 09:45:52', 'KSRECV', 1, 'PO-006.20', '15.0000', '0.0000', NULL, NULL),
(38, 21, 19, 12, '2020-12-10 09:55:46', 'KSRECV', 1, 'PO-008.20', '15.0000', '0.0000', NULL, NULL),
(41, 21, 19, 12, '2020-12-11 05:33:20', 'KSRECV', 1, 'PO-010.20', '15.0000', '0.0000', NULL, NULL),
(64, 21, 19, 12, '2020-12-11 10:42:16', 'KSRECV', 1, 'po1', '15.0000', '0.0000', NULL, NULL),
(65, 21, 20, 12, '2020-12-11 10:42:16', 'KSRECV', 1, 'po1', '30.0000', '0.0000', NULL, NULL),
(85, 21, 19, 12, '2020-12-11 11:14:48', 'KSRECV', -1, 'po12', '-15.0000', '0.0000', NULL, NULL),
(86, 21, 20, 12, '2020-12-11 11:14:48', 'KSRECV', -1, 'po12', '-30.0000', '0.0000', NULL, NULL),
(87, 21, 21, 12, '2020-12-11 11:14:48', 'KSRECV', -1, 'po12', '-0.5400', '0.0000', NULL, NULL),
(88, 21, 19, 12, '2020-12-11 11:17:26', 'KSRECV', 1, 'po122', '15.0000', '0.0000', NULL, NULL),
(89, 21, 20, 12, '2020-12-11 11:17:26', 'KSRECV', 1, 'po122', '30.0000', '0.0000', NULL, NULL),
(90, 21, 21, 12, '2020-12-11 11:17:26', 'KSRECV', 3, 'po122', '0.5400', '0.0000', NULL, NULL),
(94, 21, 19, 12, '2020-12-11 11:23:26', 'KSRECV', 1, 'po1223', '15.0000', '0.0000', NULL, NULL),
(95, 21, 20, 12, '2020-12-11 11:23:27', 'KSRECV', 1, 'po1223', '30.0000', '0.0000', NULL, NULL),
(96, 21, 21, 12, '2020-12-11 11:23:27', 'KSRECV', 3, 'po1223', '0.5400', '0.0000', NULL, NULL),
(106, 21, 20, 12, '2020-12-13 19:33:48', 'KSRECV', 1, 'PO-002.20', '20.0000', '0.0000', NULL, NULL),
(107, 21, 19, 12, '2020-12-14 02:27:24', 'KSRECV', 1, 'PO-099.21', '11.6668', '0.0000', NULL, NULL),
(108, 21, 20, 12, '2020-12-14 02:27:24', 'KSRECV', 1, 'PO-099.21', '14.6154', '0.0000', NULL, NULL),
(109, 21, 21, 12, '2020-12-14 02:27:24', 'KSRECV', 1, 'PO-099.21', '0.5400', '0.0000', NULL, NULL),
(112, 21, 20, 12, '2020-12-15 05:33:16', 'KSRECV', 1, 'PO-007.20', '14.6154', '0.0000', NULL, NULL),
(113, 21, 21, 12, '2020-12-15 05:33:17', 'KSRECV', 1, 'PO-007.20', '0.5400', '0.0000', NULL, NULL),
(114, 21, 20, 12, '2020-12-15 16:26:12', 'KSRECV', 10, 'PO-008.2o', '14.6154', '0.0000', NULL, NULL),
(115, 21, 21, 12, '2020-12-15 16:26:12', 'KSRECV', 10, 'PO-008.2o', '0.5400', '0.0000', NULL, NULL),
(116, 21, 22, 12, '2020-12-15 16:26:12', 'KSRECV', 10, 'PO-008.2o', '15.0000', '0.0000', NULL, NULL),
(117, 21, 19, 12, '2020-12-15 16:27:45', 'KSRECV', 10, 'PO-010.20', '11.6668', '0.0000', NULL, NULL),
(118, 21, 20, 12, '2020-12-15 16:27:45', 'KSRECV', 10, 'PO-010.20', '14.6154', '0.0000', NULL, NULL),
(119, 21, 21, 12, '2020-12-15 16:27:45', 'KSRECV', 10, 'PO-010.20', '0.5400', '0.0000', NULL, NULL),
(120, 21, 22, 12, '2020-12-15 16:27:45', 'KSRECV', 10, 'PO-010.20', '15.0000', '0.0000', NULL, NULL),
(121, 21, 20, 12, '2020-12-15 18:02:23', 'KSRECV', 1, 'PO-005.20', '110.0000', '0.0000', NULL, NULL),
(122, 21, 20, 12, '2020-12-15 18:02:23', 'KSRECV', 1, 'PO-005.20', '120.0000', '0.0000', NULL, NULL),
(123, 21, 22, 12, '2020-12-15 18:10:47', 'KSRECV', 50, 'PO-001.20', '15.0000', '0.0000', NULL, NULL),
(124, 21, 23, 12, '2020-12-17 05:36:02', 'KSRECV', 1, 'PO-01', '100.0000', '0.0000', NULL, NULL),
(125, 21, 23, 12, '2020-12-17 05:36:02', 'KSRECV', 1, 'PO-01', '100.0000', '0.0000', NULL, NULL),
(128, 21, 23, 12, '2020-12-21 07:12:22', 'KSRECV', 10, 'PO-04.20', '100.0000', '0.0000', NULL, NULL),
(129, 21, 24, 12, '2020-12-21 07:12:22', 'KSRECV', 10, 'PO-04.20', '150.0000', '0.0000', NULL, NULL),
(130, 21, 23, 12, '2020-12-22 13:01:47', 'KSRECV', 10, 'PO-002.2021', '100.0000', '0.0000', NULL, NULL),
(131, 21, 24, 12, '2020-12-22 13:01:48', 'KSRECV', 3, 'PO-002.2021', '150.0000', '0.0000', NULL, NULL),
(160, 21, 27, 12, '2021-01-05 07:19:04', 'KSRECV', 1, 'po-001', '25.0000', '0.0000', NULL, NULL),
(346, 21, 742, 26, '2021-02-18 09:36:21', 'KSRECV', 10, 'PO-21.002', '200.0000', '0.0000', NULL, NULL),
(362, 21, 868, 12, '2021-02-19 06:02:41', 'KSRECV', 3000, 'PO-21.001', '2.2400', '0.0000', NULL, NULL),
(363, 21, 869, 12, '2021-02-19 06:02:41', 'KSRECV', 2, 'PO-21.001', '1288.0000', '0.0000', NULL, NULL),
(403, 21, 580, 12, '2021-02-24 06:24:33', 'KSRECV', 100, 'PO-21.010', '156.8000', '0.0000', NULL, NULL),
(404, 21, 799, 12, '2021-02-24 06:24:33', 'KSRECV', 100, 'PO-21.010', '28.9520', '0.0000', NULL, NULL),
(418, 21, 580, 25, '2021-02-24 06:54:45', 'KSRECV', 100, 'PO-21.014', '313.6000', '0.0000', NULL, NULL),
(419, 21, 877, 25, '2021-02-24 06:54:45', 'KSRECV', 1, 'PO-21.014', '8736.0000', '0.0000', NULL, NULL),
(422, 21, 540, 26, '2021-02-26 00:21:38', 'KSRECV', 30, 'PO-21.005', '20.5000', '0.0000', NULL, NULL),
(423, 21, 541, 26, '2021-02-26 00:21:39', 'KSRECV', 50, 'PO-21.005', '50.0000', '0.0000', NULL, NULL),
(424, 21, 542, 26, '2021-02-26 00:21:39', 'KSRECV', 30, 'PO-21.005', '14.5000', '0.0000', NULL, NULL),
(425, 21, 557, 26, '2021-02-26 00:21:39', 'KSRECV', 5, 'PO-21.005', '8.6000', '0.0000', NULL, NULL),
(426, 21, 560, 26, '2021-02-26 00:21:39', 'KSRECV', 5, 'PO-21.005', '12.3000', '0.0000', NULL, NULL),
(427, 21, 578, 26, '2021-02-26 00:21:39', 'KSRECV', 5, 'PO-21.005', '15.5000', '0.0000', NULL, NULL),
(428, 21, 696, 26, '2021-02-26 00:21:39', 'KSRECV', 50, 'PO-21.005', '135.0000', '0.0000', NULL, NULL),
(429, 21, 698, 26, '2021-02-26 00:21:39', 'KSRECV', 5, 'PO-21.005', '19.4000', '0.0000', NULL, NULL),
(430, 21, 739, 26, '2021-02-26 00:21:39', 'KSRECV', 30, 'PO-21.005', '21.8700', '0.0000', NULL, NULL),
(431, 21, 875, 26, '2021-02-26 00:21:39', 'KSRECV', 25, 'PO-21.005', '14.5000', '0.0000', NULL, NULL),
(432, 21, 773, 26, '2021-02-26 00:22:34', 'KSRECV', 3, 'PO-21.006', '4800.0000', '0.0000', NULL, NULL),
(434, 21, 878, 26, '2021-03-01 01:41:45', 'KSRECV', 50, 'PO-21.011', '550.0000', '0.0000', NULL, NULL),
(468, 21, 886, 25, '2021-03-10 05:33:56', 'KSRECV', 1, 'PO-20.018', '45001.6000', '0.0000', NULL, NULL),
(469, 21, 887, 25, '2021-03-10 05:33:56', 'KSRECV', 6, 'PO-20.018', '3124.8000', '0.0000', NULL, NULL),
(470, 21, 884, 26, '2021-03-10 05:46:14', 'KSRECV', 30, 'PO-21.018', '336.0000', '0.0000', NULL, NULL),
(473, 21, 886, 25, '2021-03-10 07:04:37', 'KSRECV', 1, 'PO-20.019', '45001.6000', '0.0000', NULL, NULL),
(474, 21, 887, 25, '2021-03-10 07:04:37', 'KSRECV', 6, 'PO-20.019', '3124.8000', '0.0000', NULL, NULL),
(493, 21, 882, 12, '2021-03-15 05:51:00', 'KSRECV', 1, 'PO-21.016', '33750.0000', '0.0000', NULL, NULL),
(558, 21, 883, 26, '2021-04-06 06:31:21', 'KSRECV', 2, 'PO-21.017', '24003.8600', '0.0000', NULL, NULL),
(561, 21, 886, 26, '2021-04-06 06:32:02', 'KSRECV', 1, 'PO-21.019', '45001.6000', '0.0000', NULL, NULL),
(562, 21, 887, 26, '2021-04-06 06:32:02', 'KSRECV', 6, 'PO-21.019', '3124.8000', '0.0000', NULL, NULL),
(613, 21, 542, 26, '2021-04-08 08:55:14', 'KSRECV', 10, 'PO-21.012', '14.5000', '0.0000', NULL, NULL),
(614, 21, 578, 26, '2021-04-08 08:55:14', 'KSRECV', 15, 'PO-21.012', '15.5000', '0.0000', NULL, NULL),
(615, 21, 666, 26, '2021-04-08 08:55:14', 'KSRECV', 5, 'PO-21.012', '13.5000', '0.0000', NULL, NULL),
(616, 21, 696, 26, '2021-04-08 08:55:14', 'KSRECV', 10, 'PO-21.012', '135.0000', '0.0000', NULL, NULL),
(617, 21, 864, 26, '2021-04-08 08:55:55', 'KSRECV', 300000, 'PO-21.015', '0.3600', '0.0000', NULL, NULL),
(618, 21, 867, 26, '2021-04-08 08:55:55', 'KSRECV', 200000, 'PO-21.015', '0.1700', '0.0000', NULL, NULL),
(619, 21, 879, 26, '2021-04-08 08:56:30', 'KSRECV', 5000, 'PO-21.009', '19.0000', '0.0000', NULL, NULL),
(620, 21, 773, 26, '2021-04-08 08:57:03', 'KSRECV', 25, 'PO-21.013', '3450.0000', '0.0000', NULL, NULL),
(635, 21, 896, 26, '2021-04-15 06:52:33', 'KSRECV', 240000, 'PO-21.028', '0.4500', '0.0000', NULL, NULL),
(636, 21, 865, 26, '2021-04-15 06:53:04', 'KSRECV', 320000, 'PO-21.024', '0.3200', '0.0000', NULL, NULL),
(637, 21, 867, 26, '2021-04-15 06:53:04', 'KSRECV', 200000, 'PO-21.024', '0.1700', '0.0000', NULL, NULL),
(662, 21, 651, 26, '2021-04-21 02:36:28', 'KSRECV', 100, 'PO-21.027', '520.0000', '0.0000', NULL, NULL),
(664, 21, 751, 26, '2021-04-21 02:38:05', 'KSRECV', 400, 'PO-21.008', '110.0000', '0.0000', NULL, NULL),
(669, 21, 868, 26, '2021-04-26 00:37:39', 'KSRECV', 3000, 'PO-21.030', '2.9000', '0.0000', NULL, NULL),
(670, 21, 869, 26, '2021-04-26 00:37:39', 'KSRECV', 2, 'PO-21.030', '1288.0000', '0.0000', NULL, NULL),
(671, 21, 898, 26, '2021-04-26 00:37:39', 'KSRECV', 100, 'PO-21.030', '36.0000', '0.0000', NULL, NULL),
(672, 21, 884, 26, '2021-04-26 00:40:04', 'KSRECV', 20, 'PO-21.031', '336.0000', '0.0000', NULL, NULL),
(673, 21, 890, 26, '2021-04-26 09:13:16', 'KSRECV', 20000, 'PO-21.022', '2.5000', '0.0000', NULL, NULL),
(674, 21, 891, 26, '2021-04-26 09:13:16', 'KSRECV', 10000, 'PO-21.022', '1.9000', '0.0000', NULL, NULL),
(675, 21, 893, 26, '2021-04-26 09:13:16', 'KSRECV', 2000, 'PO-21.022', '8.0000', '0.0000', NULL, NULL),
(676, 21, 894, 26, '2021-04-26 09:13:16', 'KSRECV', 2000, 'PO-21.022', '8.0000', '0.0000', NULL, NULL),
(677, 21, 895, 26, '2021-04-26 09:13:16', 'KSRECV', 2000, 'PO-21.022', '8.0000', '0.0000', NULL, NULL),
(680, 21, 901, 26, '2021-04-28 07:27:34', 'KSRECV', 10, 'PO-21.032', '5350.0000', '0.0000', NULL, NULL),
(721, 21, 863, 26, '2021-05-12 05:45:00', 'KSRECV', 200000, 'PO-21.038', '0.1500', '0.0000', NULL, NULL),
(722, 21, 867, 26, '2021-05-12 05:45:00', 'KSRECV', 200000, 'PO-21.038', '0.1700', '0.0000', NULL, NULL),
(737, 21, 878, 26, '2021-05-17 06:19:21', 'KSRECV', 25, 'PO-21.020', '580.0000', '0.0000', NULL, NULL),
(738, 21, 903, 26, '2021-05-17 06:21:29', 'KSRECV', 500, 'PO-21.021', '33.7500', '0.0000', NULL, NULL),
(739, 21, 889, 26, '2021-05-17 06:21:29', 'KSRECV', 3000, 'PO-21.021', '47.0000', '0.0000', NULL, NULL),
(740, 21, 905, 26, '2021-05-19 01:43:19', 'KSRECV', 200, 'PO-21.040', '71.1400', '0.0000', NULL, NULL),
(741, 21, 763, 26, '2021-05-19 05:45:53', 'KSRECV', 15, 'PO-21.023', '31.6000', '0.0000', NULL, NULL),
(742, 21, 696, 26, '2021-05-19 05:45:53', 'KSRECV', 50, 'PO-21.023', '135.0000', '0.0000', NULL, NULL),
(743, 21, 749, 26, '2021-05-19 05:45:53', 'KSRECV', 10, 'PO-21.023', '27.0000', '0.0000', NULL, NULL),
(744, 21, 560, 26, '2021-05-19 05:45:53', 'KSRECV', 5, 'PO-21.023', '12.3000', '0.0000', NULL, NULL),
(745, 21, 578, 26, '2021-05-19 05:45:53', 'KSRECV', 5, 'PO-21.023', '15.5000', '0.0000', NULL, NULL),
(746, 21, 542, 26, '2021-05-19 05:45:53', 'KSRECV', 50, 'PO-21.023', '14.5000', '0.0000', NULL, NULL),
(764, 21, 904, 26, '2021-05-26 05:24:32', 'KSRECV', 4000, 'PO-21.036', '0.1180', '0.0000', NULL, NULL),
(765, 21, 904, 26, '2021-05-26 05:24:32', 'KSRECV', 1, 'PO-21.036', '234.0000', '0.0000', NULL, NULL),
(766, 21, 904, 26, '2021-05-26 05:24:32', 'KSRECV', 1, 'PO-21.036', '50.0000', '0.0000', NULL, NULL),
(791, 21, 900, 26, '2021-06-07 08:13:29', 'KSRECV', 10000, 'PO-21.033', '0.0750', '0.0000', NULL, NULL),
(795, 21, 879, 26, '2021-06-10 02:39:30', 'KSRECV', 5000, 'PO-21.044', '20.0000', '0.0000', NULL, NULL),
(802, 21, 791, 26, '2021-06-15 05:54:55', 'KSRECV', 25, 'PO-21.047', '600.0000', '0.0000', NULL, NULL),
(809, 21, 907, 26, '2021-06-16 09:06:47', 'KSRECV', 2, 'PO-21.043', '4845.0000', '0.0000', NULL, NULL),
(813, 21, 615, 26, '2021-06-17 05:41:32', 'KSRECV', 3, 'PO-21.039', '20.0000', '0.0000', NULL, NULL),
(814, 21, 615, 26, '2021-06-17 05:41:32', 'KSRECV', 1, 'PO-21.039', '8.9000', '0.0000', NULL, NULL),
(815, 21, 897, 26, '2021-06-17 05:41:32', 'KSRECV', 1, 'PO-21.039', '40.0000', '0.0000', NULL, NULL),
(816, 21, 899, 26, '2021-06-17 05:41:32', 'KSRECV', 3, 'PO-21.039', '26.0000', '0.0000', NULL, NULL),
(818, 21, 908, 26, '2021-06-18 03:07:50', 'KSRECV', 80000, 'PO-21.042', '0.2000', '0.0000', NULL, NULL),
(830, 21, 833, 26, '2021-06-27 12:47:46', 'KSRECV', 30000, 'PO-21.004', '0.1300', '0.0000', NULL, NULL),
(831, 21, 845, 26, '2021-06-27 12:47:46', 'KSRECV', 20000, 'PO-21.004', '0.2050', '0.0000', NULL, NULL),
(861, 21, 868, 26, '2021-06-30 09:56:09', 'KSRECV', 3000, 'PO-21.051', '2.9000', '0.0000', NULL, NULL),
(862, 21, 869, 26, '2021-06-30 09:56:09', 'KSRECV', 2000, 'PO-21.051', '1.6600', '0.0000', NULL, NULL),
(863, 21, 898, 26, '2021-06-30 09:56:09', 'KSRECV', 100, 'PO-21.051', '66.0000', '0.0000', NULL, NULL),
(864, 21, 911, 26, '2021-06-30 09:56:09', 'KSRECV', 3, 'PO-21.051', '2920.0000', '0.0000', NULL, NULL),
(866, 21, 572, 26, '2021-07-06 00:58:50', 'KSRECV', 5, 'PO-21.053', '1380.6800', '0.0000', NULL, NULL),
(867, 21, 580, 26, '2021-07-06 00:58:50', 'KSRECV', 150, 'PO-21.053', '313.6000', '0.0000', NULL, NULL),
(868, 21, 646, 26, '2021-07-06 00:58:50', 'KSRECV', 5, 'PO-21.053', '73.9200', '0.0000', NULL, NULL),
(869, 21, 795, 26, '2021-07-06 00:58:50', 'KSRECV', 5, 'PO-21.053', '644.7100', '0.0000', NULL, NULL),
(874, 21, 913, 26, '2021-07-12 04:31:19', 'KSRECV', 100000, 'PO-21.055', '0.1600', '0.0000', NULL, NULL),
(875, 21, 912, 26, '2021-07-12 04:31:19', 'KSRECV', 15, 'PO-21.055', '17500.0000', '0.0000', NULL, NULL),
(888, 21, 914, 26, '2021-07-19 04:34:53', 'KSRECV', 10, 'PO-21.056', '1350.0000', '0.0000', NULL, NULL),
(891, 21, 915, 26, '2021-07-19 04:37:26', 'KSRECV', 50, 'PO-21.057', '350.0000', '0.0000', NULL, NULL),
(892, 21, 526, 26, '2021-07-22 01:22:12', 'KSRECV', 30, 'PO-21.045', '13.0000', '0.0000', NULL, NULL),
(893, 21, 542, 26, '2021-07-22 01:22:12', 'KSRECV', 30, 'PO-21.045', '14.5000', '0.0000', NULL, NULL),
(894, 21, 696, 26, '2021-07-22 01:22:12', 'KSRECV', 97, 'PO-21.045', '135.0000', '0.0000', NULL, NULL),
(895, 21, 875, 26, '2021-07-22 01:22:12', 'KSRECV', 40, 'PO-21.045', '14.5000', '0.0000', NULL, NULL),
(896, 21, 909, 26, '2021-07-22 01:22:12', 'KSRECV', 5, 'PO-21.045', '16.0000', '0.0000', NULL, NULL),
(901, 21, 919, 26, '2021-07-29 02:00:18', 'KSRECV', 3, 'PO-21.063', '2700.0000', '0.0000', NULL, NULL),
(902, 21, 862, 26, '2021-07-29 05:56:05', 'KSRECV', 100000, 'PO-21.060', '0.1500', '0.0000', NULL, NULL),
(903, 21, 864, 26, '2021-07-29 05:56:06', 'KSRECV', 200000, 'PO-21.060', '0.3600', '0.0000', NULL, NULL),
(904, 21, 910, 26, '2021-07-29 07:18:15', 'KSRECV', 13, 'PO-21.052', '15.4000', '0.0000', NULL, NULL),
(905, 21, 910, 26, '2021-07-29 07:19:04', 'KSRECV', 28, 'PO-21.050', '15.4000', '0.0000', NULL, NULL),
(906, 21, 910, 26, '2021-07-29 07:19:04', 'KSRECV', 7, 'PO-21.050', '65.0000', '0.0000', NULL, NULL),
(907, 21, 910, 26, '2021-07-29 07:19:04', 'KSRECV', 1, 'PO-21.050', '22.0000', '0.0000', NULL, NULL),
(908, 21, 919, 26, '2021-07-29 07:28:42', 'KSRECV', 3, 'PO-21.059', '2700.0000', '0.0000', NULL, NULL),
(910, 21, 882, 26, '2021-08-02 02:49:52', 'KSRECV', 5000, 'PO-21.061', '6.7500', '0.0000', NULL, NULL),
(913, 21, 918, 26, '2021-08-03 06:09:05', 'KSRECV', 15, 'PO-21.062', '260.0000', '0.0000', NULL, NULL),
(915, 21, 920, 26, '2021-08-04 06:06:29', 'KSRECV', 1, 'PO-21.064', '50000.0000', '0.0000', NULL, NULL),
(921, 21, 754, 26, '2021-08-10 09:16:14', 'KSRECV', 100, 'PO-21.049', '18.0000', '0.0000', NULL, NULL),
(927, 21, 927, 26, '2021-08-16 04:12:51', 'KSRECV', 1, 'PO*21.070', '405.0000', '0.0000', NULL, NULL),
(945, 21, 834, 26, '2021-08-21 05:52:25', 'KSRECV', 30000, 'PO-21.046', '0.1300', '0.0000', NULL, NULL),
(946, 21, 846, 26, '2021-08-21 05:52:25', 'KSRECV', 10000, 'PO-21.046', '0.2050', '0.0000', NULL, NULL),
(947, 21, 672, 26, '2021-08-21 05:53:05', 'KSRECV', 100, 'PO-21.066', '550.0000', '0.0000', NULL, NULL),
(948, 21, 887, 26, '2021-08-21 05:53:43', 'KSRECV', 6, 'PO-21.069', '2930.0000', '0.0000', NULL, NULL),
(949, 21, 887, 26, '2021-08-21 05:53:43', 'KSRECV', 1, 'PO-21.069', '2109.6000', '0.0000', NULL, NULL),
(951, 21, 927, 26, '2021-08-23 11:18:32', 'KSRECV', 1, 'PO-21.070', '450.0000', '0.0000', NULL, NULL),
(952, 21, 927, 26, '2021-08-23 11:18:32', 'KSRECV', 1, 'PO-21.070', '298.0000', '0.0000', NULL, NULL),
(958, 21, 921, 26, '2021-08-27 04:34:07', 'KSRECV', 500, 'PO-21.067', '165.0000', '0.0000', NULL, NULL),
(959, 21, 922, 26, '2021-08-27 04:34:07', 'KSRECV', 1000, 'PO-21.067', '60.0000', '0.0000', NULL, NULL),
(960, 21, 923, 26, '2021-08-27 04:34:07', 'KSRECV', 125, 'PO-21.067', '200.0000', '0.0000', NULL, NULL),
(961, 21, 863, 26, '2021-08-27 05:51:53', 'KSRECV', 200000, 'PO-21.072', '0.1500', '0.0000', NULL, NULL),
(962, 21, 864, 26, '2021-08-27 05:51:53', 'KSRECV', 200000, 'PO-21.072', '0.3600', '0.0000', NULL, NULL),
(963, 21, 928, 26, '2021-08-27 05:52:25', 'KSRECV', 3, 'PO-21.073', '3100.0000', '0.0000', NULL, NULL),
(970, 21, 917, 26, '2021-09-02 10:15:14', 'KSRECV', 20, 'PO-21.065', '159.0000', '0.0000', NULL, NULL),
(971, 21, 917, 26, '2021-09-02 10:15:14', 'KSRECV', 1, 'PO-21.065', '914.0000', '0.0000', NULL, NULL),
(985, 21, 928, 26, '2021-09-06 01:22:21', 'KSRECV', 6, 'PO-21.076', '3100.0000', '0.0000', NULL, NULL),
(986, 21, 878, 26, '2021-09-06 01:26:45', 'KSRECV', 25, 'PO-21.034', '580.0000', '0.0000', NULL, NULL),
(988, 21, 930, 26, '2021-09-06 01:33:53', 'KSRECV', 1, 'PO-21.074', '7150.0000', '0.0000', NULL, NULL),
(989, 21, 916, 26, '2021-09-06 01:35:55', 'KSRECV', 40, 'PO-21.077', '85.0000', '0.0000', NULL, NULL),
(992, 21, 928, 26, '2021-09-09 06:03:53', 'KSRECV', 10, 'PO-21.077', '3100.0000', '0.0000', NULL, NULL),
(993, 21, 862, 26, '2021-09-10 06:03:08', 'KSRECV', 200000, 'PO-21.080', '0.1500', '0.0000', NULL, NULL),
(994, 21, 919, 26, '2021-09-10 06:14:52', 'KSRECV', 3, 'PO-21.058', '2950.0000', '0.0000', NULL, NULL),
(998, 21, 928, 26, '2021-09-10 06:35:11', 'KSRECV', 10, 'PO-21.079', '3100.0000', '0.0000', NULL, NULL),
(1013, 21, 919, 26, '2021-09-24 07:31:16', 'KSRECV', 3, 'PO-21.068', '2950.0000', '0.0000', NULL, NULL),
(1014, 21, 863, 26, '2021-09-24 07:32:04', 'KSRECV', 100000, 'PO-21.048', '0.1500', '0.0000', NULL, NULL),
(1015, 21, 867, 26, '2021-09-24 07:32:04', 'KSRECV', 300000, 'PO-21.048', '0.1700', '0.0000', NULL, NULL),
(1017, 21, 931, 26, '2021-09-28 02:55:45', 'KSRECV', 150000, 'PO-21.081', '0.5000', '0.0000', NULL, NULL),
(1024, 21, 924, 26, '2021-09-30 14:09:15', 'KSRECV', 1, 'PO-21.082', '29.0000', '0.0000', NULL, NULL),
(1025, 21, 925, 26, '2021-09-30 14:09:15', 'KSRECV', 1, 'PO-21.082', '16.0000', '0.0000', NULL, NULL),
(1026, 21, 926, 26, '2021-09-30 14:09:15', 'KSRECV', 1, 'PO-21.082', '15.0000', '0.0000', NULL, NULL),
(1027, 21, 867, 26, '2021-10-01 06:10:08', 'KSRECV', 400000, 'PO-21.087', '0.1700', '0.0000', NULL, NULL),
(1028, 21, 791, 26, '2021-10-01 06:10:39', 'KSRECV', 75, 'PO-21.086', '560.0000', '0.0000', NULL, NULL),
(1030, 21, 933, 26, '2021-10-01 07:38:44', 'KSRECV', 125, 'PO-21.088', '90.0000', '0.0000', NULL, NULL),
(1032, 21, 919, 26, '2021-10-01 07:41:50', 'KSRECV', 6, 'PO-21.090', '550.0000', '0.0000', NULL, NULL),
(1034, 21, 879, 26, '2021-10-06 05:51:17', 'KSRECV', 5000, 'PO-21.092', '22.0000', '0.0000', NULL, NULL),
(1038, 21, 602, 26, '2021-10-12 07:31:23', 'KSRECV', 3, 'PO-21.075', '27.0000', '0.0000', NULL, NULL),
(1039, 21, 615, 26, '2021-10-12 07:31:23', 'KSRECV', 3, 'PO-21.075', '20.0000', '0.0000', NULL, NULL),
(1040, 21, 664, 26, '2021-10-12 07:31:23', 'KSRECV', 15, 'PO-21.075', '40.0000', '0.0000', NULL, NULL),
(1041, 21, 806, 26, '2021-10-12 07:31:23', 'KSRECV', 20, 'PO-21.075', '38.0000', '0.0000', NULL, NULL),
(1042, 21, 807, 26, '2021-10-12 07:31:23', 'KSRECV', 15, 'PO-21.075', '75.0000', '0.0000', NULL, NULL),
(1043, 21, 540, 26, '2021-10-13 06:04:06', 'KSRECV', 30, 'PO-21.071', '20.5000', '0.0000', NULL, NULL),
(1044, 21, 542, 26, '2021-10-13 06:04:06', 'KSRECV', 50, 'PO-21.071', '14.5000', '0.0000', NULL, NULL),
(1045, 21, 548, 26, '2021-10-13 06:04:06', 'KSRECV', 20, 'PO-21.071', '139.0000', '0.0000', NULL, NULL),
(1046, 21, 666, 26, '2021-10-13 06:04:07', 'KSRECV', 5, 'PO-21.071', '13.5000', '0.0000', NULL, NULL),
(1047, 21, 924, 26, '2021-10-13 06:04:07', 'KSRECV', 1, 'PO-21.071', '29.0000', '0.0000', NULL, NULL),
(1048, 21, 925, 26, '2021-10-13 06:04:07', 'KSRECV', 1, 'PO-21.071', '16.0000', '0.0000', NULL, NULL),
(1049, 21, 926, 26, '2021-10-13 06:04:07', 'KSRECV', 1, 'PO-21.071', '15.0000', '0.0000', NULL, NULL),
(1054, 21, 919, 26, '2021-10-18 06:06:12', 'KSRECV', 3, 'PO-21.096', '3300.0000', '0.0000', NULL, NULL),
(1055, 21, 915, 26, '2021-10-18 06:10:18', 'KSRECV', 30, 'PO-21.093', '335.0000', '0.0000', NULL, NULL),
(1056, 21, 916, 26, '2021-10-18 06:10:18', 'KSRECV', 60, 'PO-21.093', '83.0000', '0.0000', NULL, NULL),
(1057, 21, 915, 26, '2021-10-18 06:10:18', 'KSRECV', 1, 'PO-21.093', '1592.5000', '0.0000', NULL, NULL),
(1058, 21, 914, 26, '2021-10-18 06:12:16', 'KSRECV', 10, 'PO-21.091', '1500.0000', '0.0000', NULL, NULL),
(1059, 21, 779, 26, '2021-10-19 02:40:06', 'KSRECV', 135, 'PO-21.085', '63.0000', '0.0000', NULL, NULL),
(1060, 21, 928, 26, '2021-10-19 03:13:32', 'KSRECV', 10, 'PO-21.089', '3100.0000', '0.0000', NULL, NULL),
(1061, 21, 932, 26, '2021-10-20 05:13:41', 'KSRECV', 3000, 'PO-21.078', '14.0000', '0.0000', NULL, NULL),
(1062, 21, 869, 26, '2021-10-20 05:26:34', 'KSRECV', 3000, 'PO-21.094', '2.4000', '0.0000', NULL, NULL),
(1069, 21, 862, 26, '2021-10-26 07:22:23', 'KSRECV', 200000, 'PO-21.100', '0.1500', '0.0000', NULL, NULL),
(1070, 21, 864, 26, '2021-10-26 07:22:23', 'KSRECV', 300000, 'PO-21.100', '0.3600', '0.0000', NULL, NULL),
(1095, 21, 934, 26, '2021-10-27 03:10:46', 'KSRECV', 2, 'PO-21.095', '6275.0000', '0.0000', NULL, NULL),
(1096, 21, 935, 26, '2021-10-27 03:10:46', 'KSRECV', 2, 'PO-21.095', '5533.0000', '0.0000', NULL, NULL),
(1097, 21, 936, 26, '2021-10-27 03:10:46', 'KSRECV', 2, 'PO-21.095', '8641.0000', '0.0000', NULL, NULL),
(1102, 21, 919, 26, '2021-10-27 06:50:46', 'KSRECV', 6, 'PO-21.101', '3500.0000', '0.0000', NULL, NULL),
(1129, 21, 712, 26, '2021-11-03 06:24:42', 'KSRECV', 600, 'PO-21.099', '220.0000', '0.0000', NULL, NULL),
(1130, 21, 712, 26, '2021-11-03 06:24:42', 'KSRECV', 1, 'PO-21.099', '2500.0000', '0.0000', NULL, NULL),
(1131, 21, 870, 26, '2021-11-03 06:24:42', 'KSRECV', 100, 'PO-21.099', '80.0000', '0.0000', NULL, NULL),
(1132, 21, 871, 26, '2021-11-03 06:24:42', 'KSRECV', 500, 'PO-21.099', '160.0000', '0.0000', NULL, NULL),
(1133, 21, 890, 26, '2021-11-03 06:25:39', 'KSRECV', 15000, 'PO-21.097', '2.6000', '0.0000', NULL, NULL),
(1134, 21, 919, 26, '2021-11-11 06:41:01', 'KSRECV', 6, 'PO-21.108', '3700.0000', '0.0000', NULL, NULL),
(1151, 21, 862, 26, '2021-11-19 02:50:04', 'KSRECV', 300000, 'PO-21.112', '0.1500', '0.0000', NULL, NULL),
(1152, 21, 853, 26, '2021-11-19 02:50:52', 'KSRECV', 50000, 'PO-21.083', '0.1490', '0.0000', NULL, NULL),
(1153, 21, 857, 26, '2021-11-19 02:50:52', 'KSRECV', 3000, 'PO-21.083', '0.1840', '0.0000', NULL, NULL),
(1154, 21, 860, 26, '2021-11-19 02:50:52', 'KSRECV', 1, 'PO-21.083', '20.0000', '0.0000', NULL, NULL),
(1155, 21, 696, 26, '2021-11-19 02:51:28', 'KSRECV', 100, 'PO-21.084', '135.0000', '0.0000', NULL, NULL),
(1156, 21, 920, 26, '2021-11-19 02:52:50', 'KSRECV', 1, 'PO-21.111', '50000.0000', '0.0000', NULL, NULL),
(1157, 21, 863, 26, '2021-11-19 02:53:40', 'KSRECV', 100000, 'PO-21.107', '0.1500', '0.0000', NULL, NULL),
(1158, 21, 928, 26, '2021-11-19 02:58:51', 'KSRECV', 10, 'PO-21.106', '3100.0000', '0.0000', NULL, NULL),
(1161, 21, 919, 26, '2021-11-19 10:29:36', 'KSRECV', 6, 'PO-21.114', '3700.0000', '0.0000', NULL, NULL),
(1168, 21, 881, 26, '2021-11-23 07:37:28', 'KSRECV', 1, 'PO-21.026', '545.0000', '0.0000', NULL, NULL),
(1171, 21, 880, 26, '2021-11-23 07:39:31', 'KSRECV', 20, 'PO-21.007', '15.0000', '0.0000', NULL, NULL),
(1172, 21, 881, 26, '2021-11-23 07:39:31', 'KSRECV', 2, 'PO-21.007', '195.0000', '0.0000', NULL, NULL),
(1173, 21, 942, 26, '2021-11-23 07:48:47', 'KSRECV', 1, 'PO-21.109', '9000.0000', '0.0000', NULL, NULL),
(1174, 21, 943, 26, '2021-11-23 07:48:47', 'KSRECV', 1, 'PO-21.109', '8000.0000', '0.0000', NULL, NULL),
(1175, 21, 944, 26, '2021-11-23 07:48:47', 'KSRECV', 1, 'PO-21.109', '700.0000', '0.0000', NULL, NULL),
(1176, 21, 945, 26, '2021-11-23 07:48:47', 'KSRECV', 1, 'PO-21.109', '400.0000', '0.0000', NULL, NULL),
(1177, 21, 946, 26, '2021-11-23 07:48:47', 'KSRECV', 1, 'PO-21.109', '900.0000', '0.0000', NULL, NULL),
(1178, 21, 947, 26, '2021-11-23 07:48:47', 'KSRECV', 1, 'PO-21.109', '600.0000', '0.0000', NULL, NULL),
(1179, 21, 948, 26, '2021-11-23 07:48:47', 'KSRECV', 1, 'PO-21.109', '2000.0000', '0.0000', NULL, NULL),
(1180, 21, 914, 26, '2021-11-23 07:52:29', 'KSRECV', 10, 'PO-21.110', '1700.0000', '0.0000', NULL, NULL),
(1186, 21, 937, 26, '2021-12-01 02:17:31', 'KSRECV', 20, 'PO-21.098', '18.0000', '0.0000', NULL, NULL),
(1215, 21, 916, 26, '2021-12-01 02:54:52', 'KSRECV', 60, 'PO-21.115', '69.0000', '0.0000', NULL, NULL),
(1216, 21, 950, 26, '2021-12-01 02:54:52', 'KSRECV', 30, 'PO-21.115', '279.0000', '0.0000', NULL, NULL),
(1217, 21, 864, 26, '2021-12-02 01:00:19', 'KSRECV', 300000, 'PO-21.117', '0.3600', '0.0000', NULL, NULL),
(1218, 21, 526, 26, '2021-12-02 01:01:08', 'KSRECV', 30, 'PO-21.103', '13.0000', '0.0000', NULL, NULL),
(1219, 21, 540, 26, '2021-12-02 01:01:08', 'KSRECV', 20, 'PO-21.103', '20.5000', '0.0000', NULL, NULL),
(1220, 21, 541, 26, '2021-12-02 01:01:08', 'KSRECV', 50, 'PO-21.103', '50.0000', '0.0000', NULL, NULL),
(1221, 21, 542, 26, '2021-12-02 01:01:08', 'KSRECV', 30, 'PO-21.103', '13.0000', '0.0000', NULL, NULL),
(1222, 21, 549, 26, '2021-12-02 01:01:08', 'KSRECV', 25, 'PO-21.103', '15.5000', '0.0000', NULL, NULL),
(1223, 21, 666, 26, '2021-12-02 01:01:08', 'KSRECV', 10, 'PO-21.103', '13.5000', '0.0000', NULL, NULL),
(1224, 21, 696, 26, '2021-12-02 01:01:08', 'KSRECV', 20, 'PO-21.103', '135.0000', '0.0000', NULL, NULL),
(1225, 21, 698, 26, '2021-12-02 01:01:08', 'KSRECV', 10, 'PO-21.103', '19.4000', '0.0000', NULL, NULL),
(1226, 21, 716, 26, '2021-12-02 01:01:08', 'KSRECV', 10, 'PO-21.103', '13.0000', '0.0000', NULL, NULL),
(1227, 21, 739, 26, '2021-12-02 01:01:08', 'KSRECV', 10, 'PO-21.103', '21.8700', '0.0000', NULL, NULL),
(1228, 21, 875, 26, '2021-12-02 01:01:08', 'KSRECV', 20, 'PO-21.103', '14.5000', '0.0000', NULL, NULL),
(1229, 21, 909, 26, '2021-12-02 01:01:08', 'KSRECV', 15, 'PO-21.103', '16.0000', '0.0000', NULL, NULL),
(1230, 21, 938, 26, '2021-12-02 01:01:08', 'KSRECV', 10, 'PO-21.103', '15.5000', '0.0000', NULL, NULL),
(1233, 21, 902, 26, '2021-12-09 02:22:02', 'KSRECV', 3000, 'PO-21.025', '49.9500', '0.0000', NULL, NULL),
(1237, 21, 919, 26, '2021-12-10 01:34:18', 'KSRECV', 6, 'PO-21.120', '3700.0000', '0.0000', NULL, NULL),
(1238, 21, 931, 26, '2021-12-12 12:25:32', 'KSRECV', 150000, 'PO-21.122', '0.5100', '0.0000', NULL, NULL),
(1239, 21, 953, 26, '2021-12-12 13:04:47', 'KSRECV', 850, 'PO-21.119', '42.0000', '0.0000', NULL, NULL),
(1240, 21, 952, 26, '2021-12-14 01:19:50', 'KSRECV', 180000, 'PO-21.118', '0.5500', '0.0000', NULL, NULL),
(1243, 21, 940, 26, '2021-12-21 07:52:28', 'KSRECV', 10, 'PO-21.113', '80.0000', '0.0000', NULL, NULL),
(1244, 21, 941, 26, '2021-12-21 07:52:28', 'KSRECV', 15, 'PO-21.113', '17.5000', '0.0000', NULL, NULL),
(1245, 21, 785, 26, '2021-12-21 07:54:10', 'KSRECV', 10, 'PO-21.105', '425.0000', '0.0000', NULL, NULL),
(1247, 21, 879, 26, '2021-12-23 01:22:44', 'KSRECV', 5000, 'PO-21.125', '36.0000', '0.0000', NULL, NULL),
(1274, 21, 742, 26, '2022-01-12 06:31:56', 'KSRECV', 10, 'PO-21.102', '200.0000', '0.0000', NULL, NULL),
(1280, 21, 742, 26, '2022-01-24 07:18:08', 'KSRECV', 10, 'PO-21.008', '215.0000', '0.0000', NULL, NULL),
(1315, 21, 576, 26, '2022-01-27 06:33:35', 'KSRECV', 1, 'PO-22.004', '208.4000', '0.0000', '01/14/2022', NULL),
(1316, 21, 580, 26, '2022-01-27 06:33:35', 'KSRECV', 50, 'PO-22.004', '208.5000', '0.0000', '01/14/2022', NULL),
(1317, 21, 646, 26, '2022-01-27 06:33:35', 'KSRECV', 5, 'PO-22.004', '175.3500', '0.0000', '01/14/2022', NULL),
(1318, 21, 799, 26, '2022-01-27 06:33:35', 'KSRECV', 50, 'PO-22.004', '31.7000', '0.0000', '01/14/2022', NULL),
(1320, 21, 919, 26, '2022-01-28 08:55:55', 'KSRECV', 3, 'PO-22.001', '3500.0000', '0.0000', '01/12/2022', NULL),
(1322, 21, 950, 26, '2022-01-28 08:57:53', 'KSRECV', 20, 'PO-22.002', '279.0000', '0.0000', '01/17/2022', NULL),
(1323, 21, 964, 26, '2022-01-28 09:04:06', 'KSRECV', 2, 'PO-22.006', '1200.0000', '0.0000', '01/18/2022', NULL),
(1342, 21, 950, 25, '2022-02-01 02:22:22', 'KSRECV', 30, 'PO-22.011', '249.0000', '0.0000', '', NULL),
(1352, 21, 774, 25, '2022-02-04 08:13:39', 'KSRECV', 5, 'PO-22.015', '1144.6400', '0.0000', '-', NULL),
(1360, 21, 916, 25, '2022-02-09 09:13:32', 'KSRECV', 40, 'PO-22.018', '67.0000', '0.0000', '', NULL),
(1365, 21, 919, 25, '2022-02-11 03:21:36', 'KSRECV', 3, 'PO-22.017', '3500.0000', '0.0000', '-', NULL),
(1371, 21, 919, 26, '2022-02-15 07:30:09', 'KSRECV', 3, 'PO-22.021', '3500.0000', '0.0000', '02/11/2022', NULL),
(1375, 21, 580, 26, '2022-02-16 03:23:55', 'KSRECV', 100, 'PO-21.003', '156.8000', '0.0000', '', NULL),
(1376, 21, 799, 26, '2022-02-16 03:23:55', 'KSRECV', 100, 'PO-21.003', '28.9520', '0.0000', '', NULL),
(1377, 21, 902, 26, '2022-02-16 03:24:26', 'KSRECV', 3000, 'PO-21.123', '49.9500', '0.0000', '', NULL),
(1381, 21, 834, 26, '2022-02-16 03:25:30', 'KSRECV', 20000, 'PO-21.104', '0.1300', '0.0000', '02/14/2022', NULL),
(1382, 21, 845, 26, '2022-02-16 03:25:30', 'KSRECV', 20000, 'PO-21.104', '0.2050', '0.0000', '02/14/2022', NULL),
(1383, 21, 949, 26, '2022-02-16 03:25:30', 'KSRECV', 50000, 'PO-21.104', '0.1370', '0.0000', '02/14/2022', NULL),
(1399, 21, 869, 25, '2022-02-21 08:23:11', 'KSRECV', 2000, 'PO-22.020', '2.2700', '0.0000', '', 95),
(1400, 21, 898, 25, '2022-02-21 08:23:11', 'KSRECV', 100, 'PO-22.020', '74.5400', '0.0000', '', 95),
(1408, 21, 865, 26, '2022-02-22 06:55:38', 'KSRECV', 80000, 'PO-22.024', '0.3300', '0.0000', '02/18/2022', 95),
(1409, 21, 984, 26, '2022-02-22 06:55:38', 'KSRECV', 80000, 'PO-22.024', '0.3300', '0.0000', '02/18/2022', 95),
(1416, 21, 919, 25, '2022-02-22 07:05:45', 'KSRECV', 3, 'PO-22.022', '3500.0000', '0.0000', '02/11/2022', 95),
(1417, 21, 919, 25, '2022-02-22 07:06:00', 'KSRECV', 3, 'PO-22.023', '3500.0000', '0.0000', '', 95),
(1419, 21, 887, 25, '2022-02-23 05:19:57', 'KSRECV', 5, 'PO-22.014', '3281.6000', '0.0000', '-', 95),
(1420, 21, 985, 25, '2022-02-23 07:15:30', 'KSRECV', 1, 'PO-22.021', '20700.0000', '0.0000', '-', 95),
(1540, 21, 914, 12, '2022-03-03 10:44:10', 'KSRECV', 20, 'PO-22.026', '2650.0000', '0.0000', '-', 95),
(1542, 21, 712, 12, '2022-03-03 10:45:23', 'KSRECV', 500, 'PO-22.019', '220.0000', '0.0000', '02-14-22', 95),
(1543, 21, 908, 12, '2022-03-03 10:45:59', 'KSRECV', 50000, 'PO-22.012', '0.1700', '0.0000', '', 95),
(1544, 21, 983, 12, '2022-03-03 10:45:59', 'KSRECV', 50000, 'PO-22.012', '0.1000', '0.0000', '', 95),
(1553, 21, 754, 26, '2022-03-04 08:59:03', 'KSRECV', 50, 'PO-22.0.32', '18.0000', '0.0000', '-', 124),
(1567, 21, 882, 25, '2022-03-09 09:10:41', 'KSRECV', 5000, 'PO-22.025', '6.5000', '0.0000', '2-22-22', 95),
(1571, 21, 800, 25, '2022-03-09 09:39:59', 'KSRECV', 50, 'PO-22.027', '122.8800', '0.0000', '03-03-22', 95),
(1572, 21, 799, 25, '2022-03-09 09:39:59', 'KSRECV', 50, 'PO-22.027', '35.5040', '0.0000', '03-03-22', 95),
(1573, 21, 580, 25, '2022-03-09 09:39:59', 'KSRECV', 50, 'PO-22.027', '233.5200', '0.0000', '03-03-22', 95),
(1599, 21, 864, 25, '2022-03-11 05:41:39', 'KSRECV', 200000, 'PO-22.013', '0.3700', '0.0000', '3-11-22', 95),
(1600, 21, 896, 25, '2022-03-11 05:41:39', 'KSRECV', 80000, 'PO-22.013', '0.5200', '0.0000', '3-11-22', 95),
(1601, 21, 863, 25, '2022-03-11 05:42:09', 'KSRECV', 200000, 'PO-22.030', '0.1600', '0.0000', '3-11-22', 95),
(1602, 21, 867, 25, '2022-03-11 05:42:09', 'KSRECV', 100000, 'PO-22.030', '0.2100', '0.0000', '3-11-22', 95),
(1603, 21, 919, 25, '2022-03-11 05:44:28', 'KSRECV', 3, 'PO-22.028', '3500.0000', '0.0000', '03-03-22', 95),
(1638, 21, 526, 26, '2022-03-18 08:41:49', 'KSRECV', 20, 'PO-22.031', '13.0000', '0.0000', '-', 124),
(1639, 21, 541, 26, '2022-03-18 08:41:49', 'KSRECV', 20, 'PO-22.031', '50.0000', '0.0000', '-', 124),
(1640, 21, 564, 26, '2022-03-18 08:41:49', 'KSRECV', 10, 'PO-22.031', '22.5000', '0.0000', '-', 124),
(1641, 21, 668, 26, '2022-03-18 08:41:49', 'KSRECV', 10, 'PO-22.031', '12.7000', '0.0000', '-', 124),
(1642, 21, 675, 26, '2022-03-18 08:41:49', 'KSRECV', 20, 'PO-22.031', '12.2000', '0.0000', '-', 124),
(1643, 21, 875, 26, '2022-03-18 08:41:49', 'KSRECV', 30, 'PO-22.031', '14.5000', '0.0000', '-', 124),
(1644, 21, 909, 26, '2022-03-18 08:41:49', 'KSRECV', 15, 'PO-22.031', '16.0000', '0.0000', '-', 124),
(1645, 21, 986, 26, '2022-03-18 08:41:49', 'KSRECV', 10, 'PO-22.031', '149.7000', '0.0000', '-', 124),
(1646, 21, 542, 26, '2022-03-18 10:36:06', 'KSRECV', 10, 'PO-22.009', '14.5000', '0.0000', '03/14/2022', 124),
(1647, 21, 600, 26, '2022-03-18 10:36:06', 'KSRECV', 50, 'PO-22.009', '13.0000', '0.0000', '03/14/2022', 124),
(1648, 21, 666, 26, '2022-03-18 10:36:06', 'KSRECV', 10, 'PO-22.009', '13.5000', '0.0000', '03/14/2022', 124),
(1649, 21, 941, 26, '2022-03-18 10:36:06', 'KSRECV', 15, 'PO-22.009', '16.5000', '0.0000', '03/14/2022', 124),
(1650, 21, 960, 26, '2022-03-18 10:36:06', 'KSRECV', 30, 'PO-22.009', '15.0000', '0.0000', '03/14/2022', 124),
(1651, 21, 962, 26, '2022-03-18 10:36:06', 'KSRECV', 10, 'PO-22.009', '15.5000', '0.0000', '03/14/2022', 124),
(1652, 21, 645, 26, '2022-03-18 10:53:51', 'KSRECV', 5, 'PO-22.010', '16.0000', '0.0000', '02/18/2022', 124),
(1653, 21, 806, 26, '2022-03-18 10:53:51', 'KSRECV', 20, 'PO-22.010', '35.0000', '0.0000', '02/18/2022', 124),
(1654, 21, 929, 26, '2022-03-18 10:53:51', 'KSRECV', 10, 'PO-22.010', '35.0000', '0.0000', '02/18/2022', 124),
(1655, 21, 961, 26, '2022-03-18 10:53:51', 'KSRECV', 3, 'PO-22.010', '55.0000', '0.0000', '02/18/2022', 124),
(1661, 21, 580, 25, '2022-03-23 01:58:05', 'KSRECV', 50, 'PO-22.038', '233.5200', '0.0000', NULL, 95),
(1662, 21, 795, 25, '2022-03-23 01:58:05', 'KSRECV', 5, 'PO-22.038', '1034.3200', '0.0000', NULL, 95),
(1667, 21, 833, 26, '2022-03-23 03:36:42', 'KSRECV', 30000, 'PO-22.029', '0.1300', '0.0000', '-', 124),
(1678, 21, 993, 25, '2022-03-23 09:35:20', 'KSRECV', 1000, 'PO-22.041', '71.5000', '0.0000', '', 95),
(1680, 21, 541, 26, '2022-03-24 06:33:02', 'KSRECV', 40, 'PO-22.039', '50.0000', '0.0000', '-', 124),
(1681, 21, 696, 26, '2022-03-24 06:33:02', 'KSRECV', 37, 'PO-22.039', '135.0000', '0.0000', '-', 124),
(1682, 21, 742, 26, '2022-03-24 06:37:41', 'KSRECV', 10, 'PO-22.008', '215.0000', '0.0000', '03/23/2022', 38),
(1683, 21, 540, 26, '2022-03-24 10:50:30', 'KSRECV', 20, 'PO-21.126', '20.5000', '0.0000', '03/14/2022', 124),
(1684, 21, 542, 26, '2022-03-24 10:50:30', 'KSRECV', 40, 'PO-21.126', '14.5000', '0.0000', '03/14/2022', 124),
(1685, 21, 548, 26, '2022-03-24 10:50:30', 'KSRECV', 15, 'PO-21.126', '139.0000', '0.0000', '03/14/2022', 124),
(1686, 21, 555, 26, '2022-03-24 10:50:30', 'KSRECV', 15, 'PO-21.126', '24.2000', '0.0000', '03/14/2022', 124),
(1687, 21, 640, 26, '2022-03-24 10:50:30', 'KSRECV', 5, 'PO-21.126', '12.3000', '0.0000', '03/14/2022', 124),
(1688, 21, 668, 26, '2022-03-24 10:50:30', 'KSRECV', 10, 'PO-21.126', '12.7000', '0.0000', '03/14/2022', 124),
(1689, 21, 676, 26, '2022-03-24 10:50:30', 'KSRECV', 10, 'PO-21.126', '24.5000', '0.0000', '03/14/2022', 124),
(1690, 21, 707, 26, '2022-03-24 10:50:30', 'KSRECV', 5, 'PO-21.126', '32.5000', '0.0000', '03/14/2022', 124),
(1691, 21, 736, 26, '2022-03-24 10:50:30', 'KSRECV', 15, 'PO-21.126', '15.5000', '0.0000', '03/14/2022', 124),
(1692, 21, 749, 26, '2022-03-24 10:50:30', 'KSRECV', 20, 'PO-21.126', '27.0000', '0.0000', '03/14/2022', 124),
(1693, 21, 909, 26, '2022-03-24 10:50:30', 'KSRECV', 5, 'PO-21.126', '16.0000', '0.0000', '03/14/2022', 124),
(1694, 21, 959, 26, '2022-03-24 10:50:30', 'KSRECV', 30, 'PO-21.126', '27.0000', '0.0000', '03/14/2022', 124),
(1695, 21, 960, 26, '2022-03-24 10:50:30', 'KSRECV', 20, 'PO-21.126', '15.0000', '0.0000', '03/14/2022', 124),
(1697, 21, 919, 25, '2022-03-25 07:20:49', 'KSRECV', 3, 'PO-22.035', '3900.0000', '0.0000', '3-15-22', 95),
(1699, 21, 919, 25, '2022-03-25 07:21:51', 'KSRECV', 3, 'PO-22.042', '3900.0000', '0.0000', '3-23-22', 95),
(1700, 21, 862, 25, '2022-03-25 09:17:30', 'KSRECV', 100000, 'PO-22.040', '0.1600', '0.0000', '3-25-22', 95),
(1701, 21, 864, 25, '2022-03-25 09:17:30', 'KSRECV', 200000, 'PO-22.040', '0.3700', '0.0000', '3-25-22', 95),
(1702, 21, 865, 25, '2022-03-25 09:17:30', 'KSRECV', 100000, 'PO-22.040', '0.3300', '0.0000', '3-25-22', 95),
(1703, 21, 988, 25, '2022-03-25 09:18:14', 'KSRECV', 1, 'PO-22.034', '16500.0000', '0.0000', '3-25-22', 95),
(1707, 21, 919, 25, '2022-04-01 09:02:30', 'KSRECV', 3, 'PO-22.043', '3900.0000', '0.0000', '04/01/22', 95),
(1709, 21, 968, 25, '2022-04-05 09:19:39', 'KSRECV', 2, 'PO-22.003', '10000.0000', '0.0000', '-', 95),
(1710, 21, 879, 25, '2022-04-05 09:23:21', 'KSRECV', 5000, 'PO-22.005', '36.0000', '0.0000', '01/19/2022', 95),
(1711, 21, 965, 25, '2022-04-05 09:30:22', 'KSRECV', 1, 'PO-22.016', '10350.0000', '0.0000', '', 95),
(1712, 21, 966, 25, '2022-04-05 09:30:22', 'KSRECV', 1, 'PO-22.016', '10350.0000', '0.0000', '', 95),
(1713, 21, 967, 25, '2022-04-05 09:30:22', 'KSRECV', 1, 'PO-22.016', '21150.0000', '0.0000', '', 95),
(1714, 21, 987, 25, '2022-04-05 09:44:12', 'KSRECV', 2, 'PO-22.045', '29000.0000', '0.0000', NULL, 95),
(1716, 21, 867, 26, '2022-04-07 04:02:38', 'KSRECV', 200000, 'PO-22.046', '0.2100', '0.0000', '-', 95),
(1717, 21, 754, 26, '2022-04-07 07:18:42', 'KSRECV', 50, 'PO-22.032', '18.0000', '0.0000', '04/05/2022', 124),
(1722, 21, 991, 25, '2022-04-08 03:10:43', 'KSRECV', 5, 'PO-22.036', '850.0000', '0.0000', '03-28-22', 95),
(1723, 21, 992, 25, '2022-04-08 03:10:43', 'KSRECV', 5, 'PO-22.036', '950.0000', '0.0000', '03-28-22', 95),
(1724, 21, 990, 25, '2022-04-08 03:11:43', 'KSRECV', 20000, 'PO-22.037', '1.3500', '0.0000', '04/05/22', 95),
(1725, 21, 742, 26, '2022-04-08 06:32:15', 'KSRECV', 10, 'PO-22.033', '215.0000', '0.0000', '04-08-22', 38);

-- --------------------------------------------------------

--
-- Table structure for table `pos_items`
--

CREATE TABLE `pos_items` (
  `item_id` int(10) NOT NULL,
  `company_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(255) NOT NULL,
  `item_type` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `sku` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `service` tinyint(1) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_items`
--

INSERT INTO `pos_items` (`item_id`, `company_id`, `name`, `category_id`, `item_type`, `brand`, `item_number`, `deleted`, `sku`, `description`, `service`, `created_on`) VALUES
(1, 21, 'Supplier', 0, '', '', NULL, 0, '', 'adfa', 0, '2020-12-02 18:03:46'),
(5, 21, 'CVR', 0, '', '', NULL, 0, '', 'dfasd', 0, '2020-12-07 09:00:56'),
(6, 21, 'APV', 0, '', '', NULL, 0, '', '', 0, '2020-12-07 11:13:37'),
(7, 21, 'APV101', 0, '', '', NULL, 0, '', 'aasdfad', 0, '2020-12-07 11:15:46'),
(9, 21, 'CPRD', 0, '', '', NULL, 0, '', '', 0, '2020-12-08 08:18:00'),
(10, 21, 'CPRD', 0, '', '', NULL, 0, '', '', 0, '2020-12-08 08:18:41'),
(11, 21, 'NEW', 0, '', '', NULL, 0, '', '', 0, '2020-12-08 08:21:29'),
(12, 21, 'NEW', 0, '', '', NULL, 0, '', '', 0, '2020-12-08 08:47:07'),
(13, 21, 'NEW', 0, '', '', NULL, 0, '', '', 0, '2020-12-08 09:51:57'),
(14, 21, 'NEW', 0, '', '', NULL, 0, '', '', 0, '2020-12-08 09:53:05'),
(15, 21, 'NEW Pro', 0, '', '', NULL, 0, '', '', 0, '2020-12-08 09:54:14'),
(16, 21, 'Apples', 2, '', '', NULL, 0, '', '', 0, '2020-12-09 06:33:38'),
(17, 21, 'Acai Extract 4:1', 0, '', '', NULL, 0, '', '', 0, '2020-12-09 07:29:58'),
(18, 21, 'Acai Extract 4:1', 2, '', '', NULL, 0, '', '', 0, '2020-12-09 14:31:26'),
(19, 21, 'Acai Extract 4:1', 2, '', '', NULL, 0, '', '', 0, '2020-12-10 02:13:39'),
(20, 21, 'Blueberry Flavor', 3, '', '', NULL, 0, '', '', 0, '2020-12-10 09:00:05'),
(21, 21, 'Bottles', 2, '', '', NULL, 0, '', '', 0, '2020-12-11 03:44:48'),
(22, 21, 'Alcohol', 2, '', '', NULL, 0, '', '', 0, '2020-12-11 14:53:39'),
(23, 21, 'Test Product', 7, '', '', NULL, 0, '', '', 0, '2020-12-17 05:34:58'),
(24, 21, 'APC / DPC', 2, '', '', NULL, 0, '', '', 0, '2020-12-17 11:26:31'),
(25, 21, 'Acai Extracto', 3, '', '', NULL, 0, '', '', 0, '2021-01-05 06:19:30'),
(26, 21, 'Acai Extract', 3, '', '', NULL, 0, '', '', 0, '2021-01-05 07:05:49'),
(27, 21, 'Acai Extract', 3, '', '', NULL, 0, '', '', 0, '2021-01-05 07:13:33'),
(28, 21, 'Banana Extract', 3, '', '', NULL, 0, '', '', 0, '2021-01-05 07:14:15'),
(29, 21, 'test product', 3, '', '', NULL, 0, '', '', 0, '2021-01-05 07:27:46'),
(30, 21, 'test', 0, '', '', NULL, 0, '', '', 0, '2021-01-06 08:09:50'),
(32, 21, 'test', 0, '', '', NULL, 0, '', '', 0, '2021-01-06 09:02:57'),
(33, 21, 'test2', 0, '', '', NULL, 0, '', '', 0, '2021-01-06 09:07:33'),
(34, 21, 'awere', 0, '', '', NULL, 0, '', '', 0, '2021-01-06 09:13:35'),
(35, 21, 'Acai Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:31:44'),
(36, 21, 'Acai Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:42:19'),
(37, 21, 'Acai Flavor', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:43:38'),
(38, 21, 'Acai Puree', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:46:33'),
(39, 21, 'AcaiVida Acai Juice Powder (organic) - SKU 706', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:47:32'),
(40, 21, 'Acai Juice Powder (Non Organic)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:48:28'),
(41, 21, 'Acerola Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:49:14'),
(42, 21, 'Acerola Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:50:02'),
(43, 21, 'Alkalized Cocoa Powder D9a', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:51:11'),
(44, 21, 'Aloe Vera Extract (Aloin a 20%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:51:56'),
(45, 21, 'Alpha Lipoic Acid 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:52:55'),
(46, 21, 'Antrodia Camphorata Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:57:47'),
(47, 21, 'Apple Dices IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:58:39'),
(48, 21, 'Apple Flavor (SWP 910281)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 07:59:14'),
(49, 21, 'Apricot Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:00:05'),
(50, 21, 'Apricot Seed Extract 80:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:00:36'),
(51, 21, 'Aronia Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:01:05'),
(52, 21, 'Aronia Extract 30:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:01:37'),
(53, 21, 'Aronia Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:02:03'),
(54, 21, 'Aronia Juice Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:02:29'),
(55, 21, 'Aronia Puree', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:03:56'),
(56, 21, 'Artemisinin 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:04:21'),
(57, 21, 'Ascorbic Acid', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:04:52'),
(58, 21, 'Ashwagandha Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:05:11'),
(59, 21, 'Astaxanthin 3%', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:05:31'),
(60, 21, 'Astragalus Extract 10:1 (35% Polysaccharides)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:05:53'),
(61, 21, 'Astragalus Extract 20:1 (70% Polysaccharides)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:06:24'),
(62, 21, 'Astragalus Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:11:42'),
(63, 21, 'Bacopa Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:12:55'),
(64, 21, 'Barley Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:13:33'),
(65, 21, 'Barley Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:14:02'),
(66, 21, 'Beryl\'s Cacao Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:14:42'),
(67, 21, 'Bilberry Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:15:17'),
(68, 21, 'Bilberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:16:04'),
(69, 21, 'Bitter Melon Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:17:04'),
(70, 21, 'Bitter Melon Extract 25:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:21:37'),
(71, 21, 'Black Cumin Extract Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:22:56'),
(72, 21, 'Eclipta Prostrata 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:23:20'),
(73, 21, 'Black Currant IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:23:20'),
(74, 21, 'Dandelion Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:23:43'),
(75, 21, 'Dark Cherry IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:24:26'),
(76, 21, 'Elderberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:24:37'),
(77, 21, 'Black Currant Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:24:48'),
(78, 21, 'Black Garlic Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:25:08'),
(79, 21, 'Elderberry Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:25:11'),
(80, 21, 'Deodorized Alcohol', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:25:37'),
(81, 21, 'Black Pepper Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:25:42'),
(82, 21, 'Elderberry Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:25:53'),
(83, 21, 'Black Raspberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:26:11'),
(84, 21, 'Dong Quai Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:26:23'),
(85, 21, 'Elderberry Seed Extract 80:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:26:35'),
(86, 21, 'Blackberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:26:57'),
(87, 21, 'Enoki Mushroom Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:27:12'),
(88, 21, 'Blackberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:27:52'),
(89, 21, 'Gac Fruit Powder - SKU 4030 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:27:56'),
(90, 21, 'Blonde Psyllium', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:28:28'),
(91, 21, 'Garcinia Cambogia 50% Hydroxy Acid', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:28:40'),
(92, 21, 'Blueberry Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:28:57'),
(93, 21, 'Blueberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:29:25'),
(94, 21, 'Gelatin Powder (Geltech Korea) - 220 Bloom', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:29:28'),
(95, 21, 'Ginger Extract 5% Gingerol', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:29:59'),
(96, 21, 'Blueberry Flavor Local', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:30:02'),
(97, 21, 'Ginger Root Extract (6-Gingerol 20%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:30:44'),
(98, 21, 'Blueberry IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:30:44'),
(99, 21, 'Glossocardia Bidens Extract 10:1 (Antler Extract)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:31:12'),
(100, 21, 'Glossy Privet Fruit Extract (Oleanic Acid 50%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:31:41'),
(101, 21, 'Blueberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:31:47'),
(102, 21, 'Blueberry Puree', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:32:23'),
(103, 21, 'Glucosamine Sulfate Powder 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:32:29'),
(104, 21, 'Boswellia Serrata Extract (Boswellic acid 65% UV)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:32:57'),
(105, 21, 'Glycerine', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:33:07'),
(106, 21, 'Burdock Root Extract 10:1 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:33:33'),
(107, 21, 'Butterfly Pea Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:34:03'),
(108, 21, 'Acai Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:56:18'),
(109, 21, 'Acai Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:57:18'),
(110, 21, 'Acai Flavor', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:58:09'),
(111, 21, 'Acai Puree', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 08:59:12'),
(112, 21, 'AcaiVida Acai Juice Powder (Organic) - SKU 706', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:00:28'),
(113, 21, 'Acai Juice Powder (Non Organic)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:01:24'),
(114, 21, 'Acerola Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:02:18'),
(115, 21, 'Acerola Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:03:09'),
(116, 21, 'Alkalized Cocoa Powder D9a', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:03:51'),
(117, 21, 'Aloe Vera Extract (Aloin a 20%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:04:29'),
(118, 21, 'Alpha Lipoic Acid 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:05:18'),
(119, 21, 'Antrodia Camphorata Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:06:10'),
(120, 21, 'Apple Dices IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:06:49'),
(121, 21, 'Apple Flavor (SWP 910281)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:07:33'),
(122, 21, 'Apricot Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:08:29'),
(123, 21, 'Apricot Seed Extract 80:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:09:17'),
(124, 21, 'Aronia Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:10:04'),
(125, 21, 'Aronia Extract 30:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:11:08'),
(126, 21, 'Aronia Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:12:06'),
(127, 21, 'Aronia Juice Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:12:58'),
(128, 21, 'Aronia Puree', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:13:42'),
(129, 21, 'Artemisinin 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:14:30'),
(130, 21, 'Ascorbic Acid', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:15:02'),
(131, 21, 'Ashwagandha Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:15:43'),
(132, 21, 'Astaxanthin 3%', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:16:16'),
(133, 21, 'Astragalus Extract 10:1 (35% Polysaccharides)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:17:01'),
(134, 21, 'Astragalus Extract 20:1  (70% Polysaccharides)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:17:39'),
(135, 21, 'Astragalus Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:19:15'),
(136, 21, 'Xanthan Gum', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:40:15'),
(137, 21, 'Honey', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:44:14'),
(138, 21, 'Eclipta Prostrata 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:45:29'),
(139, 21, 'Elderberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:46:21'),
(140, 21, 'Elderberry Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:47:25'),
(141, 21, 'Elderberry Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:51:10'),
(142, 21, 'Elderberry Seed Extract 80:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:52:55'),
(143, 21, 'Enoki Mushroom Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-07 09:55:43'),
(144, 21, 'Euphorbia Hirta Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 03:51:35'),
(145, 21, 'Fennel Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 03:53:15'),
(146, 21, 'Epimedium Extract (5 Icariin)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:24:03'),
(147, 21, 'Fenugreek Seed Extract (50% Saponins)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:27:45'),
(148, 21, 'Feverfew Plant Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:28:37'),
(149, 21, 'Feverfew Plant Extract 80:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:29:20'),
(150, 21, 'Flammunilla Velutipes 50%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:30:15'),
(151, 21, 'Flax Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:31:00'),
(152, 21, 'Fomes Fomentarius Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:32:21'),
(153, 21, 'Fossence Powder 90', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:52:46'),
(154, 21, 'Fossence Liquid 95', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:53:34'),
(155, 21, 'Habanero Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:54:59'),
(156, 21, 'Hawthorn Extract (Flavone 20%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:55:53'),
(157, 21, 'Hazelnut Flavor (SWP 21121)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:56:53'),
(158, 21, 'Hericium Erinaceus Extract (Polysaccharide 40%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:57:45'),
(159, 21, 'Hibiscus Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:58:35'),
(160, 21, 'Hops Flower Extract (5% Flavone)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 05:59:25'),
(161, 21, 'Horse Radish Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:00:16'),
(162, 21, 'Hyaluronic Acid 95%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:03:11'),
(163, 21, 'Hyssop Leaf Extract 10:3', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:05:23'),
(164, 21, 'Icariin 98% ', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:06:34'),
(165, 21, 'Imperata Cylindrica Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:10:50'),
(166, 21, 'JabuVital (Jabuticaba Juice Powder) - SKU 5411 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:12:25'),
(167, 21, 'Kakadu Plum Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:13:08'),
(168, 21, 'Thaumatin 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:14:45'),
(169, 21, 'Tongkat Ali Extract 50:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:15:23'),
(170, 21, 'Tribulus Terrestris Extract (60% Saponins)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:16:01'),
(171, 21, 'Uva Ursi Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:21:10'),
(172, 21, 'Valerian Root Extract (Valeric Acid 0.8%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:21:57'),
(173, 21, 'Wheatgrass Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:23:16'),
(174, 21, 'Wheatgrass Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:23:54'),
(175, 21, 'Yerba Mate Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:24:46'),
(176, 21, 'Yumberry Juice Powder - SKU 9926 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:25:25'),
(177, 21, 'Dandelion Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:27:31'),
(178, 21, 'Dark Cherry IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:28:26'),
(179, 21, 'Deodorized Alcohol', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:31:46'),
(180, 21, 'Dong Quai Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:33:08'),
(181, 21, 'Gac Fruit Powder - SKU 4030 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:35:33'),
(182, 21, 'Garcinia Cambogia 50% Hydroxy Acid', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:36:50'),
(183, 21, 'Gelatin Powder (Geltech Korea) - 220 Bloom', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:38:04'),
(184, 21, 'Ginger Extract 5% Gingerol', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:39:14'),
(185, 21, 'Bacopa Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:40:26'),
(186, 21, 'Barley Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:41:04'),
(187, 21, 'Ginger Root Extract (6-Gingerol 20%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:41:32'),
(188, 21, 'Barley Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:41:59'),
(189, 21, 'Beryl\'s Cacao Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:42:46'),
(190, 21, 'Bilberry Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:43:41'),
(191, 21, 'Glossocardia Bidens Extract 10:1 (Antler Extract)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:43:42'),
(192, 21, 'Bilberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:45:16'),
(193, 21, 'Glossy Privet Fruit Extract (Oleanic Acid 50%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:45:29'),
(194, 21, 'Bitter Melon Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:46:07'),
(195, 21, 'Bitter Melon Extract 25:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:46:40'),
(196, 21, 'Glucosamine Sulfate Powder 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:47:10'),
(197, 21, 'Black Cumin Extract Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:47:30'),
(198, 21, 'Glycerine', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:48:30'),
(199, 21, 'Black Currant IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:49:08'),
(200, 21, 'Black Currant Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:50:02'),
(201, 21, 'Black Garlic Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:50:50'),
(202, 21, 'Black Pepper Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:51:57'),
(203, 21, 'Black Raspberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:52:34'),
(204, 21, 'Blackberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:53:18'),
(205, 21, 'Blackberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:53:56'),
(206, 21, 'Blonde Psyllium', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:54:30'),
(207, 21, 'Blueberry Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:55:46'),
(208, 21, 'Blueberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:56:23'),
(209, 21, 'Blueberry Flavor Local', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:57:35'),
(210, 21, 'Blueberry IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:58:45'),
(211, 21, 'Blueberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 06:59:31'),
(212, 21, 'Blueberry Puree', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:00:20'),
(213, 21, 'Boswellia Serrata Extract (Boswellic acid 65% UV)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:01:05'),
(214, 21, 'Burdock Root Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:01:44'),
(215, 21, 'Butterfly Pea Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:02:31'),
(216, 21, 'Goji Extract (50 Polysaccharides)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:04:05'),
(217, 21, 'Goji Juice Powder - SKU 4505 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:05:43'),
(218, 21, 'Epimedium Extract (5 Icariin)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:05:57'),
(219, 21, 'Saccharum Officinarum Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:06:41'),
(220, 21, 'Saccharum Spontaneum Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:07:27'),
(221, 21, 'Gotu Kola Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:08:12'),
(222, 21, 'Salvia Miltiorrhiza Danshen 20%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:08:52'),
(223, 21, 'Saw Palmetto Extract (Fatty Acid 90%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:10:06'),
(224, 21, 'Grape Seed Extract 95%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:10:13'),
(225, 21, 'Sea Buckthorn Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:11:17'),
(226, 21, 'Serrapeptase Enteric Coating (Peptizyme)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:12:03'),
(227, 21, 'Sheep Shorel Root Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:12:42'),
(228, 21, 'Shiitake Mushroom Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:13:36'),
(229, 21, 'Shilajit Extract Powder 5%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:14:17'),
(230, 21, 'Slippery Elm Bark Extract 10:2', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:14:56'),
(231, 21, 'Camu Camu Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:15:20'),
(232, 21, 'Sodium Ascorbate', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:15:37'),
(233, 21, 'Camu Camu Extract 17% Vitamin C', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:15:53'),
(234, 21, 'Soy Lecithin Powder (PC 20%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:16:16'),
(235, 21, 'Camu Camu Extract 20:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:16:30'),
(236, 21, 'Starch Coflo 67 E1442', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:16:56'),
(237, 21, 'Camu Camu Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:17:07'),
(238, 21, 'Stinging Nettle Extract (Phytosterol 0.8%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:17:39'),
(239, 21, 'Capsaicin (Chilli Pepper) Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:17:50'),
(240, 21, 'Strawberry Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:18:19'),
(241, 21, 'Capsules - Brown Bovine Gelatin #0', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:18:45'),
(242, 21, 'Strawberry IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:18:51'),
(243, 21, 'Strawberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:19:51'),
(244, 21, 'Capsules - Scarlet Red Bovine Gelatin #0', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:19:52'),
(245, 21, 'Sucralose 99%    ', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:20:57'),
(246, 21, 'Capsules - Natural Vegetable Transparent #0', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:20:57'),
(247, 21, 'Capsules - White Bovine Gelatin #00', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:21:33'),
(248, 21, 'Sugar', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:21:37'),
(249, 21, 'Capsules - Pink Pearl Bovine Gelatin #0', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:22:08'),
(250, 21, 'Sunflower Oil', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:22:14'),
(251, 21, 'Capsules - White Pearl Bovine Gelatin #0', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:22:46'),
(252, 21, 'Sunflower Lecithin 30%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:22:59'),
(253, 21, 'Caralluma Fimbriata Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:23:33'),
(254, 21, 'Cardamon Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:24:18'),
(255, 21, 'Catuaba Bark Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:24:55'),
(256, 21, 'Cha de Bugre Extract 10:1 - SKU 2802 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:25:39'),
(257, 21, 'Cha de Bugre Powder - SKU 2808 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:26:38'),
(258, 21, 'Chamomile Flower Extract (1% Apigenin)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:28:05'),
(259, 21, 'Chanca Piedra Extract 10:1 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:28:39'),
(260, 21, 'Cherry Blossom Extract (Sakura) 2:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:29:17'),
(261, 21, 'Cherry Blossom Extract (Sakura) 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:30:49'),
(262, 21, 'Greater Celandine Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:30:53'),
(263, 21, 'Green Tea Extract (98% Polyphenols, 80?techin)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:32:02'),
(264, 21, 'Guarana Extract 10%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:34:26'),
(265, 21, 'Guyabano Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:36:35'),
(266, 21, 'Gymnema Sylvestre Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:37:41'),
(267, 21, 'L-Arginine 99 (CAS# 74-79-3)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:44:31'),
(268, 21, 'Lavender Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:47:57'),
(269, 21, 'L-Carnitine', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:49:18'),
(270, 21, 'L-Cysteine 99 (CAS# 52-90-4)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:50:25'),
(271, 21, 'Lemon Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:52:29'),
(272, 21, 'Olive Leaf Extract (Oleuropein 40%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:54:40'),
(273, 21, 'Orange Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:55:18'),
(274, 21, 'Orange Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:55:56'),
(275, 21, 'Oregano Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 07:56:45'),
(276, 21, 'Lentinulla Edodes', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:09:31'),
(277, 21, 'L-Glutamic Acid (CAS#56-86-0)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:15:38'),
(278, 21, 'L-Glutamine', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:17:21'),
(279, 21, 'L-Glutathione 40%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:18:44'),
(280, 21, 'L-Glutathione Reduced 99%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:20:04'),
(281, 21, 'L-Glycine 99 (CAS# 56-40-6)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:21:29'),
(282, 21, 'Lingon Berry Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:23:23'),
(283, 21, 'Cherry Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:23:48'),
(284, 21, 'Cherry Seed Extract 80:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:24:26'),
(285, 21, 'Lingon Berry IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:24:33'),
(286, 21, 'Chinese Bayberry Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:25:05'),
(287, 21, 'Chinese Mahogany Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:25:48'),
(288, 21, 'L-Theanine 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:26:01'),
(289, 21, 'Chlorella Powder - Broken Cell Wall', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:26:36'),
(290, 21, 'Chlorella Powder - Standard', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:27:15'),
(291, 21, 'L-Tryptophan 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:27:46'),
(292, 21, 'Chocolate Flavor Powder (SWP 11623)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:28:02'),
(293, 21, 'Luo Han Guo (Monk Fruit) Extract 80%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:28:34'),
(294, 21, 'Chondroitin Sulfate Powder 90%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:28:51'),
(295, 21, 'Cilantro Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:29:47'),
(296, 21, 'Cinnamon Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:30:22'),
(297, 21, 'Cistanche Salsa Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:31:07'),
(298, 21, 'NAC 99 (CAS# 616-91-1)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:31:08'),
(299, 21, 'Citric Acid', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:31:31'),
(300, 21, 'Nettle Root Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:31:51'),
(301, 21, 'Clove Basil Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:32:21'),
(302, 21, 'Clove Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:32:55'),
(303, 21, 'Non Dairy Creamer', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:33:05'),
(304, 21, 'Coenzyme Q10 (98%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:33:39'),
(305, 21, 'Coffee Instant HG50 (20% Robusta 80% Arabica)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:34:11'),
(306, 21, 'Cordyceps Extract 20:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:34:44'),
(307, 21, 'Noni Fruit Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:35:13'),
(308, 21, 'Cordyceps Militaris Extract (5% Cordyceptin)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:35:34'),
(309, 21, 'Nutripanyzme Pro (Nattokinase)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:36:16'),
(310, 21, 'Cordyceps Powder 1:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:36:45'),
(311, 21, 'Cordyceps Powder 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:37:23'),
(312, 21, 'Nutripanyzme R (Vegpanzyme)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:37:44'),
(313, 21, 'Cranberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:38:14'),
(314, 21, 'Crocus Dativus Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:38:45'),
(315, 21, 'Cumin Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:39:18'),
(316, 21, 'Nutripanzyme Forte', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:40:28'),
(317, 21, 'Olive Leaf Extract (Oleuropein 40%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 08:59:33'),
(318, 21, 'Orange Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:00:19'),
(319, 21, 'Orange Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:01:39'),
(320, 21, 'Oregano Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:03:33'),
(321, 21, 'Panax Ginseng Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:05:40'),
(322, 21, 'Pancreatin 8NF', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:06:30'),
(323, 21, 'Passion Flower Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:07:42'),
(324, 21, 'Passion Flower Extract (4% Flavone)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:10:39'),
(325, 21, 'Peach Flavor (SWP 21211)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:12:17'),
(326, 21, 'Perilla Frutescens Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:13:13'),
(327, 21, 'Phellinus Linteus Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:15:59'),
(328, 21, 'Pine Bark Tree Extract (Pycnogenol 95%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:18:32'),
(329, 21, 'Pine Pollen Powder (Broken Cell Wall)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:19:34'),
(330, 21, 'Plum Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:20:23'),
(331, 21, 'Plum Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:21:48'),
(332, 21, 'Plum Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:23:16'),
(333, 21, 'Pomegranate Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:24:33'),
(334, 21, 'Pomegranate Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:25:18'),
(335, 21, 'Potassium Sorbate', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:26:30'),
(336, 21, 'Purple Corn Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:29:55'),
(337, 21, 'Pygeum Africanum Extract (2.5% Phytosterols)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:31:03'),
(338, 21, 'Pysllium Husk Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:33:14'),
(339, 21, 'Raspberry Geocapsarom 6027SP', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:38:12'),
(340, 21, 'Raspberry Crumbles IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:41:23'),
(341, 21, 'Rehmannia Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:42:00'),
(342, 21, 'Reishi Mushroom Extract (Polysaccharide 30% Triterpene 4%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:42:43'),
(343, 21, 'Resveratrol 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:44:21'),
(344, 21, 'Rice Flour', 3, '', '', NULL, 0, '', '', 0, '2021-01-08 09:44:56'),
(345, 21, 'Maca Root Extract 5:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 00:46:38'),
(346, 21, 'Maitake Extract (30 Polysaccharides)', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 00:53:37'),
(347, 21, 'Mango IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 00:54:22'),
(348, 21, 'Mango Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 00:55:00'),
(349, 21, 'Mangosteen Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 00:55:46'),
(350, 21, 'Mangosteen Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 00:56:50'),
(351, 21, 'Maqui Berry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 01:04:16'),
(352, 21, 'MaquiForza (Organic) - SKU 784 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 01:07:22'),
(353, 21, 'Marine Collagen', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 01:09:15'),
(354, 21, 'Marshmallow Root Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 01:10:18'),
(355, 21, 'Meriva', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 01:12:05'),
(356, 21, 'Methylsulfonlymethane 99%', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 01:12:39'),
(357, 21, 'Milk Thistle Silymarin Extract 80%', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 01:14:20'),
(358, 21, 'Moringa Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 01:16:40'),
(359, 21, 'Muira Puama Extract 1:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 01:17:38'),
(360, 21, 'Mulberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 01:18:31'),
(361, 21, 'Raspberry Geocapsarom 6027SP', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 02:14:12'),
(362, 21, 'Argan Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:27:16'),
(363, 21, 'Raspberry Crumbles IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 06:28:27'),
(364, 21, 'Basil Essential Oil (Vietnam) - Ocimum basilicum', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:28:47'),
(365, 21, 'Raspberry Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-11 06:31:33'),
(366, 21, 'Carrot Seed Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:31:36'),
(367, 21, 'Chamomile Essential Oil (Germany) - Matricaria recutita', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:32:22'),
(368, 21, 'Chamomile Fragrance Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:33:20'),
(369, 21, 'Cinnamon Essential Oil (Sri Lanka) - Cinnamomum verum', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:34:18'),
(370, 21, 'Clary Sage Essential Oil (Spain)', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:35:00'),
(371, 21, 'Clove Bud Giroffle Essential Oil (Indonesia) - Syzygium aromaticum', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:39:13'),
(372, 21, 'Coconut Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:39:53'),
(373, 21, 'Curcumin Essential Oil (India)', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:40:32'),
(374, 21, 'Curly Mint Essential Oil (India) - Mentha spicata var', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:41:10'),
(375, 21, 'Echinacea Essential Oil (USA) - Echinacea purpurea', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:42:13'),
(376, 21, 'Eucalyptus Essential Oil (India) - Eucalyptus globulus', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:43:15'),
(377, 21, 'Frankincense Essential Oil (Somalia) - Boswellia serrata', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:44:13'),
(378, 21, 'Ginger Essential Oil (India) - Zingiber officinale', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:44:55'),
(379, 21, 'Grapeseed Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:45:54'),
(380, 21, 'Helichrysum Essential Oil (Italy) - Helichrysum angustifolium', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:47:02'),
(381, 21, 'Hibiscus Essential Oil (India) - Hibiscus sabdariffa', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:47:53'),
(382, 21, 'Hibiscus Fragrance Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-11 06:48:33'),
(383, 21, 'Jojoba Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 05:59:51'),
(384, 21, 'Kava Essential Oil (Canada) - Piper methysticum', 3, '', '', NULL, 0, '', '', 0, '2021-01-12 06:00:39'),
(385, 21, 'Lavender Essential Oil (Bulgaria) - Lavandula angustifolia', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:01:58'),
(386, 21, 'Lavender Fragrance Oil', 3, '', '', NULL, 0, '', '', 0, '2021-01-12 06:02:38'),
(387, 21, 'Lemon Balm Essential Oil (India) - Melissa officinalis', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:03:15'),
(388, 21, 'Lemon Balm Fragrance Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:03:48'),
(389, 21, 'Lemon Essential Oil (India) - Citrus limonum', 3, '', '', NULL, 0, '', '', 0, '2021-01-12 06:04:53'),
(390, 21, 'Macassar Essential Oil (Indonesia)', 3, '', '', NULL, 0, '', '', 0, '2021-01-12 06:05:27'),
(391, 21, 'Myrrh Essential Oil (Somalia)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:05:58'),
(392, 21, 'Olive Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:06:32'),
(393, 21, 'Orange Essential Oil (Brazil)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:07:05'),
(394, 21, 'Oregano Essential Oil (Morocco)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:07:49'),
(395, 21, 'Oregano Essential Oil (Spain)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:08:23'),
(396, 21, 'Passion Flower Essential Oil (Brazil)', 3, '', '', NULL, 0, '', '', 0, '2021-01-12 06:09:35'),
(397, 21, 'Passion Flower Fragrance Oil', 3, '', '', NULL, 0, '', '', 0, '2021-01-12 06:10:04'),
(398, 21, 'Patchouli Essential Oil (Indonesia)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:10:40'),
(399, 21, 'Peppermint Essential Oil (France)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:11:10'),
(400, 21, 'Ravintsara Essential Oil (Madagascar)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:11:54'),
(401, 21, 'Red Raspberry Seed Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:12:26'),
(402, 21, 'Rose Essential Oil (Bulgaria)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:12:56'),
(403, 21, 'Rosemary Camphor Essential Oil (Tunisia)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:13:45'),
(404, 21, 'Sandalwood Essential Oil (India)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:14:16'),
(405, 21, 'Thyme Paracymen Essential Oil (Spain)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:14:46'),
(406, 21, 'Valerian Root Essential Oil (Nepal)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:15:19'),
(407, 21, 'Valerian Root Fragrance Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:22:47'),
(408, 21, 'Vanilla Essential Oil (Mexico)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:23:34'),
(409, 21, 'White Tea Essential Oil (China)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:24:14'),
(410, 21, 'Ylang Ylang Essential Oil (Madagascar)', 10, '', '', NULL, 0, '', '', 0, '2021-01-12 06:24:41'),
(411, 21, 'Maltodextrine', 3, '', '', NULL, 0, '', '', 0, '2021-01-12 07:14:52'),
(412, 21, 'Sodium Bicarbonate', 7, '', '', NULL, 0, '', '', 0, '2021-01-12 08:20:04'),
(413, 21, 'Urea 46', 7, '', '', NULL, 0, '', '', 0, '2021-01-12 08:21:02'),
(414, 21, 'Dipotassium Phosphate', 7, '', '', NULL, 0, '', '', 0, '2021-01-12 08:21:47'),
(415, 21, 'Magnesium Sulfate FCC', 7, '', '', NULL, 0, '', '', 0, '2021-01-12 08:22:43'),
(416, 21, 'Mono Ammonium Phosphate', 7, '', '', NULL, 0, '', '', 0, '2021-01-12 08:23:23'),
(417, 21, 'Caustic Soda', 7, '', '', NULL, 0, '', '', 0, '2021-01-12 08:24:18'),
(418, 21, 'Calcium EDTA Powder Food Grade ', 7, '', '', NULL, 0, '', '', 0, '2021-01-12 08:25:16'),
(419, 21, 'Transparent UV Plastic', 7, '', '', NULL, 0, '', '', 0, '2021-01-12 08:25:54'),
(420, 21, 'Fine Mesh Net White', 7, '', '', NULL, 0, '', '', 0, '2021-01-12 08:26:32'),
(421, 21, 'LPG Gas Tank (11 kgs)', 7, '', '', NULL, 0, '', '', 0, '2021-01-12 08:27:03'),
(422, 21, 'Tissue 25507-1 Scott BT 170 Sheets per Roll (96 rolls / case)', 11, '', '', NULL, 0, '', '', 0, '2021-01-12 09:02:22'),
(423, 21, '38521 Kleenguard G10 Flex Nitrile Gloves (Blue - L)', 11, '', '', NULL, 0, '', '', 0, '2021-01-12 09:04:31'),
(424, 21, '38520 Kleenguard G10 Flex Nitrile Gloves (Blue - M)', 11, '', '', NULL, 0, '', '', 0, '2021-01-12 09:05:21'),
(425, 21, 'Cling Wrap (17 microns x 300 mm x 500 mm) - 16 rolls / box', 11, '', '', NULL, 0, '', '', 0, '2021-01-12 09:08:35'),
(426, 21, 'Packaging Clear Tape (43 microns x 2" x 50 meters)', 11, '', '', NULL, 0, '', '', 0, '2021-01-12 09:09:34'),
(427, 21, 'Mob Cap (Hair Net) - 21" White (100 pcs / pack x 10 packs / case)', 11, '', '', NULL, 0, '', '', 0, '2021-01-12 09:11:10'),
(428, 21, 'Ecobag Non Woven 14” x 18” Printed', 11, '', '', NULL, 0, '', '', 0, '2021-01-12 09:14:40'),
(429, 21, 'Testo 206-pH1', 9, '', '', NULL, 0, '', '', 0, '2021-01-12 09:16:25'),
(430, 21, 'Testo 206-pH1 Starter Set', 9, '', '', NULL, 0, '', '', 0, '2021-01-12 09:17:20'),
(431, 21, 'Label - Altaimune (50 ml) Satin w/o effect (113mm x 55 mm) Pre-cut', 8, '', '', NULL, 0, '', '', 0, '2021-01-12 09:19:37'),
(432, 21, 'Label - Pflanzenole (Roll - 163 mm x 42 mm) PP Silver w/ Effects', 8, '', '', NULL, 0, '', '', 0, '2021-01-12 09:23:51'),
(433, 21, 'ZP17 Tablet Press Punch and Die Set (8 mm diameter) Standard Concave', 9, '', '', NULL, 0, '', '', 0, '2021-01-12 09:26:39'),
(434, 21, 'Label - Botany IV Roll (50 ml) Satin w/o Lamination - 113 mm x 55 mm', 8, '', '', NULL, 0, '', '', 0, '2021-01-12 09:29:06'),
(435, 21, 'Label - Botany IV Roll (Bottle) Satin w/o Lamination - 163 mm x 42 mm', 8, '', '', NULL, 0, '', '', 0, '2021-01-12 09:31:17'),
(436, 21, 'Label - Satin Stickers (Plain White) - 13" x 19"', 8, '', '', NULL, 0, '', '', 0, '2021-01-12 09:32:31'),
(437, 21, 'Label - Spirulina Roll (UV, Emboss, Silver) - 162 mm x 42 mm', 8, '', '', NULL, 0, '', '', 0, '2021-01-12 09:35:14'),
(438, 21, 'Label - Spiruzyme D Roll (UV, Emboss, Silver) - 155 mm x 53 mm', 8, '', '', NULL, 0, '', '', 0, '2021-01-12 09:37:18'),
(439, 21, 'Label - Spiruzyme R Roll (UV, Emboss, Silver) - 155 mm x 53 mm', 8, '', '', NULL, 0, '', '', 0, '2021-01-12 09:39:02'),
(440, 21, 'Label - Spiruzyme C Roll (UV, Emboss, Silver) - 155 mm x 53 mm', 8, '', '', NULL, 0, '', '', 0, '2021-01-12 09:39:45'),
(441, 21, 'Label - Resset HICC Roll (PP Silver + Lamination) - 138 mm x 41 mm', 8, '', '', NULL, 0, '', '', 0, '2021-01-12 09:42:07'),
(442, 21, 'Label - Detoxiprime Roll (PP Silver + Lamination) - 198 mm x 75 mm', 8, '', '', NULL, 0, '', '', 0, '2021-01-12 09:43:34'),
(443, 21, 'Astragalus Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-13 06:27:28'),
(444, 21, 'Bottle - Wide Plastic White Bottle (HDPE 1000 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-14 08:07:57'),
(445, 21, 'testes', 3, '', '', NULL, 0, '', '', 0, '2021-01-14 08:56:29'),
(446, 21, 'test', 3, '', '', NULL, 0, '', '', 0, '2021-01-14 09:07:52'),
(447, 21, 'Bottle - Wide Plastic White Bottle (HDPE 1000 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:39:11'),
(448, 21, 'Bottle - Wide Plastic White Bottle (HDPE 1000 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:41:36'),
(449, 21, 'Bottle - Wide Plastic White Bottle (HDPE 1000 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:43:15'),
(450, 21, 'Bottle - Wide Plastic White Bottle (HDPE 1000 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:45:24'),
(451, 21, 'Adhesive Seal - Wide Plastic White Bottle (HDPE 1000 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:51:24'),
(452, 21, 'Bottle - Wide Plastic White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:51:48'),
(453, 21, 'Adhesive Seal - Wide Plastic White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:52:09'),
(454, 21, 'Bottle - Wide Plastic White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:52:38'),
(455, 21, 'Bottle - Wide Plastic White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:53:11'),
(456, 21, 'Bottle - Wide Plastic White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:53:51'),
(457, 21, 'Adhesive Seal - Curved Sexy White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:53:52'),
(458, 21, 'Bottle - Curved Sexy White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:54:51'),
(459, 21, 'Adhesive Seal - C07 HDPE White Plastic Bottle (80g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:55:01'),
(460, 21, 'Bottle - Curved Sexy White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:55:28'),
(461, 21, 'Adhesive Seal - D12 HDPE White Plastic Botte (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:55:34'),
(462, 21, 'Adhesive Seal - D28 HDPE White Plastic Bottle (275g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:56:13'),
(463, 21, 'Bottle - Curved Sexy White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:56:24'),
(464, 21, 'Bottle - Curved Sexy White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:56:55'),
(465, 21, 'Adhesive Seal - HD120 HDPE White Plastic Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:56:58'),
(466, 21, 'Adhesive Seal - HD112 HDPE White Plastic Bottle (112g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:57:34'),
(467, 21, 'test', 3, '', '', NULL, 0, '', '', 0, '2021-01-15 05:57:44'),
(468, 21, 'Bottle - C07 HDPE White Plastic Bottle (80g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:57:59'),
(469, 21, 'Adhesive Seal - CB14 HDPE Small White Curved Sexy Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:58:12'),
(470, 21, 'Bottle - C07 HDPE White Plastic Bottle (80g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:58:36'),
(471, 21, 'Bottle - C07 HDPE White Plastic Bottle (80g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:59:08'),
(472, 21, 'Bottle - C07 HDPE White Plastic Bottle (80g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 05:59:47'),
(473, 21, 'Bottle - D12 HDPE White Plastic Botte (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:00:31'),
(474, 21, 'Bottle - D12 HDPE White Plastic Botte (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:02:49'),
(475, 21, 'Bottle - D12 HDPE White Plastic Botte (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:03:30'),
(476, 21, 'Bottle - D12 HDPE White Plastic Botte (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:04:03'),
(477, 21, 'Bottle - D28 HDPE White Plastic Bottle (275g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:04:50'),
(478, 21, 'Bottle - D28 HDPE White Plastic Bottle (275g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:05:22'),
(479, 21, 'Bottle - D28 HDPE White Plastic Bottle (275g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:05:51'),
(480, 21, 'Bottle - D28 HDPE White Plastic Bottle (275g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:06:54'),
(481, 21, 'Bottle - HD120 HDPE White Plastic Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:08:14'),
(482, 21, 'test', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:09:30'),
(483, 21, 'Bottle - HD120 HDPE White Plastic Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:09:34'),
(484, 21, 'Bottle - HD120 HDPE White Plastic Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:10:23'),
(485, 21, 'Bottle - HD120 HDPE White Plastic Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:11:00'),
(486, 21, 'Bottle - HD112 HDPE White Plastic Bottle (112g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:11:43'),
(487, 21, 'Bottle - HD112 HDPE White Plastic Bottle (112g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:12:18'),
(488, 21, 'Bottle - HD112 HDPE White Plastic Bottle (112g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:12:46'),
(489, 21, 'Bottle - HD112 HDPE White Plastic Bottle (112g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:13:31'),
(490, 21, 'Bottle - CB-14 HDPE Small White Curved Sexy Bottle (120g)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:18:35'),
(491, 21, 'Bottle - CB-14 HDPE Small White Curved Sexy Bottle (120g)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:20:34'),
(492, 21, 'Bottle - CB-14 HDPE Small White Curved Sexy Bottle (120g)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:22:34'),
(493, 21, 'Bottle - CB-14 HDPE Small White Curved Sexy Bottle (120g)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:23:03'),
(494, 21, 'Bottle - Amber Glass Bottle Dropper (50 ml)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:25:14'),
(495, 21, 'Bottle - Amber Glass Bottle Dropper (50 ml)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:25:42'),
(496, 21, 'Bottle - Amber Glass Bottle Dropper (50 ml)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:26:21'),
(497, 21, 'Bottle - Amber Glass Bottle Dropper (50 ml)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:26:51'),
(498, 21, 'Bottle - Amber Glass Bottle Mist Spray (20 ml)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:27:46'),
(499, 21, 'Bottle - Amber Glass Bottle Mist Spray (20 ml)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:28:29'),
(500, 21, 'Bottle - Amber Glass Bottle Mist Spray (20 ml)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:29:00'),
(501, 21, 'Bottle - Amber Glass Bottle Mist Spray (20 ml)\r\n', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 06:29:36'),
(502, 21, 'Shrinkable - MPN01 - 105mm x 140mm x 25u', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 08:43:41'),
(503, 21, 'Shrinkable - MPN02 - 85mm x 32mm x 50u', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 08:50:44'),
(504, 21, 'Shrinkable - MPN03 - 71mm x 35mm x 40u', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 08:51:35'),
(505, 21, 'Shrinkable - MPN04 - 85mm x 50mm x 40u', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 08:52:33'),
(506, 21, 'Shrinkable - MPN05 - 58mm x 40mm x 40u', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 08:53:11'),
(507, 21, 'Shrinkable - MPN06 - 76mm x 25mm x 40u', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 08:53:49'),
(508, 21, 'Shrinkable - MPN07 - 210mm x 340mm x 25u', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 08:54:50'),
(509, 21, 'Shrinkable - MPN08 - 85mm x 125mm x 25u', 3, '', '', NULL, 0, '', '', 0, '2021-01-15 08:55:36'),
(510, 21, 'Shrinkable - MPN09 - 80mm x 120mm x 25u', 3, '', '', NULL, 0, '', '', 0, '2021-01-15 08:56:04'),
(511, 21, 'Shrinkable - MPN10 - 91mm x 135mm x 25u', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 08:56:52'),
(512, 21, 'Shrinkable - PVC Roll Form - 12" X 25u', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 08:57:34'),
(513, 21, 'Hologram - 12 mm', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 09:02:19'),
(514, 21, 'Hologram - 12 mm', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 09:02:58'),
(515, 21, 'Hologram - 12 mm', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 09:04:11'),
(516, 21, 'Desiccant - Sorbgel 1 gram - (OW-001-C)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 09:06:12'),
(517, 21, 'Desiccant - Sorbgel 1 gram - (OW-001-C)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 09:07:45'),
(518, 21, 'Desiccant - Sorbgel 1 gram - (OW-001-C)', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 09:08:39'),
(519, 21, 'PVC Clear - 135 mm', 2, '', '', NULL, 0, '', '', 0, '2021-01-15 09:10:29'),
(520, 21, 'test', 8, '', '', NULL, 0, '', '', 0, '2021-01-15 09:23:27'),
(521, 21, 'Test Prodcut', 3, '', '', NULL, 0, '', '', 0, '2021-01-20 11:33:09'),
(522, 21, 'Best', 3, '', '', NULL, 0, '', '', 0, '2021-01-21 08:20:14'),
(523, 21, 'testtest', 7, '', '', NULL, 0, '', '', 0, '2021-01-21 08:56:35'),
(524, 21, 'testthisproduct', 8, '', '', NULL, 0, '', '', 0, '2021-01-21 10:19:36'),
(525, 21, 'Acai Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-22 09:10:11');
INSERT INTO `pos_items` (`item_id`, `company_id`, `name`, `category_id`, `item_type`, `brand`, `item_number`, `deleted`, `sku`, `description`, `service`, `created_on`) VALUES
(526, 21, 'Acai Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 05:51:54'),
(527, 21, 'Acai Flavor', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 05:53:10'),
(528, 21, 'Acai Puree', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 05:53:53'),
(529, 21, 'AcaiVida Acai Juice Powder (organic) - SKU 706', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 05:57:12'),
(530, 21, 'Acerola Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 05:58:10'),
(531, 21, 'Acerola Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 05:58:48'),
(532, 21, 'Alkalized Cocoa Powder D9a', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 05:59:22'),
(533, 21, 'Aloe Vera Extract (Aloin a 20%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:00:22'),
(534, 21, 'Alpha Lipoic Acid 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:00:51'),
(535, 21, 'Antrodia Camphorata Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:01:22'),
(536, 21, 'Apple Dices IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:02:33'),
(537, 21, 'Apple Flavor (SWP 910281)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:03:04'),
(538, 21, 'Apricot Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:06:57'),
(539, 21, 'Apricot Seed Extract 80:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:07:28'),
(540, 21, 'Aronia Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:08:13'),
(541, 21, 'Aronia Extract 30:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:08:38'),
(542, 21, 'Aronia Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:09:07'),
(543, 21, 'Aronia Juice Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:10:07'),
(544, 21, 'Aronia Puree', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:10:39'),
(545, 21, 'Artemisinin 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:11:13'),
(546, 21, 'Ascorbic Acid', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:11:53'),
(547, 21, 'Ashwagandha Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:12:19'),
(548, 21, 'Astaxanthin 3%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:12:41'),
(549, 21, 'Astragalus Extract 10:1 (35% Polysaccharides)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:13:12'),
(550, 21, 'Astragalus Extract 20:1  (70% Polysaccharides)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:13:32'),
(551, 21, 'Bacopa Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:25:45'),
(552, 21, 'Barley Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:27:03'),
(553, 21, 'Barley Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:27:44'),
(554, 21, 'Beryl\'s Cacao Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:28:33'),
(555, 21, 'Bilberry Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:30:24'),
(556, 21, 'Bilberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:31:53'),
(557, 21, 'Bitter Melon Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:32:50'),
(558, 21, 'Bitter Melon Extract 25:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:34:52'),
(559, 21, 'Fennel Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:35:23'),
(560, 21, 'Black Cumin Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:35:38'),
(561, 21, 'Black Currant IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:36:27'),
(562, 21, 'Fenugreek Seed Extract (50% Saponins)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:36:57'),
(563, 21, 'Black Currant Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:37:08'),
(564, 21, 'Black Garlic Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:37:42'),
(565, 21, 'Black Pepper Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:38:25'),
(566, 21, 'Black Raspberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:39:08'),
(567, 21, 'Blackberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:39:40'),
(568, 21, 'Feverfew Plant Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:40:50'),
(569, 21, 'Blackberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:41:08'),
(570, 21, 'Blonde Psyllium', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:41:50'),
(571, 21, 'Feverfew Plant Extract 80:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:42:09'),
(572, 21, 'Blueberry Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:42:57'),
(573, 21, 'Blueberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:44:03'),
(574, 21, 'Blueberry Flavor Local', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:44:49'),
(575, 21, 'Flammunilla Velutipes 50%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:44:50'),
(576, 21, 'Blueberry IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:45:47'),
(577, 21, 'Flax Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:46:08'),
(578, 21, 'Blueberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:47:32'),
(579, 21, 'Fomes Fomentarius Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:47:42'),
(580, 21, 'Blueberry Puree', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:48:46'),
(581, 21, 'Fossence Powder 90', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:49:17'),
(582, 21, '"Boswellia Serrata Extract (Boswellic acid 65% UV)"', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:49:30'),
(583, 21, 'Fossence Liquid 95', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:49:54'),
(584, 21, 'Boswellia Serrata Extract (Boswellic acid 65% UV)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:50:57'),
(585, 21, 'Burdock Root Extract 10:1 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:51:32'),
(586, 21, 'Butterfly Pea Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:52:09'),
(587, 21, 'Gac Fruit Powder - SKU 4030 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:52:39'),
(588, 21, 'Argan Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:53:27'),
(589, 21, 'Garcinia Cambogia 50% Hydroxy Acid', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:53:35'),
(590, 21, 'Basil Essential Oil (Vietnam) - Ocimum basilicum', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:54:03'),
(591, 21, 'Carrot Seed Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:54:38'),
(592, 21, 'Camu Camu Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:55:11'),
(593, 21, 'Chamomile Essential Oil (Germany) - Matricaria recutita', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:55:14'),
(594, 21, 'Gelatin Powder (Geltech Korea) - 220 Bloom', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:55:14'),
(595, 21, 'Chamomile Fragrance Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:55:40'),
(596, 21, 'Camu Camu Extract 17% Vitamin C', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:55:44'),
(597, 21, 'Cinnamon Essential Oil (Sri Lanka) - Cinnamomum verum', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:56:04'),
(598, 21, 'Camu Camu Extract 20:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:56:22'),
(599, 21, 'Clary Sage Essential Oil (Spain)', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:56:31'),
(600, 21, 'Camu Camu Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:56:52'),
(601, 21, 'Ginger Extract 5% Gingerol', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:57:06'),
(602, 21, 'Clove Bud Giroffle Essential Oil (Indonesia) - Syzygium aromaticum', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:57:10'),
(603, 21, 'Coconut Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:57:37'),
(604, 21, 'Capsaicin (Chilli Pepper) Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:57:51'),
(605, 21, 'Curcumin Essential Oil (India)', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:58:06'),
(606, 21, 'Caralluma Fimbriata Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 06:58:36'),
(607, 21, 'Curly Mint Essential Oil (India) - Mentha spicata var', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:58:43'),
(608, 21, 'Echinacea Essential Oil (USA) - Echinacea purpurea', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 06:59:22'),
(609, 21, 'Cardamon Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:01:14'),
(610, 21, 'Gelatin Powder (Geltech Korea) - 220 Bloom', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:02:15'),
(611, 21, 'Catuaba Bark Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:02:51'),
(612, 21, 'Cha de Bugre Extract 10:1 - SKU 2802 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:03:35'),
(613, 21, 'Cha de Bugre Powder - SKU 2808 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:04:14'),
(614, 21, 'Chamomile Flower Extract (1% Apigenin)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:04:54'),
(615, 21, 'Eucalyptus Essential Oil (India) - Eucalyptus globulus', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:05:10'),
(616, 21, 'Chanca Piedra Extract 10:1 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:05:28'),
(617, 21, 'Frankincense Essential Oil (Somalia) - Boswellia serrata', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:05:46'),
(618, 21, 'Cherry Blossom Extract (Sakura) 2:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:06:01'),
(619, 21, 'Ginger Essential Oil (India) - Zingiber officinale', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:06:20'),
(620, 21, 'Cherry Blossom Extract (Sakura) 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:06:50'),
(621, 21, 'Grapeseed Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:06:59'),
(622, 21, 'Cherry Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:07:46'),
(623, 21, 'Cherry Seed Extract 80:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:08:21'),
(624, 21, 'Helichrysum Essential Oil (Italy) - Helichrysum angustifolium', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:08:22'),
(625, 21, 'Chinese Bayberry Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:08:58'),
(626, 21, 'Chinese Mahogany Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:09:36'),
(627, 21, 'Hibiscus Essential Oil (India) - Hibiscus sabdariffa', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:09:39'),
(628, 21, 'Hibiscus Fragrance Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:10:01'),
(629, 21, 'Chlorella Powder - Broken Cell Wall', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:10:09'),
(630, 21, 'Ginger Root Extract (6-Gingerol 20%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:10:10'),
(631, 21, 'Chlorella Powder - Standard', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:10:43'),
(632, 21, 'Glossocardia Bidens Extract 10:1 (Antler Extract)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:10:52'),
(633, 21, 'Jojoba Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:11:37'),
(634, 21, 'Kava Essential Oil (Canada) - piper methysticum', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:12:24'),
(635, 21, 'Chocolate Flavor Powder (SWP 11623)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:14:20'),
(636, 21, 'Chondroitin Sulfate Powder 90%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:17:42'),
(637, 21, 'Lavender Essential Oil (Bulgaria) - Lavandula angustifolia', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:19:07'),
(638, 21, 'Cilantro Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:19:13'),
(639, 21, 'Lavender Fragrance Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:19:47'),
(640, 21, 'Cinnamon Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:20:11'),
(641, 21, 'Lemon Balm Essential Oil (India) - Melissa officinalis', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:20:16'),
(642, 21, 'Lemon Balm Fragrance Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:20:43'),
(643, 21, 'Cistanche Salsa Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:20:44'),
(644, 21, 'Glossy Privet Fruit Extract (Oleanic Acid 50%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:21:03'),
(645, 21, 'Lemon Essential Oil (India) - Citrus limonum', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:21:43'),
(646, 21, 'Citric Acid', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:21:49'),
(647, 21, 'Glucosamine Sulfate Powder 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:22:20'),
(648, 21, 'Clove Basil Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:22:32'),
(649, 21, 'Clove Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:23:10'),
(650, 21, 'Coenzyme Q10 (98%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:23:48'),
(651, 21, 'Coffee Instant HG50 (20% Robusta 80% Arabica)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:24:41'),
(652, 21, 'Cordyceps Extract 20:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:26:42'),
(653, 21, 'Glucosamine Sulfate Powder 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:27:43'),
(654, 21, 'Cordyceps Militaris Extract (5% Cordyceptin)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:27:44'),
(655, 21, 'Cordyceps Powder 1:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:28:25'),
(656, 21, 'Cordyceps Powder 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:29:02'),
(657, 21, 'Cranberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:29:50'),
(658, 21, 'Crocus Sativus Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:30:21'),
(659, 21, 'Cumin Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 07:30:53'),
(660, 21, 'Macassar Essential Oil (Indonesia)', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:33:13'),
(661, 21, 'Myrrh Essential Oil (Somalia)', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:34:58'),
(662, 21, 'Olive Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:36:46'),
(663, 21, 'Orange Essential Oil (Brazil)', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:37:40'),
(664, 21, 'Oregano Essential Oil (Morocco)', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:38:12'),
(665, 21, 'Oregano Essential Oil (Spain)', 10, '', '', NULL, 0, '', '', 0, '2021-01-25 07:38:41'),
(666, 21, 'Dandelion Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:05:23'),
(667, 21, 'Dark Cherry IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:06:03'),
(668, 21, 'Goji Extract (50 Polysaccharides)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:13:58'),
(669, 21, 'Goji Juice Powder - SKU 4505 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:15:01'),
(670, 21, 'Gotu Kola Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:17:03'),
(671, 21, 'Grape Seed Extract 95%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:18:42'),
(672, 21, 'Deodorized Alcohol', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:24:39'),
(673, 21, 'Dong Quai Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:25:21'),
(674, 21, 'Eclipta Prostrata 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:29:25'),
(675, 21, 'Elderberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:30:02'),
(676, 21, 'Elderberry Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:31:05'),
(677, 21, 'Elderberry Seed Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:32:44'),
(678, 21, 'Elderberry Seed Extract 80:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:33:34'),
(679, 21, 'Greater Celandine Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:35:32'),
(680, 21, 'Enoki Mushroom Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:39:56'),
(681, 21, 'Green Tea Extract (98% Polyphenols, 80?techin)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:43:23'),
(682, 21, 'Epimedium Extract 5% Icariin', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:43:34'),
(683, 21, 'Euphorbia Hirta Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:44:17'),
(684, 21, 'L-Arginine 99 (CAS# 74-79-3)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:45:54'),
(685, 21, 'Lavender Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:46:38'),
(686, 21, 'Guyabano Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:47:03'),
(687, 21, 'L-Carnitine', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:47:16'),
(688, 21, 'L-Cysteine 99 (CAS# 52-90-4)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:48:01'),
(689, 21, 'Gymnema Sylvestre Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:49:00'),
(690, 21, 'Lemon Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:49:10'),
(691, 21, 'Lentinulla Edodes', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:50:08'),
(692, 21, 'L-Glutamic Acid (CAS#56-86-0)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:50:46'),
(693, 21, 'L-Glutamine', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:51:22'),
(694, 21, 'Icariin 98% ', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:51:50'),
(695, 21, 'L-Glutathione 40%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:51:52'),
(696, 21, 'L-Glutathione Reduced 99%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:52:26'),
(697, 21, 'L-Glycine 99 (CAS# 56-40-6)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:53:02'),
(698, 21, 'Lingon Berry Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:53:38'),
(699, 21, 'Lingon Berry IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:54:12'),
(700, 21, 'Imperata Cylindrica Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:54:27'),
(701, 21, 'L-Theanine 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:55:38'),
(702, 21, 'JabuVital™ (Jabuticaba Juice Powder) - SKU 5411 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:56:00'),
(703, 21, 'L-Tryptophan 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:56:12'),
(704, 21, 'Luo Han Guo (Monk Fruit) Extract 80', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:56:52'),
(705, 21, 'Kakadu Plum Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 08:58:04'),
(706, 21, 'Habanero Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:00:51'),
(707, 21, 'Olive Leaf Extract (Oleuropein 40%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:00:59'),
(708, 21, 'Hawthorn Extract (Flavone 20%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:01:46'),
(709, 21, 'Hazelnut Flavor (SWP 21121)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:02:23'),
(710, 21, 'Hericium Erinaceus Extract (Polysaccharide 40%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:03:05'),
(711, 21, 'Hibiscus Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:03:45'),
(712, 21, 'Honey', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:04:46'),
(713, 21, 'Orange Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:05:21'),
(714, 21, 'Hops Flower Extract (5% Flavone)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:05:22'),
(715, 21, 'Orange Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:05:59'),
(716, 21, 'Horse Radish Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:06:28'),
(717, 21, 'Oregano Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:06:58'),
(718, 21, 'Hyaluronic Acid 95%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:07:12'),
(719, 21, 'Hyssop Leaf Extract 10:3', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:07:51'),
(720, 21, 'Thaumatin 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:08:10'),
(721, 21, 'Tongkat Ali Extract 50:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:08:42'),
(722, 21, 'Maca Root Extract 5:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:08:54'),
(723, 21, 'Tribulus Terrestris Extract (60% Saponins)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:09:48'),
(724, 21, 'Luo Han Guo (Monk Fruit) Extract 80%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:10:37'),
(725, 21, 'Maca Root Extract 5:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:11:29'),
(726, 21, 'Uva Ursi Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:12:11'),
(727, 21, 'Maitake Extract (30 Polysaccharides)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:13:00'),
(728, 21, 'Valerian Root Extract\r\n (Valeric Acid 0.8%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:13:04'),
(729, 21, 'Mango IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:13:41'),
(730, 21, 'Mango Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:14:15'),
(731, 21, 'Mangosteen Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:14:52'),
(732, 21, 'Wheatgrass Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:15:35'),
(733, 21, 'Wheatgrass Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:16:12'),
(734, 21, 'Mangosteen Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:17:28'),
(735, 21, 'Xanthan Gum', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:17:46'),
(736, 21, 'Maqui Berry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:18:04'),
(737, 21, 'Yerba Mate Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:18:46'),
(738, 21, 'MaquiForza™ (Organic) - SKU 784 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:18:48'),
(739, 21, 'Marine Collagen', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:19:28'),
(740, 21, 'Marshmallow Root Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:20:13'),
(741, 21, 'Yumberry Juice Powder - SKU 9926 ', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:21:05'),
(742, 21, 'Meriva', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:21:14'),
(743, 21, 'Yumberry Juice Powder - SKU 9926', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:23:46'),
(744, 21, 'Methylsulfonlymethane 99%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:25:53'),
(745, 21, 'Milk Thistle Silymarin Extract 80%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:26:33'),
(746, 21, 'Moringa Extract 10:1\r\n', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:28:09'),
(747, 21, 'Muira Puama Extract 1:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:29:02'),
(748, 21, 'Mulberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:29:41'),
(749, 21, 'NAC 99 (CAS# 616-91-1)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:31:23'),
(750, 21, 'Nettle Root Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:31:58'),
(751, 21, 'Non Dairy Creamer', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:45:17'),
(752, 21, 'Noni Fruit Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:46:00'),
(753, 21, 'Nutripanyzme Pro (Nattokinase)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:46:45'),
(754, 21, 'Nutripanyzme R (Vegpanzyme)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:47:19'),
(755, 21, 'Nutripanzyme Forte', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:47:57'),
(756, 21, 'Panax Ginseng Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:48:47'),
(757, 21, 'Pancreatin 8NF\r\n', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:49:26'),
(758, 21, 'Passion Flower Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:50:02'),
(759, 21, 'Passion Flower Extract (4 Flavone)\r\n', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:50:35'),
(760, 21, 'Peach Flavor (SWP 21211)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:51:21'),
(761, 21, 'Perilla Frutescens Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:51:50'),
(762, 21, 'Phellinus Linteus Extract (Polysaccharide 30%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:52:11'),
(763, 21, 'Pine Bark Tree Extract (Pycnogenol 95%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:52:33'),
(764, 21, 'Pine Pollen Powder (Broken Cell Wall)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:52:56'),
(765, 21, 'Plum Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:53:27'),
(766, 21, 'Plum Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:53:48'),
(767, 21, 'Plum Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:54:26'),
(768, 21, 'Pomegranate Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:54:45'),
(769, 21, 'Pomegranate Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:55:08'),
(770, 21, 'Potassium Sorbate', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:55:29'),
(771, 21, 'Pygeum Africanum Extract (2.5 Phytosterols)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:56:00'),
(772, 21, 'Pysllium Husk Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:57:21'),
(773, 21, 'Raspberry Geocapsarom 6027SP', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:58:07'),
(774, 21, 'Raspberry Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:58:33'),
(775, 21, 'Raspberry Crumbles IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:58:58'),
(776, 21, 'Rehmannia Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 09:59:36'),
(777, 21, 'Reishi Mushroom Extract (Polysaccharide 30 Triterpene 4)\r\n', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:00:01'),
(778, 21, 'Resveratrol 98%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:00:21'),
(779, 21, 'Rice Flour', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:00:58'),
(780, 21, 'Saccharum Officinarum Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:01:22'),
(781, 21, 'Saccharum Spontaneum Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:01:46'),
(782, 21, 'Salvia Miltiorrhiza Danshen 20%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:02:06'),
(783, 21, 'Saw Palmetto Extract (Fatty Acid 90%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:02:32'),
(784, 21, 'Sea Buckthorn Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:02:53'),
(785, 21, 'Serrapeptase Enteric Coating (Peptizyme)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:04:07'),
(786, 21, 'Sheep Shorel Root Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:04:27'),
(787, 21, 'Shiitake Mushroom Extract (Polysaccharide 30)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:04:48'),
(788, 21, 'Shilajit Extract Powder 5%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:05:08'),
(789, 21, 'Slippery Elm Bark Extract 10:2', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:05:27'),
(790, 21, 'test', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:05:41'),
(791, 21, 'Sodium Ascorbate', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:05:52'),
(792, 21, 'Soy Lecithin Powder (PC 20%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:07:18'),
(793, 21, 'Starch Coflo 67 E1442', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:07:40'),
(794, 21, 'Stinging Nettle Extract (Phytosterol 0.8%)', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:08:31'),
(795, 21, 'Strawberry Concentrate', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:08:55'),
(796, 21, 'Strawberry IQF', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:09:33'),
(797, 21, 'Strawberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:09:53'),
(798, 21, 'Sucralose 99%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:11:30'),
(799, 21, 'Sugar', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:11:53'),
(800, 21, 'Sunflower Oil', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:12:16'),
(801, 21, 'Sunflower Lecithin 30%', 3, '', '', NULL, 0, '', '', 0, '2021-01-25 10:12:40'),
(802, 21, 'Glycerine', 3, '', '', NULL, 0, '', '', 0, '2021-01-26 03:00:03'),
(803, 21, 'Passion Flower Essential Oil (Brazil)', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 07:57:07'),
(804, 21, 'Passion Flower Fragrance Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 07:57:29'),
(805, 21, 'Patchouli Essential Oil (Indonesia)', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 07:57:54'),
(806, 21, 'Peppermint Essential Oil (France)', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 07:58:13'),
(807, 21, 'Ravintsara Essential Oil (Madagascar)', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 07:58:38'),
(808, 21, 'Red Raspberry Seed Carrier Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 07:58:58'),
(809, 21, 'Rose Essential Oil (Bulgaria)', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 07:59:14'),
(810, 21, 'Rosemary Camphor Essential Oil (Tunisia)', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 07:59:33'),
(811, 21, 'Sandalwood Essential Oil (India)', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 07:59:57'),
(812, 21, 'Thyme Paracymen Essential Oil (Spain)', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 08:00:17'),
(813, 21, 'Valerian Root Essential Oil (Nepal)', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 08:00:36'),
(814, 21, 'Valerian Root Fragrance Oil', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 08:00:57'),
(815, 21, 'Vanilla Essential Oil (Mexico)', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 08:01:54'),
(816, 21, 'White Tea Essential Oil (China)', 10, '', '', NULL, 0, '', '', 0, '2021-01-26 08:02:31'),
(817, 21, 'Bottle - Wide Plastic White Bottle (HDPE 1000 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:04:42'),
(818, 21, 'Bottle - Wide Plastic White Bottle (HDPE 1000 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:06:04'),
(819, 21, 'Bottle - Wide Plastic White Bottle (HDPE 1000 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:06:53'),
(820, 21, 'Bottle - Wide Plastic White Bottle (HDPE 1000 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:07:26'),
(821, 21, 'Bottle - Wide Plastic White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:09:47'),
(822, 21, 'Bottle - Wide Plastic White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:10:20'),
(823, 21, 'Bottle - Wide Plastic White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:10:48'),
(824, 21, 'Bottle - Wide Plastic White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:11:10'),
(825, 21, 'Bottle - Curved Sexy White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:12:51'),
(826, 21, 'Bottle - Curved Sexy White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:13:16'),
(827, 21, 'Bottle - Curved Sexy White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:13:38'),
(828, 21, 'Bottle - Curved Sexy White Bottle (HDPE 500 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:14:09'),
(829, 21, 'Bottle - C07 HDPE White Plastic Bottle (80g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:17:39'),
(830, 21, 'Bottle - C07 HDPE White Plastic Bottle (80g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:18:01'),
(831, 21, 'Bottle - C07 HDPE White Plastic Bottle (80g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:18:23'),
(832, 21, 'Bottle - C07 HDPE White Plastic Bottle (80g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:18:48'),
(833, 21, 'Bottle - D12 HDPE White Plastic Botte (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:19:27'),
(834, 21, 'Bottle - D12 HDPE White Plastic Botte (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:20:25'),
(835, 21, 'Bottle - D12 HDPE White Plastic Botte (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:20:52'),
(836, 21, 'Bottle - D12 HDPE White Plastic Botte (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:21:14'),
(837, 21, 'Bottle - HD112 HDPE White Plastic Bottle (112g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:22:05'),
(838, 21, 'Bottle - HD112 HDPE White Plastic Bottle (112g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:22:33'),
(839, 21, 'Bottle - HD112 HDPE White Plastic Bottle (112g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:22:56'),
(840, 21, 'Bottle - HD112 HDPE White Plastic Bottle (112g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:23:19'),
(841, 21, 'Bottle - CB14 HDPE Small White Curved Sexy Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:24:08'),
(842, 21, 'Bottle - CB14 HDPE Small White Curved Sexy Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:24:30'),
(843, 21, 'Bottle - CB14 HDPE Small White Curved Sexy Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:24:51'),
(844, 21, 'Bottle - CB14 HDPE Small White Curved Sexy Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:25:19'),
(845, 21, 'Bottle - D28 HDPE White Plastic Bottle (275g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:28:55'),
(846, 21, 'Bottle - D28 HDPE White Plastic Bottle (275g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:29:18'),
(847, 21, 'Bottle - D28 HDPE White Plastic Bottle (275g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:29:45'),
(848, 21, 'Bottle - D28 HDPE White Plastic Bottle (275g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:30:12'),
(849, 21, 'Bottle - HD120 HDPE White Plastic Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:30:59'),
(850, 21, 'Bottle - HD120 HDPE White Plastic Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:31:23'),
(851, 21, 'Bottle - HD120 HDPE White Plastic Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:31:45'),
(852, 21, 'Bottle - HD120 HDPE White Plastic Bottle (120g)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:32:07'),
(853, 21, 'Bottle - Amber Glass Bottle Dropper (50 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:33:55'),
(854, 21, 'Bottle - Amber Glass Bottle Dropper (50 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:34:19'),
(855, 21, 'Bottle - Amber Glass Bottle Dropper (50 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:34:44'),
(856, 21, 'Bottle - Amber Glass Bottle Dropper (50 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:35:03'),
(857, 21, 'Bottle - Amber Glass Bottle Mist Spray (20 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:37:50'),
(858, 21, 'Bottle - Amber Glass Bottle Mist Spray (20 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:38:17'),
(859, 21, 'Bottle - Amber Glass Bottle Mist Spray (20 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:38:45'),
(860, 21, 'Bottle - Amber Glass Bottle Mist Spray (20 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-01-26 08:39:15'),
(861, 21, 'Guarana Extract 10%', 3, '', '', NULL, 0, '', '', 0, '2021-01-27 06:49:13'),
(862, 21, 'Capsules - Brown Bovine Gelatin #0', 2, '', '', NULL, 0, '', '', 0, '2021-01-27 06:53:05'),
(863, 21, 'Capsules - Scarlet Red Bovine Gelatin #0', 2, '', '', NULL, 0, '', '', 0, '2021-01-27 06:53:32'),
(864, 21, 'Capsules - Natural Transparent Veggie #0', 2, '', '', NULL, 0, '', '', 0, '2021-01-27 06:53:52'),
(865, 21, 'Capsules - White Bovine Gelatin #00', 2, '', '', NULL, 0, '', '', 0, '2021-01-27 06:54:15'),
(866, 21, 'Capsules - Pink Pearl Bovine Gelatin #0', 2, '', '', NULL, 0, '', '', 0, '2021-01-27 06:54:37'),
(867, 21, 'Capsules - White Pearl Bovine Gelatin #0', 2, '', '', NULL, 0, '', '', 0, '2021-01-27 06:55:11'),
(868, 21, 'Face Mask (Blue)', 11, '', '', NULL, 0, '', '', 0, '2021-01-28 06:56:37'),
(869, 21, 'Hair Net (Mob Cap)', 11, '', '', NULL, 0, '', '', 0, '2021-01-28 06:57:23'),
(870, 21, 'Yellow Ginger Raw', 3, '', '', NULL, 0, '', '', 0, '2021-02-01 06:32:02'),
(871, 21, 'Native Ginger Raw', 3, '', '', NULL, 0, '', '', 0, '2021-02-01 06:32:38'),
(872, 21, 'Purple Corn Extract 10:1', 3, '', '', NULL, 0, '', '', 0, '2021-02-01 07:13:41'),
(873, 21, 'Spirulina Powder', 3, '', '', NULL, 0, '', '', 0, '2021-02-01 07:47:29'),
(874, 21, 'Spirulina Tablets', 3, '', '', NULL, 0, '', '', 0, '2021-02-01 07:47:53'),
(875, 21, 'Bilberry Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-02-02 05:14:43'),
(876, 21, 'Acai Juice Powder (non-organic)', 8, '', '', NULL, 0, '', '', 0, '2021-02-03 01:50:47'),
(877, 21, 'Aluminum Foil', 2, '', '', NULL, 0, '', '', 0, '2021-02-24 06:34:31'),
(878, 21, 'LPG Gas Tank (11 kg)', 7, '', '', NULL, 0, '', '', 0, '2021-02-24 06:36:30'),
(879, 21, 'Sodium Bicarbonate', 7, '', '', NULL, 0, '', '', 0, '2021-02-24 06:37:35'),
(880, 21, 'ZP17 Tablet Press Punch & Die Set (8 mm) ROUND', 9, '', '', NULL, 0, '', '', 0, '2021-02-24 06:39:30'),
(881, 21, 'ZP17 Tablet Press Upper Cam Track', 9, '', '', NULL, 0, '', '', 0, '2021-02-24 06:40:27'),
(882, 21, 'Label - Satin Sticker (12.5" x 19")', 2, '', '', NULL, 0, '', '', 0, '2021-03-03 05:49:18'),
(883, 21, 'Midea Wall Mounted Aircon (2.0 HP Non Inverter) FP-53AST020KENV-N5', 9, '', '', NULL, 0, '', '', 0, '2021-03-08 06:13:40'),
(884, 21, 'Kleenguard G10 Flex Nitrile Gloves (Blue, M) 38520', 11, '', '', NULL, 0, '', '', 0, '2021-03-08 07:35:57'),
(885, 21, 'I-Tech Module (QUBE01N)', 9, '', '', NULL, 0, '', '', 0, '2021-03-09 08:43:58'),
(886, 21, 'Itech Module (QUBE01N)', 9, '', '', NULL, 0, '', '', 0, '2021-03-10 05:24:13'),
(887, 21, 'Make-Up For Use with 2BK009i (C-2BK009-4)', 9, '', '', NULL, 0, '', '', 0, '2021-03-10 05:25:05'),
(888, 21, 'Carton - (270 x 264 x 210 mm OD) RSC, BC Flute', 2, '', '', NULL, 0, '', '', 0, '2021-03-17 10:12:37'),
(889, 21, 'Carton - (530 x 256 x 233 mm OD) RSC, BC Flute', 2, '', '', NULL, 0, '', '', 0, '2021-03-17 10:13:10'),
(890, 21, 'Label - Spirulina ADD 250mg (198 mm x 75 mm) - Plain', 2, '', '', NULL, 0, '', '', 0, '2021-03-24 07:52:26'),
(891, 21, 'Label - AltaImune Amber Glass (113 mm x 55 mm) - 50 ml', 2, '', '', NULL, 0, '', '', 0, '2021-03-24 07:53:47'),
(892, 21, 'ZP17 Tablet Press Punch & Die Set (8 mm) OVAL', 9, '', '', NULL, 0, '', '', 0, '2021-03-26 05:53:55'),
(893, 21, 'Label - Renew 3G (163 mm x 42 mm) PP Silver + UV + Emboss', 8, '', '', NULL, 0, '', '', 0, '2021-04-07 06:28:25'),
(894, 21, 'Label - BoostCumin (163 mm x 42 mm) PP Silver + UV + Emboss', 8, '', '', NULL, 0, '', '', 0, '2021-04-07 06:29:53'),
(895, 21, 'Label - GR8-C (163 mm x 42 mm) PP Silver + UV + Emboss', 8, '', '', NULL, 0, '', '', 0, '2021-04-07 06:30:50'),
(896, 21, 'Capsules - Natural Transparent Veggie #00', 3, '', '', NULL, 0, '', '', 0, '2021-04-14 05:55:56'),
(897, 21, 'Fresh Bamboo Essential Oil (Indonesia) - Bambusoideae', 10, '', '', NULL, 0, '', '', 0, '2021-04-20 06:53:34'),
(898, 21, 'Packaging Tape (43 microns) - 2 x 100m', 2, '', '', NULL, 0, '', '', 0, '2021-04-20 08:35:24'),
(899, 21, 'Eucalyptus Radiata Essential Oil (Australia)', 10, '', '', NULL, 0, '', '', 0, '2021-04-21 08:31:06'),
(900, 21, 'Inhaler + Cotton Wick (White)', 2, '', '', NULL, 0, '', '', 0, '2021-04-27 06:34:05'),
(901, 21, 'Stevia', 3, '', '', NULL, 0, '', '', 0, '2021-04-27 06:35:33'),
(902, 21, 'Master Box #1 (530 mm x 256 mm x 233 mm)', 2, '', '', NULL, 0, '', '', 0, '2021-04-29 05:21:24'),
(903, 21, 'Master Box #2 (270 mm x 264 mm x 210 mm)', 2, '', '', NULL, 0, '', '', 0, '2021-04-29 05:23:38'),
(904, 21, 'Coffee Box (VNU) - 350g + Matte Film (95 mm x  58 mm x 135 mm)', 2, '', '', NULL, 0, '', '', 0, '2021-04-30 07:02:56'),
(905, 21, 'Pails (14 kg)', 7, '', '', NULL, 0, '', '', 0, '2021-05-14 07:28:55'),
(906, 21, '(VNU) Printed Aluminum Sachet Roll (64 microns - 90 mm x 500 meters)', 2, '', '', NULL, 0, '', '', 0, '2021-05-18 04:13:51'),
(907, 21, '34155-1 Kimtech Science Kimwipes Ex-L (60box/case - 280 sheets/box)', 11, '', '', NULL, 0, '', '', 0, '2021-05-21 06:30:17'),
(908, 21, 'MPN05 - C07,D12 Capseal (71 mm x 36 mm x 35u)', 2, '', '', NULL, 0, '', '', 0, '2021-05-25 05:22:54'),
(909, 21, 'Purple Corn Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-06-09 06:54:16'),
(910, 21, '(VNU) Coffee Sachet - Lapside Bag ALU Foil Film Roll (PET/VMPET/ PE)', 2, '', '', NULL, 0, '', '', 0, '2021-06-16 07:15:05'),
(911, 21, 'Safety Shoes (HAMMER STK # 10608)', 11, '', '', NULL, 0, '', '', 0, '2021-06-19 07:44:25'),
(912, 21, 'L-Glutathione Reduced 99% (Japan)', 3, '', '', NULL, 0, '', '', 0, '2021-07-08 10:07:11'),
(913, 21, 'Capsules - White Pearl Bovine Gelatin #0', 2, '', '', NULL, 0, '', '', 0, '2021-07-09 08:13:54'),
(914, 21, 'Urea 46 (50 kgs / bag)', 7, '', '', NULL, 0, '', '', 0, '2021-07-13 09:51:30'),
(915, 21, 'Lazada (Indoplas) - Vinyl Gloves "Large" 100/Box', 11, '', '', NULL, 0, '', '', 0, '2021-07-14 09:18:26'),
(916, 21, 'Lazada (Indoplas) - Disposable Face Mask - 50/Box', 11, '', '', NULL, 0, '', '', 0, '2021-07-14 09:20:55'),
(917, 21, 'Lazada (PerfectCare) - Mob Cap Hair Net White - 100/Box', 11, '', '', NULL, 0, '', '', 0, '2021-07-14 09:23:43'),
(918, 21, 'Magnesium Stearate', 3, '', '', NULL, 0, '', '', 0, '2021-07-27 06:51:58'),
(919, 21, 'LPG Gas Tank (50 kgs)', 7, '', '', NULL, 0, '', '', 0, '2021-07-28 09:55:01'),
(920, 21, 'EDTA Powder Calcium - Food Grade (45 kg / drum)', 7, '', '', NULL, 0, '', '', 0, '2021-07-29 10:25:51'),
(921, 21, 'Dipotassium Phosphate', 7, '', '', NULL, 0, '', '', 0, '2021-08-11 13:28:00'),
(922, 21, 'Caustic Soda Flakes', 7, '', '', NULL, 0, '', '', 0, '2021-08-11 13:29:01'),
(923, 21, 'Mono Ammonium Phosphate', 7, '', '', NULL, 0, '', '', 0, '2021-08-11 13:33:29'),
(924, 21, 'Zinc Methionine 18%', 3, '', '', NULL, 0, '', '', 0, '2021-08-13 16:41:56'),
(925, 21, 'Orange Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-08-13 16:42:43'),
(926, 21, 'Kiwi Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-08-13 16:43:11'),
(927, 21, 'Lactose Monohydrate', 3, '', '', NULL, 0, '', '', 0, '2021-08-13 16:44:14'),
(928, 21, 'Peppermint Essential Oil', 10, '', '', NULL, 0, '', '', 0, '2021-08-25 21:35:51'),
(929, 21, 'Tea Tree Essential Oil (Australia)', 10, '', '', NULL, 0, '', '', 0, '2021-09-01 10:03:31'),
(930, 21, 'L-OptiZinc', 3, '', '', NULL, 0, '', '', 0, '2021-09-01 23:22:34'),
(931, 21, 'Capsules - Natural Transparent Veggie #00', 3, '', '', NULL, 0, '', '', 0, '2021-09-27 23:41:56'),
(932, 21, 'Non Woven Ecobag (2 Colors) 14" x 18"', 2, '', '', NULL, 0, '', '', 0, '2021-09-27 23:43:03'),
(933, 21, 'Magnesium Sulfate FCC', 7, '', '', NULL, 0, '', '', 0, '2021-09-28 10:16:40'),
(934, 21, '3M Petrifilm E.Coli Count Plates (50 plates/box) 6404', 9, '', '', NULL, 0, '', '', 0, '2021-10-15 16:04:54'),
(935, 21, '3M Petrifilm Rapid Aerobic Count Plates (50 plates/box) 6478\r\n', 9, '', '', NULL, 0, '', '', 0, '2021-10-15 16:05:44'),
(936, 21, '3M Petrifilm Rapid Yeast & Mould Count Plates (50 plates/box) 6475', 9, '', '', NULL, 0, '', '', 0, '2021-10-15 16:06:36'),
(937, 21, 'ZP17 Tablet Press Punch & Die Set (8 mm) ', 9, '', '', NULL, 0, '', '', 0, '2021-10-20 06:30:36'),
(938, 21, 'Black Currant Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-10-27 02:58:19'),
(939, 21, 'test', 3, '', '', NULL, 0, '', '', 0, '2021-11-08 18:05:27'),
(940, 21, 'Curcumin 95% USDP', 3, '', '', NULL, 0, '', '', 0, '2021-11-18 07:55:30'),
(941, 21, 'Cranberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2021-11-18 07:56:26'),
(942, 21, 'Pedrollo Motor (1 HP)', 9, '', '', NULL, 0, '', '', 0, '2021-11-19 07:23:19'),
(943, 21, 'Pressure Tank', 9, '', '', NULL, 0, '', '', 0, '2021-11-19 07:24:16'),
(944, 21, 'Pressure Switch', 9, '', '', NULL, 0, '', '', 0, '2021-11-19 07:25:10'),
(945, 21, 'Pressure Gauge', 9, '', '', NULL, 0, '', '', 0, '2021-11-19 07:25:46'),
(946, 21, 'Check Valve', 9, '', '', NULL, 0, '', '', 0, '2021-11-19 07:26:18'),
(947, 21, 'Tee Fittings', 9, '', '', NULL, 0, '', '', 0, '2021-11-19 07:26:56'),
(948, 21, 'Filter', 9, '', '', NULL, 0, '', '', 0, '2021-11-19 07:27:29'),
(949, 21, 'Bottle - Amber Glass Bottle Dropper (50 ml)', 2, '', '', NULL, 0, '', '', 0, '2021-11-19 07:28:56'),
(950, 21, 'Lazada (Indoplas) - Vinyl Gloves ', 11, '', '', NULL, 0, '', '', 0, '2021-11-19 09:55:21'),
(951, 21, 'Aluminum Sachet with Print - (64 microns) (90mm x 500m) PET/VMPET/ PE ', 2, '', '', NULL, 0, '', '', 0, '2021-11-23 08:06:07'),
(952, 21, 'Sorbgel Desiccant - Moisture Absorbent (OWP-001-C) 1g', 2, '', '', NULL, 0, '', '', 0, '2021-12-01 02:47:56'),
(953, 21, 'Sodium Bicarbonate', 7, '', '', NULL, 0, '', '', 0, '2021-12-10 06:42:35'),
(954, 21, 'Submersible Pump', 9, '', '', NULL, 0, '', '', 0, '2021-12-14 05:53:00'),
(955, 21, 'Deep Well Pump', 9, '', '', NULL, 0, '', '', 0, '2021-12-14 05:53:48'),
(956, 21, 'Label - Gr8Life 8NOURISHES (155 mm x 53 mm) PP Silver + UV + Emboss + White', 2, '', '', NULL, 0, '', '', 0, '2021-12-15 08:51:22'),
(957, 21, 'Label - Gr8Life 8PROTECTS (155 mm x 53 mm) PP Silver + UV + Emboss + White', 2, '', '', NULL, 0, '', '', 0, '2021-12-15 08:52:04'),
(958, 21, 'Label - Spirulina Filipina (155 mm x 53 mm) PP Silver + UV Varnish Full Color + White', 2, '', '', NULL, 0, '', '', 0, '2021-12-15 08:53:18'),
(959, 21, 'Camu Camu Extract 20:1', 3, '', '', NULL, 0, '', '', 0, '2021-12-21 15:51:12'),
(960, 21, 'Mangosteen Extract 4:1', 3, '', '', NULL, 0, '', '', 0, '2021-12-21 15:51:54'),
(961, 21, 'Myrtle Essential Oil (France)', 10, '', '', NULL, 0, '', '', 0, '2022-01-21 08:58:41'),
(962, 21, 'Blackberry Juice Powder', 3, '', '', NULL, 0, '', '', 0, '2022-01-24 08:21:14'),
(963, 21, 'ZKTeco Biometrics Fingerprint Time Attendance Face Recognition (MB20 Series)', 9, '', '', NULL, 0, '', '', 0, '2022-01-25 08:26:17'),
(964, 21, 'Bubble Wrap (Bullet Type) 40 x 100m Roll', 2, '', '', NULL, 0, '', '', 0, '2022-01-25 08:28:10'),
(965, 21, 'Digital Table Scale - 3 kg x .2g (ATW Series - 210 mm x 280 mm)', 9, '', '', NULL, 0, '', '', 0, '2022-01-28 08:34:04'),
(966, 21, 'Digital Table Scale - 15 kg x 1g (ATW Series - 210 mm x 280 mm)', 9, '', '', NULL, 0, '', '', 0, '2022-01-28 08:34:50'),
(967, 21, 'Digital Platform Scale - 200 kg x 20g (KW02W - 420 mm x 520 mm)', 9, '', '', NULL, 0, '', '', 0, '2022-01-28 08:36:03'),
(968, 21, 'Perforated 80 Mesh', 9, '', '', NULL, 0, '', '', 0, '2022-01-28 09:08:24'),
(969, 21, 'MPN01 -  (125 mm x 115 mm x 25u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:04:41'),
(970, 21, 'MPN02 -  (105 mm x 140 mm x 25u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:05:47'),
(971, 21, 'MPN03 - (205 mm x 230 mm x 25u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:07:13'),
(972, 21, 'MPN04 - Capseal (85 mm x 32 mm x 40u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:08:44'),
(973, 21, 'MPN06 - Capseal (85 mm x 50 mm x 40u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:10:00'),
(974, 21, 'MPN07 - Capseal (85 mm x 35 mm x 40u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:11:31'),
(975, 21, 'MPN08 - Capseal (58 mm x 40 mm x 40u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:12:29'),
(976, 21, 'MPN09 - Capseal (78 mm x 30 mm x 40u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:13:53'),
(977, 21, 'MPN10 - Capseal (76 mm x 25 mm x 40u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:15:12'),
(978, 21, 'MPN11 - (210 mm x 340 mm x 25u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:17:52'),
(979, 21, 'MPN12 - D12 (85 mm x 125 mm x 25u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:20:00'),
(980, 21, 'MPN13 - C07 (80 mm x 120 mm x 25u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:21:09'),
(981, 21, 'MPN14 - HD120 (91 mm x 135 mm x 25u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:22:14'),
(982, 21, 'PVC Roll Form - 12 x 25u', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:23:23'),
(983, 21, 'MPN15 - Amber Glass Capseal (37 mm x 25 mm x 35u)', 2, '', '', NULL, 0, '', '', 0, '2022-02-04 09:25:33'),
(984, 21, 'Capsules - Brown Bovine Gelatin #00', 3, '', '', NULL, 0, '', '', 0, '2022-02-15 06:16:10'),
(985, 21, 'Window Blinds (46" Width x 72" Length - 2 Cuts) Dark Grey', 9, '', '', NULL, 0, '', '', 0, '2022-02-23 07:03:49'),
(986, 21, 'Nattokinase', 3, '', '', NULL, 0, '', '', 0, '2022-03-09 09:08:12'),
(987, 21, 'UVS PLastic Film Roll (98.5" x 100 meters x .008")', 7, '', '', NULL, 0, '', '', 0, '2022-03-09 09:13:29'),
(988, 21, '#50 Fine Mesh Net (3 meters x 50 meters) Roll', 7, '', '', NULL, 0, '', '', 0, '2022-03-15 10:03:58'),
(989, 21, '#50 Fine Mesh Net (4 meters x 50 meters) Roll', 7, '', '', NULL, 0, '', '', 0, '2022-03-15 10:05:02'),
(990, 21, 'MPN16 - Equicell Box (165 mm x 280 mm x 25u)', 2, '', '', NULL, 0, '', '', 0, '2022-03-16 15:04:17'),
(991, 21, 'Oil Seal (30 x 52 x 10)', 9, '', '', NULL, 0, '', '', 0, '2022-03-16 15:05:35'),
(992, 21, 'Oil Seal (25 x 52 x 10)', 9, '', '', NULL, 0, '', '', 0, '2022-03-16 15:09:25'),
(993, 21, 'Equicell Box (Body - 86 x 135 x 57 mm) (Cover - 90 x 140 x 62 mm) w/ Foam', 2, '', '', NULL, 0, '', '', 0, '2022-03-22 17:30:54');

-- --------------------------------------------------------

--
-- Table structure for table `pos_items_company`
--

CREATE TABLE `pos_items_company` (
  `id` int(255) NOT NULL,
  `item_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pos_items_company`
--

INSERT INTO `pos_items_company` (`id`, `item_id`, `company_id`) VALUES
(1, 1, 21),
(5, 5, 21),
(6, 6, 21),
(7, 7, 21),
(9, 9, 21),
(10, 10, 21),
(11, 11, 21),
(12, 12, 21),
(13, 13, 21),
(14, 14, 21),
(15, 15, 21),
(16, 16, 21),
(17, 17, 21),
(18, 18, 21),
(19, 19, 21),
(20, 20, 21),
(21, 21, 21),
(22, 22, 21),
(23, 23, 21),
(24, 24, 21),
(25, 25, 21),
(26, 26, 21),
(27, 27, 21),
(28, 28, 21),
(29, 29, 21),
(30, 30, 21),
(32, 32, 21),
(33, 33, 21),
(34, 34, 21),
(35, 35, 21),
(36, 36, 21),
(37, 37, 21),
(38, 38, 21),
(39, 39, 21),
(40, 40, 21),
(41, 41, 21),
(42, 42, 21),
(43, 43, 21),
(44, 44, 21),
(45, 45, 21),
(46, 46, 21),
(47, 47, 21),
(48, 48, 21),
(49, 49, 21),
(50, 50, 21),
(51, 51, 21),
(52, 52, 21),
(53, 53, 21),
(54, 54, 21),
(55, 55, 21),
(56, 56, 21),
(57, 57, 21),
(58, 58, 21),
(59, 59, 21),
(60, 60, 21),
(61, 61, 21),
(62, 62, 21),
(63, 63, 21),
(64, 64, 21),
(65, 65, 21),
(66, 66, 21),
(67, 67, 21),
(68, 68, 21),
(69, 69, 21),
(70, 70, 21),
(71, 71, 21),
(72, 72, 21),
(73, 73, 21),
(74, 74, 21),
(75, 75, 21),
(76, 76, 21),
(77, 77, 21),
(78, 78, 21),
(79, 79, 21),
(80, 80, 21),
(81, 81, 21),
(82, 82, 21),
(83, 83, 21),
(84, 84, 21),
(85, 85, 21),
(86, 86, 21),
(87, 87, 21),
(88, 88, 21),
(89, 89, 21),
(90, 90, 21),
(91, 91, 21),
(92, 92, 21),
(93, 93, 21),
(94, 94, 21),
(95, 95, 21),
(96, 96, 21),
(97, 97, 21),
(98, 98, 21),
(99, 99, 21),
(100, 100, 21),
(101, 101, 21),
(102, 102, 21),
(103, 103, 21),
(104, 104, 21),
(105, 105, 21),
(106, 106, 21),
(107, 107, 21),
(108, 108, 21),
(109, 109, 21),
(110, 110, 21),
(111, 111, 21),
(112, 112, 21),
(113, 113, 21),
(114, 114, 21),
(115, 115, 21),
(116, 116, 21),
(117, 117, 21),
(118, 118, 21),
(119, 119, 21),
(120, 120, 21),
(121, 121, 21),
(122, 122, 21),
(123, 123, 21),
(124, 124, 21),
(125, 125, 21),
(126, 126, 21),
(127, 127, 21),
(128, 128, 21),
(129, 129, 21),
(130, 130, 21),
(131, 131, 21),
(132, 132, 21),
(133, 133, 21),
(134, 134, 21),
(135, 135, 21),
(136, 136, 21),
(137, 137, 21),
(138, 138, 21),
(139, 139, 21),
(140, 140, 21),
(141, 141, 21),
(142, 142, 21),
(143, 143, 21),
(144, 144, 21),
(145, 145, 21),
(146, 146, 21),
(147, 147, 21),
(148, 148, 21),
(149, 149, 21),
(150, 150, 21),
(151, 151, 21),
(152, 152, 21),
(153, 153, 21),
(154, 154, 21),
(155, 155, 21),
(156, 156, 21),
(157, 157, 21),
(158, 158, 21),
(159, 159, 21),
(160, 160, 21),
(161, 161, 21),
(162, 162, 21),
(163, 163, 21),
(164, 164, 21),
(165, 165, 21),
(166, 166, 21),
(167, 167, 21),
(168, 168, 21),
(169, 169, 21),
(170, 170, 21),
(171, 171, 21),
(172, 172, 21),
(173, 173, 21),
(174, 174, 21),
(175, 175, 21),
(176, 176, 21),
(177, 177, 21),
(178, 178, 21),
(179, 179, 21),
(180, 180, 21),
(181, 181, 21),
(182, 182, 21),
(183, 183, 21),
(184, 184, 21),
(185, 185, 21),
(186, 186, 21),
(187, 187, 21),
(188, 188, 21),
(189, 189, 21),
(190, 190, 21),
(191, 191, 21),
(192, 192, 21),
(193, 193, 21),
(194, 194, 21),
(195, 195, 21),
(196, 196, 21),
(197, 197, 21),
(198, 198, 21),
(199, 199, 21),
(200, 200, 21),
(201, 201, 21),
(202, 202, 21),
(203, 203, 21),
(204, 204, 21),
(205, 205, 21),
(206, 206, 21),
(207, 207, 21),
(208, 208, 21),
(209, 209, 21),
(210, 210, 21),
(211, 211, 21),
(212, 212, 21),
(213, 213, 21),
(214, 214, 21),
(215, 215, 21),
(216, 216, 21),
(217, 217, 21),
(218, 218, 21),
(219, 219, 21),
(220, 220, 21),
(221, 221, 21),
(222, 222, 21),
(223, 223, 21),
(224, 224, 21),
(225, 225, 21),
(226, 226, 21),
(227, 227, 21),
(228, 228, 21),
(229, 229, 21),
(230, 230, 21),
(231, 231, 21),
(232, 232, 21),
(233, 233, 21),
(234, 234, 21),
(235, 235, 21),
(236, 236, 21),
(237, 237, 21),
(238, 238, 21),
(239, 239, 21),
(240, 240, 21),
(241, 241, 21),
(242, 242, 21),
(243, 243, 21),
(244, 244, 21),
(245, 245, 21),
(246, 246, 21),
(247, 247, 21),
(248, 248, 21),
(249, 249, 21),
(250, 250, 21),
(251, 251, 21),
(252, 252, 21),
(253, 253, 21),
(254, 254, 21),
(255, 255, 21),
(256, 256, 21),
(257, 257, 21),
(258, 258, 21),
(259, 259, 21),
(260, 260, 21),
(261, 261, 21),
(262, 262, 21),
(263, 263, 21),
(264, 264, 21),
(265, 265, 21),
(266, 266, 21),
(267, 267, 21),
(268, 268, 21),
(269, 269, 21),
(270, 270, 21),
(271, 271, 21),
(272, 272, 21),
(273, 273, 21),
(274, 274, 21),
(275, 275, 21),
(276, 276, 21),
(277, 277, 21),
(278, 278, 21),
(279, 279, 21),
(280, 280, 21),
(281, 281, 21),
(282, 282, 21),
(283, 283, 21),
(284, 284, 21),
(285, 285, 21),
(286, 286, 21),
(287, 287, 21),
(288, 288, 21),
(289, 289, 21),
(290, 290, 21),
(291, 291, 21),
(292, 292, 21),
(293, 293, 21),
(294, 294, 21),
(295, 295, 21),
(296, 296, 21),
(297, 297, 21),
(298, 298, 21),
(299, 299, 21),
(300, 300, 21),
(301, 301, 21),
(302, 302, 21),
(303, 303, 21),
(304, 304, 21),
(305, 305, 21),
(306, 306, 21),
(307, 307, 21),
(308, 308, 21),
(309, 309, 21),
(310, 310, 21),
(311, 311, 21),
(312, 312, 21),
(313, 313, 21),
(314, 314, 21),
(315, 315, 21),
(316, 316, 21),
(317, 317, 21),
(318, 318, 21),
(319, 319, 21),
(320, 320, 21),
(321, 321, 21),
(322, 322, 21),
(323, 323, 21),
(324, 324, 21),
(325, 325, 21),
(326, 326, 21),
(327, 327, 21),
(328, 328, 21),
(329, 329, 21),
(330, 330, 21),
(331, 331, 21),
(332, 332, 21),
(333, 333, 21),
(334, 334, 21),
(335, 335, 21),
(336, 336, 21),
(337, 337, 21),
(338, 338, 21),
(339, 339, 21),
(340, 340, 21),
(341, 341, 21),
(342, 342, 21),
(343, 343, 21),
(344, 344, 21),
(345, 345, 21),
(346, 346, 21),
(347, 347, 21),
(348, 348, 21),
(349, 349, 21),
(350, 350, 21),
(351, 351, 21),
(352, 352, 21),
(353, 353, 21),
(354, 354, 21),
(355, 355, 21),
(356, 356, 21),
(357, 357, 21),
(358, 358, 21),
(359, 359, 21),
(360, 360, 21),
(361, 361, 21),
(362, 362, 21),
(363, 363, 21),
(364, 364, 21),
(365, 365, 21),
(366, 366, 21),
(367, 367, 21),
(368, 368, 21),
(369, 369, 21),
(370, 370, 21),
(371, 371, 21),
(372, 372, 21),
(373, 373, 21),
(374, 374, 21),
(375, 375, 21),
(376, 376, 21),
(377, 377, 21),
(378, 378, 21),
(379, 379, 21),
(380, 380, 21),
(381, 381, 21),
(382, 382, 21),
(383, 383, 21),
(384, 384, 21),
(385, 385, 21),
(386, 386, 21),
(387, 387, 21),
(388, 388, 21),
(389, 389, 21),
(390, 390, 21),
(391, 391, 21),
(392, 392, 21),
(393, 393, 21),
(394, 394, 21),
(395, 395, 21),
(396, 396, 21),
(397, 397, 21),
(398, 398, 21),
(399, 399, 21),
(400, 400, 21),
(401, 401, 21),
(402, 402, 21),
(403, 403, 21),
(404, 404, 21),
(405, 405, 21),
(406, 406, 21),
(407, 407, 21),
(408, 408, 21),
(409, 409, 21),
(410, 410, 21),
(411, 411, 21),
(412, 412, 21),
(413, 413, 21),
(414, 414, 21),
(415, 415, 21),
(416, 416, 21),
(417, 417, 21),
(418, 418, 21),
(419, 419, 21),
(420, 420, 21),
(421, 421, 21),
(422, 422, 21),
(423, 423, 21),
(424, 424, 21),
(425, 425, 21),
(426, 426, 21),
(427, 427, 21),
(428, 428, 21),
(429, 429, 21),
(430, 430, 21),
(431, 431, 21),
(432, 432, 21),
(433, 433, 21),
(434, 434, 21),
(435, 435, 21),
(436, 436, 21),
(437, 437, 21),
(438, 438, 21),
(439, 439, 21),
(440, 440, 21),
(441, 441, 21),
(442, 442, 21),
(443, 443, 21),
(444, 444, 21),
(445, 445, 21),
(446, 446, 21),
(447, 447, 21),
(448, 448, 21),
(449, 449, 21),
(450, 450, 21),
(451, 451, 21),
(452, 452, 21),
(453, 453, 21),
(454, 454, 21),
(455, 455, 21),
(456, 456, 21),
(457, 457, 21),
(458, 458, 21),
(459, 459, 21),
(460, 460, 21),
(461, 461, 21),
(462, 462, 21),
(463, 463, 21),
(464, 464, 21),
(465, 465, 21),
(466, 466, 21),
(467, 467, 21),
(468, 468, 21),
(469, 469, 21),
(470, 470, 21),
(471, 471, 21),
(472, 472, 21),
(473, 473, 21),
(474, 474, 21),
(475, 475, 21),
(476, 476, 21),
(477, 477, 21),
(478, 478, 21),
(479, 479, 21),
(480, 480, 21),
(481, 481, 21),
(482, 482, 21),
(483, 483, 21),
(484, 484, 21),
(485, 485, 21),
(486, 486, 21),
(487, 487, 21),
(488, 488, 21),
(489, 489, 21),
(490, 490, 21),
(491, 491, 21),
(492, 492, 21),
(493, 493, 21),
(494, 494, 21),
(495, 495, 21),
(496, 496, 21),
(497, 497, 21),
(498, 498, 21),
(499, 499, 21),
(500, 500, 21),
(501, 501, 21),
(502, 502, 21),
(503, 503, 21),
(504, 504, 21),
(505, 505, 21),
(506, 506, 21),
(507, 507, 21),
(508, 508, 21),
(509, 509, 21),
(510, 510, 21),
(511, 511, 21),
(512, 512, 21),
(513, 513, 21),
(514, 514, 21),
(515, 515, 21),
(516, 516, 21),
(517, 517, 21),
(518, 518, 21),
(519, 519, 21),
(520, 520, 21),
(521, 521, 21),
(522, 522, 21),
(523, 523, 21),
(524, 524, 21),
(525, 525, 21),
(526, 526, 21),
(527, 527, 21),
(528, 528, 21),
(529, 529, 21),
(530, 530, 21),
(531, 531, 21),
(532, 532, 21),
(533, 533, 21),
(534, 534, 21),
(535, 535, 21),
(536, 536, 21),
(537, 537, 21),
(538, 538, 21),
(539, 539, 21),
(540, 540, 21),
(541, 541, 21),
(542, 542, 21),
(543, 543, 21),
(544, 544, 21),
(545, 545, 21),
(546, 546, 21),
(547, 547, 21),
(548, 548, 21),
(549, 549, 21),
(550, 550, 21),
(551, 551, 21),
(552, 552, 21),
(553, 553, 21),
(554, 554, 21),
(555, 555, 21),
(556, 556, 21),
(557, 557, 21),
(558, 558, 21),
(559, 559, 21),
(560, 560, 21),
(561, 561, 21),
(562, 562, 21),
(563, 563, 21),
(564, 564, 21),
(565, 565, 21),
(566, 566, 21),
(567, 567, 21),
(568, 568, 21),
(569, 569, 21),
(570, 570, 21),
(571, 571, 21),
(572, 572, 21),
(573, 573, 21),
(574, 574, 21),
(575, 575, 21),
(576, 576, 21),
(577, 577, 21),
(578, 578, 21),
(579, 579, 21),
(580, 580, 21),
(581, 581, 21),
(582, 582, 21),
(583, 583, 21),
(584, 584, 21),
(585, 585, 21),
(586, 586, 21),
(587, 587, 21),
(588, 588, 21),
(589, 589, 21),
(590, 590, 21),
(591, 591, 21),
(592, 592, 21),
(593, 593, 21),
(594, 594, 21),
(595, 595, 21),
(596, 596, 21),
(597, 597, 21),
(598, 598, 21),
(599, 599, 21),
(600, 600, 21),
(601, 601, 21),
(602, 602, 21),
(603, 603, 21),
(604, 604, 21),
(605, 605, 21),
(606, 606, 21),
(607, 607, 21),
(608, 608, 21),
(609, 609, 21),
(610, 610, 21),
(611, 611, 21),
(612, 612, 21),
(613, 613, 21),
(614, 614, 21),
(615, 615, 21),
(616, 616, 21),
(617, 617, 21),
(618, 618, 21),
(619, 619, 21),
(620, 620, 21),
(621, 621, 21),
(622, 622, 21),
(623, 623, 21),
(624, 624, 21),
(625, 625, 21),
(626, 626, 21),
(627, 627, 21),
(628, 628, 21),
(629, 629, 21),
(630, 630, 21),
(631, 631, 21),
(632, 632, 21),
(633, 633, 21),
(634, 634, 21),
(635, 635, 21),
(636, 636, 21),
(637, 637, 21),
(638, 638, 21),
(639, 639, 21),
(640, 640, 21),
(641, 641, 21),
(642, 642, 21),
(643, 643, 21),
(644, 644, 21),
(645, 645, 21),
(646, 646, 21),
(647, 647, 21),
(648, 648, 21),
(649, 649, 21),
(650, 650, 21),
(651, 651, 21),
(652, 652, 21),
(653, 653, 21),
(654, 654, 21),
(655, 655, 21),
(656, 656, 21),
(657, 657, 21),
(658, 658, 21),
(659, 659, 21),
(660, 660, 21),
(661, 661, 21),
(662, 662, 21),
(663, 663, 21),
(664, 664, 21),
(665, 665, 21),
(666, 666, 21),
(667, 667, 21),
(668, 668, 21),
(669, 669, 21),
(670, 670, 21),
(671, 671, 21),
(672, 672, 21),
(673, 673, 21),
(674, 674, 21),
(675, 675, 21),
(676, 676, 21),
(677, 677, 21),
(678, 678, 21),
(679, 679, 21),
(680, 680, 21),
(681, 681, 21),
(682, 682, 21),
(683, 683, 21),
(684, 684, 21),
(685, 685, 21),
(686, 686, 21),
(687, 687, 21),
(688, 688, 21),
(689, 689, 21),
(690, 690, 21),
(691, 691, 21),
(692, 692, 21),
(693, 693, 21),
(694, 694, 21),
(695, 695, 21),
(696, 696, 21),
(697, 697, 21),
(698, 698, 21),
(699, 699, 21),
(700, 700, 21),
(701, 701, 21),
(702, 702, 21),
(703, 703, 21),
(704, 704, 21),
(705, 705, 21),
(706, 706, 21),
(707, 707, 21),
(708, 708, 21),
(709, 709, 21),
(710, 710, 21),
(711, 711, 21),
(712, 712, 21),
(713, 713, 21),
(714, 714, 21),
(715, 715, 21),
(716, 716, 21),
(717, 717, 21),
(718, 718, 21),
(719, 719, 21),
(720, 720, 21),
(721, 721, 21),
(722, 722, 21),
(723, 723, 21),
(724, 724, 21),
(725, 725, 21),
(726, 726, 21),
(727, 727, 21),
(728, 728, 21),
(729, 729, 21),
(730, 730, 21),
(731, 731, 21),
(732, 732, 21),
(733, 733, 21),
(734, 734, 21),
(735, 735, 21),
(736, 736, 21),
(737, 737, 21),
(738, 738, 21),
(739, 739, 21),
(740, 740, 21),
(741, 741, 21),
(742, 742, 21),
(743, 743, 21),
(744, 744, 21),
(745, 745, 21),
(746, 746, 21),
(747, 747, 21),
(748, 748, 21),
(749, 749, 21),
(750, 750, 21),
(751, 751, 21),
(752, 752, 21),
(753, 753, 21),
(754, 754, 21),
(755, 755, 21),
(756, 756, 21),
(757, 757, 21),
(758, 758, 21),
(759, 759, 21),
(760, 760, 21),
(761, 761, 21),
(762, 762, 21),
(763, 763, 21),
(764, 764, 21),
(765, 765, 21),
(766, 766, 21),
(767, 767, 21),
(768, 768, 21),
(769, 769, 21),
(770, 770, 21),
(771, 771, 21),
(772, 772, 21),
(773, 773, 21),
(774, 774, 21),
(775, 775, 21),
(776, 776, 21),
(777, 777, 21),
(778, 778, 21),
(779, 779, 21),
(780, 780, 21),
(781, 781, 21),
(782, 782, 21),
(783, 783, 21),
(784, 784, 21),
(785, 785, 21),
(786, 786, 21),
(787, 787, 21),
(788, 788, 21),
(789, 789, 21),
(790, 790, 21),
(791, 791, 21),
(792, 792, 21),
(793, 793, 21),
(794, 794, 21),
(795, 795, 21),
(796, 796, 21),
(797, 797, 21),
(798, 798, 21),
(799, 799, 21),
(800, 800, 21),
(801, 801, 21),
(802, 802, 21),
(803, 803, 21),
(804, 804, 21),
(805, 805, 21),
(806, 806, 21),
(807, 807, 21),
(808, 808, 21),
(809, 809, 21),
(810, 810, 21),
(811, 811, 21),
(812, 812, 21),
(813, 813, 21),
(814, 814, 21),
(815, 815, 21),
(816, 816, 21),
(817, 817, 21),
(818, 818, 21),
(819, 819, 21),
(820, 820, 21),
(821, 821, 21),
(822, 822, 21),
(823, 823, 21),
(824, 824, 21),
(825, 825, 21),
(826, 826, 21),
(827, 827, 21),
(828, 828, 21),
(829, 829, 21),
(830, 830, 21),
(831, 831, 21),
(832, 832, 21),
(833, 833, 21),
(834, 834, 21),
(835, 835, 21),
(836, 836, 21),
(837, 837, 21),
(838, 838, 21),
(839, 839, 21),
(840, 840, 21),
(841, 841, 21),
(842, 842, 21),
(843, 843, 21),
(844, 844, 21),
(845, 845, 21),
(846, 846, 21),
(847, 847, 21),
(848, 848, 21),
(849, 849, 21),
(850, 850, 21),
(851, 851, 21),
(852, 852, 21),
(853, 853, 21),
(854, 854, 21),
(855, 855, 21),
(856, 856, 21),
(857, 857, 21),
(858, 858, 21),
(859, 859, 21),
(860, 860, 21),
(861, 861, 21),
(862, 862, 21),
(863, 863, 21),
(864, 864, 21),
(865, 865, 21),
(866, 866, 21),
(867, 867, 21),
(868, 868, 21),
(869, 869, 21),
(870, 870, 21),
(871, 871, 21),
(872, 872, 21),
(873, 873, 21),
(874, 874, 21),
(875, 875, 21),
(876, 876, 21),
(877, 877, 21),
(878, 878, 21),
(879, 879, 21),
(880, 880, 21),
(881, 881, 21),
(882, 882, 21),
(883, 883, 21),
(884, 884, 21),
(885, 885, 21),
(886, 886, 21),
(887, 887, 21),
(888, 888, 21),
(889, 889, 21),
(890, 890, 21),
(891, 891, 21),
(892, 892, 21),
(893, 893, 21),
(894, 894, 21),
(895, 895, 21),
(896, 896, 21),
(897, 897, 21),
(898, 898, 21),
(899, 899, 21),
(900, 900, 21),
(901, 901, 21),
(902, 902, 21),
(903, 903, 21),
(904, 904, 21),
(905, 905, 21),
(906, 906, 21),
(907, 907, 21),
(908, 908, 21),
(909, 909, 21),
(910, 910, 21),
(911, 911, 21),
(912, 912, 21),
(913, 913, 21),
(914, 914, 21),
(915, 915, 21),
(916, 916, 21),
(917, 917, 21),
(918, 918, 21),
(919, 919, 21),
(920, 920, 21),
(921, 921, 21),
(922, 922, 21),
(923, 923, 21),
(924, 924, 21),
(925, 925, 21),
(926, 926, 21),
(927, 927, 21),
(928, 928, 21),
(929, 929, 21),
(930, 930, 21),
(931, 931, 21),
(932, 932, 21),
(933, 933, 21),
(934, 934, 21),
(935, 935, 21),
(936, 936, 21),
(937, 937, 21),
(938, 938, 21),
(939, 939, 21),
(940, 940, 21),
(941, 941, 21),
(942, 942, 21),
(943, 943, 21),
(944, 944, 21),
(945, 945, 21),
(946, 946, 21),
(947, 947, 21),
(948, 948, 21),
(949, 949, 21),
(950, 950, 21),
(951, 951, 21),
(952, 952, 21),
(953, 953, 21),
(954, 954, 21),
(955, 955, 21),
(956, 956, 21),
(957, 957, 21),
(958, 958, 21),
(959, 959, 21),
(960, 960, 21),
(961, 961, 21),
(962, 962, 21),
(963, 963, 21),
(964, 964, 21),
(965, 965, 21),
(966, 966, 21),
(967, 967, 21),
(968, 968, 21),
(969, 969, 21),
(970, 970, 21),
(971, 971, 21),
(972, 972, 21),
(973, 973, 21),
(974, 974, 21),
(975, 975, 21),
(976, 976, 21),
(977, 977, 21),
(978, 978, 21),
(979, 979, 21),
(980, 980, 21),
(981, 981, 21),
(982, 982, 21),
(983, 983, 21),
(984, 984, 21),
(985, 985, 21),
(986, 986, 21),
(987, 987, 21),
(988, 988, 21),
(989, 989, 21),
(990, 990, 21),
(991, 991, 21),
(992, 992, 21),
(993, 993, 21);

-- --------------------------------------------------------

--
-- Table structure for table `pos_items_detail`
--

CREATE TABLE `pos_items_detail` (
  `id` int(255) NOT NULL,
  `barcode` varchar(256) NOT NULL,
  `item_id` int(255) NOT NULL,
  `item_code` varchar(20) DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `size_id` int(255) NOT NULL DEFAULT '0',
  `color_id` int(255) NOT NULL DEFAULT '0',
  `quantity` double(15,2) NOT NULL,
  `avg_cost` decimal(20,4) NOT NULL,
  `cost_price` decimal(20,4) NOT NULL,
  `unit_price` decimal(20,4) NOT NULL,
  `tax_id` int(20) DEFAULT '0',
  `re_stock_level` double(20,2) DEFAULT NULL,
  `unit_id` int(20) NOT NULL,
  `location_id` int(100) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `inventory_acc_code` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `wip_acc_code` varchar(20) NOT NULL,
  `landed_cost` decimal(10,3) DEFAULT NULL,
  `shipping_terms` varchar(100) DEFAULT NULL,
  `local_currency` decimal(10,3) DEFAULT NULL,
  `supplier_id` varchar(150) DEFAULT NULL,
  `quoted_qty` varchar(20) DEFAULT NULL,
  `hs_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_items_detail`
--

INSERT INTO `pos_items_detail` (`id`, `barcode`, `item_id`, `item_code`, `item_type`, `size_id`, `color_id`, `quantity`, `avg_cost`, `cost_price`, `unit_price`, `tax_id`, `re_stock_level`, `unit_id`, `location_id`, `picture`, `inventory_acc_code`, `deleted`, `wip_acc_code`, `landed_cost`, `shipping_terms`, `local_currency`, `supplier_id`, `quoted_qty`, `hs_code`) VALUES
(1, '1', 1, 'it1', 'purchased', 0, 0, 0.00, '600.0000', '300.0000', '0.0000', NULL, NULL, 0, NULL, '', '1004', 1, '0', '500.000', 'Fedex / Shipping ', '950.000', 'Supplier', NULL, ''),
(2, '5', 5, 'it5', NULL, 0, 0, 0.00, '400.0000', '400.0000', '0.0000', NULL, NULL, 1, NULL, '', '1004', 1, '0', '150.000', 'Fedex', '558.000', NULL, NULL, ''),
(3, '6', 6, 'it6', NULL, 0, 0, 10.00, '100.0000', '100.0000', '0.0000', NULL, NULL, 0, NULL, NULL, '1004', 1, '0', '200.000', 'Ex Works / FedEx', '795.000', NULL, NULL, ''),
(4, '7', 7, 'it7', NULL, 0, 0, 10.00, '300.0000', '300.0000', '0.0000', NULL, NULL, 1, NULL, '', '1004', 1, '0', '400.000', 'Ex Works / FedEx', '780.000', 'Supplier', NULL, ''),
(5, '9', 9, 'it9', NULL, 0, 0, 4.00, '400.0000', '400.0000', '0.0000', NULL, NULL, 1, NULL, NULL, NULL, 1, '0', '300.000', 'Ex Works / FedEx', '33432.000', 'supplier', NULL, ''),
(6, '10', 10, 'it10', NULL, 0, 0, 4.00, '400.0000', '400.0000', '0.0000', NULL, NULL, 1, NULL, NULL, NULL, 1, '0', '300.000', 'Ex Works / FedEx', '33432.000', 'supplier', NULL, ''),
(7, '11', 11, 'it11', NULL, 0, 0, 330.00, '20.0000', '20.0000', '0.0000', NULL, NULL, 2, NULL, NULL, NULL, 1, '0', '30.000', 'Fedex', '34343.000', 'New supplier', NULL, ''),
(8, '12', 12, 'it12', NULL, 0, 0, 330.00, '20.0000', '20.0000', '0.0000', NULL, NULL, 2, NULL, NULL, NULL, 1, '0', '30.000', 'Fedex', '34343.000', 'New supplier', NULL, ''),
(9, '13', 13, 'it13', NULL, 0, 0, 330.00, '20.0000', '20.0000', '0.0000', NULL, NULL, 2, NULL, NULL, NULL, 1, '0', '30.000', 'Fedex', '34343.000', 'New supplier', NULL, ''),
(10, '14', 14, 'it14', NULL, 0, 0, 330.00, '20.0000', '20.0000', '0.0000', NULL, NULL, 2, NULL, NULL, NULL, 1, '0', '30.000', 'Fedex', '34343.000', 'New supplier', NULL, ''),
(11, '15', 15, 'it15', NULL, 0, 0, 330.00, '20.0000', '20.0000', '0.0000', NULL, NULL, 2, NULL, NULL, NULL, 1, '0', '30.000', 'Fedex', '34343.000', 'New supplier', NULL, ''),
(12, '16', 16, 'it16', NULL, 0, 0, 0.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 1, NULL, NULL, NULL, 1, '0', '18.000', 'Ex Works', '5990.000', 'John\'s Apples', NULL, ''),
(13, '17', 17, 'it17', NULL, 0, 0, 0.00, '375.0000', '15.0000', '0.0000', NULL, NULL, 1, NULL, NULL, NULL, 1, '0', '25.000', 'Ex Works / FedEx', '3200.000', 'Sunfull Bio', NULL, ''),
(14, '18', 18, 'it18', NULL, 0, 0, 0.00, '450.0000', '15.0000', '0.0000', NULL, NULL, 1, NULL, NULL, NULL, 1, '0', '28.000', 'Ex Works', '5300.000', 'Sunfull Bio', '-', ''),
(15, '19', 19, 'it19', NULL, 0, 0, 29.00, '11.6668', '4.0000', '0.0000', NULL, NULL, 1, NULL, NULL, NULL, 1, '0', '26.000', 'Ex Works', '3200.000', 'Sunfull Bio', '-', ''),
(16, '20', 20, 'it20', NULL, 0, 0, 35.00, '21.1869', '10.0000', '0.0000', NULL, NULL, 1, NULL, NULL, NULL, 1, '0', '42.000', 'Ex Works', '2500.000', 'Ladros Inc.', '-', ''),
(17, '21', 21, 'it21', NULL, 0, 0, 31.00, '0.5400', '0.5400', '0.0000', NULL, NULL, 1, NULL, NULL, NULL, 1, '0', '0.790', 'FOB', '16.000', 'Bottle Supplier', '10,000', ''),
(18, '22', 22, 'it22', NULL, 0, 0, 71.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 3, NULL, NULL, NULL, 1, '0', '30.000', 'FOB', '3400.000', 'Alcohol Company', '10', ''),
(19, '23', 23, 'it23', NULL, 0, 0, 25.00, '100.0000', '100.0000', '0.0000', NULL, NULL, 0, NULL, NULL, NULL, 1, '0', '200.000', '', '0.000', '', '100', ''),
(20, '24', 24, 'it24', NULL, 0, 0, 13.00, '150.0000', '150.0000', '0.0000', NULL, NULL, 0, NULL, NULL, NULL, 1, '0', '200.000', '', '0.000', '', '-', ''),
(21, '25', 25, 'it25', NULL, 0, 0, 0.00, '900.0000', '900.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '550.000', 'Ex works', '50.000', 'Arisun', '-', ''),
(22, '26', 26, 'it26', NULL, 0, 0, 0.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 0, NULL, NULL, NULL, 1, '0', '500.000', 'Ex Works', '24.000', 'Arisun', '-', ''),
(23, '27', 27, 'it27', NULL, 0, 0, 0.00, '1250000.0000', '25.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '31.000', '3', '5421.000', 'Arisun', '-', ''),
(24, '28', 28, 'it28', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 0, NULL, NULL, NULL, 1, '0', '26.000', '2', '3411.000', 'Arisun', '-', ''),
(25, '29', 29, 'it29', NULL, 0, 0, 0.00, '100.0000', '100.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '200.000', 'FOB', '0.000', '', '-', ''),
(26, '30', 30, 'it30', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 0, NULL, NULL, NULL, 1, '0', '0.000', '2', '0.000', '', '0', ''),
(27, '32', 32, 'it32', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 0, NULL, NULL, NULL, 1, '0', '0.000', '2', '0.000', '7', '0', ''),
(28, '33', 33, 'it33', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 0, NULL, NULL, NULL, 1, '0', '0.000', '0', '0.000', '? number:0 ?', '0', ''),
(29, '34', 34, 'it34', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '0', '0.000', '? number:0 ?', '0', ''),
(30, '35', 35, 'it35', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '7', '-', ''),
(31, '36', 36, 'it36', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '9', '-', ''),
(32, '37', 37, 'it37', NULL, 0, 0, 0.00, '4030.0000', '4030.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '12', '5030.000', '12', '-', ''),
(33, '38', 38, 'it38', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '38.500', '5', '2040.500', '9', '-', ''),
(34, '39', 39, 'it39', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '11', '-', ''),
(35, '40', 40, 'it40', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(36, '41', 41, 'it41', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '13', '-', ''),
(37, '42', 42, 'it42', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(38, '43', 43, 'it43', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '8', '-', ''),
(39, '44', 44, 'it44', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(40, '45', 45, 'it45', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(41, '46', 46, 'it46', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(42, '47', 47, 'it47', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '8', '-', ''),
(43, '48', 48, 'it48', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '8', '-', ''),
(44, '49', 49, 'it49', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '13', '-', ''),
(45, '50', 50, 'it50', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '13', '-', ''),
(46, '51', 51, 'it51', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(47, '52', 52, 'it52', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(48, '53', 53, 'it53', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(49, '54', 54, 'it54', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '9', '-', ''),
(50, '55', 55, 'it55', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(51, '56', 56, 'it56', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '15', '-', ''),
(52, '57', 57, 'it57', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '8', '-', ''),
(53, '58', 58, 'it58', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(54, '59', 59, 'it59', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(55, '60', 60, 'it60', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(56, '61', 61, 'it61', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(57, '62', 62, 'it62', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(58, '63', 63, 'it63', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(59, '64', 64, 'it64', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(60, '65', 65, 'it65', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(61, '66', 66, 'it66', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '8', '-', ''),
(62, '67', 67, 'it67', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(63, '68', 68, 'it68', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '15', '-', ''),
(64, '69', 69, 'it69', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(65, '70', 70, 'it70', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '15', '-', ''),
(66, '71', 71, 'it71', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(67, '72', 72, 'it72', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(68, '73', 73, 'it73', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '8', '-', ''),
(69, '74', 74, 'it74', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(70, '75', 75, 'it75', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '8', '-', ''),
(71, '76', 76, 'it76', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(72, '77', 77, 'it77', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '15', '-', ''),
(73, '78', 78, 'it78', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(74, '79', 79, 'it79', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(75, '80', 80, 'it80', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 13, NULL, NULL, NULL, 1, '0', '0.000', '7', '0.000', '19', '-', ''),
(76, '81', 81, 'it81', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '16', '-', ''),
(77, '82', 82, 'it82', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '13', '-', ''),
(78, '83', 83, 'it83', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(79, '84', 84, 'it84', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(80, '85', 85, 'it85', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '13', '-', ''),
(81, '86', 86, 'it86', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(82, '87', 87, 'it87', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(83, '88', 88, 'it88', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '15', '-', ''),
(84, '89', 89, 'it89', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '11', '-', ''),
(85, '90', 90, 'it90', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(86, '91', 91, 'it91', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '15', '-', ''),
(87, '92', 92, 'it92', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '8', '-', ''),
(88, '93', 93, 'it93', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(89, '94', 94, 'it94', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '21', '-', ''),
(90, '95', 95, 'it95', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '15', '-', ''),
(91, '96', 96, 'it96', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '8', '-', ''),
(92, '97', 97, 'it97', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(93, '98', 98, 'it98', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '8', '-', ''),
(94, '99', 99, 'it99', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(95, '100', 100, 'it100', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(96, '101', 101, 'it101', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '15', '-', ''),
(97, '102', 102, 'it102', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '8', '-', ''),
(98, '103', 103, 'it103', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(99, '104', 104, 'it104', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(100, '105', 105, 'it105', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.000', '8', '-', ''),
(101, '106', 106, 'it106', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '15', '-', ''),
(102, '107', 107, 'it107', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '7', '-', ''),
(103, '108', 108, 'it108', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '7', '-', ''),
(104, '109', 109, 'it109', NULL, 0, 0, 0.00, '800.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '9', '-', ''),
(105, '110', 110, 'it110', NULL, 0, 0, 0.00, '4030.0000', '4030.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '8', '5030.000', '12', '-', ''),
(106, '111', 111, 'it111', NULL, 0, 0, 0.00, '945.0000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '38.500', '5', '2040.500', '9', '-', ''),
(107, '112', 112, 'it112', NULL, 0, 0, 0.00, '621.0000', '31.0500', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '56.050', '5', '2970.650', '11', '-', ''),
(108, '113', 113, 'it113', NULL, 0, 0, 0.00, '26.5000', '26.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '37.500', '5', '1987.500', '7', '-', ''),
(109, '114', 114, 'it114', NULL, 0, 0, 0.00, '850.0000', '17.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '28.000', '5', '1484.000', '13', '-', ''),
(110, '115', 115, 'it115', NULL, 0, 0, 0.00, '915.0000', '30.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '41.500', '5', '2199.500', '7', '-', ''),
(111, '116', 116, 'it116', NULL, 0, 0, 0.00, '350.0000', '350.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '350.000', '8', '-', ''),
(112, '117', 117, 'it117', NULL, 0, 0, 0.00, '2100.0000', '70.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '81.000', '5', '4293.000', '7', '-', ''),
(113, '118', 118, 'it118', NULL, 0, 0, 0.00, '120.0000', '120.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '131.000', '5', '6943.000', '7', '-', ''),
(114, '119', 119, 'it119', NULL, 0, 0, 0.00, '1805.0000', '72.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '83.200', '5', '4409.600', '7', '-', ''),
(115, '120', 120, 'it120', NULL, 0, 0, 0.00, '53.7600', '53.7600', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '53.760', '8', '-', ''),
(116, '121', 121, 'it121', NULL, 0, 0, 0.00, '48.4000', '48.4000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '66.400', '5', '3519.200', '14', '-', ''),
(117, '122', 122, 'it122', NULL, 0, 0, 0.00, '160.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.000', '5', '1431.000', '13', '-', ''),
(118, '123', 123, 'it123', NULL, 0, 0, 0.00, '38.0000', '38.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '49.000', '5', '2597.000', '13', '-', ''),
(119, '124', 124, 'it124', NULL, 0, 0, 0.00, '20.5000', '20.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '31.500', '5', '1669.500', '7', '-', ''),
(120, '125', 125, 'it125', NULL, 0, 0, 0.00, '50.0000', '50.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '61.000', '5', '3233.000', '7', '-', ''),
(121, '126', 126, 'it126', NULL, 0, 0, 0.00, '14.5000', '14.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.500', '5', '1351.500', '7', '-', ''),
(122, '127', 127, 'it127', NULL, 0, 0, 0.00, '6.8000', '6.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '31.800', '5', '1865.400', '9', '-', ''),
(123, '128', 128, 'it128', NULL, 0, 0, 0.00, '6.5000', '6.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '31.500', '5', '1669.500', '9', '-', ''),
(124, '129', 129, 'it129', NULL, 0, 0, 0.00, '230.0000', '230.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '241.000', '5', '12773.000', '15', '-', ''),
(125, '130', 130, 'it130', NULL, 0, 0, 0.00, '324.8000', '324.8000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '324.800', '8', '-', ''),
(126, '131', 131, 'it131', NULL, 0, 0, 0.00, '14.3000', '14.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.300', '5', '1340.900', '7', '-', ''),
(127, '132', 132, 'it132', NULL, 0, 0, 0.00, '112.0000', '112.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '123.000', '5', '6519.000', '7', '-', ''),
(128, '133', 133, 'it133', NULL, 0, 0, 0.00, '15.5000', '15.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '26.500', '5', '1404.500', '7', '-', ''),
(129, '134', 134, 'it134', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '29.000', '5', '1537.000', '7', '-', ''),
(130, '135', 135, 'it135', NULL, 0, 0, 0.00, '12.2000', '12.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.200', '5', '1229.600', '7', '-', ''),
(131, '136', 136, 'it136', NULL, 0, 0, 0.00, '350.0000', '350.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '350.000', '8', '-', ''),
(132, '137', 137, 'it137', NULL, 0, 0, 0.00, '270.0000', '270.0000', '0.0000', NULL, NULL, 15, NULL, NULL, NULL, 1, '0', '0.000', '6', '310.000', '23', '-', ''),
(133, '138', 138, 'it138', NULL, 0, 0, 0.00, '11.5000', '11.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.500', '5', '1192.500', '7', '-', ''),
(134, '139', 139, 'it139', NULL, 0, 0, 0.00, '12.2000', '12.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.200', '5', '1229.600', '7', '-', ''),
(135, '140', 140, 'it140', NULL, 0, 0, 0.00, '24.5000', '24.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '35.500', '5', '1881.500', '7', '-', ''),
(136, '141', 141, 'it141', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '13', '-', ''),
(137, '142', 142, 'it142', NULL, 0, 0, 0.00, '42.0000', '42.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '53.000', '5', '2809.000', '13', '-', ''),
(138, '143', 143, 'it143', NULL, 0, 0, 0.00, '50.2000', '50.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '61.200', '5', '3243.600', '7', '-', ''),
(139, '144', 144, 'it144', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '15', '-', ''),
(140, '145', 145, 'it145', NULL, 0, 0, 0.00, '13.2000', '13.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.200', '5', '1282.600', '7', '-', ''),
(141, '146', 146, 'it146', NULL, 0, 0, 0.00, '72.7800', '72.7800', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '83.780', '5', '4440.340', '7', '-', ''),
(142, '147', 147, 'it147', NULL, 0, 0, 0.00, '26.5000', '26.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '37.500', '5', '1987.500', '7', '-', ''),
(143, '148', 148, 'it148', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.000', '5', '1325.000', '13', '-', ''),
(144, '149', 149, 'it149', NULL, 0, 0, 0.00, '42.0000', '42.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '53.000', '5', '2809.000', '13', '-', ''),
(145, '150', 150, 'it150', NULL, 0, 0, 0.00, '51.2000', '51.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '62.200', '5', '3296.600', '7', '-', ''),
(146, '151', 151, 'it151', NULL, 0, 0, 0.00, '13.3000', '13.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.300', '5', '1287.900', '7', '-', ''),
(147, '152', 152, 'it152', NULL, 0, 0, 0.00, '57.3000', '57.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '68.300', '5', '3619.900', '7', '-', ''),
(148, '153', 153, 'it153', NULL, 0, 0, 0.00, '3.9800', '3.9800', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '28.980', '5', '1535.940', '20', '-', ''),
(149, '154', 154, 'it154', NULL, 0, 0, 0.00, '3.7800', '3.7800', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '28.780', '5', '1525.340', '20', '-', ''),
(150, '155', 155, 'it155', NULL, 0, 0, 0.00, '32.0000', '32.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '43.000', '5', '2279.000', '16', '-', ''),
(151, '156', 156, 'it156', NULL, 0, 0, 0.00, '20.3400', '20.3400', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '31.340', '5', '1661.020', '7', '-', ''),
(152, '157', 157, 'it157', NULL, 0, 0, 0.00, '55.0000', '55.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '73.000', '5', '3869.000', '14', '-', ''),
(153, '158', 158, 'it158', NULL, 0, 0, 0.00, '59.2000', '59.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '70.200', '5', '3720.600', '7', '-', ''),
(154, '159', 159, 'it159', NULL, 0, 0, 0.00, '13.8000', '13.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.800', '5', '1314.400', '7', '-', ''),
(155, '160', 160, 'it160', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '7', '-', ''),
(156, '161', 161, 'it161', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '15', '-', ''),
(157, '162', 162, 'it162', NULL, 0, 0, 0.00, '122.5000', '122.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '133.500', '5', '7075.500', '7', '-', ''),
(158, '163', 163, 'it163', NULL, 0, 0, 0.00, '11.7000', '11.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.700', '5', '1203.100', '7', '-', ''),
(159, '164', 164, 'it164', NULL, 0, 0, 0.00, '3350.0000', '3350.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '3361.000', '5', '178133.000', '15', '-', ''),
(160, '165', 165, 'it165', NULL, 0, 0, 0.00, '11.8000', '11.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.800', '5', '1208.400', '7', '-', ''),
(161, '166', 166, 'it166', NULL, 0, 0, 0.00, '24.8000', '24.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '49.800', '5', '2639.400', '11', '-', ''),
(162, '167', 167, 'it167', NULL, 0, 0, 0.00, '240.0000', '240.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '265.000', '5', '14045.000', '24', '-', ''),
(163, '168', 168, 'it168', NULL, 0, 0, 0.00, '258.0000', '258.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '269.000', '5', '14257.000', '13', '-', ''),
(164, '169', 169, 'it169', NULL, 0, 0, 0.00, '34.5000', '34.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '45.500', '5', '2411.500', '7', '-', ''),
(165, '170', 170, 'it170', NULL, 0, 0, 0.00, '11.8000', '11.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.800', '5', '1208.400', '7', '-', ''),
(166, '171', 171, 'it171', NULL, 0, 0, 0.00, '12.6000', '12.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.600', '5', '1250.800', '7', '-', ''),
(167, '172', 172, 'it172', NULL, 0, 0, 0.00, '21.5000', '21.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '32.500', '5', '1722.500', '7', '-', ''),
(168, '173', 173, 'it173', NULL, 0, 0, 0.00, '13.2000', '13.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.200', '5', '1282.600', '7', '-', ''),
(169, '174', 174, 'it174', NULL, 0, 0, 0.00, '16.8000', '16.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.800', '5', '1473.400', '7', '-', ''),
(170, '175', 175, 'it175', NULL, 0, 0, 0.00, '32.8000', '32.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '43.800', '5', '2321.400', '7', '-', ''),
(171, '176', 176, 'it176', NULL, 0, 0, 0.00, '22.9500', '22.9500', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '47.950', '5', '2541.350', '11', '-', ''),
(172, '177', 177, 'it177', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.500', '5', '1298.500', '7', '-', ''),
(173, '178', 178, 'it178', NULL, 0, 0, 0.00, '108.7700', '108.7700', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '108.770', '6', '108.770', '8', '-', ''),
(174, '179', 179, 'it179', NULL, 0, 0, 0.00, '550.0000', '550.0000', '0.0000', NULL, NULL, 13, NULL, NULL, NULL, 1, '0', '650.000', '7', '650.000', '19', '-', ''),
(175, '180', 180, 'it180', NULL, 0, 0, 0.00, '12.8000', '12.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.800', '5', '1261.400', '7', '-', ''),
(176, '181', 181, 'it181', NULL, 0, 0, 0.00, '44.7000', '44.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '69.700', '5', '3694.100', '11', '-', ''),
(177, '182', 182, 'it182', NULL, 0, 0, 0.00, '22.0000', '22.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '33.000', '5', '1749.000', '15', '-', ''),
(178, '183', 183, 'it183', NULL, 0, 0, 0.00, '550.0000', '550.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '600.000', '6', '600.000', '21', '-', ''),
(179, '184', 184, 'it184', NULL, 0, 0, 0.00, '25.0000', '25.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '36.000', '5', '1908.000', '15', '-', ''),
(180, '185', 185, 'it185', NULL, 0, 0, 0.00, '11.6000', '11.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.600', '5', '1197.800', '7', '-', ''),
(181, '186', 186, 'it186', NULL, 0, 0, 0.00, '12.0000', '12.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.000', '5', '1219.000', '7', '-', ''),
(182, '187', 187, 'it187', NULL, 0, 0, 0.00, '112.0000', '112.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '123.000', '5', '6519.000', '7', '-', ''),
(183, '188', 188, 'it188', NULL, 0, 0, 0.00, '16.5000', '16.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.500', '5', '1457.500', '7', '-', ''),
(184, '189', 189, 'it189', NULL, 0, 0, 0.00, '374.9900', '374.9900', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '374.990', '8', '-', ''),
(185, '190', 190, 'it190', NULL, 0, 0, 0.00, '24.2000', '24.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '35.200', '5', '1865.600', '7', '-', ''),
(186, '191', 191, 'it191', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.500', '5', '1298.500', '7', '-', ''),
(187, '192', 192, 'it192', NULL, 0, 0, 0.00, '11.0000', '11.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.000', '5', '1166.000', '15', '-', ''),
(188, '193', 193, 'it193', NULL, 0, 0, 0.00, '62.5000', '62.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '73.600', '5', '3895.500', '7', '-', ''),
(189, '194', 194, 'it194', NULL, 0, 0, 0.00, '8.6000', '8.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '19.600', '5', '1038.800', '7', '-', ''),
(190, '195', 195, 'it195', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.000', '5', '1431.000', '15', '-', ''),
(191, '196', 196, 'it196', NULL, 0, 0, 0.00, '20.2000', '20.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '31.200', '5', '1653.600', '7', '-', ''),
(192, '197', 197, 'it197', NULL, 0, 0, 0.00, '12.3000', '12.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.300', '5', '1234.900', '7', '-', ''),
(193, '198', 198, 'it198', NULL, 0, 0, 0.00, '72.8000', '72.8000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '72.800', '6', '72.800', '8', '-', ''),
(194, '199', 199, 'it199', NULL, 0, 0, 0.00, '135.5200', '135.5200', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '135.520', '8', '-', ''),
(195, '200', 200, 'it200', NULL, 0, 0, 0.00, '17.5000', '17.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '28.500', '5', '1510.500', '7', '-', ''),
(196, '201', 201, 'it201', NULL, 0, 0, 0.00, '22.5000', '22.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '33.500', '5', '1775.500', '7', '-', ''),
(197, '202', 202, 'it202', NULL, 0, 0, 0.00, '28.0000', '28.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '39.000', '5', '2067.000', '16', '-', ''),
(198, '203', 203, 'it203', NULL, 0, 0, 0.00, '15.5000', '15.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '26.500', '5', '1404.500', '7', '-', ''),
(199, '204', 204, 'it204', NULL, 0, 0, 0.00, '16.4000', '16.4000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.400', '5', '1452.200', '7', '-', ''),
(200, '205', 205, 'it205', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.000', '5', '1431.000', '15', '-', ''),
(201, '206', 206, 'it206', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '46.000', '5', '2438.000', '16', '-', ''),
(202, '207', 207, 'it207', NULL, 0, 0, 0.00, '1291.3600', '1291.3600', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '1291.360', '8', '-', ''),
(203, '208', 208, 'it208', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '7', '-', ''),
(204, '209', 209, 'it209', NULL, 0, 0, 0.00, '1291.3600', '1291.3600', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '1291.360', '8', '-', ''),
(205, '210', 210, 'it210', NULL, 0, 0, 0.00, '220.0000', '220.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '220.000', '8', '-', ''),
(206, '211', 211, 'it211', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '29.000', '5', '1537.000', '15', '-', ''),
(207, '212', 212, 'it212', NULL, 0, 0, 0.00, '207.2000', '207.2000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '207.200', '8', '-', ''),
(208, '213', 213, 'it213', NULL, 0, 0, 0.00, '18.4000', '18.4000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '29.400', '5', '1558.200', '7', '-', ''),
(209, '214', 214, 'it214', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.500', '5', '1298.500', '15', '-', ''),
(210, '215', 215, 'it215', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.500', '5', '1298.500', '7', '-', ''),
(211, '216', 216, 'it216', NULL, 0, 0, 0.00, '12.7000', '12.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.700', '5', '1256.100', '7', '-', ''),
(212, '217', 217, 'it217', NULL, 0, 0, 0.00, '20.9500', '20.9500', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '45.950', '5', '2435.350', '11', '-', ''),
(213, '218', 218, 'it218', NULL, 0, 0, 0.00, '72.7800', '72.7800', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '83.780', '5', '4440.340', '7', '-', ''),
(214, '219', 219, 'it219', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.500', '5', '1245.500', '7', '-', ''),
(215, '220', 220, 'it220', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.500', '5', '1245.500', '7', '-', ''),
(216, '221', 221, 'it221', NULL, 0, 0, 0.00, '12.7000', '12.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.700', '5', '1256.100', '7', '-', ''),
(217, '222', 222, 'it222', NULL, 0, 0, 0.00, '223.0000', '223.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '234.000', '5', '12402.000', '7', '-', ''),
(218, '223', 223, 'it223', NULL, 0, 0, 0.00, '54.7000', '54.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '65.700', '5', '3482.100', '7', '-', ''),
(219, '224', 224, 'it224', NULL, 0, 0, 0.00, '26.5000', '26.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '37.500', '5', '1987.500', '7', '-', ''),
(220, '225', 225, 'it225', NULL, 0, 0, 0.00, '22.5000', '22.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '33.500', '5', '1775.500', '15', '-', ''),
(221, '226', 226, 'it226', NULL, 0, 0, 0.00, '484.0000', '484.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '509.000', '5', '26977.000', '30', '-', ''),
(222, '227', 227, 'it227', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.500', '5', '1298.500', '7', '-', ''),
(223, '228', 228, 'it228', NULL, 0, 0, 0.00, '47.0000', '47.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '58.000', '5', '3074.000', '7', '-', ''),
(224, '229', 229, 'it229', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.000', '5', '1431.000', '13', '-', ''),
(225, '230', 230, 'it230', NULL, 0, 0, 0.00, '12.9000', '12.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.900', '5', '1266.700', '7', '-', ''),
(226, '231', 231, 'it231', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '29.000', '5', '1537.000', '13', '-', ''),
(227, '232', 232, 'it232', NULL, 0, 0, 0.00, '320.0000', '320.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '320.000', '29', '-', ''),
(228, '233', 233, 'it233', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '46.000', '5', '2438.000', '13', '-', ''),
(229, '234', 234, 'it234', NULL, 0, 0, 0.00, '8.4600', '8.4600', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '19.460', '5', '1031.380', '7', '-', ''),
(230, '235', 235, 'it235', NULL, 0, 0, 0.00, '22.5000', '22.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '33.500', '5', '1775.500', '13', '-', ''),
(231, '236', 236, 'it236', NULL, 0, 0, 0.00, '63.0000', '63.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '63.000', '8', '-', ''),
(232, '237', 237, 'it237', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '7', '-', ''),
(233, '238', 238, 'it238', NULL, 0, 0, 0.00, '21.5000', '21.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '32.500', '5', '1722.500', '7', '-', ''),
(234, '239', 239, 'it239', NULL, 0, 0, 0.00, '27.0000', '27.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '38.000', '5', '2014.000', '16', '-', ''),
(235, '240', 240, 'it240', NULL, 0, 0, 0.00, '582.4000', '582.4000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '582.400', '8', '-', ''),
(236, '241', 241, 'it241', NULL, 0, 0, 0.00, '0.1500', '0.1500', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.180', '17', '-', ''),
(237, '242', 242, 'it242', NULL, 0, 0, 0.00, '69.4400', '69.4400', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '69.440', '8', '-', ''),
(238, '243', 243, 'it243', NULL, 0, 0, 0.00, '12.0000', '12.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.000', '5', '1219.000', '13', '-', ''),
(239, '244', 244, 'it244', NULL, 0, 0, 0.00, '0.1500', '0.1500', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.180', '17', '-', ''),
(240, '245', 245, 'it245', NULL, 0, 0, 0.00, '31.5000', '31.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '42.500', '5', '2252.500', '7', '-', ''),
(241, '246', 246, 'it246', NULL, 0, 0, 0.00, '0.3600', '0.3600', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.390', '17', '-', ''),
(242, '247', 247, 'it247', NULL, 0, 0, 0.00, '0.3300', '0.3300', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.360', '17', '-', ''),
(243, '248', 248, 'it248', NULL, 0, 0, 0.00, '21.7600', '21.7600', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '21.760', '8', '-', ''),
(244, '249', 249, 'it249', NULL, 0, 0, 0.00, '0.1700', '0.1700', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.200', '17', '-', ''),
(245, '250', 250, 'it250', NULL, 0, 0, 0.00, '103.5300', '103.5300', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '103.530', '8', '-', ''),
(246, '251', 251, 'it251', NULL, 0, 0, 0.00, '0.1700', '0.1700', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.200', '17', '-', ''),
(247, '252', 252, 'it252', NULL, 0, 0, 0.00, '38.0000', '38.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '49.000', '5', '2597.000', '7', '-', ''),
(248, '253', 253, 'it253', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.500', '5', '1425.500', '7', '-', ''),
(249, '254', 254, 'it254', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '7', '-', ''),
(250, '255', 255, 'it255', NULL, 0, 0, 0.00, '33.0000', '33.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '44.000', '5', '2332.000', '7', '-', ''),
(251, '256', 256, 'it256', NULL, 0, 0, 0.00, '40.9000', '40.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '65.900', '5', '3492.700', '11', '-', ''),
(252, '257', 257, 'it257', NULL, 0, 0, 0.00, '12.3000', '12.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '37.300', '5', '1976.900', '11', '-', ''),
(253, '258', 258, 'it258', NULL, 0, 0, 0.00, '15.8000', '15.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '26.800', '5', '1240.400', '7', '-', ''),
(254, '259', 259, 'it259', NULL, 0, 0, 0.00, '13.6000', '13.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.600', '5', '1303.800', '7', '-', ''),
(255, '260', 260, 'it260', NULL, 0, 0, 0.00, '41.0000', '41.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '52.000', '5', '2756.000', '7', '-', ''),
(256, '261', 261, 'it261', NULL, 0, 0, 0.00, '71.5000', '71.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '82.500', '5', '4372.500', '7', '-', ''),
(257, '262', 262, 'it262', NULL, 0, 0, 0.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '26.000', '5', '1378.000', '15', '-', ''),
(258, '263', 263, 'it263', NULL, 0, 0, 0.00, '26.0000', '26.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '37.000', '5', '1961.000', '15', '-', ''),
(259, '264', 264, 'it264', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.000', '13', '-', ''),
(260, '265', 265, 'it265', NULL, 0, 0, 0.00, '421.4000', '421.4000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '521.400', '12', '521.400', '22', '-', ''),
(261, '266', 266, 'it266', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.500', '5', '1298.500', '7', '-', ''),
(262, '267', 267, 'it267', NULL, 0, 0, 0.00, '16.9000', '16.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.900', '5', '1478.700', '7', '-', ''),
(263, '268', 268, 'it268', NULL, 0, 0, 0.00, '13.8000', '13.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.800', '5', '1314.400', '7', '-', ''),
(264, '269', 269, 'it269', NULL, 0, 0, 0.00, '44.0000', '44.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '55.000', '5', '2915.000', '13', '-', ''),
(265, '270', 270, 'it270', NULL, 0, 0, 0.00, '26.1000', '26.1000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '37.100', '5', '1966.300', '7', '-', ''),
(266, '271', 271, 'it271', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.000', '5', '1325.000', '13', '-', ''),
(267, '272', 272, 'it272', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.000', '5', '1325.000', '7', '-', ''),
(268, '273', 273, 'it273', NULL, 0, 0, 0.00, '359.5200', '359.5200', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '359.520', '8', '-', ''),
(269, '274', 274, 'it274', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.000', '5', '1325.000', '13', '-', ''),
(270, '275', 275, 'it275', NULL, 0, 0, 0.00, '12.8000', '12.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.800', '5', '1261.400', '7', '-', ''),
(271, '276', 276, 'it276', NULL, 0, 0, 0.00, '44.3000', '44.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '55.300', '5', '2930.900', '7', '-', ''),
(272, '277', 277, 'it277', NULL, 0, 0, 0.00, '6.9000', '6.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '17.900', '5', '948.700', '7', '-', ''),
(273, '278', 278, 'it278', NULL, 0, 0, 0.00, '9.2000', '9.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '20.200', '5', '1070.600', '7', '-', ''),
(274, '279', 279, 'it279', NULL, 0, 0, 0.00, '70.0000', '70.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '81.000', '5', '4293.000', '7', '-', ''),
(275, '280', 280, 'it280', NULL, 0, 0, 0.00, '135.0000', '135.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '146.000', '5', '7738.000', '7', '-', ''),
(276, '281', 281, 'it281', NULL, 0, 0, 0.00, '5.2000', '5.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '16.200', '5', '858.600', '7', '-', ''),
(277, '282', 282, 'it282', NULL, 0, 0, 0.00, '19.4000', '19.4000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '30.400', '5', '1611.200', '7', '-', ''),
(278, '283', 283, 'it283', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.500', '5', '1245.500', '13', '-', ''),
(279, '284', 284, 'it284', NULL, 0, 0, 0.00, '38.0000', '38.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '49.000', '5', '2597.000', '13', '-', ''),
(280, '285', 285, 'it285', NULL, 0, 0, 0.00, '185.9200', '185.9200', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '185.920', '6', '185.920', '8', '-', ''),
(281, '286', 286, 'it286', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.500', '5', '1245.500', '7', '-', ''),
(282, '287', 287, 'it287', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.500', '5', '1245.500', '7', '-', ''),
(283, '288', 288, 'it288', NULL, 0, 0, 0.00, '35.8000', '35.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '46.800', '5', '2480.400', '7', '-', ''),
(284, '289', 289, 'it289', NULL, 0, 0, 0.00, '18.2000', '18.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '29.500', '5', '1563.500', '15', '-', ''),
(285, '290', 290, 'it290', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.000', '5', '1431.000', '15', '-', ''),
(286, '291', 291, 'it291', NULL, 0, 0, 0.00, '22.2000', '22.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '33.200', '5', '1759.600', '7', '-', ''),
(287, '292', 292, 'it292', NULL, 0, 0, 0.00, '48.0000', '48.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '66.000', '5', '3498.000', '14', '-', ''),
(288, '293', 293, 'it293', NULL, 0, 0, 0.00, '209.0000', '209.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '220.000', '5', '11660.000', '7', '-', ''),
(289, '294', 294, 'it294', NULL, 0, 0, 0.00, '59.5000', '59.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '70.500', '5', '3736.500', '7', '-', ''),
(290, '295', 295, 'it295', NULL, 0, 0, 0.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '26.000', '5', '1378.000', '13', '-', ''),
(291, '296', 296, 'it296', NULL, 0, 0, 0.00, '12.3000', '12.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.300', '5', '1234.900', '7', '-', ''),
(292, '297', 297, 'it297', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.000', '5', '1431.000', '7', '-', ''),
(293, '298', 298, 'it298', NULL, 0, 0, 0.00, '27.0000', '27.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '38.000', '5', '2014.000', '7', '-', ''),
(294, '299', 299, 'it299', NULL, 0, 0, 0.00, '65.0000', '65.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '65.000', '8', '-', ''),
(295, '300', 300, 'it300', NULL, 0, 0, 0.00, '12.2000', '12.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.200', '5', '1229.600', '7', '-', ''),
(296, '301', 301, 'it301', NULL, 0, 0, 0.00, '11.7000', '11.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.700', '5', '1203.100', '7', '-', ''),
(297, '302', 302, 'it302', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.000', '5', '1325.000', '13', '-', ''),
(298, '303', 303, 'it303', NULL, 0, 0, 0.00, '110.0000', '110.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '140.000', '6', '140.000', '26', '-', ''),
(299, '304', 304, 'it304', NULL, 0, 0, 0.00, '622.0000', '622.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '633.000', '5', '33549.000', '7', '-', ''),
(300, '305', 305, 'it305', NULL, 0, 0, 0.00, '520.0000', '520.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '570.000', '18', '-', ''),
(301, '306', 306, 'it306', NULL, 0, 0, 0.00, '93.0000', '93.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '104.000', '5', '5512.000', '15', '-', ''),
(302, '307', 307, 'it307', NULL, 0, 0, 0.00, '13.3000', '13.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.300', '5', '1287.900', '7', '-', ''),
(303, '308', 308, 'it308', NULL, 0, 0, 0.00, '483.2000', '483.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '494.500', '5', '26208.500', '7', '-', ''),
(304, '309', 309, 'it309', NULL, 0, 0, 0.00, '260.0000', '260.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '285.000', '5', '15105.000', '27', '-', ''),
(305, '310', 310, 'it310', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '29.000', '5', '1537.000', '15', '-', ''),
(306, '311', 311, 'it311', NULL, 0, 0, 0.00, '52.0000', '52.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '63.000', '5', '3339.000', '15', '-', ''),
(307, '312', 312, 'it312', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '43.000', '5', '2279.000', '27', '-', ''),
(308, '313', 313, 'it313', NULL, 0, 0, 0.00, '20.0000', '20.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '31.000', '5', '1643.000', '15', '-', ''),
(309, '314', 314, 'it314', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '29.000', '5', '1537.000', '13', '-', ''),
(310, '315', 315, 'it315', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.000', '5', '1431.000', '15', '-', ''),
(311, '316', 316, 'it316', NULL, 0, 0, 0.00, '85.0000', '85.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '110.000', '5', '5830.000', '27', '-', ''),
(312, '317', 317, 'it317', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.000', '5', '1325.000', '7', '-', ''),
(313, '318', 318, 'it318', NULL, 0, 0, 0.00, '359.5200', '359.5200', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '359.520', '6', '359.520', '8', '-', ''),
(314, '319', 319, 'it319', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.000', '5', '1325.000', '13', '-', ''),
(315, '320', 320, 'it320', NULL, 0, 0, 0.00, '12.8000', '12.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.800', '5', '1261.400', '7', '-', '');
INSERT INTO `pos_items_detail` (`id`, `barcode`, `item_id`, `item_code`, `item_type`, `size_id`, `color_id`, `quantity`, `avg_cost`, `cost_price`, `unit_price`, `tax_id`, `re_stock_level`, `unit_id`, `location_id`, `picture`, `inventory_acc_code`, `deleted`, `wip_acc_code`, `landed_cost`, `shipping_terms`, `local_currency`, `supplier_id`, `quoted_qty`, `hs_code`) VALUES
(316, '321', 321, 'it321', NULL, 0, 0, 0.00, '14.2000', '14.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.200', '5', '1335.600', '7', '-', ''),
(317, '322', 322, 'it322', NULL, 0, 0, 0.00, '50.0000', '50.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '75.000', '5', '3975.000', '27', '-', ''),
(318, '323', 323, 'it323', NULL, 0, 0, 0.00, '13.2000', '13.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.200', '5', '1282.600', '7', '-', ''),
(319, '324', 324, 'it324', NULL, 0, 0, 0.00, '9.2000', '9.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '20.200', '5', '1070.600', '7', '-', ''),
(320, '325', 325, 'it325', NULL, 0, 0, 0.00, '36.5000', '36.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '54.500', '5', '2888.500', '14', '-', ''),
(321, '326', 326, 'it326', NULL, 0, 0, 0.00, '17.0000', '17.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '28.000', '5', '1484.000', '15', '-', ''),
(322, '327', 327, 'it327', NULL, 0, 0, 0.00, '64.5000', '64.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '75.500', '5', '4001.500', '7', '-', ''),
(323, '328', 328, 'it328', NULL, 0, 0, 0.00, '31.6000', '31.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '42.600', '5', '2257.800', '7', '-', ''),
(324, '329', 329, 'it329', NULL, 0, 0, 0.00, '20.5000', '20.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '31.500', '5', '1669.500', '7', '-', ''),
(325, '330', 330, 'it330', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '15', '-', ''),
(326, '331', 331, 'it331', NULL, 0, 0, 0.00, '13.8000', '13.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.800', '5', '1314.400', '13', '-', ''),
(327, '332', 332, 'it332', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.500', '5', '1245.500', '15', '-', ''),
(328, '333', 333, 'it333', NULL, 0, 0, 0.00, '16.2000', '16.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.200', '5', '1441.600', '7', '-', ''),
(329, '334', 334, 'it334', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.000', '5', '1325.000', '15', '-', ''),
(330, '335', 335, 'it335', NULL, 0, 0, 0.00, '285.7100', '285.7100', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '285.710', '6', '285.710', '8', '-', ''),
(331, '336', 336, 'it336', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '29.000', '5', '1537.000', '13', '-', ''),
(332, '337', 337, 'it337', NULL, 0, 0, 0.00, '118.0000', '118.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '129.000', '5', '6837.000', '7', '-', ''),
(333, '338', 338, 'it338', NULL, 0, 0, 0.00, '21.5000', '21.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '32.500', '5', '1722.500', '7', '-', ''),
(334, '339', 339, 'it339', NULL, 0, 0, 0.00, '4800.0000', '4800.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '5000.000', '12', '-', ''),
(335, '340', 340, 'it340', NULL, 0, 0, 0.00, '107.6900', '107.6900', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '5', '107.690', '8', '-', ''),
(336, '341', 341, 'it341', NULL, 0, 0, 0.00, '11.6000', '11.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.600', '5', '1197.800', '7', '-', ''),
(337, '342', 342, 'it342', NULL, 0, 0, 0.00, '74.8000', '74.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '85.800', '5', '4547.400', '7', '-', ''),
(338, '343', 343, 'it343', NULL, 0, 0, 0.00, '235.0000', '235.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '246.000', '5', '13038.000', '7', '-', ''),
(339, '344', 344, 'it344', NULL, 0, 0, 0.00, '61.0000', '61.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '91.000', '28', '-', ''),
(340, '345', 345, 'it345', NULL, 0, 0, 0.00, '19.0000', '19.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '30.000', '5', '1590.000', '7', '-', ''),
(341, '346', 346, 'it346', NULL, 0, 0, 0.00, '46.0000', '46.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '57.000', '5', '3021.000', '15', '-', ''),
(342, '347', 347, 'it347', NULL, 0, 0, 0.00, '105.2800', '105.2800', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '105.280', '8', '-', ''),
(343, '348', 348, 'it348', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '25.000', '5', '1325.000', '13', '-', ''),
(344, '349', 349, 'it349', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.500', '5', '1298.500', '13', '-', ''),
(345, '350', 350, 'it350', NULL, 0, 0, 0.00, '20.0000', '20.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '31.000', '5', '1643.000', '13', '-', ''),
(346, '351', 351, 'it351', NULL, 0, 0, 0.00, '15.5000', '15.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '26.500', '5', '1404.500', '7', '-', ''),
(347, '352', 352, 'it352', NULL, 0, 0, 0.00, '56.9500', '56.9500', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '81.950', '5', '4343.350', '11', '-', ''),
(348, '353', 353, 'it353', NULL, 0, 0, 0.00, '21.8700', '21.8700', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '32.870', '5', '1742.110', '7', '-', ''),
(349, '354', 354, 'it354', NULL, 0, 0, 0.00, '11.9000', '11.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.900', '5', '1213.700', '7', '-', ''),
(350, '355', 355, 'it355', NULL, 0, 0, 0.00, '10000.0000', '200.0000', '0.0000', NULL, NULL, 7, NULL, NULL, NULL, 1, '0', '225.000', '11', '13500.000', '25', '-', ''),
(351, '356', 356, 'it356', NULL, 0, 0, 0.00, '11.5000', '11.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.500', '5', '1192.500', '7', '-', ''),
(352, '357', 357, 'it357', NULL, 0, 0, 0.00, '33.2000', '33.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '44.200', '5', '2342.600', '7', '-', ''),
(353, '358', 358, 'it358', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '27.000', '5', '1431.000', '13', '-', ''),
(354, '359', 359, 'it359', NULL, 0, 0, 0.00, '10.0000', '10.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '21.000', '5', '1113.000', '7', '-', ''),
(355, '360', 360, 'it360', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '13', '-', ''),
(356, '361', 361, 'it361', NULL, 0, 0, 0.00, '4800.0000', '4800.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '8', '5000.000', '12', '-', ''),
(357, '362', 362, 'it362', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '39.000', '5', '2067.000', '31', '-', ''),
(358, '363', 363, 'it363', NULL, 0, 0, 0.00, '107.6900', '107.6900', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '107.690', '8', '-', ''),
(359, '364', 364, 'it364', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '60.000', '5', '3180.000', '31', '-', ''),
(360, '365', 365, 'it365', NULL, 0, 0, 0.00, '1010.2400', '1010.2400', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '1010.240', '8', '-', ''),
(361, '366', 366, 'it366', NULL, 0, 0, 0.00, '25.0000', '25.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '50.000', '5', '2650.000', '31', '-', ''),
(362, '367', 367, 'it367', NULL, 0, 0, 0.00, '225.0000', '225.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '250.000', '5', '11925.000', '31', '-', ''),
(363, '368', 368, 'it368', NULL, 0, 0, 0.00, '30.0000', '30.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '55.000', '5', '2915.000', '31', '-', ''),
(364, '369', 369, 'it369', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '60.000', '5', '3180.000', '31', '-', ''),
(365, '370', 370, 'it370', NULL, 0, 0, 0.00, '85.0000', '85.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '110.000', '5', '5830.000', '31', '-', ''),
(366, '371', 371, 'it371', NULL, 0, 0, 0.00, '27.0000', '27.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '52.000', '5', '2756.000', '31', '-', ''),
(367, '372', 372, 'it372', NULL, 0, 0, 0.00, '5.0000', '5.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '30.000', '5', '1590.000', '31', '-', ''),
(368, '373', 373, 'it373', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '41.000', '5', '2173.000', '31', '-', ''),
(369, '374', 374, 'it374', NULL, 0, 0, 0.00, '33.0000', '33.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '58.000', '5', '3074.000', '31', '-', ''),
(370, '375', 375, 'it375', NULL, 0, 0, 0.00, '90.0000', '90.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '115.000', '5', '6095.000', '31', '-', ''),
(371, '376', 376, 'it376', NULL, 0, 0, 0.00, '20.0000', '20.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '45.000', '5', '2385.000', '31', '-', ''),
(372, '377', 377, 'it377', NULL, 0, 0, 0.00, '95.0000', '95.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '120.000', '5', '6360.000', '31', '-', ''),
(373, '378', 378, 'it378', NULL, 0, 0, 0.00, '70.0000', '70.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '95.000', '5', '5035.000', '31', '-', ''),
(374, '379', 379, 'it379', NULL, 0, 0, 0.00, '6.0000', '6.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '31.000', '5', '1643.000', '31', '-', ''),
(375, '380', 380, 'it380', NULL, 0, 0, 0.00, '115.0000', '115.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '140.000', '5', '7420.000', '31', '-', ''),
(376, '381', 381, 'it381', NULL, 0, 0, 0.00, '85.0000', '85.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '110.000', '5', '5830.000', '31', '-', ''),
(377, '382', 382, 'it382', NULL, 0, 0, 0.00, '30.0000', '30.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '55.000', '5', '2915.000', '31', '-', ''),
(378, '383', 383, 'it383', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '41.000', '5', '2173.000', '31', '-', ''),
(379, '384', 384, 'it384', NULL, 0, 0, 0.00, '95.0000', '95.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '120.000', '5', '6360.000', '31', '-', ''),
(380, '385', 385, 'it385', NULL, 0, 0, 0.00, '30.0000', '30.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '55.000', '5', '2915.000', '31', '-', ''),
(381, '386', 386, 'it386', NULL, 0, 0, 0.00, '22.0000', '22.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '47.000', '5', '2491.000', '31', '-', ''),
(382, '387', 387, 'it387', NULL, 0, 0, 0.00, '85.0000', '85.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '110.000', '5', '5830.000', '31', '-', ''),
(383, '388', 388, 'it388', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '60.000', '5', '3180.000', '31', '-', ''),
(384, '389', 389, 'it389', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '41.000', '5', '2173.000', '31', '-', ''),
(385, '390', 390, 'it390', NULL, 0, 0, 0.00, '30.0000', '30.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '55.000', '5', '2915.000', '31', '-', ''),
(386, '391', 391, 'it391', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '60.000', '5', '3180.000', '31', '-', ''),
(387, '392', 392, 'it392', NULL, 0, 0, 0.00, '5.0000', '5.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '30.000', '5', '1590.000', '31', '-', ''),
(388, '393', 393, 'it393', NULL, 0, 0, 0.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '40.000', '5', '2120.000', '31', '-', ''),
(389, '394', 394, 'it394', NULL, 0, 0, 0.00, '40.0000', '40.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '65.000', '5', '3445.000', '31', '-', ''),
(390, '395', 395, 'it395', NULL, 0, 0, 0.00, '40.0000', '40.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '65.000', '5', '3445.000', '31', '-', ''),
(391, '396', 396, 'it396', NULL, 0, 0, 0.00, '175.0000', '175.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '200.000', '5', '10600.000', '31', '-', ''),
(392, '397', 397, 'it397', NULL, 0, 0, 0.00, '25.0000', '25.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '50.000', '5', '2650.000', '31', '-', ''),
(393, '398', 398, 'it398', NULL, 0, 0, 0.00, '70.0000', '70.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '95.000', '5', '5035.000', '31', '-', ''),
(394, '399', 399, 'it399', NULL, 0, 0, 0.00, '40.0000', '40.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '65.000', '5', '3445.000', '31', '-', ''),
(395, '400', 400, 'it400', NULL, 0, 0, 0.00, '75.0000', '75.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '100.000', '5', '5300.000', '31', '-', ''),
(396, '401', 401, 'it401', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '39.000', '5', '2067.000', '31', '-', ''),
(397, '402', 402, 'it402', NULL, 0, 0, 0.00, '255.0000', '255.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '280.000', '5', '14840.000', '31', '-', ''),
(398, '403', 403, 'it403', NULL, 0, 0, 0.00, '45.0000', '45.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '70.000', '5', '3710.000', '31', '-', ''),
(399, '404', 404, 'it404', NULL, 0, 0, 0.00, '255.0000', '255.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '280.000', '5', '14840.000', '31', '-', ''),
(400, '405', 405, 'it405', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '60.000', '5', '3180.000', '31', '-', ''),
(401, '406', 406, 'it406', NULL, 0, 0, 0.00, '650.0000', '650.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '675.000', '5', '35775.000', '31', '-', ''),
(402, '407', 407, 'it407', NULL, 0, 0, 0.00, '45.0000', '45.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '70.000', '5', '3710.000', '31', '-', ''),
(403, '408', 408, 'it408', NULL, 0, 0, 0.00, '95.0000', '95.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '120.000', '5', '6360.000', '31', '-', ''),
(404, '409', 409, 'it409', NULL, 0, 0, 0.00, '45.0000', '45.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '70.000', '5', '3710.000', '31', '-', ''),
(405, '410', 410, 'it410', NULL, 0, 0, 0.00, '30.0000', '30.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '55.000', '5', '2915.000', '31', '-', ''),
(406, '411', 411, 'it411', NULL, 0, 0, 0.00, '50.4000', '50.4000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '100.400', '40', '-', ''),
(407, '412', 412, 'it412', NULL, 0, 0, 0.00, '20.0000', '20.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '23.000', '49', '-', ''),
(408, '413', 413, 'it413', NULL, 0, 0, 0.00, '35000.0000', '35.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '45.000', '40', '-', ''),
(409, '414', 414, 'it414', NULL, 0, 0, 0.00, '16500.0000', '165.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '180.000', '40', '-', ''),
(410, '415', 415, 'it415', NULL, 0, 0, 0.00, '90.0000', '90.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '5', '120.000', '40', '-', ''),
(411, '416', 416, 'it416', NULL, 0, 0, 0.00, '10000.0000', '200.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '240.000', '40', '-', ''),
(412, '417', 417, 'it417', NULL, 0, 0, 0.00, '32.0000', '32.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '40.000', '49', '-', ''),
(413, '418', 418, 'it418', NULL, 0, 0, 0.00, '44265.0000', '44265.0000', '0.0000', NULL, NULL, 19, NULL, NULL, NULL, 1, '0', '0.000', '6', '48000.000', '41', '-', ''),
(414, '419', 419, 'it419', NULL, 0, 0, 0.00, '36000.0000', '36000.0000', '0.0000', NULL, NULL, 17, NULL, NULL, NULL, 1, '0', '0.000', '6', '42000.000', '45', '-', ''),
(415, '420', 420, 'it420', NULL, 0, 0, 0.00, '18500.0000', '18500.0000', '0.0000', NULL, NULL, 17, NULL, NULL, NULL, 1, '0', '0.000', '6', '24000.000', '45', '-', ''),
(416, '421', 421, 'it421', NULL, 0, 0, 0.00, '550.0000', '550.0000', '0.0000', NULL, NULL, 20, NULL, NULL, NULL, 1, '0', '0.000', '6', '570.000', '50', '-', ''),
(417, '422', 422, 'it422', NULL, 0, 0, 0.00, '1181.6000', '1181.6000', '0.0000', NULL, NULL, 26, NULL, NULL, NULL, 1, '0', '0.000', '6', '1350.000', '51', '-', ''),
(418, '423', 423, 'it423', NULL, 0, 0, 0.00, '336.0000', '336.0000', '0.0000', NULL, NULL, 25, NULL, NULL, NULL, 1, '0', '0.000', '6', '450.000', '51', '-', ''),
(419, '424', 424, 'it424', NULL, 0, 0, 0.00, '336.0000', '336.0000', '0.0000', NULL, NULL, 25, NULL, NULL, NULL, 1, '0', '0.000', '6', '450.000', '51', '-', ''),
(420, '425', 425, 'it425', NULL, 0, 0, 0.00, '8592.0000', '8592.0000', '0.0000', NULL, NULL, 25, NULL, NULL, NULL, 1, '0', '0.000', '6', '9500.000', '52', '-', ''),
(421, '426', 426, 'it426', NULL, 0, 0, 0.00, '30.0000', '30.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '40.000', '52', '-', ''),
(422, '427', 427, 'it427', NULL, 0, 0, 0.00, '1288.0000', '1288.0000', '0.0000', NULL, NULL, 26, NULL, NULL, NULL, 1, '0', '0.000', '6', '1500.000', '52', '-', ''),
(423, '428', 428, 'it428', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '19.000', '53', '2000', ''),
(424, '429', 429, 'it429', NULL, 0, 0, 0.00, '11655.0000', '11655.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '12000.000', '47', '-', ''),
(425, '430', 430, 'it430', NULL, 0, 0, 0.00, '19488.0000', '19488.0000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 1, '0', '0.000', '6', '21000.000', '47', '-', ''),
(426, '431', 431, 'it431', NULL, 0, 0, 0.00, '1050.0000', '1.9000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '2.900', '42', '10000', ''),
(427, '432', 432, 'it432', NULL, 0, 0, 0.00, '1500.0000', '3.8000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '4.300', '42', '20000', ''),
(428, '433', 433, 'it433', NULL, 0, 0, 0.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 21, NULL, NULL, NULL, 1, '0', '40.000', '5', '2120.000', '48', '-', ''),
(429, '434', 434, 'it434', NULL, 0, 0, 0.00, '5000.0000', '1.3000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '1.500', '42', '30,000', ''),
(430, '435', 435, 'it435', NULL, 0, 0, 0.00, '3600.0000', '1.2000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '1.400', '42', '50000', ''),
(431, '436', 436, 'it436', NULL, 0, 0, 0.00, '17500.0000', '7.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '8.000', '42', '5000', ''),
(432, '437', 437, 'it437', NULL, 0, 0, 0.00, '21000.0000', '4.2000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '4.500', '42', '10000', ''),
(433, '438', 438, 'it438', NULL, 0, 0, 0.00, '5.2000', '5.2000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '5.500', '42', '5000', ''),
(434, '439', 439, 'it439', NULL, 0, 0, 0.00, '5.2000', '5.2000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '5.500', '42', '5000', ''),
(435, '440', 440, 'it440', NULL, 0, 0, 0.00, '5.2000', '5.2000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '5.500', '42', '5000', ''),
(436, '441', 441, 'it441', NULL, 0, 0, 0.00, '4.7500', '4.7500', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '5.000', '42', '5000', ''),
(437, '442', 442, 'it442', NULL, 0, 0, 0.00, '5.8000', '5.8000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '6.000', '42', '5000', ''),
(438, '443', 443, 'it443', NULL, 0, 0, 0.00, '12.2000', '12.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.200', '5', '1229.600', '7', '-', ''),
(439, '444', 444, 'it444', NULL, 0, 0, 0.00, '0.3480', '0.3480', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.768', '4', '40.704', '? number:0 ?', '10000', ''),
(440, '445', 445, 'it445', NULL, 0, 0, 0.00, '120.0000', '120.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '0.000', '0', '0.000', '? number:0 ?', '0', ''),
(441, '446', 446, 'it446', NULL, 0, 0, 0.00, '0.0050', '0.0050', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '23.000', '4', '23232.000', '0', '232', ''),
(442, '447', 447, 'it447', NULL, 0, 0, 0.00, '9600.0000', '0.3840', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.768', '4', '40.700', '34', '10000', ''),
(443, '448', 448, 'it448', NULL, 0, 0, 0.00, '376.0000', '0.3760', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.752', '4', '39.860', '34', '20000', ''),
(444, '449', 449, 'it449', NULL, 0, 0, 0.00, '0.3660', '0.3660', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.732', '4', '38.800', '34', '30000', ''),
(445, '450', 450, 'it450', NULL, 0, 0, 0.00, '1775.0000', '0.3550', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.710', '4', '37.630', '34', '50000', ''),
(446, '451', 451, 'it451', NULL, 0, 0, 0.00, '0.0280', '0.0280', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.034', '4', '1.780', '34', '5000', ''),
(447, '452', 452, 'it452', NULL, 0, 0, 0.00, '0.2700', '0.2700', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.540', '4', '28.620', '34', '10000', ''),
(448, '453', 453, 'it453', NULL, 0, 0, 0.00, '0.0280', '0.0280', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.034', '4', '1.780', '34', '5000', ''),
(449, '454', 454, 'it454', NULL, 0, 0, 0.00, '0.2660', '0.2660', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.532', '4', '28.200', '34', '20000', ''),
(450, '455', 455, 'it455', NULL, 0, 0, 0.00, '0.2570', '0.2570', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.514', '4', '27.240', '34', '30000', ''),
(451, '456', 456, 'it456', NULL, 0, 0, 0.00, '0.2500', '0.2500', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.500', '4', '26.500', '34', '50000', ''),
(452, '457', 457, 'it457', NULL, 0, 0, 0.00, '0.0280', '0.0280', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.034', '4', '1.780', '34', '5000', ''),
(453, '458', 458, 'it458', NULL, 0, 0, 0.00, '0.2520', '0.2520', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.504', '4', '26.710', '34', '10000', ''),
(454, '459', 459, 'it459', NULL, 0, 0, 0.00, '0.0220', '0.0220', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.026', '4', '1.400', '34', '5000', ''),
(455, '460', 460, 'it460', NULL, 0, 0, 0.00, '0.2470', '0.2470', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.494', '4', '26.180', '34', '20000', ''),
(456, '461', 461, 'it461', NULL, 0, 0, 0.00, '0.0220', '0.0220', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.026', '4', '1.400', '34', '5000', ''),
(457, '462', 462, 'it462', NULL, 0, 0, 0.00, '0.0280', '0.0280', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.034', '4', '1.780', '34', '5000', ''),
(458, '463', 463, 'it463', NULL, 0, 0, 0.00, '0.2400', '0.2400', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.480', '4', '25.440', '34', '30000', ''),
(459, '464', 464, 'it464', NULL, 0, 0, 0.00, '0.2320', '0.2320', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.464', '4', '24.590', '34', '50000', ''),
(460, '465', 465, 'it465', NULL, 0, 0, 0.00, '0.0220', '0.0220', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.026', '4', '1.400', '34', '5000', ''),
(461, '466', 466, 'it466', NULL, 0, 0, 0.00, '0.0220', '0.0220', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.026', '4', '1.400', '34', '5000', ''),
(462, '467', 467, 'it467', NULL, 0, 0, 0.00, '10.2567', '10.2567', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '4', '0.000', '11', '1', ''),
(463, '468', 468, 'it468', NULL, 0, 0, 0.00, '0.1750', '0.1750', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.350', '4', '18.550', '34', '10000', ''),
(464, '469', 469, 'it469', NULL, 0, 0, 0.00, '0.0220', '0.0220', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.026', '4', '1.400', '34', '5000', ''),
(465, '470', 470, 'it470', NULL, 0, 0, 0.00, '0.1720', '0.1720', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.344', '4', '18.230', '34', '20000', ''),
(466, '471', 471, 'it471', NULL, 0, 0, 0.00, '0.1660', '0.1660', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.332', '4', '17.600', '34', '30000', ''),
(467, '472', 472, 'it472', NULL, 0, 0, 0.00, '0.1600', '0.1600', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.320', '4', '16.960', '34', '50000', ''),
(468, '473', 473, 'it473', NULL, 0, 0, 0.00, '0.1320', '0.1320', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.264', '4', '13.990', '34', '10000', ''),
(469, '474', 474, 'it474', NULL, 0, 0, 0.00, '0.1290', '0.1290', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.258', '4', '13.670', '34', '20000', ''),
(470, '475', 475, 'it475', NULL, 0, 0, 0.00, '0.1250', '0.1250', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.250', '4', '13.250', '34', '30000', ''),
(471, '476', 476, 'it476', NULL, 0, 0, 0.00, '0.1210', '0.1210', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.242', '4', '12.830', '34', '50000', ''),
(472, '477', 477, 'it477', NULL, 0, 0, 0.00, '0.2100', '0.2100', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.420', '4', '22.260', '34', '10000', ''),
(473, '478', 478, 'it478', NULL, 0, 0, 0.00, '0.2050', '0.2050', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.410', '4', '21.730', '34', '20000', ''),
(474, '479', 479, 'it479', NULL, 0, 0, 0.00, '0.1990', '0.1990', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.398', '4', '21.090', '34', '30000', ''),
(475, '480', 480, 'it480', NULL, 0, 0, 0.00, '0.1930', '0.1930', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.386', '4', '20.460', '34', '50000', ''),
(476, '481', 481, 'it481', NULL, 0, 0, 0.00, '0.1350', '0.1350', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.270', '4', '14.310', '34', '10000', ''),
(477, '482', 482, 'it482', NULL, 0, 0, 0.00, '1.0000', '1.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '1.000', '5', '34.000', '7', '3434.50', ''),
(478, '483', 483, 'it483', NULL, 0, 0, 0.00, '0.1320', '0.1320', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.264', '4', '13.990', '34', '20000', ''),
(479, '484', 484, 'it484', NULL, 0, 0, 0.00, '0.1280', '0.1280', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.256', '4', '13.570', '34', '30000', ''),
(480, '485', 485, 'it485', NULL, 0, 0, 0.00, '0.1240', '0.1240', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.248', '4', '13.140', '34', '50000', ''),
(481, '486', 486, 'it486', NULL, 0, 0, 0.00, '0.1680', '0.1680', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.336', '4', '17.810', '34', '10000', ''),
(482, '487', 487, 'it487', NULL, 0, 0, 0.00, '0.1650', '0.1650', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.330', '4', '17.490', '34', '20000', ''),
(483, '488', 488, 'it488', NULL, 0, 0, 0.00, '0.1600', '0.1600', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.320', '4', '16.960', '34', '30000', ''),
(484, '489', 489, 'it489', NULL, 0, 0, 0.00, '0.1540', '0.1540', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.308', '4', '16.320', '34', '50000', ''),
(485, '490', 490, 'it490', NULL, 0, 0, 0.00, '0.2020', '0.2020', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.404', '4', '21.410', '34', '10000', ''),
(486, '491', 491, 'it491', NULL, 0, 0, 0.00, '0.1980', '0.1980', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.396', '4', '20.990', '34', '20000', ''),
(487, '492', 492, 'it492', NULL, 0, 0, 0.00, '0.1920', '0.1920', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.384', '4', '20.350', '34', '30000', ''),
(488, '493', 493, 'it493', NULL, 0, 0, 0.00, '0.1850', '0.1850', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.370', '4', '19.610', '34', '50000', ''),
(489, '494', 494, 'it494', NULL, 0, 0, 0.00, '0.1530', '0.1530', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.306', '4', '16.220', '36', '10000', ''),
(490, '495', 495, 'it495', NULL, 0, 0, 0.00, '0.1520', '0.1520', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.304', '4', '16.110', '36', '20000', ''),
(491, '496', 496, 'it496', NULL, 0, 0, 0.00, '0.1480', '0.1480', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.296', '4', '15.690', '36', '30000', ''),
(492, '497', 497, 'it497', NULL, 0, 0, 0.00, '0.1450', '0.1450', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.290', '4', '15.370', '36', '50000', ''),
(493, '498', 498, 'it498', NULL, 0, 0, 0.00, '0.1650', '0.1650', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.330', '4', '17.490', '36', '10000', ''),
(494, '499', 499, 'it499', NULL, 0, 0, 0.00, '0.1640', '0.1640', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.328', '4', '17.380', '36', '20000', ''),
(495, '500', 500, 'it500', NULL, 0, 0, 0.00, '0.1600', '0.1600', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.320', '4', '16.960', '36', '30000', ''),
(496, '501', 501, 'it501', NULL, 0, 0, 0.00, '0.1580', '0.1580', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.316', '4', '16.760', '36', '50000', ''),
(497, '502', 502, 'it502', NULL, 0, 0, 0.00, '0.3700', '0.3700', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.430', '37', '10000', ''),
(498, '503', 503, 'it503', NULL, 0, 0, 0.00, '0.2900', '0.2900', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.340', '37', '10000', ''),
(499, '504', 504, 'it504', NULL, 0, 0, 0.00, '0.2100', '0.2100', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.250', '37', '10000', ''),
(500, '505', 505, 'it505', NULL, 0, 0, 0.00, '0.3100', '0.3100', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.360', '37', '10000', ''),
(501, '506', 506, 'it506', NULL, 0, 0, 0.00, '0.2000', '0.2000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.250', '37', '10000', ''),
(502, '507', 507, 'it507', NULL, 0, 0, 0.00, '0.1900', '0.1900', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.240', '37', '10000', ''),
(503, '508', 508, 'it508', NULL, 0, 0, 0.00, '1.8000', '1.8000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '2.100', '37', '10000', ''),
(504, '509', 509, 'it509', NULL, 0, 0, 0.00, '0.3100', '0.3100', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.360', '37', '10000', ''),
(505, '510', 510, 'it510', NULL, 0, 0, 0.00, '0.3100', '0.3100', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.360', '37', '10000', ''),
(506, '511', 511, 'it511', NULL, 0, 0, 0.00, '0.3100', '0.3100', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.360', '37', '10000', ''),
(507, '512', 512, 'it512', NULL, 0, 0, 0.00, '1976.8000', '1976.8000', '0.0000', NULL, NULL, 17, NULL, NULL, NULL, 1, '0', '0.000', '6', '2372.160', '37', '-', ''),
(508, '513', 513, 'it513', NULL, 0, 0, 0.00, '0.0080', '0.0080', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.900', '38', '50000', ''),
(509, '514', 514, 'it514', NULL, 0, 0, 0.00, '0.0052', '0.0052', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.800', '38', '100000', ''),
(510, '515', 515, 'it515', NULL, 0, 0, 0.00, '0.0040', '0.0040', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.000', '5', '0.700', '38', '200000', ''),
(511, '516', 516, 'it516', NULL, 0, 0, 0.00, '0.5500', '0.5500', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '1.000', '39', '54000', ''),
(512, '517', 517, 'it517', NULL, 0, 0, 0.00, '0.5300', '0.5300', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.900', '39', '102000', ''),
(513, '518', 518, 'it518', NULL, 0, 0, 0.00, '0.5100', '0.5100', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '0.000', '6', '0.800', '39', '204000', ''),
(514, '519', 519, 'it519', NULL, 0, 0, 0.00, '125.0000', '125.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '0.000', '6', '190.000', '17', '100', ''),
(515, '520', 520, 'it520', NULL, 0, 0, 0.00, '2.0000', '2.0000', '0.0000', NULL, NULL, 7, NULL, NULL, NULL, 1, '0', '2.000', '5', '1.000', '8', '2', ''),
(516, '521', 521, 'it521', NULL, 0, 0, 0.00, '100.0000', '100.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '200.000', '0', '0.000', '54', '10', ''),
(517, '522', 522, 'it522', NULL, 0, 0, 0.00, '200.0000', '200.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '220.000', '0', '0.000', '54', '10', ''),
(518, '523', 523, 'it523', NULL, 0, 0, 0.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 7, NULL, NULL, NULL, 1, '0', '25.000', '6', '0.000', '55', '-', ''),
(519, '524', 524, 'it524', NULL, 0, 0, 0.00, '5.0000', '5.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '15.000', '5', '30.000', '56', '0', ''),
(520, '525', 525, 'it525', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '24.000', '5', '1272.000', '7', '0', ''),
(521, '', 526, 'it526', NULL, 0, 0, 88.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.000', '5', '1272.000', '7', '0', '1302199099'),
(522, '', 527, 'it527', NULL, 0, 0, 6.00, '4030.0000', '4030.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '4530.000', '6', '4530.000', '12', '0', ''),
(523, '528', 528, 'it528', NULL, 0, 0, 1.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '38.500', '5', '2040.500', '9', '0', ''),
(524, '', 529, 'it529', NULL, 0, 0, 0.00, '31.0500', '31.0500', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '56.050', '5', '2970.650', '11', '0', ''),
(525, '', 530, 'it530', NULL, 0, 0, 0.00, '17.0000', '17.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '28.000', '5', '1484.000', '13', '0', '1302199099'),
(526, '', 531, 'it531', NULL, 0, 0, 0.00, '610.0000', '30.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '41.500', '5', '2199.500', '7', '0', '1302199099'),
(527, '532', 532, 'it532', NULL, 0, 0, 0.00, '350.0000', '350.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '350.000', '6', '350.000', '8', '0', ''),
(528, '533', 533, 'it533', NULL, 0, 0, 0.00, '70.0000', '70.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '81.000', '5', '4293.000', '7', '0', ''),
(529, '534', 534, 'it534', NULL, 0, 0, 0.00, '120.0000', '120.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '131.000', '5', '6943.000', '7', '0', ''),
(530, '', 535, 'it535', NULL, 0, 0, 0.00, '72.2000', '72.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '83.700', '5', '4436.100', '7', '0', ''),
(531, '536', 536, 'it536', NULL, 0, 0, 0.00, '53.7600', '53.7600', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '53.760', '6', '53.760', '8', '0', ''),
(532, '537', 537, 'it537', NULL, 0, 0, 0.00, '48.4000', '48.4000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '73.400', '5', '3890.200', '14', '0', ''),
(533, '538', 538, 'it538', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.000', '5', '1431.000', '13', '0', ''),
(534, '539', 539, 'it539', NULL, 0, 0, 0.00, '38.0000', '38.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '49.000', '5', '2597.000', '13', '0', ''),
(535, '', 540, 'it540', NULL, 0, 0, 100.00, '20.5000', '20.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '31.500', '5', '1669.500', '7', '0', '2932.99'),
(536, '', 541, 'it541', NULL, 0, 0, 160.00, '50.0000', '50.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '61.000', '5', '3233.000', '7', '0', '2932.99'),
(537, '', 542, 'it542', NULL, 0, 0, 280.00, '14.5000', '14.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '25.500', '5', '1351.500', '7', '0', '1302199099'),
(538, '543', 543, 'it543', NULL, 0, 0, 0.00, '6.8000', '6.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '31.800', '5', '1685.400', '9', '0', ''),
(539, '544', 544, 'it544', NULL, 0, 0, 0.00, '6.5000', '6.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '31.500', '5', '1669.500', '9', '0', ''),
(540, '545', 545, 'it545', NULL, 0, 0, 0.00, '230.0000', '230.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '241.000', '5', '12773.000', '15', '0', ''),
(541, '', 546, 'it546', NULL, 0, 0, 0.00, '576.2400', '576.2400', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '576.240', '6', '576.240', '8', '0', ''),
(542, '', 547, 'it547', NULL, 0, 0, 0.00, '14.3000', '14.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '25.300', '5', '1340.900', '7', '0', '1302199099'),
(543, '548', 548, 'it548', NULL, 0, 0, 35.00, '139.0000', '112.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '123.000', '5', '6519.000', '7', '0', ''),
(544, '549', 549, 'it549', NULL, 0, 0, 25.00, '15.5000', '15.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.500', '5', '1404.500', '7', '0', ''),
(545, '550', 550, 'it550', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '29.000', '5', '1537.000', '7', '0', ''),
(546, '551', 551, 'it551', NULL, 0, 0, 0.00, '11.6000', '11.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '22.600', '5', '1197.800', '7', '0', ''),
(547, '552', 552, 'it552', NULL, 0, 0, 0.00, '12.0000', '12.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.000', '5', '1219.000', '7', '0', ''),
(548, '553', 553, 'it553', NULL, 0, 0, 0.00, '16.5000', '16.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.500', '5', '1457.500', '7', '0', ''),
(549, '554', 554, 'it554', NULL, 0, 0, 0.00, '374.9900', '374.9900', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '374.990', '6', '374.990', '8', '0', ''),
(550, '555', 555, 'it555', NULL, 0, 0, 15.00, '24.2000', '24.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '35.200', '5', '1865.600', '7', '0', ''),
(551, '556', 556, 'it556', NULL, 0, 0, 0.00, '11.0000', '11.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.000', '5', '1166.000', '15', '0', ''),
(552, '557', 557, 'it557', NULL, 0, 0, 5.00, '8.6000', '8.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '19.600', '5', '1038.800', '7', '0', ''),
(553, '558', 558, 'it558', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.000', '5', '1431.000', '15', '0', ''),
(554, '559', 559, 'it559', NULL, 0, 0, 0.00, '13.2000', '13.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.200', '5', '1282.600', '7', '0', ''),
(555, '', 560, 'it560', NULL, 0, 0, 10.00, '12.3000', '12.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.300', '5', '1234.900', '7', '0', ''),
(556, '561', 561, 'it561', NULL, 0, 0, 0.00, '135.5200', '135.5200', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '135.520', '6', '135.520', '8', '0', ''),
(557, '', 562, 'it562', NULL, 0, 0, 0.00, '26.5000', '26.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '37.500', '5', '1987.500', '7', '0', '1302.19'),
(558, '563', 563, 'it563', NULL, 0, 0, 0.00, '17.5000', '17.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '28.500', '5', '1510.500', '15', '0', ''),
(559, '564', 564, 'it564', NULL, 0, 0, 10.00, '22.5000', '22.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '33.500', '5', '1775.500', '7', '0', ''),
(560, '565', 565, 'it565', NULL, 0, 0, 0.00, '28.0000', '28.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '39.000', '5', '2067.000', '16', '0', ''),
(561, '566', 566, 'it566', NULL, 0, 0, 0.00, '15.5000', '15.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.500', '5', '1404.500', '7', '0', ''),
(562, '', 567, 'it567', NULL, 0, 0, 0.00, '16.4000', '16.4000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.400', '5', '1452.200', '7', '0', ''),
(563, '568', 568, 'it568', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '25.000', '5', '1325.000', '13', '0', ''),
(564, '', 569, 'it569', NULL, 0, 0, 0.00, '15.5000', '15.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.500', '5', '1404.500', '15', '0', ''),
(565, '570', 570, 'it570', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '46.000', '5', '2438.000', '16', '0', ''),
(566, '571', 571, 'it571', NULL, 0, 0, 0.00, '42.0000', '42.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '53.000', '5', '2809.000', '13', '0', ''),
(567, '', 572, 'it572', NULL, 0, 0, 5.00, '1380.6800', '1380.6800', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '1380.680', '6', '1380.680', '8', '0', ''),
(568, '573', 573, 'it573', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.000', '5', '1272.000', '7', '0', ''),
(569, '574', 574, 'it574', NULL, 0, 0, 0.00, '1291.3600', '1291.3600', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '1291.360', '6', '1291.360', '8', '0', ''),
(570, '575', 575, 'it575', NULL, 0, 0, 0.00, '51.2000', '51.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '62.200', '5', '3296.600', '7', '0', ''),
(571, '', 576, 'it576', NULL, 0, 0, 1.00, '208.4000', '208.4000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '208.400', '6', '208.400', '8', '0', ''),
(572, '577', 577, 'it577', NULL, 0, 0, 5.00, '13.3000', '13.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.300', '5', '1287.900', '7', '0', ''),
(573, '', 578, 'it578', NULL, 0, 0, 25.00, '15.5000', '15.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.500', '5', '1404.500', '7', '0', ''),
(574, '579', 579, 'it579', NULL, 0, 0, 0.00, '57.3000', '57.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '68.300', '5', '3619.900', '7', '0', ''),
(575, '', 580, 'it580', NULL, 0, 0, 600.00, '233.5200', '233.5200', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '233.520', '6', '233.520', '8', '0', ''),
(576, '581', 581, 'it581', NULL, 0, 0, 0.00, '3.9800', '3.9800', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '28.980', '5', '1535.940', '20', '0', ''),
(577, '582', 582, 'it582', NULL, 0, 0, 0.00, '18.4000', '18.4000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '29.400', '5', '1558.200', '7', '0', ''),
(578, '583', 583, 'it583', NULL, 0, 0, 0.00, '3.7800', '3.7800', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '28.780', '5', '1525.340', '20', '0', ''),
(579, '584', 584, 'it584', NULL, 0, 0, 0.00, '18.4000', '18.4000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '29.400', '5', '1558.200', '7', '0', ''),
(580, '585', 585, 'it585', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.500', '5', '1298.500', '15', '0', ''),
(581, '586', 586, 'it586', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.500', '5', '1298.500', '7', '0', ''),
(582, '587', 587, 'it587', NULL, 0, 0, 0.00, '44.7000', '44.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '69.700', '5', '3694.100', '11', '0', ''),
(583, '', 588, 'it588', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '39.000', '5', '2067.000', '31', '0', '3301.2990'),
(584, '589', 589, 'it589', NULL, 0, 0, 0.00, '22.0000', '22.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '33.000', '5', '1749.000', '15', '0', ''),
(585, '', 590, 'it590', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '60.000', '5', '3180.000', '31', '0', '3301.2990'),
(586, '591', 591, 'it591', NULL, 0, 0, 0.00, '25.0000', '25.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '50.000', '5', '2650.000', '31', '0', ''),
(587, '592', 592, 'it592', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '29.000', '5', '1537.000', '13', '0', ''),
(588, '593', 593, 'it593', NULL, 0, 0, 0.00, '225.0000', '225.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '250.000', '5', '13250.000', '31', '0', ''),
(589, '594', 594, 'it594', NULL, 0, 0, 0.00, '550.0000', '550.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '550.000', '6', '0.000', '21', '0', ''),
(590, '595', 595, 'it595', NULL, 0, 0, 0.00, '30.0000', '30.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '55.000', '5', '2915.000', '31', '0', ''),
(591, '596', 596, 'it596', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '46.000', '5', '2438.000', '13', '0', ''),
(592, '597', 597, 'it597', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '60.000', '5', '3180.000', '31', '0', ''),
(593, '598', 598, 'it598', NULL, 0, 0, 0.00, '22.5000', '22.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '33.500', '5', '1775.500', '13', '0', ''),
(594, '599', 599, 'it599', NULL, 0, 0, 0.00, '85.0000', '85.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '110.000', '5', '5830.000', '31', '0', ''),
(595, '', 600, 'it600', NULL, 0, 0, 50.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.000', '5', '1272.000', '7', '0', '1302.19'),
(596, '601', 601, 'it601', NULL, 0, 0, 0.00, '25.0000', '25.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '36.000', '5', '1908.000', '15', '0', ''),
(597, '602', 602, 'it602', NULL, 0, 0, 3.00, '27.0000', '27.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '52.000', '5', '2756.000', '31', '0', ''),
(598, '603', 603, 'it603', NULL, 0, 0, 0.00, '5.0000', '5.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '30.000', '5', '1590.000', '31', '0', ''),
(599, '604', 604, 'it604', NULL, 0, 0, 0.00, '27.0000', '27.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '38.000', '5', '2014.000', '16', '0', ''),
(600, '605', 605, 'it605', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '41.000', '5', '2173.000', '31', '0', ''),
(601, '606', 606, 'it606', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.500', '5', '1245.500', '7', '0', ''),
(602, '607', 607, 'it607', NULL, 0, 0, 0.00, '33.0000', '33.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '58.000', '5', '3074.000', '31', '0', ''),
(603, '608', 608, 'it608', NULL, 0, 0, 0.00, '90.0000', '90.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '115.000', '5', '6095.000', '31', '0', ''),
(604, '609', 609, 'it609', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.000', '5', '1272.000', '7', '0', ''),
(605, '610', 610, 'it610', NULL, 0, 0, 0.00, '550.0000', '550.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '580.000', '6', '580.000', '21', '0', ''),
(606, '611', 611, 'it611', NULL, 0, 0, 0.00, '33.0000', '33.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '44.000', '5', '2332.000', '7', '0', ''),
(607, '612', 612, 'it612', NULL, 0, 0, 0.00, '40.9000', '40.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '65.900', '5', '3492.700', '11', '0', ''),
(608, '613', 613, 'it613', NULL, 0, 0, 0.00, '12.3000', '12.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '37.300', '5', '1976.900', '11', '0', ''),
(609, '614', 614, 'it614', NULL, 0, 0, 0.00, '15.8000', '15.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.800', '5', '1420.400', '7', '0', ''),
(610, '615', 615, 'it615', NULL, 0, 0, 7.00, '18.4143', '20.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '45.000', '5', '2385.000', '31', '0', ''),
(611, '616', 616, 'it616', NULL, 0, 0, 0.00, '13.6000', '13.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.600', '5', '1303.800', '7', '0', ''),
(612, '617', 617, 'it617', NULL, 0, 0, 0.00, '95.0000', '95.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '120.000', '5', '6360.000', '31', '0', ''),
(613, '618', 618, 'it618', NULL, 0, 0, 0.00, '41.0000', '41.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '52.000', '5', '2756.000', '7', '0', ''),
(614, '619', 619, 'it619', NULL, 0, 0, 0.00, '70.0000', '70.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '95.000', '5', '5035.000', '31', '0', ''),
(615, '620', 620, 'it620', NULL, 0, 0, 0.00, '71.5000', '71.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '82.500', '5', '4372.500', '7', '0', ''),
(616, '621', 621, 'it621', NULL, 0, 0, 0.00, '6.0000', '6.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '31.000', '5', '1643.000', '31', '0', ''),
(617, '622', 622, 'it622', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.500', '5', '1245.500', '13', '0', ''),
(618, '623', 623, 'it623', NULL, 0, 0, 0.00, '38.0000', '38.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '49.000', '5', '2597.000', '13', '0', ''),
(619, '624', 624, 'it624', NULL, 0, 0, 0.00, '115.0000', '115.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '140.000', '5', '7420.000', '31', '0', ''),
(620, '625', 625, 'it625', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.500', '5', '1245.500', '7', '0', ''),
(621, '626', 626, 'it626', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.500', '5', '1245.500', '7', '0', ''),
(622, '627', 627, 'it627', NULL, 0, 0, 0.00, '85.0000', '85.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '110.000', '5', '5830.000', '31', '0', ''),
(623, '628', 628, 'it628', NULL, 0, 0, 0.00, '30.0000', '30.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '55.000', '5', '2915.000', '31', '0', ''),
(624, '629', 629, 'it629', NULL, 0, 0, 0.00, '18.5000', '18.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '29.500', '5', '1563.500', '15', '0', ''),
(625, '', 630, 'it630', NULL, 0, 0, 0.00, '112.0000', '112.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '123.000', '5', '6519.000', '7', '0', '1302.19'),
(626, '631', 631, 'it631', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.000', '5', '1431.000', '15', '0', ''),
(627, '632', 632, 'it632', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.500', '5', '1298.500', '7', '0', '');
INSERT INTO `pos_items_detail` (`id`, `barcode`, `item_id`, `item_code`, `item_type`, `size_id`, `color_id`, `quantity`, `avg_cost`, `cost_price`, `unit_price`, `tax_id`, `re_stock_level`, `unit_id`, `location_id`, `picture`, `inventory_acc_code`, `deleted`, `wip_acc_code`, `landed_cost`, `shipping_terms`, `local_currency`, `supplier_id`, `quoted_qty`, `hs_code`) VALUES
(628, '633', 633, 'it633', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '41.000', '5', '2173.000', '31', '0', ''),
(629, '634', 634, 'it634', NULL, 0, 0, 0.00, '95.0000', '95.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '120.000', '5', '6360.000', '31', '0', ''),
(630, '635', 635, 'it635', NULL, 0, 0, 0.00, '48.0000', '48.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '73.000', '5', '3869.000', '14', '0', ''),
(631, '636', 636, 'it636', NULL, 0, 0, 0.00, '59.5000', '59.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '70.500', '5', '3736.500', '7', '0', ''),
(632, '637', 637, 'it637', NULL, 0, 0, 0.00, '30.0000', '30.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '55.000', '5', '2915.000', '31', '0', ''),
(633, '638', 638, 'it638', NULL, 0, 0, 0.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.000', '5', '1378.000', '13', '0', ''),
(634, '639', 639, 'it639', NULL, 0, 0, 0.00, '22.0000', '22.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '47.000', '5', '2491.000', '31', '0', ''),
(635, '640', 640, 'it640', NULL, 0, 0, 5.00, '12.3000', '12.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.300', '5', '1234.900', '7', '0', ''),
(636, '641', 641, 'it641', NULL, 0, 0, 0.00, '85.0000', '85.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '110.000', '5', '5830.000', '31', '0', ''),
(637, '642', 642, 'it642', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '60.000', '5', '3180.000', '31', '0', ''),
(638, '643', 643, 'it643', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.000', '5', '1431.000', '7', '0', ''),
(639, '644', 644, 'it644', NULL, 0, 0, 0.00, '62.5000', '62.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '73.500', '5', '3895.500', '7', '0', ''),
(640, '645', 645, 'it645', NULL, 0, 0, 5.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '41.000', '5', '2173.000', '31', '0', ''),
(641, '', 646, 'it646', NULL, 0, 0, 10.00, '175.3500', '175.3500', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '175.350', '6', '175.350', '8', '0', ''),
(642, '647', 647, 'it647', NULL, 0, 0, 0.00, '20.2000', '20.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '31.200', '5', '1653.600', '7', '0', ''),
(643, '648', 648, 'it648', NULL, 0, 0, 0.00, '11.7000', '11.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '22.700', '5', '1203.100', '7', '0', ''),
(644, '649', 649, 'it649', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '25.000', '5', '1325.000', '13', '0', ''),
(645, '', 650, 'it650', NULL, 0, 0, 0.00, '622.0000', '622.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '633.000', '5', '33549.000', '7', '0', '2914.62.00'),
(646, '651', 651, 'it651', NULL, 0, 0, 100.00, '520.0000', '520.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '560.000', '6', '560.000', '18', '0', ''),
(647, '652', 652, 'it652', NULL, 0, 0, 0.00, '93.0000', '93.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '104.000', '5', '5512.000', '15', '0', ''),
(648, '653', 653, 'it653', NULL, 0, 0, 0.00, '72.8000', '72.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '83.800', '5', '4441.400', '7', '0', ''),
(649, '654', 654, 'it654', NULL, 0, 0, 0.00, '483.5000', '483.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '494.500', '5', '26208.500', '7', '0', ''),
(650, '655', 655, 'it655', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '29.000', '5', '1537.000', '15', '0', ''),
(651, '656', 656, 'it656', NULL, 0, 0, 0.00, '52.0000', '52.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '63.000', '5', '3339.000', '15', '0', ''),
(652, '657', 657, 'it657', NULL, 0, 0, 0.00, '20.0000', '20.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '31.000', '5', '1643.000', '15', '0', ''),
(653, '', 658, 'it658', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '29.000', '5', '1537.000', '13', '0', ''),
(654, '659', 659, 'it659', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.000', '5', '1431.000', '15', '0', ''),
(655, '660', 660, 'it660', NULL, 0, 0, 0.00, '30.0000', '30.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '55.000', '5', '2915.000', '31', '0', ''),
(656, '661', 661, 'it661', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '60.000', '5', '3180.000', '31', '0', ''),
(657, '662', 662, 'it662', NULL, 0, 0, 0.00, '5.0000', '5.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '30.000', '5', '1590.000', '31', '0', ''),
(658, '663', 663, 'it663', NULL, 0, 0, 0.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '40.000', '5', '2120.000', '31', '0', ''),
(659, '664', 664, 'it664', NULL, 0, 0, 15.00, '40.0000', '40.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '65.000', '5', '3445.000', '31', '0', ''),
(660, '665', 665, 'it665', NULL, 0, 0, 0.00, '40.0000', '40.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '65.000', '5', '3445.000', '31', '0', ''),
(661, '', 666, 'it666', NULL, 0, 0, 30.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '13.500', '5', '0.000', '7', '0', '1302.19'),
(662, '667', 667, 'it667', NULL, 0, 0, 0.00, '108.7700', '108.7700', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '108.770', '6', '108.770', '8', '0', ''),
(663, '', 668, 'it668', NULL, 0, 0, 20.00, '12.7000', '12.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.700', '5', '1256.100', '7', '0', '1302.19'),
(664, '669', 669, 'it669', NULL, 0, 0, 0.00, '20.9500', '20.9500', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '45.950', '5', '2435.350', '11', '0', ''),
(665, '670', 670, 'it670', NULL, 0, 0, 0.00, '12.7000', '12.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.700', '5', '1256.100', '7', '0', ''),
(666, '671', 671, 'it671', NULL, 0, 0, 0.00, '26.5000', '26.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '37.500', '5', '1987.500', '7', '0', ''),
(667, '672', 672, 'it672', NULL, 0, 0, 100.00, '550.0000', '550.0000', '0.0000', NULL, NULL, 13, NULL, NULL, NULL, 0, '0', '590.000', '7', '590.000', '19', '0', ''),
(668, '673', 673, 'it673', NULL, 0, 0, 5.00, '12.8000', '12.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.800', '5', '1261.400', '7', '0', ''),
(669, '674', 674, 'it674', NULL, 0, 0, 0.00, '11.5000', '11.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '22.500', '5', '1192.500', '7', '0', ''),
(670, '', 675, 'it675', NULL, 0, 0, 20.00, '12.2000', '12.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.200', '5', '1229.600', '7', '0', '1302.19'),
(671, '', 676, 'it676', NULL, 0, 0, 10.00, '24.5000', '24.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '35.500', '5', '1881.500', '7', '0', '1302.19'),
(672, '677', 677, 'it677', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.000', '5', '1272.000', '13', '0', ''),
(673, '678', 678, 'it678', NULL, 0, 0, 0.00, '42.0000', '42.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '53.000', '5', '2809.000', '13', '0', ''),
(674, '679', 679, 'it679', NULL, 0, 0, 0.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.000', '5', '1378.000', '15', '0', ''),
(675, '680', 680, 'it680', NULL, 0, 0, 0.00, '50.2000', '50.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '61.200', '5', '3243.600', '7', '0', ''),
(676, '', 681, 'it681', NULL, 0, 0, 0.00, '26.0000', '26.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '37.000', '5', '1961.000', '15', '0', ''),
(677, '', 682, 'it682', NULL, 0, 0, 0.00, '72.7800', '72.7800', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '72.780', '5', '0.000', '7', '0', '1302.19'),
(678, '683', 683, 'it683', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.000', '5', '1272.000', '15', '0', ''),
(679, '', 684, 'it684', NULL, 0, 0, 0.00, '16.9000', '16.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '16.900', '5', '0.000', '7', '0', '2925.29'),
(680, '685', 685, 'it685', NULL, 0, 0, 0.00, '13.8000', '13.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.800', '5', '1314.400', '7', '0', ''),
(681, '686', 686, 'it686', NULL, 0, 0, 0.00, '421.4000', '421.4000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '521.400', '12', '521.400', '22', '0', ''),
(682, '687', 687, 'it687', NULL, 0, 0, 0.00, '44.0000', '44.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '55.000', '5', '2915.000', '13', '0', ''),
(683, '', 688, 'it688', NULL, 0, 0, 0.00, '26.1000', '26.1000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '37.100', '5', '1966.300', '7', '0', ''),
(684, '689', 689, 'it689', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.500', '5', '1298.500', '7', '0', ''),
(685, '690', 690, 'it690', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '25.000', '5', '1325.000', '13', '0', ''),
(686, '691', 691, 'it691', NULL, 0, 0, 0.00, '44.3000', '44.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '55.300', '5', '2930.900', '7', '0', ''),
(687, '692', 692, 'it692', NULL, 0, 0, 0.00, '6.9000', '6.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '17.900', '5', '948.700', '7', '0', ''),
(688, '693', 693, 'it693', NULL, 0, 0, 0.00, '9.2000', '9.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '20.200', '5', '1070.600', '7', '0', ''),
(689, '694', 694, 'it694', NULL, 0, 0, 0.00, '3350.0000', '3350.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '3361.000', '5', '178133.000', '15', '0', ''),
(690, '695', 695, 'it695', NULL, 0, 0, 0.00, '70.0000', '70.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '81.000', '5', '4293.000', '7', '0', ''),
(691, '', 696, 'it696', NULL, 0, 0, 424.00, '133.0000', '133.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '144.000', '5', '7632.000', '7', '0', ''),
(692, '697', 697, 'it697', NULL, 0, 0, 0.00, '5.2000', '5.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '16.200', '5', '858.600', '7', '0', ''),
(693, '', 698, 'it698', NULL, 0, 0, 15.00, '19.4000', '19.4000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '30.400', '5', '1611.200', '7', '0', '1302.19'),
(694, '699', 699, 'it699', NULL, 0, 0, 0.00, '185.9200', '185.9200', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '185.920', '6', '185.920', '8', '0', ''),
(695, '700', 700, 'it700', NULL, 0, 0, 0.00, '11.8001', '11.8001', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '22.800', '5', '1208.405', '7', '0', ''),
(696, '701', 701, 'it701', NULL, 0, 0, 0.00, '35.8000', '35.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '46.800', '5', '2480.400', '7', '0', ''),
(697, '702', 702, 'it702', NULL, 0, 0, 0.00, '24.8000', '24.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '49.800', '5', '2639.400', '11', '0', ''),
(698, '703', 703, 'it703', NULL, 0, 0, 0.00, '22.2000', '22.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '33.200', '5', '1759.600', '7', '0', ''),
(699, '704', 704, 'it704', NULL, 0, 0, 0.00, '209.0000', '209.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '220.000', '5', '11660.000', '7', '0', ''),
(700, '705', 705, 'it705', NULL, 0, 0, 0.00, '240.0000', '240.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '265.000', '5', '14045.000', '24', '0', ''),
(701, '706', 706, 'it706', NULL, 0, 0, 0.00, '32.0000', '32.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '43.000', '5', '2279.000', '16', '0', ''),
(702, '', 707, 'it707', NULL, 0, 0, 5.00, '32.5000', '32.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '43.500', '5', '2305.500', '7', '0', '1302.19'),
(703, '', 708, 'it708', NULL, 0, 0, 0.00, '20.3400', '20.3400', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '31.340', '5', '1661.020', '7', '0', '1302.19'),
(704, '709', 709, 'it709', NULL, 0, 0, 0.00, '55.0000', '55.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '80.000', '5', '4240.000', '14', '0', ''),
(705, '710', 710, 'it710', NULL, 0, 0, 0.00, '59.2000', '59.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '70.200', '5', '3720.600', '7', '0', ''),
(706, '711', 711, 'it711', NULL, 0, 0, 0.00, '13.8000', '13.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.800', '5', '1314.400', '7', '0', ''),
(707, '', 712, 'it712', NULL, 0, 0, 1101.00, '220.0000', '220.0000', '0.0000', NULL, NULL, 15, NULL, NULL, NULL, 0, '0', '250.000', '6', '250.000', '23', '0', ''),
(708, '713', 713, 'it713', NULL, 0, 0, 0.00, '359.5200', '359.5200', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '359.520', '6', '359.520', '8', '0', ''),
(709, '714', 714, 'it714', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.000', '5', '1272.000', '7', '0', ''),
(710, '715', 715, 'it715', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '25.000', '5', '1325.000', '13', '0', ''),
(711, '716', 716, 'it716', NULL, 0, 0, 10.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.000', '5', '1272.000', '7', '0', ''),
(712, '717', 717, 'it717', NULL, 0, 0, 0.00, '12.8000', '12.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.800', '5', '1261.400', '7', '0', ''),
(713, '718', 718, 'it718', NULL, 0, 0, 0.00, '122.5000', '122.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '133.500', '5', '7075.500', '7', '0', ''),
(714, '719', 719, 'it719', NULL, 0, 0, 0.00, '11.7000', '11.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '22.700', '5', '1203.100', '7', '0', ''),
(715, '720', 720, 'it720', NULL, 0, 0, 0.00, '258.0000', '258.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '269.000', '5', '14257.000', '13', '0', ''),
(716, '', 721, 'it721', NULL, 0, 0, 0.00, '34.5000', '34.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '45.500', '5', '2411.500', '7', '0', '1302.19'),
(717, '722', 722, 'it722', NULL, 0, 0, 0.00, '19.0000', '19.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 1, '0', '19.000', '0', '0.000', '0', '0', ''),
(718, '', 723, 'it723', NULL, 0, 0, 0.00, '11.8000', '11.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '22.800', '5', '1208.400', '7', '0', '1302.19'),
(719, '724', 724, 'it724', NULL, 0, 0, 0.00, '209.0000', '209.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '220.000', '5', '11660.000', '7', '0', ''),
(720, '725', 725, 'it725', NULL, 0, 0, 0.00, '19.0000', '19.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '30.000', '5', '1590.000', '7', '0', ''),
(721, '726', 726, 'it726', NULL, 0, 0, 0.00, '12.6000', '12.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.600', '5', '1250.800', '7', '0', ''),
(722, '727', 727, 'it727', NULL, 0, 0, 0.00, '46.0000', '46.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '57.000', '5', '3021.000', '15', '0', ''),
(723, '728', 728, 'it728', NULL, 0, 0, 0.00, '21.5000', '21.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '32.500', '5', '1722.500', '7', '0', ''),
(724, '729', 729, 'it729', NULL, 0, 0, 0.00, '105.2800', '105.2800', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '105.280', '6', '105.280', '8', '0', ''),
(725, '730', 730, 'it730', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '25.000', '5', '1325.000', '13', '0', ''),
(726, '731', 731, 'it731', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.500', '5', '1298.500', '13', '0', ''),
(727, '732', 732, 'it732', NULL, 0, 0, 0.00, '13.2000', '13.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.200', '5', '1282.600', '7', '0', ''),
(728, '733', 733, 'it733', NULL, 0, 0, 0.00, '16.8000', '16.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.800', '5', '1473.400', '7', '0', ''),
(729, '734', 734, 'it734', NULL, 0, 0, 0.00, '20.0000', '20.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '31.000', '5', '1643.000', '13', '0', ''),
(730, '735', 735, 'it735', NULL, 0, 0, 0.00, '350.0000', '350.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '350.000', '6', '350.000', '8', '0', ''),
(731, '736', 736, 'it736', NULL, 0, 0, 15.00, '15.5000', '15.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.500', '5', '1404.500', '7', '0', ''),
(732, '737', 737, 'it737', NULL, 0, 0, 0.00, '32.8000', '32.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '43.800', '5', '2321.400', '7', '0', ''),
(733, '738', 738, 'it738', NULL, 0, 0, 0.00, '56.9500', '56.9500', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '81.950', '5', '4343.350', '11', '0', ''),
(734, '', 739, 'it739', NULL, 0, 0, 60.00, '21.8700', '21.8700', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '32.870', '5', '1742.110', '7', '0', '3404.00'),
(735, '740', 740, 'it740', NULL, 0, 0, 0.00, '11.9000', '11.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '22.900', '5', '1213.700', '7', '0', ''),
(736, '741', 741, 'it741', NULL, 0, 0, 0.00, '22.9000', '22.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.900', '5', '0.000', '11', '0', ''),
(737, '', 742, 'it742', NULL, 0, 0, 40.00, '215.0000', '215.0000', '0.0000', NULL, NULL, 7, NULL, NULL, NULL, 0, '0', '235.000', '11', '13630.000', '25', '0', ''),
(738, '743', 743, 'it743', NULL, 0, 0, 0.00, '22.9000', '22.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '47.900', '5', '2538.700', '11', '0', ''),
(739, '744', 744, 'it744', NULL, 0, 0, 0.00, '11.5000', '11.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '22.500', '5', '1192.500', '7', '0', ''),
(740, '745', 745, 'it745', NULL, 0, 0, 0.00, '33.2000', '33.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '44.200', '5', '2342.600', '7', '0', ''),
(741, '746', 746, 'it746', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.000', '5', '1431.000', '13', '0', ''),
(742, '', 747, 'it747', NULL, 0, 0, 0.00, '10.0000', '10.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '21.000', '5', '1113.000', '7', '0', '1302.19'),
(743, '748', 748, 'it748', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.000', '5', '1272.000', '13', '0', ''),
(744, '', 749, 'it749', NULL, 0, 0, 50.00, '27.0000', '27.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '38.000', '5', '2014.000', '7', '0', '2930.90'),
(745, '750', 750, 'it750', NULL, 0, 0, 0.00, '12.2000', '12.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.200', '5', '1229.600', '7', '0', ''),
(746, '751', 751, 'it751', NULL, 0, 0, 400.00, '110.0000', '110.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '140.000', '6', '140.000', '26', '0', ''),
(747, '752', 752, 'it752', NULL, 0, 0, 0.00, '13.3000', '13.3000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.300', '5', '1287.900', '7', '0', ''),
(748, '753', 753, 'it753', NULL, 0, 0, 0.00, '260.0000', '260.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '285.000', '5', '15105.000', '27', '0', ''),
(749, '754', 754, 'it754', NULL, 0, 0, 150.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '43.000', '5', '2279.000', '27', '0', ''),
(750, '755', 755, 'it755', NULL, 0, 0, 0.00, '85.0000', '85.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '110.000', '5', '5830.000', '27', '0', ''),
(751, '756', 756, 'it756', NULL, 0, 0, 0.00, '14.2000', '14.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '25.200', '5', '1335.600', '7', '0', ''),
(752, '757', 757, 'it757', NULL, 0, 0, 0.00, '50.0000', '50.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '75.000', '5', '3975.000', '27', '0', ''),
(753, '758', 758, 'it758', NULL, 0, 0, 0.00, '13.2000', '13.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.200', '5', '1282.600', '7', '0', ''),
(754, '759', 759, 'it759', NULL, 0, 0, 0.00, '9.2000', '9.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '20.200', '5', '1070.600', '7', '0', ''),
(755, '760', 760, 'it760', NULL, 0, 0, 0.00, '36.5000', '36.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '61.500', '5', '3259.500', '14', '0', ''),
(756, '761', 761, 'it761', NULL, 0, 0, 0.00, '17.0000', '17.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '28.000', '5', '1484.000', '15', '0', ''),
(757, '762', 762, 'it762', NULL, 0, 0, 0.00, '64.5000', '64.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '75.500', '5', '4001.500', '7', '0', ''),
(758, '', 763, 'it763', NULL, 0, 0, 30.00, '31.6000', '31.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '42.600', '5', '2257.800', '7', '0', '1302.19'),
(759, '764', 764, 'it764', NULL, 0, 0, 0.00, '20.5000', '20.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '31.500', '5', '1669.500', '7', '0', ''),
(760, '765', 765, 'it765', NULL, 0, 0, 0.00, '13.0000', '13.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.000', '5', '1272.000', '15', '0', ''),
(761, '766', 766, 'it766', NULL, 0, 0, 0.00, '13.8000', '13.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.800', '5', '1314.400', '13', '0', ''),
(762, '767', 767, 'it767', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.500', '5', '1245.500', '15', '0', ''),
(763, '768', 768, 'it768', NULL, 0, 0, 0.00, '16.2000', '16.2000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.200', '5', '1441.600', '7', '0', ''),
(764, '769', 769, 'it769', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '25.000', '5', '1325.000', '15', '0', ''),
(765, '', 770, 'it770', NULL, 0, 0, 0.00, '351.7500', '351.7500', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '351.750', '6', '351.750', '8', '0', ''),
(766, '771', 771, 'it771', NULL, 0, 0, 0.00, '118.0000', '118.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '129.000', '5', '6837.000', '7', '0', ''),
(767, '772', 772, 'it772', NULL, 0, 0, 0.00, '21.5000', '21.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '32.500', '5', '1722.500', '7', '0', ''),
(768, '', 773, 'it773', NULL, 0, 0, 28.00, '3450.0000', '3450.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '3950.000', '8', '3950.000', '12', '0', ''),
(769, '', 774, 'it774', NULL, 0, 0, 5.00, '1144.6400', '1144.6400', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '1144.640', '6', '1144.640', '8', '0', ''),
(770, '775', 775, 'it775', NULL, 0, 0, 0.00, '107.6900', '107.6900', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '107.690', '6', '107.690', '8', '0', ''),
(771, '776', 776, 'it776', NULL, 0, 0, 0.00, '11.6000', '11.6000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '22.600', '5', '1197.800', '7', '0', ''),
(772, '777', 777, 'it777', NULL, 0, 0, 0.00, '74.8000', '74.8000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '85.800', '5', '4547.400', '7', '0', ''),
(773, '778', 778, 'it778', NULL, 0, 0, 0.00, '235.0000', '235.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '246.000', '5', '13038.000', '7', '0', ''),
(774, '779', 779, 'it779', NULL, 0, 0, 135.00, '63.0000', '61.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '81.000', '6', '81.000', '28', '0', ''),
(775, '780', 780, 'it780', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.500', '5', '1245.500', '7', '0', ''),
(776, '781', 781, 'it781', NULL, 0, 0, 0.00, '12.5000', '12.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.500', '5', '1245.500', '7', '0', ''),
(777, '782', 782, 'it782', NULL, 0, 0, 0.00, '223.0000', '223.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '234.000', '5', '12402.000', '7', '0', ''),
(778, '783', 783, 'it783', NULL, 0, 0, 0.00, '54.7000', '54.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '65.700', '5', '3482.100', '7', '0', ''),
(779, '784', 784, 'it784', NULL, 0, 0, 0.00, '22.5000', '22.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '33.500', '5', '1775.500', '15', '0', ''),
(780, '785', 785, 'it785', NULL, 0, 0, 10.00, '425.0000', '484.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '509.000', '5', '26977.000', '30', '0', ''),
(781, '786', 786, 'it786', NULL, 0, 0, 0.00, '13.5000', '13.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '24.500', '5', '1298.500', '7', '0', ''),
(782, '787', 787, 'it787', NULL, 0, 0, 0.00, '47.0000', '47.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '58.000', '5', '3074.000', '7', '0', ''),
(783, '788', 788, 'it788', NULL, 0, 0, 0.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.000', '5', '1431.000', '13', '0', ''),
(784, '789', 789, 'it789', NULL, 0, 0, 0.00, '12.9000', '12.9000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.900', '5', '1266.700', '7', '0', ''),
(785, '790', 790, 'it790', NULL, 0, 0, 0.00, '200.0000', '200.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '225.000', '7', '11925.000', '9', '0', ''),
(786, '', 791, 'it791', NULL, 0, 0, 125.00, '576.0000', '600.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '600.500', '6', '600.500', '29', '0', ''),
(787, '792', 792, 'it792', NULL, 0, 0, 0.00, '8.4600', '8.4600', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '19.460', '5', '1031.380', '7', '0', ''),
(788, '793', 793, 'it793', NULL, 0, 0, 0.00, '63.0000', '63.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '63.000', '6', '63.000', '8', '0', ''),
(789, '794', 794, 'it794', NULL, 0, 0, 0.00, '21.5000', '21.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '32.500', '5', '1722.500', '7', '0', ''),
(790, '', 795, 'it795', NULL, 0, 0, 10.00, '1034.3200', '1034.3200', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '1034.320', '6', '1034.320', '8', '0', ''),
(791, '', 796, 'it796', NULL, 0, 0, 0.00, '112.6100', '112.6100', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '112.610', '6', '112.610', '8', '0', ''),
(792, '797', 797, 'it797', NULL, 0, 0, 0.00, '12.0000', '12.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.000', '5', '1219.000', '13', '0', ''),
(793, '798', 798, 'it798', NULL, 0, 0, 0.00, '31.5000', '31.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '42.500', '5', '2252.500', '7', '0', ''),
(794, '', 799, 'it799', NULL, 0, 0, 300.00, '36.1380', '35.5040', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '35.504', '6', '35.504', '8', '0', ''),
(795, '', 800, 'it800', NULL, 0, 0, 50.00, '122.8800', '122.8800', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '122.880', '6', '122.880', '8', '0', ''),
(796, '801', 801, 'it801', NULL, 0, 0, 0.00, '38.0000', '38.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '49.000', '5', '2597.000', '7', '0', ''),
(797, '', 802, 'it802', NULL, 0, 0, 0.00, '164.6400', '164.6400', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '164.640', '6', '164.640', '8', '0', ''),
(798, '803', 803, 'it803', NULL, 0, 0, 0.00, '175.0000', '175.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '200.000', '5', '10600.000', '31', '0', ''),
(799, '804', 804, 'it804', NULL, 0, 0, 0.00, '25.0000', '25.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '50.000', '5', '2650.000', '31', '0', ''),
(800, '805', 805, 'it805', NULL, 0, 0, 0.00, '70.0000', '70.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '95.000', '5', '5035.000', '31', '0', ''),
(801, '', 806, 'it806', NULL, 0, 0, 40.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '60.000', '5', '3180.000', '31', '0', ''),
(802, '807', 807, 'it807', NULL, 0, 0, 15.00, '75.0000', '75.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '100.000', '5', '5300.000', '31', '0', ''),
(803, '808', 808, 'it808', NULL, 0, 0, 0.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '39.000', '5', '2067.000', '31', '0', ''),
(804, '809', 809, 'it809', NULL, 0, 0, 0.00, '255.0000', '255.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '280.000', '5', '14840.000', '31', '0', ''),
(805, '810', 810, 'it810', NULL, 0, 0, 0.00, '45.0000', '45.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '70.000', '5', '3710.000', '31', '0', ''),
(806, '811', 811, 'it811', NULL, 0, 0, 0.00, '255.0000', '255.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '280.000', '5', '14840.000', '31', '0', ''),
(807, '812', 812, 'it812', NULL, 0, 0, 0.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '60.000', '5', '3180.000', '31', '0', ''),
(808, '813', 813, 'it813', NULL, 0, 0, 0.00, '650.0000', '650.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '675.000', '5', '35775.000', '31', '0', ''),
(809, '814', 814, 'it814', NULL, 0, 0, 0.00, '45.0000', '45.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '70.000', '5', '3710.000', '31', '0', ''),
(810, '815', 815, 'it815', NULL, 0, 0, 0.00, '95.0000', '95.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '120.000', '5', '6360.000', '31', '0', ''),
(811, '816', 816, 'it816', NULL, 0, 0, 0.00, '45.0000', '45.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '70.000', '5', '3710.000', '31', '0', ''),
(812, '', 817, 'it817', NULL, 0, 0, 0.00, '0.3840', '0.3840', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.584', '4', '30.952', '34', '10000', ''),
(813, '', 818, 'it818', NULL, 0, 0, 0.00, '0.3760', '0.3760', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.576', '4', '30.528', '34', '20000', ''),
(814, '', 819, 'it819', NULL, 0, 0, 0.00, '0.3660', '0.3660', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.566', '4', '29.998', '34', '30000', ''),
(815, '', 820, 'it820', NULL, 0, 0, 0.00, '0.3550', '0.3550', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.555', '4', '29.415', '34', '50000', ''),
(816, '', 821, 'it821', NULL, 0, 0, 0.00, '0.2700', '0.2700', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.470', '4', '24.910', '34', '10000', ''),
(817, '', 822, 'it822', NULL, 0, 0, 0.00, '0.2470', '0.2470', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.447', '4', '23.691', '34', '20000', ''),
(818, '', 823, 'it823', NULL, 0, 0, 0.00, '0.2570', '0.2570', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.457', '4', '24.221', '34', '30000', ''),
(819, '', 824, 'it824', NULL, 0, 0, 0.00, '0.2500', '0.2500', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.450', '4', '23.850', '34', '50000', ''),
(820, '', 825, 'it825', NULL, 0, 0, 0.00, '0.2520', '0.2520', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.452', '4', '23.956', '34', '10000', ''),
(821, '', 826, 'it826', NULL, 0, 0, 0.00, '0.2470', '0.2470', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.447', '4', '23.691', '34', '20000', ''),
(822, '', 827, 'it827', NULL, 0, 0, 0.00, '0.2400', '0.2400', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.440', '4', '23.320', '34', '30000', ''),
(823, '', 828, 'it828', NULL, 0, 0, 0.00, '0.2320', '0.2320', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.432', '4', '22.896', '34', '50000', ''),
(824, '829', 829, 'it829', NULL, 0, 0, 0.00, '0.1750', '0.1750', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.375', '4', '19.875', '34', '10000', ''),
(825, '830', 830, 'it830', NULL, 0, 0, 0.00, '0.1720', '0.1720', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.372', '4', '19.716', '34', '20000', ''),
(826, '831', 831, 'it831', NULL, 0, 0, 0.00, '0.1660', '0.1660', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.366', '4', '19.398', '34', '30000', ''),
(827, '832', 832, 'it832', NULL, 0, 0, 0.00, '0.1600', '0.1600', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.360', '4', '19.080', '34', '50000', ''),
(828, '', 833, 'it833', NULL, 0, 0, 60000.00, '0.1300', '0.1320', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.332', '4', '17.596', '34', '10000', ''),
(829, '', 834, 'it834', NULL, 0, 0, 50000.00, '0.1300', '0.1290', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.329', '4', '17.437', '34', '20000', ''),
(830, '', 835, 'it835', NULL, 0, 0, 0.00, '0.1250', '0.1250', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.325', '4', '17.225', '34', '30000', ''),
(831, '', 836, 'it836', NULL, 0, 0, 0.00, '0.1210', '0.1210', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.321', '4', '17.013', '34', '50000', ''),
(832, '837', 837, 'it837', NULL, 0, 0, 0.00, '0.1680', '0.1680', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.368', '4', '19.504', '34', '10000', ''),
(833, '838', 838, 'it838', NULL, 0, 0, 0.00, '0.1650', '0.1650', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.365', '4', '19.345', '34', '20000', ''),
(834, '839', 839, 'it839', NULL, 0, 0, 0.00, '0.1600', '0.1600', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.360', '4', '19.080', '34', '30000', ''),
(835, '840', 840, 'it840', NULL, 0, 0, 0.00, '0.1540', '0.1540', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.354', '4', '18.762', '34', '50000', ''),
(836, '841', 841, 'it841', NULL, 0, 0, 0.00, '0.2020', '0.2020', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.402', '4', '21.306', '34', '10000', ''),
(837, '842', 842, 'it842', NULL, 0, 0, 0.00, '0.1980', '0.1980', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.398', '4', '21.094', '34', '20000', ''),
(838, '843', 843, 'it843', NULL, 0, 0, 0.00, '0.1920', '0.1920', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.392', '4', '20.776', '34', '30000', ''),
(839, '844', 844, 'it844', NULL, 0, 0, 0.00, '0.1850', '0.1850', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.385', '4', '20.405', '34', '50000', ''),
(840, '845', 845, 'it845', NULL, 0, 0, 40000.00, '0.2050', '0.2100', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.410', '4', '21.730', '34', '10000', ''),
(841, '846', 846, 'it846', NULL, 0, 0, 10000.00, '0.2050', '0.2050', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.405', '4', '21.465', '34', '20000', ''),
(842, '847', 847, 'it847', NULL, 0, 0, 0.00, '0.1990', '0.1990', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.399', '4', '21.147', '34', '30000', ''),
(843, '848', 848, 'it848', NULL, 0, 0, 0.00, '0.1930', '0.1930', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.393', '4', '20.829', '34', '50000', ''),
(844, '849', 849, 'it849', NULL, 0, 0, 0.00, '0.1350', '0.1350', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.335', '4', '17.755', '34', '10000', ''),
(845, '850', 850, 'it850', NULL, 0, 0, 0.00, '0.1320', '0.1320', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.332', '4', '17.596', '34', '20000', ''),
(846, '851', 851, 'it851', NULL, 0, 0, 0.00, '0.1280', '0.1280', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.328', '4', '17.384', '34', '30000', ''),
(847, '852', 852, 'it852', NULL, 0, 0, 0.00, '0.1240', '0.1240', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.324', '4', '17.172', '34', '50000', ''),
(848, '', 853, 'it853', NULL, 0, 0, 50000.00, '0.1490', '0.1490', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.309', '4', '16.377', '36', '10000', '7010.90'),
(849, '', 854, 'it854', NULL, 0, 0, 0.00, '0.1520', '0.1520', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.312', '4', '16.536', '36', '20000', '7010.90'),
(850, '', 855, 'it855', NULL, 0, 0, 0.00, '0.1480', '0.1480', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.308', '4', '16.324', '36', '30000', '7010.90'),
(851, '', 856, 'it856', NULL, 0, 0, 0.00, '0.1490', '0.1490', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.309', '4', '16.377', '36', '50000', '7010.90'),
(852, '', 857, 'it857', NULL, 0, 0, 3000.00, '0.1800', '0.1800', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.340', '4', '18.020', '36', '10000', ''),
(853, '858', 858, 'it858', NULL, 0, 0, 0.00, '0.1640', '0.1640', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.324', '4', '17.172', '36', '20000', ''),
(854, '', 859, 'it859', NULL, 0, 0, 0.00, '0.1600', '0.1600', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.320', '4', '16.960', '36', '30000', ''),
(855, '860', 860, 'it860', NULL, 0, 0, 1.00, '20.0000', '0.1580', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 1, '0', '0.318', '4', '16.854', '36', '50000', ''),
(856, '861', 861, 'it861', NULL, 0, 0, 0.00, '0.0000', '0.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '11.000', '5', '583.000', '13', '0', ''),
(857, '', 862, 'it862', NULL, 0, 0, 900000.00, '0.1600', '0.1600', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.200', '6', '0.200', '17', '0', ''),
(858, '', 863, 'it863', NULL, 0, 0, 800000.00, '0.1600', '0.1600', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.200', '6', '0.200', '17', '0', ''),
(859, '', 864, 'it864', NULL, 0, 0, 1700000.00, '0.3700', '0.3700', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.370', '6', '0.000', '17', '0', ''),
(860, '', 865, 'it865', NULL, 0, 0, 500000.00, '0.3300', '0.3300', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.370', '6', '0.370', '17', '0', ''),
(861, '866', 866, 'it866', NULL, 0, 0, 0.00, '0.1700', '0.1700', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.210', '6', '0.210', '17', '0', ''),
(862, '', 867, 'it867', NULL, 0, 0, 1600000.00, '0.2100', '0.2100', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.250', '6', '0.250', '17', '0', ''),
(863, '', 868, 'it868', NULL, 0, 0, 9000.00, '2.4000', '2.4000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '2.900', '8', '2.900', '52', '0', ''),
(864, '', 869, 'it869', NULL, 0, 0, 7004.00, '2.2700', '2.2700', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '2.770', '8', '2.770', '52', '0', ''),
(865, '870', 870, 'it870', NULL, 0, 0, 100.00, '80.0000', '100.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '130.000', '6', '130.000', '23', '0', ''),
(866, '', 871, 'it871', NULL, 0, 0, 500.00, '160.0000', '160.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '190.000', '6', '190.000', '23', '0', ''),
(867, '872', 872, 'it872', NULL, 0, 0, 0.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '29.000', '5', '1537.000', '13', '0', ''),
(868, '873', 873, 'it873', NULL, 0, 0, 0.00, '1800.0000', '1800.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '1900.000', '6', '1900.000', '57', '0', ''),
(869, '874', 874, 'it874', NULL, 0, 0, 0.00, '2500.0000', '2500.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '2600.000', '6', '2600.000', '57', '0', ''),
(870, '', 875, 'it875', NULL, 0, 0, 115.00, '14.5000', '14.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '25.500', '5', '1351.500', '7', '-', ''),
(871, '', 876, 'it876', NULL, 0, 0, 0.00, '26.5000', '26.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '37.500', '5', '1987.500', '7', '0', ''),
(872, '', 877, 'it877', NULL, 0, 0, 1.00, '846.7200', '846.7200', '0.0000', NULL, NULL, 17, NULL, NULL, NULL, 0, '0', '846.720', '6', '846.720', '8', '0', ''),
(873, '', 878, 'it878', NULL, 0, 0, 100.00, '575.0000', '570.0000', '0.0000', NULL, NULL, 20, NULL, NULL, NULL, 0, '0', '580.000', '8', '580.000', '50', '0', ''),
(874, '', 879, 'it879', NULL, 0, 0, 30000.00, '36.0000', '36.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '39.000', '6', '39.000', '49', '0', ''),
(875, '', 880, 'it880', NULL, 0, 0, 20.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 21, NULL, NULL, NULL, 0, '0', '35.000', '5', '1855.000', '48', '0', ''),
(876, '881', 881, 'it881', NULL, 0, 0, 4.00, '282.5000', '195.0000', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '215.000', '5', '11395.000', '48', '0', ''),
(877, '', 882, 'it882', NULL, 0, 0, 10001.00, '6.5000', '6.5000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '7.000', '6', '7.000', '42', '0', ''),
(878, '883', 883, 'it883', NULL, 0, 0, 2.00, '24003.8600', '24003.8600', '0.0000', NULL, NULL, 11, NULL, NULL, NULL, 0, '0', '25003.860', '6', '25003.860', '58', '0', ''),
(879, '884', 884, 'it884', NULL, 0, 0, 50.00, '336.0000', '336.0000', '0.0000', NULL, NULL, 25, NULL, NULL, NULL, 0, '0', '336.000', '6', '336.000', '51', '0', ''),
(880, '885', 885, 'it885', NULL, 0, 0, 0.00, '40180.0000', '40180.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 1, '0', '43180.000', '6', '43180.000', '43', '1', ''),
(881, '', 886, 'it886', NULL, 0, 0, 1.00, '45001.6000', '45001.6000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 0, '0', '48001.600', '6', '48001.600', '43', '0', ''),
(882, '', 887, 'it887', NULL, 0, 0, 18.00, '3281.6000', '3281.6000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '6281.600', '6', '6281.600', '43', '0', ''),
(883, '888', 888, 'it888', NULL, 0, 0, 0.00, '33.7500', '33.7500', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '36.750', '6', '36.750', '59', '0', ''),
(884, '889', 889, 'it889', NULL, 0, 0, 3000.00, '47.0000', '47.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '50.000', '6', '50.000', '59', '0', ''),
(885, '', 890, 'it890', NULL, 0, 0, 35000.00, '2.6000', '2.6000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '3.100', '6', '3.100', '42', '15000', ''),
(886, '', 891, 'it891', NULL, 0, 0, 10000.00, '1.9000', '1.9000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '2.400', '6', '2.400', '42', '10000', ''),
(887, '892', 892, 'it892', NULL, 0, 0, 17.00, '45.0000', '45.0000', '0.0000', NULL, NULL, 21, NULL, NULL, NULL, 0, '0', '65.000', '5', '3445.000', '48', '0', ''),
(888, '893', 893, 'it893', NULL, 0, 0, 2000.00, '8.0000', '8.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '8.500', '6', '8.500', '42', '2000', ''),
(889, '894', 894, 'it894', NULL, 0, 0, 2000.00, '8.0000', '8.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '8.500', '6', '8.500', '42', '2000', ''),
(890, '895', 895, 'it895', NULL, 0, 0, 2000.00, '8.0000', '8.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '8.500', '6', '8.500', '42', '2000', ''),
(891, '', 896, 'it896', NULL, 0, 0, 320000.00, '0.5200', '0.5200', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.560', '6', '0.560', '17', '100000', ''),
(892, '897', 897, 'it897', NULL, 0, 0, 1.00, '40.0000', '40.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '65.000', '5', '3445.000', '31', '0', ''),
(893, '', 898, 'it898', NULL, 0, 0, 300.00, '74.5400', '74.5400', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '75.040', '6', '75.040', '52', '0', ''),
(894, '899', 899, 'it899', NULL, 0, 0, 3.00, '26.0000', '26.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '51.000', '5', '2703.000', '31', '0', ''),
(895, '', 900, 'it900', NULL, 0, 0, 10000.00, '0.0750', '0.0750', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.150', '5', '7.950', '60', '0', ''),
(896, '901', 901, 'it901', NULL, 0, 0, 10.00, '5350.0000', '5350.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '5390.000', '6', '5390.000', '18', '0', ''),
(897, '', 902, 'it902', NULL, 0, 0, 5000.00, '49.9500', '49.9500', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '52.950', '6', '52.950', '59', '0', ''),
(898, '903', 903, 'it903', NULL, 0, 0, 1500.00, '33.7500', '33.7500', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '36.750', '6', '36.750', '59', '0', ''),
(899, '', 904, 'it904', NULL, 0, 0, 4002.00, '0.1889', '0.1180', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.358', '5', '18.974', '61', '4000', ''),
(900, '', 905, 'it905', NULL, 0, 0, 200.00, '71.1400', '71.1400', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '71.140', '6', '71.140', '8', '0', ''),
(901, '906', 906, 'it906', NULL, 0, 0, 0.00, '91500.0000', '6100.0000', '0.0000', NULL, NULL, 17, NULL, NULL, NULL, 1, '0', '6100.500', '6', '6100.500', '42', '15', ''),
(902, '907', 907, 'it907', NULL, 0, 0, 2.00, '4845.0000', '4845.0000', '0.0000', NULL, NULL, 26, NULL, NULL, NULL, 0, '0', '4845.000', '8', '4845.000', '51', '0', ''),
(903, '', 908, 'it908', NULL, 0, 0, 130000.00, '0.1700', '0.1700', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.350', '6', '0.350', '37', '50000', ''),
(904, '909', 909, 'it909', NULL, 0, 0, 40.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.000', '5', '1431.000', '7', '0', ''),
(905, '', 910, 'it910', NULL, 0, 0, 49.00, '22.6204', '22.6204', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '23.820', '5', '1262.481', '62', '0', '3923210000'),
(906, '911', 911, 'it911', NULL, 0, 0, 3.00, '2920.0000', '2920.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '2920.500', '6', '2920.500', '52', '0', ''),
(907, '912', 912, 'it912', NULL, 0, 0, 15.00, '17500.0000', '17500.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '17500.500', '6', '17500.500', '29', '0', ''),
(908, '913', 913, 'it913', NULL, 0, 0, 100000.00, '0.1600', '0.1600', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.660', '6', '0.660', '29', '0', ''),
(909, '', 914, 'it914', NULL, 0, 0, 50.00, '2650.0000', '2650.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '2651.000', '6', '2651.000', '63', '0', ''),
(910, '', 915, 'it915', NULL, 0, 0, 81.00, '359.7840', '349.0000', '0.0000', NULL, NULL, 25, NULL, NULL, NULL, 0, '0', '350.000', '9', '350.000', '64', '0', ''),
(911, '', 916, 'it916', NULL, 0, 0, 200.00, '67.0000', '67.0000', '0.0000', NULL, NULL, 25, NULL, NULL, NULL, 0, '0', '68.000', '9', '68.000', '64', '0', ''),
(912, '917', 917, 'it917', NULL, 0, 0, 21.00, '194.9524', '159.0000', '0.0000', NULL, NULL, 25, NULL, NULL, NULL, 0, '0', '160.000', '9', '160.000', '64', '0', ''),
(913, '918', 918, 'it918', NULL, 0, 0, 15.00, '260.0000', '260.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '260.500', '6', '260.500', '29', '0', ''),
(914, '', 919, 'it919', NULL, 0, 0, 66.00, '3900.0000', '3900.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '3910.000', '8', '3910.000', '50', '1', ''),
(915, '', 920, 'it920', NULL, 0, 0, 2.00, '50000.0000', '50000.0000', '0.0000', NULL, NULL, 19, NULL, NULL, NULL, 0, '0', '50050.000', '6', '50050.000', '65', '0', ''),
(916, '921', 921, 'it921', NULL, 0, 0, 500.00, '165.0000', '165.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '170.000', '6', '170.000', '40', '0', ''),
(917, '922', 922, 'it922', NULL, 0, 0, 1000.00, '60.0000', '60.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '65.000', '6', '65.000', '40', '0', ''),
(918, '923', 923, 'it923', NULL, 0, 0, 125.00, '200.0000', '200.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '205.000', '6', '205.000', '40', '0', ''),
(919, '924', 924, 'it924', NULL, 0, 0, 2.00, '29.0000', '29.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '40.000', '5', '2120.000', '7', '0', ''),
(920, '925', 925, 'it925', NULL, 0, 0, 2.00, '16.0000', '16.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.000', '5', '1431.000', '7', '0', ''),
(921, '926', 926, 'it926', NULL, 0, 0, 2.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.000', '5', '1378.000', '7', '0', ''),
(922, '927', 927, 'it927', NULL, 0, 0, 2.00, '374.0000', '405.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '405.500', '6', '405.500', '29', '0', ''),
(923, '928', 928, 'it928', NULL, 0, 0, 39.00, '3100.0000', '3100.0000', '0.0000', NULL, NULL, 15, NULL, NULL, NULL, 0, '0', '3140.000', '6', '3140.000', '19', '0', ''),
(924, '', 929, 'it929', NULL, 0, 0, 10.00, '35.0000', '35.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '60.000', '5', '3180.000', '31', '0', ''),
(925, '930', 930, 'it930', NULL, 0, 0, 1.00, '7150.0000', '7150.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '7151.000', '6', '7151.000', '66', '0', ''),
(926, '', 931, 'it931', NULL, 0, 0, 300000.00, '0.5100', '0.5100', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '1.010', '6', '1.010', '29', '0', ''),
(927, '', 932, 'it932', NULL, 0, 0, 3000.00, '14.0000', '14.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '15.000', '6', '15.000', '53', '0', ''),
(928, '933', 933, 'it933', NULL, 0, 0, 125.00, '90.0000', '90.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '95.000', '6', '95.000', '40', '0', ''),
(929, '934', 934, 'it934', NULL, 0, 0, 2.00, '6275.0000', '6275.0000', '0.0000', NULL, NULL, 25, NULL, NULL, NULL, 0, '0', '6275.100', '6', '6275.100', '67', '0', ''),
(930, '935', 935, 'it935', NULL, 0, 0, 2.00, '5533.0000', '5533.0000', '0.0000', NULL, NULL, 25, NULL, NULL, NULL, 0, '0', '5533.100', '6', '5533.100', '67', '0', ''),
(931, '936', 936, 'it936', NULL, 0, 0, 2.00, '8641.0000', '8641.0000', '0.0000', NULL, NULL, 25, NULL, NULL, NULL, 0, '0', '8641.100', '6', '8641.100', '67', '0', ''),
(932, '', 937, 'it937', NULL, 0, 0, 20.00, '18.0000', '18.0000', '0.0000', NULL, NULL, 21, NULL, NULL, NULL, 0, '0', '38.000', '5', '2014.000', '48', '0', ''),
(933, '938', 938, 'it938', NULL, 0, 0, 10.00, '15.5000', '15.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.500', '11', '1404.500', '7', '1', ''),
(934, '939', 939, 'it939', NULL, 0, 0, 0.00, '22.0000', '22.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 1, '0', '22.000', '4', '22.000', '8', '2', 'abcc23'),
(935, '940', 940, 'it940', NULL, 0, 0, 10.00, '80.0000', '80.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '91.000', '5', '4823.000', '7', '0', ''),
(936, '', 941, 'it941', NULL, 0, 0, 30.00, '16.5000', '16.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '27.500', '5', '1457.500', '7', '0', '1302.19'),
(937, '', 942, 'it942', NULL, 0, 0, 1.00, '9000.0000', '9000.0000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 0, '0', '9000.000', '6', '0.000', '68', '0', '-'),
(938, '943', 943, 'it943', NULL, 0, 0, 1.00, '8000.0000', '8000.0000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 0, '0', '8000.000', '6', '0.000', '68', '0', '-');
INSERT INTO `pos_items_detail` (`id`, `barcode`, `item_id`, `item_code`, `item_type`, `size_id`, `color_id`, `quantity`, `avg_cost`, `cost_price`, `unit_price`, `tax_id`, `re_stock_level`, `unit_id`, `location_id`, `picture`, `inventory_acc_code`, `deleted`, `wip_acc_code`, `landed_cost`, `shipping_terms`, `local_currency`, `supplier_id`, `quoted_qty`, `hs_code`) VALUES
(939, '944', 944, 'it944', NULL, 0, 0, 1.00, '700.0000', '700.0000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 0, '0', '700.000', '6', '0.000', '68', '0', '-'),
(940, '945', 945, 'it945', NULL, 0, 0, 1.00, '400.0000', '400.0000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 0, '0', '400.000', '6', '0.000', '68', '0', '-'),
(941, '946', 946, 'it946', NULL, 0, 0, 1.00, '900.0000', '900.0000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 0, '0', '900.000', '6', '0.000', '68', '0', '-'),
(942, '947', 947, 'it947', NULL, 0, 0, 1.00, '600.0000', '600.0000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 0, '0', '600.000', '6', '0.000', '68', '0', '-'),
(943, '948', 948, 'it948', NULL, 0, 0, 1.00, '2000.0000', '2000.0000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 0, '0', '2000.000', '6', '0.000', '68', '0', '-'),
(944, '', 949, 'it949', NULL, 0, 0, 50000.00, '0.1370', '0.1370', '0.0000', NULL, NULL, 8, NULL, NULL, NULL, 0, '0', '0.337', '4', '17.861', '34', '50000', '7010.90'),
(945, '', 950, 'it950', NULL, 0, 0, 80.00, '249.0000', '249.0000', '0.0000', NULL, NULL, 25, NULL, NULL, NULL, 0, '0', '250.000', '9', '250.000', '64', '0', ''),
(946, '', 951, 'it951', NULL, 0, 0, 0.00, '0.0000', '6100.0000', '0.0000', NULL, NULL, 17, NULL, NULL, NULL, 0, '0', '6100.500', '8', '6100.500', '42', '0', ''),
(947, '952', 952, 'it952', NULL, 0, 0, 180000.00, '0.5500', '0.5500', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.730', '8', '0.730', '39', '0', ''),
(948, '953', 953, 'it953', NULL, 0, 0, 850.00, '42.0000', '42.0000', '0.0000', NULL, NULL, 6, NULL, NULL, NULL, 0, '0', '43.000', '6', '43.000', '69', '0', '-'),
(949, '954', 954, 'it954', NULL, 0, 0, 0.00, '15100.0000', '15100.0000', '0.0000', NULL, NULL, 11, NULL, NULL, NULL, 0, '0', '15101.000', '6', '15101.000', '70', '0', ''),
(950, '955', 955, 'it955', NULL, 0, 0, 0.00, '17000.0000', '17000.0000', '0.0000', NULL, NULL, 11, NULL, NULL, NULL, 0, '0', '17001.000', '6', '17001.000', '71', '0', ''),
(951, '956', 956, 'it956', NULL, 0, 0, 0.00, '5.0000', '5.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '5.500', '6', '5.500', '42', '10000', ''),
(952, '957', 957, 'it957', NULL, 0, 0, 0.00, '5.3000', '5.3000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '5.800', '6', '5.800', '42', '5000', ''),
(953, '958', 958, 'it958', NULL, 0, 0, 0.00, '4.5000', '4.5000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '5.000', '6', '5.000', '42', '10000', ''),
(954, '', 959, 'it959', NULL, 0, 0, 30.00, '27.0000', '27.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '38.000', '5', '2014.000', '7', '0', '1302.19'),
(955, '', 960, 'it960', NULL, 0, 0, 50.00, '15.0000', '15.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.000', '5', '1378.000', '7', '0', '1302.19'),
(956, '', 961, 'it961', NULL, 0, 0, 3.00, '55.0000', '55.0000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '80.000', '5', '4240.000', '31', '0', ''),
(957, '962', 962, 'it962', NULL, 0, 0, 10.00, '15.5000', '15.5000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '26.500', '5', '1404.500', '7', '0', ''),
(958, '963', 963, 'it963', NULL, 0, 0, 1.00, '5008.2000', '5008.2000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 0, '0', '5009.200', '9', '5009.200', '72', '0', ''),
(959, '964', 964, 'it964', NULL, 0, 0, 2.00, '1200.0000', '1200.0000', '0.0000', NULL, NULL, 17, NULL, NULL, NULL, 0, '0', '1201.000', '6', '1201.000', '73', '0', ''),
(960, '', 965, 'it965', NULL, 0, 0, 1.00, '10350.0000', '10350.0000', '0.0000', NULL, NULL, 11, NULL, NULL, NULL, 0, '0', '10351.000', '6', '10351.000', '74', '1', ''),
(961, '966', 966, 'it966', NULL, 0, 0, 1.00, '10350.0000', '10350.0000', '0.0000', NULL, NULL, 11, NULL, NULL, NULL, 0, '0', '10351.000', '6', '10351.000', '74', '1', ''),
(962, '967', 967, 'it967', NULL, 0, 0, 1.00, '21150.0000', '21150.0000', '0.0000', NULL, NULL, 11, NULL, NULL, NULL, 0, '0', '21151.000', '6', '21151.000', '74', '1', ''),
(963, '968', 968, 'it968', NULL, 0, 0, 2.00, '10000.0000', '10000.0000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 0, '0', '10700.000', '6', '10700.000', '33', '1', ''),
(964, '969', 969, 'it969', NULL, 0, 0, 0.00, '0.3800', '0.3800', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.560', '6', '0.560', '37', '50000', ''),
(965, '970', 970, 'it970', NULL, 0, 0, 0.00, '0.4300', '0.4300', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.610', '6', '0.610', '37', '75000', ''),
(966, '971', 971, 'it971', NULL, 0, 0, 0.00, '1.3000', '1.3000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '1.480', '6', '1.480', '37', '20000', ''),
(967, '972', 972, 'it972', NULL, 0, 0, 0.00, '0.2600', '0.2600', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.440', '6', '0.440', '37', '50000', ''),
(968, '973', 973, 'it973', NULL, 0, 0, 0.00, '0.3000', '0.3000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.480', '6', '0.480', '37', '50000', ''),
(969, '974', 974, 'it974', NULL, 0, 0, 0.00, '0.2700', '0.2700', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.450', '6', '0.450', '37', '50000', ''),
(970, '975', 975, 'it975', NULL, 0, 0, 0.00, '0.1800', '0.1800', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.360', '6', '0.360', '37', '50000', ''),
(971, '976', 976, 'it976', NULL, 0, 0, 0.00, '0.2300', '0.2300', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.410', '6', '0.410', '37', '50000', ''),
(972, '977', 977, 'it977', NULL, 0, 0, 0.00, '0.1700', '0.1700', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.350', '6', '0.350', '37', '50000', ''),
(973, '978', 978, 'it978', NULL, 0, 0, 0.00, '1.8000', '1.8000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '1.980', '6', '1.980', '37', '25000', ''),
(974, '979', 979, 'it979', NULL, 0, 0, 0.00, '0.3200', '0.3200', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.500', '6', '0.500', '37', '20000', ''),
(975, '980', 980, 'it980', NULL, 0, 0, 0.00, '0.2800', '0.2800', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.460', '6', '0.460', '37', '20000', ''),
(976, '981', 981, 'it981', NULL, 0, 0, 0.00, '0.3600', '0.3600', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.540', '6', '0.540', '37', '20000', ''),
(977, '982', 982, 'it982', NULL, 0, 0, 0.00, '2450.0000', '2450.0000', '0.0000', NULL, NULL, 17, NULL, NULL, NULL, 0, '0', '2450.180', '6', '2450.180', '37', '10', ''),
(978, '983', 983, 'it983', NULL, 0, 0, 50000.00, '0.1000', '0.1000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.280', '6', '0.280', '37', '0', ''),
(979, '984', 984, 'it984', NULL, 0, 0, 80000.00, '0.3300', '0.3300', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '0.370', '6', '0.370', '17', '0', ''),
(980, '985', 985, 'it985', NULL, 0, 0, 1.00, '20700.0000', '20700.0000', '0.0000', NULL, NULL, 22, NULL, NULL, NULL, 0, '0', '20701.000', '6', '20701.000', '75', '0', ''),
(981, '986', 986, 'it986', NULL, 0, 0, 10.00, '149.7000', '149.7000', '0.0000', NULL, NULL, 5, NULL, NULL, NULL, 0, '0', '160.700', '5', '8517.100', '7', '0', ''),
(982, '', 987, 'it987', NULL, 0, 0, 2.00, '29000.0000', '29000.0000', '0.0000', NULL, NULL, 17, NULL, NULL, NULL, 0, '0', '31500.000', '7', '31500.000', '45', '0', ''),
(983, '988', 988, 'it988', NULL, 0, 0, 1.00, '16500.0000', '16500.0000', '0.0000', NULL, NULL, 17, NULL, NULL, NULL, 0, '0', '19000.000', '6', '19000.000', '45', '0', ''),
(984, '989', 989, 'it989', NULL, 0, 0, 0.00, '19000.0000', '19000.0000', '0.0000', NULL, NULL, 17, NULL, NULL, NULL, 0, '0', '21500.000', '6', '21500.000', '45', '0', ''),
(985, '990', 990, 'it990', NULL, 0, 0, 20000.00, '1.3500', '1.3500', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '1.530', '6', '1.530', '37', '0', ''),
(986, '991', 991, 'it991', NULL, 0, 0, 5.00, '850.0000', '850.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '1550.000', '6', '1550.000', '33', '0', ''),
(987, '992', 992, 'it992', NULL, 0, 0, 5.00, '950.0000', '950.0000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '1650.000', '6', '1650.000', '33', '0', ''),
(988, '', 993, 'it993', NULL, 0, 0, 1000.00, '71.5000', '71.5000', '0.0000', NULL, NULL, 9, NULL, NULL, NULL, 0, '0', '72.500', '6', '72.500', '76', '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `pos_logistics_fees`
--

CREATE TABLE `pos_logistics_fees` (
  `id` int(100) NOT NULL,
  `company_id` int(255) NOT NULL,
  `receiving_id` varchar(100) NOT NULL,
  `shipping` varchar(100) DEFAULT NULL,
  `billing_company` varchar(100) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `comments` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_logistics_fees`
--

INSERT INTO `pos_logistics_fees` (`id`, `company_id`, `receiving_id`, `shipping`, `billing_company`, `payment_date`, `payment_status`, `reference_no`, `date_created`, `total`, `comments`) VALUES
(10, 21, '110', 'Air', 'FEDERAL EXPRESS PACIFIC LLC', '2021-06-08 00:00:00', 'Paid', '760331039', '2021-03-10', '76499.10', NULL),
(11, 21, '78', 'Air', 'KERRY LOGISTICS PHILS INC', '2021-03-09 00:00:00', 'Paid', '0023949', '2021-03-10', '27751.74', NULL),
(12, 21, '302', NULL, 'KERRY LOGISTICS PHILS INC', '2021-12-07 00:00:00', 'Paid', 'SBIA024264', '2021-07-11', '84906.89', NULL),
(13, 21, '340', 'Air', 'FEDEX', '2021-10-19 00:00:00', 'Paid', '760363304', '2021-09-21', '68120.00', NULL),
(14, 21, '339', 'Air', 'FEDEX', '2021-10-19 00:00:00', 'Paid', '760363304', '2021-09-21', '68120.00', NULL),
(15, 21, '332', 'Air', 'FEDERAL EXPRESS PACIFIC LLC', '2021-09-22 00:00:00', 'Paid', '760358793', '2021-09-21', '66533.70', NULL),
(16, 21, '498', NULL, 'DHL EXPRESS PHILS CORP', '2021-12-13 00:00:00', 'Paid', 'MNLIR01310692', '2022-01-11', '104494.90', NULL),
(17, 21, '416', NULL, 'FEDERAL EXPRESS PACIFIC LLC', '2021-12-21 00:00:00', 'Paid', '283318984569', '2022-01-11', '33076.75', NULL),
(18, 21, '457', 'Local', 'KERRY LOGISTICS PHILS INC', '2022-01-12 00:00:00', 'Paid', 'SBIA024811', '2022-01-11', '142793.12', NULL),
(19, 21, '578', NULL, 'KERRY LOGISTICS PHILS INC', '2022-04-06 00:00:00', 'Paid', 'SBIA025067', '2022-04-06', '398589.92', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pos_purchase_requests`
--

CREATE TABLE `pos_purchase_requests` (
  `id` int(100) NOT NULL,
  `company_id` int(255) NOT NULL,
  `item_id` int(200) NOT NULL,
  `qty` decimal(10,3) DEFAULT NULL,
  `unit_id` varchar(100) DEFAULT NULL,
  `current_stock` decimal(10,3) DEFAULT NULL,
  `department_id` int(150) DEFAULT NULL,
  `requirements` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `created_by` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_purchase_requests`
--

INSERT INTO `pos_purchase_requests` (`id`, `company_id`, `item_id`, `qty`, `unit_id`, `current_stock`, `department_id`, `requirements`, `status`, `request_date`, `date_created`, `created_by`) VALUES
(11, 0, 865, '320000.000', '9', NULL, 3, 'Production', 'PO Made', '2021-03-18', '2021-03-18', 'Francis'),
(14, 0, 542, '50.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-03-22', '2021-03-22', 'Jarred - c/o Francis'),
(15, 0, 578, '5.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-03-22', '2021-03-22', 'Jarred c/o Francis'),
(16, 0, 560, '5.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-03-22', '2021-03-22', 'Jarred c/o Francis'),
(17, 0, 749, '10.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-03-22', '2021-03-22', 'Jarred c/o Francis'),
(19, 0, 696, '50.000', '5', NULL, 3, 'Production', 'PO Made', '2021-03-23', '2021-03-23', 'Jarred c/o Jarred'),
(21, 0, 763, '15.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-03-23', '2021-03-23', 'Jarred c/o Francis'),
(22, 0, 867, '200000.000', '9', NULL, 3, 'Production', 'PO Made', '2021-03-23', '2021-03-23', 'Jarred c/o Francis'),
(23, 0, 791, '25.000', '6', NULL, 3, 'Production', 'PO Made', '2021-03-23', '2021-03-23', 'Jarred c/o Francis'),
(25, 0, 615, '3.000', '5', NULL, 10, 'Restock', 'PO Made', '2021-04-20', '2021-04-20', 'Francis'),
(26, 0, 897, '1.000', '5', NULL, 10, 'Production', 'PO Made', '2021-04-20', '2021-04-20', 'Francis'),
(27, 0, 899, '3.000', '5', NULL, 10, 'Restock', 'PO Made', '2021-04-21', '2021-04-21', 'Francis'),
(28, 0, 696, '95.000', '32', NULL, 3, 'Production', 'PO Made', '2021-06-07', '2021-06-07', 'Jarred'),
(29, 0, 791, '30.000', '32', NULL, 3, 'Production', 'PO Made', '2021-06-07', '2021-06-07', 'Jarred'),
(30, 0, 542, '30.000', '32', NULL, 3, 'Production', 'PO Made', '2021-06-07', '2021-06-07', 'Jarred'),
(31, 0, 548, '7.000', '32', NULL, 3, 'Production', 'PO Made', '2021-06-07', '2021-06-07', 'Jarred'),
(32, 0, 875, '40.000', '32', NULL, 3, 'Production', 'PO Made', '2021-06-07', '2021-06-07', 'Jarred'),
(33, 0, 526, '30.000', '32', NULL, 3, 'Production', 'PO Made', '2021-06-07', '2021-06-07', 'Jarred'),
(34, 0, 909, '5.000', '32', NULL, 3, 'Production', 'PO Made', '2021-06-07', '2021-06-07', 'Jarred'),
(35, 0, 863, '100000.000', '31', NULL, 3, 'Production', 'PO Made', '2021-06-07', '2021-06-07', 'Jarred'),
(36, 0, 867, '300000.000', '31', NULL, 3, 'Production', 'PO Made', '2021-06-07', '2021-06-07', 'Jarred'),
(37, 0, 833, '30000.000', '31', NULL, 2, 'Restock', 'PO Made', '2021-06-09', '2021-06-09', 'Jarred'),
(38, 0, 845, '10000.000', '31', NULL, 2, 'Restock', 'PO Made', '2021-06-09', '2021-06-09', 'Jarred'),
(39, 0, 864, '100000.000', '9', NULL, 2, 'Restock', 'PO Made', '2021-07-02', '2021-07-01', 'Princess'),
(40, 0, 862, '100000.000', '9', NULL, 2, 'Restock', 'PO Made', '2021-07-02', '2021-07-01', 'Princess'),
(44, 0, 882, '5000.000', '9', NULL, 2, 'Restock', 'PO Made', '2021-07-25', '2021-07-25', 'Princess'),
(45, 0, 526, '30.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(46, 0, 540, '20.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(47, 0, 541, '60.000', '5', NULL, 3, 'Production', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(48, 0, 549, '35.000', '5', NULL, 3, 'Production', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(49, 0, 542, '20.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(50, 0, 875, '20.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(52, 0, 666, '20.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(53, 0, 716, '5.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(54, 0, 698, '10.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(56, 0, 742, '20.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(57, 0, 785, '10.000', '5', NULL, 3, 'Restock', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(59, 0, 855, '50000.000', '8', NULL, 2, 'Production', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(60, 0, 833, '20000.000', '8', NULL, 2, 'Restock', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(61, 0, 845, '20000.000', '8', NULL, 2, 'Restock', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(64, 0, 806, '30.000', '5', NULL, 10, 'Production', 'PO Made', '2021-10-19', '2021-10-19', 'Francis'),
(66, 0, 600, '50.000', '5', '0.000', 3, 'Restock', 'PO Made', '2022-01-17', '2022-01-17', 'Francis'),
(68, 0, 774, '5.000', '6', '0.000', 3, 'Restock', 'PO Made', '2022-01-17', '2022-01-17', 'Francis'),
(70, 0, 657, '15.000', '5', '0.000', 3, 'Restock', 'PO Made', '2022-01-17', '2022-01-17', 'Francis'),
(71, 0, 666, '10.000', '5', '0.000', 3, 'Restock', 'PO Made', '2022-01-17', '2022-01-17', 'Francis'),
(73, 0, 742, '10.000', '7', NULL, 3, 'Restock', 'PO Made', '2022-01-17', '2022-01-17', 'Francis'),
(74, 0, 887, '5.000', '9', '0.000', 2, 'Restock', 'PO Made', '2022-01-17', '2022-01-17', 'Francis'),
(75, 0, 908, '20000.000', '9', '0.000', 2, 'Restock', 'PO Made', '2022-01-17', '2022-01-17', 'Francis'),
(76, 0, 865, '78000.000', '9', '0.000', 2, 'Restock', 'PO Made', '2022-01-17', '2022-01-17', 'Francis'),
(77, 0, 896, '78000.000', '9', '0.000', 2, 'Restock', 'PO Made', '2022-01-17', '2022-01-17', 'Francis'),
(78, 0, 864, '200000.000', '9', '0.000', 2, 'Restock', 'PO Made', '2022-01-17', '2022-01-17', 'Francis'),
(79, 0, 960, '30.000', '32', '0.000', 3, 'Restock', 'PO Made', '2022-01-18', '2022-01-18', 'Francis'),
(80, 0, 569, '10.000', '32', '0.000', 3, 'Restock', 'PO Made', '2022-01-19', '2022-01-19', 'Francis'),
(81, 0, 542, '10.000', '32', '0.000', 3, 'Restock', 'PO Made', '2022-01-19', '2022-01-19', 'Francis'),
(84, 0, 806, '20.000', '32', '0.000', 10, 'Restock', 'PO Made', '2022-01-19', '2022-01-19', 'Francis'),
(85, 0, 645, '5.000', '32', '0.000', 10, 'Restock', 'PO Made', '2022-01-19', '2022-01-19', 'Francis'),
(86, 0, 929, '10.000', '32', '0.000', NULL, 'Restock', 'PO Made', '2022-01-19', '2022-01-19', 'Francis'),
(87, 0, 914, '500.000', '32', '0.000', NULL, 'Restock', 'PO Made', '2022-02-09', '2022-02-09', 'Francis'),
(88, 0, 984, '80000.000', '31', '0.000', NULL, 'Production', 'PO Made', '2022-02-15', '2022-02-15', 'Francis'),
(89, 0, 675, '20.000', '5', '5.000', NULL, 'Restock', 'PO Made', '2022-02-28', '2022-02-28', 'Kristine P. Cejares'),
(90, 0, 875, '30.000', '5', '5.000', NULL, 'Restock', 'PO Made', '2022-02-28', '2022-02-28', 'Kristine P. Cejares'),
(91, 0, 541, '20.000', '5', '7.000', NULL, 'Restock', 'PO Made', '2022-02-28', '2022-02-28', 'Kristine P. Cejares'),
(92, 0, 742, '20.000', '7', '0.000', NULL, 'Restock', 'PO Made', '2022-02-28', '2022-02-28', 'Kristine P. Cejares'),
(93, 0, 754, '50.000', '5', '10.000', NULL, 'Restock', 'PO Made', '2022-02-28', '2022-02-28', 'Kristine P. Cejares'),
(94, 0, 753, '10.000', '5', '8.000', NULL, 'Restock', 'PO Made', '2022-02-28', '2022-02-28', 'Kristine P. Cejares'),
(95, 0, 564, '10.000', '5', '5.000', NULL, 'Restock', 'PO Made', '2022-02-28', '2022-02-28', 'Kristine P. Cejares'),
(96, 0, 863, '200000.000', '9', '70000.000', NULL, 'Restock', 'PO Made', '2022-03-01', '2022-02-28', 'Kristine P. Cejares'),
(97, 0, 867, '100000.000', '9', '180000.000', NULL, 'Restock', 'PO Made', '2022-03-01', '2022-02-28', 'Kristine P. Cejares'),
(98, 0, 833, '30000.000', '6', '21890.000', NULL, 'Restock', 'PO Made', '2022-03-01', '2022-02-28', 'Kristine P. Cejares'),
(99, 0, 668, '10.000', '5', '0.000', NULL, 'Restock', 'PO Made', '2022-03-01', '2022-03-01', 'Kristine P. Cejares'),
(100, 0, 872, '10.000', '5', '0.000', NULL, 'Restock', 'PO Made', '2022-03-01', '2022-03-01', 'Kristine P. Cejares'),
(101, 0, 696, '50.000', '5', '35.000', NULL, 'Restock', 'PO Made', '2022-03-01', '2022-03-01', 'Kristine P. Cejares'),
(102, 0, 638, '10.000', '5', '0.000', NULL, 'Restock', 'On Process', '2022-03-18', '2022-03-18', 'Kristine P. Cejares'),
(104, 0, 580, '50.000', '6', '0.000', NULL, 'Restock', 'PO Made', '2022-03-18', '2022-03-18', 'Kristine P. Cejares'),
(105, 0, 795, '5.000', '6', '0.000', NULL, 'Restock', 'PO Made', '2022-03-18', '2022-03-18', 'Kristine P. Cejares'),
(106, 0, 864, '200000.000', '6', '0.000', NULL, 'Restock', 'PO Made', '2022-03-18', '2022-03-18', 'Kristine P. Cejares'),
(108, 0, 867, '200000.000', '6', '0.000', NULL, 'Restock', 'PO Made', '2022-03-18', '2022-03-18', 'Kristine P. Cejares'),
(109, 0, 862, '100000.000', '6', '0.000', NULL, 'Restock', 'PO Made', '2022-03-18', '2022-03-18', 'Kristine P. Cejares'),
(110, 0, 865, '100000.000', '6', '0.000', NULL, 'Restock', 'PO Made', '2022-03-18', '2022-03-18', 'Kristine P. Cejares'),
(113, 0, 541, '40.000', '5', '5.000', NULL, 'Production', 'PO Made', '2022-03-21', '2022-03-21', 'Kristine P. Cejares'),
(114, 0, 877, '5.000', '6', '0.000', NULL, 'Restock', 'On Process', '2022-03-23', '2022-03-23', 'Kristine P. Cejares'),
(123, 0, 799, '50.000', '6', '3.000', NULL, 'Restock', 'On Process', '2022-03-25', '2022-03-25', 'Kristine P. Cejares'),
(124, 0, 696, '30.000', '32', '0.000', NULL, 'Production', 'PO Made', '2022-03-31', '2022-03-31', 'Francis'),
(125, 0, 542, '30.000', '32', '9.000', NULL, 'Production', 'PO Made', '2022-03-31', '2022-03-31', 'Francis'),
(126, 0, 542, '40.000', '5', '9.000', NULL, 'Restock', 'On Process', '2022-04-05', '2022-04-05', 'Kristine P. Cejares'),
(127, 0, 875, '30.000', '5', '0.000', NULL, 'Restock', 'On Process', '2022-04-05', '2022-04-05', 'Kristine P. Cejares'),
(128, 0, 676, '15.000', '5', '0.000', NULL, 'Restock', 'On Process', '2022-04-05', '2022-04-05', 'Kristine P. Cejares'),
(129, 0, 539, '10.000', '5', '0.000', NULL, 'Restock', 'On Process', '2022-04-05', '2022-04-05', 'Kristine P. Cejares'),
(130, 0, 622, '5.000', '5', '0.000', NULL, 'Restock', 'On Process', '2022-04-05', '2022-04-05', 'Kristine P. Cejares'),
(131, 0, 872, '5.000', '5', '0.000', NULL, 'Restock', 'On Hold', '2022-04-05', '2022-04-05', 'Kristine P. Cejares'),
(132, 0, 650, '5.000', '5', '0.000', NULL, 'Restock', 'On Hold', '2022-04-05', '2022-04-05', 'Kristine P. Cejares'),
(133, 0, 879, '5000.000', '32', '0.000', NULL, 'Production', 'On Process', '2022-04-07', '2022-04-07', 'Francis');

-- --------------------------------------------------------

--
-- Table structure for table `pos_receivings`
--

CREATE TABLE `pos_receivings` (
  `receiving_id` int(10) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(255) NOT NULL,
  `supplier_id` int(10) DEFAULT NULL COMMENT 'ledger_id',
  `supplier_invoice_no` varchar(200) NOT NULL,
  `employee_id` int(10) DEFAULT '0',
  `user_id` int(100) NOT NULL,
  `comment` text,
  `payment_type` varchar(20) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `register_mode` varchar(200) DEFAULT NULL,
  `receiving_date` date NOT NULL,
  `amount_due` double(10,4) NOT NULL,
  `description` text,
  `discount_value` double(10,4) DEFAULT NULL,
  `total_amount` decimal(10,4) DEFAULT '0.0000',
  `paid` decimal(10,4) DEFAULT '0.0000',
  `exchange_rate` decimal(10,5) DEFAULT '1.00000',
  `currency_id` int(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_tax` decimal(10,3) DEFAULT '0.000',
  `shipping` varchar(100) DEFAULT NULL,
  `payment_status` varchar(100) DEFAULT NULL,
  `delivery_status` varchar(100) DEFAULT NULL,
  `coa` tinyint(1) DEFAULT '0',
  `msds` tinyint(1) DEFAULT '0',
  `flowchart` tinyint(1) DEFAULT '0',
  `forme` tinyint(1) DEFAULT '0',
  `halal` tinyint(1) DEFAULT '0',
  `eta` varchar(100) DEFAULT NULL,
  `etd` varchar(100) DEFAULT NULL,
  `awb` varchar(50) DEFAULT NULL,
  `quotation` varchar(100) DEFAULT NULL,
  `shipping_cost` decimal(10,3) NOT NULL DEFAULT '0.000',
  `delivery_date` varchar(100) DEFAULT NULL,
  `ssdt` varchar(256) DEFAULT NULL,
  `fan` varchar(256) DEFAULT NULL,
  `supplier_pi` varchar(200) DEFAULT NULL,
  `quotation_file` varchar(100) DEFAULT NULL,
  `payment_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_receivings`
--

INSERT INTO `pos_receivings` (`receiving_id`, `invoice_no`, `receiving_time`, `company_id`, `supplier_id`, `supplier_invoice_no`, `employee_id`, `user_id`, `comment`, `payment_type`, `account`, `register_mode`, `receiving_date`, `amount_due`, `description`, `discount_value`, `total_amount`, `paid`, `exchange_rate`, `currency_id`, `created_on`, `total_tax`, `shipping`, `payment_status`, `delivery_status`, `coa`, `msds`, `flowchart`, `forme`, `halal`, `eta`, `etd`, `awb`, `quotation`, `shipping_cost`, `delivery_date`, `ssdt`, `fan`, `supplier_pi`, `quotation_file`, `payment_date`) VALUES
(78, 'PO-21.002', '2021-02-18 09:36:21', 21, 25, 'PO-21.002', 0, 26, NULL, NULL, 'cash', 'receive', '2021-01-05', 0.0000, '', 0.0000, '2000.0000', '0.0000', '0.00000', 38, '2021-02-18 09:36:21', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 1, 1, 1, '02/18/2021', '02/05/2021', '157-15131174', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'PO-21.001', '2021-02-19 06:02:41', 21, 52, 'PO-21.001', 0, 12, NULL, NULL, 'cash', 'receive', '2021-01-06', 0.0000, '', 0.0000, '9296.0000', '0.0000', '0.00000', 95, '2021-02-19 06:02:41', '0.000', 'Air', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(98, 'PO-21.010', '2021-02-24 06:24:33', 21, 8, 'PO-21.010', 0, 12, NULL, NULL, 'cash', 'receive', '2021-02-23', 0.0000, '', 0.0000, '18575.2000', '0.0000', '0.00000', 95, '2021-02-24 06:24:33', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'PO-21.014', '2021-02-24 06:54:45', 21, 8, 'PO-21.014', 0, 25, NULL, NULL, 'cash', 'receive', '2021-02-15', 0.0000, '', 0.0000, '40096.0000', '0.0000', '0.00000', 95, '2021-02-24 06:54:45', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(110, 'PO-21.005', '2021-02-26 00:21:38', 21, 7, 'PO-21.005', 0, 26, NULL, NULL, 'cash', 'receive', '2021-01-19', 0.0000, '', 0.0000, '11597.6000', '0.0000', '0.00000', 124, '2021-02-26 00:21:38', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 1, 1, 1, '02/24/2021', '02/08/2021', '772842123732', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(111, 'PO-21.006', '2021-02-26 00:22:34', 21, 12, 'PO-21.006', 0, 26, NULL, NULL, 'cash', 'receive', '2021-01-29', 0.0000, '', 0.0000, '14400.0000', '0.0000', '0.00000', 95, '2021-02-26 00:22:34', '0.000', 'Local', 'Paid', 'Delivered', 1, 1, 0, 0, 1, '02/24/2021', '-', '161924594365', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(113, 'PO-21.011', '2021-03-01 01:41:45', 21, 50, 'PO-21.011', 0, 26, NULL, NULL, 'cash', 'receive', '2021-02-13', 0.0000, '', 0.0000, '27500.0000', '0.0000', '0.00000', 95, '2021-03-01 01:41:45', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(136, 'PO-21.018', '2021-03-10 05:46:14', 21, 51, 'PO-21.018', 0, 26, NULL, NULL, 'cash', 'receive', '2021-03-06', 0.0000, '', 0.0000, '10080.0000', '0.0000', '0.00000', 95, '2021-03-10 05:46:14', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '3/10/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(148, 'PO-21.016', '2021-03-15 05:51:00', 21, 42, 'PO-21.016', 0, 12, NULL, NULL, 'cash', 'receive', '2021-02-27', 0.0000, '', 0.0000, '33750.0000', '0.0000', '0.00000', 95, '2021-03-15 05:51:00', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '03/04/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(175, 'PO-21.017', '2021-04-06 06:31:21', 21, 58, 'PO-21.017', 0, 26, NULL, NULL, 'cash', 'receive', '2021-03-03', 0.0000, '', 0.0000, '48007.7200', '0.0000', '0.00000', 95, '2021-04-06 06:31:21', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(177, 'PO-21.019', '2021-04-06 06:32:02', 21, 43, 'PO-21.019', 0, 26, NULL, NULL, 'cash', 'receive', '2021-02-28', 0.0000, '', 0.0000, '63750.4000', '0.0000', '0.00000', 95, '2021-04-06 06:32:02', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '03/25/2021', '-', '925663482', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(196, 'PO-21.012', '2021-04-08 08:55:14', 21, 7, 'PO-21.012', 0, 26, NULL, NULL, 'cash', 'receive', '2021-02-07', 0.0000, '', 0.0000, '1795.0000', '0.0000', '0.00000', 124, '2021-04-08 08:55:14', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 1, 0, '03/26/2021', '-', '773141512130', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(197, 'PO-21.015', '2021-04-08 08:55:55', 21, 17, 'PO-21.015', 0, 26, NULL, NULL, 'cash', 'receive', '2021-02-16', 0.0000, '', 51950.0000, '90050.0000', '0.0000', '0.00000', 95, '2021-04-08 08:55:55', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 1, '-', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(198, 'PO-21.009', '2021-04-08 08:56:30', 21, 49, 'PO-21.009', 0, 26, NULL, NULL, 'cash', 'receive', '2021-02-04', 0.0000, '', 0.0000, '95000.0000', '0.0000', '0.00000', 95, '2021-04-08 08:56:30', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '02/19/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(199, 'PO-21.013', '2021-04-08 08:57:03', 21, 12, 'PO-21.013', 0, 26, NULL, NULL, 'cash', 'receive', '2021-02-06', 0.0000, '', 0.0000, '86250.0000', '0.0000', '0.00000', 95, '2021-04-08 08:57:03', '0.000', 'Local', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '03/30/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(210, 'PO-21.028', '2021-04-15 06:52:33', 21, 17, 'PO-21.028', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-13', 0.0000, '', 0.0000, '108000.0000', '0.0000', '0.00000', 95, '2021-04-15 06:52:33', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '04/15/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(211, 'PO-21.024', '2021-04-15 06:53:04', 21, 17, 'PO-21.024', 0, 26, NULL, NULL, 'cash', 'receive', '2021-03-21', 0.0000, '', 0.0000, '136400.0000', '0.0000', '0.00000', 95, '2021-04-15 06:53:04', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '4/15/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(220, 'PO-21.029', '2021-04-21 02:31:42', 21, 29, 'PO-21.029', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-13', 0.0000, '', 0.0000, '15000.0000', '0.0000', '0.00000', 95, '2021-04-21 02:31:42', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '04/20/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(221, 'PO-21.027', '2021-04-21 02:36:28', 21, 18, 'PO-21.027', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-10', 0.0000, '', 0.0000, '52000.0000', '0.0000', '0.00000', 95, '2021-04-21 02:36:28', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '04/20/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(223, 'PO-21.008', '2021-04-21 02:38:05', 21, 26, 'PO-21.008', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-01', 0.0000, '', 0.0000, '44000.0000', '0.0000', '0.00000', 95, '2021-04-21 02:38:05', '0.000', 'Local', 'Paid', 'Delivered', 1, 1, 0, 0, 1, '04/20/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(227, 'PO-21.030', '2021-04-26 00:37:39', 21, 52, 'PO-21.030', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-17', 0.0000, '', 0.0000, '14876.0000', '0.0000', '0.00000', 95, '2021-04-26 00:37:39', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '04/26/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(228, 'PO-21.031', '2021-04-26 00:40:04', 21, 51, 'PO-21.031', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-19', 0.0000, '', 0.0000, '6720.0000', '0.0000', '0.00000', 95, '2021-04-26 00:40:04', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '04/26/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(229, 'PO-21.022', '2021-04-26 09:13:16', 21, 42, 'PO-21.022', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-03', 0.0000, '', 0.0000, '117000.0000', '0.0000', '0.00000', 95, '2021-04-26 09:13:16', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '4/26/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(232, 'PO-21.032', '2021-04-28 07:27:34', 21, 18, 'PO-21.032', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-24', 0.0000, '', 0.0000, '53500.0000', '0.0000', '0.00000', 95, '2021-04-28 07:27:34', '0.000', 'Local', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '04/27/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(250, 'PO-21.038', '2021-05-12 05:45:00', 21, 17, 'PO-21.038', 0, 26, NULL, NULL, 'cash', 'receive', '2021-05-07', 0.0000, '', 0.0000, '64000.0000', '0.0000', '0.00000', 95, '2021-05-12 05:45:00', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '5/12/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(259, 'PO-21.020', '2021-05-17 06:19:21', 21, 50, 'PO-21.020', 0, 26, NULL, NULL, 'cash', 'receive', '2021-03-17', 0.0000, '', 0.0000, '14500.0000', '0.0000', '0.00000', 95, '2021-05-17 06:19:21', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(260, 'PO-21.021', '2021-05-17 06:21:29', 21, 59, 'PO-21.021', 0, 26, NULL, NULL, 'cash', 'receive', '2021-03-17', 0.0000, '', 0.0000, '157875.0000', '0.0000', '0.00000', 95, '2021-05-17 06:21:29', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(261, 'PO-21.040', '2021-05-19 01:43:19', 21, 8, 'PO-21.040', 0, 26, NULL, NULL, 'cash', 'receive', '2021-05-13', 0.0000, '', 0.0000, '14228.0000', '0.0000', '0.00000', 95, '2021-05-19 01:43:19', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(262, 'PO-21.023', '2021-05-19 05:45:53', 21, 7, 'PO-21.023', 0, 26, NULL, NULL, 'cash', 'receive', '2021-03-18', 0.0000, '', 0.0000, '8358.0000', '0.0000', '0.00000', 124, '2021-05-19 05:45:53', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 1, 0, '05/08/2021', '-', '773397834429', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(266, 'PO-21.035', '2021-05-21 02:27:25', 21, 59, 'PO-21.035', 0, 26, NULL, NULL, NULL, 'receive', '2021-04-28', 0.0000, '', 0.0000, '127750.0000', '0.0000', '0.00000', 95, '2021-05-21 02:27:25', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '5/21/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(271, 'PO-21.036', '2021-05-26 05:24:32', 21, 61, 'PO-21.036', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-23', 0.0000, '', 0.0000, '756.0000', '0.0000', '0.00000', 124, '2021-05-26 05:24:32', '0.000', 'Air', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '5/25/2021', '-', '773748677392', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(278, 'PO-21.037', '2021-06-07 02:46:55', 21, 7, 'PO-21.037', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-28', 0.0000, '', 0.0000, '10116.9000', '0.0000', '0.00000', 124, '2021-06-07 02:46:55', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 1, 1, '-', '6/7/2021', '773711083203', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(279, 'PO-21.033', '2021-06-07 08:13:29', 21, 60, 'PO-21.033', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-21', 0.0000, '', 0.0000, '750.0000', '0.0000', '0.00000', 124, '2021-06-07 08:13:29', '0.000', 'Air', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '6/7/2021', '-', '812812179876', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(283, 'PO-21.044', '2021-06-10 02:39:30', 21, 49, 'PO-21.044', 0, 26, NULL, NULL, 'cash', 'receive', '2021-05-30', 0.0000, '', 0.0000, '100000.0000', '0.0000', '0.00000', 95, '2021-06-10 02:39:30', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '6/5/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(288, 'PO-21.047', '2021-06-15 05:54:55', 21, 29, 'PO-21.047', 0, 26, NULL, NULL, 'cash', 'receive', '2021-06-08', 0.0000, '', 0.0000, '15000.0000', '0.0000', '0.00000', 95, '2021-06-15 05:54:55', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '6/15/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(293, 'PO-21.043', '2021-06-16 09:06:47', 21, 51, 'PO-21.043', 0, 26, NULL, NULL, 'cash', 'receive', '2021-05-22', 0.0000, '', 0.0000, '9690.0000', '0.0000', '0.00000', 95, '2021-06-16 09:06:47', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '6/16/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(295, 'PO-21.039', '2021-06-17 05:41:32', 21, 31, 'PO-21.039', 0, 26, NULL, NULL, 'cash', 'receive', '2021-05-08', 0.0000, '', 0.0000, '186.9000', '0.0000', '0.00000', 124, '2021-06-17 05:41:32', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 0, 1, '6/17/2021', '-', '7876 3861 2115', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(297, 'PO-21.042', '2021-06-18 03:07:50', 21, 37, 'PO-21.042', 0, 26, NULL, NULL, 'cash', 'receive', '2021-05-17', 0.0000, '', 0.0000, '16000.0000', '0.0000', '0.00000', 95, '2021-06-18 03:07:50', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '6/17/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(302, 'PO-21.004', '2021-06-27 12:47:46', 21, 34, 'PO-21.004', 0, 26, NULL, NULL, 'cash', 'receive', '2021-03-19', 0.0000, '', 100.0000, '7900.0000', '0.0000', '0.00000', 124, '2021-06-27 12:47:46', '0.000', 'By Sea', 'Paid', 'Delivered', 0, 0, 0, 1, 0, '06/02/2021', '-', '-', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(314, 'PO-21.051', '2021-06-30 09:56:09', 21, 52, 'PO-21.051', 0, 26, NULL, NULL, 'cash', 'receive', '2021-06-15', 0.0000, '', 0.0000, '27380.0000', '0.0000', '0.00000', 95, '2021-06-30 09:56:09', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '6/30/2021', '6/30/2021', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(316, 'PO-21.053', '2021-07-06 00:58:50', 21, 8, 'PO-21.053', 0, 26, NULL, NULL, 'cash', 'receive', '2021-06-27', 0.0000, '', 0.0000, '57536.5500', '0.0000', '0.00000', 95, '2021-07-06 00:58:50', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '7/1/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(319, 'PO-21.055', '2021-07-12 04:31:19', 21, 29, 'PO-21.055', 0, 26, NULL, NULL, 'cash', 'receive', '2021-07-07', 0.0000, '', 0.0000, '278500.0000', '0.0000', '0.00000', 124, '2021-07-12 04:31:19', '0.000', 'Local', 'Paid', 'Delivered', 1, 1, 0, 0, 1, '7/12/2021', '7/09/2021', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(328, 'PO-21.058', '2021-07-19 00:42:08', 21, 49, 'PO-21.058', 0, 26, NULL, NULL, 'cash', 'receive', '2021-07-11', 0.0000, '', 0.0000, '100000.0000', '0.0000', '0.00000', 95, '2021-07-19 00:42:08', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '7/15/2021', '7/15/2021', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(329, 'PO-21.056', '2021-07-19 04:34:53', 21, 57, 'PO-21.056', 0, 26, NULL, NULL, 'cash', 'receive', '2021-07-11', 0.0000, '', 0.0000, '13500.0000', '0.0000', '0.00000', 95, '2021-07-19 04:34:53', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '7/18/2021', '7/18/2021', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(331, 'PO-21.057', '2021-07-19 04:37:26', 21, 64, 'PO-21.057', 0, 26, NULL, NULL, 'cash', 'receive', '2021-07-12', 0.0000, '', 0.0000, '17500.0000', '0.0000', '0.00000', 95, '2021-07-19 04:37:26', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '7/16/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(332, 'PO-21.045', '2021-07-22 01:22:12', 21, 7, 'PO-21.045', 0, 26, NULL, NULL, 'cash', 'receive', '2021-06-08', 0.0000, '', 0.0000, '14580.0000', '0.0000', '0.00000', 124, '2021-07-22 01:22:12', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 1, 1, '6/20/2021', '7/22/2021', '774047593846', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(337, 'PO-21.063', '2021-07-29 02:00:18', 21, 50, 'PO-21.063', 0, 26, NULL, NULL, 'cash', 'receive', '2021-07-26', 0.0000, '', 0.0000, '8100.0000', '0.0000', '0.00000', 95, '2021-07-29 02:00:18', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '7/29/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(338, 'PO-21.060', '2021-07-29 05:56:05', 21, 17, 'PO-21.060', 0, 26, NULL, NULL, 'cash', 'receive', '2021-07-13', 0.0000, '', 0.0000, '87000.0000', '0.0000', '0.00000', 95, '2021-07-29 05:56:05', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '7/15/2021', '7/15/2021', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(339, 'PO-21.052', '2021-07-29 07:18:15', 21, 62, 'PO-21.052', 0, 26, NULL, NULL, 'cash', 'receive', '2021-06-23', 0.0000, '', 0.0000, '200.2000', '0.0000', '0.00000', 124, '2021-07-29 07:18:15', '0.000', 'Air', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '7/29/2021', '7/7/2021', '774252302943', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(340, 'PO-21.050', '2021-07-29 07:19:04', 21, 62, 'PO-21.050', 0, 26, NULL, NULL, 'cash', 'receive', '2021-06-22', 0.0000, '', 0.0000, '908.2000', '0.0000', '0.00000', 124, '2021-07-29 07:19:04', '0.000', 'Air', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '7/29/2021', '7/7/2021', '774252302943', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(341, 'PO-21.059', '2021-07-29 07:28:42', 21, 50, 'PO-21.059', 0, 26, NULL, NULL, 'cash', 'receive', '2021-07-14', 0.0000, '', 0.0000, '8100.0000', '0.0000', '0.00000', 95, '2021-07-29 07:28:42', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 1, '7/19/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(343, 'PO-21.061', '2021-08-02 02:49:52', 21, 42, 'PO-21.061', 0, 26, NULL, NULL, 'cash', 'receive', '2021-07-26', 0.0000, '', 0.0000, '33750.0000', '0.0000', '0.00000', 95, '2021-08-02 02:49:52', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '7/31/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(346, 'PO-21.062', '2021-08-03 06:09:05', 21, 29, 'PO-21.062', 0, 26, NULL, NULL, 'cash', 'receive', '2021-07-26', 0.0000, '', 0.0000, '3900.0000', '0.0000', '0.00000', 95, '2021-08-03 06:09:05', '0.000', 'Local', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '8/3/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(348, 'PO-21.064', '2021-08-04 06:06:29', 21, 65, 'PO-21.064', 0, 26, NULL, NULL, 'cash', 'receive', '2021-07-26', 0.0000, '', 0.0000, '50000.0000', '0.0000', '0.00000', 95, '2021-08-04 06:06:29', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '8/3/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(352, 'PO-21.049', '2021-08-10 09:16:14', 21, 27, 'PO-21.049', 0, 26, NULL, NULL, 'cash', 'receive', '2021-06-10', 0.0000, '', 0.0000, '1800.0000', '0.0000', '0.00000', 124, '2021-08-10 09:16:14', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '-', '-', '774265313046', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(360, 'PO-21.046', '2021-08-21 05:52:25', 21, 34, 'PO-21.046', 0, 26, NULL, NULL, 'cash', 'receive', '2021-06-06', 0.0000, '', 0.0000, '5950.0000', '0.0000', '0.00000', 124, '2021-08-21 05:52:25', '0.000', 'By Sea', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '8/21/2021', '07/07/2021', '-', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(361, 'PO-21.066', '2021-08-21 05:53:05', 21, 19, 'PO-21.066', 0, 26, NULL, NULL, 'cash', 'receive', '2021-08-03', 0.0000, '', 0.0000, '55000.0000', '0.0000', '0.00000', 95, '2021-08-21 05:53:05', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '8/21/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(362, 'PO-21.069', '2021-08-21 05:53:43', 21, 43, 'PO-21.069', 0, 26, NULL, NULL, 'cash', 'receive', '2021-08-10', 0.0000, '', 0.0000, '19689.6000', '0.0000', '0.00000', 95, '2021-08-21 05:53:43', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '8/20/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(364, 'PO-21.070', '2021-08-23 11:18:32', 21, 29, 'PO-21.070', 0, 26, NULL, NULL, 'cash', 'receive', '2021-08-10', 0.0000, '', 0.0000, '748.0000', '0.0000', '0.00000', 95, '2021-08-23 11:18:32', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 1, '8/23/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(368, 'PO-21.067', '2021-08-27 04:34:07', 21, 40, 'PO-21.067', 0, 26, NULL, NULL, 'cash', 'receive', '2021-08-09', 0.0000, '', 0.0000, '167500.0000', '0.0000', '0.00000', 95, '2021-08-27 04:34:07', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '8/27/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(369, 'PO-21.072', '2021-08-27 05:51:53', 21, 17, 'PO-21.072', 0, 26, NULL, NULL, 'cash', 'receive', '2021-08-17', 0.0000, '', 0.0000, '102000.0000', '0.0000', '0.00000', 95, '2021-08-27 05:51:53', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '8/27/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(370, 'PO-21.073', '2021-08-27 05:52:25', 21, 19, 'PO-21.073', 0, 26, NULL, NULL, 'cash', 'receive', '2021-08-22', 0.0000, '', 0.0000, '9300.0000', '0.0000', '0.00000', 95, '2021-08-27 05:52:25', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '8/27/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(373, 'PO-21.065', '2021-09-02 10:15:14', 21, 64, 'PO-21.065', 0, 26, NULL, NULL, 'cash', 'receive', '2021-08-04', 0.0000, '', 0.0000, '4094.0000', '0.0000', '0.00000', 95, '2021-09-02 10:15:14', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '8/20/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(377, 'PO-21.076', '2021-09-06 01:22:21', 21, 19, 'PO-21.076', 0, 26, NULL, NULL, 'cash', 'receive', '2021-08-30', 0.0000, '', 0.0000, '18600.0000', '0.0000', '0.00000', 95, '2021-09-06 01:22:21', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '9/6/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(378, 'PO-21.034', '2021-09-06 01:26:45', 21, 50, 'PO-21.034', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-26', 0.0000, '', 0.0000, '14500.0000', '0.0000', '0.00000', 95, '2021-09-06 01:26:45', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '4/30/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(380, 'PO-21.074', '2021-09-06 01:33:53', 21, 66, 'PO-21.074', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-05', 0.0000, '', 0.0000, '7150.0000', '0.0000', '0.00000', 95, '2021-09-06 01:33:53', '0.000', 'Local', 'Paid', 'Delivered', 1, 1, 0, 0, 1, '9/6/2021', '-', '161924730821', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(381, 'PO-21.077', '2021-09-06 01:35:55', 21, 64, 'PO-21.077', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-01', 0.0000, '', 0.0000, '3400.0000', '0.0000', '0.00000', 95, '2021-09-06 01:35:55', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '9/06/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(384, 'PO-21.080', '2021-09-10 06:03:08', 21, 17, 'PO-21.080', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-08', 0.0000, '', 0.0000, '30000.0000', '0.0000', '0.00000', 95, '2021-09-10 06:03:08', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '9/10/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(389, 'PO-21.079', '2021-09-10 06:35:11', 21, 19, 'PO-21.079', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-06', 0.0000, '', 0.0000, '31000.0000', '0.0000', '0.00000', 95, '2021-09-10 06:35:11', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '9/10/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(394, 'PO-21.068', '2021-09-24 07:31:16', 21, 50, 'PO-21.068', 0, 26, NULL, NULL, 'cash', 'receive', '2021-08-09', 0.0000, '', 0.0000, '8850.0000', '0.0000', '0.00000', 95, '2021-09-24 07:31:16', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '8/15/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(395, 'PO-21.048', '2021-09-24 07:32:04', 21, 17, 'PO-21.048', 0, 26, NULL, NULL, 'cash', 'receive', '2021-06-13', 0.0000, '', 0.0000, '66000.0000', '0.0000', '0.00000', 95, '2021-09-24 07:32:04', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '6/15/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(397, 'PO-21.081', '2021-09-28 02:55:45', 21, 29, 'PO-21.081', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-08', 0.0000, '', 0.0000, '75000.0000', '0.0000', '0.00000', 95, '2021-09-28 02:55:45', '0.000', 'Local', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '09/10/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(404, 'PO-21.082', '2021-09-30 14:09:15', 21, 7, 'PO-21.082', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-09', 0.0000, '', 0.0000, '60.0000', '0.0000', '0.00000', 124, '2021-09-30 14:09:15', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '-', '-', '774790959027', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(405, 'PO-21.087', '2021-10-01 06:10:08', 21, 17, 'PO-21.087', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-26', 0.0000, '', 0.0000, '68000.0000', '0.0000', '0.00000', 95, '2021-10-01 06:10:08', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '9/30/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(406, 'PO-21.086', '2021-10-01 06:10:39', 21, 29, 'PO-21.086', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-25', 0.0000, '', 0.0000, '42000.0000', '0.0000', '0.00000', 95, '2021-10-01 06:10:39', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '9/30/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(408, 'PO-21.088', '2021-10-01 07:38:44', 21, 40, 'PO-21.088', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-01', 0.0000, '', 0.0000, '11250.0000', '0.0000', '0.00000', 95, '2021-10-01 07:38:44', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '9/30/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(410, 'PO-21.090', '2021-10-01 07:41:50', 21, 50, 'PO-21.090', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-30', 0.0000, '', 0.0000, '3300.0000', '0.0000', '0.00000', 95, '2021-10-01 07:41:50', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '10/1/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(412, 'PO-21.092', '2021-10-06 05:51:17', 21, 49, 'PO-21.092', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-02', 0.0000, '', 0.0000, '110000.0000', '0.0000', '0.00000', 95, '2021-10-06 05:51:17', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '10/7/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(416, 'PO-21.075', '2021-10-12 07:31:23', 21, 31, 'PO-21.075', 0, 26, NULL, NULL, 'cash', 'receive', '2021-08-27', 0.0000, '', 0.0000, '2626.0000', '0.0000', '0.00000', 124, '2021-10-12 07:31:23', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 0, 1, '10/8/2021', '-', '283318984569', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(417, 'PO-21.071', '2021-10-13 06:04:06', 21, 7, 'PO-21.071', 0, 26, NULL, NULL, 'cash', 'receive', '2021-08-09', 0.0000, '', 0.0000, '4247.5000', '0.0000', '0.00000', 124, '2021-10-13 06:04:06', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 1, 1, '10/8/2021', '9/1/2021', '774653667707', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(420, 'PO-21.096', '2021-10-18 06:06:12', 21, 50, 'PO-21.096', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-11', 0.0000, '', 0.0000, '9900.0000', '0.0000', '0.00000', 95, '2021-10-18 06:06:12', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '11/12/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(421, 'PO-21.093', '2021-10-18 06:10:18', 21, 64, 'PO-21.093', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-05', 0.0000, '', 0.0000, '16622.5000', '0.0000', '0.00000', 95, '2021-10-18 06:10:18', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '10/8/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(422, 'PO-21.091', '2021-10-18 06:12:16', 21, 63, 'PO-21.091', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-01', 0.0000, '', 0.0000, '15000.0000', '0.0000', '0.00000', 95, '2021-10-18 06:12:16', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '10/7/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(423, 'PO-21.085', '2021-10-19 02:40:06', 21, 28, 'PO-21.085', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-24', 0.0000, '', 0.0000, '8505.0000', '0.0000', '0.00000', 95, '2021-10-19 02:40:06', '0.000', 'Local', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '10/6/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(424, 'PO-21.089', '2021-10-19 03:13:32', 21, 19, 'PO-21.089', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-30', 0.0000, '', 0.0000, '31000.0000', '0.0000', '0.00000', 95, '2021-10-19 03:13:32', '0.000', 'Local', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '10/6/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(425, 'PO-21.078', '2021-10-20 05:13:41', 21, 53, 'PO-21.078', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-02', 0.0000, '', 0.0000, '42000.0000', '0.0000', '0.00000', 95, '2021-10-20 05:13:41', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '9/27/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(426, 'PO-21.094', '2021-10-20 05:26:34', 21, 52, 'PO-21.094', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-09', 0.0000, '', 0.0000, '7200.0000', '0.0000', '0.00000', 95, '2021-10-20 05:26:34', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '10/15/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(431, 'PO-21.100', '2021-10-26 07:22:23', 21, 17, 'PO-21.100', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-19', 0.0000, '', 0.0000, '138000.0000', '0.0000', '0.00000', 95, '2021-10-26 07:22:23', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '10/22/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(435, 'PO-21.095', '2021-10-27 03:10:46', 21, 67, 'PO-21.095', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-10', 0.0000, '', 0.0000, '40898.0000', '0.0000', '0.00000', 95, '2021-10-27 03:10:46', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '10/18/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(437, 'PO-21.101', '2021-10-27 06:50:46', 21, 50, 'PO-21.101', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-22', 0.0000, '', 0.0000, '21000.0000', '0.0000', '0.00000', 95, '2021-10-27 06:50:46', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '10/22/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(449, 'PO-21.099', '2021-11-03 06:24:42', 21, 23, 'PO-21.099', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-18', 0.0000, '', 0.0000, '222500.0000', '0.0000', '0.00000', 95, '2021-11-03 06:24:42', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '10/28/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(450, 'PO-21.097', '2021-11-03 06:25:39', 21, 42, 'PO-21.097', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-15', 0.0000, '', 0.0000, '39000.0000', '0.0000', '0.00000', 95, '2021-11-03 06:25:39', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '10/26/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(451, 'PO-21.108', '2021-11-11 06:41:01', 21, 50, 'PO-21.108', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-11', 0.0000, '', 0.0000, '22200.0000', '0.0000', '0.00000', 95, '2021-11-11 06:41:01', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '11/08/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(456, 'PO-21.112', '2021-11-19 02:50:04', 21, 17, 'PO-21.112', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-15', 0.0000, '', 0.0000, '45000.0000', '0.0000', '0.00000', 95, '2021-11-19 02:50:04', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '11/17/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(457, 'PO-21.083', '2021-11-19 02:50:52', 21, 36, 'PO-21.083', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-14', 0.0000, '', 0.0000, '8022.0000', '0.0000', '0.00000', 124, '2021-11-19 02:50:52', '0.000', 'By Sea', 'Paid', 'Delivered', 0, 0, 0, 1, 0, '11/17/2021', '-', '-', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(458, 'PO-21.084', '2021-11-19 02:51:28', 21, 7, 'PO-21.084', 0, 26, NULL, NULL, 'cash', 'receive', '2021-09-20', 0.0000, '', 0.0000, '13500.0000', '0.0000', '0.00000', 124, '2021-11-19 02:51:28', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 1, 1, 0, '10/28/2021', '-', '2497949720', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(459, 'PO-21.111', '2021-11-19 02:52:50', 21, 65, 'PO-21.111', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-14', 0.0000, '', 0.0000, '50000.0000', '0.0000', '0.00000', 95, '2021-11-19 02:52:50', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '11/17/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(460, 'PO-21.107', '2021-11-19 02:53:40', 21, 17, 'PO-21.107', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-23', 0.0000, '', 0.0000, '15000.0000', '0.0000', '0.00000', 95, '2021-11-19 02:53:40', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '11/17/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(461, 'PO-21.106', '2021-11-19 02:58:51', 21, 19, 'PO-21.106', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-23', 0.0000, '', 0.0000, '31000.0000', '0.0000', '0.00000', 95, '2021-11-19 02:58:51', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '11/9/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(463, 'PO-21.114', '2021-11-19 10:29:36', 21, 50, 'PO-21.114', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-17', 0.0000, '', 0.0000, '22200.0000', '0.0000', '0.00000', 95, '2021-11-19 10:29:36', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '11/18/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(467, 'PO-21.026', '2021-11-23 07:37:28', 21, 48, 'PO-21.026', 0, 26, NULL, NULL, 'cash', 'receive', '2021-04-07', 0.0000, '', 0.0000, '545.0000', '0.0000', '0.00000', 124, '2021-11-23 07:37:28', '0.000', 'Air', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '5/10/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(468, 'PO-21.025', '2021-11-23 07:38:37', 21, 48, 'PO-21.025', 0, 26, NULL, NULL, 'cash', 'receive', '2021-03-15', 0.0000, '', 0.0000, '960.0000', '0.0000', '0.00000', 124, '2021-11-23 07:38:37', '0.000', 'Air', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '5/26/2021', '-', '526372189', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(469, 'PO-21.007', '2021-11-23 07:39:31', 21, 48, 'PO-21.007', 0, 26, NULL, NULL, 'cash', 'receive', '2021-02-01', 0.0000, '', 0.0000, '690.0000', '0.0000', '0.00000', 124, '2021-11-23 07:39:31', '0.000', 'Air', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '04/22/2021', '-', '1Z908E986764914598', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(470, 'PO-21.109', '2021-11-23 07:48:47', 21, 68, 'PO-21.109', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-09', 0.0000, '', 0.0000, '21600.0000', '0.0000', '0.00000', 95, '2021-11-23 07:48:47', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '11/10/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(471, 'PO-21.110', '2021-11-23 07:52:29', 21, 63, 'PO-21.110', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-09', 0.0000, '', 0.0000, '17000.0000', '0.0000', '0.00000', 95, '2021-11-23 07:52:29', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '11/16/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(478, 'PO-21.098', '2021-12-01 02:17:31', 21, 48, 'PO-21.098', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-17', 0.0000, '', 0.0000, '360.0000', '0.0000', '0.00000', 124, '2021-12-01 02:17:31', '0.000', 'Air', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '11/30/2021', '-', 'GD403189332WW', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(483, 'PO-21.115', '2021-12-01 02:54:52', 21, 64, 'PO-21.115', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-17', 0.0000, '', 0.0000, '12510.0000', '0.0000', '0.00000', 95, '2021-12-01 02:54:52', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '11/22/2021', '-', '-', 'n/a', '815.500', NULL, NULL, NULL, NULL, NULL, NULL),
(484, 'PO-21.117', '2021-12-02 01:00:19', 21, 17, 'PO-21.117', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-27', 0.0000, '', 0.0000, '108000.0000', '0.0000', '0.00000', 95, '2021-12-02 01:00:19', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '12/1/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(485, 'PO-21.103', '2021-12-02 01:01:08', 21, 7, 'PO-21.103', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-29', 0.0000, '', 0.0000, '8140.2000', '0.0000', '0.00000', 124, '2021-12-02 01:01:08', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 1, 1, '12/1/2021', '-', '7927544730', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(492, 'PO-21.120', '2021-12-10 01:34:18', 21, 50, 'PO-21.120', 0, 26, NULL, NULL, 'cash', 'receive', '2021-12-01', 0.0000, '', 0.0000, '22200.0000', '0.0000', '0.00000', 95, '2021-12-10 01:34:18', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(493, 'PO-21.122', '2021-12-12 12:25:32', 21, 29, 'PO-21.122', 0, 26, NULL, NULL, 'cash', 'receive', '2021-12-05', 0.0000, '', 0.0000, '76500.0000', '0.0000', '0.00000', 95, '2021-12-12 12:25:32', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '12/10/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(494, 'PO-21.119', '2021-12-12 13:04:47', 21, 69, 'PO-21.119', 0, 26, NULL, NULL, 'cash', 'receive', '2021-12-01', 0.0000, '', 0.0000, '35700.0000', '0.0000', '0.00000', 95, '2021-12-12 13:04:47', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '12/10/2021', '-', '-', NULL, '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(495, 'PO-21.118', '2021-12-14 01:19:50', 21, 39, 'PO-21.118', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-28', 0.0000, '', 0.0000, '99000.0000', '0.0000', '0.00000', 95, '2021-12-14 01:19:50', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '12/07/2021', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(498, 'PO-21.113', '2021-12-21 07:52:28', 21, 7, 'PO-21.113', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-16', 0.0000, '', 0.0000, '1062.5000', '0.0000', '0.00000', 124, '2021-12-21 07:52:28', '0.000', 'Air', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '12/21/2021', '-', '-', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(499, 'PO-21.105', '2021-12-21 07:54:10', 21, 30, 'PO-21.105', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-23', 0.0000, '', 0.0000, '4250.0000', '0.0000', '0.00000', 124, '2021-12-21 07:54:10', '0.000', 'Air', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '12/13/2021', '-', '-', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(501, 'PO-21.125', '2021-12-23 01:22:44', 21, 49, 'PO-21.125', 0, 26, NULL, NULL, 'cash', 'receive', '2021-12-13', 0.0000, '', 0.0000, '180000.0000', '0.0000', '0.00000', 95, '2021-12-23 01:22:44', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(502, 'PO-21.041', '2021-12-23 01:24:15', 21, 42, 'PO-21.041', 0, 26, NULL, NULL, 'cash', 'receive', '2021-05-14', 0.0000, '', 0.0000, '0.0000', '0.0000', '0.00000', 95, '2021-12-23 01:24:15', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', 'REFUNDED', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(503, 'PO-21.126', '2022-03-24 10:50:30', 21, 7, 'PO-21.126', 0, 26, NULL, NULL, NULL, 'receive', '2021-12-15', 0.0000, NULL, 0.0000, '5996.5000', '0.0000', '0.00000', 124, '2022-03-24 10:50:30', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 1, 0, '-', '-', '-', 'Approved', '0.000', '03/14/2022', '', '', '', NULL, '-'),
(517, 'PO-21.102', '2022-01-12 06:31:56', 21, 25, 'PO-21.102', 0, 26, NULL, NULL, 'cash', 'receive', '2021-10-21', 0.0000, '', 0.0000, '2000.0000', '0.0000', '0.00000', 38, '2022-01-12 06:31:56', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 1, 1, '01/07/2022', '-', '2452933125', 'Approved', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(525, 'PO-22.009', '2022-03-18 10:36:06', 21, 7, 'PO-22.009', 0, 26, NULL, NULL, NULL, 'receive', '2022-01-21', 0.0000, NULL, 0.0000, '1782.5000', '0.0000', '0.00000', 124, '2022-03-18 10:36:06', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 1, 0, '03/08/2022', '-', '9688401516', 'Approved', '0.000', '03/14/2022', '1fb735e309.pdf', '1fb735e309.pdf', '1fb735e309.pdf', '1fb735e309.pdf', '01/28/2022'),
(538, 'PO-22.004', '2022-01-27 06:33:34', 21, 8, 'PO-22.004', 0, 26, NULL, NULL, 'cash', 'receive', '2022-01-08', 0.0000, '', 0.0000, '13095.1500', '0.0000', '0.00000', 95, '2022-01-27 06:33:34', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 0, 1, '-', '-', '-', 'n/a', '0.000', '01/14/2022', NULL, NULL, NULL, NULL, NULL),
(540, 'PO-22.001', '2022-01-28 08:55:55', 21, 50, 'PO-22.001', 0, 26, NULL, NULL, 'cash', 'receive', '2022-01-10', 0.0000, '', 0.0000, '10500.0000', '0.0000', '0.00000', 95, '2022-01-28 08:55:55', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '01/12/2022', '-', '-', 'n/a', '0.000', '01/12/2022', NULL, NULL, NULL, NULL, NULL),
(541, 'PO-22.005', '2022-04-05 09:23:21', 21, 49, 'PO-22.005', 0, 25, NULL, NULL, NULL, 'receive', '2022-01-12', 0.0000, NULL, 0.0000, '180000.0000', '0.0000', '0.00000', 95, '2022-04-05 09:23:21', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '01/19/2022', '-', '-', 'Pending', '0.000', '01/19/2022', '', '', '', '4218fef8cf.pdf', ''),
(542, 'PO-22.002', '2022-01-28 08:57:53', 21, 64, 'PO-22.002', 0, 26, NULL, NULL, 'cash', 'receive', '2022-01-10', 0.0000, '', 0.0000, '5580.0000', '0.0000', '0.00000', 95, '2022-01-28 08:57:53', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '01/172022', '-', '-', 'n/a', '668.500', '01/17/2022', NULL, NULL, NULL, NULL, NULL),
(543, 'PO-22.006', '2022-01-28 09:04:06', 21, 73, 'PO-22.006', 0, 26, NULL, NULL, 'cash', 'receive', '2022-01-15', 0.0000, '', 0.0000, '2400.0000', '0.0000', '0.00000', 95, '2022-01-28 09:04:06', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '300.000', '01/18/2022', NULL, NULL, NULL, NULL, NULL),
(545, 'PO-22.007', '2022-01-28 09:04:49', 21, 72, 'PO-22.007', 0, 26, NULL, NULL, 'cash', 'receive', '2022-01-17', 0.0000, '', 0.0000, '5008.2000', '0.0000', '0.00000', 95, '2022-01-28 09:04:49', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '01/20/2022', NULL, NULL, NULL, NULL, NULL),
(548, 'PO-22.003', '2022-04-05 09:19:39', 21, 33, 'PO-22.003', 0, 25, NULL, NULL, NULL, 'receive', '2022-01-28', 0.0000, NULL, 0.0000, '20000.0000', '0.0000', '0.00000', 95, '2022-04-05 09:19:39', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '-', '', '', '', '8b898cc8e2.pdf', ''),
(553, 'PO-22.011', '2022-02-01 02:22:22', 21, 64, 'PO-22.011', 0, 25, NULL, NULL, 'cash', 'receive', '2022-01-21', 0.0000, '', 0.0000, '7470.0000', '0.0000', '0.00000', 95, '2022-02-01 02:22:22', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '1062.500', '', NULL, NULL, NULL, NULL, NULL),
(557, 'PO-22.016', '2022-04-05 09:30:22', 21, 74, 'PO-22.016', 0, 25, NULL, NULL, NULL, 'receive', '2022-01-26', 0.0000, NULL, 0.0000, '41850.0000', '0.0000', '0.00000', 95, '2022-04-05 09:30:22', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '', '', '', '', 'fd9f9cdf36.pdf', ''),
(558, 'PO-22.015', '2022-02-04 08:13:39', 21, 8, 'PO-22.015', 0, 25, NULL, NULL, 'cash', 'receive', '2022-01-25', 0.0000, '', 0.0000, '5723.2000', '0.0000', '0.00000', 95, '2022-02-04 08:13:39', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '-', NULL, NULL, NULL, NULL, NULL),
(559, 'PO-22.012', '2022-03-03 10:45:59', 21, 37, 'PO-22.012', 0, 12, NULL, NULL, NULL, 'receive', '2022-01-24', 0.0000, NULL, 0.0000, '13500.0000', '0.0000', '0.00000', 95, '2022-03-03 10:45:59', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '', '', '', '', NULL, NULL),
(565, 'PO-22.018', '2022-02-09 09:13:32', 21, 64, 'PO-22.018', 0, 25, NULL, NULL, 'cash', 'receive', '2022-02-02', 0.0000, '', 0.0000, '2680.0000', '0.0000', '0.00000', 95, '2022-02-09 09:13:32', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '02/10/2022', '-', '-', 'n/a', '520.000', '', NULL, NULL, NULL, NULL, NULL),
(569, 'PO-22.017', '2022-02-11 03:21:36', 21, 50, 'PO-22.017', 0, 25, NULL, NULL, 'cash', 'receive', '2022-01-30', 0.0000, '', 0.0000, '10500.0000', '0.0000', '0.00000', 95, '2022-02-11 03:21:36', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '-', NULL, NULL, NULL, NULL, NULL),
(574, 'PO-22.019', '2022-03-03 10:45:23', 21, 23, 'PO-22.019', 0, 12, NULL, NULL, NULL, 'receive', '2022-02-13', 0.0000, NULL, 0.0000, '110000.0000', '0.0000', '0.00000', 95, '2022-03-03 10:45:23', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '02-14-22', '', '', '', NULL, NULL),
(575, 'PO-21.003', '2022-02-16 03:23:55', 21, 8, 'PO-21.003', 0, 26, NULL, NULL, 'cash', 'receive', '2021-01-11', 0.0000, '', 0.0000, '18575.2000', '0.0000', '0.00000', 95, '2022-02-16 03:23:55', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '', NULL, NULL, NULL, NULL, NULL),
(576, 'PO-21.123', '2022-02-16 03:24:26', 21, 59, 'PO-21.123', 0, 26, NULL, NULL, 'cash', 'receive', '2021-12-04', 0.0000, '', 0.0000, '149850.0000', '0.0000', '0.00000', 95, '2022-02-16 03:24:26', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '', NULL, NULL, NULL, NULL, NULL),
(578, 'PO-21.104', '2022-02-16 03:25:30', 21, 34, 'PO-21.104', 0, 26, NULL, NULL, 'cash', 'receive', '2021-11-17', 0.0000, '', 0.0000, '13550.0000', '0.0000', '0.00000', 124, '2022-02-16 03:25:30', '0.000', 'By Sea', 'Paid', 'Delivered', 0, 0, 0, 1, 0, '-', '-', '-', 'Approved', '0.000', '02/14/2022', NULL, NULL, NULL, NULL, NULL),
(584, 'PO-22.020', '2022-02-21 08:23:11', 21, 52, 'PO-22.020', 0, 25, NULL, NULL, 'cash', 'receive', '2022-02-07', 0.0000, '', 0.0000, '11994.0000', '0.0000', '0.00000', 95, '2022-02-21 08:23:11', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '', NULL, NULL, NULL, NULL, NULL),
(588, 'PO-22.008', '2022-03-24 06:37:41', 21, 25, 'PO-22.008', 0, 26, NULL, NULL, NULL, 'receive', '2022-02-21', 0.0000, NULL, 0.0000, '2150.0000', '0.0000', '0.00000', 38, '2022-03-24 06:37:41', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '03/18/2022', '-', '9660411250', 'n/a', '0.000', '03/23/2022', '3f0ee8cd69.pdf', '43f0ee8cd6.pdf', 'f0ee8cd693.pdf', NULL, '-'),
(589, 'PO-22.013', '2022-03-11 05:41:39', 21, 17, 'PO-22.013', 0, 25, NULL, NULL, NULL, 'receive', '2022-01-26', 0.0000, NULL, 0.0000, '115600.0000', '0.0000', '0.00000', 95, '2022-03-11 05:41:39', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '3-11-22', '', '', '', NULL, '3-11-22'),
(591, 'PO-22.024', '2022-02-22 06:55:38', 21, 17, 'PO-22.024', 0, 26, NULL, NULL, 'cash', 'receive', '2022-02-13', 0.0000, '', 0.0000, '52800.0000', '0.0000', '0.00000', 95, '2022-02-22 06:55:38', '0.000', 'Local', 'Paid', 'Delivered', 1, 0, 0, 0, 0, '02/18/2022', '-', '-', 'n/a', '0.000', '02/18/2022', NULL, NULL, NULL, NULL, NULL),
(594, 'PO-22.010', '2022-03-18 10:53:51', 21, 31, 'PO-22.010', 0, 26, NULL, NULL, NULL, 'receive', '2022-01-21', 0.0000, NULL, 0.0000, '1295.0000', '0.0000', '0.00000', 124, '2022-03-18 10:53:51', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '02/21/2022', '-', '2744032933', 'Approved', '0.000', '02/18/2022', '0a4e5784f3.pdf', '0a4e5784f3.pdf', '0a4e5784f3.pdf', '0a4e5784f3.jpg', ''),
(595, 'PO-22.022', '2022-02-22 07:05:45', 21, 50, 'PO-22.022', 0, 25, NULL, NULL, 'cash', 'receive', '2022-02-06', 0.0000, '', 0.0000, '10500.0000', '0.0000', '0.00000', 95, '2022-02-22 07:05:45', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '02/11/2022', NULL, NULL, NULL, NULL, NULL),
(596, 'PO-22.023', '2022-02-22 07:06:00', 21, 50, 'PO-22.023', 0, 25, NULL, NULL, 'cash', 'receive', '2022-02-18', 0.0000, '', 0.0000, '10500.0000', '0.0000', '0.00000', 95, '2022-02-22 07:06:00', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '', NULL, NULL, NULL, NULL, NULL),
(597, 'PO-22.025', '2022-03-09 09:10:41', 21, 42, 'PO-22.025', 0, 25, NULL, NULL, NULL, 'receive', '2022-02-22', 0.0000, NULL, 0.0000, '32500.0000', '0.0000', '0.00000', 95, '2022-03-09 09:10:41', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '2-22-22', '', '', '', NULL, '2-22-22'),
(598, 'PO-22.014', '2022-02-23 05:19:57', 21, 43, 'PO-22.014', 0, 25, NULL, NULL, 'cash', 'receive', '2022-02-19', 0.0000, '', 0.0000, '16408.0000', '0.0000', '0.00000', 95, '2022-02-23 05:19:57', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '-', NULL, NULL, NULL, NULL, NULL),
(599, 'PO-22.021', '2022-02-23 07:15:30', 21, 75, 'PO-22.021', 0, 25, NULL, NULL, 'cash', 'receive', '2022-02-10', 0.0000, '', 0.0000, '20700.0000', '0.0000', '0.00000', 95, '2022-02-23 07:15:30', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '-', NULL, NULL, NULL, NULL, NULL),
(600, 'PO-22.026', '2022-03-03 10:44:10', 21, 63, 'PO-22.026', 0, 12, NULL, NULL, NULL, 'receive', '2022-02-22', 0.0000, NULL, 0.0000, '53000.0000', '0.0000', '0.00000', 95, '2022-03-03 10:44:10', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '-', '', '', '', NULL, NULL),
(626, 'PO-22.027', '2022-03-09 09:39:59', 21, 8, 'PO-22.027', 0, 25, NULL, NULL, NULL, 'receive', '2022-02-28', 0.0000, NULL, 0.0000, '19595.2000', '0.0000', '0.00000', 95, '2022-03-09 09:39:59', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '03-03-22', '', '', '', NULL, '03/09/22'),
(629, 'PO-22.028', '2022-03-11 05:44:28', 21, 50, 'PO-22.028', 0, 25, NULL, NULL, NULL, 'receive', '2022-03-02', 0.0000, NULL, 0.0000, '10500.0000', '0.0000', '0.00000', 95, '2022-03-11 05:44:28', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '03-03-22', '', '', '', NULL, '3-11-22');
INSERT INTO `pos_receivings` (`receiving_id`, `invoice_no`, `receiving_time`, `company_id`, `supplier_id`, `supplier_invoice_no`, `employee_id`, `user_id`, `comment`, `payment_type`, `account`, `register_mode`, `receiving_date`, `amount_due`, `description`, `discount_value`, `total_amount`, `paid`, `exchange_rate`, `currency_id`, `created_on`, `total_tax`, `shipping`, `payment_status`, `delivery_status`, `coa`, `msds`, `flowchart`, `forme`, `halal`, `eta`, `etd`, `awb`, `quotation`, `shipping_cost`, `delivery_date`, `ssdt`, `fan`, `supplier_pi`, `quotation_file`, `payment_date`) VALUES
(630, 'PO-22.032', '2022-04-07 07:18:42', 21, 27, 'PO-22.032', 0, 26, NULL, NULL, NULL, 'receive', '2022-03-03', 0.0000, NULL, 0.0000, '900.0000', '0.0000', '0.00000', 124, '2022-04-07 07:18:42', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '-', '-', '8368017055', 'Approved', '0.000', '04/05/2022', '863e595ea1.jpg', '3863e595ea.pdf', '63e595ea17.pdf', '3e595ea178.pdf', '03/09/2022'),
(631, 'PO-22.029', '2022-03-23 03:36:42', 21, 34, 'PO-22.029', 0, 26, NULL, NULL, NULL, 'receive', '2022-03-04', 0.0000, NULL, 0.0000, '3900.0000', '0.0000', '0.00000', 124, '2022-03-23 03:36:42', '0.000', 'By Sea', 'Paid', 'Pending', 0, 0, 0, 0, 0, '-', '-', '-', 'Approved', '0.000', '-', '', '', '', NULL, '03/23/2022'),
(632, 'PO-22.033', '2022-04-08 06:32:15', 21, 25, 'PO-22.033', 0, 26, NULL, NULL, NULL, 'receive', '2022-03-04', 0.0000, NULL, 0.0000, '2150.0000', '0.0000', '0.00000', 38, '2022-04-08 06:32:15', '0.000', 'Air', 'Paid', 'Delivered', 1, 1, 0, 0, 0, '-', '-', '2018075194', 'n/a', '0.000', '04-08-22', '582c0b3e8b.pdf', '0582c0b3e8.pdf', '82c0b3e8b0.pdf', NULL, '03/10/2022'),
(633, 'PO-22.034', '2022-03-25 09:18:14', 21, 45, 'PO-22.034', 0, 25, NULL, NULL, NULL, 'receive', '2022-03-09', 0.0000, NULL, 0.0000, '16500.0000', '0.0000', '0.00000', 95, '2022-03-25 09:18:14', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '3-25-22', '', '', '', NULL, '3-25-22'),
(634, 'PO-22.030', '2022-03-11 05:42:09', 21, 17, 'PO-22.030', 0, 25, NULL, NULL, NULL, 'receive', '2022-03-09', 0.0000, NULL, 0.0000, '53000.0000', '0.0000', '0.00000', 95, '2022-03-11 05:42:09', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', '3-11-22', '', '', '', NULL, '3-11-22'),
(635, 'PO-22.031', '2022-03-18 08:41:49', 21, 7, 'PO-22.031', 0, 26, NULL, NULL, NULL, 'receive', '2022-03-03', 0.0000, NULL, 0.0000, '4028.0000', '0.0000', '0.00000', 124, '2022-03-18 08:41:49', '0.000', 'Air', 'Paid', 'Pending', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '-', '', '', 'd21ec8a76b.pdf', NULL, '03/10/2022'),
(636, 'PO-22.035', '2022-03-25 07:20:49', 21, 50, 'PO-22.035', 0, 25, NULL, NULL, NULL, 'receive', '2022-03-15', 0.0000, NULL, 0.0000, '11700.0000', '0.0000', '0.00000', 95, '2022-03-25 07:20:49', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '3-15-22', '', '', '', NULL, '3-25-22'),
(637, 'PO-22.036', '2022-04-08 03:10:43', 21, 33, 'PO-22.036', 0, 25, NULL, NULL, NULL, 'receive', '2022-03-16', 0.0000, NULL, 0.0000, '9000.0000', '0.0000', '0.00000', 95, '2022-04-08 03:10:43', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '03-28-22', '', '', '', NULL, '04-01-22'),
(638, 'PO-22.037', '2022-04-08 03:11:43', 21, 37, 'PO-22.037', 0, 25, NULL, NULL, NULL, 'receive', '2022-03-16', 0.0000, NULL, 0.0000, '27000.0000', '0.0000', '0.00000', 95, '2022-04-08 03:11:43', '0.000', 'Local', 'Unpaid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '04/05/22', '', '', '', NULL, ''),
(640, 'PO-22.039', '2022-03-24 06:33:02', 21, 7, 'PO-22.039', 0, 26, NULL, NULL, NULL, 'receive', '2022-03-21', 0.0000, NULL, 0.0000, '6995.0000', '0.0000', '0.00000', 124, '2022-03-24 06:33:02', '0.000', 'Air', 'Paid', 'Pending', 0, 0, 0, 0, 0, '-', '-', '-', 'Approved', '0.000', '-', '', '', '', NULL, '03/23/2022'),
(642, 'PO-22.038', '2022-03-23 01:58:05', 21, 8, 'PO-22.038', 0, 25, NULL, NULL, 'cash', 'receive', '2022-03-22', 0.0000, '', 0.0000, '16847.6000', '0.0000', '0.00000', 95, '2022-03-23 01:58:05', '0.000', 'Local', 'Unpaid', 'Pending', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(643, 'PO-22.040', '2022-03-25 09:17:30', 21, 17, 'PO-22.040', 0, 25, NULL, NULL, NULL, 'receive', '2022-03-22', 0.0000, NULL, 0.0000, '123000.0000', '0.0000', '0.00000', 95, '2022-03-25 09:17:30', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '3-25-22', '', '', '', NULL, '3-25-22'),
(644, 'PO-22.041', '2022-03-23 09:35:20', 21, 76, 'PO-22.041', 0, 25, NULL, NULL, NULL, 'receive', '2022-03-22', 0.0000, NULL, 0.0000, '71500.0000', '0.0000', '0.00000', 95, '2022-03-23 09:35:20', '0.000', 'Local', 'Unpaid', 'Pending', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '', '', '', '', '8205a41e2b.docx', ''),
(645, 'PO-22.042', '2022-03-25 07:21:51', 21, 50, 'PO-22.042', 0, 25, NULL, NULL, NULL, 'receive', '2022-03-23', 0.0000, NULL, 0.0000, '11700.0000', '0.0000', '0.00000', 95, '2022-03-25 07:21:51', '0.000', 'Local', 'Paid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '3-23-22', '', '', '', NULL, '3-25-22'),
(646, 'PO-22.043', '2022-04-01 09:02:30', 21, 50, 'PO-22.043', 0, 25, NULL, NULL, NULL, 'receive', '2022-03-31', 0.0000, NULL, 0.0000, '11700.0000', '0.0000', '0.00000', 95, '2022-04-01 09:02:30', '0.000', 'Local', 'Unpaid', 'Delivered', 0, 0, 0, 0, 0, '-', '-', '-', 'Pending', '0.000', '04/01/22', '', '', '', NULL, ''),
(647, 'PO-22.045', '2022-04-05 09:44:12', 21, 45, 'PO-22.045', 0, 25, NULL, NULL, 'cash', 'receive', '2022-04-05', 0.0000, '', 0.0000, '58000.0000', '0.0000', '0.00000', 95, '2022-04-05 09:44:12', '0.000', 'Local', 'Unpaid', 'Pending', 0, 0, 0, 0, 0, '-', '-', '-', 'n/a', '0.000', NULL, NULL, NULL, NULL, NULL, NULL),
(648, 'PO-22.046', '2022-04-07 04:02:38', 21, 17, 'PO-22.046', 0, 26, NULL, NULL, 'cash', 'receive', '2022-04-06', 0.0000, '', 0.0000, '42000.0000', '0.0000', '0.00000', 95, '2022-04-07 04:02:38', '0.000', 'Local', 'Unpaid', 'Pending', 0, 0, 0, 0, 0, '-', '-', '-', 'Approved', '0.000', '-', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pos_receivings_items`
--

CREATE TABLE `pos_receivings_items` (
  `receivings_items_id` int(10) NOT NULL,
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `invoice_no` varchar(100) NOT NULL,
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) DEFAULT NULL,
  `quantity_purchased` double(10,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,4) NOT NULL,
  `item_unit_price` double(15,4) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  `size_id` int(255) DEFAULT NULL,
  `color_id` int(255) DEFAULT NULL,
  `unit_id` int(20) DEFAULT NULL,
  `company_id` int(20) NOT NULL,
  `tax_id` int(10) DEFAULT '0',
  `tax_rate` decimal(10,0) DEFAULT '0',
  `service` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_receivings_items`
--

INSERT INTO `pos_receivings_items` (`receivings_items_id`, `receiving_id`, `invoice_no`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`, `size_id`, `color_id`, `unit_id`, `company_id`, `tax_id`, `tax_rate`, `service`) VALUES
(223, 78, 'PO-21.002', 742, NULL, NULL, NULL, 10.00, '200.0000', 0.0000, 0, 0, NULL, 7, 21, NULL, '0', 0),
(239, 84, 'PO-21.001', 868, NULL, NULL, NULL, 3000.00, '2.2400', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(240, 84, 'PO-21.001', 869, NULL, NULL, NULL, 2.00, '1288.0000', 0.0000, 0, 0, NULL, 26, 21, NULL, '0', 0),
(280, 98, 'PO-21.010', 580, NULL, NULL, NULL, 100.00, '156.8000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(281, 98, 'PO-21.010', 799, NULL, NULL, NULL, 100.00, '28.9520', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(295, 108, 'PO-21.014', 580, NULL, NULL, NULL, 100.00, '313.6000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(296, 108, 'PO-21.014', 877, NULL, NULL, NULL, 1.00, '8736.0000', 0.0000, 0, 0, NULL, 17, 21, NULL, '0', 0),
(299, 110, 'PO-21.005', 540, NULL, NULL, NULL, 30.00, '20.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(300, 110, 'PO-21.005', 541, NULL, NULL, NULL, 50.00, '50.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(301, 110, 'PO-21.005', 542, NULL, NULL, NULL, 30.00, '14.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(302, 110, 'PO-21.005', 557, NULL, NULL, NULL, 5.00, '8.6000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(303, 110, 'PO-21.005', 560, NULL, NULL, NULL, 5.00, '12.3000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(304, 110, 'PO-21.005', 578, NULL, NULL, NULL, 5.00, '15.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(305, 110, 'PO-21.005', 696, NULL, NULL, NULL, 50.00, '135.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(306, 110, 'PO-21.005', 698, NULL, NULL, NULL, 5.00, '19.4000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(307, 110, 'PO-21.005', 739, NULL, NULL, NULL, 30.00, '21.8700', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(308, 110, 'PO-21.005', 875, NULL, NULL, NULL, 25.00, '14.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(309, 111, 'PO-21.006', 773, NULL, NULL, NULL, 3.00, '4800.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(311, 113, 'PO-21.011', 878, NULL, NULL, NULL, 50.00, '550.0000', 0.0000, 0, 0, NULL, 20, 21, NULL, '0', 0),
(347, 136, 'PO-21.018', 884, NULL, NULL, NULL, 30.00, '336.0000', 0.0000, 0, 0, NULL, 25, 21, NULL, '0', 0),
(370, 148, 'PO-21.016', 882, NULL, NULL, NULL, 1.00, '33750.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(435, 175, 'PO-21.017', 883, NULL, NULL, NULL, 2.00, '24003.8600', 0.0000, 0, 0, NULL, 11, 21, NULL, '0', 0),
(438, 177, 'PO-21.019', 886, NULL, NULL, NULL, 1.00, '45001.6000', 0.0000, 0, 0, NULL, 22, 21, NULL, '0', 0),
(439, 177, 'PO-21.019', 887, NULL, NULL, NULL, 6.00, '3124.8000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(490, 196, 'PO-21.012', 542, NULL, NULL, NULL, 10.00, '14.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(491, 196, 'PO-21.012', 578, NULL, NULL, NULL, 15.00, '15.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(492, 196, 'PO-21.012', 666, NULL, NULL, NULL, 5.00, '13.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(493, 196, 'PO-21.012', 696, NULL, NULL, NULL, 10.00, '135.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(494, 197, 'PO-21.015', 864, NULL, NULL, NULL, 300000.00, '0.3600', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(495, 197, 'PO-21.015', 867, NULL, NULL, NULL, 200000.00, '0.1700', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(496, 198, 'PO-21.009', 879, NULL, NULL, NULL, 5000.00, '19.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(497, 199, 'PO-21.013', 773, NULL, NULL, NULL, 25.00, '3450.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(512, 210, 'PO-21.028', 896, NULL, NULL, NULL, 240000.00, '0.4500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(513, 211, 'PO-21.024', 865, NULL, NULL, NULL, 320000.00, '0.3200', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(514, 211, 'PO-21.024', 867, NULL, NULL, NULL, 200000.00, '0.1700', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(538, 220, 'PO-21.029', 791, NULL, NULL, NULL, 25.00, '600.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(539, 221, 'PO-21.027', 651, NULL, NULL, NULL, 100.00, '520.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(541, 223, 'PO-21.008', 751, NULL, NULL, NULL, 400.00, '110.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(546, 227, 'PO-21.030', 868, NULL, NULL, NULL, 3000.00, '2.9000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(547, 227, 'PO-21.030', 869, NULL, NULL, NULL, 2.00, '1288.0000', 0.0000, 0, 0, NULL, 26, 21, NULL, '0', 0),
(548, 227, 'PO-21.030', 898, NULL, NULL, NULL, 100.00, '36.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(549, 228, 'PO-21.031', 884, NULL, NULL, NULL, 20.00, '336.0000', 0.0000, 0, 0, NULL, 25, 21, NULL, '0', 0),
(550, 229, 'PO-21.022', 890, NULL, NULL, NULL, 20000.00, '2.5000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(551, 229, 'PO-21.022', 891, NULL, NULL, NULL, 10000.00, '1.9000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(552, 229, 'PO-21.022', 893, NULL, NULL, NULL, 2000.00, '8.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(553, 229, 'PO-21.022', 894, NULL, NULL, NULL, 2000.00, '8.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(554, 229, 'PO-21.022', 895, NULL, NULL, NULL, 2000.00, '8.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(557, 232, 'PO-21.032', 901, NULL, NULL, NULL, 10.00, '5350.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(598, 250, 'PO-21.038', 863, NULL, NULL, NULL, 200000.00, '0.1500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(599, 250, 'PO-21.038', 867, NULL, NULL, NULL, 200000.00, '0.1700', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(614, 259, 'PO-21.020', 878, NULL, NULL, NULL, 25.00, '580.0000', 0.0000, 0, 0, 0, 20, 21, NULL, '0', 0),
(615, 260, 'PO-21.021', 903, NULL, NULL, NULL, 500.00, '33.7500', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(616, 260, 'PO-21.021', 889, NULL, NULL, NULL, 3000.00, '47.0000', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(617, 261, 'PO-21.040', 905, NULL, NULL, NULL, 200.00, '71.1400', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(618, 262, 'PO-21.023', 763, NULL, NULL, NULL, 15.00, '31.6000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(619, 262, 'PO-21.023', 696, NULL, NULL, NULL, 50.00, '135.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(620, 262, 'PO-21.023', 749, NULL, NULL, NULL, 10.00, '27.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(621, 262, 'PO-21.023', 560, NULL, NULL, NULL, 5.00, '12.3000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(622, 262, 'PO-21.023', 578, NULL, NULL, NULL, 5.00, '15.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(623, 262, 'PO-21.023', 542, NULL, NULL, NULL, 50.00, '14.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(629, 266, 'PO-21.035', 902, NULL, NULL, NULL, 2000.00, '47.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(630, 266, 'PO-21.035', 903, NULL, NULL, NULL, 1000.00, '33.7500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(641, 271, 'PO-21.036', 904, NULL, NULL, NULL, 4000.00, '0.1180', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(642, 271, 'PO-21.036', 904, NULL, NULL, NULL, 1.00, '234.0000', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(643, 271, 'PO-21.036', 904, NULL, NULL, NULL, 1.00, '50.0000', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(661, 278, 'PO-21.037', 763, NULL, NULL, NULL, 15.00, '31.6000', 0.0000, 0, 0, 0, 5, 21, NULL, '0', 0),
(662, 278, 'PO-21.037', 696, NULL, NULL, NULL, 60.00, '135.0000', 0.0000, 0, 0, 0, 5, 21, NULL, '0', 0),
(663, 278, 'PO-21.037', 749, NULL, NULL, NULL, 20.00, '27.0000', 0.0000, 0, 0, 0, 5, 21, NULL, '0', 0),
(664, 278, 'PO-21.037', 673, NULL, NULL, NULL, 5.00, '12.8000', 0.0000, 0, 0, 0, 5, 21, NULL, '0', 0),
(665, 278, 'PO-21.037', 739, NULL, NULL, NULL, 20.00, '21.8700', 0.0000, 0, 0, 0, 5, 21, NULL, '0', 0),
(666, 278, 'PO-21.037', 542, NULL, NULL, NULL, 30.00, '14.5000', 0.0000, 0, 0, 0, 5, 21, NULL, '0', 0),
(667, 278, 'PO-21.037', 577, NULL, NULL, NULL, 5.00, '13.3000', 0.0000, 0, 0, 0, 5, 21, NULL, '0', 0),
(668, 279, 'PO-21.033', 900, NULL, NULL, NULL, 10000.00, '0.0750', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(672, 283, 'PO-21.044', 879, NULL, NULL, NULL, 5000.00, '20.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(679, 288, 'PO-21.047', 791, NULL, NULL, NULL, 25.00, '600.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(686, 293, 'PO-21.043', 907, NULL, NULL, NULL, 2.00, '4845.0000', 0.0000, 0, 0, NULL, 26, 21, NULL, '0', 0),
(690, 295, 'PO-21.039', 615, NULL, NULL, NULL, 3.00, '20.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(691, 295, 'PO-21.039', 615, NULL, NULL, NULL, 1.00, '8.9000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(692, 295, 'PO-21.039', 897, NULL, NULL, NULL, 1.00, '40.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(693, 295, 'PO-21.039', 899, NULL, NULL, NULL, 3.00, '26.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(695, 297, 'PO-21.042', 908, NULL, NULL, NULL, 80000.00, '0.2000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(707, 302, 'PO-21.004', 833, NULL, NULL, NULL, 30000.00, '0.1300', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(708, 302, 'PO-21.004', 845, NULL, NULL, NULL, 20000.00, '0.2050', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(738, 314, 'PO-21.051', 868, NULL, NULL, NULL, 3000.00, '2.9000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(739, 314, 'PO-21.051', 869, NULL, NULL, NULL, 2000.00, '1.6600', 0.0000, 0, 0, NULL, 26, 21, NULL, '0', 0),
(740, 314, 'PO-21.051', 898, NULL, NULL, NULL, 100.00, '66.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(741, 314, 'PO-21.051', 911, NULL, NULL, NULL, 3.00, '2920.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(743, 316, 'PO-21.053', 572, NULL, NULL, NULL, 5.00, '1380.6800', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(744, 316, 'PO-21.053', 580, NULL, NULL, NULL, 150.00, '313.6000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(745, 316, 'PO-21.053', 646, NULL, NULL, NULL, 5.00, '73.9200', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(746, 316, 'PO-21.053', 795, NULL, NULL, NULL, 5.00, '644.7100', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(751, 319, 'PO-21.055', 913, NULL, NULL, NULL, 100000.00, '0.1600', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(752, 319, 'PO-21.055', 912, NULL, NULL, NULL, 15.00, '17500.0000', 0.0000, 0, 0, 0, 6, 21, NULL, '0', 0),
(764, 328, 'PO-21.058', 879, NULL, NULL, NULL, 5000.00, '20.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(765, 329, 'PO-21.056', 914, NULL, NULL, NULL, 10.00, '1350.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(768, 331, 'PO-21.057', 915, NULL, NULL, NULL, 50.00, '350.0000', 0.0000, 0, 0, NULL, 25, 21, NULL, '0', 0),
(769, 332, 'PO-21.045', 526, NULL, NULL, NULL, 30.00, '13.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(770, 332, 'PO-21.045', 542, NULL, NULL, NULL, 30.00, '14.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(771, 332, 'PO-21.045', 696, NULL, NULL, NULL, 97.00, '135.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(772, 332, 'PO-21.045', 875, NULL, NULL, NULL, 40.00, '14.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(773, 332, 'PO-21.045', 909, NULL, NULL, NULL, 5.00, '16.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(778, 337, 'PO-21.063', 919, NULL, NULL, NULL, 3.00, '2700.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(779, 338, 'PO-21.060', 862, NULL, NULL, NULL, 100000.00, '0.1500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(780, 338, 'PO-21.060', 864, NULL, NULL, NULL, 200000.00, '0.3600', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(781, 339, 'PO-21.052', 910, NULL, NULL, NULL, 13.00, '15.4000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(782, 340, 'PO-21.050', 910, NULL, NULL, NULL, 28.00, '15.4000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(783, 340, 'PO-21.050', 910, NULL, NULL, NULL, 7.00, '65.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(784, 340, 'PO-21.050', 910, NULL, NULL, NULL, 1.00, '22.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(785, 341, 'PO-21.059', 919, NULL, NULL, NULL, 3.00, '2700.0000', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(787, 343, 'PO-21.061', 882, NULL, NULL, NULL, 5000.00, '6.7500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(790, 346, 'PO-21.062', 918, NULL, NULL, NULL, 15.00, '260.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(792, 348, 'PO-21.064', 920, NULL, NULL, NULL, 1.00, '50000.0000', 0.0000, 0, 0, NULL, 19, 21, NULL, '0', 0),
(798, 352, 'PO-21.049', 754, NULL, NULL, NULL, 100.00, '18.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(822, 360, 'PO-21.046', 834, NULL, NULL, NULL, 30000.00, '0.1300', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(823, 360, 'PO-21.046', 846, NULL, NULL, NULL, 10000.00, '0.2050', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(824, 361, 'PO-21.066', 672, NULL, NULL, NULL, 100.00, '550.0000', 0.0000, 0, 0, NULL, 13, 21, NULL, '0', 0),
(825, 362, 'PO-21.069', 887, NULL, NULL, NULL, 6.00, '2930.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(826, 362, 'PO-21.069', 887, NULL, NULL, NULL, 1.00, '2109.6000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(828, 364, 'PO-21.070', 927, NULL, NULL, NULL, 1.00, '450.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(829, 364, 'PO-21.070', 927, NULL, NULL, NULL, 1.00, '298.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(835, 368, 'PO-21.067', 921, NULL, NULL, NULL, 500.00, '165.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(836, 368, 'PO-21.067', 922, NULL, NULL, NULL, 1000.00, '60.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(837, 368, 'PO-21.067', 923, NULL, NULL, NULL, 125.00, '200.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(838, 369, 'PO-21.072', 863, NULL, NULL, NULL, 200000.00, '0.1500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(839, 369, 'PO-21.072', 864, NULL, NULL, NULL, 200000.00, '0.3600', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(840, 370, 'PO-21.073', 928, NULL, NULL, NULL, 3.00, '3100.0000', 0.0000, 0, 0, NULL, 15, 21, NULL, '0', 0),
(847, 373, 'PO-21.065', 917, NULL, NULL, NULL, 20.00, '159.0000', 0.0000, 0, 0, NULL, 25, 21, NULL, '0', 0),
(848, 373, 'PO-21.065', 917, NULL, NULL, NULL, 1.00, '914.0000', 0.0000, 0, 0, NULL, 25, 21, NULL, '0', 0),
(862, 377, 'PO-21.076', 928, NULL, NULL, NULL, 6.00, '3100.0000', 0.0000, 0, 0, NULL, 15, 21, NULL, '0', 0),
(863, 378, 'PO-21.034', 878, NULL, NULL, NULL, 25.00, '580.0000', 0.0000, 0, 0, 0, 20, 21, NULL, '0', 0),
(865, 380, 'PO-21.074', 930, NULL, NULL, NULL, 1.00, '7150.0000', 0.0000, 0, 0, 0, 6, 21, NULL, '0', 0),
(866, 381, 'PO-21.077', 916, NULL, NULL, NULL, 40.00, '85.0000', 0.0000, 0, 0, 0, 25, 21, NULL, '0', 0),
(870, 384, 'PO-21.080', 862, NULL, NULL, NULL, 200000.00, '0.1500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(875, 389, 'PO-21.079', 928, NULL, NULL, NULL, 10.00, '3100.0000', 0.0000, 0, 0, NULL, 15, 21, NULL, '0', 0),
(890, 394, 'PO-21.068', 919, NULL, NULL, NULL, 3.00, '2950.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(891, 395, 'PO-21.048', 863, NULL, NULL, NULL, 100000.00, '0.1500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(892, 395, 'PO-21.048', 867, NULL, NULL, NULL, 300000.00, '0.1700', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(894, 397, 'PO-21.081', 931, NULL, NULL, NULL, 150000.00, '0.5000', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(901, 404, 'PO-21.082', 924, NULL, NULL, NULL, 1.00, '29.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(902, 404, 'PO-21.082', 925, NULL, NULL, NULL, 1.00, '16.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(903, 404, 'PO-21.082', 926, NULL, NULL, NULL, 1.00, '15.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(904, 405, 'PO-21.087', 867, NULL, NULL, NULL, 400000.00, '0.1700', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(905, 406, 'PO-21.086', 791, NULL, NULL, NULL, 75.00, '560.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(907, 408, 'PO-21.088', 933, NULL, NULL, NULL, 125.00, '90.0000', 0.0000, 0, 0, 0, 6, 21, NULL, '0', 0),
(909, 410, 'PO-21.090', 919, NULL, NULL, NULL, 6.00, '550.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(911, 412, 'PO-21.092', 879, NULL, NULL, NULL, 5000.00, '22.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(915, 416, 'PO-21.075', 602, NULL, NULL, NULL, 3.00, '27.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(916, 416, 'PO-21.075', 615, NULL, NULL, NULL, 3.00, '20.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(917, 416, 'PO-21.075', 664, NULL, NULL, NULL, 15.00, '40.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(918, 416, 'PO-21.075', 806, NULL, NULL, NULL, 20.00, '38.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(919, 416, 'PO-21.075', 807, NULL, NULL, NULL, 15.00, '75.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(920, 417, 'PO-21.071', 540, NULL, NULL, NULL, 30.00, '20.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(921, 417, 'PO-21.071', 542, NULL, NULL, NULL, 50.00, '14.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(922, 417, 'PO-21.071', 548, NULL, NULL, NULL, 20.00, '139.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(923, 417, 'PO-21.071', 666, NULL, NULL, NULL, 5.00, '13.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(924, 417, 'PO-21.071', 924, NULL, NULL, NULL, 1.00, '29.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(925, 417, 'PO-21.071', 925, NULL, NULL, NULL, 1.00, '16.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(926, 417, 'PO-21.071', 926, NULL, NULL, NULL, 1.00, '15.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(931, 420, 'PO-21.096', 919, NULL, NULL, NULL, 3.00, '3300.0000', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(932, 421, 'PO-21.093', 915, NULL, NULL, NULL, 30.00, '335.0000', 0.0000, 0, 0, 0, 25, 21, NULL, '0', 0),
(933, 421, 'PO-21.093', 916, NULL, NULL, NULL, 60.00, '83.0000', 0.0000, 0, 0, 0, 25, 21, NULL, '0', 0),
(934, 421, 'PO-21.093', 915, NULL, NULL, NULL, 1.00, '1592.5000', 0.0000, 0, 0, 0, 25, 21, NULL, '0', 0),
(935, 422, 'PO-21.091', 914, NULL, NULL, NULL, 10.00, '1500.0000', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(936, 423, 'PO-21.085', 779, NULL, NULL, NULL, 135.00, '63.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(937, 424, 'PO-21.089', 928, NULL, NULL, NULL, 10.00, '3100.0000', 0.0000, 0, 0, NULL, 15, 21, NULL, '0', 0),
(938, 425, 'PO-21.078', 932, NULL, NULL, NULL, 3000.00, '14.0000', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(939, 426, 'PO-21.094', 869, NULL, NULL, NULL, 3000.00, '2.4000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(946, 431, 'PO-21.100', 862, NULL, NULL, NULL, 200000.00, '0.1500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(947, 431, 'PO-21.100', 864, NULL, NULL, NULL, 300000.00, '0.3600', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(972, 435, 'PO-21.095', 934, NULL, NULL, NULL, 2.00, '6275.0000', 0.0000, 0, 0, 0, 25, 21, NULL, '0', 0),
(973, 435, 'PO-21.095', 935, NULL, NULL, NULL, 2.00, '5533.0000', 0.0000, 0, 0, 0, 25, 21, NULL, '0', 0),
(974, 435, 'PO-21.095', 936, NULL, NULL, NULL, 2.00, '8641.0000', 0.0000, 0, 0, 0, 25, 21, NULL, '0', 0),
(979, 437, 'PO-21.101', 919, NULL, NULL, NULL, 6.00, '3500.0000', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(1006, 449, 'PO-21.099', 712, NULL, NULL, NULL, 600.00, '220.0000', 0.0000, 0, 0, NULL, 15, 21, NULL, '0', 0),
(1007, 449, 'PO-21.099', 712, NULL, NULL, NULL, 1.00, '2500.0000', 0.0000, 0, 0, NULL, 15, 21, NULL, '0', 0),
(1008, 449, 'PO-21.099', 870, NULL, NULL, NULL, 100.00, '80.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(1009, 449, 'PO-21.099', 871, NULL, NULL, NULL, 500.00, '160.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(1010, 450, 'PO-21.097', 890, NULL, NULL, NULL, 15000.00, '2.6000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1011, 451, 'PO-21.108', 919, NULL, NULL, NULL, 6.00, '3700.0000', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(1028, 456, 'PO-21.112', 862, NULL, NULL, NULL, 300000.00, '0.1500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1029, 457, 'PO-21.083', 853, NULL, NULL, NULL, 50000.00, '0.1490', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(1030, 457, 'PO-21.083', 857, NULL, NULL, NULL, 3000.00, '0.1840', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(1031, 457, 'PO-21.083', 860, NULL, NULL, NULL, 1.00, '20.0000', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(1032, 458, 'PO-21.084', 696, NULL, NULL, NULL, 100.00, '135.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1033, 459, 'PO-21.111', 920, NULL, NULL, NULL, 1.00, '50000.0000', 0.0000, 0, 0, NULL, 19, 21, NULL, '0', 0),
(1034, 460, 'PO-21.107', 863, NULL, NULL, NULL, 100000.00, '0.1500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1035, 461, 'PO-21.106', 928, NULL, NULL, NULL, 10.00, '3100.0000', 0.0000, 0, 0, NULL, 15, 21, NULL, '0', 0),
(1038, 463, 'PO-21.114', 919, NULL, NULL, NULL, 6.00, '3700.0000', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(1045, 467, 'PO-21.026', 881, NULL, NULL, NULL, 1.00, '545.0000', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(1046, 468, 'PO-21.025', 881, NULL, NULL, NULL, 1.00, '195.0000', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(1047, 468, 'PO-21.025', 892, NULL, NULL, NULL, 17.00, '45.0000', 0.0000, 0, 0, NULL, 21, 21, NULL, '0', 0),
(1048, 469, 'PO-21.007', 880, NULL, NULL, NULL, 20.00, '15.0000', 0.0000, 0, 0, NULL, 21, 21, NULL, '0', 0),
(1049, 469, 'PO-21.007', 881, NULL, NULL, NULL, 2.00, '195.0000', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(1050, 470, 'PO-21.109', 942, NULL, NULL, NULL, 1.00, '9000.0000', 0.0000, 0, 0, 0, 22, 21, NULL, '0', 0),
(1051, 470, 'PO-21.109', 943, NULL, NULL, NULL, 1.00, '8000.0000', 0.0000, 0, 0, 0, 22, 21, NULL, '0', 0),
(1052, 470, 'PO-21.109', 944, NULL, NULL, NULL, 1.00, '700.0000', 0.0000, 0, 0, 0, 22, 21, NULL, '0', 0),
(1053, 470, 'PO-21.109', 945, NULL, NULL, NULL, 1.00, '400.0000', 0.0000, 0, 0, 0, 22, 21, NULL, '0', 0),
(1054, 470, 'PO-21.109', 946, NULL, NULL, NULL, 1.00, '900.0000', 0.0000, 0, 0, 0, 22, 21, NULL, '0', 0),
(1055, 470, 'PO-21.109', 947, NULL, NULL, NULL, 1.00, '600.0000', 0.0000, 0, 0, 0, 22, 21, NULL, '0', 0),
(1056, 470, 'PO-21.109', 948, NULL, NULL, NULL, 1.00, '2000.0000', 0.0000, 0, 0, 0, 22, 21, NULL, '0', 0),
(1057, 471, 'PO-21.110', 914, NULL, NULL, NULL, 10.00, '1700.0000', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(1064, 478, 'PO-21.098', 937, NULL, NULL, NULL, 20.00, '18.0000', 0.0000, 0, 0, NULL, 21, 21, NULL, '0', 0),
(1093, 483, 'PO-21.115', 916, NULL, NULL, NULL, 60.00, '69.0000', 0.0000, 0, 0, NULL, 25, 21, NULL, '0', 0),
(1094, 483, 'PO-21.115', 950, NULL, NULL, NULL, 30.00, '279.0000', 0.0000, 0, 0, NULL, 25, 21, NULL, '0', 0),
(1095, 484, 'PO-21.117', 864, NULL, NULL, NULL, 300000.00, '0.3600', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1096, 485, 'PO-21.103', 526, NULL, NULL, NULL, 30.00, '13.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1097, 485, 'PO-21.103', 540, NULL, NULL, NULL, 20.00, '20.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1098, 485, 'PO-21.103', 541, NULL, NULL, NULL, 50.00, '50.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1099, 485, 'PO-21.103', 542, NULL, NULL, NULL, 30.00, '13.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1100, 485, 'PO-21.103', 549, NULL, NULL, NULL, 25.00, '15.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1101, 485, 'PO-21.103', 666, NULL, NULL, NULL, 10.00, '13.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1102, 485, 'PO-21.103', 696, NULL, NULL, NULL, 20.00, '135.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1103, 485, 'PO-21.103', 698, NULL, NULL, NULL, 10.00, '19.4000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1104, 485, 'PO-21.103', 716, NULL, NULL, NULL, 10.00, '13.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1105, 485, 'PO-21.103', 739, NULL, NULL, NULL, 10.00, '21.8700', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1106, 485, 'PO-21.103', 875, NULL, NULL, NULL, 20.00, '14.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1107, 485, 'PO-21.103', 909, NULL, NULL, NULL, 15.00, '16.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1108, 485, 'PO-21.103', 938, NULL, NULL, NULL, 10.00, '15.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1115, 492, 'PO-21.120', 919, NULL, NULL, NULL, 6.00, '3700.0000', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(1116, 493, 'PO-21.122', 931, NULL, NULL, NULL, 150000.00, '0.5100', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1117, 494, 'PO-21.119', 953, NULL, NULL, NULL, 850.00, '42.0000', 0.0000, 0, 0, 0, 6, 21, NULL, '0', 0),
(1118, 495, 'PO-21.118', 952, NULL, NULL, NULL, 180000.00, '0.5500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1121, 498, 'PO-21.113', 940, NULL, NULL, NULL, 10.00, '80.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1122, 498, 'PO-21.113', 941, NULL, NULL, NULL, 15.00, '17.5000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1123, 499, 'PO-21.105', 785, NULL, NULL, NULL, 10.00, '425.0000', 0.0000, 0, 0, NULL, 5, 21, NULL, '0', 0),
(1125, 501, 'PO-21.125', 879, NULL, NULL, NULL, 5000.00, '36.0000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(1126, 502, 'PO-21.041', 951, NULL, NULL, NULL, 0.00, '0.0000', 0.0000, 0, 0, NULL, 17, 21, NULL, '0', 0),
(1153, 517, 'PO-21.102', 742, NULL, NULL, NULL, 10.00, '200.0000', 0.0000, 0, 0, NULL, 7, 21, NULL, '0', 0),
(1194, 538, 'PO-22.004', 576, NULL, NULL, NULL, 1.00, '208.4000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(1195, 538, 'PO-22.004', 580, NULL, NULL, NULL, 50.00, '208.5000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(1196, 538, 'PO-22.004', 646, NULL, NULL, NULL, 5.00, '175.3500', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(1197, 538, 'PO-22.004', 799, NULL, NULL, NULL, 50.00, '31.7000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(1199, 540, 'PO-22.001', 919, NULL, NULL, NULL, 3.00, '3500.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1201, 542, 'PO-22.002', 950, NULL, NULL, NULL, 20.00, '279.0000', 0.0000, 0, 0, NULL, 25, 21, NULL, '0', 0),
(1202, 543, 'PO-22.006', 964, NULL, NULL, NULL, 2.00, '1200.0000', 0.0000, 0, 0, NULL, 17, 21, NULL, '0', 0),
(1206, 545, 'PO-22.007', 963, NULL, NULL, NULL, 1.00, '5008.2000', 0.0000, 0, 0, NULL, 22, 21, NULL, '0', 0),
(1221, 553, 'PO-22.011', 950, NULL, NULL, NULL, 30.00, '249.0000', 0.0000, 0, 0, NULL, 25, 21, NULL, '0', 0),
(1231, 558, 'PO-22.015', 774, NULL, NULL, NULL, 5.00, '1144.6400', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(1239, 565, 'PO-22.018', 916, NULL, NULL, NULL, 40.00, '67.0000', 0.0000, 0, 0, NULL, 25, 21, NULL, '0', 0),
(1244, 569, 'PO-22.017', 919, NULL, NULL, NULL, 3.00, '3500.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1254, 575, 'PO-21.003', 580, NULL, NULL, NULL, 100.00, '156.8000', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(1255, 575, 'PO-21.003', 799, NULL, NULL, NULL, 100.00, '28.9520', 0.0000, 0, 0, NULL, 6, 21, NULL, '0', 0),
(1256, 576, 'PO-21.123', 902, NULL, NULL, NULL, 3000.00, '49.9500', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1260, 578, 'PO-21.104', 834, NULL, NULL, NULL, 20000.00, '0.1300', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(1261, 578, 'PO-21.104', 845, NULL, NULL, NULL, 20000.00, '0.2050', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(1262, 578, 'PO-21.104', 949, NULL, NULL, NULL, 50000.00, '0.1370', 0.0000, 0, 0, NULL, 8, 21, NULL, '0', 0),
(1278, 584, 'PO-22.020', 869, NULL, NULL, NULL, 2000.00, '2.2700', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1279, 584, 'PO-22.020', 898, NULL, NULL, NULL, 100.00, '74.5400', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1287, 591, 'PO-22.024', 865, NULL, NULL, NULL, 80000.00, '0.3300', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1288, 591, 'PO-22.024', 984, NULL, NULL, NULL, 80000.00, '0.3300', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1295, 595, 'PO-22.022', 919, NULL, NULL, NULL, 3.00, '3500.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1296, 596, 'PO-22.023', 919, NULL, NULL, NULL, 3.00, '3500.0000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1298, 598, 'PO-22.014', 887, NULL, NULL, NULL, 5.00, '3281.6000', 0.0000, 0, 0, NULL, 9, 21, NULL, '0', 0),
(1299, 599, 'PO-22.021', 985, NULL, NULL, NULL, 1.00, '20700.0000', 0.0000, 0, 0, 0, 22, 21, NULL, '0', 0),
(1303, 608, 'PO-22.0007', 526, NULL, NULL, NULL, 1.00, '13.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1304, 609, 'PO-22.0007', 526, NULL, NULL, NULL, 1.00, '13.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1305, 610, 'PO-22.0007', 526, NULL, NULL, NULL, 1.00, '13.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1306, 610, 'PO-22.0007', 527, NULL, NULL, NULL, 1.00, '4030.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1307, 611, 'PO-22.0007', 526, NULL, NULL, NULL, 1.00, '13.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1308, 611, 'PO-22.0007', 527, NULL, NULL, NULL, 1.00, '4030.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1309, 611, 'PO-22.0007', 528, NULL, NULL, NULL, 1.00, '13.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1310, 612, 'PO-22.0007', 526, NULL, NULL, NULL, 1.00, '13.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1311, 612, 'PO-22.0007', 527, NULL, NULL, NULL, 1.00, '4030.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1312, 613, 'PO-22.0007', 526, NULL, NULL, NULL, 1.00, '13.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1313, 613, 'PO-22.0007', 527, NULL, NULL, NULL, 1.00, '4030.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1316, 615, 'PO-22.0007', 526, NULL, NULL, NULL, 1.00, '13.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1317, 615, 'PO-22.0007', 527, NULL, NULL, NULL, 1.00, '4030.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1419, 600, 'PO-22.026', 914, NULL, NULL, NULL, 20.00, '2650.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1421, 574, 'PO-22.019', 712, NULL, NULL, NULL, 500.00, '220.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1422, 559, 'PO-22.012', 908, NULL, NULL, NULL, 50000.00, '0.1700', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1423, 559, 'PO-22.012', 983, NULL, NULL, NULL, 50000.00, '0.1000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1446, 597, 'PO-22.025', 882, NULL, NULL, NULL, 5000.00, '6.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1450, 626, 'PO-22.027', 800, NULL, NULL, NULL, 50.00, '122.8800', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1451, 626, 'PO-22.027', 799, NULL, NULL, NULL, 50.00, '35.5040', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1452, 626, 'PO-22.027', 580, NULL, NULL, NULL, 50.00, '233.5200', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1478, 589, 'PO-22.013', 864, NULL, NULL, NULL, 200000.00, '0.3700', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1479, 589, 'PO-22.013', 896, NULL, NULL, NULL, 80000.00, '0.5200', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1480, 634, 'PO-22.030', 863, NULL, NULL, NULL, 200000.00, '0.1600', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1481, 634, 'PO-22.030', 867, NULL, NULL, NULL, 100000.00, '0.2100', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1482, 629, 'PO-22.028', 919, NULL, NULL, NULL, 3.00, '3500.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1517, 635, 'PO-22.031', 526, NULL, NULL, NULL, 20.00, '13.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1518, 635, 'PO-22.031', 541, NULL, NULL, NULL, 20.00, '50.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1519, 635, 'PO-22.031', 564, NULL, NULL, NULL, 10.00, '22.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1520, 635, 'PO-22.031', 668, NULL, NULL, NULL, 10.00, '12.7000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1521, 635, 'PO-22.031', 675, NULL, NULL, NULL, 20.00, '12.2000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1522, 635, 'PO-22.031', 875, NULL, NULL, NULL, 30.00, '14.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1523, 635, 'PO-22.031', 909, NULL, NULL, NULL, 15.00, '16.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1524, 635, 'PO-22.031', 986, NULL, NULL, NULL, 10.00, '149.7000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1525, 525, 'PO-22.009', 542, NULL, NULL, NULL, 10.00, '14.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1526, 525, 'PO-22.009', 600, NULL, NULL, NULL, 50.00, '13.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1527, 525, 'PO-22.009', 666, NULL, NULL, NULL, 10.00, '13.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1528, 525, 'PO-22.009', 941, NULL, NULL, NULL, 15.00, '16.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1529, 525, 'PO-22.009', 960, NULL, NULL, NULL, 30.00, '15.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1530, 525, 'PO-22.009', 962, NULL, NULL, NULL, 10.00, '15.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1531, 594, 'PO-22.010', 645, NULL, NULL, NULL, 5.00, '16.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1532, 594, 'PO-22.010', 806, NULL, NULL, NULL, 20.00, '35.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1533, 594, 'PO-22.010', 929, NULL, NULL, NULL, 10.00, '35.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1534, 594, 'PO-22.010', 961, NULL, NULL, NULL, 3.00, '55.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1540, 642, 'PO-22.038', 580, NULL, NULL, NULL, 50.00, '233.5200', 0.0000, 0, 0, 0, 6, 21, NULL, '0', 0),
(1541, 642, 'PO-22.038', 795, NULL, NULL, NULL, 5.00, '1034.3200', 0.0000, 0, 0, 0, 6, 21, NULL, '0', 0),
(1546, 631, 'PO-22.029', 833, NULL, NULL, NULL, 30000.00, '0.1300', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1557, 644, 'PO-22.041', 993, NULL, NULL, NULL, 1000.00, '71.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1559, 640, 'PO-22.039', 541, NULL, NULL, NULL, 40.00, '50.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1560, 640, 'PO-22.039', 696, NULL, NULL, NULL, 37.00, '135.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1561, 588, 'PO-22.008', 742, NULL, NULL, NULL, 10.00, '215.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1562, 503, 'PO-21.126', 540, NULL, NULL, NULL, 20.00, '20.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1563, 503, 'PO-21.126', 542, NULL, NULL, NULL, 40.00, '14.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1564, 503, 'PO-21.126', 548, NULL, NULL, NULL, 15.00, '139.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1565, 503, 'PO-21.126', 555, NULL, NULL, NULL, 15.00, '24.2000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1566, 503, 'PO-21.126', 640, NULL, NULL, NULL, 5.00, '12.3000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1567, 503, 'PO-21.126', 668, NULL, NULL, NULL, 10.00, '12.7000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1568, 503, 'PO-21.126', 676, NULL, NULL, NULL, 10.00, '24.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1569, 503, 'PO-21.126', 707, NULL, NULL, NULL, 5.00, '32.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1570, 503, 'PO-21.126', 736, NULL, NULL, NULL, 15.00, '15.5000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1571, 503, 'PO-21.126', 749, NULL, NULL, NULL, 20.00, '27.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1572, 503, 'PO-21.126', 909, NULL, NULL, NULL, 5.00, '16.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1573, 503, 'PO-21.126', 959, NULL, NULL, NULL, 30.00, '27.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1574, 503, 'PO-21.126', 960, NULL, NULL, NULL, 20.00, '15.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1576, 636, 'PO-22.035', 919, NULL, NULL, NULL, 3.00, '3900.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1578, 645, 'PO-22.042', 919, NULL, NULL, NULL, 3.00, '3900.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1579, 643, 'PO-22.040', 862, NULL, NULL, NULL, 100000.00, '0.1600', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1580, 643, 'PO-22.040', 864, NULL, NULL, NULL, 200000.00, '0.3700', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1581, 643, 'PO-22.040', 865, NULL, NULL, NULL, 100000.00, '0.3300', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1582, 633, 'PO-22.034', 988, NULL, NULL, NULL, 1.00, '16500.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1586, 646, 'PO-22.043', 919, NULL, NULL, NULL, 3.00, '3900.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1588, 548, 'PO-22.003', 968, NULL, NULL, NULL, 2.00, '10000.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1589, 541, 'PO-22.005', 879, NULL, NULL, NULL, 5000.00, '36.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1590, 557, 'PO-22.016', 965, NULL, NULL, NULL, 1.00, '10350.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1591, 557, 'PO-22.016', 966, NULL, NULL, NULL, 1.00, '10350.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1592, 557, 'PO-22.016', 967, NULL, NULL, NULL, 1.00, '21150.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1593, 647, 'PO-22.045', 987, NULL, NULL, NULL, 2.00, '29000.0000', 0.0000, 0, 0, 0, 17, 21, NULL, '0', 0),
(1595, 648, 'PO-22.046', 867, NULL, NULL, NULL, 200000.00, '0.2100', 0.0000, 0, 0, 0, 9, 21, NULL, '0', 0),
(1596, 630, 'PO-22.032', 754, NULL, NULL, NULL, 50.00, '18.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1601, 637, 'PO-22.036', 991, NULL, NULL, NULL, 5.00, '850.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1602, 637, 'PO-22.036', 992, NULL, NULL, NULL, 5.00, '950.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1603, 638, 'PO-22.037', 990, NULL, NULL, NULL, 20000.00, '1.3500', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0),
(1604, 632, 'PO-22.033', 742, NULL, NULL, NULL, 10.00, '215.0000', 0.0000, 0, 0, NULL, NULL, 21, 0, '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pos_samples`
--

CREATE TABLE `pos_samples` (
  `id` int(100) NOT NULL,
  `company_id` int(255) NOT NULL,
  `item` varchar(200) NOT NULL,
  `supplier` varchar(200) DEFAULT NULL,
  `qty` decimal(10,3) DEFAULT NULL,
  `unit_id` varchar(100) DEFAULT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `department_id` int(150) DEFAULT NULL,
  `payment_status` varchar(100) DEFAULT NULL,
  `delivery_status` varchar(100) DEFAULT NULL,
  `approval` varchar(20) DEFAULT NULL,
  `date_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_samples`
--

INSERT INTO `pos_samples` (`id`, `company_id`, `item`, `supplier`, `qty`, `unit_id`, `price`, `currency`, `department_id`, `payment_status`, `delivery_status`, `approval`, `date_created`) VALUES
(11, 21, 'Coffee Box', 'Visual Edge Packaging Products Corp.', '1.000', '9', '7.500', 'PHP', 2, 'Paid', 'Delivered', 'Rejected', '2021-02-08'),
(12, 21, 'Breeze Fragrance', 'Aromaaz International', '500.000', '5', '0.000', 'USD', 10, 'Free', 'Delivered', 'Pending', '2021-04-12'),
(13, 21, 'Menthol Crystals', 'Maetel Global', '500.000', '6', '1950.000', 'PHP', 10, 'Paid', 'Delivered', 'Pending', '2021-04-12'),
(14, 21, 'Mineral Oil', 'Mace Ingredients Hub', '1.000', '6', '450.000', 'PHP', 10, 'Paid', 'Delivered', 'Pending', '2021-04-12'),
(15, 21, 'Fresh Bamboo Essential Oil', 'Aromaaz International', '10.000', '5', '0.000', 'USD', 10, 'Free', 'Delivered', 'Approved', '2021-04-15'),
(16, 21, 'Lavandula Augustifolia Essential Oil', 'Aromaaz International', '10.000', '5', '0.000', 'USD', 10, 'Free', 'Delivered', 'Approved', '2021-04-15'),
(17, 21, 'Menthol Essential Oil', 'Aromaaz International', '10.000', '5', '0.000', 'USD', 10, 'Free', 'Delivered', 'Approved', '2021-04-15'),
(18, 21, 'Eucalyptus Radiata Essential Oil', 'Aromaaz International', '10.000', '5', '0.000', 'USD', 10, 'Free', 'Delivered', 'Approved', '2021-04-15'),
(19, 21, 'Lily of the Valley Essential Oil', 'Aromaaz International', '10.000', '5', '0.000', 'USD', 10, 'Free', 'Delivered', 'Approved', '2021-04-15'),
(20, 21, '150ml Plastic Bottle (Amber Color)', 'VanJoin Group', '10000.000', '8', '0.236', 'USD', 2, 'Free', 'Delivered', 'Pending', '2021-06-29'),
(21, 21, '20g to 30g HDPE bottle', 'Vanjoin Group', '2.000', '8', '0.000', 'USD', 2, 'Free', 'Delivered', 'Pending', '2021-08-25'),
(22, 21, 'Orange Powder Flavor', 'Turnberry Ingredients Corp.', '1.000', '6', '0.000', 'PHP', 3, 'Paid', 'Delivered', 'Pending', '2021-08-25'),
(24, 21, 'Orange Juice Powder', 'Arisun Chempharm', '1.000', '5', '16.000', 'USD', 3, 'Paid', 'Delivered', 'Approved', '2021-08-26'),
(25, 21, 'Kiwi Juice Powder', 'Arisun Chempharm', '1.000', '5', '15.000', 'USD', 3, 'Paid', 'Delivered', 'Approved', '2021-08-26'),
(26, 21, 'Orange Juice Powder', 'Turnberry Ingredients Corp.', '230.000', '6', '0.000', 'PHP', 3, 'Free', 'Delivered', 'Pending', '2021-09-05'),
(27, 21, 'Virgin Coconut Oil', 'Cocomed', '1.000', '6', '280.000', 'PHP', 10, 'Paid', 'Delivered', 'Pending', '2021-09-06'),
(28, 21, 'Amber Glass Bottle 50ml with dropper', 'Vanjoin Group', '1.000', '8', '0.137', 'USD', 2, 'Free', 'Delivered', 'Approved', '2021-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `pos_shipping_terms`
--

CREATE TABLE `pos_shipping_terms` (
  `id` int(100) NOT NULL,
  `company_id` int(255) NOT NULL,
  `name` varchar(32) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_shipping_terms`
--

INSERT INTO `pos_shipping_terms` (`id`, `company_id`, `name`, `status`, `date_created`) VALUES
(4, 21, 'FOB (Sea)', 'active', '2021-01-07 07:24:38'),
(5, 21, 'Ex Works (Air)', 'active', '2021-01-07 07:24:49'),
(6, 21, 'Local (Pick Up)', 'active', '2021-01-07 07:25:32'),
(7, 21, 'Local (Terminal)', 'active', '2021-01-07 07:25:44'),
(8, 21, 'Local (Delivery)', 'active', '2021-01-07 07:25:57'),
(9, 21, 'Local (COD)', 'active', '2021-01-07 07:26:08'),
(10, 21, 'Ex Works (Sea)', 'active', '2021-01-07 07:26:54'),
(11, 21, 'CIP (Air)', 'active', '2021-01-07 07:27:32'),
(12, 21, 'Local (Courier)', 'active', '2021-01-07 07:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `pos_sourcings`
--

CREATE TABLE `pos_sourcings` (
  `id` int(100) NOT NULL,
  `company_id` int(255) NOT NULL,
  `product` varchar(100) NOT NULL,
  `department_id` int(150) DEFAULT NULL,
  `requested_by` varchar(100) DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `sourced_by` varchar(100) DEFAULT NULL,
  `urgency` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `date_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_sourcings`
--

INSERT INTO `pos_sourcings` (`id`, `company_id`, `product`, `department_id`, `requested_by`, `request_date`, `sourced_by`, `urgency`, `status`, `date_created`) VALUES
(8, 21, 'Stevia', 3, 'Jarred', '2021-08-10 00:00:00', 'Jay', 'Urgent', 'On Process', '2021-02-01'),
(9, 21, 'Coffee Box and Sachets', 2, 'Jarred', '2021-02-01 00:00:00', 'Jay Cejared', 'Urgent', 'Approved', '2021-02-01'),
(10, 21, 'Mineral Oil', 3, 'R&D', '2021-03-15 00:00:00', 'Jay Cejares', 'Urgent', 'Approved', '2021-03-15'),
(11, 21, 'Fresh bamboo essential oil', 3, 'R&D', '2021-03-15 00:00:00', 'Jay Cejares', 'Urgent', 'Approved', '2021-03-15'),
(12, 21, 'Menthol Crystals', 3, 'R&D', '2021-03-15 00:00:00', 'Jay Cejares', 'Urgent', 'Approved', '2021-03-15'),
(13, 21, 'Soap Scents (Compounded)', 3, 'R&D', '2021-03-15 00:00:00', 'Jay Cejares', 'Urgent', 'Approved', '2021-03-15'),
(14, 21, 'Plastic Bottle for Liposomal', 2, 'STI', '2021-06-22 00:00:00', 'Jarred', 'For Development', 'On Process', '2021-06-22'),
(15, 21, 'Magnesium Stearate', 3, 'Princess', '2021-07-26 00:00:00', 'Jay', 'For Development', 'Approved', '2021-07-26'),
(16, 21, 'Caramel Flavor', 3, 'Francis', '2021-08-10 00:00:00', 'Jay', 'For Development', 'On Process', '2021-08-10'),
(17, 21, 'Kiwi Flavor', 3, 'Jarred', '0000-00-00 00:00:00', '', 'For Development', 'Approved', '2021-08-10'),
(18, 21, 'Kiwi Juice Powder', 3, 'Jarred', '2021-08-10 00:00:00', 'Jay', 'For Development', 'On Process', '2021-08-10'),
(19, 21, 'Orange Flavor', 3, 'Francis', '2021-08-10 00:00:00', 'Jay', 'For Development', 'On Process', '2021-08-10'),
(20, 21, 'Lactose Monohydrate', 3, 'Jarred', '2021-08-11 00:00:00', 'Jarred', 'For Development', 'Approved', '2021-08-11'),
(21, 21, 'Zinc Methionine', 3, 'Jarred', '2021-08-11 00:00:00', 'Jarred', 'Urgent', 'On Process', '2021-08-11'),
(22, 21, '20g - 30g Bottle', 2, 'Jarred', '2021-08-11 00:00:00', 'Jarred', 'For Development', 'On Process', '2021-08-11'),
(23, 21, 'Muriate of Potash', 7, 'R&D', '2021-11-23 00:00:00', '', 'Urgent', 'On Process', '2021-11-23'),
(24, 21, 'Single Super Phosphate', 7, 'R&D', '2021-11-23 00:00:00', '', 'Urgent', 'On Process', '2021-11-23'),
(25, 21, 'Crude Salt', 7, 'R&D', '2021-11-23 00:00:00', '', 'Urgent', 'On Process', '2021-11-23'),
(26, 21, 'Paper Bag with Print', 2, 'Dennies ', '2022-02-08 00:00:00', 'Jay', 'Urgent', 'Approved', '2022-02-09');

-- --------------------------------------------------------

--
-- Table structure for table `pos_supplier`
--

CREATE TABLE `pos_supplier` (
  `id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `posting_type_id` int(100) NOT NULL,
  `currency_id` int(10) DEFAULT '0',
  `op_balance_dr` decimal(10,4) DEFAULT '0.0000',
  `op_balance_cr` decimal(10,4) DEFAULT '0.0000',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exchange_rate` decimal(10,0) DEFAULT '0',
  `acc_code` int(11) DEFAULT NULL,
  `isSupplier` tinyint(1) NOT NULL DEFAULT '1',
  `also_customer` tinyint(1) NOT NULL DEFAULT '0',
  `sale_posting_type_id` int(20) DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `contact_person` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dtl_cost` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `php_cost` decimal(10,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pos_supplier`
--

INSERT INTO `pos_supplier` (`id`, `company_id`, `name`, `address`, `email`, `contact_no`, `status`, `posting_type_id`, `currency_id`, `op_balance_dr`, `op_balance_cr`, `created_on`, `exchange_rate`, `acc_code`, `isSupplier`, `also_customer`, `sale_posting_type_id`, `country`, `contact_person`, `dtl_cost`, `php_cost`) VALUES
(7, 21, 'Arisun ChemPharm Co. Ltd.', '5th Floor, Building B, No.57, Keji 3rd Road, High-Tech Zone, Xi’an, 710075', 'sales2@arisunchem.com', '+86 298 797 7271', 'active', 0, NULL, NULL, NULL, '2020-12-16 07:04:14', NULL, NULL, 1, 0, NULL, 'China', 'Jessica Wong', '11.0000', '53.0000'),
(8, 21, 'DLA Naturals Inc.', '999 Cabangaan Point Cawag Subic Zambales', 'info@dlanaturals.com', '+63 047 232 4137', 'active', 0, NULL, NULL, NULL, '2020-12-16 07:05:26', NULL, NULL, 1, 0, NULL, 'Philippines', 'Emily Pineda', '0.0000', '1.0000'),
(9, 21, 'Kanegrade U.K.', 'Ingredients House, Caxton Way, Stevenage SG1 2DF', 'jazz@kanegrade.com', '+44 143 874 2242', 'active', 0, NULL, NULL, NULL, '2020-12-16 07:10:06', NULL, NULL, 1, 0, NULL, 'United Kingdom', 'Jatinder Minhas', '25.0000', '53.0000'),
(11, 21, 'NP Nutra', '15171 S. Figueroa St., Gardena CA, 90248 ', 'samaan@npnutra.com', '+01 828 743 8516', 'active', 0, NULL, NULL, NULL, '2021-01-04 05:26:35', NULL, NULL, 1, 0, NULL, 'USA', 'Samaan Buisson', '25.0000', '53.0000'),
(12, 21, 'Turnberry Ingredients Corporation', '#76 Valencia Street Quezon City', 'april@turnberryingredients.com', '+63 028 725 7990', 'active', 0, NULL, NULL, NULL, '2021-01-04 06:11:13', NULL, NULL, 1, 0, NULL, 'Philippines', 'April Maligaya', '500.0000', '1.0000'),
(13, 21, 'Xian Lyphar Biotech Co., Ltd.', 'No. 32, Jinye Road, Hi-Tech Industrial Zone, Xi\'an City, Shaanxi Province', 'sales09@lyphar.com', '+86 298 889 1943', 'active', 0, NULL, NULL, NULL, '2021-01-04 06:13:13', NULL, NULL, 1, 0, NULL, 'China', 'Tiffany He', '11.0000', '53.0000'),
(14, 21, 'Sewon Korea', '', 'bc1ahn@korea.com', '-', 'active', 0, NULL, NULL, NULL, '2021-01-04 06:17:26', NULL, NULL, 1, 0, NULL, 'South Korea', 'Mr. Ahn', '25.0000', '53.0000'),
(15, 21, 'Hunan Sunfull Biotech Co., Ltd.', 'Depu Enterprise Park ,Economy & technology Development Zone,Changsha, Hunan, 410138', 'cassie@sunfullbio.com', '+86 731 829 7659', 'active', 0, NULL, NULL, NULL, '2021-01-04 06:20:47', NULL, NULL, 1, 0, NULL, 'China', 'Cassie Huang', '11.0000', '53.0000'),
(16, 21, 'Fooding Group Limited', 'No.759, South Yanggao Road, Pudong, Shanghai 200127', 'sales50@chinafooding.com', '+86 215 032 1622', 'active', 0, NULL, NULL, NULL, '2021-01-04 06:22:49', NULL, NULL, 1, 0, NULL, 'China', 'Ms. Lina', '11.0000', '53.0000'),
(17, 21, 'GDL Capsules Phils., Inc.', '91 Gen Luis St., Brgy Nagkaisang Nayon, Novaliches 1125,\r\nQuezon City, Metro Manila', 'edwardk.gdl@gmail.com', '+63 028 373 5985', 'active', 0, NULL, NULL, NULL, '2021-01-04 06:24:35', NULL, NULL, 1, 0, NULL, 'Philippines', 'Edward Kratzer', '0.0400', '1.0000'),
(18, 21, 'Halchem Industrial Sales Inc.', '107 Luis Marquez St., Merville Subdivision,\r\nParanaque City', 'ces@halchem.com', '+63 028 823 0427', 'active', 0, NULL, NULL, NULL, '2021-01-04 06:28:30', NULL, NULL, 1, 0, NULL, 'Philippines', 'Carlo Enrico Silvestre', '40.0000', '1.0000'),
(19, 21, 'Jennypeas HB Care Enterprises', '', 'jennypeashbcareenterprises@yahoo.com', '+63 917 890 0784 ', 'active', 0, NULL, NULL, NULL, '2021-01-04 06:30:57', NULL, NULL, 1, 0, NULL, 'Philippines', 'Jennilyn  Pua', '40.0000', '1.0000'),
(20, 21, 'Tata Chemicals Limited', 'Leela Business Park, Andheri East\r\nMumbai, 400059', 'sowmyar@tatachemicals.com', '+91 961 959 4059', 'active', 0, NULL, NULL, NULL, '2021-01-04 06:34:01', NULL, NULL, 1, 0, NULL, 'India', 'Sowmya Ramanujam', '25.0000', '53.0000'),
(21, 21, 'Purechem Corporation', '348 Jorge St., San Rafael Village, Navotas City 1485', 'james.purechem@gmail.com', '+63 028 708 7871', 'active', 0, NULL, NULL, NULL, '2021-01-04 06:36:11', NULL, NULL, 1, 0, NULL, 'Philippines', 'James John Samson', '30.0000', '1.0000'),
(22, 21, 'Kerusso Marketing', '-', 'cathy.kerussomarketing@gmail.com', '-', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:14:30', NULL, NULL, 1, 0, NULL, 'Philippines', 'Catherine Ragot', '100.0000', '1.0000'),
(23, 21, 'Local Market', '-', 'local@market.com', '-', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:15:10', NULL, NULL, 1, 0, NULL, '-', '-', '30.0000', '1.0000'),
(24, 21, 'Kakadu Plum Co.', 'PO BOX 8104 East Brighton VIC 3187', 'tahlia@kakaduplumco.com', '+61 412 580 9900', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:17:38', NULL, NULL, 1, 0, NULL, 'Australia', 'Tahlia Mandie', '25.0000', '53.0000'),
(25, 21, 'Indena SPA', 'Address: Viale Ortles, 12, 20139 Milano MI\r\n', 'paola.gristina@indena.com', '+39 025 749 61', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:22:47', NULL, NULL, 1, 0, NULL, 'Italy', 'Gristina Paola', '20.0000', '58.0000'),
(26, 21, 'Elcano Trading Corporation', '712 EIcano St, San Nicolas, Manila, 1010 Metro Manila\r\n', 'dairyelcano@gmail.com', '+63 028 242 4588 ', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:24:21', NULL, NULL, 1, 0, NULL, 'Philippines', 'Alex Ting', '30.0000', '1.0000'),
(27, 21, 'Anthem Biosciences Pvt. Ltd.', 'No 49, Canara Bank Road,\r\n\r\nHosur Rd, Electronics City Phase 1, Bommasandra Industrial Area, Bengaluru, Karnataka', 'pramodhkumar.m@anthembio.com', '+91 806 672 4000 ', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:27:10', NULL, NULL, 1, 0, NULL, 'India', 'Pramodh Kumar', '25.0000', '53.0000'),
(28, 21, 'Monte Cielo Marketing Corporation', 'No. 88 Speaker Eugenio Perez St., Sta. Mesa\r\nHeights, Quezon city', 'montecielosalesteam@gmail.com', '+63 028 740 5474', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:30:05', NULL, NULL, 1, 0, NULL, 'Philippines', 'Rowee Sano', '20.0000', '1.0000'),
(29, 21, 'MDLD Interchemical Industries Inc.', '73 Scout Fernandez Brgy Laging Handa Quezon City', 'jdacillo@mdldchem.com', '+63 028 372 3984', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:31:42', NULL, NULL, 1, 0, NULL, 'Philippines', 'Jovie Dacillo', '0.5000', '1.0000'),
(30, 21, 'Advanced Enzymes', '5th Floor, ‘A’ wing, Sun Magnetica LIC Service Road, Louiswadi Thane (W) 400 604', 'darshan@advancedenzymes.com', '+91 224 170 3200', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:35:06', NULL, NULL, 1, 0, NULL, 'India', 'Darshan Barot', '25.0000', '53.0000'),
(31, 21, 'Aromaaz International', 'B - 45/8 Site, 4, Industrial Area, Sahibabad, Ghaziabad, Uttar Pradesh 201010', 'sales@aromaazinternational.com', '+91 965 005 0730', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:36:41', NULL, NULL, 1, 0, NULL, 'India', 'Mr. Uttar', '25.0000', '53.0000'),
(32, 21, 'Sinoped Co. Ltd.', 'Tiexi Industrial Zone, Taizihe District, Liaoyang, Liaoning', 'business3@sinoped.com.cn', '+86 419 214 5577', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:40:14', NULL, NULL, 1, 0, NULL, 'China', 'Candy Liu', '200.0000', '53.0000'),
(33, 21, 'GTC Propack Corporation', 'G/F Peterbilt Bldg. C Veterans Center Western Bicutan Taguig City 1630', 'operations01@gtcpropack.com', '+63 028 821 4502', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:41:47', NULL, NULL, 1, 0, NULL, 'Philippines', 'Ruth Palcon', '700.0000', '1.0000'),
(34, 21, 'Vanjoin Group', 'Floor 14, Golden Block, Poly Champagne International Building, Hanxi No.1 Road, Qiaokou District, Wuhan, Hubei', 'amy@vanjoin.com', '+86 278 280 1008', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:44:44', NULL, NULL, 1, 0, NULL, 'China', 'Amy', '0.2000', '53.0000'),
(35, 21, 'Ningbo Baogong Electrical Appliance Co.,Ltd', 'No.658 Xintang Road, Fuhai Industrial Zone, Cixi Ningbo, Zhejiang', 'assistant-4@baogon.com', '+86 574 636 8219', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:47:24', NULL, NULL, 1, 0, NULL, 'China', 'Peter Liu', '100.0000', '53.0000'),
(36, 21, 'Dongguan Yuyi Trading Co., Ltd.', '1010 First Floor of Building D, Zhanxing Industrial Park, No. 382 Helong Yi Road, Hebian, Baiyun Area, Guangzhou City', 'sales4@obrou.com', '+86 131 720 8315', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:50:12', NULL, NULL, 1, 0, NULL, 'China', 'Havens Huang', '0.1600', '53.0000'),
(37, 21, 'MPN Global Packaging Inc.', 'Unit 5B New Wealth Prosperity, First Road Joseph Sitt St., Bagumbayan, Taguig City', 'mpngpi@yahoo.com', '+63 028 837 0378', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:52:13', NULL, NULL, 1, 0, NULL, 'Philippines', 'Selina Contreras', '0.1800', '1.0000'),
(38, 21, 'Shanghai Shangyu Industrial Co., Ltd', 'Room 1201, Building No. 1, Lane 111 Luxiang Road,\r\nBaoshan District, Shanghai 201907', 'sales3@dsticker.com.cn', '+86 026 276 5500', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:53:39', NULL, NULL, 1, 0, NULL, 'China', 'Amy Lu', '0.0080', '53.0000'),
(39, 21, 'ActivPack Corporation', 'Orient Gold Crest Building, 121 East Main Avenue\r\nLaguna Techno Park Inc, Binan, Laguna 4024', 'debbie@amelcosystems.com', '+63 028 985 8577 ', 'active', 0, NULL, NULL, NULL, '2021-01-04 07:55:58', NULL, NULL, 1, 0, NULL, 'Philippines', 'Debbie Meily', '0.1800', '1.0000'),
(40, 21, 'SBS Philippines Corporation', '10 Resthaven St., SFDM, Quezon City, Metro Manila', 'm.delmoral@sbsph.com', '+63 028 371 1111', 'active', 0, NULL, NULL, NULL, '2021-01-08 06:13:57', NULL, NULL, 1, 0, NULL, 'Philippines', 'Michelle Del Moral', '5.0000', '1.0000'),
(41, 21, 'Alysons\' Chemical Enterprises, Inc.', '1425 G. Araneta Avenue, near Del Monte Avenue\r\nQuezon City', 'alysonschem_office@yahoo.com.ph', '+63 028 712 2266', 'active', 0, NULL, NULL, NULL, '2021-01-08 06:24:53', NULL, NULL, 1, 0, NULL, 'Philippines', 'Ms. Jenny', '5000.0000', '1.0000'),
(42, 21, 'Hope Adhesive Paper Products Inc.', '17-C Cordero St. 2nd Ave. Grace Park Caloocan City', 'hopejocelyncalubs@yahoo.com', '+63 028 365 8886', 'active', 0, NULL, NULL, NULL, '2021-01-08 06:26:33', NULL, NULL, 1, 0, NULL, 'Philippines', 'Ms. Elisa', '0.5000', '1.0000'),
(43, 21, 'C. Melchers GmbH & Co.', 'Unit 19C, 19th Floor Rufino Pacific Tower, 6784 Ayala Avenue, Makati City', 'maldo@melchers.ph', '+63 028 811 0611', 'active', 0, NULL, NULL, NULL, '2021-01-08 06:28:09', NULL, NULL, 1, 0, NULL, 'Philippines', 'Liny Maldo', '3000.0000', '1.0000'),
(44, 21, 'Zhejiang Fuchang Machinery Co. Ltd.', 'Development Road 3, Economic Development Zone, Ruian, Zhejiang', 'daniel@fuchang.com.cn', '+86 577 651 5809', 'active', 0, NULL, NULL, NULL, '2021-01-08 06:30:29', NULL, NULL, 1, 0, NULL, 'China', 'Daniel Chen', '200.0000', '53.0000'),
(45, 21, 'Hoobee Packaging Corporation', '946 Busilak Street Barangka Drive Mandaluyong City', 'hoobeepackaging@yahoo.com.ph', '+63 028 533 4773', 'active', 0, NULL, NULL, NULL, '2021-01-08 06:31:55', NULL, NULL, 1, 0, NULL, 'Philippines', 'Letty Liu', '2500.0000', '1.0000'),
(46, 21, 'Yana Chemodities Inc.', '151 Kaliraya Rd, Quezon City, 1113 Metro Manila\r\n', 'quotation2@yanachemodities.com', '+63 028 731 3633', 'active', 0, NULL, NULL, NULL, '2021-01-08 06:33:09', NULL, NULL, 1, 0, NULL, 'Philippines', 'Tiffany Bagaan', '500.0000', '1.0000'),
(47, 21, 'Keystone Instruments Corporation', '2130 Leveriza St. Pasay City', 'pam@keystone-instruments.com', '+63 028 831 5056', 'active', 0, NULL, NULL, NULL, '2021-01-08 06:34:12', NULL, NULL, 1, 0, NULL, 'Philippines', 'Pam Ostan', '500.0000', '1.0000'),
(48, 21, 'Pharmao Industries Co. Ltd.', 'No. 177, Zhenye Road, Dongjing Town, Shanghai', 'frank@pharmao.com', '+86 041 923 0586', 'active', 0, NULL, NULL, NULL, '2021-01-08 06:36:05', NULL, NULL, 1, 0, NULL, 'China', 'Mr. Frank', '20.0000', '53.0000'),
(49, 21, 'Neco Philippines', 'Broadview Towers, 1416-1418 Mayhaligue, Sta. Cruz, Manila', 'necophil@yahoo.com', '+63 028 559 7912', 'active', 0, NULL, NULL, NULL, '2021-01-12 08:17:49', NULL, NULL, 1, 0, NULL, 'Philippines', 'Racquel Cacayan', '3.0000', '1.0000'),
(50, 21, 'Dhel\'s LPG Station', 'n/a', 'n/a@gmail.com', '-', 'active', 0, NULL, NULL, NULL, '2021-01-12 08:18:55', NULL, NULL, 1, 0, NULL, 'Philippines', 'Dhel', '10.0000', '1.0000'),
(51, 21, 'DML Subic Freeport Corporation', 'DML SFC Bldg. Lot 73 Labitan St., Central Business District Area, SBFZ', 'joanedanielle@gmail.com', '+63 047 250 2196', 'active', 0, NULL, NULL, NULL, '2021-01-12 08:58:33', NULL, NULL, 1, 0, NULL, 'Philippines', 'Joanne Danielle Angeles', '0.0000', '1.0000'),
(52, 21, 'Sem Tronics Technology Inc.', 'Stall #1 PCP Bldg. II Along Friendship Hi-way Brgy. Sto. Domingo, Angeles City, Pampanga', 'sales@semangeles.com', '+63 045 436 1045', 'active', 0, NULL, NULL, NULL, '2021-01-12 09:07:14', NULL, NULL, 1, 0, NULL, 'Philippines', 'Joven Gonzales', '0.5000', '1.0000'),
(53, 21, 'ESKNTA', 'Olongapo', 'tj@nanusci.com', '+63 998 174 6686', 'active', 0, NULL, NULL, NULL, '2021-01-12 09:13:26', NULL, NULL, 1, 0, NULL, 'Philippines', 'Tj Capuli', '1.0000', '1.0000'),
(57, 21, 'Nanusci Inc.', '999 Cabangaan Pt Cawag Subic Zambales', 'info@nanusci.com', '+63 047 232 4137', 'active', 0, NULL, NULL, NULL, '2021-02-01 07:46:51', NULL, NULL, 1, 0, NULL, 'Philippines', 'Shiela Tiru', '100.0000', '1.0000'),
(58, 21, 'DM Thermal Solutions', 'Bldg. 640, Sampson Road, Central Business District Area, SBFZ', 'jsmagcuha.dmtsi@gmail.com', '+63 922 869 4997', 'active', 0, NULL, NULL, NULL, '2021-03-08 06:11:21', NULL, NULL, 1, 0, NULL, 'Philippines', 'Jamaica Magcuha', '1000.0000', '1.0000'),
(59, 21, 'Hyphoria Philippines Inc.', 'Unit 1806 West Trade Center, 132 West Ave. Quezon City', 'jane.gamo@hyphoria.com.ph', '+63 917 703 5224', 'active', 0, NULL, NULL, NULL, '2021-03-17 10:11:17', NULL, NULL, 1, 0, NULL, 'Philippines', 'Jane Gamo', '3.0000', '1.0000'),
(60, 21, 'Tonbay Industry Co. Ltd.', 'Zhongyi Industrial Park, No. 3399, Yuanjiang Rd, Shanghai', 'tonbaypacking@tonbay.cn', '+86 216 093 9774', 'active', 0, NULL, NULL, NULL, '2021-04-27 06:32:53', NULL, NULL, 1, 0, NULL, 'China', 'Jacky Ching', '0.0750', '53.0000'),
(61, 21, 'Guangdong Changxing Printing Service', 'Chaoshan Highway, Chaoan, Chaozhou, Guangdong', 'cx5@flexicx.com', '+86 135 001 1151 ', 'active', 0, NULL, NULL, NULL, '2021-04-30 07:00:08', NULL, NULL, 1, 0, NULL, 'China', 'Ms. Tracy', '0.2400', '53.0000'),
(62, 21, 'Dongguan Qin Rui Eco-Technology Co. Ltd.', '906, Bldg. B2, Dongguan Tian\'an Digital City, No. 1, Huangjin Rd., Nancheng Dist., Dongguan, Guangdong', 'mlh@dgminlee.com', '+86 135 3259 1559', 'active', 0, NULL, NULL, NULL, '2021-06-16 07:13:10', NULL, NULL, 1, 0, NULL, 'China', 'Ms. Daisy', '1.2000', '53.0000'),
(63, 21, 'Tarlac', 'Tarlac', '', '-', 'active', 0, NULL, NULL, NULL, '2021-07-13 09:50:28', NULL, NULL, 1, 0, NULL, 'Phiilippines', '-', '1.0000', '1.0000'),
(64, 21, 'Lazada PH', '-', 'lazada@lazada.com', '-', 'active', 0, NULL, NULL, NULL, '2021-07-14 09:16:56', NULL, NULL, 1, 0, NULL, 'Philippines', '-', '1.0000', '1.0000'),
(65, 21, 'Dalkem Corporation', 'Level 26-A Rufino Pacific Tower, 6784 Ayala Ave., San Lorenzo, Makati City', 'sales@dalkemcorp.com', '+63 998 984 8721', 'active', 0, NULL, NULL, NULL, '2021-07-29 10:22:49', NULL, NULL, 1, 0, NULL, 'Philippines', 'Myrel Soriano', '50.0000', '1.0000'),
(66, 21, 'Euro Chemicals Inc.', 'Lot 2 Arty II Subd., Corner Road I, Mindanao Ave., Quezon City', 'jljagonap@eurochem.ph', '+63 632 930 471', 'active', 0, NULL, NULL, NULL, '2021-09-01 23:20:54', NULL, NULL, 1, 0, NULL, 'Philippines', 'Jasher Jagonap', '1.0000', '1.0000'),
(67, 21, 'GRB Enterprises Inc.', '3812 Daffodil St., Sun Valley, Bicutan, Paranaque City 1700', 'macs@grb.com.ph', '+63 917 805 8481', 'active', 0, NULL, NULL, NULL, '2021-10-15 16:03:31', NULL, NULL, 1, 0, NULL, 'Philippines', 'Malaika C. Seacor', '0.1000', '1.0000'),
(68, 21, 'Wilcon', '', '', '', 'active', 0, NULL, NULL, NULL, '2021-11-19 07:22:27', NULL, NULL, 1, 0, NULL, '', '', '0.0000', '0.0000'),
(69, 21, 'L.G Atkimson Import - Export Inc.', 'Atkimson Bldg. 627 Del monte ave. S.F.D.M Quezon City', 'directsales@lgatkimson.com', '+63 918 918 1230', 'active', 0, NULL, NULL, NULL, '2021-12-10 06:41:41', NULL, NULL, 1, 0, NULL, 'Philippines', 'Ms. Jackyline', '1.0000', '1.0000'),
(70, 21, 'Northwest Construction Supply', '209 RH 5 National Hwy, Subic, 2209 Zambales', '', '+63 047 232 3500', 'active', 0, NULL, NULL, NULL, '2021-12-14 05:51:23', NULL, NULL, 1, 0, NULL, 'Philippines', 'Ms. Weng', '1.0000', '1.0000'),
(71, 21, 'Good Year', 'Calapacuan', '', '', 'active', 0, NULL, NULL, NULL, '2021-12-14 05:52:02', NULL, NULL, 1, 0, NULL, 'Philippines', '', '1.0000', '1.0000'),
(72, 21, 'ZKTeco Philippines', 'Sunymede IT Center 1614, South Triangle, Quezon Ave., Quezon City', 'Lazada@email.com', '', 'active', 0, NULL, NULL, NULL, '2022-01-25 08:25:03', NULL, NULL, 1, 0, NULL, 'Philippines', 'Lazada', '1.0000', '1.0000'),
(73, 21, 'Hana Mayari', 'B8 L3, Makabayan Ave. Fiesta Communities New Cabalan Olongapo City', '', 'n/a', 'active', 0, NULL, NULL, NULL, '2022-01-25 08:27:17', NULL, NULL, 1, 0, NULL, 'Philippines', 'n/a', '1.0000', '1.0000'),
(74, 21, 'Asuki Weighing System Inc.', 'No.25 Arty 1 St. Brgy. Talipapa Novaliches Quezon City', 'carol_asuki@yahoo.com.ph', '+63 028 930 7777', 'active', 0, NULL, NULL, NULL, '2022-01-28 08:21:38', NULL, NULL, 1, 0, NULL, 'Philippines', 'Caroline Espiritu', '1.0000', '1.0000'),
(75, 21, 'Caling Home of Curtains', '94 National HighwayMangan Vaca, Subic, Zambales', 'jenniecaling@gmail.com', '+63 932 204 9987', 'active', 0, NULL, NULL, NULL, '2022-02-23 07:02:33', NULL, NULL, 1, 0, NULL, 'Philippines', 'Jennie S. Caling', '1.0000', '1.0000'),
(76, 21, 'Nikon Printing Press Corp.', '#30 Judge Juan Luna St. SFDM Quezon City', 'happi.meanne@gmail.com', '+63 995 987 1595', 'active', 0, NULL, NULL, NULL, '2022-03-22 17:28:44', NULL, NULL, 1, 0, NULL, 'Philippines', 'Meanne Simmons', '1.0000', '1.0000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_supplier_payments`
--

CREATE TABLE `pos_supplier_payments` (
  `id` int(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `supplier_id` int(100) NOT NULL,
  `account_code` varchar(100) NOT NULL,
  `dueTo_acc_code` varchar(100) NOT NULL,
  `ref_account_id` int(20) DEFAULT '0' COMMENT 'its supplier id',
  `debit` double(15,4) NOT NULL,
  `credit` double(15,4) NOT NULL,
  `narration` text,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  `exchange_rate` decimal(10,5) NOT NULL,
  `company_id` int(20) NOT NULL,
  `entry_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pos_supplier_payment_history`
--

CREATE TABLE `pos_supplier_payment_history` (
  `id` int(20) NOT NULL,
  `supplier_id` int(20) NOT NULL,
  `invoice_no` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `receiving_invoice_no` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(20,4) NOT NULL,
  `company_id` int(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_units`
--

CREATE TABLE `pos_units` (
  `id` int(100) NOT NULL,
  `company_id` int(255) NOT NULL,
  `name` varchar(32) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos_units`
--

INSERT INTO `pos_units` (`id`, `company_id`, `name`, `status`, `date_created`) VALUES
(5, 21, 'USD / kg', 'active', '2020-12-22 13:03:16'),
(6, 21, 'PHP / kg', 'active', '2020-12-22 13:03:29'),
(7, 21, 'EURO / kg', 'active', '2021-01-04 05:18:34'),
(8, 21, 'USD / piece', 'active', '2021-01-04 05:19:02'),
(9, 21, 'PHP / piece', 'active', '2021-01-04 05:19:17'),
(10, 21, 'USD / unit', 'active', '2021-01-04 05:19:30'),
(11, 21, 'PHP / unit', 'active', '2021-01-04 05:19:41'),
(12, 21, 'USD / gallon', 'active', '2021-01-04 05:19:59'),
(13, 21, 'PHP / gallon', 'active', '2021-01-04 05:20:06'),
(14, 21, 'USD / liter', 'active', '2021-01-04 05:20:18'),
(15, 21, 'PHP / liter', 'active', '2021-01-04 05:20:25'),
(16, 21, 'USD / roll', 'active', '2021-01-04 05:20:46'),
(17, 21, 'PHP / roll', 'active', '2021-01-04 05:20:53'),
(18, 21, 'USD / drum', 'active', '2021-01-04 05:21:31'),
(19, 21, 'PHP / drum', 'active', '2021-01-04 05:21:38'),
(20, 21, 'PHP / tank', 'active', '2021-01-04 05:21:49'),
(21, 21, 'USD / set', 'active', '2021-01-04 05:22:02'),
(22, 21, 'PHP / set', 'active', '2021-01-04 05:22:08'),
(23, 21, 'USD / meter', 'active', '2021-01-04 05:22:22'),
(24, 21, 'PHP / meter', 'active', '2021-01-04 05:22:28'),
(25, 21, 'PHP / box', 'active', '2021-01-12 08:56:50'),
(26, 21, 'PHP / case', 'active', '2021-01-12 08:57:13'),
(27, 21, 'USD / gram', 'active', '2021-01-20 07:19:31'),
(28, 21, 'EURO / gram', 'active', '2021-01-20 07:19:38'),
(29, 21, 'PHP / gram', 'active', '2021-01-20 07:19:49'),
(30, 21, 'grams', 'active', '2021-01-20 08:19:48'),
(31, 21, 'piece', 'active', '2021-01-20 08:19:54'),
(32, 21, 'kg', 'active', '2021-01-20 08:19:59'),
(33, 21, 'liter', 'active', '2021-01-20 08:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `prod_customers`
--

CREATE TABLE `prod_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `contact_number` varchar(200) DEFAULT NULL,
  `contact_person` varchar(256) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prod_customers`
--

INSERT INTO `prod_customers` (`id`, `name`, `contact_number`, `contact_person`, `date_created`, `date_updated`) VALUES
(7, 'Gr8life International Corporation', '+63 917 893 5895', 'Josie Tio', '2021-10-20 02:23:50', '0000-00-00 00:00:00'),
(8, 'Dorothy Reyes', '+63 917 673 1978', '', '2021-10-20 02:25:32', '0000-00-00 00:00:00'),
(9, 'John Catabay', '+63 917 113 3171', '', '2021-10-20 02:25:53', '0000-00-00 00:00:00'),
(10, 'Breakthrough & Milestone Production Inc. (ADD)', '+63 949 565 9119', 'Matt Qiambao', '2022-01-14 02:21:27', '0000-00-00 00:00:00'),
(11, 'Rising Era Dynasty', '', 'Jayant Jared Era', '2022-01-14 02:21:56', '0000-00-00 00:00:00'),
(12, 'We Provide Corporation', '+63 915 529 4586', 'Ray Angelo Reyes', '2022-01-14 02:22:26', '0000-00-00 00:00:00'),
(13, 'Uptimised Corporation', '+63 927 955 8607', 'Michelle Costales', '2022-01-14 02:23:01', '0000-00-00 00:00:00'),
(14, 'Nexus E-Commerce Worldwide Corp.', '+63 927 854 0043', 'Ruchel Sarmiento', '2022-01-14 02:23:55', '0000-00-00 00:00:00'),
(15, 'Wellness United Co.', '+63 927 854 0043', 'Ruchel Sarmiento', '2022-01-14 02:24:18', '0000-00-00 00:00:00'),
(16, 'VNU General Merchandise', '+63 956 122 6310', 'Charry Ubaub', '2022-01-14 02:24:59', '0000-00-00 00:00:00'),
(18, 'Avant Life Essentials', '', 'Samuel Ortega', '2022-01-17 11:28:57', '0000-00-00 00:00:00'),
(19, 'Life Armour Trading Inc.', '', 'Franz August Gerardo', '2022-01-17 11:29:19', '0000-00-00 00:00:00'),
(20, 'Get Naturals Corporation', '+63 917 869 1101', 'Cristina Trinidad', '2022-01-17 11:29:46', '0000-00-00 00:00:00'),
(21, 'Last Ride International Corporation', '', 'Rudolf Ryan Perez', '2022-01-17 11:30:19', '0000-00-00 00:00:00'),
(22, 'Building Our Success Stories Network Inc. (BOSS)', '', 'Rommel Tabaniag', '2022-01-17 11:30:45', '0000-00-00 00:00:00'),
(23, 'JLopez Medical Group Inc.', '', 'Joel Ferdinand Lopez', '2022-01-17 11:31:13', '0000-00-00 00:00:00'),
(24, 'Papa Pio & Friends Inc.', '', 'Ma. Corazon Regina Corona', '2022-01-17 11:31:36', '0000-00-00 00:00:00'),
(25, 'Villa Healthcare & Wellness Center', '', 'Villa Subido', '2022-01-17 11:32:03', '0000-00-00 00:00:00'),
(26, 'Holistic Integrative Care Center (HICC)', '', 'Imelda Edodollon', '2022-01-17 11:32:37', '0000-00-00 00:00:00'),
(27, 'Botany IV', '', 'Capt. RD Galera', '2022-01-17 11:32:56', '0000-00-00 00:00:00'),
(28, 'Sta. Veronica Hospital', '+63 920 241 3392', 'Jubeth Mesina', '2022-01-17 11:33:24', '0000-00-00 00:00:00'),
(29, 'Hidebrand Associated Business Corporation', '+63 917 840 2313', 'Hidebrand Alday Barcase', '2022-01-17 11:34:06', '0000-00-00 00:00:00'),
(30, 'Xylem Nutraceuticals', '+63 998 992 2117', 'Christopher Bautista', '2022-01-17 11:34:38', '0000-00-00 00:00:00'),
(31, 'Global Four International Food Trading Inc.', '', '', '2022-01-17 11:35:03', '0000-00-00 00:00:00'),
(32, 'Big Wellness Group Inc.', '', 'Ruby Magpantay', '2022-01-17 11:35:24', '0000-00-00 00:00:00'),
(33, 'Equicell', '09175359676', 'Dennies Cejares', '2022-02-11 02:13:54', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `prod_customer_payments`
--

CREATE TABLE `prod_customer_payments` (
  `id` int(100) NOT NULL,
  `sale_id` int(20) DEFAULT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `customer_id` int(100) NOT NULL,
  `debit` double(15,4) NOT NULL,
  `credit` double(15,4) NOT NULL,
  `description` text,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  `payment_status` varchar(100) DEFAULT NULL,
  `delivery_date` varchar(100) DEFAULT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prod_customer_payments`
--

INSERT INTO `prod_customer_payments` (`id`, `sale_id`, `invoice_no`, `customer_id`, `debit`, `credit`, `description`, `creation_date`, `date`, `payment_status`, `delivery_date`, `note`) VALUES
(1, 8, '005', 8, 1100.0000, 0.0000, 'the quick brown fox jumps over the lazy dogs', '2022-05-01 00:33:07', '2022-05-01', 'Unpaid', NULL, NULL),
(2, 9, '006', 8, 0.0000, 47500.0000, 'another  inoiveie', '2022-05-01 01:06:58', '2022-05-01', 'Paid', NULL, NULL),
(3, 10, '007', 8, 0.0000, 510.0000, 'sdfsdfsd', '2022-06-03 06:05:16', '2022-06-03', 'Paid', '2022-06-03', 'sdfsdfsd'),
(4, 11, '007', 8, 0.0000, 434.0000, '', '2022-06-13 07:10:33', '2022-06-13', 'Paid', '2022-06-13', '');

-- --------------------------------------------------------

--
-- Table structure for table `prod_production_history`
--

CREATE TABLE `prod_production_history` (
  `id` int(11) NOT NULL,
  `product_id` int(26) NOT NULL,
  `qty` varchar(200) DEFAULT NULL,
  `urgency` varchar(100) DEFAULT NULL,
  `requested_by` varchar(100) DEFAULT NULL,
  `customer_id` int(100) DEFAULT NULL,
  `date_request` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  `bmf` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date` date NOT NULL,
  `comments` text,
  `qty_produced` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prod_production_history`
--

INSERT INTO `prod_production_history` (`id`, `product_id`, `qty`, `urgency`, `requested_by`, `customer_id`, `date_request`, `delivery_date`, `date_created`, `date_updated`, `bmf`, `status`, `date`, `comments`, `qty_produced`) VALUES
(22, 183, '100', NULL, '', 9, '2022-01-21', '2022-01-25', NULL, '2022-02-17 01:38:05', '1212022', 'Finished', '0000-00-00', NULL, '95'),
(23, 165, '100', NULL, '', 0, '2022-02-03', '2022-02-07', NULL, '2022-02-16 22:54:41', '232022', 'Finished', '0000-00-00', NULL, '100'),
(24, 120, '3000', NULL, 'Marbz', 7, '2022-01-17', '2022-01-30', NULL, '2022-02-17 01:37:49', '1172022', 'Finished', '0000-00-00', NULL, '3051'),
(25, 184, '5000', NULL, '', 12, '2022-02-04', '0000-00-00', NULL, '2022-02-16 22:54:13', '02042022', 'Finished', '0000-00-00', NULL, '5438'),
(26, 188, '500', NULL, '', 33, '2022-02-11', '2022-02-25', NULL, '2022-02-16 22:24:36', '21120223', 'Finished', '0000-00-00', NULL, '582'),
(27, 115, '375', NULL, '', 9, '2022-02-15', '2022-02-18', NULL, '2022-02-17 01:36:53', '2152022', 'Finished', '0000-00-00', NULL, '412'),
(28, 185, '500', NULL, '', 33, '2022-02-11', '2022-02-25', NULL, '2022-02-17 01:37:09', '21120221', 'Finished', '0000-00-00', NULL, '539'),
(29, 78, '500', NULL, '', 33, '2022-02-11', '2022-02-25', NULL, '2022-02-17 01:37:23', '21120225', 'Finished', '0000-00-00', NULL, '454'),
(30, 57, '500', NULL, '', 33, '2022-02-11', '2022-02-25', NULL, '2022-02-22 02:54:02', '21120224', 'Finished', '0000-00-00', NULL, '540'),
(31, 187, '500', NULL, '', 33, '2022-02-11', '2022-02-25', NULL, '2022-02-22 02:51:47', '21120222', 'Finished', '0000-00-00', NULL, '544'),
(32, 57, '500', NULL, '', 33, '2022-02-23', '2022-03-03', NULL, '2022-02-24 04:17:27', '2232022', 'Finished', '0000-00-00', NULL, '542'),
(33, 117, '200', NULL, '', 28, '2022-02-23', '2022-03-02', NULL, '2022-02-28 02:48:38', '22320221', 'Finished', '0000-00-00', NULL, '208'),
(34, 105, '10000', NULL, '', 11, '2022-02-16', '2022-03-09', NULL, '2022-03-03 04:21:12', '21620222', 'Finished', '0000-00-00', NULL, '9843'),
(35, 189, '1000', NULL, '', 12, '2022-03-08', '2022-03-31', NULL, '2022-03-09 01:54:34', '382022', 'Finished', '0000-00-00', NULL, '1101'),
(36, 115, '400', NULL, '', 9, '2022-03-14', '2022-03-18', NULL, '2022-03-16 00:53:03', '4220225', 'Finished', '0000-00-00', NULL, '403'),
(37, 62, '300', NULL, '', 9, '2022-03-14', '2022-03-18', NULL, '2022-03-16 00:53:32', '422022', 'Finished', '0000-00-00', NULL, '222'),
(38, 95, '200', NULL, '', 9, '2022-03-14', '2022-03-18', NULL, '2022-03-16 00:53:20', '4220222', 'Finished', '0000-00-00', NULL, '214'),
(39, 165, '250', NULL, '', 0, '2022-03-16', '2022-03-18', NULL, '2022-03-21 22:47:01', '3162022', 'Finished', '0000-00-00', NULL, '250'),
(40, 166, '250', NULL, '', 0, '2022-03-16', '2022-03-18', NULL, '2022-03-21 22:46:51', '31620221', 'Finished', '0000-00-00', NULL, '250'),
(41, 191, '250', NULL, '', 9, '2022-03-15', '2022-03-25', NULL, '2022-03-21 22:46:19', '3152022', 'Finished', '0000-00-00', NULL, '303'),
(42, 119, '2000', NULL, '', 7, '2022-03-08', '2022-03-25', NULL, '2022-03-21 22:47:59', '3820222', 'Finished', '0000-00-00', NULL, '2010'),
(43, 89, '200', NULL, '', 9, '2022-03-14', '2022-03-18', NULL, '2022-03-21 22:45:52', '4220221', 'Finished', '0000-00-00', NULL, '201'),
(44, 190, '200', NULL, '', 9, '2022-03-14', '2022-03-18', NULL, '2022-03-21 22:46:04', '4220224', 'Finished', '0000-00-00', NULL, '215'),
(45, 32, '500', NULL, '', 0, '2022-03-08', '2022-03-25', NULL, '2022-03-21 22:52:06', '3820224', 'Finished', '0000-00-00', NULL, '487'),
(46, 189, '2000', NULL, '', 12, '2022-03-22', '2022-03-31', NULL, '2022-03-22 21:53:35', '3222022', 'Finished', '0000-00-00', NULL, '2131'),
(47, 68, '200', NULL, '', 9, '2022-03-14', '2022-03-18', NULL, '2022-03-22 21:53:16', '4220223', 'Finished', '0000-00-00', NULL, '229'),
(48, 119, '2000', NULL, '', 7, '2022-02-16', '2022-02-28', NULL, '2022-04-03 23:44:17', '2162022', 'Finished', '0000-00-00', NULL, '1972');

-- --------------------------------------------------------

--
-- Table structure for table `prod_production_request`
--

CREATE TABLE `prod_production_request` (
  `id` int(11) NOT NULL,
  `product_id` int(26) NOT NULL,
  `qty` varchar(200) DEFAULT NULL,
  `urgency` varchar(100) DEFAULT NULL,
  `requested_by` varchar(100) DEFAULT NULL,
  `customer_id` int(100) DEFAULT NULL,
  `date_request` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  `bmf` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prod_production_request`
--

INSERT INTO `prod_production_request` (`id`, `product_id`, `qty`, `urgency`, `requested_by`, `customer_id`, `date_request`, `delivery_date`, `date_created`, `date_updated`, `bmf`, `status`) VALUES
(6, 4, '1', NULL, '', 5, '2021-04-23', '2021-04-23', '2021-04-23', '2021-04-23 06:56:30', 'hhyug', 'Finished'),
(15, 7, 'j', NULL, 'j', 5, '0000-00-00', '0000-00-00', '2021-06-14', '0000-00-00 00:00:00', 'j', 'Finished'),
(21, 8, '11', NULL, '', 5, '2021-07-05', '2021-07-06', '2021-07-05', '2021-07-05 05:41:02', '', 'Quarantine'),
(41, 25, '1', NULL, 'khan', 8, '2022-01-25', '2022-01-29', '2022-01-26', '2022-01-26 03:07:12', 'hhyug', 'Finished'),
(76, 118, '2000', NULL, 'Marbz', 7, '2022-04-06', '2022-04-22', '2022-04-05', '0000-00-00 00:00:00', '442022', 'Scheduled'),
(77, 105, '10000', NULL, 'Marbz', 11, '2022-04-07', '2022-04-29', '2022-04-06', '0000-00-00 00:00:00', '472022', 'Scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `prod_production_schedule`
--

CREATE TABLE `prod_production_schedule` (
  `id` int(11) NOT NULL,
  `product_id` int(26) NOT NULL,
  `qty` varchar(200) DEFAULT NULL,
  `bmf` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  `urgency` varchar(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `requested_by` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prod_production_schedule`
--

INSERT INTO `prod_production_schedule` (`id`, `product_id`, `qty`, `bmf`, `status`, `date`, `date_created`, `date_updated`, `urgency`, `delivery_date`, `requested_by`, `customer_id`, `note`) VALUES
(13, 8, '5000', 'BMF1011', 'Finished', '2021-04-26', '2021-04-26', '2021-04-26 01:50:54', NULL, NULL, 0, 0, ''),
(15, 6, '5', '', 'Finished', '2021-06-06', '2021-06-06', '2021-06-06 10:36:44', NULL, NULL, 0, 0, ''),
(20, 7, '9', '99', 'Finished', '9999-09-09', '2021-06-19', '2021-07-12 02:50:18', NULL, '0999-09-09', 0, 0, ''),
(21, 7, '99', '', 'Finished', '0222-05-22', '2021-06-19', '2021-06-19 02:58:10', NULL, '0000-00-00', 0, 0, ''),
(22, 7, '0', 'j', 'Finished', '0021-06-20', '2021-06-19', '2021-07-12 02:44:38', NULL, '0000-00-00', 0, 0, ''),
(23, 7, '15', 'B3934', 'Finished', '2021-05-15', '2021-06-19', '2021-06-28 03:04:55', NULL, '2022-06-22', 0, 0, ''),
(24, 12, '3000', 'GL-001', 'Finished', '2021-07-19', '2021-07-19', '2021-07-19 03:30:17', NULL, '2021-08-20', 0, 0, 'test note'),
(25, 12, '4088', 'GL-001', 'Finished', '2021-05-15', '2021-07-19', '2021-07-19 03:32:51', NULL, '2021-07-21', 0, 0, ''),
(26, 12, '4000', 'B1201', 'Finished', '2021-07-23', '2021-07-23', '2021-07-23 10:52:32', NULL, '2021-08-23', 0, 0, ''),
(29, 21, '1000', 'BMF01', 'Finished', '2022-01-12', '2022-01-12', '2022-01-12 01:27:50', NULL, '2022-01-30', 0, 0, ''),
(30, 21, '1000', 'BMF01', 'Finished', '2021-01-12', '2022-01-12', '2022-01-12 02:59:21', NULL, '2022-01-30', 0, 0, ''),
(31, 120, '3000', '1172022', 'Finished', '2022-01-17', '2022-01-19', '2022-02-09 01:51:06', NULL, '2022-01-30', 0, 0, ''),
(32, 183, '100', '1212022', 'Finished', '2022-01-21', '2022-01-24', '2022-02-02 04:07:39', NULL, '2022-01-25', 0, 0, ''),
(34, 24, '5', '7', 'Finished', '2022-01-26', '2022-01-26', '2022-01-26 03:13:46', NULL, '2022-01-27', 0, 7, ''),
(35, 165, '100', '232022', 'Finished', '2022-02-03', '2022-02-03', '2022-02-08 04:03:35', NULL, '2022-02-07', 0, 0, ''),
(36, 184, '5000', '02042022', 'Finished', '2022-02-04', '2022-02-03', '2022-02-14 03:07:17', NULL, '0000-00-00', 0, 12, ''),
(37, 57, '500', '21120224', 'Finished', '2022-02-11', '2022-02-11', '2022-02-22 02:27:42', NULL, '2022-02-25', 0, 33, ''),
(38, 188, '500', '21120223', 'Finished', '2022-02-11', '2022-02-11', '2022-02-16 22:13:49', NULL, '2022-02-25', 0, 33, ''),
(39, 187, '500', '21120222', 'Finished', '2022-02-11', '2022-02-11', '2022-02-22 02:49:55', NULL, '2022-02-25', 0, 33, ''),
(40, 185, '500', '21120221', 'Finished', '2022-02-11', '2022-02-11', '2022-02-17 01:18:09', NULL, '2022-02-25', 0, 33, ''),
(41, 78, '500', '21120225', 'Finished', '2022-02-11', '2022-02-11', '2022-02-17 01:19:50', NULL, '2022-02-25', 0, 33, ''),
(42, 115, '375', '2152022', 'Finished', '2022-02-15', '2022-02-14', '2022-02-17 01:17:52', NULL, '2022-02-18', 0, 9, ''),
(43, 119, '2000', '2162022', 'Finished', '2022-02-16', '2022-02-16', '2022-04-01 03:30:01', NULL, '2022-02-28', 0, 7, ''),
(44, 105, '10000', '21620222', 'Finished', '2022-02-16', '2022-02-16', '2022-03-03 04:20:45', NULL, '2022-03-09', 0, 11, ''),
(45, 57, '500', '2232022', 'Finished', '2022-02-23', '2022-02-22', '2022-02-24 03:20:30', NULL, '2022-03-03', 0, 33, ''),
(46, 117, '200', '22320221', 'Finished', '2022-02-23', '2022-02-24', '2022-02-28 02:48:26', NULL, '2022-03-02', 0, 28, ''),
(47, 189, '1000', '382022', 'Finished', '2022-03-08', '2022-03-08', '2022-03-09 01:54:09', NULL, '2022-03-31', 0, 12, ''),
(48, 119, '2000', '3820222', 'Finished', '2022-03-08', '2022-03-08', '2022-03-21 02:01:47', NULL, '2022-03-25', 0, 7, ''),
(49, 118, '1500', '3820221', 'Scheduled', '2022-03-08', '2022-03-08', '2022-03-29 00:32:57', NULL, '2022-03-25', 0, 7, ''),
(51, 32, '500', '3820224', 'Finished', '2022-03-08', '2022-03-08', '2022-03-21 03:08:09', NULL, '2022-03-25', 0, 0, ''),
(52, 191, '250', '3152022', 'Finished', '2022-03-15', '2022-03-15', '2022-03-21 02:01:37', NULL, '2022-03-25', 0, 9, ''),
(53, 115, '400', '4220225', 'Finished', '2022-03-14', '2022-03-15', '2022-03-16 00:39:35', NULL, '2022-03-18', 0, 9, ''),
(54, 190, '200', '4220224', 'Finished', '2022-03-14', '2022-03-15', '2022-03-21 03:08:00', NULL, '2022-03-18', 0, 9, ''),
(55, 68, '200', '4220223', 'Finished', '2022-03-14', '2022-03-15', '2022-03-22 21:52:52', NULL, '2022-03-18', 0, 9, ''),
(56, 95, '200', '4220222', 'Finished', '2022-03-14', '2022-03-15', '2022-03-16 00:40:04', NULL, '2022-03-18', 0, 9, ''),
(57, 89, '200', '4220221', 'Finished', '2022-03-14', '2022-03-15', '2022-03-21 03:07:48', NULL, '2022-03-18', 0, 9, ''),
(58, 62, '300', '422022', 'Finished', '2022-03-14', '2022-03-15', '2022-03-16 00:39:51', NULL, '2022-03-18', 0, 9, ''),
(59, 166, '250', '31620221', 'Finished', '2022-03-16', '2022-03-16', '2022-03-17 03:39:01', NULL, '2022-03-18', 0, 0, ''),
(60, 165, '250', '3162022', 'Finished', '2022-03-16', '2022-03-16', '2022-03-17 03:38:50', NULL, '2022-03-18', 0, 0, ''),
(61, 57, '1000', '3212022', 'Scheduled', '2022-03-21', '2022-03-21', '0000-00-00 00:00:00', NULL, '2022-04-01', 0, 33, ''),
(62, 189, '2000', '3222022', 'Finished', '2022-03-22', '2022-03-21', '2022-03-22 21:52:39', NULL, '2022-03-31', 0, 12, ''),
(63, 182, '3000', '3292022', 'Bottling', '2022-03-29', '2022-03-29', '2022-04-04 00:01:07', NULL, '2022-04-30', 0, 10, ''),
(64, 119, '3000', '32920221', 'Scheduled', '2022-03-29', '2022-03-29', '0000-00-00 00:00:00', NULL, '2022-04-30', 0, 7, ''),
(65, 62, '300', '32920222', 'Scheduled', '2022-03-29', '2022-03-29', '0000-00-00 00:00:00', NULL, '2022-04-08', 0, 8, ''),
(66, 120, '3000', '32920223', 'Sorting', '2022-03-29', '2022-03-29', '2022-04-04 00:03:07', NULL, '2022-04-29', 0, 7, ''),
(67, 116, '200', '442022', 'Scheduled', '2022-04-04', '2022-04-04', '0000-00-00 00:00:00', NULL, '2022-04-08', 0, 28, ''),
(68, 57, '200', '4720221', 'Scheduled', '2022-04-07', '2022-04-07', '0000-00-00 00:00:00', NULL, '2022-04-12', 0, 33, '');

-- --------------------------------------------------------

--
-- Table structure for table `prod_products`
--

CREATE TABLE `prod_products` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `item_number` varchar(200) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `packaging` varchar(200) DEFAULT NULL,
  `current_stock` varchar(100) DEFAULT NULL,
  `fda_validity` date DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prod_products`
--

INSERT INTO `prod_products` (`id`, `name`, `brand`, `item_number`, `content`, `packaging`, `current_stock`, `fda_validity`, `date_created`, `date_updated`) VALUES
(24, 'Sodium Bicarbonate', NULL, 'FC01-22', '25 kgs', 'Bag', '', '0000-00-00', '2022-01-13 00:41:43', '2022-01-13 00:48:54'),
(25, 'Dipotassium Phosphate', NULL, 'FC02-22', '25 kgs', 'Bag', '', '0000-00-00', '2022-01-13 00:42:18', '2022-01-13 00:49:18'),
(26, 'Magnesium Sulfate', NULL, 'FC03-22', '25 kgs', 'Bag', '', '0000-00-00', '2022-01-13 00:44:30', '2022-01-13 01:26:07'),
(27, 'Mono Ammonium Phosphate', NULL, 'FC04-22', '25 kgs', 'Bag', '', '0000-00-00', '2022-01-13 00:44:44', '2022-01-13 01:25:54'),
(28, 'Ferrous Sulphate', NULL, 'FC05-22', '25 kgs', 'Bag', '', '0000-00-00', '2022-01-13 00:44:54', '2022-01-13 01:25:42'),
(29, 'Calcium EDTA', NULL, 'FC06-22', '45 kgs', 'Drum', '', '0000-00-00', '2022-01-13 00:45:03', '2022-01-13 01:25:29'),
(30, 'Urea', NULL, 'FC07-22', '50 kgs', 'Bag', '', '0000-00-00', '2022-01-13 00:45:11', '2022-01-13 00:54:07'),
(31, 'Caustic Soda', NULL, 'FC08-22', '25 kgs', 'Bag', '', '0000-00-00', '2022-01-13 00:45:21', '2022-01-13 01:25:16'),
(32, 'Spirulina Filipina', NULL, 'DS-PUSP', '70 capsules x 500 mg', 'D12 Bottle', '552', '2022-04-09', '2022-01-13 01:48:45', '2022-02-27 22:14:12'),
(33, 'Spiruzyme C', NULL, 'DS-SPZC', '60 capsules x 500 mg', 'D12 Bottle', '101', '2023-06-02', '2022-01-13 01:49:27', '2022-02-27 22:05:39'),
(34, 'Spiruzyme D', NULL, 'DS-SPZD', '60 capsules x 500 mg', 'D12 Bottle', '441', '2023-04-14', '2022-01-13 01:50:12', '2022-02-27 22:13:47'),
(35, 'Spiruzyme R', NULL, 'DS-SPZR', '60 capsules x 500 mg', 'D12 Bottle', '83', '2023-11-11', '2022-01-13 01:51:00', '2022-02-27 22:06:09'),
(36, 'Oleogel Protect', NULL, 'DS-OLPR', '60 softgels x 500 mg', 'D12 Bottle', '', '2024-05-23', '2022-01-13 01:51:40', '0000-00-00 00:00:00'),
(37, 'Spirustamin Extreme', NULL, 'DS-SPSX', '60 capsules x 500 mg', 'D12 Bottle', '', '2023-06-02', '2022-01-13 01:52:23', '0000-00-00 00:00:00'),
(38, 'Spiru HD', NULL, 'DS-SPHD', '60 capsules x 500 mg', 'D12 Bottle', '155', '2024-02-18', '2022-01-13 01:53:36', '2022-02-27 22:19:36'),
(39, 'Spirumer', NULL, 'DS-SPRM', '60 capsules x 500 mg', 'D12 Bottle', '12', '2022-07-13', '2022-01-13 01:54:14', '2022-02-27 22:05:05'),
(40, 'Equilina', NULL, 'EC-EQLI', '105 grams x 150 mg', 'HD120 Bottle', '5', '2022-09-25', '2022-01-13 03:02:22', '2022-02-27 21:57:44'),
(41, 'EquiCee', NULL, 'EC-EQCE', '90 capsules x 500 mg', 'HD120 Bottle', '28', '2024-09-20', '2022-01-13 03:03:00', '2022-02-27 21:58:55'),
(42, 'EquiBerry', NULL, 'EC-EQBE', '90 capsules x 500 mg', 'HD120 Bottle', '102', '2024-02-19', '2022-01-13 03:03:35', '2022-02-27 21:59:30'),
(43, 'Equi KD', NULL, 'EC-EQKD', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-08-11', '2022-01-13 03:04:17', '0000-00-00 00:00:00'),
(44, 'Equi R+', NULL, 'EC-EQR+', '90 capsules x 500 mg', 'HD120 Bottle', '5', '2024-02-19', '2022-01-13 03:05:07', '2022-02-27 21:58:04'),
(45, 'Equi D+', NULL, 'EC-EQD+', '90 capsules x 500 mg', 'HD120 Bottle', '', '2024-03-27', '2022-01-13 03:05:49', '0000-00-00 00:00:00'),
(46, 'Equi BP', NULL, 'EC-EQBP', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-07-23', '2022-01-13 03:06:26', '0000-00-00 00:00:00'),
(47, 'EquiShock', NULL, 'EC-EQSH', '90 capsules x 500 mg', 'HD120 Bottle', '', '2023-03-27', '2022-01-13 03:07:06', '0000-00-00 00:00:00'),
(48, 'EquiProtect', NULL, 'EC-EQPR', '90 capsules x 500 mg', 'HD120 Bottle', '', '2023-04-17', '2022-01-13 03:07:45', '0000-00-00 00:00:00'),
(49, 'EquiMushroom', NULL, 'EC-EQMR', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-08-07', '2022-01-13 03:08:47', '0000-00-00 00:00:00'),
(50, 'EquiGlucose', NULL, 'EC-EQGL', '90 capsules x 500 mg', 'HD120 Bottle', '38', '2022-04-07', '2022-01-13 03:09:34', '2022-02-27 21:58:44'),
(51, 'EquiNephro', NULL, 'EC-EQNP', '90 capsules x 500 mg', 'HD120 Bottle', '', '2020-08-07', '2022-01-13 03:10:11', '0000-00-00 00:00:00'),
(52, 'EquiCinogen', NULL, 'EC-EQCI', '60 softgels x 500 mg', 'HD120 Bottle', '', '2022-08-11', '2022-01-13 03:10:45', '2022-01-13 03:15:55'),
(53, 'EquiCrea', NULL, 'EC-EQCR', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-08-14', '2022-01-13 03:11:19', '2022-01-13 03:15:21'),
(54, 'EquiStimulator', NULL, 'EC-EQST', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-07-23', '2022-01-13 03:12:38', '0000-00-00 00:00:00'),
(55, 'Equi CSC', NULL, 'EC-EQCS', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-08-13', '2022-01-13 03:13:27', '0000-00-00 00:00:00'),
(56, 'EquiZyme', NULL, 'EC-EQZY', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-08-12', '2022-01-13 03:14:20', '0000-00-00 00:00:00'),
(57, 'Ultima 17', NULL, 'EC-UL17', '90 capsules x 500 mg', 'HD120 Bottle', '38', '2023-12-18', '2022-01-13 03:15:04', '2022-02-27 22:16:48'),
(58, 'Boostamina', NULL, 'TR-BSTM', '90 capsules x 500 mg', 'HD120 Bottle', '65', '2022-06-16', '2022-01-13 03:58:23', '2022-02-27 22:08:08'),
(59, 'BP Lina', NULL, 'TR-BPLN', '90 capsules x 500 mg', 'HD120 Bottle', '117', '2022-06-16', '2022-01-13 03:59:41', '2022-02-27 22:20:06'),
(60, 'Chlopizyme', NULL, 'TR-CLPZ', '90 capsules x 500 mg', 'HD120 Bottle', '7', '2022-06-26', '2022-01-13 04:00:32', '2022-02-27 21:58:33'),
(61, 'Celenzyme', NULL, 'TR-CLZM', '90 capsules x 500 mg', 'HD120 Bottle', '265', '2023-03-16', '2022-01-13 04:01:57', '2022-02-27 22:22:24'),
(62, 'Celeronia Juice', NULL, 'TR-CLNJ', '500 mL', '500 mL Curved Bottle', '39', '2023-01-25', '2022-01-13 04:03:01', '2022-02-27 22:09:22'),
(63, 'Celeronia', NULL, 'TR-CLRN', '90 capsules x 500 mg', 'HD120 Bottle', '442', '2023-01-23', '2022-01-13 04:05:03', '2022-02-27 22:17:46'),
(64, 'Drexum', NULL, 'TR-DRXM', '90 capsules x 500 mg', 'HD120 Bottle', '99', '2024-01-09', '2022-01-13 04:06:06', '2022-02-27 22:01:25'),
(65, 'Dialina', NULL, 'TR-DIAL', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-08-25', '2022-01-13 04:06:49', '0000-00-00 00:00:00'),
(66, 'Excrea', NULL, 'TR-EXCR', '90 capsules x 500 mg', 'HD120 Bottle', '16', '2022-08-06', '2022-01-13 04:07:40', '2022-02-27 21:52:43'),
(67, 'GX-100', NULL, 'TR-G100', '90 capsules x 500 mg', 'HD120 Bottle', '152', '2022-04-10', '2022-01-13 04:08:18', '2022-02-27 21:55:31'),
(68, '8 Guardian Mushrooms', NULL, 'TR-8GDM', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-05-08', '2022-01-13 04:09:09', '0000-00-00 00:00:00'),
(69, 'GX Nutrimix', NULL, 'TR-GNUT', '12 grams', 'Alu Foil', '258', '2023-03-12', '2022-01-13 04:10:01', '2022-02-27 22:10:09'),
(70, 'GX Juice 50g', NULL, 'TR-GJUIC', '50 grams', 'Clear Plastic Sachet', '113', '2022-11-27', '2022-01-13 04:11:06', '2022-02-27 22:09:50'),
(71, 'Ilumwhite Plus', NULL, 'TR-ILWP', '60 capsules x 750 mg', 'HD120 Bottle', '78', '2025-01-21', '2022-01-13 04:12:00', '2022-02-27 22:01:12'),
(72, 'KD Lina', NULL, 'TR-KDLN', '90 capsules x 500 mg', 'HD120 Bottle', '23', '2022-05-16', '2022-01-13 04:12:42', '2022-02-27 21:51:33'),
(73, 'Lungnoma', NULL, 'TR-LGNM', '90 capsules x 500 mg', 'HD120 Bottle', '98', '2022-08-05', '2022-01-13 04:13:18', '2022-02-27 22:19:47'),
(74, 'Brazilian Contour', NULL, 'TR-BRCO', '90 capsules x 500 mg', 'HD120 Bottle', '96', '2022-09-26', '2022-01-13 04:14:13', '2022-02-27 22:18:30'),
(75, 'Age Classique', NULL, 'TR-AGEC', '90 capsules x 500 mg', 'HD120 Bottle', '45', '2022-09-08', '2022-01-13 04:14:54', '2022-02-27 21:53:10'),
(76, 'Berry Orac', NULL, 'TR-BEOR', '90 capsules x 500 mg', 'HD120 Bottle', '95', '0000-00-00', '2022-01-13 04:15:45', '2022-02-27 21:53:41'),
(77, 'Oleogel Synergy', NULL, 'TR-OLSY', '90 softgels x 500 mg', 'HD120 Bottle', '77', '2022-05-11', '2022-01-13 04:16:55', '2022-02-27 22:14:37'),
(78, 'Oleogel Protect', NULL, 'TR-OLPR', '90 softgels x 500 mg', 'HD120 Bottle', '462', '2024-05-23', '2022-01-13 04:17:52', '2022-02-27 22:17:16'),
(79, 'Oleogel FC', NULL, 'TR-OLFC', '90 softgels x 500 mg', 'HD120 Bottle', '107', '2023-04-17', '2022-01-13 04:18:29', '2022-02-27 21:53:54'),
(80, 'Oleogel Syrup', NULL, 'TR-OLSP', '50 mL', 'Amber Glass Bottle', '5', '2022-04-14', '2022-01-13 04:19:13', '2022-02-27 22:12:42'),
(81, 'Prostiglands', NULL, 'TR-PROS', '90 capsules x 500 mg', 'HD120 Bottle', '97', '2022-04-16', '2022-01-13 04:19:49', '2022-02-27 22:20:24'),
(82, 'Nutrimune', NULL, 'TR-NUTM', '90 capsules x 500 mg', 'HD120 Bottle', '2', '2022-08-05', '2022-01-13 04:20:26', '2022-02-27 21:57:29'),
(83, 'Rejuve C', NULL, 'TR-REJC', '90 capsules x 500 mg', 'HD120 Bottle', '67', '2023-03-16', '2022-01-13 04:21:06', '2022-02-27 22:01:39'),
(84, 'R Plus', NULL, 'TR-RPLS', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-04-10', '2022-01-13 04:21:38', '0000-00-00 00:00:00'),
(85, 'Revive 21 500 mL', NULL, 'TR-RVV5', '500 mL', '500 mL Fat Bottle', '121', '2024-06-10', '2022-01-13 04:23:36', '2022-02-27 22:15:40'),
(86, 'Revive 21 1 Liter', NULL, 'TR-RVV1', '1000 mL', '1000 mL HDPE Bottle', '', '2024-06-10', '2022-01-13 04:24:52', '0000-00-00 00:00:00'),
(87, 'Seed-Alina', NULL, 'TR-SEAL', '90 capsules x 500 mg', 'HD120 Bottle', '59', '2020-05-17', '2022-01-13 04:25:51', '2022-02-27 21:51:52'),
(88, 'SD (+)', NULL, 'TR-SDPL', '90 capsules x 500 mg', 'HD120 Bottle', '110', '2022-04-10', '2022-01-13 04:26:30', '2022-02-27 22:22:06'),
(89, 'Spiru KD', NULL, 'TR-SPKD', '90 capsules x 500 mg', 'HD120 Bottle', '33', '2024-06-10', '2022-01-13 04:27:06', '2022-02-27 21:59:13'),
(90, 'Spiru KD+', NULL, 'TR-SKD+', '90 capsules x 500 mg', 'HD120 Bottle', '', '2024-06-10', '2022-01-13 04:27:48', '0000-00-00 00:00:00'),
(91, 'Spiru Aronia', NULL, 'TR-SPAR', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-05-19', '2022-01-13 04:28:26', '0000-00-00 00:00:00'),
(92, 'Spirutawa', NULL, 'TR-SPTA', '90 capsules x 500 mg', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 04:29:09', '0000-00-00 00:00:00'),
(93, 'Spirulina Powder 5g', NULL, 'TR-SP5G', '5 grams', 'Alu Foil', '', '0000-00-00', '2022-01-13 04:30:01', '0000-00-00 00:00:00'),
(94, 'Spirulina Blue Label 60\'s', NULL, 'TR-SBL6', '60 capsules x 500 mg', 'D12 Bottle', '', '2018-11-14', '2022-01-13 04:31:05', '0000-00-00 00:00:00'),
(95, 'Spirulina Blue Label 90\'s', NULL, 'TR-SBL9', '90 capsules x 500 mg', 'HD120 Bottle', '26', '2018-11-14', '2022-01-13 04:31:58', '2022-02-27 21:54:47'),
(96, 'Spirulina Tablet 100g', NULL, 'TR-STAB', '100 grams x 250 mg', 'HD120 Bottle', '48', '0000-00-00', '2022-01-13 04:32:46', '2022-02-27 22:14:56'),
(97, 'Zyme D XTRM', NULL, 'TR-ZDXT', '90 capsules x 500 mg', 'HD120 Bottle', '183', '2022-04-06', '2022-01-13 04:33:23', '2022-02-27 22:21:30'),
(98, 'Nutrimune Plus', NULL, 'TR-NUPL', '90 capsules x 500 mg', 'HD120 Bottle', '39', '2022-08-05', '2022-01-13 04:33:56', '2022-02-27 22:07:33'),
(99, 'Real C', NULL, 'TR-REAL', '90 capsules x 500 mg', 'HD120 Bottle', '227', '2022-04-13', '2022-01-13 04:34:25', '2022-02-27 22:18:45'),
(100, 'Kidcure', NULL, 'TR-KICU', '90 capsules x 500 mg', 'HD120 Bottle', '229', '2023-01-15', '2022-01-13 04:34:52', '2022-02-27 22:21:05'),
(101, 'Oramist', NULL, 'TR-ORMT', '50 mL', 'Amber Glass Bottle', '', '2022-12-14', '2022-01-13 04:35:31', '0000-00-00 00:00:00'),
(102, 'Spiru C Extreme', NULL, 'TR-SCEX', '90 capsules x 500 mg', 'HD120 Bottle', '104', '2023-12-21', '2022-01-13 04:36:02', '2022-02-27 22:20:46'),
(103, 'VNU Spirulina', NULL, 'TR-VNUS', '90 capsules x 500 mg', 'HD120 Bottle', '1259', '2022-08-10', '2022-01-13 04:36:39', '2022-02-27 22:18:15'),
(104, 'Spirulina Tablet 175g', NULL, 'TR-STBG', '175 grams x 250 mg', 'D28 Bottle', '102', '0000-00-00', '2022-01-13 04:37:30', '2022-02-27 22:22:48'),
(105, 'Go Green', NULL, 'RE-GREE', '200 tablets x 250 mg', 'D12 Bottle', '', '2024-02-26', '2022-01-13 21:57:11', '0000-00-00 00:00:00'),
(106, 'Go Zyme', NULL, 'RE-ZYME', '60 capsules x 500 mg', 'D12 Bottle', '', '2024-02-21', '2022-01-13 21:57:51', '0000-00-00 00:00:00'),
(107, 'Go Defend', NULL, 'RE-DEFE', '60 capsules x 500 mg', 'D12 Bottle', '', '2024-02-26', '2022-01-13 21:58:34', '0000-00-00 00:00:00'),
(108, 'Go Heart and Brain', NULL, 'RE-HEBR', '60 capsules x 500 mg', 'D12 Bottle', '', '2022-04-21', '2022-01-13 21:59:17', '0000-00-00 00:00:00'),
(109, 'Go Kidney Beans', NULL, 'GO-KIBE', '60 capsules x 500 mg', 'D12 Bottle', '', '2022-04-14', '2022-01-13 21:59:51', '0000-00-00 00:00:00'),
(110, 'Go Breaker', NULL, 'RE-BREA', '60 capsules x 500 mg', 'D12 Bottle', '', '2022-04-23', '2022-01-13 22:01:38', '2022-01-13 22:01:53'),
(111, 'Go White', NULL, 'RE-WHIT', '60 capsules x 750 mg', 'D12 Bottle', '', '2022-04-13', '2022-01-13 22:03:04', '0000-00-00 00:00:00'),
(112, 'Go Protect', NULL, 'RE-PROT', '60 capsules x 500 mg', 'D12 Bottle', '', '2022-04-07', '2022-01-13 22:03:53', '0000-00-00 00:00:00'),
(113, 'Go Proseum', NULL, 'RE-PROS', '60 capsules x 500 mg', 'D12 Bottle', '', '2022-04-13', '2022-01-13 22:04:25', '0000-00-00 00:00:00'),
(114, 'Resset', NULL, 'HI-WHSH', '30 capsules x 750 mg', 'C07 Bottle', '', '2025-03-11', '2022-01-13 22:06:08', '2022-01-13 22:06:19'),
(115, 'Detoxiprime', NULL, 'HI-DETO', '90 capsules x 750 mg', 'D28 Bottle', '37', '2024-12-23', '2022-01-13 22:07:23', '2022-02-27 22:16:35'),
(116, 'AB 17', NULL, 'DD-AB17', '90 capsules x 500 mg', 'HD120 Bottle', '40', '0000-00-00', '2022-01-13 22:08:06', '2022-02-27 22:06:43'),
(117, 'ASE Enzyme', NULL, 'DD-ASEN', '90 capsules x 500 mg', 'D12 Bottle', '29', '0000-00-00', '2022-01-13 22:08:47', '2022-02-27 22:04:52'),
(118, 'Gluta Power Boost 8Enhances', NULL, 'GL-GPBE', '60 capsules x 500 mg', 'D12 Bottle', '', '2024-04-03', '2022-01-13 22:11:01', '2022-01-13 22:12:22'),
(119, 'Superfood 8Protects', NULL, 'GL-SF8P', '60 capsules x 500 mg', 'D12 Bottle', '', '2024-04-03', '2022-01-13 22:12:04', '0000-00-00 00:00:00'),
(120, 'Spirulina 8Nourishes', NULL, 'GL-SP8N', '200 tablets x 250 mg', 'D12 Bottle', '155', '2024-04-03', '2022-01-13 22:13:45', '2022-02-27 22:14:24'),
(121, 'Ultima Slim', NULL, 'BM-ULSL', '60 capsules x 500 mg', 'HD120 Bottle', '', '2024-06-13', '2022-01-13 22:14:35', '0000-00-00 00:00:00'),
(122, 'Ultima Protect', NULL, 'BM-ULPR', '60 capsules x 500 mg', 'HD120 Bottle', '', '2024-06-18', '2022-01-13 22:15:26', '0000-00-00 00:00:00'),
(123, 'Ultima White', NULL, 'BM-ULWH', '60 capsules x 500 mg', 'HD120 Bottle', '', '2024-05-07', '2022-01-13 22:17:47', '0000-00-00 00:00:00'),
(124, 'Slendwhite', NULL, 'UC-SLWH', '30 capsules x 500 mg', 'C07 Bottle', '', '2022-02-26', '2022-01-13 22:18:52', '0000-00-00 00:00:00'),
(125, 'Up Boost', NULL, 'UC-UPBO', '30 capsules x 500 mg', 'C07 Bottle', '', '2022-02-18', '2022-01-13 22:22:29', '0000-00-00 00:00:00'),
(126, 'Natura C', NULL, 'UC-NATC', '30 capsules x 500 mg', 'C07 Bottle', '', '2022-04-14', '2022-01-13 22:26:34', '0000-00-00 00:00:00'),
(127, 'Noyuma', NULL, 'LR-NOYU', '30 capsules x 500 mg', 'C07 Bottle', '', '2022-02-26', '2022-01-13 22:27:32', '0000-00-00 00:00:00'),
(128, 'Sleepify', NULL, 'LR-SLEE', '30 capsules x 500 mg', 'C07 Bottle', '', '2022-03-11', '2022-01-13 22:28:42', '0000-00-00 00:00:00'),
(129, 'Active Growth', NULL, 'LR-ACGR', '30 capsules x 500 mg', 'C07 Bottle', '', '2022-03-10', '2022-01-13 22:29:48', '0000-00-00 00:00:00'),
(130, 'Man Up', NULL, 'NW-MAUP', '60 capsules x 500 mg', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 22:30:50', '0000-00-00 00:00:00'),
(131, 'Spirulina', NULL, 'GN-SPIR', '400 tablets x 250 mg / 100 g', 'HD120 Bottle', '', '2022-07-22', '2022-01-13 22:31:54', '0000-00-00 00:00:00'),
(132, 'Get Boost', NULL, 'GN-GEBO', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-07-30', '2022-01-13 22:33:59', '0000-00-00 00:00:00'),
(133, 'Viramed Synergy Syrup', NULL, 'GN-VISY', '50 mL', 'Amber Glass Bottle', '', '2022-07-21', '2022-01-13 22:35:57', '0000-00-00 00:00:00'),
(134, 'Viramed Synergy', NULL, 'GN-VIPS', '90 capsules x 500 mg', 'HD120 Bottle', '25', '2022-07-24', '2022-01-13 22:37:10', '2022-02-27 22:02:59'),
(135, 'Nu3mune', NULL, 'GN-NU3M', '90 capsules x 500 mg', 'HD120 Bottle', '17', '2022-08-24', '2022-01-13 22:38:06', '2022-02-27 22:03:12'),
(136, 'C-Complex', NULL, 'GN-CCOM', '90 capsules x 500 mg', 'HD120 Bottle', '9', '2022-07-24', '2022-01-13 22:40:22', '2022-02-27 22:02:38'),
(137, 'Cellglow', NULL, 'WP-CELL', '60 capsules x 500 mg', 'HD120 Bottle', '21', '2022-09-16', '2022-01-13 22:41:16', '2022-02-27 21:55:44'),
(138, 'Cellglow Juice', NULL, 'WP-CEJU', '500 mL', '500 mL HDPE Bottle', '', '2022-09-17', '2022-01-13 22:42:38', '0000-00-00 00:00:00'),
(139, 'Cellibido', NULL, 'WP-CELI', '60 capsules x 500 mg', 'HD120 Bottle', '9', '2022-09-11', '2022-01-13 22:43:23', '2022-02-27 21:55:57'),
(140, 'Cellumina', NULL, 'WP-CEMN', '60 capsules x 500 mg', 'HD120 Bottle', '57', '2022-12-21', '2022-01-13 22:43:56', '2022-02-27 21:56:12'),
(141, 'Camucamu-C', NULL, 'WP-CAMC', '60 capsules x 500 mg', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 22:44:43', '0000-00-00 00:00:00'),
(142, 'Viralution Drops', NULL, 'WP-VIRA', '50 mL', 'Amber Glass Bottle', '', '2022-09-11', '2022-01-13 22:45:48', '0000-00-00 00:00:00'),
(143, 'Lung Detox', NULL, 'LA-LUDE', '30 softgel x 500mg', 'C07 Bottle', '', '0000-00-00', '2022-01-13 22:46:56', '0000-00-00 00:00:00'),
(144, 'Lumiwhite', NULL, 'AL-ARLU', '30 capsules x 750 mg', 'HD120 Bottle', '10', '2022-09-25', '2022-01-13 22:47:42', '2022-02-27 22:12:21'),
(145, 'Ultimagreen', NULL, 'AL-ARUL', '200 tablets x 250 mg', 'HD120 Bottle', '', '2022-09-29', '2022-01-13 22:48:20', '0000-00-00 00:00:00'),
(146, 'Vitale Forte', NULL, 'JO-VIFO', '90 softgels x 500 mg', 'HD120 Bottle', '5', '2023-01-07', '2022-01-13 22:49:11', '2022-02-27 22:09:10'),
(147, 'Vitale Erexia', NULL, 'JO-VIER', '90 capsules x 500 mg', 'HD120 Bottle', '', '2023-01-12', '2022-01-13 22:49:46', '0000-00-00 00:00:00'),
(148, 'Vitale Core-8C', NULL, 'JO-VICC', '90 capsules x 500 mg', 'HD120 Bottle', '8', '2022-12-29', '2022-01-13 22:50:58', '2022-02-27 22:08:58'),
(149, 'Vitale Flush', NULL, 'JO-VIFU', '90 capsules x 500 mg', 'HD120 Bottle', '16', '2023-01-05', '2022-01-13 22:51:48', '2022-02-27 22:08:33'),
(150, 'Vitale Contour', NULL, 'JO-VISH', '90 capsules x 500 mg', 'HD120 Bottle', '12', '2023-01-06', '2022-01-13 22:52:45', '2022-02-27 22:08:46'),
(151, 'Vitale Rich', NULL, 'JO-VIEN', '90 capsules x 500 mg', 'HD120 Bottle', '44', '2023-01-05', '2022-01-13 22:53:18', '2022-02-27 22:08:21'),
(152, 'Pflazenole', NULL, 'AH-PFZL', '90 capsules x 500 mg', 'HD120 Bottle', '', '2022-11-15', '2022-01-13 22:54:12', '0000-00-00 00:00:00'),
(153, 'Recupera', NULL, 'AH-RECU', '', '', '', '0000-00-00', '2022-01-13 22:54:41', '0000-00-00 00:00:00'),
(154, 'Spirulina Plus', NULL, 'AH-SPPL', '90 capsules x 500 mg', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 22:55:25', '0000-00-00 00:00:00'),
(155, 'Spirulina Plus', NULL, 'AH-SPPL', '120 capsules x 750 mg', 'D28 Bottle', '', '0000-00-00', '2022-01-13 22:56:08', '0000-00-00 00:00:00'),
(156, 'Ping', NULL, 'AH-PING', '', '', '', '0000-00-00', '2022-01-13 22:56:26', '0000-00-00 00:00:00'),
(157, 'Boostcumin', NULL, 'WU-CB21', '60 capsules x 750 mg', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 22:57:07', '0000-00-00 00:00:00'),
(158, 'Gr8-C', NULL, 'WU-NEGC', '160 tablets x 250 mg / 40 g', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 22:57:50', '0000-00-00 00:00:00'),
(159, 'Renew 3G', NULL, 'TR-ILWP', '60 capsules x 750 mg', 'HD120 Bottle', '20', '2023-05-05', '2022-01-13 22:58:28', '2022-02-27 22:02:25'),
(160, 'Longevite Softgel', NULL, 'WU-LONG', '', '', '', '2022-09-22', '2022-01-13 22:58:58', '0000-00-00 00:00:00'),
(161, 'Boostamina', NULL, 'WU-BOOS', '', '', '', '2022-06-16', '2022-01-13 22:59:22', '0000-00-00 00:00:00'),
(162, 'White Science', NULL, 'BH-WHSC', '60 capsules x 750 mg', 'HD120 Bottle', '', '2023-03-16', '2022-01-13 23:00:12', '0000-00-00 00:00:00'),
(163, 'Immunoadvance', NULL, 'BH-IMAD', '60 capsules x 750 mg', 'HD120 Bottle', '', '2023-02-15', '2022-01-13 23:00:56', '0000-00-00 00:00:00'),
(164, 'Age Defy', NULL, 'BH-AGDE', '90 capsules x 500 mg', 'HD120 Bottle', '', '2023-02-15', '2022-01-13 23:01:49', '0000-00-00 00:00:00'),
(165, 'CBBC Spirulina 360 Tabs', NULL, 'CB-360T', '360 tablets x 250 mg', 'Clear Plastic Sachet', '', '0000-00-00', '2022-01-13 23:02:45', '0000-00-00 00:00:00'),
(166, 'CBBC Spirulina 240 Tabs', NULL, 'CB-240T', '240 tablets x 250 mg', 'Clear Plastic Sachet', '', '0000-00-00', '2022-01-13 23:03:38', '0000-00-00 00:00:00'),
(167, 'Chokeberry Juice Blend', NULL, 'AB-CHBL', '500 mL', '500 mL Curved Bottle', '11', '0000-00-00', '2022-01-13 23:04:50', '2022-02-27 22:11:48'),
(168, 'Chokeberry Capsules', NULL, 'AB-CHOK', '90 capsules x 500 mg', 'HD120 Bottle', '22', '0000-00-00', '2022-01-13 23:05:24', '2022-02-27 22:12:04'),
(169, 'Zyme', NULL, 'AD-ZDIB', '90 capsules x 500 mg', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 23:06:03', '0000-00-00 00:00:00'),
(170, 'Spirulina 75G', NULL, 'AB-SP75', '300 tablets x 250 mg', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 23:06:43', '0000-00-00 00:00:00'),
(171, 'Entiere Cee', NULL, 'NX-CATA', '120 tablets', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 23:08:09', '0000-00-00 00:00:00'),
(172, 'Longevite', NULL, 'NC-LOSO', '60 softgels x 500 mg', 'HD120 Bottle', '6', '0000-00-00', '2022-01-13 23:08:40', '2022-02-27 21:58:22'),
(173, 'Reine Berry Capsules', NULL, 'NX-ARCA', '60 capsules x 500 mg', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 23:09:23', '2022-01-13 23:09:39'),
(174, 'Reine Berry Tablets', NULL, 'NX-ARTA', '120 tablets', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 23:10:21', '0000-00-00 00:00:00'),
(175, 'Cerulian 50G', NULL, 'NX-SP50', '200 tablets x 250 mg', 'HD120 Bottle', '', '0000-00-00', '2022-01-13 23:11:05', '0000-00-00 00:00:00'),
(176, 'Reine Berry Juice 500 mL', NULL, 'NX-ARJ5', '500 mL', '500 mL HDPE Bottle', '', '0000-00-00', '2022-01-13 23:12:13', '0000-00-00 00:00:00'),
(177, 'Reine Berry Juice 1L', NULL, 'NX-ARJ1', '1000 mL', '1000 mL HDPE Bottle', '', '0000-00-00', '2022-01-13 23:12:59', '0000-00-00 00:00:00'),
(178, 'LifePlus', NULL, 'TR-DMLP', '90 capsules x 500 mg', 'Blister foil', '', '2022-01-16', '2022-01-13 23:13:39', '2022-01-14 02:18:03'),
(179, 'Botany IV', NULL, 'TR-DMLP', '90 capsules x 500 mg', 'Blister foil', '', '2022-02-16', '2022-01-13 23:14:18', '0000-00-00 00:00:00'),
(180, 'Botany RV', NULL, 'TR-BOIV', '90 capsules x 500 mg', 'Blister foil', '', '2022-07-16', '2022-01-13 23:15:01', '0000-00-00 00:00:00'),
(181, 'Botany IV Plus', NULL, 'BO-OLSP', '50 mL', 'Amber Glass Bottle', '', '2022-08-28', '2022-01-13 23:15:45', '0000-00-00 00:00:00'),
(182, 'Spirulina Tablets ADD', NULL, 'ADD-SPRT-B', 'Spirulina Tablets 250mg', '250mg tablets / 700tablets / 175g / D28 bottle', '7', '2023-01-30', '2022-01-17 04:25:42', '2022-02-27 22:13:05'),
(183, 'Vaporizing Essence', NULL, '', 'Vaporizing Essence Oil', '10ml', '', '2025-01-01', '2022-01-20 21:02:00', '2022-01-25 09:04:41'),
(184, 'Altaimune', NULL, 'WP-SYSY', '50 ml', 'Amber Glass Bottle', '51', '0000-00-00', '2022-02-03 02:31:58', '2022-02-27 22:12:53'),
(185, 'Equi Glutaheart', NULL, 'EC-GLUH', '60caps x 800mg', 'HD120 Bottle', '', '0000-00-00', '2022-02-11 02:18:32', '2022-02-11 04:03:31'),
(186, 'Equi Viraquill', NULL, 'EC-SOFS', '90 caps x 500mg', 'HD120 Bottle', '', '0000-00-00', '2022-02-11 02:19:19', '2022-02-11 04:03:17'),
(187, ' Equi Total Care', NULL, 'EC-SUPR', '60 caps x 800mg', 'HD120 Bottle', '', '0000-00-00', '2022-02-11 02:20:22', '2022-02-11 04:03:06'),
(188, 'Equi Spirulina 50g', NULL, 'EC-SPIT', '200 tablets x 250mg', 'HD120 Bottle', '', '0000-00-00', '2022-02-11 02:21:02', '2022-02-11 04:02:46'),
(189, 'Altaimune Inhaler', NULL, 'WP-INHA', '10g', 'Plastic Tube Inhaler', '', '2024-01-31', '2022-03-07 19:18:47', '0000-00-00 00:00:00'),
(190, 'Spiru Diacare', NULL, 'TR-SPDC', '90 caps x 500mg', 'HD120', '', '2025-12-14', '2022-03-13 19:18:35', '0000-00-00 00:00:00'),
(191, 'Villacare Spirulina', NULL, '', '90 caps x 500mg', 'HD120', '', '2024-12-30', '2022-03-14 20:36:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `prod_samples_request`
--

CREATE TABLE `prod_samples_request` (
  `id` int(11) NOT NULL,
  `product_id` text NOT NULL,
  `qty` varchar(200) DEFAULT NULL,
  `urgency` varchar(100) DEFAULT NULL,
  `requested_by` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `customer_id` text,
  `date_request` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  `comments` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prod_samples_request`
--

INSERT INTO `prod_samples_request` (`id`, `product_id`, `qty`, `urgency`, `requested_by`, `status`, `customer_id`, `date_request`, `delivery_date`, `date_created`, `date_updated`, `comments`) VALUES
(17, 'fsdfsf 23', '5', 'R&D', 'ahsan', 'Finished', 'ahdan232', '2022-01-26', '2022-01-28', '2022-01-26', '2022-01-26 08:13:53', NULL),
(18, 'fsdfsf 23', '5', 'R&D', 'ahsan', 'Finished', 'ahdan232', '2022-01-27', '2022-01-29', '2022-01-27', '2022-01-27 01:01:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rd_samples_history`
--

CREATE TABLE `rd_samples_history` (
  `id` int(11) NOT NULL,
  `product_id` text NOT NULL,
  `qty` varchar(200) DEFAULT NULL,
  `urgency` varchar(100) DEFAULT NULL,
  `requested_by` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `customer_id` text,
  `date_request` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  `comments` text,
  `bmf` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rd_samples_schedule`
--

CREATE TABLE `rd_samples_schedule` (
  `id` int(11) NOT NULL,
  `product_id` varchar(256) NOT NULL,
  `qty` varchar(200) DEFAULT NULL,
  `bmf` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  `delivery_date` date NOT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  `urgency` varchar(100) DEFAULT NULL,
  `requested_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rd_samples_schedule`
--

INSERT INTO `rd_samples_schedule` (`id`, `product_id`, `qty`, `bmf`, `status`, `date`, `date_created`, `date_updated`, `delivery_date`, `customer_id`, `urgency`, `requested_by`) VALUES
(5, '0', '3', 'Gluta-001', 'Finished', '2021-07-21', '2021-07-19', '2021-07-27 13:10:05', '2022-06-03', NULL, NULL, NULL),
(6, 'fsdfsf', '300', 'hhyug', 'Finished', '2021-07-23', '2021-07-23', '2021-07-27 13:15:30', '2021-07-28', NULL, NULL, NULL),
(7, 'fsdfsf', '5', '', 'On Process', '2021-07-27', '2021-07-27', '2021-07-31 10:58:23', '2021-07-27', NULL, NULL, NULL),
(8, 'Testg', '34', '', 'Finished', '2021-06-22', '2021-07-31', '2021-07-31 10:59:31', '0000-00-00', NULL, NULL, NULL),
(9, 'VCO Softgel (500 mg)', '0', '', 'Finished', '2021-09-09', '2022-01-25', '2022-01-25 01:52:37', '2021-09-09', NULL, NULL, NULL),
(10, 'Zinc Chewable 750 mg', '0', '', 'Finished', '2021-09-09', '2022-01-25', '2022-01-25 01:52:26', '2021-09-09', NULL, NULL, NULL),
(11, 'Vitamin C chewable (150mg)', '0', '', 'Finished', '2021-09-09', '2022-01-25', '2022-01-25 01:52:13', '2021-09-09', NULL, NULL, NULL),
(12, 'produvtdd', '5', '', 'Finished', '2022-01-25', '2022-01-27', '2022-01-27 01:11:31', '2022-01-31', '0', NULL, NULL),
(13, 'bran', '10', 'hhyug', 'Finished', '2022-01-01', '2022-01-27', '2022-01-27 01:16:20', '2022-01-08', '0', 'R&D', 'ahsan'),
(14, 'fsdfsf 23', '51', '', 'Finished', '2022-01-05', '2022-01-27', '2022-01-27 01:24:06', '2022-01-15', 'sdfsdf 232', 'Samples', 'ahsan'),
(15, 'EQUI TOTAL CARE 90c / HD 120', '2', NULL, 'Pending', '2022-02-11', '2022-02-10', '0000-00-00 00:00:00', '2022-02-14', 'Doc Buena', 'Samples', 'Marbz'),
(16, 'EQUI GLUTAHEART 90c / HD120', '2', NULL, 'Pending', '2022-02-11', '2022-02-10', '0000-00-00 00:00:00', '2022-02-14', 'Doc Buena', 'Samples', 'Marbz');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(20) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `company_id`, `created_on`, `name`, `role`, `status`) VALUES
(1, 'admin123', '0192023a7bbd73250516f069df18b500', 23, '2021-01-04 08:35:22', 'Test', 'admin', 1),
(12, 'admin', '21232f297a57a5a743894a0e4a801fc3', 21, '2017-10-20 05:42:29', 'demo 1', 'admin', 1),
(13, 'user1', '21232f297a57a5a743894a0e4a801fc3', 21, '2018-07-31 19:00:33', 'user1', 'user', 0),
(14, 'ahsan1', '21232f297a57a5a743894a0e4a801fc3', 22, '2019-10-30 18:11:39', 'kasbook1', 'admin', 1),
(15, 'user1', '21232f297a57a5a743894a0e4a801fc3', 22, '2019-10-30 18:20:49', 'user1', 'admin', 1),
(16, 'khan', '9e95f6d797987b7da0fb293a760fe57e', 23, '2019-10-30 18:37:16', 'kasbook2', 'admin', 1),
(17, 'test', '098f6bcd4621d373cade4e832627b4f6', 24, '2019-10-30 18:41:54', 'kasbook3', 'admin', 1),
(18, 'test2', '21232f297a57a5a743894a0e4a801fc3', 25, '2019-10-30 18:45:31', 'kasbook4', 'admin', 1),
(19, 'khan2', '21232f297a57a5a743894a0e4a801fc3', 26, '2019-10-30 18:48:24', 'kasbook5', 'admin', 1),
(20, 'smit', 'e69a59fc3b9cf146b0080afaebce07aa', 21, '2020-09-02 17:14:57', 'smit', 'admin', 0),
(21, 'smith', 'a66e44736e753d4533746ced572ca821', 21, '2020-09-02 17:20:04', 'smith', 'user', 0),
(22, 'smith1', 'a66e44736e753d4533746ced572ca821', 21, '2020-09-02 17:32:36', 'smith1', 'user', 0),
(23, 'jack', '4ff9fc6e4e5d5f590c4f2134a8cc96d1', 21, '2020-09-02 17:38:09', 'jack', 'user', 0),
(24, 'admin1', '21232f297a57a5a743894a0e4a801fc3', 22, '2020-10-25 07:56:52', 'test username', 'admin', 1),
(25, 'jay@nns', '1b8354984914bdc2e1dd13e51f17a9d5', 21, '2021-01-08 06:16:05', 'Jay', 'user', 1),
(26, 'princess@nns', '1691bb721412efd4c2510e660f0833ce', 21, '2021-01-08 06:16:33', 'Princess', 'user', 1),
(27, 'accounting', '2ef42dc7b5d1a50c1fc7dbd9c4b772e7', 21, '2021-01-08 06:17:50', 'Accounting', 'user', 0),
(28, 'dennies@nns', '5aeb8c5cff4bf5388fe06a617fbcdd8b', 21, '2021-01-28 06:45:15', 'Dennies', 'user', 1),
(29, 'francis@nns', '73025bc349be097711f21dfcd0f8c7f1', 21, '2021-01-28 06:45:46', 'Francis', 'user', 1),
(30, 'jayzel@nns', '3ba2a6d342ce0e4405397d4aa5ffc68b', 21, '2021-02-18 07:53:09', 'Jayzel', 'user', 1),
(31, 'ahsan', '74870a2fd40b4d9926a5849f64fa2fca', 21, '2021-11-08 17:36:14', 'ahsan', 'user', 0),
(32, 'marben', '336c9742ae25826d50d4c0bdd072b822', 21, '2021-11-18 07:59:06', 'Marben', 'user', 1),
(33, 'tin@nns', '55cf8e0c7036dbb592b04471e6a7ad46', 21, '2022-01-17 09:09:04', 'Tin', 'user', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc_fiscal_years`
--
ALTER TABLE `acc_fiscal_years`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `acc_payments`
--
ALTER TABLE `acc_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `locked` (`locked`,`expire`);

--
-- Indexes for table `farm_feeding`
--
ALTER TABLE `farm_feeding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_grinding`
--
ALTER TABLE `farm_grinding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_harvest`
--
ALTER TABLE `farm_harvest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_inventory`
--
ALTER TABLE `farm_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_inventory_detail`
--
ALTER TABLE `farm_inventory_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_charges`
--
ALTER TABLE `finance_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_deductions`
--
ALTER TABLE `finance_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_expenses`
--
ALTER TABLE `finance_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_expenses_items`
--
ALTER TABLE `finance_expenses_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_exp_items`
--
ALTER TABLE `finance_exp_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_exp_paymentfor`
--
ALTER TABLE `finance_exp_paymentfor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_exp_paymentmethod`
--
ALTER TABLE `finance_exp_paymentmethod`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_exp_subcategory`
--
ALTER TABLE `finance_exp_subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_payment_summary`
--
ALTER TABLE `finance_payment_summary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_sales`
--
ALTER TABLE `finance_sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `invoice_no` (`invoice_no`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `finance_sales_charges`
--
ALTER TABLE `finance_sales_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_sales_deduction`
--
ALTER TABLE `finance_sales_deduction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_sales_items`
--
ALTER TABLE `finance_sales_items`
  ADD PRIMARY KEY (`sale_item_id`),
  ADD KEY `invoice_no` (`invoice_no`,`sale_id`,`item_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `finance_sales_pay_terms`
--
ALTER TABLE `finance_sales_pay_terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_employees`
--
ALTER TABLE `hr_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `pos_categories`
--
ALTER TABLE `pos_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `pos_claims`
--
ALTER TABLE `pos_claims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `pos_currencies`
--
ALTER TABLE `pos_currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `pos_customers`
--
ALTER TABLE `pos_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `company_id_2` (`company_id`);

--
-- Indexes for table `pos_customer_payment_history`
--
ALTER TABLE `pos_customer_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_employees`
--
ALTER TABLE `pos_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `ledger_id` (`salary_acc_code`);

--
-- Indexes for table `pos_employee_payments`
--
ALTER TABLE `pos_employee_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_no` (`invoice_no`,`employee_id`,`account_code`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `pos_emp_modules`
--
ALTER TABLE `pos_emp_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id` (`emp_id`,`module_id`);

--
-- Indexes for table `pos_inventory`
--
ALTER TABLE `pos_inventory`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `ospos_inventory_ibfk_1` (`trans_item`),
  ADD KEY `ospos_inventory_ibfk_2` (`trans_user`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `invoice_no` (`invoice_no`);

--
-- Indexes for table `pos_items`
--
ALTER TABLE `pos_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `company_id_2` (`company_id`),
  ADD KEY `name` (`name`),
  ADD KEY `sku` (`sku`);

--
-- Indexes for table `pos_items_company`
--
ALTER TABLE `pos_items_company`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `item_id` (`item_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `pos_items_detail`
--
ALTER TABLE `pos_items_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `cost_price` (`cost_price`,`unit_price`),
  ADD KEY `avg_cost` (`avg_cost`),
  ADD KEY `item_code` (`item_code`),
  ADD KEY `size_id` (`size_id`);

--
-- Indexes for table `pos_logistics_fees`
--
ALTER TABLE `pos_logistics_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `pos_purchase_requests`
--
ALTER TABLE `pos_purchase_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `pos_receivings`
--
ALTER TABLE `pos_receivings`
  ADD PRIMARY KEY (`receiving_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `invoice_no` (`invoice_no`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pos_receivings_items`
--
ALTER TABLE `pos_receivings_items`
  ADD PRIMARY KEY (`receivings_items_id`),
  ADD KEY `receiving_id` (`receiving_id`,`invoice_no`,`item_id`,`size_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `pos_samples`
--
ALTER TABLE `pos_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `pos_shipping_terms`
--
ALTER TABLE `pos_shipping_terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_sourcings`
--
ALTER TABLE `pos_sourcings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `pos_supplier`
--
ALTER TABLE `pos_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `acc_code` (`acc_code`);

--
-- Indexes for table `pos_supplier_payments`
--
ALTER TABLE `pos_supplier_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_no` (`invoice_no`,`supplier_id`,`account_code`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `ref_account_id` (`ref_account_id`);

--
-- Indexes for table `pos_supplier_payment_history`
--
ALTER TABLE `pos_supplier_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_units`
--
ALTER TABLE `pos_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prod_customers`
--
ALTER TABLE `prod_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prod_customer_payments`
--
ALTER TABLE `prod_customer_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_no` (`invoice_no`,`customer_id`),
  ADD KEY `debit` (`debit`),
  ADD KEY `credit` (`credit`);

--
-- Indexes for table `prod_production_history`
--
ALTER TABLE `prod_production_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prod_production_request`
--
ALTER TABLE `prod_production_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prod_production_schedule`
--
ALTER TABLE `prod_production_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prod_products`
--
ALTER TABLE `prod_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prod_samples_request`
--
ALTER TABLE `prod_samples_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rd_samples_history`
--
ALTER TABLE `rd_samples_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rd_samples_schedule`
--
ALTER TABLE `rd_samples_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_fiscal_years`
--
ALTER TABLE `acc_fiscal_years`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `acc_payments`
--
ALTER TABLE `acc_payments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `farm_feeding`
--
ALTER TABLE `farm_feeding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `farm_grinding`
--
ALTER TABLE `farm_grinding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `farm_harvest`
--
ALTER TABLE `farm_harvest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `farm_inventory`
--
ALTER TABLE `farm_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `farm_inventory_detail`
--
ALTER TABLE `farm_inventory_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `finance_charges`
--
ALTER TABLE `finance_charges`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `finance_deductions`
--
ALTER TABLE `finance_deductions`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `finance_expenses`
--
ALTER TABLE `finance_expenses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `finance_expenses_items`
--
ALTER TABLE `finance_expenses_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `finance_exp_items`
--
ALTER TABLE `finance_exp_items`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `finance_exp_paymentfor`
--
ALTER TABLE `finance_exp_paymentfor`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `finance_exp_paymentmethod`
--
ALTER TABLE `finance_exp_paymentmethod`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `finance_exp_subcategory`
--
ALTER TABLE `finance_exp_subcategory`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `finance_payment_summary`
--
ALTER TABLE `finance_payment_summary`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `finance_sales`
--
ALTER TABLE `finance_sales`
  MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `finance_sales_charges`
--
ALTER TABLE `finance_sales_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `finance_sales_deduction`
--
ALTER TABLE `finance_sales_deduction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `finance_sales_items`
--
ALTER TABLE `finance_sales_items`
  MODIFY `sale_item_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `finance_sales_pay_terms`
--
ALTER TABLE `finance_sales_pay_terms`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hr_employees`
--
ALTER TABLE `hr_employees`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `pos_categories`
--
ALTER TABLE `pos_categories`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pos_claims`
--
ALTER TABLE `pos_claims`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `pos_currencies`
--
ALTER TABLE `pos_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `pos_customers`
--
ALTER TABLE `pos_customers`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_customer_payment_history`
--
ALTER TABLE `pos_customer_payment_history`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_employees`
--
ALTER TABLE `pos_employees`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_employee_payments`
--
ALTER TABLE `pos_employee_payments`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_emp_modules`
--
ALTER TABLE `pos_emp_modules`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1810;
--
-- AUTO_INCREMENT for table `pos_inventory`
--
ALTER TABLE `pos_inventory`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1726;
--
-- AUTO_INCREMENT for table `pos_items`
--
ALTER TABLE `pos_items`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=994;
--
-- AUTO_INCREMENT for table `pos_items_company`
--
ALTER TABLE `pos_items_company`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=994;
--
-- AUTO_INCREMENT for table `pos_items_detail`
--
ALTER TABLE `pos_items_detail`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=989;
--
-- AUTO_INCREMENT for table `pos_logistics_fees`
--
ALTER TABLE `pos_logistics_fees`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `pos_purchase_requests`
--
ALTER TABLE `pos_purchase_requests`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT for table `pos_receivings`
--
ALTER TABLE `pos_receivings`
  MODIFY `receiving_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=649;
--
-- AUTO_INCREMENT for table `pos_receivings_items`
--
ALTER TABLE `pos_receivings_items`
  MODIFY `receivings_items_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1605;
--
-- AUTO_INCREMENT for table `pos_samples`
--
ALTER TABLE `pos_samples`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `pos_shipping_terms`
--
ALTER TABLE `pos_shipping_terms`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `pos_sourcings`
--
ALTER TABLE `pos_sourcings`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `pos_supplier`
--
ALTER TABLE `pos_supplier`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `pos_supplier_payments`
--
ALTER TABLE `pos_supplier_payments`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_supplier_payment_history`
--
ALTER TABLE `pos_supplier_payment_history`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_units`
--
ALTER TABLE `pos_units`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `prod_customers`
--
ALTER TABLE `prod_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `prod_customer_payments`
--
ALTER TABLE `prod_customer_payments`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `prod_production_history`
--
ALTER TABLE `prod_production_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `prod_production_request`
--
ALTER TABLE `prod_production_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `prod_production_schedule`
--
ALTER TABLE `prod_production_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `prod_products`
--
ALTER TABLE `prod_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;
--
-- AUTO_INCREMENT for table `prod_samples_request`
--
ALTER TABLE `prod_samples_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `rd_samples_history`
--
ALTER TABLE `rd_samples_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rd_samples_schedule`
--
ALTER TABLE `rd_samples_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

ALTER TABLE `finance_expenses` ADD `receipted_file` VARCHAR(100) NULL AFTER `note`;

CREATE TABLE `finance_dispatch` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `dispatch_date` date DEFAULT NULL,
 `product_id` int(11) DEFAULT NULL,
 `content` text DEFAULT NULL,
 `custom_content` text DEFAULT NULL,
 `quantity` double(18,4) DEFAULT NULL,
 `type` varchar(100) DEFAULT NULL,
 `customer_id` int(11) DEFAULT NULL,
 `recipient` varchar(150) DEFAULT NULL,
 `approved_by` varchar(100) DEFAULT NULL,
 `date_created` datetime DEFAULT NULL,
 `date_updated` datetime DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `hr_emp_time_requests` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `date_issued` date DEFAULT NULL,
 `issued_by` varchar(200) DEFAULT NULL,
 `emp_id` int(11) DEFAULT NULL,
 `req_period_from` date DEFAULT NULL,
 `req_period_to` date DEFAULT NULL,
 `type` varchar(100) DEFAULT NULL,
 `gm_approved` tinyint(1) DEFAULT NULL,
 `om_approved` tinyint(1) DEFAULT NULL,
 `dm_approved` tinyint(1) DEFAULT NULL,
 `hr_noted` tinyint(1) DEFAULT NULL,
 `ac_noted` tinyint(1) DEFAULT NULL,
 `note` text,
 `date_created` datetime DEFAULT NULL,
 `date_updated` datetime DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `hr_employees_attendance` ( `id` int(11) NOT NULL AUTO_INCREMENT, `emp_id` int(30) NOT NULL, `status` varchar(20) NOT NULL, `dated` date NOT NULL, `time_in` time NULL, `time_out` time NULL, `remarks` varchar(250) NULL, `full_day` tinyint(1) NULL, `overtime` tinyint(1) NULL, `weekend` tinyint(1) NULL, `holiday` tinyint(1) NULL, `quarantine` tinyint(1) NULL, `undertime` tinyint(1) NULL, `late` tinyint(1) NULL, `absent` tinyint(1) NULL, `leave` tinyint(1) NULL, `date_created` datetime NULL, `date_updated` datetime NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `hr_employees` ADD `monthly_total` DOUBLE(18,3) NULL AFTER `card_number`;

CREATE TABLE `hr_positions` (
 `id` int(13) NOT NULL AUTO_INCREMENT,
 `job_category_id` int(11) DEFAULT NULL,
 `name` varchar(200) NOT NULL,
 `note` varchar(400) DEFAULT NULL,
 `status` tinyint(1) DEFAULT NULL,
 `date_created` datetime DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

ALTER TABLE `hr_employees` CHANGE `position` `position_id` INT(11) NULL DEFAULT NULL;