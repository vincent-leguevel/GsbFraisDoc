-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gsb_frais
-- ------------------------------------------------------
-- Server version	5.5.47-0+deb8u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Etat`
--

DROP TABLE IF EXISTS `Etat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Etat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Etat`
--

LOCK TABLES `Etat` WRITE;
/*!40000 ALTER TABLE `Etat` DISABLE KEYS */;
INSERT INTO `Etat` VALUES (1,'Remboursée'),(2,'Saisie clôturée'),(3,'Fiche créée, saisie en cours'),(4,'Validée'),(5,'Mise en paiement');
/*!40000 ALTER TABLE `Etat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FicheFrais`
--

DROP TABLE IF EXISTS `FicheFrais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FicheFrais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nbJustificatifs` int(11) NOT NULL,
  `montantValide` decimal(10,2) NOT NULL,
  `dateModif` date NOT NULL,
  `dateRedac` date NOT NULL,
  `etat_id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1C4987DCD5E86FF` (`etat_id`),
  KEY `IDX_1C4987DCFB88E14F` (`utilisateur_id`),
  CONSTRAINT `FK_1C4987DCD5E86FF` FOREIGN KEY (`etat_id`) REFERENCES `Etat` (`id`),
  CONSTRAINT `FK_1C4987DCFB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `Utilisateur` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FicheFrais`
--

LOCK TABLES `FicheFrais` WRITE;
/*!40000 ALTER TABLE `FicheFrais` DISABLE KEYS */;
INSERT INTO `FicheFrais` VALUES (2,4,0.00,'2016-04-11','2016-05-08',1,0),(13,6,0.00,'2016-04-19','2016-04-19',3,1),(14,5,152.03,'2016-05-02','2016-04-20',2,2),(15,2,0.00,'2016-05-02','2016-05-01',3,2),(16,5,3400.00,'2016-05-02','2016-03-22',2,2);
/*!40000 ALTER TABLE `FicheFrais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FraisForfait`
--

DROP TABLE IF EXISTS `FraisForfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FraisForfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FraisForfait`
--

LOCK TABLES `FraisForfait` WRITE;
/*!40000 ALTER TABLE `FraisForfait` DISABLE KEYS */;
INSERT INTO `FraisForfait` VALUES (1,'Forfait Etape',110.00),(2,'Frais Kilométrique',0.62),(3,'Nuitée Hôtel',80.00),(4,'Repas Restaurant',25.00);
/*!40000 ALTER TABLE `FraisForfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LigneFraisForfait`
--

DROP TABLE IF EXISTS `LigneFraisForfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LigneFraisForfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` decimal(10,2) NOT NULL,
  `ficheFrais_id` int(11) NOT NULL,
  `fraisForfait_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_146093DC2A6EB535` (`ficheFrais_id`),
  KEY `IDX_146093DC81F2B024` (`fraisForfait_id`),
  CONSTRAINT `FK_146093DC2A6EB535` FOREIGN KEY (`ficheFrais_id`) REFERENCES `FicheFrais` (`id`),
  CONSTRAINT `FK_146093DC81F2B024` FOREIGN KEY (`fraisForfait_id`) REFERENCES `FraisForfait` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LigneFraisForfait`
--

LOCK TABLES `LigneFraisForfait` WRITE;
/*!40000 ALTER TABLE `LigneFraisForfait` DISABLE KEYS */;
INSERT INTO `LigneFraisForfait` VALUES (33,5.00,13,1),(34,299.00,13,2),(35,9.00,13,3),(36,15.00,13,4),(37,9.00,14,1),(38,286.22,14,2),(39,6.00,14,3),(40,6.00,14,4),(41,7.00,16,1),(42,540.00,16,2),(43,4.00,16,3),(44,5.00,16,4),(45,5.00,15,1),(46,480.54,15,2),(47,5.00,15,3),(48,5.00,15,4);
/*!40000 ALTER TABLE `LigneFraisForfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LigneFraisHorsForfait`
--

DROP TABLE IF EXISTS `LigneFraisHorsForfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LigneFraisHorsForfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `dateFrais` date NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `ficheFrais_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4C9509AB2A6EB535` (`ficheFrais_id`),
  CONSTRAINT `FK_4C9509AB2A6EB535` FOREIGN KEY (`ficheFrais_id`) REFERENCES `FicheFrais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LigneFraisHorsForfait`
--

LOCK TABLES `LigneFraisHorsForfait` WRITE;
/*!40000 ALTER TABLE `LigneFraisHorsForfait` DISABLE KEYS */;
INSERT INTO `LigneFraisHorsForfait` VALUES (10,'REFUSE : REFUSE : REFUSE ','2016-04-01',54.00,14),(12,'Creuvéson','2016-05-01',61.32,15);
/*!40000 ALTER TABLE `LigneFraisHorsForfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utilisateur`
--

DROP TABLE IF EXISTS `Utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `fonction` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `codePostal` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `dateEmbauche` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utilisateur`
--

LOCK TABLES `Utilisateur` WRITE;
/*!40000 ALTER TABLE `Utilisateur` DISABLE KEYS */;
INSERT INTO `Utilisateur` VALUES (1,'lvillachane','jux7g','V','Louis','Villechalane','8 rue des Charmes','46000','Cahors','2005-12-21'),(2,'dandre','oppg5','V','David','Andre','1 rue Petit','46200','Lalbenque','1998-11-23'),(3,'cbedos','gmhxd','C','Christian','Bedos','1 rue Peranud','46250','Montcuq','1995-01-12'),(4,'ltusseau','ktp3s','V','Louis','Tusseau','22 rue des Ternes','46123','Gramat','2000-05-01'),(5,'pbentot','doyw1','V','Pascal','Bentot','11 allée des Cerises','46512','Bessines','1992-07-09'),(6,'lbioret','hrjfs','V','Luc','Bioret','1 Avenue gambetta','46000','Cahors','1998-05-11'),(7,'fbunisset','4vbnd','V','Francis','Bunisset','10 rue des Perles','93100','Montreuil','1987-10-21'),(8,'dbunisset','s1y1r','V','Denise','Bunisset','23 rue Manin','75019','paris','2010-12-05'),(9,'bcacheux','uf7r3','V','Bernard','Cacheux','114 rue Blanche','75017','Paris','2009-11-12'),(10,'ecadic','6u8dc','V','Eric','Cadic','123 avenue de la République','75011','Paris','2008-09-23'),(11,'ccharoze','u817o','V','Catherine','Charoze','100 rue Petit','75019','Paris','2005-11-12'),(12,'cclepkens','bw1us','V','Christophe','Clepkens','12 allée des Anges','93230','Romainville','2003-08-11'),(13,'vcottin','2hoh9','V','Vincenne','Cottin','36 rue Des Roches','93100','Monteuil','2001-11-18'),(14,'fdaburon','7oqpv','V','François','Daburon','13 rue de Chanzy','94000','Créteil','2002-02-11'),(15,'pde','gk9kx','V','Philippe','De','13 rue Barthes','94000','Créteil','2010-12-14'),(16,'mdebelle','od5rt','V','Michel','Debelle','181 avenue Barbusse','93210','Rosny','2006-11-23'),(17,'jdebelle','nvwqq','V','Jeanne','Debelle','134 allée des Joncs','44000','Nantes','2000-05-11'),(18,'mdebroise','sghkb','V','Michel','Debroise','2 Bld Jourdain','44000','Nantes','2001-04-17'),(19,'ndesmarquest','f1fob','V','Nathalie','Desmarquest','14 Place d Arc','45000','Orléans','2005-11-12'),(20,'pdesnost','4k2o5','V','Pierre','Desnost','16 avenue des Cèdres','23200','Guéret','2001-02-05'),(21,'fdudouit','44im8','V','Frédéric','Dudouit','18 rue de l église','23120','GrandBourg','2000-08-01'),(22,'cduncombe','qf77j','V','Claude','Duncombe','19 rue de la tour','23100','La souteraine','1987-10-10'),(23,'cenault','y2qdu','V','Céline','Enault-Pascreau','25 place de la gare','23200','Gueret','1995-09-01'),(24,'veynde','i7sn3','V','Valérie','Eynde','3 Grand Place','13015','Marseille','1999-11-01'),(25,'jfinck','mpb3t','V','Jacques','Finck','10 avenue du Prado','13002','Marseille','2001-11-10'),(26,'ffremont','xs5tq','V','Fernande','Frémont','4 route de la mer','13012','Allauh','1998-10-01');
/*!40000 ALTER TABLE `Utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-02 21:47:49
