-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 02, 2017 at 06:44 PM
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
-- Table structure for table `addata`
--

CREATE TABLE `addata` (
  `id` int(255) NOT NULL,
  `approved` varchar(3) NOT NULL DEFAULT 'no',
  `sponsorName` text NOT NULL,
  `captionAddress` text,
  `captionPhone` varchar(15) DEFAULT NULL,
  `captionEmail` varchar(100) DEFAULT NULL,
  `captionFront` text,
  `captionMiddle` text,
  `captionBack` text,
  `image` varchar(50) DEFAULT NULL,
  `adNotes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addata`
--

INSERT INTO `addata` (`id`, `approved`, `sponsorName`, `captionAddress`, `captionPhone`, `captionEmail`, `captionFront`, `captionMiddle`, `captionBack`, `image`, `adNotes`) VALUES
(1, 'no', 'Coffee Express', NULL, NULL, NULL, 'It\'s coffee!!', NULL, NULL, 'coffee1.jpg', 'Beans do not fill the screen'),
(2, 'yes', 'Sheepdog Inc.', NULL, NULL, NULL, NULL, 'Ralph', NULL, 'sheepdog.jpg', NULL),
(3, 'no', 'Matt\'s Bistro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'no', 'Patches and Stitches', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'no', 'Cryptic Studios', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'yes', 'Beefy\'s Burgers', NULL, NULL, NULL, NULL, NULL, 'Burger burger', 'burger.jpg', NULL),
(7, 'no', 'The Sandwich Master', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'no', 'Gas and Pass', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'yes', 'Hugh Bigshot', NULL, NULL, NULL, 'Hugh Bigshot', NULL, NULL, 'bigshot.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `usertype` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `usertype`) VALUES
(1, 'rulescard', 'juicebox31', 'master'),
(2, 'aceofclubs', 'tastydish12', 'admin'),
(3, 'jackofclubs', 'pointandclick24', 'photographer'),
(4, 'twoofclubs', 'thimble86', 'solicitor'),
(5, 'MattsBistro', 'business01', 'Matt\'s Bistro'),
(6, 'threeofclubs', 'wheelbarrow19', 'solicitor'),
(7, 'fourofclubs', 'theshoe22', 'solicitor'),
(8, 'SandwichMaster', 'business02', 'The Sandwich Master'),
(9, 'CoffeeExpress', 'business03', 'Coffee Express'),
(10, 'PatchesStitches', 'business04', 'Patches and Stitches'),
(11, 'Sheepdog', 'business05', 'Sheepdog Inc'),
(12, 'CrypticStudios', 'business06', 'Cryptic Studios'),
(13, 'Beefy', 'business07', 'Beef\'s Burgers'),
(14, 'GasPass', 'business08', 'Gas and Pass'),
(15, 'HughBigshot', 'important01', 'Hugh Bigshot');

-- --------------------------------------------------------

--
-- Table structure for table `mainrecords`
--

CREATE TABLE `mainrecords` (
  `id` int(11) NOT NULL,
  `sponsorName` text NOT NULL,
  `sponsorAddress` text,
  `sponsorContact` varchar(80) DEFAULT NULL,
  `sponsorPhone` varchar(20) DEFAULT NULL,
  `sponsorEmail` varchar(100) DEFAULT NULL,
  `solicitor` varchar(25) DEFAULT NULL,
  `ordered` varchar(15) NOT NULL DEFAULT 'needs visit',
  `adSize` varchar(25) DEFAULT NULL,
  `price` int(6) DEFAULT NULL,
  `paid` varchar(10) DEFAULT NULL,
  `datePaid` date DEFAULT NULL,
  `photographer` varchar(25) DEFAULT NULL,
  `sponsorNotes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mainrecords`
--

INSERT INTO `mainrecords` (`id`, `sponsorName`, `sponsorAddress`, `sponsorContact`, `sponsorPhone`, `sponsorEmail`, `solicitor`, `ordered`, `adSize`, `price`, `paid`, `datePaid`, `photographer`, `sponsorNotes`) VALUES
(1, 'Asbestos Miner\'s Guild', '43557 Underground Ave', 'Boris Stone', '9025550001', 'mail@asbestosrocks.ca', 'twoofclubs', 'needs visit', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Matt\'s Bistro', '47 Meat St', 'Matthew Cutter', '9025551234', 'mail@mattsmeat.ca', 'threeofclubs', 'yes', 'full page', 1725, 'no', NULL, NULL, 'Don\'t ask Matt about his meat.'),
(3, 'Roadkill Animal Shelter', '127 Taxidermy Ln', 'Steve Skinnington', '902-555-4545', 'mail@rks.ca', 'fourofclubs', 'needs visit', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'The Fun Police', '100 Jailhouse Crt', 'Sgt. Hardass', '902-555-5845', 'mail@funpolice.ca', 'twoofclubs', 'pending', NULL, NULL, NULL, NULL, NULL, 'Rotarian may be subjected to a humiliating search.'),
(5, 'The Sandwich Master', '24 Baguette Bvd', 'Gerald Crunch', '902-555-3287', 'mail@sandwichmaster.ca', 'threeofclubs', 'yes', 'third of a page', 690, 'credit', '2017-02-27', 'jackofclubs', NULL),
(6, 'Coffee Express', '1 Zip Ln', 'Danny Swift', '902-555-9666', 'mail@coffeeexpress.ca', 'twoofclubs', 'yes', 'sixth of a page', 415, 'cash', '2017-02-27', 'jackofclubs', 'Good coffee'),
(7, 'Patches and Stitches', '5620 Fabric St', 'Cindy Weaver', '902-555-3456', 'mail@patchesstitches.ca', 'fourofclubs', 'yes', 'sixth of a page', 415, 'paypal', '2017-02-06', 'jackofclubs', NULL),
(8, 'Cryptic Studios', '2112 Cyber St', 'Ctoggha', '902-555-0909', 'mail@mythos.ca', 'threeofclubs', 'yes', 'full page', 1725, 'no', NULL, 'jackofclubs', NULL),
(9, 'Sheepdog Inc', '488 Mellowfield Dr', 'Ralph Sheepdog', '902-555-3640', NULL, 'twoofclubs', 'yes', 'two thirds of a page', 1150, 'cash', '2017-02-01', 'jackofclubs', NULL),
(10, 'Beefy\'s Burgers', '86 Hamburger Ave', 'Jane Cowmangler', '902-555-2333', NULL, 'threeofclubs', 'yes', 'two thirds of a page', 1150, 'credit', '2017-01-04', 'jackofclubs', NULL),
(11, 'The Chronically Horrid', '5555 News St', 'Bill Paper', '902-555-5445', 'mail@anewspaper.ca', 'fourofclubs', 'no', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Gas and Pass', '98 Diesel St', 'Gus Carson', '902-555-8888', 'mail@passgas.ca', 'fourofclubs', 'yes', 'third of a page', 690, 'yes', '2017-02-07', 'jackofclubs', NULL),
(13, 'Hugh Bigshot', '100 Fancy Ave', 'Miss Grovel, secretary', '902-555-1111', 'press@hughbigshot.ca', 'threeofclubs', 'yes', 'full page', 1500, 'cash', '2017-02-01', 'jackofclubs', 'Will be difficult to fit ego into picture');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addata`
--
ALTER TABLE `addata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mainrecords`
--
ALTER TABLE `mainrecords`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addata`
--
ALTER TABLE `addata`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `mainrecords`
--
ALTER TABLE `mainrecords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
