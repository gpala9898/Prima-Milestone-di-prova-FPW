-- MySQL dump 10.13  Distrib 5.7.8-rc, for Win64 (x86_64)
--
-- Host: localhost    Database: fpw19_dbpalagianluca
-- ------------------------------------------------------
-- Server version	5.7.8-rc-log

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
-- Table structure for table `articolo`
--

DROP TABLE IF EXISTS `articolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articolo` (
  `id_articolo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titolo` varchar(100) DEFAULT NULL,
  `testo` varchar(300) DEFAULT NULL,
  `data` varchar(100) DEFAULT NULL,
  `situazione` varchar(100) DEFAULT NULL,
  `immagine` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_articolo`),
  UNIQUE KEY `id_articolo` (`id_articolo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articolo`
--

LOCK TABLES `articolo` WRITE;
/*!40000 ALTER TABLE `articolo` DISABLE KEYS */;
INSERT INTO `articolo` VALUES (1,'La protezione dei dati aiuta l\'economia digitale','Oggi abbiamo processori in grado di raccogliere, archiviare e processare enormi quantitÃ  di dati, che hanno consentito lo svilupparsi delle tecnologie sempre migliori di quelle presenti...','31/05/2019','Aperto','https://protezionedatipersonali.it/images/gdpr.jpg'),(2,'ASUS ROG Zephyrus S GX531, la recensione','ASUS ROG Zephyrus S GX531 è uno dei portatili\n più potenti del mercato. Ed è anche il più sottile con questo hardware...','15/01/2019','Da valutare','https://d2skuhm0vrry40.cloudfront.net/2019/articles/2019-03-04-20-59/DSC02913_920x613.jpg'),(3,'I vantaggi dell\'Intelligenza Artificiale','Quando si parla di macchine pensanti, non c\'è dubbio che la letteratura di genere abbia una predilezione per i soggetti distopici (lo stesso Asimov nei suoi \nracconti metteva continuamente in evidenza le falle delle tre leggi elencate sopra)...','27/12/2018','Accettato','https://www.galileonet.it/wp-content/uploads/2018/10/artificial-intelligence-3382507_1280.jpg'),(4,'ADA,il braccio robotico che aiuta a mangiare','Un team di ricercatori della Washington University ha messo a punto un braccio \nrobot per aiutare disabili e invalidi a mangiare  in autonomia...','14/03/2017','Rifutato','https://www.hurolife.it/wp-content/uploads/2019/03/braccio-robotico-autonomo.jpg'),(5,'AMD al Computex 2019, svelati i processori Ryzen 3000','Prima conferenza della fiera, quella AMD ha ospitato anche una\n sorta di  cerimonia d\'inizio del Computex, l\'enorme fiera dedicata all\'informatica ...','27/05/2019','Aperto','https://multiplayer.net-cdn.it/thumbs/images/2019/05/27/amd-lisa-su-computex.jpg');
/*!40000 ALTER TABLE `articolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modart`
--

DROP TABLE IF EXISTS `modart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modart` (
  `id_aut` bigint(20) unsigned NOT NULL,
  `id_art` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_aut`,`id_art`),
  KEY `articolo_fk` (`id_art`),
  CONSTRAINT `modart_ibfk_1` FOREIGN KEY (`id_aut`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `modart_ibfk_2` FOREIGN KEY (`id_art`) REFERENCES `articolo` (`id_articolo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modart`
--

LOCK TABLES `modart` WRITE;
/*!40000 ALTER TABLE `modart` DISABLE KEYS */;
INSERT INTO `modart` VALUES (1,1),(1,2),(1,3),(1,4),(3,5);
/*!40000 ALTER TABLE `modart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utente` (
  `id_utente` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `cognome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `ente` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `immagine` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE KEY `id_utente` (`id_utente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'Gianluca','Pala','gianlucapala98@gmail.com','Milestone19','http://facolta.unica.it/ingegneriainformatica/','autore','http://www.balooa.com/img/icon-registra-utente.jpg?m=1398631416'),(2,'Bill','Gates','billgates55@outlook.com','SonoRicco','https://support.microsoft.com/it-it','organizzatore','https://static.milanofinanza.it/content_upload/img/2018/02/201802190833455455/Gates-Bill-326203.jpg'),(3,'Elon','Musk','elon71@gmail.com','tesla1971','https://www.tesla.com/it_IT/models','autore','https://pixel.nymag.com/imgs/daily/selectall/2018/09/07/07-elon-musk-smoking-weed.w700.h700.jpg');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valutazione`
--

DROP TABLE IF EXISTS `valutazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valutazione` (
  `id_valutazione` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_autore` bigint(20) unsigned DEFAULT NULL,
  `id_articolo` bigint(20) unsigned DEFAULT NULL,
  `voto` tinyint(4) DEFAULT NULL,
  `commaut` varchar(300) DEFAULT NULL,
  `commorg` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_valutazione`),
  UNIQUE KEY `id_valutazione` (`id_valutazione`),
  KEY `autore_fk` (`id_autore`),
  KEY `articolo_fk` (`id_articolo`),
  CONSTRAINT `valutazione_ibfk_1` FOREIGN KEY (`id_autore`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `valutazione_ibfk_2` FOREIGN KEY (`id_articolo`) REFERENCES `articolo` (`id_articolo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valutazione`
--

LOCK TABLES `valutazione` WRITE;
/*!40000 ALTER TABLE `valutazione` DISABLE KEYS */;
INSERT INTO `valutazione` VALUES (1,1,5,5,'Articolo ben dettagliato','Ben strutturato'),(3,3,1,5,'Articolo ben dettagliato','Articolo ricco di informazioni'),(4,3,2,4,'Ottimo articolo',NULL),(5,3,3,2,'Articolo noioso','Articolo da bocciare'),(6,3,4,4,'Bell\'articolo',NULL);
/*!40000 ALTER TABLE `valutazione` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-02  0:56:13
