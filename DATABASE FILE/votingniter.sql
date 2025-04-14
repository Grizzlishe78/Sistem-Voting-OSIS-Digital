-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2025 at 11:26 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `votingniter`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(32) NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `username`, `password`, `last_login`) VALUES
(1, 'Liam Moore', 'liam', 'd00f5d5217896fb7fd601412cb890830', '2021-06-13 23:13:17'),
(3, 'Kathryn Smith', 'kathryn', 'b1c7755394ed39edf2c9a6867ec619b9', '2021-06-13 22:22:38'),
(4, 'Tung', 'tung', 'bb7d4b236b564cf1ec27aa891331e0af', '2025-04-14 23:09:43');

-- --------------------------------------------------------

--
-- Table structure for table `ikut_kandidat`
--

CREATE TABLE `ikut_kandidat` (
  `id_ikut_kandidat` int(11) NOT NULL,
  `id_voting` int(11) DEFAULT NULL,
  `id_kandidat` int(11) DEFAULT NULL,
  `poin` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ikut_kandidat`
--

INSERT INTO `ikut_kandidat` (`id_ikut_kandidat`, `id_voting`, `id_kandidat`, `poin`) VALUES
(3, 2, 1, 3),
(4, 2, 2, 1),
(5, 2, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `ikut_voting`
--

CREATE TABLE `ikut_voting` (
  `id_ikut` int(11) NOT NULL,
  `id_voting` int(11) DEFAULT NULL,
  `id_pemilih` int(11) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ikut_voting`
--

INSERT INTO `ikut_voting` (`id_ikut`, `id_voting`, `id_pemilih`, `waktu`) VALUES
(3, 2, 12, '2021-06-13 23:07:39'),
(4, 2, 3, '2021-06-13 23:08:17'),
(5, 2, 6, '2021-06-13 23:08:49'),
(6, 2, 8, '2021-06-13 23:09:15'),
(7, 2, 10, '2021-06-13 23:09:40'),
(8, 2, 11, '2021-06-13 23:10:09'),
(9, 2, 1, '2021-06-13 23:11:19'),
(10, 2, 13, '2025-04-15 03:56:43'),
(11, 2, 2, '2025-04-15 04:06:21'),
(12, 2, 4, '2025-04-15 04:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `kandidat`
--

CREATE TABLE `kandidat` (
  `id_kandidat` int(11) NOT NULL,
  `nama_kandidat` varchar(50) NOT NULL DEFAULT '0',
  `keterangan` text DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kandidat`
--

INSERT INTO `kandidat` (`id_kandidat`, `nama_kandidat`, `keterangan`, `foto`) VALUES
(1, 'Budi', 'Mengembangkan dan menyediakan solusi teknologi yang inovatif dan berkelanjutan.', 'user-icn.png'),
(2, 'Ahmad', 'Mewujudkan masyarakat yang beriman, berilmu, dan beramal. ', 'user.png'),
(3, 'Ririn', 'Menjadi pribadi yang bermanfaat bagi orang banyak.', 'userav.png');

-- --------------------------------------------------------

--
-- Table structure for table `pemilih`
--

CREATE TABLE `pemilih` (
  `id_pemilih` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT '0',
  `username` varchar(15) DEFAULT '0',
  `password` varchar(32) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pemilih`
--

INSERT INTO `pemilih` (`id_pemilih`, `nama`, `username`, `password`) VALUES
(1, 'Simon Dimas', 'simon', 'b30bd351371c686298d32281b337e8e9'),
(2, 'Dimas Simon', 'dimas', '8555f45b58e4806a1f68627339644129'),
(3, 'Tung', 'tung', 'bb7d4b236b564cf1ec27aa891331e0af'),
(4, 'Pramudya Dimas', 'pram', 'f31f89f99fcee651ad0f5199effc93f2'),
(5, 'Tralala', 'trala', '604e1e2f890509925b9052ea3c94eb77');

-- --------------------------------------------------------

--
-- Table structure for table `voting`
--

CREATE TABLE `voting` (
  `id_voting` int(11) NOT NULL,
  `nama_voting` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `voting`
--

INSERT INTO `voting` (`id_voting`, `nama_voting`) VALUES
(2, 'Voting OSIS Digital');

--
-- Triggers `voting`
--
DELIMITER $$
CREATE TRIGGER `delete_voting` BEFORE DELETE ON `voting` FOR EACH ROW BEGIN
	DELETE FROM ikut_kandidat WHERE ikut_kandidat.id_voting=OLD.id_voting;
	DELETE FROM ikut_voting WHERE ikut_voting.id_voting=OLD.id_voting;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `ikut_kandidat`
--
ALTER TABLE `ikut_kandidat`
  ADD PRIMARY KEY (`id_ikut_kandidat`);

--
-- Indexes for table `ikut_voting`
--
ALTER TABLE `ikut_voting`
  ADD PRIMARY KEY (`id_ikut`);

--
-- Indexes for table `kandidat`
--
ALTER TABLE `kandidat`
  ADD PRIMARY KEY (`id_kandidat`);

--
-- Indexes for table `pemilih`
--
ALTER TABLE `pemilih`
  ADD PRIMARY KEY (`id_pemilih`);

--
-- Indexes for table `voting`
--
ALTER TABLE `voting`
  ADD PRIMARY KEY (`id_voting`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ikut_kandidat`
--
ALTER TABLE `ikut_kandidat`
  MODIFY `id_ikut_kandidat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ikut_voting`
--
ALTER TABLE `ikut_voting`
  MODIFY `id_ikut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kandidat`
--
ALTER TABLE `kandidat`
  MODIFY `id_kandidat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pemilih`
--
ALTER TABLE `pemilih`
  MODIFY `id_pemilih` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `voting`
--
ALTER TABLE `voting`
  MODIFY `id_voting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
