-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 31 mars 2025 à 17:57
-- Version du serveur : 10.6.21-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mvkhjwdb_mediatekdocuments`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnement`
--

CREATE TABLE `abonnement` (
  `id` varchar(5) NOT NULL,
  `dateFinAbonnement` date DEFAULT NULL,
  `idRevue` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `abonnement`
--

INSERT INTO `abonnement` (`id`, `dateFinAbonnement`, `idRevue`) VALUES
('00050', '2025-08-31', '10002'),
('00056', '2025-04-16', '10008'),
('00057', '2025-04-18', '10009');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` varchar(5) NOT NULL,
  `dateCommande` date DEFAULT NULL,
  `montant` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `dateCommande`, `montant`) VALUES
('00001', '2025-03-29', 6),
('00002', '2025-03-29', 5),
('00010', '2025-03-29', 15),
('00011', '2025-03-29', 14),
('00012', '2025-03-29', 16),
('00014', '2025-03-29', 4),
('00050', '2025-03-21', 2),
('00056', '2025-03-29', 4),
('00057', '2025-03-29', 3),
('00120', '2025-03-29', 5),
('00121', '2025-03-29', 6),
('00125', '2025-03-31', 4);

-- --------------------------------------------------------

--
-- Structure de la table `commandedocument`
--

CREATE TABLE `commandedocument` (
  `id` varchar(5) NOT NULL,
  `nbExemplaire` int(11) DEFAULT NULL,
  `idLivreDvd` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commandedocument`
--

INSERT INTO `commandedocument` (`id`, `nbExemplaire`, `idLivreDvd`) VALUES
('00001', 2, '00017'),
('00002', 2, '00008'),
('00010', 3, '20003'),
('00011', 2, '20002'),
('00012', 3, '20004'),
('00014', 2, '20001'),
('00120', 2, '00018'),
('00121', 3, '00019'),
('00125', 2, '00020');

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `id` varchar(10) NOT NULL,
  `titre` varchar(60) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `idRayon` varchar(5) NOT NULL,
  `idPublic` varchar(5) NOT NULL,
  `idGenre` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`id`, `titre`, `image`, `idRayon`, `idPublic`, `idGenre`) VALUES
('00001', 'Quand sort la recluse', '', 'LV003', '00002', '10014'),
('00002', 'Un pays à l\'aube', '', 'LV001', '00002', '10004'),
('00003', 'Et je danse aussi', '', 'LV002', '00003', '10013'),
('00004', 'L\'armée furieuse', '', 'LV003', '00002', '10014'),
('00005', 'Les anonymes', '', 'LV001', '00002', '10014'),
('00006', 'La marque jaune', '', 'BD001', '00003', '10001'),
('00007', 'Dans les coulisses du musée', '', 'LV001', '00003', '10006'),
('00008', 'Histoire du juif errant', '', 'LV002', '00002', '10006'),
('00009', 'Pars vite et reviens tard', '', 'LV003', '00002', '10014'),
('00010', 'Le vestibule des causes perdues', '', 'LV001', '00002', '10006'),
('00011', 'L\'île des oubliés', '', 'LV002', '00003', '10006'),
('00012', 'La souris bleue', '', 'LV002', '00003', '10006'),
('00013', 'Sacré Pêre Noël', '', 'JN001', '00001', '10001'),
('00014', 'Mauvaise étoile', '', 'LV003', '00003', '10014'),
('00015', 'La confrérie des téméraires', '', 'JN002', '00004', '10014'),
('00016', 'Le butin du requin', '', 'JN002', '00004', '10014'),
('00017', 'Catastrophes au Brésil', 'C:\\Users\\Andréas\\Downloads\\91fQGSqEslL._AC_UF1000,1000_QL80_.jpg', 'JN002', '00004', '10014'),
('00018', 'Le Routard - Maroc', '', 'DV005', '00003', '10011'),
('00019', 'Guide Vert - Iles Canaries', '', 'DV005', '00003', '10011'),
('00020', 'Guide Vert - Irlande', '', 'DV005', '00003', '10011'),
('00021', 'Les déferlantes', '', 'LV002', '00002', '10006'),
('00023', 'Le secret du janissaire', '', 'BD001', '00002', '10001'),
('00024', 'Pavillon noir', '', 'BD001', '00002', '10001'),
('00025', 'L\'archipel du danger', '', 'BD001', '00002', '10001'),
('00026', 'La planète des singes', '', 'LV002', '00003', '10002'),
('10001', 'Arts Magazine', '', 'PR002', '00002', '10016'),
('10002', 'Alternatives Economiques', 'C:\\Users\\Andréas\\Downloads\\9c3335b4e78992525f4d5e145e4ad7f22341b53f.jpeg', 'PR002', '00002', '10015'),
('10003', 'Challenges', '', 'PR002', '00002', '10015'),
('10004', 'Rock and Folk', '', 'PR002', '00002', '10016'),
('10005', 'Les Echos', '', 'PR001', '00002', '10015'),
('10006', 'Le Monde', '', 'PR001', '00002', '10018'),
('10007', 'Telerama', '', 'PR002', '00002', '10016'),
('10008', 'L\'Obs', '', 'PR002', '00002', '10018'),
('10009', 'L\'Equipe', 'C:\\Users\\Andréas\\Downloads\\images (2).jpg', 'PR001', '00002', '10017'),
('10010', 'L\'Equipe Magazine', '', 'PR002', '00002', '10017'),
('10011', 'Geo', '', 'PR002', '00003', '10016'),
('11111', 'test', '', 'BL001', '00002', '10003'),
('11126', 'Mon Nouveau Document', 'https://exemple.com/image.jpg', 'LV002', '00003', '10002'),
('1522239', 'Mon Nouveau Document', 'https://exemple.com/image.jpg', 'LV002', '00003', '10002'),
('15229', 'Mon Nouveau Document', 'https://exemple.com/image.jpg', 'LV002', '00003', '10002'),
('15929', 'Mon Nouveau Document', 'https://exemple.com/image.jpg', 'LV002', '00003', '10002'),
('15999', 'Mon Nouveau Document', 'https://exemple.com/image.jpg', 'LV002', '00003', '10002'),
('20001', 'Star Wars 5 L\'empire contre attaque', '', 'DF001', '00003', '10002'),
('20002', 'Le seigneur des anneaux : la communauté de l\'anneau', '', 'DF001', '00003', '10019'),
('20003', 'Jurassic Park', 'C:\\Users\\Andréas\\Downloads\\jurassic-park-a13ff76368.jpg', 'JN002', '00004', '10014'),
('20004', 'Matrix', '', 'DF001', '00003', '10002'),
('2222222222', 'test', '', 'JN001', '00002', '10007'),
('222222444', 'testR', '', 'DF001', '00002', '10001'),
('22222434', 'testR', '', 'DF001', '00002', '10007'),
('23242', 'testR', '', 'JN001', '00002', '10001'),
('234423', 'Test', '', 'JN001', '00001', '10001'),
('30003', 'Germinal', '', 'DV004', '00002', '10003'),
('32424', 'test2', 'C:\\Users\\Andréas\\Desktop\\108623b0.png', 'DF001', '00003', '10009'),
('3333', 'test', '', 'BL001', '00004', '10007'),
('34442324', 'image', 'C:\\Users\\Andréas\\Desktop\\108623b0.png', 'BL001', '00003', '10003'),
('44444', 'test', '', 'BL001', '00003', '10003'),
('5555', 'test', '', 'BL001', '00001', '10001'),
('76765', 'test', '', 'DV003', '00002', '10002'),
('7777', 'Mon Nouveau Document', 'https://exemple.com/image.jpg', 'LV002', '00003', '10002'),
('777777', 'Test', '', 'DF001', '00001', '10001');

-- --------------------------------------------------------

--
-- Structure de la table `dvd`
--

CREATE TABLE `dvd` (
  `id` varchar(10) NOT NULL,
  `synopsis` text DEFAULT NULL,
  `realisateur` varchar(20) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dvd`
--

INSERT INTO `dvd` (`id`, `synopsis`, `realisateur`, `duree`) VALUES
('20001', 'Luc est entraîné par Yoda pendant que Han et Leia tentent de se cacher dans la cité des nuages.', 'George Lucas', 124),
('20002', 'L\'anneau unique, forgé par Sauron, est porté par Fraudon qui l\'amène à Foncombe. De là, des représentants de peuples différents vont s\'unir pour aider Fraudon à amener l\'anneau à la montagne du Destin.', 'Peter Jackson', 228),
('20003', 'Un milliardaire et des généticiens créent des dinosaures à partir de clonage.', 'Steven Spielberg', 128),
('20004', 'Un informaticien réalise que le monde dans lequel il vit est une simulation gérée par des machines.', 'Les Wachowski', 136);

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` char(5) NOT NULL,
  `libelle` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('00001', 'neuf'),
('00002', 'usagé'),
('00003', 'détérioré'),
('00004', 'inutilisable');

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

CREATE TABLE `exemplaire` (
  `id` varchar(10) NOT NULL,
  `numero` int(11) NOT NULL,
  `dateAchat` date DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `idEtat` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `exemplaire`
--

INSERT INTO `exemplaire` (`id`, `numero`, `dateAchat`, `photo`, `idEtat`) VALUES
('00008', 3253, '2025-03-29', '', '00001'),
('00008', 3254, '2025-03-29', '', '00001'),
('00017', 3244, '2025-03-29', '', '00003'),
('00018', 3262, '2025-03-29', '', '00001'),
('00018', 3263, '2025-03-29', '', '00004'),
('00019', 3264, '2025-03-29', '', '00001'),
('00019', 3265, '2025-03-29', '', '00001'),
('00019', 3266, '2025-03-29', '', '00001'),
('10002', 3241, '2025-03-12', NULL, '00001'),
('10004', 3269, '2025-03-29', '', '00001'),
('10008', 3258, '2025-03-29', '', '00001'),
('10008', 3259, '2025-03-29', '', '00001'),
('10009', 3242, '2025-03-04', NULL, '00004'),
('10009', 3243, '2025-03-30', '', '00001'),
('10009', 3260, '2025-03-29', '', '00001'),
('10009', 3261, '2025-03-29', '', '00001'),
('20001', 3267, '2025-03-29', '', '00003'),
('20002', 3250, '2025-03-29', '', '00001'),
('20002', 3251, '2025-03-29', '', '00001'),
('20003', 3247, '2025-03-29', '', '00001'),
('20003', 3248, '2025-03-29', '', '00001'),
('20004', 3255, '2025-03-29', '', '00001'),
('20004', 3256, '2025-03-29', '', '00001'),
('20004', 3257, '2025-03-29', '', '00001');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id` varchar(5) NOT NULL,
  `libelle` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `libelle`) VALUES
('10000', 'Humour'),
('10001', 'Bande dessinée'),
('10002', 'Science Fiction'),
('10003', 'Biographie'),
('10004', 'Historique'),
('10006', 'Roman'),
('10007', 'Aventures'),
('10008', 'Essai'),
('10009', 'Documentaire'),
('10010', 'Technique'),
('10011', 'Voyages'),
('10012', 'Drame'),
('10013', 'Comédie'),
('10014', 'Policier'),
('10015', 'Presse Economique'),
('10016', 'Presse Culturelle'),
('10017', 'Presse sportive'),
('10018', 'Actualités'),
('10019', 'Fantazy');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id` varchar(10) NOT NULL,
  `ISBN` varchar(13) DEFAULT NULL,
  `auteur` varchar(20) DEFAULT NULL,
  `collection` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id`, `ISBN`, `auteur`, `collection`) VALUES
('00001', '1234569877896', 'Fred Vargas', 'Commissaire Adamsberg'),
('00002', '1236547896541', 'Dennis Lehanne', ''),
('00003', '6541236987410', 'Anne-Laure Bondoux', ''),
('00004', '3214569874123', 'Fred Vargas', 'Commissaire Adamsberg'),
('00005', '3214563214563', 'RJ Ellory', ''),
('00006', '3213213211232', 'Edgar P. Jacobs', 'Blake et Mortimer'),
('00007', '6541236987541', 'Kate Atkinson', ''),
('00008', '1236987456321', 'Jean d\'Ormesson', ''),
('00009', '', 'Fred Vargas', 'Commissaire Adamsberg'),
('00010', '', 'Manon Moreau', ''),
('00011', '', 'Victoria Hislop', ''),
('00012', '', 'Kate Atkinson', ''),
('00013', '', 'Raymond Briggs', ''),
('00014', '', 'RJ Ellory', ''),
('00015', '', 'Floriane Turmeau', ''),
('00016', '', 'Julian Press', ''),
('00017', '', 'Philippe Masson', ''),
('00018', '', '', 'Guide du Routard'),
('00019', '', '', 'Guide Vert'),
('00020', '', '', 'Guide Vert'),
('00021', '', 'Claudie Gallay', ''),
('00023', '', 'Ayrolles - Masbou', 'De cape et de crocs'),
('00024', '', 'Ayrolles - Masbou', 'De cape et de crocs'),
('00025', '', 'Ayrolles - Masbou', 'De cape et de crocs'),
('00026', '', 'Pierre Boulle', 'Julliard');

-- --------------------------------------------------------

--
-- Structure de la table `livres_dvd`
--

CREATE TABLE `livres_dvd` (
  `id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livres_dvd`
--

INSERT INTO `livres_dvd` (`id`) VALUES
('00001'),
('00002'),
('00003'),
('00004'),
('00005'),
('00006'),
('00007'),
('00008'),
('00009'),
('00010'),
('00011'),
('00012'),
('00013'),
('00014'),
('00015'),
('00016'),
('00017'),
('00018'),
('00019'),
('00020'),
('00021'),
('00023'),
('00024'),
('00025'),
('00026'),
('11111'),
('15999'),
('20001'),
('20002'),
('20003'),
('20004'),
('2222222222'),
('234423'),
('30003'),
('32424');

-- --------------------------------------------------------

--
-- Structure de la table `public`
--

CREATE TABLE `public` (
  `id` varchar(5) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `public`
--

INSERT INTO `public` (`id`, `libelle`) VALUES
('00001', 'Jeunesse'),
('00002', 'Adultes'),
('00003', 'Tous publics'),
('00004', 'Ados');

-- --------------------------------------------------------

--
-- Structure de la table `rayon`
--

CREATE TABLE `rayon` (
  `id` char(5) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rayon`
--

INSERT INTO `rayon` (`id`, `libelle`) VALUES
('BD001', 'BD Adultes'),
('BL001', 'Beaux Livres'),
('DF001', 'DVD films'),
('DV001', 'Sciences'),
('DV002', 'Maison'),
('DV003', 'Santé'),
('DV004', 'Littérature classique'),
('DV005', 'Voyages'),
('JN001', 'Jeunesse BD'),
('JN002', 'Jeunesse romans'),
('LV001', 'Littérature étrangère'),
('LV002', 'Littérature française'),
('LV003', 'Policiers français étrangers'),
('PR001', 'Presse quotidienne'),
('PR002', 'Magazines');

-- --------------------------------------------------------

--
-- Structure de la table `revue`
--

CREATE TABLE `revue` (
  `id` varchar(10) NOT NULL,
  `periodicite` varchar(2) DEFAULT NULL,
  `delaiMiseADispo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `revue`
--

INSERT INTO `revue` (`id`, `periodicite`, `delaiMiseADispo`) VALUES
('10001', 'MS', 52),
('10002', 'MS', 52),
('10003', 'HB', 15),
('10004', 'HB', 15),
('10005', 'QT', 5),
('10006', 'QT', 5),
('10007', 'HB', 27),
('10008', 'HB', 26),
('10009', 'QT', 5),
('10010', 'HB', 12),
('10011', 'MS', 52);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` varchar(5) NOT NULL,
  `libelle` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `libelle`) VALUES
('00001', 'Administratif'),
('00002', 'Prêts'),
('00003', 'Culture');

-- --------------------------------------------------------

--
-- Structure de la table `suivi`
--

CREATE TABLE `suivi` (
  `id` varchar(5) NOT NULL,
  `stade` varchar(20) NOT NULL,
  `idLivreDvd` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `suivi`
--

INSERT INTO `suivi` (`id`, `stade`, `idLivreDvd`) VALUES
('00001', 'réglée', '00017'),
('00002', 'livrée', '00008'),
('00010', 'livrée', '20003'),
('00011', 'réglée', '20002'),
('00012', 'livrée', '20004'),
('00014', 'réglée', '20001'),
('00120', 'réglée', '00018'),
('00121', 'livrée', '00019'),
('00125', 'en cours', '00020');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(400) NOT NULL,
  `idService` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `firstname`, `name`, `login`, `password`, `idService`) VALUES
(4, 'Marie', 'Curie', 'mariecurie', '2cb4b1431b84ec15d35ed83bb927e27e8967d75f4bcd9cc4b25c8d879ae23e18', '00001'),
(5, 'Lucie', 'robert', 'lucierobert', '2cb4b1431b84ec15d35ed83bb927e27e8967d75f4bcd9cc4b25c8d879ae23e18', '00003'),
(3, 'Louis', 'Dupont', 'louisdupont', '2cb4b1431b84ec15d35ed83bb927e27e8967d75f4bcd9cc4b25c8d879ae23e18', '00002');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRevue` (`idRevue`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandedocument`
--
ALTER TABLE `commandedocument`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idLivreDvd` (`idLivreDvd`);

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRayon` (`idRayon`),
  ADD KEY `idPublic` (`idPublic`),
  ADD KEY `idGenre` (`idGenre`);

--
-- Index pour la table `dvd`
--
ALTER TABLE `dvd`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD PRIMARY KEY (`id`,`numero`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD KEY `idEtat` (`idEtat`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `livres_dvd`
--
ALTER TABLE `livres_dvd`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `public`
--
ALTER TABLE `public`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rayon`
--
ALTER TABLE `rayon`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `revue`
--
ALTER TABLE `revue`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `suivi`
--
ALTER TABLE `suivi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idLivreDvd` (`idLivreDvd`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idService` (`idService`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3270;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD CONSTRAINT `abonnement_ibfk_1` FOREIGN KEY (`id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `abonnement_ibfk_2` FOREIGN KEY (`idRevue`) REFERENCES `revue` (`id`);

--
-- Contraintes pour la table `commandedocument`
--
ALTER TABLE `commandedocument`
  ADD CONSTRAINT `commandedocument_ibfk_1` FOREIGN KEY (`id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `commandedocument_ibfk_2` FOREIGN KEY (`idLivreDvd`) REFERENCES `livres_dvd` (`id`);

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`idRayon`) REFERENCES `rayon` (`id`),
  ADD CONSTRAINT `document_ibfk_2` FOREIGN KEY (`idPublic`) REFERENCES `public` (`id`),
  ADD CONSTRAINT `document_ibfk_3` FOREIGN KEY (`idGenre`) REFERENCES `genre` (`id`);

--
-- Contraintes pour la table `dvd`
--
ALTER TABLE `dvd`
  ADD CONSTRAINT `dvd_ibfk_1` FOREIGN KEY (`id`) REFERENCES `livres_dvd` (`id`);

--
-- Contraintes pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `exemplaire_ibfk_1` FOREIGN KEY (`id`) REFERENCES `document` (`id`),
  ADD CONSTRAINT `exemplaire_ibfk_2` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`id`) REFERENCES `livres_dvd` (`id`);

--
-- Contraintes pour la table `livres_dvd`
--
ALTER TABLE `livres_dvd`
  ADD CONSTRAINT `livres_dvd_ibfk_1` FOREIGN KEY (`id`) REFERENCES `document` (`id`);

--
-- Contraintes pour la table `revue`
--
ALTER TABLE `revue`
  ADD CONSTRAINT `revue_ibfk_1` FOREIGN KEY (`id`) REFERENCES `document` (`id`);

--
-- Contraintes pour la table `suivi`
--
ALTER TABLE `suivi`
  ADD CONSTRAINT `suivi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `suivi_ibfk_2` FOREIGN KEY (`idLivreDvd`) REFERENCES `livres_dvd` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
