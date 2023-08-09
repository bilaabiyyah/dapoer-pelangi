-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jul 2023 pada 13.10
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
-- Database: `dapoer_pelangi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `nama_product` varchar(100) DEFAULT NULL,
  `qty` varchar(100) DEFAULT NULL,
  `harga_pcs` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `nama_product`, `qty`, `harga_pcs`, `code`, `id_pelanggan`) VALUES
(12, 'BOLU PELANGI', '1', '2500', '185907', 25),
(13, 'KUE SOES', '1', '2500', '185907', 25),
(14, 'TALAM LUMPUR', '1', '2500', '185907', 25),
(15, 'PIE BUAH', '1', '3000', '185907', 25);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(20) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `wkt_pesan` varchar(6) NOT NULL,
  `alamat_pesan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id_pelanggan`, `nama`, `email`, `no_hp`, `tgl_pesan`, `wkt_pesan`, `alamat_pesan`) VALUES
(25, 'amanda yora', 'candracon926@gmail.c', '085871087091', '2023-07-30', '17:50', 'Kiaracondong');

-- --------------------------------------------------------

--
-- Struktur dari tabel `total_pesanan`
--

CREATE TABLE `total_pesanan` (
  `code` varchar(100) NOT NULL,
  `total_harga` varchar(100) DEFAULT NULL,
  `total_item` varchar(100) DEFAULT NULL,
  `ongkir` varchar(100) DEFAULT NULL,
  `timestime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `total_pesanan`
--

INSERT INTO `total_pesanan` (`code`, `total_harga`, `total_item`, `ongkir`, `timestime`) VALUES
('185907', '10500', '4', '0', '2023-07-30 10:50:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indeks untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `total_pesanan`
--
ALTER TABLE `total_pesanan`
  ADD PRIMARY KEY (`code`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`code`) REFERENCES `total_pesanan` (`code`),
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pesanan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
