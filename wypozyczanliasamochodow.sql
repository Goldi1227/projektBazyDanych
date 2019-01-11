-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Sty 2019, 20:09
-- Wersja serwera: 10.1.36-MariaDB
-- Wersja PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wypozyczanliasamochodow`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres_klienta`
--

CREATE TABLE `adres_klienta` (
  `AK_ID` int(11) NOT NULL,
  `AK_Ulica` varchar(40) COLLATE utf8_polish_ci DEFAULT NULL,
  `AK_NrDomu` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  `AK_NrMieszkania` varchar(5) COLLATE utf8_polish_ci DEFAULT NULL,
  `AK_Miejscowosc` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `AK_KodPocztowy` varchar(6) COLLATE utf8_polish_ci NOT NULL,
  `AK_Kraj` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Klienci_KL_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `adres_klienta`
--

INSERT INTO `adres_klienta` (`AK_ID`, `AK_Ulica`, `AK_NrDomu`, `AK_NrMieszkania`, `AK_Miejscowosc`, `AK_KodPocztowy`, `AK_Kraj`, `Klienci_KL_ID`) VALUES
(1, NULL, '31', NULL, 'Wólka Grądzka', '33-221', 'Polska', 1),
(2, 'dąbrowskiego', '8', '33', 'Tarnów', '33-100', 'Polska', 2),
(3, 'waryńskiego', '132', NULL, 'Rzeszów', '12-345', 'Polska', 3),
(4, NULL, '642', NULL, 'Szczucin', '33-200', 'Polska', 4),
(5, 'zjednoczenia', '1', '122', 'Kraków', '33-010', 'Polska', 5),
(6, NULL, '7', '89', 'Dębica', '22-222', 'Polska', 6),
(7, 'sienkiewicz', '1', '1', 'Rzeszów', '20-200', 'Polska', 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `KL_ID` int(11) NOT NULL,
  `KL_Imie` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `KL_Drugie` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `KL_Nazwisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `KL_Firma` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `KL_PESEL` varchar(11) COLLATE utf8_polish_ci NOT NULL,
  `KL_NIP` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `KL_REGON` varchar(9) COLLATE utf8_polish_ci DEFAULT NULL,
  `KL_KRS` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `KL_DataUrodzenia` date NOT NULL,
  `KL_NrDokumentu` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `KL_Email` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `KL_Telefon` varchar(12) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`KL_ID`, `KL_Imie`, `KL_Drugie`, `KL_Nazwisko`, `KL_Firma`, `KL_PESEL`, `KL_NIP`, `KL_REGON`, `KL_KRS`, `KL_DataUrodzenia`, `KL_NrDokumentu`, `KL_Email`, `KL_Telefon`) VALUES
(1, 'Arkadiusz', 'Jerzy', 'Trębaczewski', NULL, '62040379164', NULL, NULL, NULL, '1962-03-04', 'ABC12345', 'atreba@email.com', '555666777'),
(2, 'Mateusz', NULL, 'Tokarski', 'TOKAR ', '67082549913', '9659493806', '757478474', NULL, '1967-08-25', 'KXQ318951', 'tokar@email.com', '111222333'),
(3, 'Jan', 'Adam', 'Kowalski', NULL, '59052979288', NULL, NULL, NULL, '1959-05-29', 'RYW437210', 'janek@gmail.com', '123432135'),
(4, 'Adam', NULL, 'Dąbrowski', 'Adamex', '82012163157', '7760168022', '233802176', '0000311911', '1982-12-16', 'RYW437210', 'adamek@gmail.com', '904231943'),
(5, 'Monika', 'Anna', 'Kowalska', NULL, '29050265157', NULL, NULL, NULL, '1929-05-02', 'XWG306428', 'mkowal@email.pl', '432543512'),
(6, 'Maria', 'Żaneta', 'Norris', 'Chuck Norris Sp. z.o.o.', '64082974754', '4178493500', '395108688', '0000174486', '1964-08-29', 'PEH614137', 'norris@chuck.pl', '123456789'),
(7, 'Piotr', NULL, 'Fronczewski', NULL, '43111564113', NULL, NULL, NULL, '1943-11-15', 'UOD527500', 'pjoter@email.pl', '912312322');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochod`
--

CREATE TABLE `samochod` (
  `S_ID` int(11) NOT NULL,
  `S_Marka` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `S_Model` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `S_PojemnoscSilnika` int(11) NOT NULL,
  `S_TypSilnika` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `S_NumerRejestracyjny` varchar(8) COLLATE utf8_polish_ci NOT NULL,
  `S_RokProdukcji` int(11) NOT NULL,
  `S_TypSkrzyni` varchar(12) COLLATE utf8_polish_ci NOT NULL,
  `S_IloscDrzwi` int(11) NOT NULL,
  `S_IloscMiejsc` int(11) NOT NULL,
  `S_DataWynajmu` date DEFAULT NULL,
  `S_DataZwrotu` date DEFAULT NULL,
  `S_KosztWynajmu` decimal(8,2) NOT NULL,
  `S_Kaucja` decimal(8,2) NOT NULL,
  `WyposazenieSamochodu_WS_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `samochod`
--

INSERT INTO `samochod` (`S_ID`, `S_Marka`, `S_Model`, `S_PojemnoscSilnika`, `S_TypSilnika`, `S_NumerRejestracyjny`, `S_RokProdukcji`, `S_TypSkrzyni`, `S_IloscDrzwi`, `S_IloscMiejsc`, `S_DataWynajmu`, `S_DataZwrotu`, `S_KosztWynajmu`, `S_Kaucja`, `WyposazenieSamochodu_WS_ID`) VALUES
(1, 'Toyota', 'Avensis', 2000, 'Benzyna', 'RZ 12345', 2012, 'manualna', 5, 5, NULL, NULL, '120.00', '500.00', 1),
(2, 'Nissan', 'Qashqai', 1500, 'Diesel', 'RZ 12346', 2017, 'automatyczna', 5, 5, NULL, NULL, '160.00', '800.00', 2),
(3, 'Hyundai', 'ix35', 1600, 'Diesel', 'RZ 12347', 2015, 'automatyczna', 5, 5, '2019-02-01', '2019-02-15', '130.00', '700.00', 3),
(4, 'Kia', 'Ceed', 1400, 'Benzyna', 'RZ 12348', 2014, 'manualna', 5, 5, '2018-12-13', '2018-12-25', '120.00', '500.00', 4),
(5, 'Opel', 'Mokka', 1700, 'Diesel', 'RZ 21345', 2014, 'manualna', 5, 5, NULL, NULL, '130.00', '600.00', 5),
(6, 'Toyota', 'Aygo', 1000, 'Benzyna', 'RZ 54321', 2016, 'manualna', 3, 4, NULL, NULL, '100.00', '500.00', 6),
(7, 'Jeep', 'Gran Cherokee SRT', 6400, 'Benzyna', 'RZ 32121', 2016, 'automatyczna', 5, 5, '2019-01-20', '2019-02-02', '300.00', '3500.00', 7),
(8, 'Audi', 'A6', 2000, 'Diesel', 'RZ 76543', 2017, 'automatyczna', 5, 5, '2019-01-10', '2019-01-16', '200.00', '2200.00', 8),
(9, 'Lexus', 'RX200H', 2000, 'Hybryda', 'RZ 99999', 2017, 'automatyczna', 5, 5, NULL, NULL, '230.00', '2800.00', 9),
(10, 'Skoda', 'Octavia', 1600, 'Benzyna', 'RZ 31567', 2016, 'manualna', 5, 5, NULL, NULL, '130.00', '800.00', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ubezpieczenie`
--

CREATE TABLE `ubezpieczenie` (
  `UB_ID` int(11) NOT NULL,
  `UB_RodzajUbezpieczenia` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `UB_Ubezpieczajacy` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `UB_ObowiazujeOD` date NOT NULL,
  `UB_ObowiazujeDD` date NOT NULL,
  `UB_Cena` decimal(8,2) NOT NULL,
  `UB_WysokoscPolisy` decimal(10,2) NOT NULL,
  `Samochody_S_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `ubezpieczenie`
--

INSERT INTO `ubezpieczenie` (`UB_ID`, `UB_RodzajUbezpieczenia`, `UB_Ubezpieczajacy`, `UB_ObowiazujeOD`, `UB_ObowiazujeDD`, `UB_Cena`, `UB_WysokoscPolisy`, `Samochody_S_ID`) VALUES
(1, 'OC + AC + NNW', 'HDI', '2018-09-11', '2019-09-11', '1900.00', '3000000.00', 1),
(2, 'OC + AC + NNW', 'HDI', '2018-03-31', '2019-03-31', '1700.00', '3000000.00', 2),
(3, 'OC + AC + NNW', 'HDI', '2018-07-22', '2018-07-22', '1700.00', '3000000.00', 3),
(4, 'OC + AC + NNW', 'HDI', '2018-05-05', '2019-05-05', '1600.00', '3000000.00', 4),
(5, 'OC + AC + NNW', 'HDI', '2018-06-06', '2019-06-06', '1700.00', '3000000.00', 5),
(6, 'OC + AC + NNW', 'HDI', '2018-11-12', '2019-11-12', '1300.00', '3000000.00', 6),
(7, 'OC + AC + NNW ', 'HDI', '2018-10-10', '2019-10-10', '3600.00', '3000000.00', 7),
(8, 'OC + AC + NNW', 'HDI', '2017-10-10', '2018-10-10', '3600.00', '3000000.00', 7),
(9, 'OC + AC + NNW', 'HDI', '2018-02-02', '2019-02-02', '2000.00', '3000000.00', 8),
(10, 'OC + AC + NNW', 'HDI', '2018-12-12', '2019-12-12', '1400.00', '3000000.00', 9),
(11, 'OC + AC + NNW', 'HDI', '2018-11-18', '2019-11-18', '1800.00', '3000000.00', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `umowa`
--

CREATE TABLE `umowa` (
  `U_ID` int(11) NOT NULL,
  `U_DataZawarcia` date NOT NULL,
  `U_ObowiazujeOD` date NOT NULL,
  `U_ObowiazujeDO` date NOT NULL,
  `U_DataPlatnosci` date NOT NULL,
  `U_Protokol` tinyint(1) NOT NULL,
  `U_Uwagi` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `Klienci_KL_ID` int(11) NOT NULL,
  `Samochody_S_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `umowa`
--

INSERT INTO `umowa` (`U_ID`, `U_DataZawarcia`, `U_ObowiazujeOD`, `U_ObowiazujeDO`, `U_DataPlatnosci`, `U_Protokol`, `U_Uwagi`, `Klienci_KL_ID`, `Samochody_S_ID`) VALUES
(1, '2018-12-12', '2018-12-13', '2018-12-25', '2018-12-26', 1, NULL, 1, 4),
(2, '2019-01-10', '2019-01-20', '2019-02-02', '2019-01-24', 1, NULL, 5, 7),
(3, '2019-01-02', '2019-01-02', '2019-01-10', '2019-01-16', 1, NULL, 3, 8),
(4, '2019-01-05', '2019-02-01', '2019-02-15', '2019-01-19', 1, NULL, 7, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyposazenie_samochodu`
--

CREATE TABLE `wyposazenie_samochodu` (
  `WS_ID` int(11) NOT NULL,
  `WS_Klimatyzacja` tinyint(1) NOT NULL,
  `WS_WspomaganieKierownicy` tinyint(1) NOT NULL,
  `WS_ABS` tinyint(1) NOT NULL,
  `WS_CentralnyZamek` tinyint(1) NOT NULL,
  `WS_SystemAudio` tinyint(1) NOT NULL,
  `WS_PoduszkiPowietrzne` tinyint(1) NOT NULL,
  `WS_Nawigacja` tinyint(1) NOT NULL,
  `WS_Bluetooth` tinyint(1) NOT NULL,
  `WS_PodgrzewaneFotele` tinyint(1) NOT NULL,
  `WS_PodgrzewaneSzyby` tinyint(1) NOT NULL,
  `WS_PodgrzewaneLusterka` tinyint(1) NOT NULL,
  `WS_Tempomat` tinyint(1) NOT NULL,
  `WS_KameraCofania` tinyint(1) NOT NULL,
  `WS_CzujnikiCofania` tinyint(1) NOT NULL,
  `WS_KoloZapasowe` tinyint(1) NOT NULL,
  `WS_Uwagi` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wyposazenie_samochodu`
--

INSERT INTO `wyposazenie_samochodu` (`WS_ID`, `WS_Klimatyzacja`, `WS_WspomaganieKierownicy`, `WS_ABS`, `WS_CentralnyZamek`, `WS_SystemAudio`, `WS_PoduszkiPowietrzne`, `WS_Nawigacja`, `WS_Bluetooth`, `WS_PodgrzewaneFotele`, `WS_PodgrzewaneSzyby`, `WS_PodgrzewaneLusterka`, `WS_Tempomat`, `WS_KameraCofania`, `WS_CzujnikiCofania`, `WS_KoloZapasowe`, `WS_Uwagi`) VALUES
(1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'brak'),
(2, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'samochód posiada zarysowany prawy błotnik'),
(3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'brak'),
(4, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 'brak'),
(5, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 'brak'),
(6, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'brak'),
(7, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 'brak'),
(8, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'brak'),
(9, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 'auto ma lakierowane drzwi kierowcy '),
(10, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 'brak');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adres_klienta`
--
ALTER TABLE `adres_klienta`
  ADD PRIMARY KEY (`AK_ID`),
  ADD KEY `Klienci_KL_ID` (`Klienci_KL_ID`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`KL_ID`);

--
-- Indeksy dla tabeli `samochod`
--
ALTER TABLE `samochod`
  ADD PRIMARY KEY (`S_ID`),
  ADD KEY `WyposazenieSamochodu_WS_ID` (`WyposazenieSamochodu_WS_ID`);

--
-- Indeksy dla tabeli `ubezpieczenie`
--
ALTER TABLE `ubezpieczenie`
  ADD PRIMARY KEY (`UB_ID`),
  ADD KEY `Samochody_S_ID` (`Samochody_S_ID`);

--
-- Indeksy dla tabeli `umowa`
--
ALTER TABLE `umowa`
  ADD PRIMARY KEY (`U_ID`),
  ADD KEY `Klienci_KL_ID` (`Klienci_KL_ID`),
  ADD KEY `Samochody_S_ID` (`Samochody_S_ID`);

--
-- Indeksy dla tabeli `wyposazenie_samochodu`
--
ALTER TABLE `wyposazenie_samochodu`
  ADD PRIMARY KEY (`WS_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `adres_klienta`
--
ALTER TABLE `adres_klienta`
  MODIFY `AK_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `KL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `samochod`
--
ALTER TABLE `samochod`
  MODIFY `S_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `ubezpieczenie`
--
ALTER TABLE `ubezpieczenie`
  MODIFY `UB_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `umowa`
--
ALTER TABLE `umowa`
  MODIFY `U_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `wyposazenie_samochodu`
--
ALTER TABLE `wyposazenie_samochodu`
  MODIFY `WS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `adres_klienta`
--
ALTER TABLE `adres_klienta`
  ADD CONSTRAINT `adres_klienta_ibfk_1` FOREIGN KEY (`Klienci_KL_ID`) REFERENCES `klient` (`KL_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `samochod`
--
ALTER TABLE `samochod`
  ADD CONSTRAINT `samochod_ibfk_1` FOREIGN KEY (`WyposazenieSamochodu_WS_ID`) REFERENCES `wyposazenie_samochodu` (`WS_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `ubezpieczenie`
--
ALTER TABLE `ubezpieczenie`
  ADD CONSTRAINT `ubezpieczenie_ibfk_1` FOREIGN KEY (`Samochody_S_ID`) REFERENCES `samochod` (`S_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `umowa`
--
ALTER TABLE `umowa`
  ADD CONSTRAINT `umowa_ibfk_1` FOREIGN KEY (`Klienci_KL_ID`) REFERENCES `klient` (`KL_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `umowa_ibfk_2` FOREIGN KEY (`Samochody_S_ID`) REFERENCES `samochod` (`S_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
