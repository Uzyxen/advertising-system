-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 10, 2024 at 11:30 PM
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
  `status` enum('oczekująca','odrzucona','zatwierdzona') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_id`, `user_id`, `offer_id`, `status`) VALUES
(61, 30, 159, 'zatwierdzona'),
(62, 30, 158, 'odrzucona'),
(64, 30, 160, 'zatwierdzona');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `zdjecie_url` varchar(255) NOT NULL,
  `nazwa_firmy` varchar(90) NOT NULL,
  `email` varchar(255) NOT NULL,
  `country` varchar(20) NOT NULL,
  `remote` tinyint(1) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `password` varchar(255) NOT NULL,
  `NIP` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `zdjecie_url`, `nazwa_firmy`, `email`, `country`, `remote`, `description`, `password`, `NIP`) VALUES
(5, 'gizlomar.png', 'gizlomar', 'qwe@gmail.com', 'Polska', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letra', '$2y$10$1wI/XhIes67/tg2NrXn6H.mnvMmjIga1meSs90weRiU6KjgvxmW3m', '123-456-12-92'),
(6, 'obraz_2024-06-02_203348043.png', 'Axos', 'firma@gmail.com', 'Polska', 0, 'firma IT', '$2y$10$LZBDzhhUJTcWzjmSj11ab.sOstB39IcDvxVdFp8GeNUfhICf8lbA6', '123-123-12-12');

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
(5, '2024-06-01', '2024-06-10', 'Vuejs developer', 'bfqwgbf wiqobf ouqiwbf oqwb fqwof qw', 'Gizlomar', 'Limanowa', 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `duties`
--

CREATE TABLE `duties` (
  `duty_id` int(11) NOT NULL,
  `duty` varchar(255) NOT NULL,
  `offer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `duties`
--

INSERT INTO `duties` (`duty_id`, `duty`, `offer_id`) VALUES
(19, 'obowiazek 1', 158),
(20, 'obowiązek 2', 158),
(21, 'obowiązek 3', 158),
(22, 'obowiązek 4', 158),
(23, 'eqweqw', 159),
(24, 'ewqeqweqweqw', 159),
(31, ' qweqweqweqweqwe aqwe qawd', 162),
(32, ' qweqweqweqweqwe aqwe qawd qweqweqweqweqwe aqwe qawd', 162),
(33, ' qweqweqweqweqwe aqwe qawd', 162),
(34, ' qweqweqweqweqwe aqwe qawd qweqweqweqweqwe aqwe qawd', 162),
(35, 'qweqwe qweqw eqw eqw e eqw', 163),
(36, 'qwe qwe qwee qwe qwqwe qwe', 163);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `education`
--

CREATE TABLE `education` (
  `education_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(30) NOT NULL,
  `level` varchar(20) NOT NULL,
  `specialization` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`education_id`, `name`, `location`, `level`, `specialization`, `start_date`, `end_date`, `user_id`) VALUES
(1, 'ZSTiO', 'Limanowa', 'Średnie', 'programista', '2020-06-03', '2024-06-10', 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `employment_types`
--

CREATE TABLE `employment_types` (
  `employment_type_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employment_types`
--

INSERT INTO `employment_types` (`employment_type_id`, `name`) VALUES
(1, 'pełny etat'),
(2, 'część etatu'),
(3, 'praca dodatkowa'),
(4, 'praca dorywcza'),
(5, 'praca sezonowa');

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
-- Struktura tabeli dla tabeli `job_modes`
--

CREATE TABLE `job_modes` (
  `job_mode_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_modes`
--

INSERT INTO `job_modes` (`job_mode_id`, `name`) VALUES
(1, 'praca stacjonarna'),
(2, 'praca hybrydowa'),
(3, 'praca zdalna'),
(4, 'praca mobilna');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `kategoria_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorie`
--

INSERT INTO `kategorie` (`kategoria_id`, `name`) VALUES
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
-- Struktura tabeli dla tabeli `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL,
  `language` varchar(30) NOT NULL,
  `level` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`language_id`, `language`, `level`, `user_id`) VALUES
(4, 'Polski', 'Ojczysty', 30),
(6, 'Angielski', 'zaawansowany', 30),
(10, 'Niemiecki', 'komunikatywny', 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `links`
--

CREATE TABLE `links` (
  `link_id` int(11) NOT NULL,
  `link` varchar(30) NOT NULL,
  `link_url` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`link_id`, `link`, `link_url`, `user_id`) VALUES
(1, 'Github', 'https://github.com/Uzyxen/', 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `notification_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `title`, `description`, `notification_date`, `user_id`, `company_id`) VALUES
(7, 'Gratulację!', 'Firma zaakceptowała twoją aplikację i wkrótce się z Tobą skontaktuje!', '2024-06-03 20:24:40', 30, NULL),
(8, 'Ogłoszenie, na które aplikujesz niedługo wygasa!', 'Informujemy, że ogłoszenie, na które aplikujesz wkrótce wygaśnie ', '2024-06-03 20:53:53', 30, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `offers`
--

CREATE TABLE `offers` (
  `ogloszenie_id` int(11) NOT NULL,
  `zdjecie_url` varchar(255) NOT NULL,
  `tytul` varchar(100) NOT NULL,
  `opis` varchar(1000) NOT NULL,
  `umowa` varchar(50) NOT NULL,
  `job_level` varchar(30) NOT NULL,
  `employment_type` varchar(20) NOT NULL,
  `job_mode` varchar(20) NOT NULL,
  `lokalizacja` varchar(50) NOT NULL,
  `wynagrodzenie_min` int(11) NOT NULL,
  `wynagrodzenie_max` int(11) NOT NULL,
  `czestotliwosc_wynagrodzenia` varchar(20) NOT NULL,
  `data_dodania` date NOT NULL,
  `kategoria_id` int(11) NOT NULL,
  `firma_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`ogloszenie_id`, `zdjecie_url`, `tytul`, `opis`, `umowa`, `job_level`, `employment_type`, `job_mode`, `lokalizacja`, `wynagrodzenie_min`, `wynagrodzenie_max`, `czestotliwosc_wynagrodzenia`, `data_dodania`, `kategoria_id`, `firma_id`) VALUES
(158, 'obraz_2024-06-02_203348043.png', 'vuejs developer', 'qwrqweqweqweqweqw', 'umowa o pracę', 'starszy specjalista', '', '', 'Kraków', 12000, 16000, 'miesiąc', '2024-06-02', 1, 6),
(159, 'obraz_2024-06-02_203348043.png', 'qew', 'eqweqweqw', 'umowa o pracę', 'starszy specjalista', '', '', 'eqweqweqweqw', 123, 123312, 'miesiąc', '2024-06-02', 1, 6),
(162, 'gizlomar.png', 'Vuejs developer', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letr', 'umowa o pracę', 'starszy specjalista', 'pełny etat', 'Praca zdalna', 'Warszawa', 25000, 35000, 'miesiąc', '2024-06-06', 1, 5),
(163, 'gizlomar.png', 'junior vuejs developer', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', 'kontrakt B2B', 'asystent', 'pełny etat', 'praca stacjonarna', 'Kraków', 7000, 8000, 'miesiąc', '2024-06-06', 1, 5);

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
-- Struktura tabeli dla tabeli `requirements`
--

CREATE TABLE `requirements` (
  `requirement_id` int(11) NOT NULL,
  `requirement` varchar(255) NOT NULL,
  `offer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requirements`
--

INSERT INTO `requirements` (`requirement_id`, `requirement`, `offer_id`) VALUES
(5, 'wymóg 1', 158),
(6, 'wymóg', 158),
(7, 'wymóg', 158),
(8, 'wymóg', 158),
(9, 'ewqeqweqw', 159),
(10, 'eqweqweqw', 159),
(17, ' qweqweqweqweqwe aqwe qawd qweqweqweqweqwe aqwe qawd', 162),
(18, ' qweqweqweqweqwe aqwe qawd qweqweqweqweqwe aqwe qawd', 162),
(19, ' qweqweqweqweqwe aqwe qawd', 162),
(20, ' qweqweqweqweqwe aqwe qawd qweqweqweqweqwe aqwe qawd qweqweqweqweqwe aqwe qawd', 162),
(21, ' qweqweqweqweqwe aqwe qawd', 162),
(22, 'qweqweqweqweqw qwe qwe qwe qw', 163),
(23, 'qweqw eqw eqw qwe qwe qw', 163),
(24, 'eqweqw eqwe qwe qw', 163);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sessions`
--

CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL,
  `access` int(10) UNSIGNED DEFAULT NULL,
  `data` text NOT NULL,
  `id` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(11) NOT NULL,
  `skill` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `skill`, `user_id`) VALUES
(35, 'Vue.js', 30),
(36, 'Javascript', 30),
(37, 'Typescript', 30),
(38, 'PHP', 30),
(39, 'HTML', 30),
(40, 'CSS', 30),
(105, 'Vue', 31),
(106, 'Javascript', 31),
(107, 'PHP', 31),
(108, 'Typescript', 31),
(109, 'HTML', 31),
(110, 'CSS', 31),
(111, 'Nuxt', 31),
(112, 'Nuxt.js', 30),
(113, 'Nitro.js', 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `technologies`
--

CREATE TABLE `technologies` (
  `technology_id` int(11) NOT NULL,
  `technology` varchar(30) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technologies`
--

INSERT INTO `technologies` (`technology_id`, `technology`, `company_id`) VALUES
(1, 'PHP', 5),
(3, 'Vue', 5),
(4, 'Nuxt.js', 5),
(5, 'Javascript', 5),
(6, 'PHP', 6),
(7, 'Vue', 6),
(8, 'Javascript', 6),
(9, '.NET', 6);

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
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `uzytkownik_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `login` varchar(40) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `opis` varchar(1500) NOT NULL,
  `numer_telefonu` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `stanowisko` varchar(40) NOT NULL,
  `status` varchar(20) NOT NULL,
  `wiek` tinyint(3) UNSIGNED NOT NULL,
  `kraj` varchar(58) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_private` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uzytkownik_id`, `image_url`, `login`, `imie`, `nazwisko`, `opis`, `numer_telefonu`, `email`, `stanowisko`, `status`, `wiek`, `kraj`, `password`, `is_private`) VALUES
(30, 'gizlomar.png', '', 'Bonifacy', 'Borucki', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n', '123-456-789', 'bonifacyborucki123@gmail.com', 'Mid vuejs developer', 'bezrobotny', 24, 'Polska', '$2y$10$Qw4/SAmZdINGryn.qFGfzunx.xjLQKaMZl.g3CAwTNz0znNp0aRDm', 0),
(31, '', '', 'Michał', 'Giromański', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', '123-456-789', 'michal912456@gmail.com', 'Vuejs developer', '', 18, 'Polska', '$2y$10$Mfd4wSbkq3PQdyvX70/fleMWRvy/Zy91OBSjyFhNt3KOOlH06Fm86', 1);

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
-- Indeksy dla tabeli `duties`
--
ALTER TABLE `duties`
  ADD PRIMARY KEY (`duty_id`),
  ADD KEY `offer_id` (`offer_id`);

--
-- Indeksy dla tabeli `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`education_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `employment_types`
--
ALTER TABLE `employment_types`
  ADD PRIMARY KEY (`employment_type_id`);

--
-- Indeksy dla tabeli `job_levels`
--
ALTER TABLE `job_levels`
  ADD PRIMARY KEY (`job_level_id`);

--
-- Indeksy dla tabeli `job_modes`
--
ALTER TABLE `job_modes`
  ADD PRIMARY KEY (`job_mode_id`);

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
-- Indeksy dla tabeli `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `uzytkownik_id` (`user_id`),
  ADD KEY `firma_id` (`company_id`);

--
-- Indeksy dla tabeli `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`ogloszenie_id`),
  ADD KEY `firma_id` (`firma_id`),
  ADD KEY `kategoria_id` (`kategoria_id`),
  ADD KEY `job_level_id` (`job_level`);

--
-- Indeksy dla tabeli `ogloszenia_uzytkownikow`
--
ALTER TABLE `ogloszenia_uzytkownikow`
  ADD PRIMARY KEY (`ogloszenie_uzytkownika_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`requirement_id`),
  ADD KEY `offer_id` (`offer_id`);

--
-- Indeksy dla tabeli `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indeksy dla tabeli `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`),
  ADD KEY `uzytkownik_id` (`user_id`);

--
-- Indeksy dla tabeli `technologies`
--
ALTER TABLE `technologies`
  ADD PRIMARY KEY (`technology_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indeksy dla tabeli `types_of_contract`
--
ALTER TABLE `types_of_contract`
  ADD PRIMARY KEY (`type_of_contract_id`);

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
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doswiadczenie`
--
ALTER TABLE `doswiadczenie`
  MODIFY `doswiadczenie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `duties`
--
ALTER TABLE `duties`
  MODIFY `duty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `education_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employment_types`
--
ALTER TABLE `employment_types`
  MODIFY `employment_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_levels`
--
ALTER TABLE `job_levels`
  MODIFY `job_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `job_modes`
--
ALTER TABLE `job_modes`
  MODIFY `job_mode_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `ogloszenie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `ogloszenia_uzytkownikow`
--
ALTER TABLE `ogloszenia_uzytkownikow`
  MODIFY `ogloszenie_uzytkownika_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `requirements`
--
ALTER TABLE `requirements`
  MODIFY `requirement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `technologies`
--
ALTER TABLE `technologies`
  MODIFY `technology_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `types_of_contract`
--
ALTER TABLE `types_of_contract`
  MODIFY `type_of_contract_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uzytkownik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
-- Constraints for table `duties`
--
ALTER TABLE `duties`
  ADD CONSTRAINT `duties_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`ogloszenie_id`) ON DELETE CASCADE;

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uzytkownik_id`);

--
-- Constraints for table `konwersacje`
--
ALTER TABLE `konwersacje`
  ADD CONSTRAINT `konwersacje_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `users` (`uzytkownik_id`),
  ADD CONSTRAINT `konwersacje_ibfk_2` FOREIGN KEY (`firma_id`) REFERENCES `companies` (`company_id`);

--
-- Constraints for table `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uzytkownik_id`);

--
-- Constraints for table `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uzytkownik_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uzytkownik_id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`);

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`firma_id`) REFERENCES `companies` (`company_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `offers_ibfk_2` FOREIGN KEY (`kategoria_id`) REFERENCES `kategorie` (`kategoria_id`);

--
-- Constraints for table `ogloszenia_uzytkownikow`
--
ALTER TABLE `ogloszenia_uzytkownikow`
  ADD CONSTRAINT `ogloszenia_uzytkownikow_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `users` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `requirements`
--
ALTER TABLE `requirements`
  ADD CONSTRAINT `requirements_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`ogloszenie_id`) ON DELETE CASCADE;

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uzytkownik_id`);

--
-- Constraints for table `technologies`
--
ALTER TABLE `technologies`
  ADD CONSTRAINT `technologies_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wiadomosci`
--
ALTER TABLE `wiadomosci`
  ADD CONSTRAINT `wiadomosci_ibfk_1` FOREIGN KEY (`konwersacja_id`) REFERENCES `konwersacje` (`konwersacja_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
