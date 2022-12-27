-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 27 Ara 2022, 01:05:52
-- Sunucu sürümü: 10.4.27-MariaDB
-- PHP Sürümü: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `fotografci`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `adminno` int(11) NOT NULL,
  `kulladi` text DEFAULT NULL,
  `sifre` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`adminno`, `kulladi`, `sifre`) VALUES
(1, 'selcuk', 'eTpTsss'),
(2, 'deneme', 'admin');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `foto`
--

CREATE TABLE `foto` (
  `fotograf_no` int(11) NOT NULL,
  `fotograf_konu` text NOT NULL,
  `fotograf_ceken` text NOT NULL,
  `fotograf_yolu` text NOT NULL,
  `fotograf_tarih` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `foto`
--

INSERT INTO `foto` (`fotograf_no`, `fotograf_konu`, `fotograf_ceken`, `fotograf_yolu`, `fotograf_tarih`) VALUES
(1, 'Doğa', 'Selçuk Etli', 'https://media.istockphoto.com/id/517188688/tr/fotoğraf/mountain-landscape.jpg?s=1024x1024&w=is&k=20&c=-VQB2nMVJvHevaFFo_5EBcidPp60ASsHgk3jFRk8vbw=', '2022-12-01'),
(2, 'Gökyüzü', 'Selçuk Etli', 'https://media.istockphoto.com/id/517188688/tr/fotoğraf/mountain-landscape.jpg?s=1024x1024&w=is&k=20&c=-VQB2nMVJvHevaFFo_5EBcidPp60ASsHgk3jFRk8vbw=', '2022-12-02'),
(4, 'Manzara', 'Selçuk şahin', 'https://media.istockphoto.com/id/517188688/tr/fotoğraf/mountain-landscape.jpg?s=1024x1024&w=is&k=20&c=-VQB2nMVJvHevaFFo_5EBcidPp60ASsHgk3jFRk8vbw=', '2022-12-01'),
(5, 'Doğa', 'Selçuk Etli', 'https://media.istockphoto.com/id/517188688/tr/fotoğraf/mountain-landscape.jpg?s=1024x1024&w=is&k=20&c=-VQB2nMVJvHevaFFo_5EBcidPp60ASsHgk3jFRk8vbw=', '2022-12-01'),
(7, 'Doğa', 'Selçuk Etli', 'https://media.istockphoto.com/id/517188688/tr/fotoğraf/mountain-landscape.jpg?s=1024x1024&w=is&k=20&c=-VQB2nMVJvHevaFFo_5EBcidPp60ASsHgk3jFRk8vbw=', '2022-12-01'),
(8, 'deneme', 'ahmet', 'C:\\Users\\selcu\\Documents\\METIN2\\0723_024104.jpg', '2022-12-27');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fotocu`
--

CREATE TABLE `fotocu` (
  `fotocu_no` int(11) NOT NULL,
  `adi` text NOT NULL,
  `soyadi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `fotocu`
--

INSERT INTO `fotocu` (`fotocu_no`, `adi`, `soyadi`) VALUES
(1, 'Rüya', 'Taşgın'),
(2, 'Dere', 'Hakan');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fotografcilar`
--

CREATE TABLE `fotografcilar` (
  `fotografci_no` int(11) NOT NULL,
  `fotografci_adi` text NOT NULL,
  `fotografci_sadi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `konular`
--

CREATE TABLE `konular` (
  `konu_no` int(11) NOT NULL,
  `konu_adi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminno`);

--
-- Tablo için indeksler `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`fotograf_no`);

--
-- Tablo için indeksler `fotocu`
--
ALTER TABLE `fotocu`
  ADD PRIMARY KEY (`fotocu_no`);

--
-- Tablo için indeksler `fotografcilar`
--
ALTER TABLE `fotografcilar`
  ADD PRIMARY KEY (`fotografci_no`);

--
-- Tablo için indeksler `konular`
--
ALTER TABLE `konular`
  ADD PRIMARY KEY (`konu_no`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `adminno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `foto`
--
ALTER TABLE `foto`
  MODIFY `fotograf_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `fotocu`
--
ALTER TABLE `fotocu`
  MODIFY `fotocu_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `fotografcilar`
--
ALTER TABLE `fotografcilar`
  MODIFY `fotografci_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `konular`
--
ALTER TABLE `konular`
  MODIFY `konu_no` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
