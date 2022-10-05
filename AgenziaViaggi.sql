CREATE DATABASE  IF NOT EXISTS `agenziaviaggi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `agenziaviaggi`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: agenziaviaggi
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aeroporto`
--

DROP TABLE IF EXISTS `aeroporto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeroporto` (
  `id_aeroporto` varchar(5) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `città` varchar(20) NOT NULL,
  PRIMARY KEY (`id_aeroporto`),
  UNIQUE KEY `id_aeroporto_UNIQUE` (`id_aeroporto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeroporto`
--

LOCK TABLES `aeroporto` WRITE;
/*!40000 ALTER TABLE `aeroporto` DISABLE KEYS */;
INSERT INTO `aeroporto` VALUES ('ATH21','Eleftherios Venizelos','Atene'),('BAR00','Barcelona-El Prat','Barcellona'),('LIS93','Humberto Delgado','Lisbona'),('LON33','Heathrow','Londra'),('NY200','JFK','New York City'),('PAR45','Charles de Gaulle','Parigi'),('RO142','Leonardo da Vinci','Roma');
/*!40000 ALTER TABLE `aeroporto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benefits`
--

DROP TABLE IF EXISTS `benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benefits` (
  `benefit` varchar(20) NOT NULL,
  `ticket_cod` varchar(5) NOT NULL,
  PRIMARY KEY (`ticket_cod`),
  CONSTRAINT `fk_benefits_First Class1` FOREIGN KEY (`ticket_cod`) REFERENCES `firstclass` (`ticket_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefits`
--

LOCK TABLES `benefits` WRITE;
/*!40000 ALTER TABLE `benefits` DISABLE KEYS */;
INSERT INTO `benefits` VALUES ('Streaming','65QEJ'),('Presa_Corrente','8LUN7'),('Menu_Premium','A93KN'),('Streaming','Ao89N'),('Presa_Corrente','LKOO2'),('Menu_Premium','LTN21'),('Streaming','NCCY1'),('Presa_Corrente','STF48');
/*!40000 ALTER TABLE `benefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biglietto`
--

DROP TABLE IF EXISTS `biglietto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biglietto` (
  `ticket_cod` varchar(5) NOT NULL,
  `tipo_bagaglio` enum('S','M','L') NOT NULL DEFAULT 'S',
  `prezzo` int NOT NULL,
  `numPosto` varchar(4) NOT NULL,
  `viaggiatore_cf` varchar(20) NOT NULL,
  `volo_numVolo` int NOT NULL,
  PRIMARY KEY (`ticket_cod`),
  UNIQUE KEY `ticket_cod_UNIQUE` (`ticket_cod`),
  KEY `fk_biglietto_viaggiatore1_idx` (`viaggiatore_cf`),
  KEY `fk_biglietto_volo1_idx` (`volo_numVolo`),
  CONSTRAINT `fk_biglietto_viaggiatore1` FOREIGN KEY (`viaggiatore_cf`) REFERENCES `viaggiatore` (`cf`),
  CONSTRAINT `fk_biglietto_volo1` FOREIGN KEY (`volo_numVolo`) REFERENCES `volo` (`numVolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biglietto`
--

LOCK TABLES `biglietto` WRITE;
/*!40000 ALTER TABLE `biglietto` DISABLE KEYS */;
INSERT INTO `biglietto` VALUES ('12KKA','M',99,'C32','LNSXNP34M48Z332X',555),('16HHF','L',90,'C12','PTFRBH95T42F832K',111),('17H5S','M',66,'B12','FVRMQT39A58F392Q',555),('1ASDC','S',255,'A21','PTFRBH95T42F832K',123),('2ASDL','M',100,'B87','RMNPMQ71E23E660V',665),('2ASDQ','S',89,'A44','BDMFPM38D50F976N',321),('2FQ3A','L',56,'C13','FVRMQT39A58F392Q',321),('3A22A','M',50,'B76','BDMFPM38D50F976N',753),('3AA21','S',78,'B11','PTFRBH95T42F832K',111),('4SDCC','S',88,'A1','RMNPMQ71E23E660V',222),('4YBBS','M',59,'B1','FVRMQT39A58F392Q',634),('524SA','M',55,'B54','LNSXNP34M48Z332X',544),('65QEJ','S',132,'A00','FAAPWQ47L46B099I',555),('6bOrM','L',89,'C01','FAAPWQ47L46B099I',753),('8kMW5','S',200,'C12','FAAPWQ47L46B099I',123),('8LUN7','M',150,'D24','BDMFPM38D50F976N',544),('A93KN','L',112,'C09','PTFRBH95T42F832K',321),('Ao89N','L',70,'D06','BDMFPM38D50F976N',321),('F4Ott','S',80,'B9','PTFRBH95T42F832K',555),('FN545','S',92,'A45','RMNPMQ71E23E660V',444),('G9VGl','M',100,'C13','LNSXNP34M48Z332X',123),('H2IIL','S',105,'C7','FAAPWQ47L46B099I',544),('JI5zF','S',55,'D1','BDMFPM38D50F976N',753),('LKOO2','S',45,'D10','BDMFPM38D50F976N',544),('LTN21','L',69,'D11','LNSXNP34M48Z332X',123),('NCCY1','M',96,'D22','PTFRBH95T42F832K',123),('SF335','L',120,'C42','LNSXNP34M48Z332X',321),('SST14','L',150,'C32','FAAPWQ47L46B099I',544),('STF48','M',101,'D23','PTFRBH95T42F832K',123),('TSH33','L',98,'C22','LNSXNP34M48Z332X',111),('zGLjp','L',70,'C21','FAAPWQ47L46B099I',544);
/*!40000 ALTER TABLE `biglietto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compagnia_aerea`
--

DROP TABLE IF EXISTS `compagnia_aerea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compagnia_aerea` (
  `id_compagnia` int NOT NULL,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id_compagnia`),
  UNIQUE KEY `id_compagnia_UNIQUE` (`id_compagnia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compagnia_aerea`
--

LOCK TABLES `compagnia_aerea` WRITE;
/*!40000 ALTER TABLE `compagnia_aerea` DISABLE KEYS */;
INSERT INTO `compagnia_aerea` VALUES (12318,'WIZZAIR'),(16235,'RYANAIR'),(82432,'USFLIGHT'),(82732,'ALITALIA'),(547456,'AIRFRANCE'),(917237,'QATAR');
/*!40000 ALTER TABLE `compagnia_aerea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conosce`
--

DROP TABLE IF EXISTS `conosce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conosce` (
  `id_impiegato` int NOT NULL,
  `lingua_Nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id_impiegato`,`lingua_Nome`),
  KEY `fk_impiegato_has_lingua_lingua1_idx` (`lingua_Nome`),
  KEY `fk_impiegato_has_lingua_impiegato1_idx` (`id_impiegato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conosce`
--

LOCK TABLES `conosce` WRITE;
/*!40000 ALTER TABLE `conosce` DISABLE KEYS */;
INSERT INTO `conosce` VALUES (123,'Italiano'),(211,'Francese'),(222,'Spagnolo'),(234,'Italiano'),(234,'Spagnolo'),(425,'Inglese'),(523,'Russo'),(532,'Francese'),(532,'Tedesco'),(645,'Inglese'),(675,'Francese'),(735,'Russo'),(777,'Russo'),(777,'Tedesco'),(877,'Spagnolo');
/*!40000 ALTER TABLE `conosce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `economy`
--

DROP TABLE IF EXISTS `economy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `economy` (
  `buono` enum('Family','Student','U12') NOT NULL,
  `ticket_cod` varchar(5) NOT NULL,
  PRIMARY KEY (`ticket_cod`),
  CONSTRAINT `fk_Economy_biglietto1` FOREIGN KEY (`ticket_cod`) REFERENCES `biglietto` (`ticket_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `economy`
--

LOCK TABLES `economy` WRITE;
/*!40000 ALTER TABLE `economy` DISABLE KEYS */;
INSERT INTO `economy` VALUES ('Family','12KKA'),('Family','16HHF'),('Family','17H5S'),('Family','1ASDC'),('U12','2ASDL'),('Family','2ASDQ'),('Student','2FQ3A'),('Student','3A22A'),('U12','3AA21'),('Student','4SDCC'),('Student','4YBBS'),('Student','524SA'),('Family','6bOrM'),('Student','8kMW5'),('Family','F4Ott'),('Student','FN545'),('Family','G9VGl'),('Family','H2IIL'),('Family','JI5zF'),('Student','SF335'),('Student','SST14'),('Family','TSH33'),('U12','zGLjp');
/*!40000 ALTER TABLE `economy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firstclass`
--

DROP TABLE IF EXISTS `firstclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firstclass` (
  `ticket_cod` varchar(5) NOT NULL,
  PRIMARY KEY (`ticket_cod`),
  CONSTRAINT `fk_First Class_biglietto1` FOREIGN KEY (`ticket_cod`) REFERENCES `biglietto` (`ticket_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firstclass`
--

LOCK TABLES `firstclass` WRITE;
/*!40000 ALTER TABLE `firstclass` DISABLE KEYS */;
INSERT INTO `firstclass` VALUES ('65QEJ'),('8LUN7'),('A93KN'),('Ao89N'),('LKOO2'),('LTN21'),('NCCY1'),('STF48');
/*!40000 ALTER TABLE `firstclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impiegato`
--

DROP TABLE IF EXISTS `impiegato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impiegato` (
  `id_impiegato` int NOT NULL,
  `AnniLavoro` int NOT NULL,
  `Stipendio` int NOT NULL,
  `NumVoli` int NOT NULL,
  `Tipo` enum('Pilota','Assistente') NOT NULL,
  `compagnia` int NOT NULL,
  PRIMARY KEY (`id_impiegato`),
  UNIQUE KEY `id_impiegato_UNIQUE` (`id_impiegato`),
  KEY `fk_impiegato_compagnia_aerea1_idx` (`compagnia`),
  CONSTRAINT `fk_impiegato_compagnia_aerea1` FOREIGN KEY (`compagnia`) REFERENCES `compagnia_aerea` (`id_compagnia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impiegato`
--

LOCK TABLES `impiegato` WRITE;
/*!40000 ALTER TABLE `impiegato` DISABLE KEYS */;
INSERT INTO `impiegato` VALUES (222,8,1700,21,'Assistente',12318),(234,4,2000,15,'Assistente',16235),(425,3,1600,8,'Pilota',12318),(675,6,1900,12,'Pilota',917237),(735,9,1800,13,'Assistente',16235),(777,4,2800,11,'Assistente',82432),(877,7,1920,10,'Pilota',12318);
/*!40000 ALTER TABLE `impiegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lingua`
--

DROP TABLE IF EXISTS `lingua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lingua` (
  `Nome Lingua` varchar(20) NOT NULL,
  PRIMARY KEY (`Nome Lingua`),
  UNIQUE KEY `Nome Lingua_UNIQUE` (`Nome Lingua`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lingua`
--

LOCK TABLES `lingua` WRITE;
/*!40000 ALTER TABLE `lingua` DISABLE KEYS */;
INSERT INTO `lingua` VALUES ('Francese'),('Inglese'),('Italiano'),('Russo'),('Spagnolo'),('Tedesco');
/*!40000 ALTER TABLE `lingua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numero_tel`
--

DROP TABLE IF EXISTS `numero_tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numero_tel` (
  `numero` bigint NOT NULL,
  `impiegato` int NOT NULL,
  PRIMARY KEY (`numero`),
  UNIQUE KEY `numero_UNIQUE` (`numero`),
  KEY `fk_numero_tel_impiegato1_idx` (`impiegato`),
  CONSTRAINT `fk_numero_tel_impiegato1` FOREIGN KEY (`impiegato`) REFERENCES `impiegato` (`id_impiegato`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numero_tel`
--

LOCK TABLES `numero_tel` WRITE;
/*!40000 ALTER TABLE `numero_tel` DISABLE KEYS */;
INSERT INTO `numero_tel` VALUES (4940897236,222),(7325205138,222),(8631319947,222),(3552540056,234),(2949213388,425),(1466825256,675),(3805042638,735),(5992547387,777),(6016018981,777),(4989356745,877);
/*!40000 ALTER TABLE `numero_tel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presente_in`
--

DROP TABLE IF EXISTS `presente_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presente_in` (
  `id_compagnia` int NOT NULL,
  `id_aeroporto` varchar(5) NOT NULL,
  PRIMARY KEY (`id_compagnia`,`id_aeroporto`),
  KEY `fk_compagnia_aerea_has_aeroporto_aeroporto1_idx` (`id_aeroporto`),
  KEY `fk_compagnia_aerea_has_aeroporto_compagnia_aerea1_idx` (`id_compagnia`),
  CONSTRAINT `fk_compagnia_aerea_has_aeroporto_compagnia_aerea1` FOREIGN KEY (`id_compagnia`) REFERENCES `compagnia_aerea` (`id_compagnia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presente_in`
--

LOCK TABLES `presente_in` WRITE;
/*!40000 ALTER TABLE `presente_in` DISABLE KEYS */;
INSERT INTO `presente_in` VALUES (12318,'BAR00'),(16235,'NY200'),(16235,'RO142'),(82432,'LIS93'),(82732,'LIS93'),(82732,'PAR45'),(547456,'ATH21'),(917237,'NY200');
/*!40000 ALTER TABLE `presente_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaggiatore`
--

DROP TABLE IF EXISTS `viaggiatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaggiatore` (
  `cf` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `età` int DEFAULT NULL,
  PRIMARY KEY (`cf`),
  UNIQUE KEY `CF_UNIQUE` (`cf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaggiatore`
--

LOCK TABLES `viaggiatore` WRITE;
/*!40000 ALTER TABLE `viaggiatore` DISABLE KEYS */;
INSERT INTO `viaggiatore` VALUES ('BDMFPM38D50F976N','Miriam','Camaleonte',21),('FAAPWQ47L46B099I','Alberto','Tatiana',61),('FVRMQT39A58F392Q','Anna','Bolla',30),('LNSXNP34M48Z332X','Alessio','Spadafora',19),('PTFRBH95T42F212K','Pino','Pascqualino',1),('PTFRBH95T42F832K','Giovanni','Giorgio',35),('RMNPMQ71E23E660V','Emilia','Caglio',11);
/*!40000 ALTER TABLE `viaggiatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volo`
--

DROP TABLE IF EXISTS `volo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volo` (
  `numVolo` int NOT NULL,
  `aeroporto_partenza` varchar(30) NOT NULL,
  `aereoporto_destinazione` varchar(30) NOT NULL,
  `ora_partenza` time NOT NULL,
  `data_partenza` date NOT NULL,
  `numPasseggeri` int NOT NULL,
  `durata` time NOT NULL,
  `id_compagnia` int NOT NULL,
  PRIMARY KEY (`numVolo`),
  UNIQUE KEY `numVolo_UNIQUE` (`numVolo`),
  KEY `fk_volo_compagnia_aerea1_idx` (`id_compagnia`),
  CONSTRAINT `fk_volo_compagnia_aerea1` FOREIGN KEY (`id_compagnia`) REFERENCES `compagnia_aerea` (`id_compagnia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volo`
--

LOCK TABLES `volo` WRITE;
/*!40000 ALTER TABLE `volo` DISABLE KEYS */;
INSERT INTO `volo` VALUES (111,'BAR00','LIS93','07:50:00','2019-06-09',55,'01:20:00',12318),(123,'RO142','LON33','12:00:00','2019-04-12',50,'01:40:00',82732),(222,'ATH21','BAR00','08:20:00','2020-10-30',65,'02:45:00',16235),(321,'PAR45','NY200','14:20:00','2019-05-16',60,'06:30:00',82432),(444,'LIS93','ATH21','10:15:00','2020-01-12',64,'03:00:00',16235),(544,'NY200','LIS93','05:20:00','2021-05-16',58,'06:40:00',82432),(555,'NY200','RO142','11:00:00','2020-02-01',98,'06:40:00',82432),(634,'BAR00','PAR45','23:00:00','2021-01-11',53,'01:45:00',547456),(665,'LON33','ATH21','11:15:00','2021-08-12',77,'02:00:00',917237),(753,'RO142','LON33','20:50:00','2021-09-13',86,'02:20:00',82732);
/*!40000 ALTER TABLE `volo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-18 11:34:38
