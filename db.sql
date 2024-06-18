-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jun 2024 pada 06.57
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testjwt`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `faskes`
--

CREATE TABLE `faskes` (
  `id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `provinsi` varchar(191) NOT NULL,
  `kabkota` varchar(191) NOT NULL,
  `id_kabkot` int(11) NOT NULL,
  `jenis_faskes` varchar(191) NOT NULL,
  `faskes` varchar(191) NOT NULL,
  `id_fas` int(11) NOT NULL,
  `jumlah_kasus_tb_terkonfirmasi` int(11) NOT NULL,
  `jumlah_kasus_tb_diobati` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `faskes`
--

INSERT INTO `faskes` (`id`, `tahun`, `provinsi`, `kabkota`, `id_kabkot`, `jenis_faskes`, `faskes`, `id_fas`, `jumlah_kasus_tb_terkonfirmasi`, `jumlah_kasus_tb_diobati`) VALUES
(1, 2023, 'Riau', 'riau', 10, 'tingkat_1', 'swasta', 11, 400, 120),
(2, 2024, 'Jawa Barat', 'Bandung', 1, 'Puskesmas', 'Puskesmas Cimahi', 101, 150, 120),
(3, 2024, 'Jawa Barat', 'Bandung', 1, 'Puskesmas', 'Puskesmas Cimahi', 101, 170, 100),
(4, 2024, 'Jawa Barat', 'Bandung', 1, 'Puskesmas', 'Puskesmas Cimahi', 101, 170, 100),
(5, 2024, 'Jawa Barat', 'Bandung', 1, 'Puskesmas', 'Puskesmas Cimahi', 101, 170, 100),
(6, 2024, 'Jawa Barat', 'Bandung', 1, 'Puskesmas', 'Puskesmas Cimahi', 101, 170, 100),
(7, 2024, 'Jawa Barat', 'Bandung', 1, 'Puskesmas', 'Puskesmas Cimahi', 101, 170, 100),
(8, 2024, 'Jawa Barat', 'Bandung', 1, 'Puskesmas', 'Puskesmas Cimahi', 101, 170, 100),
(9, 2024, 'Jawa Barat', 'Bandung', 1, 'Puskesmas', 'Puskesmas Cimahi', 101, 170, 100),
(10, 2024, 'Jawa Barat', 'Bandung', 1, 'Puskesmas', 'Puskesmas Cimahi', 101, 170, 100),
(11, 2024, 'Jawa Barat', 'Bandung', 1, 'Puskesmas', 'Puskesmas Cimahi', 101, 170, 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `provinsi`
--

CREATE TABLE `provinsi` (
  `id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `provinsi` varchar(191) NOT NULL,
  `jumlah_penduduk` int(11) NOT NULL,
  `estimasi_kasus_tb_baru` int(11) NOT NULL,
  `case_notification_rate` double NOT NULL,
  `treatment_coverage` double NOT NULL,
  `jumlah_kasus_tb_terkonfirmasi` int(11) NOT NULL,
  `jumlah_kasus_tb_diobati` int(11) NOT NULL,
  `jumlah_kasus_tb_dari_puskesmas` int(11) NOT NULL,
  `jumlah_kasus_tb_dari_rs_pemerintah` int(11) NOT NULL,
  `jumlah_kasus_tb_dari_rs_swasta_klinik` int(11) NOT NULL,
  `kasus_perempuan` int(11) NOT NULL,
  `kasus_laki_laki` int(11) NOT NULL,
  `kasus_anak_muda` int(11) NOT NULL,
  `kasus_dewasa` int(11) NOT NULL,
  `kasus_lansia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `provinsi`
--

INSERT INTO `provinsi` (`id`, `tahun`, `provinsi`, `jumlah_penduduk`, `estimasi_kasus_tb_baru`, `case_notification_rate`, `treatment_coverage`, `jumlah_kasus_tb_terkonfirmasi`, `jumlah_kasus_tb_diobati`, `jumlah_kasus_tb_dari_puskesmas`, `jumlah_kasus_tb_dari_rs_pemerintah`, `jumlah_kasus_tb_dari_rs_swasta_klinik`, `kasus_perempuan`, `kasus_laki_laki`, `kasus_anak_muda`, `kasus_dewasa`, `kasus_lansia`) VALUES
(1, 2023, 'Riau', 500000, 252, 12, 80, 150, 75, 24, 25, 50, 55, 20, 20, 50, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `refreshtoken`
--

CREATE TABLE `refreshtoken` (
  `id` varchar(191) NOT NULL,
  `hashedToken` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `revoked` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `refreshtoken`
--

INSERT INTO `refreshtoken` (`id`, `hashedToken`, `userId`, `revoked`, `createdAt`, `updatedAt`) VALUES
('0c5f8c9b-0bc5-446e-92de-1dfda00d237f', '2adfb0f9af647c04ef663fea61e2f8d03c384d53bd2863a478f49bb2587508b905ca4eb12fd7f553f0fbc4cff5ccd6ed1c2232e76bb2ab2a5c02cd8791a45062', 'c69c531c-44a1-4cee-9bbf-410f43042af0', 0, '2024-06-18 03:32:08.028', '2024-06-18 03:32:08.028'),
('1d604065-d516-48b5-adac-fd3f3f505cb3', 'a192fb460bcb0c79ec80dae8c374c9fcd11a00a14c8405d26fe3f16099b3b1a9e0926ff47cb527f75d05bc99a2a00f74da8cdbea0b1d3539d076c2aa35c0dc25', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-11 01:15:11.703', '2024-06-11 01:15:11.703'),
('1df51b00-4934-42c4-abc3-ffdcb0e22e6b', '01a35acb827ee015f664afeb42d667e5358f8821f7369565d10adb149e9936ce303c45105681d7a19befb53b8baf985e81616ec3ea931d023d808cb641009ea1', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-18 02:26:23.838', '2024-06-18 02:26:23.838'),
('320247b9-8b26-4139-a821-5a2463bf87f4', 'ead95e262bf1b24eefdbe5f53c63b3b29019bb6a1b00bc5fc52921cb4e16561898343d5752089d288572a76553d6927b27b1e487af612f90fc6bba4a95a77e61', 'c69c531c-44a1-4cee-9bbf-410f43042af0', 0, '2024-06-18 03:27:45.280', '2024-06-18 03:27:45.280'),
('39d804e3-1c14-4b93-85e4-8a950258f733', 'dba5e61fd69abeb103072d764bc57a81b4111c6fec46bb5a794de4048ebee91fd09037d3492db7ea6429284fef6c5ebacd51258ae60f75c8e0c124ef0de00015', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-11 01:50:31.549', '2024-06-11 01:50:31.549'),
('3ea28d43-3ac4-4617-8aff-387e91e1ce0e', '7ffd74ac4d135a8753ac48ba0baf71674b5c9af5500b47a68812410537c6cbbb61240211c4cd72d82e79d4f9efaedf2a812d0e8bede4d1c7ce1d1952fbf041cb', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-18 03:28:21.166', '2024-06-18 03:28:21.166'),
('462b7ff2-5e01-443e-bb9e-874aa1d5976c', '2ed48ac6d328b8e075af200bcdb46d18873d53b4b574bf6e57601264b8b8f0442c54f7ed477b7dccb5bbd10f88313d4f8fdd6a3c71e5e4a634a810b2b3a65627', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-18 03:22:40.891', '2024-06-18 03:22:40.891'),
('49e1d108-02a5-4966-af7a-aaf7a27a0e68', 'c267dd2514059c852cda238c0244a370913a793137bd242c27a939ca98c18205f3a133f56b2f9ba4e227ba1926111feca25435010dcd3f4d941a838045323e57', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-11 01:14:29.745', '2024-06-11 01:14:29.745'),
('5c7cee72-e7d3-4b3d-8109-c6aa28c86249', 'f93ab9dc6a65335fbd7074db26a600b3adc99c48b03b0acbec1d81ca9e2622ede40aeb07de8ccd9813a0ab031ab2d08514a1c14f2a1a69bc6b9848385661d27d', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-18 03:06:55.059', '2024-06-18 03:06:55.059'),
('7192f858-979a-479c-b6c4-2a787052ea12', 'ef15ef0a240f170cda22b27e6b5559dfe52ab9e95fafa0f4152fdffcd301fc72d3b182f683e948305818d3470e1d33f748d232465533f063d69ef8e03e42e800', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-18 03:32:27.285', '2024-06-18 03:32:27.285'),
('71e1ad63-ebcb-4382-816f-bc8bbb49d630', '975940d0c98fe411eb43e17d16a54ec47ddf2a7b53cf2dd2936e3b267fe75318f3da26acb491409a066ebbf129f491b5b675562399a9ee7d1f65135e7c756da0', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-18 02:04:45.644', '2024-06-18 02:04:45.644'),
('788ad6da-47b3-4492-8bb1-60d833123a28', '64b2d5be865e83501aafa8b494307e5abf830134cbe8fdcd8138a89c799eb834fd2ab42df71573152e00d1ab8890dc6523bd47925d494505a0ba8e05694e7adb', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-18 04:01:35.906', '2024-06-18 04:01:35.906'),
('7e98c978-9b9d-4f1f-b3c6-1fce7903fd36', 'efbafe7ed4e2d5392309dba980cfc6241e0d39465010dc53c8d6ede7a45567ed6f9d0a3c3d819f046963e41fdf3616ede05192952509bc3a73cbe50175fc89cd', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-18 03:32:54.354', '2024-06-18 03:32:54.354'),
('810b270a-d43f-4fa3-bf7e-69946d649187', 'e5f8197d04dd7469ad400313e228b054914d0333332aadfc153b45afc273b5b5375bd5a15ac6f6af750a42b55cee5e0fac65916cf7a224124dd35d80cc1fa06e', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-18 03:41:19.466', '2024-06-18 03:41:19.466'),
('89db26cb-86aa-487e-9b5e-f92106e36a5b', '8583ca74f23d18e407c792bb0ab65dddd6af26e8e72118ca33aac8d55b370bb2f1c9483d732c4b0316d2e20214c43698be2788523a1bd725dbed997d342e8b31', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-18 02:44:13.683', '2024-06-18 02:44:13.683'),
('900a83f0-e71b-4fc2-b021-b59bc9f172aa', '2f10c6b33e5b8021e5ce363c9420fb5674d196f5ab1e66b6d563c928d731de8df00a9a3a5c2fcf37bd4cbbe2e652bf508167542f65665bd1cf0db0ccb974b516', 'c69c531c-44a1-4cee-9bbf-410f43042af0', 0, '2024-06-18 03:25:07.578', '2024-06-18 03:25:07.578'),
('a318935e-ffba-4f1f-b1f9-5e5ec6330d37', 'fbcba45a7d28ec99a0aec606c7a2e5741eed2bea3317a9fa84b63d54d0bec12f328c735a97ef369c490e946445722b649e1650c491f67cbe0dffb784f032732c', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-11 01:50:36.101', '2024-06-11 01:50:36.101'),
('b25846e4-ea05-4e62-a5ff-a4b06b0fd76f', 'a038c8356d4ec6757ad4fa0bdf8b656a657ec427f8bb562cdaa045290437b3e9fb5f941d60d0ee32c8f8c59d2486c12d4311f77eb9a14644d854f778804de0b2', 'c69c531c-44a1-4cee-9bbf-410f43042af0', 0, '2024-06-18 03:35:02.055', '2024-06-18 03:35:02.055'),
('b40019e1-e78c-4d12-a77a-30906fda34f4', '3019edaac24518fae791b0088ceabe7a613b6f999d653155f13c09565976a782456079c0f7b509b2016316362616c4be362e43539b3ac2111cd7f0e711efe7ce', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-11 01:52:38.020', '2024-06-11 01:52:38.020'),
('b53385c5-8585-47fc-a16e-06e1307c8490', 'a28b3f80c9d00f658a0ea74c2078cf0c9811139a10500f8345fffbdb5ceebe1cfb1e6329518a8c92b38f9e694af182974eb3f24fac023e5b22bf3f85d338d357', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-11 01:50:34.031', '2024-06-11 01:50:34.031'),
('d9555fc2-f4aa-4ded-a442-389f8ab95133', '93df0291272d29cb5ad549989737cc014a38d4336003426c4acfadbe9bcf4a8d75686f8d4bde5d05ba0083095b48759fa1fe5e10fd992541f761e18fd3b6ecc7', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-18 03:26:28.254', '2024-06-18 03:26:28.254'),
('f6f019a4-8f38-4f07-ae39-1cf150650873', 'fce5114b876ae4ecdf6ea1d67bfbb4425fc0e1484aead4e97b05017d2143e4eaf1bc6c8d46e8278705b8516bb4035febb15d6e722299258b5f8abaa568ccc31c', 'c69c531c-44a1-4cee-9bbf-410f43042af0', 0, '2024-06-18 03:26:41.502', '2024-06-18 03:26:41.502'),
('fc9acfff-25fb-4d06-8fb4-4c12ea8ff069', '4f03ba7da7ae9adc8ac0cd78590ec3c5afc3e59e868c336da354303846f9c8dc7c4c1c9edc276dd3a53fd5fef7ef6c1a227274cabe61e4124e771888b7e95bdd', 'c69c531c-44a1-4cee-9bbf-410f43042af0', 0, '2024-06-18 03:05:22.967', '2024-06-18 03:05:22.967'),
('fec793b5-1360-4385-afc4-edc3418edd9d', '3e56bf3b4393e00c85c910026d60c56ffa63f9492a433b0567f547c990b3e00777711a857e2e746d4c9ea2b90cbd07617aef9fb9c1db705a1544344233921a26', '17a9b1b6-b66f-4b4b-b354-819b40477b83', 0, '2024-06-11 01:14:09.215', '2024-06-11 01:14:09.215');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `role` varchar(191) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `createdAt`, `updatedAt`, `role`) VALUES
('17a9b1b6-b66f-4b4b-b354-819b40477b83', 'meklin2.nub', '$2b$12$EVwPvLwKZnM3Zb46Ff8k.OijM9.S32kRXQa2p8gPCPnGTNyeNsolG', '2024-06-11 01:14:09.208', '2024-06-11 01:14:09.208', 'user'),
('51df1610-a523-4c65-8067-add7995547d8', 'meklin.jago', '$2b$12$h3NQ1/R3/cpCNYBhrbeaFecsrye57wieW6NaiKYV0TGM8EMiuSjGm', '2024-06-11 01:11:04.563', '2024-06-11 01:11:04.563', 'user'),
('c69c531c-44a1-4cee-9bbf-410f43042af0', 'admin@admin.com', '$2b$10$oPSwwD.T6fnEYxlHM0dzlOj2uhwdxd0j5efVT2bahxGg/0b/zdAVW', '2024-06-18 03:05:22.959', '2024-06-18 03:05:22.959', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('248cf066-d9a4-4e95-9dc0-8c3339237db4', '45955ad6452d992421adc11fd609f8f071eec6111a48626fdfd45bebfb34e14a', '2024-06-18 02:24:04.617', '20240618022404_init', NULL, NULL, '2024-06-18 02:24:04.595', 1),
('33cbb206-4dbf-41cf-afbe-d0e6106a759b', 'afd55bdf6c1f2a4d226710e53ef71ab4fe8e4818bc9c4882af2ecaef3d45368a', '2024-06-18 02:56:33.422', '20240618025633_new', NULL, NULL, '2024-06-18 02:56:33.416', 1),
('387efa27-a2ce-44c8-938c-2d128d0a009e', 'ca662c5612b494ea551e9a3b47ae19a4e06ce158467bcdc39b8e5c25fbf62e33', '2024-06-10 17:07:07.804', '20240610170707_testjwt', NULL, NULL, '2024-06-10 17:07:07.733', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `faskes`
--
ALTER TABLE `faskes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `refreshtoken`
--
ALTER TABLE `refreshtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `RefreshToken_id_key` (`id`),
  ADD KEY `RefreshToken_userId_fkey` (`userId`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_id_key` (`id`),
  ADD UNIQUE KEY `User_email_key` (`email`);

--
-- Indeks untuk tabel `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `faskes`
--
ALTER TABLE `faskes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `refreshtoken`
--
ALTER TABLE `refreshtoken`
  ADD CONSTRAINT `RefreshToken_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
