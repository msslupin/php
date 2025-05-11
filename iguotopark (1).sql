-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 11 May 2025, 19:42:12
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `iguotopark`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `araclar`
--

CREATE TABLE `araclar` (
  `arac_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `plaka` varchar(20) NOT NULL,
  `park_id` varchar(10) DEFAULT NULL,
  `otopark_id` int(11) NOT NULL,
  `saat` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `araclar`
--

INSERT INTO `araclar` (`arac_id`, `kullanici_id`, `plaka`, `park_id`, `otopark_id`, `saat`) VALUES
(2, 23, '28 HN 28', NULL, 0, NULL),
(14, 23, '37 FB 37', NULL, 0, NULL),
(15, 23, '37 FB 37', NULL, 0, NULL),
(16, 23, '29 HB 29', NULL, 0, NULL),
(17, 23, '37 FB 37', NULL, 0, NULL),
(18, 23, '37 FB 37', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicibilgi`
--

CREATE TABLE `kullanicibilgi` (
  `kullanici_id` int(11) NOT NULL,
  `kullanidi_adi` text NOT NULL,
  `kullanici_soyad` text NOT NULL,
  `kullanici_tel` text NOT NULL,
  `kullanici_eposta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(11) NOT NULL,
  `kullanici_adi` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `parola` varchar(25) NOT NULL,
  `kayit_tarihi` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `kullanici_adi`, `email`, `parola`, `kayit_tarihi`) VALUES
(20, 'ibrahim', 'yasemin.emrecik51@gmail.com', 'fener5151', '2024-12-20 22:26:41'),
(21, 'xyz', 'xyz@gmail.com', 'fener', '2024-12-20 22:28:31'),
(22, 'admin', 'aziz_ckr_@hotmail.com', 'o%tFloRQjuSvvqKGa&', '2024-12-22 13:18:11'),
(23, 'asli', 'asli@gmail.com', '1907', '2025-05-11 15:27:38');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `otopark`
--

CREATE TABLE `otopark` (
  `otopark_id` int(11) NOT NULL,
  `otopark-adi` varchar(50) NOT NULL,
  `otopark-limit` int(11) NOT NULL,
  `otopark-lpg` int(11) NOT NULL,
  `otopark-alan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `otopark`
--

INSERT INTO `otopark` (`otopark_id`, `otopark-adi`, `otopark-limit`, `otopark-lpg`, `otopark-alan`) VALUES
(1, 'Gelişim Kampüs', 200, 0, 0),
(2, 'Bayrampaşa Kocatepe Otoparkı', 241, 0, 1),
(3, 'Sultangazi Zemin Altı Otoparkı', 104, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `otopark-icerik`
--

CREATE TABLE `otopark-icerik` (
  `otopark-id` int(11) NOT NULL,
  `otopark-harf` text NOT NULL,
  `otopark-harfsayi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `otopark-icerik`
--

INSERT INTO `otopark-icerik` (`otopark-id`, `otopark-harf`, `otopark-harfsayi`) VALUES
(1, 'ABCDE', 12),
(2, 'ABDCEFG', 10),
(3, 'ABCDEFGH', 8);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `otoparkdoluluk`
--

CREATE TABLE `otoparkdoluluk` (
  `otopark_id` int(11) NOT NULL,
  `dolu-alan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `otoparkdoluluk`
--

INSERT INTO `otoparkdoluluk` (`otopark_id`, `dolu-alan`) VALUES
(1, 100),
(2, 60),
(3, 90);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `park_yerleri`
--

CREATE TABLE `park_yerleri` (
  `park_id` varchar(10) NOT NULL,
  `otopark_id` int(11) NOT NULL,
  `durum` varchar(10) NOT NULL DEFAULT 'bos',
  `pozisyon` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `park_yerleri`
--

INSERT INTO `park_yerleri` (`park_id`, `otopark_id`, `durum`, `pozisyon`) VALUES
('A1', 1, 'bos', 'üst'),
('A1', 2, 'rezerve', 'üst'),
('A1', 3, 'rezerve', 'üst'),
('A2', 1, 'bos', 'üst'),
('A2', 2, 'rezerve', 'üst'),
('A2', 3, 'bos', 'üst'),
('A3', 1, 'bos', 'üst'),
('A3', 2, 'rezerve', 'üst'),
('A3', 3, 'bos', 'üst'),
('A4', 1, 'bos', 'üst'),
('A4', 2, 'rezerve', 'üst'),
('A4', 3, 'bos', 'üst'),
('A5', 1, 'bos', 'üst'),
('A5', 2, 'rezerve', 'üst'),
('A5', 3, 'bos', 'üst'),
('B1', 1, 'bos', 'alt'),
('B1', 2, 'rezerve', 'alt'),
('B1', 3, 'bos', 'alt'),
('B2', 1, 'bos', 'alt'),
('B2', 2, 'rezerve', 'alt'),
('B2', 3, 'bos', 'alt'),
('B3', 1, 'bos', 'alt'),
('B3', 2, 'rezerve', 'alt'),
('B3', 3, 'bos', 'alt'),
('B4', 1, 'bos', 'alt'),
('B4', 2, 'rezerve', 'alt'),
('B4', 3, 'bos', 'alt'),
('B5', 1, 'bos', 'alt'),
('B5', 2, 'rezerve', 'alt'),
('B5', 3, 'bos', 'alt'),
('C1', 1, 'bos', 'üst'),
('C1', 2, 'rezerve', 'üst'),
('C1', 3, 'rezerve', 'üst'),
('C2', 1, 'bos', 'üst'),
('C2', 2, 'rezerve', 'üst'),
('C2', 3, 'bos', 'üst'),
('C3', 1, 'bos', 'üst'),
('C3', 2, 'rezerve', 'üst'),
('C3', 3, 'bos', 'üst'),
('C4', 1, 'bos', 'üst'),
('C4', 2, 'rezerve', 'üst'),
('C4', 3, 'rezerve', 'üst'),
('C5', 1, 'bos', 'üst'),
('C5', 2, 'rezerve', 'üst'),
('C5', 3, 'bos', 'üst'),
('D1', 1, 'bos', 'alt'),
('D1', 2, 'rezerve', 'alt'),
('D1', 3, 'bos', 'alt'),
('D2', 1, 'bos', 'alt'),
('D2', 2, 'rezerve', 'alt'),
('D2', 3, 'bos', 'alt'),
('D3', 1, 'bos', 'alt'),
('D3', 2, 'rezerve', 'alt'),
('D3', 3, 'bos', 'alt'),
('D4', 1, 'bos', 'alt'),
('D4', 2, 'rezerve', 'alt'),
('D4', 3, 'bos', 'alt'),
('D5', 1, 'bos', 'alt'),
('D5', 2, 'rezerve', 'alt'),
('D5', 3, 'bos', 'alt'),
('E1', 1, 'bos', 'üst'),
('E1', 3, 'bos', 'üst'),
('E2', 1, 'bos', 'üst'),
('E2', 3, 'rezerve', 'üst'),
('E3', 1, 'bos', 'üst'),
('E3', 3, 'bos', 'üst'),
('E4', 1, 'bos', 'üst'),
('E4', 3, 'bos', 'üst'),
('E5', 1, 'bos', 'üst'),
('E5', 3, 'bos', 'üst'),
('F1', 3, 'bos', 'alt'),
('F2', 3, 'bos', 'alt'),
('F3', 3, 'bos', 'alt'),
('F4', 3, 'bos', 'alt'),
('F5', 3, 'bos', 'alt');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nameandsurname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `numberplate` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `nameandsurname`, `email`, `birthday`, `phone`, `numberplate`) VALUES
(1, 'a', 'a@gmail.com', '2004-10-04', '05376091460', '34 YDR 34');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `araclar`
--
ALTER TABLE `araclar`
  ADD PRIMARY KEY (`arac_id`),
  ADD KEY `kullanici_id` (`kullanici_id`),
  ADD KEY `park_id` (`park_id`,`otopark_id`);

--
-- Tablo için indeksler `kullanicibilgi`
--
ALTER TABLE `kullanicibilgi`
  ADD PRIMARY KEY (`kullanici_id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kullanici_adi` (`kullanici_adi`);

--
-- Tablo için indeksler `otopark`
--
ALTER TABLE `otopark`
  ADD PRIMARY KEY (`otopark_id`);

--
-- Tablo için indeksler `otopark-icerik`
--
ALTER TABLE `otopark-icerik`
  ADD KEY `otopark-id` (`otopark-id`);

--
-- Tablo için indeksler `otoparkdoluluk`
--
ALTER TABLE `otoparkdoluluk`
  ADD KEY `otopark_id` (`otopark_id`);

--
-- Tablo için indeksler `park_yerleri`
--
ALTER TABLE `park_yerleri`
  ADD PRIMARY KEY (`park_id`,`otopark_id`),
  ADD KEY `otopark_id` (`otopark_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `araclar`
--
ALTER TABLE `araclar`
  MODIFY `arac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicibilgi`
--
ALTER TABLE `kullanicibilgi`
  MODIFY `kullanici_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Tablo için AUTO_INCREMENT değeri `otopark`
--
ALTER TABLE `otopark`
  MODIFY `otopark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `araclar`
--
ALTER TABLE `araclar`
  ADD CONSTRAINT `araclar_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`id`),
  ADD CONSTRAINT `araclar_ibfk_2` FOREIGN KEY (`park_id`,`otopark_id`) REFERENCES `park_yerleri` (`park_id`, `otopark_id`);

--
-- Tablo kısıtlamaları `otopark-icerik`
--
ALTER TABLE `otopark-icerik`
  ADD CONSTRAINT `otopark-icerik_ibfk_1` FOREIGN KEY (`otopark-id`) REFERENCES `otopark` (`otopark_id`);

--
-- Tablo kısıtlamaları `otoparkdoluluk`
--
ALTER TABLE `otoparkdoluluk`
  ADD CONSTRAINT `otoparkdoluluk_ibfk_1` FOREIGN KEY (`otopark_id`) REFERENCES `otopark` (`otopark_id`);

--
-- Tablo kısıtlamaları `park_yerleri`
--
ALTER TABLE `park_yerleri`
  ADD CONSTRAINT `park_yerleri_ibfk_1` FOREIGN KEY (`otopark_id`) REFERENCES `otopark` (`otopark_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
