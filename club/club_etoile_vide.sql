-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 25 Septembre 2016 à 09:50
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `club_etoile`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `ID_CLIENT` int(11) NOT NULL,
  `NOM` varchar(64) DEFAULT NULL,
  `PRENOM` varchar(64) DEFAULT NULL,
  `AGE` double DEFAULT NULL,
  `TELEPHONE` varchar(64) DEFAULT NULL,
  `ADRESSE` varchar(64) DEFAULT NULL,
  `LIBELLE_VILLE` varchar(64) DEFAULT NULL,
  `LIBELLE_REGION` varchar(64) DEFAULT NULL,
  `LIBELLE_PAYS_CLIENT` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commercial`
--

CREATE TABLE IF NOT EXISTS `commercial` (
  `ID_COMMERCIAL` int(11) NOT NULL,
  `NOM_COMMERCIAL` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID_COMMERCIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `faits`
--

CREATE TABLE IF NOT EXISTS `faits` (
  `ID_INC` int(11) NOT NULL AUTO_INCREMENT,
  `ID_LOCALISATION` int(11) NOT NULL,
  `ID_JOUR` datetime NOT NULL,
  `ID_CLIENT` int(11) NOT NULL,
  `ID_COMMERCIAL` int(11) NOT NULL,
  `TYPE` tinyint(1) NOT NULL,
  `ID_TRANCHE` int(11) NOT NULL,
  `DATE_MVT` datetime NOT NULL,
  `NB_JOURS` double DEFAULT NULL,
  `NB_INVITES` double DEFAULT NULL,
  `PRIX` double DEFAULT NULL,
  PRIMARY KEY (`ID_INC`),
  KEY `FK_FAITS_REFERENCE_CLIENT` (`ID_CLIENT`),
  KEY `FK_FAITS_REFERENCE_TRANCHE_` (`ID_TRANCHE`),
  KEY `FK_FAITS_REFERENCE_COMMERCI` (`ID_COMMERCIAL`),
  KEY `FK_FAITS_REFERENCE_TEMPS` (`ID_JOUR`),
  KEY `FK_FAITS_REFERENCE_LOCALISA` (`ID_LOCALISATION`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=717 ;

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

CREATE TABLE IF NOT EXISTS `localisation` (
  `ID_LOCALISATION` int(11) NOT NULL,
  `LIBELLE_SERVICE` varchar(64) DEFAULT NULL,
  `LIBELLE_TYPE_SERVICE` varchar(64) DEFAULT NULL,
  `LIBELLE_LIEU_SEJOUR` varchar(64) DEFAULT NULL,
  `LIBELLE_PAYS_LIEU` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID_LOCALISATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `temps`
--

CREATE TABLE IF NOT EXISTS `temps` (
  `ID_JOUR` datetime NOT NULL,
  `LIBELLE_JOUR` varchar(64) DEFAULT NULL,
  `NUMERO_JOUR` int(11) DEFAULT NULL,
  `MOIS` varchar(64) DEFAULT NULL,
  `NUMERO_MOIS` int(11) NOT NULL,
  `SEMESTRE` varchar(64) DEFAULT NULL,
  `ANNEE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_JOUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tranche_age`
--

CREATE TABLE IF NOT EXISTS `tranche_age` (
  `ID_TRANCHE` int(11) NOT NULL,
  `AGE_MINI` double DEFAULT NULL,
  `AGE_MAXI` double DEFAULT NULL,
  `LIB_TRANCHE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANCHE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `faits`
--
ALTER TABLE `faits`
  ADD CONSTRAINT `FK_FAITS_REFERENCE_CLIENT` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`),
  ADD CONSTRAINT `FK_FAITS_REFERENCE_COMMERCI` FOREIGN KEY (`ID_COMMERCIAL`) REFERENCES `commercial` (`ID_COMMERCIAL`),
  ADD CONSTRAINT `FK_FAITS_REFERENCE_LOCALISA` FOREIGN KEY (`ID_LOCALISATION`) REFERENCES `localisation` (`ID_LOCALISATION`),
  ADD CONSTRAINT `FK_FAITS_REFERENCE_TEMPS` FOREIGN KEY (`ID_JOUR`) REFERENCES `temps` (`ID_JOUR`),
  ADD CONSTRAINT `FK_FAITS_REFERENCE_TRANCHE_` FOREIGN KEY (`ID_TRANCHE`) REFERENCES `tranche_age` (`ID_TRANCHE`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
