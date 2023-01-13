-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 13, 2023 at 02:43 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `neurist`
--

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `name`, `value`, `status`) VALUES
(1, 'Amazfit Bip U', 780000, 'idle'),
(2, 'Amazfit Bip U', 780000, 'rented'),
(3, 'Amazfit Bip U', 740000, 'idle'),
(4, 'Haylou Solar LS-05', 399000, 'rented'),
(5, 'Haylou Solar LS-05', 399000, 'rented'),
(6, 'Haylou Solar LS-05', 399000, 'idle'),
(7, 'Haylou LS-02', 350000, 'rented'),
(8, 'Eggel T3', 470000, 'idle'),
(9, 'Haylou Solar LS-05', 399000, 'rented'),
(10, 'Haylou LS-02', 350000, 'idle'),
(11, 'Eggel T3', 470000, 'rented'),
(12, 'Haylou LS-02', 350000, 'idle'),
(13, 'Haylou LS-02', 350000, 'idle'),
(14, 'Haylou LS-02', 350000, 'idle'),
(15, 'Haylou LS-02', 350000, 'idle'),
(16, 'Haylou Solar LS-05', 399000, 'rented'),
(17, 'Eggel T3', 470000, 'rented'),
(18, 'Amazfit Bip U', 800000, 'rented'),
(19, 'Haylou LS-02', 350000, 'rented');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `service_id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `age`, `address`, `service_id`, `phone`, `email`) VALUES
(1, 'Amien Zuharie', 56, 'Jl. Kaliori-Maguan 0,5 KM Ds. Tambakagung Rt 06/Rw 02, Delok, Tambakagung, Kec. Kaliori, Kabupaten Rembang, Jawa Tengah 59252', 1, '081390656535', NULL),
(2, 'Vannia Caroline', 27, 'Villa Mutiara Gading 3 blok d18/2 rt 008, Kebalen, Kec. Babelan, Kabupaten Bekasi, Jawa Barat 17610', 3, '085766432754', 'vanniacarol15e@gmail.com'),
(3, 'Dimas Pangestu', 16, 'RT 09/ RW 01 Karangdawa, Laren, Bumiayu, Brebes Regency, Central Java', 2, '0813424608070', 'dimdimpangestu@gmail.com'),
(4, 'Fitri Hannah', 43, 'RT06/RW09, Dk. Samben, Kel. Mojowarno, Kec. Kaliori, Kabupaten Rembang, Jawa Tengah 59252', 1, '082232405553', 'fitrihannah24@gmail.com'),
(6, 'Anwar Malik', 24, 'Jl. Pekayon Barat No.12, kel. Pulo Sari, Bekasi Utara, Kota Bekasi, Jawa Barat', 3, '081345607654', 'anwarmalik@gmail.com'),
(8, 'Ferdy Tambuan', 35, 'Jl. Kali Abang Tengah No.67, RT.001/RW.017, Perwira, Kec. Bekasi Utara, Kota Bks, Jawa Barat 17125', 3, '081342789090', 'ferdytambuan14@yahoo.com'),
(9, 'Ayu Maharini Fettalia', 29, 'Jl. Raya Pulo Timaha, Babelan Kota, Kec. Bekasi Utara, Kabupaten Bekasi, Jawa Barat 17610', 3, '081296857461', 'ayumalea@gmail.com'),
(10, 'Jonni Afrizal', 46, 'Jl. RW. Mongonsidi No.87, Kalidoni, Kec. Kalidoni, Kota Palembang, Sumatera Selatan 30163', 4, '081271171697', 'jonniafrizal2121@gmail.com'),
(11, 'Celine Christi', 24, 'Jl. Pekayon Tengah No.37, kel. Pulo Sari, Bekasi Utara, Kota Bekasi, Jawa Barat', 3, '085897009451', 'celinechristii@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `service_address` varchar(255) NOT NULL,
  `service_phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `service_address`, `service_phone`) VALUES
(1, 'CV Daya Mukti Sedayu', 'Jl. Balekambang Lor No.35, Kota Rembang, Jawa Tengah', '082124269099'),
(2, 'SMP Negeri 2 Bumiayu', 'Jl. Raya Pruwatan No.41, Karangjatisekolahan, Laren, Kec. Bumiayu, Kabupaten Brebes, Jawa Tengah 52273', '02894403129'),
(3, 'CV. Bekasi Manunggal Sejahtera', 'De Valey, Ruko Maison Avenue, Jl. Villa Mutiara No.07-24, Ciantra, Cikarang Selatan, Bekasi Regency, West Java 17530', '08568474000'),
(4, 'PT. Arga Mas Mitra Sejati', 'Jl. Kayuleman No. 44, Kota Palembang, Sumatera Selatan', '088974503404');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pgs_id` (`service_id`),
  ADD KEY `svc_id` (`service_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `service_id_2` (`service_id`),
  ADD KEY `service_id_3` (`service_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `pgs_id` (`service_id`),
  ADD KEY `service_id` (`service_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
