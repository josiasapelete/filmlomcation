-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 30 mai 2022 à 14:43
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `cathegorie`
--

CREATE TABLE `cathegorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cathegorie`
--

INSERT INTO `cathegorie` (`id`, `nom`) VALUES
(1, 'action'),
(2, 'comedi'),
(3, 'aventure'),
(4, 'drame'),
(5, 'horreur');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idclient` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `email` varchar(70) NOT NULL,
  `date_inscrit` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idclient`, `nom`, `prenom`, `email`, `date_inscrit`) VALUES
(1, 'ABALO', 'Igor', 'igor@gmail.com', '2020-03-04 00:11:29'),
(2, 'ABALO', 'afi', 'afi@gmail.com', '2019-01-10 00:17:48'),
(3, 'AKAKPO', 'abla', 'abla@gmail.com', '2019-10-03 00:16:39'),
(4, 'EZOUN', 'victor', 'ezok@gmail.com', '2020-03-04 00:15:33'),
(5, 'KOFFI', 'kokou', 'kokou@gmail.com', '2020-02-03 00:13:13');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `idfilm` int(11) NOT NULL,
  `titreFilm` varchar(45) NOT NULL,
  `dateDeSortie` date NOT NULL,
  `duree` time DEFAULT NULL,
  `realisateur` varchar(45) NOT NULL,
  `id_cathegorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`idfilm`, `titreFilm`, `dateDeSortie`, `duree`, `realisateur`, `id_cathegorie`) VALUES
(1, 'Fast and furious', '2019-08-24', '01:48:34', 'Toren', 1),
(2, 'Maman j\'ai raté l\'avion ', '2015-06-21', '01:28:34', 'inconue', 2),
(3, 'jumandji', '2012-02-28', '01:58:34', 'thor', 3),
(4, 'hell', '2015-06-21', '01:28:34', 'inconue', 4),
(5, 'Resident Evil', '2015-08-21', '01:56:34', 'arthur', 5);

-- --------------------------------------------------------

--
-- Structure de la table `film_client`
--

CREATE TABLE `film_client` (
  `idclient` int(11) DEFAULT NULL,
  `date_location` date DEFAULT NULL,
  `date_retour` date DEFAULT NULL,
  `id_film` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film_client`
--

INSERT INTO `film_client` (`idclient`, `date_location`, `date_retour`, `id_film`) VALUES
(1, '2020-05-13', '2020-05-30', 2),
(3, '2021-05-13', '2021-05-28', 1),
(3, '2021-05-13', '2021-05-28', 1),
(5, '2022-05-13', '2022-05-28', 5);

-- --------------------------------------------------------

--
-- Structure de la table `payement`
--

CREATE TABLE `payement` (
  `id` int(11) NOT NULL,
  `date_payement` date DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `payement`
--

INSERT INTO `payement` (`id`, `date_payement`, `description`, `montant`, `id_client`) VALUES
(1, '2020-05-13', 'RAS', 1200, 1),
(3, '2021-05-28', 'RAS', 1000, 3),
(4, '2022-05-13', 'RAS', 1250, 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cathegorie`
--
ALTER TABLE `cathegorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idclient`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`idfilm`),
  ADD KEY `id_cathegorie` (`id_cathegorie`);

--
-- Index pour la table `film_client`
--
ALTER TABLE `film_client`
  ADD KEY `idclient` (`idclient`),
  ADD KEY `id_film` (`id_film`);

--
-- Index pour la table `payement`
--
ALTER TABLE `payement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cathegorie`
--
ALTER TABLE `cathegorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idclient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `idfilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `payement`
--
ALTER TABLE `payement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_cathegorie`) REFERENCES `cathegorie` (`id`);

--
-- Contraintes pour la table `film_client`
--
ALTER TABLE `film_client`
  ADD CONSTRAINT `film_client_ibfk_2` FOREIGN KEY (`idclient`) REFERENCES `client` (`idclient`),
  ADD CONSTRAINT `film_client_ibfk_3` FOREIGN KEY (`id_film`) REFERENCES `film` (`idfilm`);

--
-- Contraintes pour la table `payement`
--
ALTER TABLE `payement`
  ADD CONSTRAINT `payement_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`idclient`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
