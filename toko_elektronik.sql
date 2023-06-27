-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2023 at 06:06 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_elektronik`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_barang`
--

CREATE TABLE `data_barang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(4) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `merk` varchar(20) NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(20) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_barang`
--

INSERT INTO `data_barang` (`id`, `kode_barang`, `nama_barang`, `merk`, `harga`, `stok`, `created_at`, `updated_at`) VALUES
(2, 'B02', 'Kipas Angin', 'Toshiba', 250000, 7, '2023-05-05 04:07:11.000000', '2023-06-26 02:25:23.000000'),
(5, 'B03', 'AC Panasonic', 'Panasonic', 4000000, 4, '2023-05-05 06:53:19.000000', '2023-06-26 02:25:07.000000'),
(6, 'B04', 'Kulkas LG', 'LG', 9000000, 6, '2023-05-05 06:57:54.000000', '2023-06-26 15:48:33.000000'),
(20, 'B07', 'Setrika', 'Miyako', 200000, 16, '2023-06-26 02:29:59.000000', '2023-06-26 15:51:47.000000'),
(22, 'B01', 'Mesin Cuci', 'Panasonic', 3000000, 14, '2023-06-26 19:50:03.000000', '2023-06-26 20:17:15.000000');

-- --------------------------------------------------------

--
-- Table structure for table `data_pelanggan`
--

CREATE TABLE `data_pelanggan` (
  `id_pelanggan` bigint(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_pelanggan`
--

INSERT INTO `data_pelanggan` (`id_pelanggan`, `nama`, `alamat`, `no_tlp`, `created_at`, `updated_at`) VALUES
(1, 'Bima', 'Jl. Panglima Sudirman No. 51', '089457869876', NULL, '2023-06-21 21:41:23.000000'),
(2, 'Dian Ayu', 'Jl. Diponegoro No. 10, Semarang', '081567890121', '2023-05-05 04:09:22.000000', '2023-05-05 06:21:20.000000'),
(4, 'Budi', 'Jl. Thamrin No. 15, Bandung', '08134567890', '2023-05-05 05:50:57.000000', '2023-05-05 05:50:57.000000'),
(5, 'Citra', 'Jl. Gatot Subroto No. 20, Surabaya', '081456789013', '2023-05-05 05:51:43.000000', '2023-06-26 19:50:53.000000'),
(10, 'Lisa', 'Jl. Kapten Suwandak No.14', '089776544324', '2023-06-19 22:30:18.000000', '2023-06-19 22:30:18.000000'),
(12, 'Rendi Putra', 'Jl. Tlogomas No. 16', '086771234567', '2023-06-26 02:29:12.000000', '2023-06-26 02:31:40.000000');

-- --------------------------------------------------------

--
-- Table structure for table `data_transaksi`
--

CREATE TABLE `data_transaksi` (
  `id_transaksi` bigint(11) NOT NULL,
  `id_pelanggan` bigint(11) NOT NULL,
  `id` int(11) NOT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_transaksi`
--

INSERT INTO `data_transaksi` (`id_transaksi`, `id_pelanggan`, `id`, `tgl_transaksi`, `jumlah`, `total`, `created_at`, `updated_at`) VALUES
(5, 4, 6, '2023-06-26 22:50:21', 1, 18000000, '2023-05-05 07:02:32.000000', '2023-06-26 15:50:21.000000'),
(9, 1, 2, '2023-06-27 03:04:27', 2, 750000, '2023-05-08 23:11:19.000000', '2023-06-26 20:04:27.000000'),
(11, 2, 5, '2023-06-19 11:11:32', 1, 4000000, '2023-05-09 19:39:04.000000', '2023-05-09 19:39:04.000000'),
(27, 1, 5, '2023-06-26 02:25:07', 2, 8000000, '2023-06-26 02:25:07.000000', '2023-06-26 02:25:07.000000'),
(29, 12, 20, '2023-06-26 02:30:28', 2, 400000, '2023-06-26 02:30:28.000000', '2023-06-26 02:30:28.000000'),
(32, 1, 22, '2023-06-26 19:58:24', 2, 6000000, '2023-06-26 19:58:24.000000', '2023-06-26 19:58:24.000000');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_barang`
--
ALTER TABLE `data_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_pelanggan`
--
ALTER TABLE `data_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_barang`
--
ALTER TABLE `data_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `data_pelanggan`
--
ALTER TABLE `data_pelanggan`
  MODIFY `id_pelanggan` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  MODIFY `id_transaksi` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  ADD CONSTRAINT `data_transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `data_pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `data_transaksi_ibfk_2` FOREIGN KEY (`id`) REFERENCES `data_barang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
