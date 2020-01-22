-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mar. 21 jan. 2020 à 11:57
-- Version du serveur :  8.0.19
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sncf_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `gare`
--

CREATE TABLE `gare` (
  `id_gare` int NOT NULL,
  `nom_gare` varchar(100) DEFAULT NULL,
  `id_cp` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `gare`
--

INSERT INTO `gare` (`id_gare`, `nom_gare`, `id_cp`) VALUES
(123, 'gare perrache', 69),
(456, 'gare montparnasse', 75),
(789, 'niceville', 6),
(101112, 'valencegare', 26);

-- --------------------------------------------------------

--
-- Structure de la table `train`
--

CREATE TABLE `train` (
  `id_train` int NOT NULL,
  `id_gare_depart` int DEFAULT NULL,
  `id_gare_arrivee` int DEFAULT NULL,
  `heure_depart` datetime DEFAULT NULL,
  `heure_arrivee` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `train`
--

INSERT INTO `train` (`id_train`, `id_gare_depart`, `id_gare_arrivee`, `heure_depart`, `heure_arrivee`) VALUES
(1, 123, 456, '2020-01-21 11:42:18', '2020-01-23 11:42:18'),
(2, 456, 123, '2020-01-27 11:42:18', '2020-01-31 11:42:18'),
(3, 789, 101112, '2020-01-23 12:45:24', '2020-01-30 17:45:24'),
(4, 101112, 123, '2020-01-30 12:45:24', '2020-01-31 15:45:24');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `id_cp` int NOT NULL,
  `nom_ville` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id_cp`, `nom_ville`) VALUES
(6, 'nice'),
(26, 'valence'),
(69, 'lyon'),
(75, 'paris');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `gare`
--
ALTER TABLE `gare`
  ADD PRIMARY KEY (`id_gare`),
  ADD KEY `id_cp` (`id_cp`);

--
-- Index pour la table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`id_train`),
  ADD KEY `id_gare_depart` (`id_gare_depart`),
  ADD KEY `id_gare_arrivee` (`id_gare_arrivee`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id_cp`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gare`
--
ALTER TABLE `gare`
  ADD CONSTRAINT `gare_ibfk_1` FOREIGN KEY (`id_cp`) REFERENCES `ville` (`id_cp`);

--
-- Contraintes pour la table `train`
--
ALTER TABLE `train`
  ADD CONSTRAINT `train_ibfk_1` FOREIGN KEY (`id_gare_depart`) REFERENCES `gare` (`id_gare`),
  ADD CONSTRAINT `train_ibfk_2` FOREIGN KEY (`id_gare_arrivee`) REFERENCES `gare` (`id_gare`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
