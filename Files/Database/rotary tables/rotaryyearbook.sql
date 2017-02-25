-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 24, 2017 at 08:18 PM
-- Server version: 5.7.17-log
-- PHP Version: 7.1.2

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
-- Table structure for table `adawaitingapproval`
--

CREATE TABLE `adawaitingapproval` (
  `id` int(255) NOT NULL,
  `image` varchar(50) NOT NULL,
  `caption` varchar(200) NOT NULL,
  `business_name` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `business_email` varchar(50) NOT NULL,
  `business_address` varchar(200) NOT NULL,
  `ad_size` varchar(15) NOT NULL,
  `approval_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adawaitingapproval`
--

INSERT INTO `adawaitingapproval` (`id`, `image`, `caption`, `business_name`, `first_name`, `last_name`, `phone`, `business_email`, `business_address`, `ad_size`, `approval_status`) VALUES
(1, 'testimage1.jpg', 'caption for test image 1', 'business name test image 1', 'test image', 'one', '902-555-1111', 'email@testimage1.com', '123 test image 1 street', '1/3 Page', 'Not Approved'),
(2, 'testimage2.jpg', 'caption for test image 2', 'business name test image 2', 'test image', 'two', '902-555-2222', 'email@testimage2.com', '123 test image 2 street', '1/2 Page', 'Not Approved'),
(3, 'testimage3.jpg', 'caption for test image 3', 'business name for test image 3', 'test image', 'three', '902-555-3333', 'email@testimage3.com', '123 test image 3 street', 'Full Page', 'Not Approved');

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
  `assigned_business_name` varchar(50) NOT NULL,
  `assigned_business_phone` varchar(15) NOT NULL,
  `assigned_business_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `business_name`, `ad_size`, `pay_type`, `business_email`, `contacted`, `ordered`, `business_phone`, `business_address`, `haspaid`, `ad_approved`, `first_name`, `middle_name`, `last_name`, `image`, `image_caption`, `assigned_photographer_name`, `assigned_photographer_phone`, `assigned_photographer_email`, `assigned_business_name`, `assigned_business_phone`, `assigned_business_email`) VALUES
(1, 'Coffee Inc', 'full page', 'Paypal', 'myemail@email.com', 'No', 'No', '902-555-5555', '123 fake street, chicago', 'No', 'No', 'John', 'J', 'Smith', 'testimage.jpg', 'this is my caption', 'Jane Smith', '902-555-6666', 'photographer@email.com', 'assigned business', '902-555-5555', 'mail@mail.com'),
(2, 'Microsoft', '1/3 Page', 'Cash', 'email@email.com', 'Yes', 'No', '902-555-5555', '12345 hamster drive', 'No', 'No', 'Bill', 'J', 'Gates', 'testimage.jpg', 'this is a caption', 'Joe McTest', '902-555-5555', 'mail@mail.com', 'business name', '902-555-5555', 'mail@mail.com'),
(3, 'Cryptic Studios', '1/3 Page', 'Paypal', 'email@email.com', 'No', 'No', '902-555-5555', '12345 hamster drive', 'No', 'No', 'Jack', 'J', 'Smith', 'testimage.jpg', 'this is a caption', 'Joe McTest', '902-555-5555', 'mail@mail.com', 'business name', '902-555-5555', 'mail@mail.com'),
(4, 'Sheepdog Inc', '1/6 Page', 'Cash', 'mymail@email.com', 'No', 'No', '902-555-5555', '123 Fake Ave', 'No', 'No', 'Jackie', 'J', 'Faker', 'testimage.jpg', 'caption', 'Jay McSheepdog', '902-555-5555', 'mail@mail.com', 'business name', '902-555-5555', 'mail@mail.com'),
(5, 'Smirnoff', '1/6 Page', 'Cash', 'mymail@email.com', 'No', 'No', '902-555-5555', '123 Fake Ave', 'No', 'No', 'Jackie', 'J', 'Faker', 'testimage.jpg', 'caption', 'Jay McFake', '902-555-5555', 'mail@mail.com', 'business name', '902-555-5555', 'mail@mail.com'),
(6, 'NSCC', '1/2 Page', 'Paypal', 'mymail@mail.com', 'No', 'No', '902-555-5555', '123 Maple Street', 'No', 'No', 'Jenny', 'J', 'McFaker', 'testimage.jpg', 'image caption', 'Jay McSheepdog', '902-555-5555', 'photo@mail.com', 'Sheepdog Inc', '902-555-5555', 'email@mymail.com'),
(7, 'Acadia', '1/2 Page', 'Paypal', 'mymail@mail.com', 'No', 'No', '902-555-5555', '123 Maple Street', 'No', 'No', 'Jenny', 'J', 'McFaker', 'testimage.jpg', 'image caption', 'Jay McSheepdog', '902-555-5555', 'photo@mail.com', 'Sheepdog Inc', '902-555-5555', 'email@mymail.com');

-- --------------------------------------------------------

--
-- Table structure for table `businessrecords`
--

CREATE TABLE `businessrecords` (
  `id` int(255) NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `ad_size` varchar(15) NOT NULL,
  `ad_price` varchar(10) NOT NULL,
  `date` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessrecords`
--

INSERT INTO `businessrecords` (`id`, `business_name`, `first_name`, `last_name`, `ad_size`, `ad_price`, `date`) VALUES
(1, 'Sheepdog Inc', 'Mister', 'Sheepdog', '1/3 Page', '1400', '05/05/99'),
(2, 'Sheepdog Inc', 'Mrs', 'Sheepdog', 'Full Page', '3500', '02/03/97'),
(3, 'Sheepdog Inc', 'Johnny', 'McSheepdog', '1/6 Page', '800', '01/01/94'),
(4, 'Sheepdog Inc', 'Jane', 'McSheepdog', 'Full Page', '3500', '07/03/92'),
(5, 'Sheepdog Inc', 'Sean', 'McSheepdog', '1/3 Page', '1200', '02/02/95'),
(6, 'Sheepdog Inc', 'Joe', 'Sheepy', '1/6 Page', '1400', '08/21/96'),
(7, 'username', 'Joe', 'Tester', '2/3 Page', '2000', '05/16/00'),
(8, 'username', 'Jane', 'Tester', 'Full Page', '2500', '04/19/02');

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

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `usertype`) VALUES
(0, 'rulescard', 'juicebox31', 'master'),
(1, 'aceofclubs', 'tastydish12', 'admin'),
(2, 'jackofclubs', 'pointandclick24', 'photographer'),
(3, 'twoofclubs', 'thimble86', 'solicitor'),
(4, 'BCISBC', 'business01', 'BCISBC');

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
-- Indexes for table `adawaitingapproval`
--
ALTER TABLE `adawaitingapproval`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `businessrecords`
--
ALTER TABLE `businessrecords`
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
-- AUTO_INCREMENT for table `adawaitingapproval`
--
ALTER TABLE `adawaitingapproval`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `businessrecords`
--
ALTER TABLE `businessrecords`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
