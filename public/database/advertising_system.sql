-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 20, 2024 at 07:38 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advertising_system`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `applications`
--

CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `status` enum('oczekująca','odrzucona','zaakceptowana') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_id`, `user_id`, `offer_id`, `status`) VALUES
(13, 30, 8, 'odrzucona'),
(14, 30, 9, 'oczekująca'),
(15, 30, 65, 'zaakceptowana'),
(16, 30, 64, 'oczekująca'),
(17, 30, 70, 'oczekująca');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `zdjecie_url` varchar(255) NOT NULL,
  `nazwa_firmy` varchar(90) NOT NULL,
  `email` varchar(255) NOT NULL,
  `haslo` varchar(40) NOT NULL,
  `NIP` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `zdjecie_url`, `nazwa_firmy`, `email`, `haslo`, `NIP`) VALUES
(1, 'makolab.png', 'MakoLab', 'makolab@gmail.com', 'makomako', '1234567891'),
(2, 'softiq.png', 'SOFTIQ SOFTWARE HOUSE', '', '', '2345215215'),
(3, 'poloenergia.png', 'Polenergia Fotowoltaika S.A.', 'polo@gmail.com', 'polo', '2345215215'),
(4, 'tmobile.png', 'T-Mobile', '', '', '2345215215');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `doswiadczenie`
--

CREATE TABLE `doswiadczenie` (
  `doswiadczenie_id` int(11) NOT NULL,
  `data_poczatek` date NOT NULL,
  `data_koniec` date NOT NULL,
  `stanowisko` varchar(40) NOT NULL,
  `opis` varchar(300) NOT NULL,
  `firma` varchar(90) NOT NULL,
  `lokalizacja` varchar(50) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doswiadczenie`
--

INSERT INTO `doswiadczenie` (`doswiadczenie_id`, `data_poczatek`, `data_koniec`, `stanowisko`, `opis`, `firma`, `lokalizacja`, `uzytkownik_id`) VALUES
(1, '2024-05-01', '2024-05-23', 'Mid vuejs developer', 'Pracowałem przez jakiś czas jako mid vuejs developer.', 'Gizlomar', 'Kraków', 30),
(2, '2020-05-07', '2024-05-16', 'junior vue.js developer', 'Pracowałem przez 4 lata jako junior vue developer', 'Molekin', 'Warszawa', 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `job_levels`
--

CREATE TABLE `job_levels` (
  `job_level_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_levels`
--

INSERT INTO `job_levels` (`job_level_id`, `name`) VALUES
(1, 'praktykant / stażysta'),
(2, 'asystent'),
(3, 'młodszy specjalista'),
(4, 'specjalista'),
(5, 'starszy specjalista'),
(6, 'ekspert'),
(7, 'kierownik'),
(8, 'menedżer'),
(9, 'dyrektor'),
(10, 'prezes'),
(11, 'pracownik fizyczny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `kategoria_id` int(11) NOT NULL,
  `nazwa` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorie`
--

INSERT INTO `kategorie` (`kategoria_id`, `nazwa`) VALUES
(1, 'IT'),
(2, 'Marketing'),
(3, 'Praca zdalna');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `konwersacje`
--

CREATE TABLE `konwersacje` (
  `konwersacja_id` int(11) NOT NULL,
  `aktywna` tinyint(1) NOT NULL,
  `firma_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ogloszenia_firm`
--

CREATE TABLE `ogloszenia_firm` (
  `ogloszenie_id` int(11) NOT NULL,
  `zdjecie_url` varchar(255) NOT NULL,
  `tytul` varchar(100) NOT NULL,
  `opis` varchar(1000) NOT NULL,
  `umowa` varchar(10) NOT NULL,
  `lokalizacja` varchar(50) NOT NULL,
  `wynagrodzenie_min` int(11) NOT NULL,
  `wynagrodzenie_max` int(11) NOT NULL,
  `czestotliwosc_wynagrodzenia` varchar(20) NOT NULL,
  `data_dodania` date NOT NULL,
  `kategoria_id` int(11) NOT NULL,
  `firma_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogloszenia_firm`
--

INSERT INTO `ogloszenia_firm` (`ogloszenie_id`, `zdjecie_url`, `tytul`, `opis`, `umowa`, `lokalizacja`, `wynagrodzenie_min`, `wynagrodzenie_max`, `czestotliwosc_wynagrodzenia`, `data_dodania`, `kategoria_id`, `firma_id`) VALUES
(8, 'makolab_offer.png', 'vuejs developer', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 'B2B', 'Limanowa', 12000, 16000, 'mies.', '2024-01-12', 1, 1),
(9, 'softiq.png', 'react developer', 'dość głupek robiący w tym co popularne i powtarzający jak małpa że react jest super', 'B2C', 'Kraków', 5000, 6000, '', '2024-01-12', 1, 2),
(64, 'makolab_offer.png', 'Oferta pracy 1', 'Opis oferty pracy 1', 'Umowa o pr', 'Lokalizacja 1', 3000, 5000, '', '2023-01-01', 1, 1),
(65, 'makolab_offer.png', 'Oferta pracy 2', 'Opis oferty pracy 2', 'Umowa o pr', 'Lokalizacja 2', 3500, 5500, '', '2023-01-02', 1, 1),
(66, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(67, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(68, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(69, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(70, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(71, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(72, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(73, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(74, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(75, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(76, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(77, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(78, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(79, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(80, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(81, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(82, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(83, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(84, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(85, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(86, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(87, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(88, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(89, 'softiq.png', 'Oferta pracy 3', 'Opis oferty pracy 3', 'Umowa o pr', 'Lokalizacja 3', 4000, 6000, '', '2023-01-03', 1, 2),
(90, 'softiq.png', 'Oferta pracy 30', 'Opis oferty pracy 30', 'Umowa o pr', 'Lokalizacja 30', 4500, 6500, '', '2023-01-30', 2, 2),
(91, 'softiq.png', 'najwysze wnagrodzenie', 'fqwfwqfwqfwqiofbqwfibgwqfghb wqofhbqw', 'B2B', 'Limanowa', 19000, 70000, 'mies.', '2024-01-13', 1, 2),
(92, 'makolab_offer.png', 'fqwfwqfwqfwqfwq', 'fqwfwqfqwfqwfwq', 'B2C', 'Warszawa', 40, 60, 'godz.', '2024-01-13', 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ogloszenia_uzytkownikow`
--

CREATE TABLE `ogloszenia_uzytkownikow` (
  `ogloszenie_uzytkownika_id` int(11) NOT NULL,
  `zdjecie_url` varchar(255) NOT NULL,
  `stanowisko` varchar(80) NOT NULL,
  `placa_min` int(11) NOT NULL,
  `czestotliwosc_wynagrodzenia` varchar(20) NOT NULL,
  `lokalizacja` varchar(50) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `data_dodania` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ogloszenia_uzytkownikow`
--

INSERT INTO `ogloszenia_uzytkownikow` (`ogloszenie_uzytkownika_id`, `zdjecie_url`, `stanowisko`, `placa_min`, `czestotliwosc_wynagrodzenia`, `lokalizacja`, `uzytkownik_id`, `data_dodania`) VALUES
(2, 'profilowe.jpg', 'junior vuejs developer', 12000, 'mies.', 'Kraków', 1, '2024-02-11');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `powiadomienia`
--

CREATE TABLE `powiadomienia` (
  `powiadomienie_id` int(11) NOT NULL,
  `tytul` varchar(150) NOT NULL,
  `opis` varchar(1500) NOT NULL,
  `data_powiadomienia` datetime NOT NULL,
  `status` enum('oczekujace','zaakceptowane','odrzucone') NOT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `firma_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `powiadomienia`
--

INSERT INTO `powiadomienia` (`powiadomienie_id`, `tytul`, `opis`, `data_powiadomienia`, `status`, `uzytkownik_id`, `firma_id`) VALUES
(1, 'Firma gizlomar próbuje się z tobą skontakować', 'dzień dobry, w mailu wysyłamy umowe.', '2024-01-18 05:15:17', 'oczekujace', 1, NULL),
(2, 'Masz nową wiadomość', 'Dzień dobry,\n\nwynagrodzenie podane jest w brutto czy netto?', '2024-02-18 00:00:00', 'oczekujace', NULL, 1),
(4, 'Masz nową wiadomość', 'Jeszcze jedno pytanie, czy praca jest zdalna?', '2024-02-18 00:00:00', 'oczekujace', NULL, 1),
(5, 'Masz nową wiadomość', 'Czy firma oferuje darmowe posiłki?', '2024-02-18 20:25:00', 'oczekujace', NULL, 1),
(6, 'Pytanie', 'Dzień dobry, \n\njest możliwosć podwyżki?', '2024-02-18 00:47:45', 'oczekujace', NULL, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `types_of_contract`
--

CREATE TABLE `types_of_contract` (
  `type_of_contract_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `types_of_contract`
--

INSERT INTO `types_of_contract` (`type_of_contract_id`, `name`) VALUES
(1, 'umowa o pracę'),
(2, 'umowa o dzieło'),
(3, 'umowa o zlecenie'),
(4, 'kontrakt B2B'),
(5, 'umowa na zastępstwo'),
(6, 'umowa agencyjna'),
(7, 'umowa o staż / praktyki');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `umiejetnosci`
--

CREATE TABLE `umiejetnosci` (
  `umiejetnosc_id` int(11) NOT NULL,
  `umiejetnosc` varchar(50) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `umiejetnosci`
--

INSERT INTO `umiejetnosci` (`umiejetnosc_id`, `umiejetnosc`, `uzytkownik_id`) VALUES
(35, 'Vue.js', 30),
(36, 'Javascript', 30),
(37, 'Typescript', 30),
(38, 'PHP', 30),
(39, 'HTML', 30),
(40, 'CSS', 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `uzytkownik_id` int(11) NOT NULL,
  `login` varchar(40) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `opis` varchar(1500) NOT NULL,
  `numer_telefonu` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `stanowisko` varchar(40) NOT NULL,
  `status` varchar(20) NOT NULL,
  `wiek` tinyint(3) UNSIGNED NOT NULL,
  `kraj` varchar(58) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uzytkownik_id`, `login`, `imie`, `nazwisko`, `opis`, `numer_telefonu`, `email`, `stanowisko`, `status`, `wiek`, `kraj`, `password`) VALUES
(30, '', 'Bonifacy', 'Borucki', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n\r\n\r\n', '518242045', 'bonifacyborucki123@gmail.com', 'Mid vuejs developer', 'bezrobotny', 24, 'Polska', '$2y$10$Qw4/SAmZdINGryn.qFGfzunx.xjLQKaMZl.g3CAwTNz0znNp0aRDm'),
(31, '', '', '', '', '', 'michal912456@gmail.com', '', '', 0, '', '$2y$10$Mfd4wSbkq3PQdyvX70/fleMWRvy/Zy91OBSjyFhNt3KOOlH06Fm86');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wiadomosci`
--

CREATE TABLE `wiadomosci` (
  `wiadomosc_id` int(11) NOT NULL,
  `tresc` varchar(3000) NOT NULL,
  `nadawca_id` int(11) NOT NULL,
  `nadawca_typ` enum('uzytkownik','firma') NOT NULL,
  `data_wyslania` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `czy_odczytana` tinyint(1) NOT NULL,
  `konwersacja_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisane`
--

CREATE TABLE `zapisane` (
  `zapisane_id` int(11) NOT NULL,
  `ogloszenie_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`application_id`);

--
-- Indeksy dla tabeli `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indeksy dla tabeli `doswiadczenie`
--
ALTER TABLE `doswiadczenie`
  ADD PRIMARY KEY (`doswiadczenie_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `job_levels`
--
ALTER TABLE `job_levels`
  ADD PRIMARY KEY (`job_level_id`);

--
-- Indeksy dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`kategoria_id`);

--
-- Indeksy dla tabeli `konwersacje`
--
ALTER TABLE `konwersacje`
  ADD PRIMARY KEY (`konwersacja_id`),
  ADD KEY `uczestnik_1` (`firma_id`),
  ADD KEY `uczestnik_2` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `ogloszenia_firm`
--
ALTER TABLE `ogloszenia_firm`
  ADD PRIMARY KEY (`ogloszenie_id`),
  ADD KEY `firma_id` (`firma_id`),
  ADD KEY `kategoria_id` (`kategoria_id`);

--
-- Indeksy dla tabeli `ogloszenia_uzytkownikow`
--
ALTER TABLE `ogloszenia_uzytkownikow`
  ADD PRIMARY KEY (`ogloszenie_uzytkownika_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `powiadomienia`
--
ALTER TABLE `powiadomienia`
  ADD PRIMARY KEY (`powiadomienie_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`),
  ADD KEY `firma_id` (`firma_id`);

--
-- Indeksy dla tabeli `types_of_contract`
--
ALTER TABLE `types_of_contract`
  ADD PRIMARY KEY (`type_of_contract_id`);

--
-- Indeksy dla tabeli `umiejetnosci`
--
ALTER TABLE `umiejetnosci`
  ADD PRIMARY KEY (`umiejetnosc_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uzytkownik_id`);

--
-- Indeksy dla tabeli `wiadomosci`
--
ALTER TABLE `wiadomosci`
  ADD PRIMARY KEY (`wiadomosc_id`),
  ADD KEY `konwersacja_id` (`konwersacja_id`);

--
-- Indeksy dla tabeli `zapisane`
--
ALTER TABLE `zapisane`
  ADD PRIMARY KEY (`zapisane_id`),
  ADD KEY `ogloszenie_id` (`ogloszenie_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doswiadczenie`
--
ALTER TABLE `doswiadczenie`
  MODIFY `doswiadczenie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `job_levels`
--
ALTER TABLE `job_levels`
  MODIFY `job_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `kategoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `konwersacje`
--
ALTER TABLE `konwersacje`
  MODIFY `konwersacja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ogloszenia_firm`
--
ALTER TABLE `ogloszenia_firm`
  MODIFY `ogloszenie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `ogloszenia_uzytkownikow`
--
ALTER TABLE `ogloszenia_uzytkownikow`
  MODIFY `ogloszenie_uzytkownika_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `powiadomienia`
--
ALTER TABLE `powiadomienia`
  MODIFY `powiadomienie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `types_of_contract`
--
ALTER TABLE `types_of_contract`
  MODIFY `type_of_contract_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `umiejetnosci`
--
ALTER TABLE `umiejetnosci`
  MODIFY `umiejetnosc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uzytkownik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wiadomosci`
--
ALTER TABLE `wiadomosci`
  MODIFY `wiadomosc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `zapisane`
--
ALTER TABLE `zapisane`
  MODIFY `zapisane_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doswiadczenie`
--
ALTER TABLE `doswiadczenie`
  ADD CONSTRAINT `doswiadczenie_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `users` (`uzytkownik_id`);

--
-- Constraints for table `konwersacje`
--
ALTER TABLE `konwersacje`
  ADD CONSTRAINT `konwersacje_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `users` (`uzytkownik_id`),
  ADD CONSTRAINT `konwersacje_ibfk_2` FOREIGN KEY (`firma_id`) REFERENCES `companies` (`company_id`);

--
-- Constraints for table `ogloszenia_firm`
--
ALTER TABLE `ogloszenia_firm`
  ADD CONSTRAINT `ogloszenia_firm_ibfk_1` FOREIGN KEY (`firma_id`) REFERENCES `companies` (`company_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ogloszenia_firm_ibfk_2` FOREIGN KEY (`kategoria_id`) REFERENCES `kategorie` (`kategoria_id`);

--
-- Constraints for table `ogloszenia_uzytkownikow`
--
ALTER TABLE `ogloszenia_uzytkownikow`
  ADD CONSTRAINT `ogloszenia_uzytkownikow_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `users` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `powiadomienia`
--
ALTER TABLE `powiadomienia`
  ADD CONSTRAINT `powiadomienia_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `users` (`uzytkownik_id`),
  ADD CONSTRAINT `powiadomienia_ibfk_2` FOREIGN KEY (`firma_id`) REFERENCES `companies` (`company_id`);

--
-- Constraints for table `umiejetnosci`
--
ALTER TABLE `umiejetnosci`
  ADD CONSTRAINT `umiejetnosci_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `users` (`uzytkownik_id`);

--
-- Constraints for table `wiadomosci`
--
ALTER TABLE `wiadomosci`
  ADD CONSTRAINT `wiadomosci_ibfk_1` FOREIGN KEY (`konwersacja_id`) REFERENCES `konwersacje` (`konwersacja_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
