-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jan 2021 pada 16.17
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `Nip` varchar(18) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `NoHp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=geostd8;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`Nip`, `Nama`, `Alamat`, `NoHp`) VALUES
('1811000998712', 'Afza Sorfina', 'Jambi', '081279544015');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id` int(11) NOT NULL,
  `nama_jurusan` varchar(30) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=geostd8;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id`, `nama_jurusan`, `keterangan`) VALUES
(1, 'Teknologi Informasi', 'Afza Sorfina'),
(2, 'Teknik Sipil', '1811082002'),
(3, 'Teknik Elektro', 'TRPL3A'),
(4, 'Teknik Mesin', 'Tugas 7'),
(5, 'Akuntansi', 'Afza'),
(6, 'B.Inggris', 'Afzas'),
(7, 'Administrasi Niaga', 'AfzaSs');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nobp` char(13) NOT NULL,
  `nama` char(30) NOT NULL,
  `nohp` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=geostd8;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nobp`, `nama`, `nohp`) VALUES
('1811082001', 'Fina', '081279544990'),
('1811082002', 'Afza Sorfina', '081279544015'),
('1811082003', 'Sonia Oktavia', '081235478967'),
('1811082004', 'Sela Indria Sari', '081374857636'),
('1811082005', 'Selviza', '081265789066');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=geostd8;

--
-- Dumping data untuk tabel `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1601268692),
('m130524_201442_init', 1601268756),
('m190124_110200_add_verification_token_column_to_user_table', 1601268756);

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int(11) NOT NULL,
  `nama_prodi` varchar(80) NOT NULL,
  `jurusan` int(11) NOT NULL,
  `telpon` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=geostd8;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama_prodi`, `jurusan`, `telpon`) VALUES
(1, 'Teknologi Rekayasa Perangkat Lunak', 1, '0571 0642'),
(2, 'D3 Mesin', 3, '0874 3245');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`Nip`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nobp`);

--
-- Indeks untuk tabel `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`),
  ADD KEY `jurusan` (`jurusan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`jurusan`) REFERENCES `jurusan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
