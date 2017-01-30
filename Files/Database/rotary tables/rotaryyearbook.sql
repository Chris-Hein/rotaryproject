-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2017 at 06:08 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rotaryyearbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(255) NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `ad_size` varchar(10) NOT NULL,
  `pay_type` varchar(20) NOT NULL,
  `business_email` varchar(50) NOT NULL,
  `contacted` varchar(3) NOT NULL,
  `ordered` varchar(3) NOT NULL,
  `business_phone` varchar(15) NOT NULL,
  `business_address` varchar(200) NOT NULL,
  `haspaid` varchar(3) NOT NULL,
  `ad_approved` varchar(3) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `image_caption` varchar(50) NOT NULL,
  `assigned_photographer_name` varchar(50) NOT NULL,
  `assigned_photographer_phone` varchar(15) NOT NULL,
  `assigned_photographer_email` varchar(50) NOT NULL,
  `assigned_sponsor_name` varchar(50) NOT NULL,
  `assigned_sponsor_phone` varchar(15) NOT NULL,
  `assigned_sponsor_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(255) NOT NULL,
  `image_path` varchar(50) NOT NULL,
  `isapproved` varchar(3) NOT NULL,
  `haspaid` varchar(3) NOT NULL,
  `sponsor` varchar(50) NOT NULL,
  `business` varchar(50) NOT NULL,
  `assigned_photographer` varchar(50) NOT NULL,
  `ad_size` varchar(10) NOT NULL,
  `image_caption` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(255) NOT NULL,
  `invoice_from` varchar(50) NOT NULL,
  `invoice_to` varchar(50) NOT NULL,
  `invoice_content` varchar(400) NOT NULL,
  `invoice_date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `usertype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `photographer`
--

CREATE TABLE `photographer` (
  `id` int(255) NOT NULL,
  `photographer_name` varchar(50) NOT NULL,
  `photographer_phone` varchar(15) NOT NULL,
  `photographer_email` varchar(50) NOT NULL,
  `assigned_name` varchar(50) NOT NULL,
  `assigned_phone` varchar(15) NOT NULL,
  `assigned_email` varchar(50) NOT NULL,
  `assigned_business` varchar(50) NOT NULL,
  `assigned_image_size` varchar(10) NOT NULL,
  `assigned_date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `solicitor`
--

CREATE TABLE `solicitor` (
  `id` int(255) NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `ad_size` varchar(20) NOT NULL,
  `pay_type` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contacted` varchar(3) NOT NULL,
  `ordered` varchar(3) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `image_caption` varchar(50) NOT NULL,
  `haspaid` varchar(3) NOT NULL,
  `ad_approved` varchar(3) NOT NULL,
  `assigned_photographer` varchar(50) NOT NULL,
  `approved_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `id` int(255) NOT NULL,
  `approved` varchar(3) NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `business_address` varchar(200) NOT NULL,
  `business_phone` varchar(15) NOT NULL,
  `business_email` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `image_caption` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photographer`
--
ALTER TABLE `photographer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solicitor`
--
ALTER TABLE `solicitor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `photographer`
--
ALTER TABLE `photographer`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `solicitor`
--
ALTER TABLE `solicitor`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
