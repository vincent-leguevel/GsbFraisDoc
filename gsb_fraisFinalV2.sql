-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (i686)
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
-- Table structure for table `etat`
--

DROP TABLE IF EXISTS `etat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etat`
--

LOCK TABLES `etat` WRITE;
/*!40000 ALTER TABLE `etat` DISABLE KEYS */;
INSERT INTO `etat` VALUES (1,'Remboursée'),(2,'Saisie clôturée'),(3,'Fiche créée, saisie en cours'),(4,'Validée'),(5,'Mise en paiement');
/*!40000 ALTER TABLE `etat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiche_frais`
--

DROP TABLE IF EXISTS `fiche_frais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fiche_frais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etat_id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `dateRedac` date NOT NULL,
  `nbJustificatifs` int(11) NOT NULL,
  `montantValide` decimal(10,2) NOT NULL,
  `dateModif` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5FC0A6A7D5E86FF` (`etat_id`),
  KEY `IDX_5FC0A6A7FB88E14F` (`utilisateur_id`),
  CONSTRAINT `FK_5FC0A6A7FB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `FK_5FC0A6A7D5E86FF` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiche_frais`
--

LOCK TABLES `fiche_frais` WRITE;
/*!40000 ALTER TABLE `fiche_frais` DISABLE KEYS */;
INSERT INTO `fiche_frais` VALUES (1,3,1,'2016-05-07',1,645.23,'2016-05-07'),(4,3,1,'2016-06-07',0,0.00,'2016-06-07');
/*!40000 ALTER TABLE `fiche_frais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frais_forfait`
--

DROP TABLE IF EXISTS `frais_forfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frais_forfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frais_forfait`
--

LOCK TABLES `frais_forfait` WRITE;
/*!40000 ALTER TABLE `frais_forfait` DISABLE KEYS */;
INSERT INTO `frais_forfait` VALUES (1,'Forfait Etape',110.00),(2,'Frais Kilométrique',0.62),(3,'Nuitée Hôtel',80.00),(4,'Repas Restaurant',25.00);
/*!40000 ALTER TABLE `frais_forfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligne_frais_forfait`
--

DROP TABLE IF EXISTS `ligne_frais_forfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ligne_frais_forfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fiche_frais_id` int(11) NOT NULL,
  `frais_forfait_id` int(11) NOT NULL,
  `quantite` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BD293ECFD94F5755` (`fiche_frais_id`),
  KEY `IDX_BD293ECF7B70375E` (`frais_forfait_id`),
  CONSTRAINT `FK_BD293ECF7B70375E` FOREIGN KEY (`frais_forfait_id`) REFERENCES `frais_forfait` (`id`),
  CONSTRAINT `FK_BD293ECFD94F5755` FOREIGN KEY (`fiche_frais_id`) REFERENCES `fiche_frais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_frais_forfait`
--

LOCK TABLES `ligne_frais_forfait` WRITE;
/*!40000 ALTER TABLE `ligne_frais_forfait` DISABLE KEYS */;
INSERT INTO `ligne_frais_forfait` VALUES (1,1,1,3.00),(2,1,2,240.66),(3,1,3,3.00),(4,1,4,3.00),(13,4,1,0.00),(14,4,2,0.00),(15,4,3,0.00),(16,4,4,0.00);
/*!40000 ALTER TABLE `ligne_frais_forfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligne_frais_hors_forfait`
--

DROP TABLE IF EXISTS `ligne_frais_hors_forfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ligne_frais_hors_forfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fiche_frais_id` int(11) NOT NULL,
  `libelle` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `dateFrais` date NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EC01626DD94F5755` (`fiche_frais_id`),
  CONSTRAINT `FK_EC01626DD94F5755` FOREIGN KEY (`fiche_frais_id`) REFERENCES `fiche_frais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_frais_hors_forfait`
--

LOCK TABLES `ligne_frais_hors_forfait` WRITE;
/*!40000 ALTER TABLE `ligne_frais_hors_forfait` DISABLE KEYS */;
INSERT INTO `ligne_frais_hors_forfait` VALUES (2,4,'REFUSE : Crevaison','2016-05-05',245.00);
/*!40000 ALTER TABLE `ligne_frais_hors_forfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'lvillachane','jux7g','V','Louis','Villechalane','8 rue des Charmes','46000','Cahors','2005-12-21'),(2,'dandre','oppg5','V','David','Andre','1 rue Petit','46200','Lalbenque','1998-11-23'),(3,'cbedos','gmhxd','C','Christian','Bedos','1 rue Peranud','46250','Montcuq','1995-01-12'),(4,'ltusseau','ktp3s','V','Louis','Tusseau','22 rue des Ternes','46123','Gramat','2000-05-01'),(5,'pbentot','doyw1','V','Pascal','Bentot','11 allée des Cerises','46512','Bessines','1992-07-09'),(6,'lbioret','hrjfs','V','Luc','Bioret','1 Avenue gambetta','46000','Cahors','1998-05-11'),(7,'fbunisset','4vbnd','V','Francis','Bunisset','10 rue des Perles','93100','Montreuil','1987-10-21'),(8,'dbunisset','s1y1r','V','Denise','Bunisset','23 rue Manin','75019','paris','2010-12-05'),(9,'bcacheux','uf7r3','V','Bernard','Cacheux','114 rue Blanche','75017','Paris','2009-11-12'),(10,'ecadic','6u8dc','V','Eric','Cadic','123 avenue de la République','75011','Paris','2008-09-23'),(11,'ccharoze','u817o','V','Catherine','Charoze','100 rue Petit','75019','Paris','2005-11-12'),(12,'cclepkens','bw1us','V','Christophe','Clepkens','12 allée des Anges','93230','Romainville','2003-08-11'),(13,'vcottin','2hoh9','V','Vincenne','Cottin','36 rue Des Roches','93100','Monteuil','2001-11-18'),(14,'fdaburon','7oqpv','V','François','Daburon','13 rue de Chanzy','94000','Créteil','2002-02-11'),(15,'pde','gk9kx','V','Philippe','De','13 rue Barthes','94000','Créteil','2010-12-14'),(16,'mdebelle','od5rt','V','Michel','Debelle','181 avenue Barbusse','93210','Rosny','2006-11-23'),(17,'jdebelle','nvwqq','V','Jeanne','Debelle','134 allée des Joncs','44000','Nantes','2000-05-11'),(18,'mdebroise','sghkb','V','Michel','Debroise','2 Bld Jourdain','44000','Nantes','2001-04-17'),(19,'ndesmarquest','f1fob','V','Nathalie','Desmarquest','14 Place d Arc','45000','Orléans','2005-11-12'),(20,'pdesnost','4k2o5','V','Pierre','Desnost','16 avenue des Cèdres','23200','Guéret','2001-02-05'),(21,'fdudouit','44im8','V','Frédéric','Dudouit','18 rue de l église','23120','GrandBourg','2000-08-01'),(22,'cduncombe','qf77j','V','Claude','Duncombe','19 rue de la tour','23100','La souteraine','1987-10-10'),(23,'cenault','y2qdu','V','Céline','Enault-Pascreau','25 place de la gare','23200','Gueret','1995-09-01'),(24,'veynde','i7sn3','V','Valérie','Eynde','3 Grand Place','13015','Marseille','1999-11-01'),(25,'jfinck','mpb3t','V','Jacques','Finck','10 avenue du Prado','13002','Marseille','2001-11-10'),(26,'ffremont','xs5tq','V','Fernande','Frémont','4 route de la mer','13012','Allauh','1998-10-01'),(27,'agest','dywvt','V','Alain','Gest','30 avenue de la mer','13025','Berre','1985-11-01');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-07 22:43:54
