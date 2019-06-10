-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: duce
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `BranchCode`
--

DROP TABLE IF EXISTS `BranchCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BranchCode` (
  `BranchNo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Branch` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BranchDetalls` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`BranchNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BranchCode`
--

LOCK TABLES `BranchCode` WRITE;
/*!40000 ALTER TABLE `BranchCode` DISABLE KEYS */;
INSERT INTO `BranchCode` VALUES ('00','미정',NULL);
/*!40000 ALTER TABLE `BranchCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MajorCode`
--

DROP TABLE IF EXISTS `MajorCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MajorCode` (
  `MajorNo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Major` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MajorDetalls` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MajorNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MajorCode`
--

LOCK TABLES `MajorCode` WRITE;
/*!40000 ALTER TABLE `MajorCode` DISABLE KEYS */;
INSERT INTO `MajorCode` VALUES ('01','컴퓨터소프트웨어',NULL),('02','디지털전자',NULL),('03','메카트로닉스',NULL),('04','방송음향영상',NULL),('06','건축',NULL),('07','건축설비소방',NULL);
/*!40000 ALTER TABLE `MajorCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqBoard`
--

DROP TABLE IF EXISTS `faqBoard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqBoard` (
  `faqNum` int(11) NOT NULL,
  `faqTitle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqContent` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqDate` datetime NOT NULL,
  `faqHits` int(11) NOT NULL,
  PRIMARY KEY (`faqNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqBoard`
--

LOCK TABLES `faqBoard` WRITE;
/*!40000 ALTER TABLE `faqBoard` DISABLE KEYS */;
INSERT INTO `faqBoard` VALUES (1,'우리가 사랑하는 것','작성자','코딩','2019-05-31 13:24:42',13);
/*!40000 ALTER TABLE `faqBoard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticeBoard`
--

DROP TABLE IF EXISTS `noticeBoard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticeBoard` (
  `noticeNum` int(11) NOT NULL,
  `noticeTitle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noticeDate` datetime NOT NULL,
  `noticeContent` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noticeHits` int(11) NOT NULL,
  `refer` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`noticeNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticeBoard`
--

LOCK TABLES `noticeBoard` WRITE;
/*!40000 ALTER TABLE `noticeBoard` DISABLE KEYS */;
INSERT INTO `noticeBoard` VALUES (1,'1','admin','2019-05-31 05:54:27','Test',6,NULL),(2,'Tets1','admin','2019-05-31 05:56:51','1',7,NULL),(3,'t','admin','2019-05-31 05:57:01','t',4,NULL),(4,'5','admin','2019-05-31 06:02:16','Tetes',9,NULL),(5,'6','admin','2019-05-31 06:06:10','Test1',4,NULL),(6,'1','admin','2019-05-31 06:10:30','Test',4,NULL),(7,'1','admin','2019-05-31 09:29:06','Test1',19,NULL),(8,'','admin','2019-05-31 10:16:42','',4,NULL),(9,'','admin','2019-05-31 10:21:04','',3,NULL),(10,'1','admin','2019-05-31 10:33:23','Test',8,NULL),(11,'2','admin','2019-05-31 10:57:00','Tets2',8,NULL),(12,'1ㅆ','admin','2019-05-31 11:16:30','ㅆㄷㅅㄴ',18,NULL),(13,'ㅆ','admin','2019-05-31 11:18:35','Test1',6,NULL),(14,'4','admin','2019-05-31 11:24:39','Test1',7,NULL),(15,'1','admin','2019-05-31 11:26:19','Test1',12,NULL),(16,'2','admin','2019-05-31 12:29:22','Test',14,NULL),(17,'2','admin','2019-05-31 12:48:28','Test',11,NULL),(18,'1','admin','2019-05-31 12:53:59','Test',5,NULL),(19,'2','admin','2019-05-31 12:56:58','Tets',4,NULL),(20,'2','admin','2019-05-31 12:59:29','Test',4,NULL),(21,'1','admin','2019-05-31 13:01:10','Test',5,NULL),(22,'2','admin','2019-05-31 13:02:15','Test',3,NULL),(23,'2','admin','2019-05-31 13:04:29','Test1',7,NULL),(24,'1','admin','2019-05-31 13:13:37','Test',7,NULL),(25,'1','admin','2019-05-31 13:14:00','Test',11,NULL),(26,'t','admin','2019-06-01 15:28:34','Tets',27,NULL),(27,'Test','admin','2019-06-01 15:00:09','Test',33,NULL),(28,'2','admin','2019-05-31 14:54:35','Test',13,NULL),(29,'1','admin','2019-05-31 15:02:35','Test',14,NULL),(31,'1','admin','2019-05-31 15:05:51','Test',9,NULL),(32,'11','admin','2019-05-31 15:37:35','11',25,NULL),(33,'ㅋ','admin','2019-06-01 11:47:33','ㅋ',10,NULL),(34,'z','admin','2019-06-01 11:55:53','zx',20,NULL),(35,'a','admin','2019-06-01 15:01:13','sd',31,NULL),(36,'파일 업로드112','admin','2019-06-03 03:03:56','파일 업로드1',55,NULL),(37,'테스트 참조링','admin','2019-06-07 03:22:50','크 참조링크',18,'http://www.naver.com'),(38,'우산','admin','2019-06-07 10:59:11','어느새 빗물이 내 발목에 고이고\r\n참았던 눈물이 내 눈가에 고이고 I cry\r\n\r\n텅 빈 방엔 시계소리\r\n지붕과 입 맞추는 비의 소리\r\n오랜만에 입은 coat 주머니 속에 반지\r\n손 틈새 스며드는 memory\r\n\r\n며칠 만에 나서보는 밤의 서울\r\n고인 빗물은 작은 거울\r\n그 속에 난 비틀거리며 아프니까\r\n그대 없이 난 한쪽 다리가 짧은 의자\r\n\r\n둘이서 쓰긴 작았던 우산\r\n차가운 세상에 섬 같았던 우산\r\n이젠 너무 크고 어색해\r\n그대 곁에 늘 젖어있던 왼쪽 어깨\r\n\r\n기억의 무게에 고개 숙여보니\r\n버려진 듯 풀어진 내 신발 끈\r\n허나 곁엔 오직 비와 바람 (없다)\r\n잠시라도 우산을 들어줄 사람 and I cry\r\n\r\n어느새 빗물이 내 발목에 고이고\r\n참았던 눈물이 내 눈가에 고이고 I cry\r\n\r\n그대는 내 머리위에 우산\r\n어깨 위에 차가운 비 내리는 밤\r\n내 곁에 그대가 습관이 돼버린 나\r\n난 그대 없이는 안 돼요 Alone in the rain\r\n\r\nAlone in the rain, rain, rain\r\nNothin\' but pain, pain, pain\r\nGirl, I just want you to know\r\nAlone in the rain, rain, rain\r\nNothin\' but pain, pain, pain\r\nAnd I just can\'t let you go\r\n\r\n하늘의 눈물이 고인 땅\r\n별을 감춘 구름에 보인 달\r\n골목길 홀로 외로운 구두 소리\r\n메아리에 돌아보며 가슴 졸인 맘\r\n\r\n나를 꼭 닮은 그림자\r\n서로가 서로를 볼 수 없었던 우리가\r\n이제야 둘인가 대답을 그리다\r\n머릿속 그림과 대답을 흐린다\r\n\r\n내 눈엔 너무 컸던 우산\r\n날 울린 세상을 향해 접던 우산\r\n영원의 약속에 활짝 폈던 우산\r\n이제는 찢겨진 우산 아래 두 맘\r\n\r\n돌아봐도 이젠 없겠죠\r\n두 손은 주머니 속 깊게 넣겠죠\r\n이리저리 자유롭게 걸어도\r\n두 볼은 가랑비에도 쉽게 젖겠죠\r\n\r\n어느새 빗물이 내 발목에 고이고\r\n참았던 눈물이 내 눈가에 고이고 I cry\r\n\r\n그대는 내 머리 위에 우산\r\n어깨 위에 차가운 비 내리는 밤\r\n내 곁에 그대가 습관이 돼버린 나\r\n난 그대 없이는 안 돼요 Alone in the rain\r\n\r\n난 열어놨어 내 마음의 문을\r\n그댄 내 머리 위의 우산\r\n그대의 그림자는 나의 그늘\r\n그댄 내 머리 위의 우산\r\n난 열어놨어 내 마음의 문을\r\n그댄 내 머리 위의 우산\r\n그대의 그림자는 나의 그늘\r\n그댄 내 머리 위의 우산\r\n\r\n나의 곁에 그대가 없기에\r\n나 창 밖에 우산을 들고 기다리던 그대 I cry\r\n\r\n그대는 내 머리 위의 우산\r\n어깨 위에 차가운 비 내리는 밤\r\n내 곁에 그대가 습관이 돼버린 나\r\n난 그대 없이는 안 돼요\r\nI need you back in my love\r\n\r\n그대는 내 머리 위의 우산\r\n어깨 위에 차가운 비 내리는 밤\r\n내 곁에 그대가 없는 반쪽의 세상\r\n그대 나 없이는 안 돼요\r\nForever in the rain\r\n\r\n(버려진 우산)\r\n(버려진 우산)\r\n(I need you back)\r\n(버려진 우산)\r\n(Without you)',26,''),(39,'수정 확인 창','admin','2019-06-08 03:32:54','1234\r\n1444\r\n1123411\r\n\r\n111233\r\n11231\r\n223311',13,''),(40,'공지사항 리스트 1','admin','2019-06-08 04:37:05','공지사항 리스트 1',3,''),(41,'공지사항 리스트 2','admin','2019-06-08 04:37:10','공지사항 리스트 2',3,''),(42,'공지사항 리스트 3','admin','2019-06-08 04:37:19','공지사항 리스트 3',3,''),(43,'공지사항 리스트 4','admin','2019-06-08 04:37:24','공지사항 리스트 4',3,''),(44,'공지사항 리스트 5','admin','2019-06-08 04:37:30','공지사항 리스트 5',3,''),(45,'공지사항 리스트 6','admin','2019-06-08 04:37:36','공지사항 리스트 6',3,''),(46,'공지사항 리스트 6','admin','2019-06-08 04:37:42','공지사항 리스트 6',3,''),(47,'공지사항 리스트 7','admin','2019-06-08 04:37:48','공지사항 리스트 7',4,''),(48,'공지사항 리스트 8','admin','2019-06-08 04:37:54','공지사항 리스트 8',3,''),(49,'공지사항 리스트 9','admin','2019-06-08 04:38:02','공지사항 리스트 9',2,''),(50,'공지사항 리스트 10','admin','2019-06-08 04:38:08','공지사항 리스트 10',8,''),(51,'공지사항 리스트 11','admin','2019-06-08 04:38:14','공지사항 리스트 11',5,''),(52,'공지사항 리스트 12','admin','2019-06-08 04:38:29','공지사항 리스트 12',3,''),(53,'공지사항 리스트 13','admin','2019-06-08 04:38:33','공지사항 리스트 13',2,''),(54,'공지사항 리스트 14','admin','2019-06-08 04:38:38','공지사항 리스트 14',3,''),(55,'공지사항 리스트 15','admin','2019-06-08 04:38:44','공지사항 리스트 15',7,''),(56,'공지사항 리스트 16','admin','2019-06-08 05:06:47','공지사항 리스트 16',15,'http://www.naver.com');
/*!40000 ALTER TABLE `noticeBoard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticeFile`
--

DROP TABLE IF EXISTS `noticeFile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticeFile` (
  `fileNum` int(11) NOT NULL,
  `noticeNum` int(11) NOT NULL,
  `fileSize` int(11) NOT NULL,
  `inFileName` varchar(260) COLLATE utf8mb4_unicode_ci NOT NULL,
  `outFileName` varchar(260) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`fileNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticeFile`
--

LOCK TABLES `noticeFile` WRITE;
/*!40000 ALTER TABLE `noticeFile` DISABLE KEYS */;
INSERT INTO `noticeFile` VALUES (1,10,1859,'자바 스크립트.txt','9bd326fb-798b-4a0f-a5ee-15a791f0b0d4_자바 스크립트.txt'),(2,10,394,'주석.txt','e4d39657-5a5b-4877-b7f3-4e3f4cd28cbc_주석.txt'),(3,11,394,'주석.txt','ec357b2e-e22f-4cfd-8ccd-56ca3ff8fa79_주석.txt'),(4,11,1418,'파이썬 이론.txt','aa8a45d4-7268-460a-8197-054925049a9c_파이썬 이론.txt'),(5,24,188172,'닷넷 수행평가.jpg','1ce06c94-de73-4649-9c0f-254593faadcb_닷넷 수행평가.jpg'),(6,25,394,'주석.txt','0de818a4-2a1b-4765-8906-ce4fcacc4fd7_주석.txt'),(11,28,1859,'자바 스크립트.txt','0af2b74f-ac0e-4ca5-973a-a1aaaa50e20a_자바 스크립트.txt'),(12,28,394,'주석.txt','c1ae55a9-e9ef-48d5-8484-d85710bf1814_주석.txt'),(13,28,1418,'파이썬 이론.txt','b47c8d1a-da76-4087-ab1b-1045932b4d7e_파이썬 이론.txt'),(14,29,1859,'자바 스크립트.txt','8c8ceda7-e660-458e-aa99-3a3062590750_자바 스크립트.txt'),(15,29,394,'주석.txt','db9ba4a2-08fc-46bd-a7b6-b3d824cf59aa_주석.txt'),(16,29,1418,'파이썬 이론.txt','3166ba52-8e53-4c98-a1ad-04b0760203e1_파이썬 이론.txt'),(17,36,17,'download 2.txt','392d32bc-d9df-412e-b5c8-33c7afe8f865_download 2.txt'),(20,39,595284,'Hydrangeas.jpg','428eca27-fe34-4838-8724-93946f2f126b_Hydrangeas.jpg');
/*!40000 ALTER TABLE `noticeFile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectboard`
--

DROP TABLE IF EXISTS `projectboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectboard` (
  `pNo` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Part` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Guide` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BranchNo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MajorNo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pDate` date DEFAULT NULL,
  `Hit` int(11) DEFAULT NULL,
  `Video` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Photo` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AddFile` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finishDate` date DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  PRIMARY KEY (`pNo`),
  KEY `BranchNo` (`BranchNo`),
  KEY `MajorNo` (`MajorNo`),
  CONSTRAINT `BranchCode_BranchNo_fk` FOREIGN KEY (`BranchNo`) REFERENCES `BranchCode` (`BranchNo`),
  CONSTRAINT `MajorCode_MajorNo_fk` FOREIGN KEY (`MajorNo`) REFERENCES `MajorCode` (`MajorNo`),
  CONSTRAINT `projectboard_ibfk_1` FOREIGN KEY (`BranchNo`) REFERENCES `BranchCode` (`BranchNo`) ON UPDATE CASCADE,
  CONSTRAINT `projectboard_ibfk_2` FOREIGN KEY (`MajorNo`) REFERENCES `MajorCode` (`MajorNo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectboard`
--

LOCK TABLES `projectboard` WRITE;
/*!40000 ALTER TABLE `projectboard` DISABLE KEYS */;
INSERT INTO `projectboard` VALUES (93,'스마트 배전반','건축물 내부의 필수 적용되는 분전반의 스마트화로 개선 필요에 의해 일반적으로 사용하는 배전반에 원격 제어로 실시 간 모니터링 및 전원의 자동화','김동찬,신동준,장정원,임수혁,김현철,강호산,고성민','지승한','00','03','admin','2019-06-07',0,'','/img/project/a7e6ede0-de04-4959-ad51-e2a1a40d930c-mc1.png,/img/project/3f97fd0e-a057-464a-8b37-60dbf602be50-mc2.png,','/file/project/efc6025a-bee3-4f27-aed5-f32d685d0299-메카트로닉스 - 스마트 배전반.pdf,','','2018-09-01','2018-03-01'),(94,'심플 어항','어항을 관리 하는 다양한 제품들이 존재 하지만 그 제품들의 기능들을 다 같이 활용 가능하게 만들어 관상어를 키우는 사람이라면 누구나 쉽게 접근 할 수 있도록 제작한 어항입니다.','우인수,윤종원,조현규,박명규,박민호','임경원','00','02','2019','2019-06-07',0,'','/img/project/f2ff1f36-040b-4f1d-86d8-1f5107c41e91-Simple1.jpg,/img/project/18b14499-f289-4024-9a5e-143f936ef3e6-Simple2.jpg,','/file/project/57a89bcb-0477-4e9a-9b4d-468a88d47e1d-심플 어항.pdf,','','2018-09-01','2018-03-01'),(95,'플라즈마 장비 필터 정합성 측정기','반도체 장비 중에는 플라스마를 이용하여 반도체에 사용될 웨이퍼를 가공하는 장비가 있다. 반도체 장비에서 플라스마 는 고주파를 이용하여 챔버 내의 가스를 플라스마 상태로 변환 시키는 과정을 거쳐 만들어 지는데 플라스마를 만들어 내는 과정에서 생길 수 있는 위험한 상황을 방지하고자 플라스마를 발생시키는데 사용한 고주파를 적절하게 필터링 해줄 필터 정합성 측정기를 개발','강태훈,김형준,김장민,이한빈,한병희,정대환,김테오','안영기','00','03','admin','2019-06-07',0,'','/img/project/bddff405-23b4-43c0-a167-a8239c23ccdb-img1.png,/img/project/e833d00d-31ea-4372-b381-ba045d192004-img2.png,','/file/project/fead2ae3-142c-4197-a136-d733212656db-메카트로닉스 - 플라즈마 장비 필터 정합성 측정기.pdf,','','2018-09-01','2018-03-01'),(96,'좌식 세그웨이','최근 근거리 이동수단의 일환으로 각광받고 있는 전동형 운송수단인 전동휠, 전동킥보드, 세그웨이 등을 근거리 이동 수단으로 활용하는 사례들을 어렵지 않게 볼 수 있다. 그러나 해당 제품 활용 시 안전에 대한 문제를 쉽게 접할 수 있다. 따라서 상기 개발된 작품은 기존 세그웨이 제작에 필요한 기술적 부분과, 앉아서 탈 수 있는 안장부분의 프레임을 제작하 여 기존 제품보다 안전성과 안정성을 추구한 부분을 결합한 제품이다.','박종민,신은호,강혜송,황재상,이혁주,이종균','정우석','00','02','2019','2019-06-07',0,'','/img/project/55bd9467-c4bf-4b89-ba50-e10a749787ab-Segway1.jpg,/img/project/7d3de6f2-8011-474e-959a-60220810dcb3-Segway2.jpg,','/file/project/1eec88bd-46d9-4da4-a4eb-1e969f694e1a-좌식 세그웨이.pdf,','','2018-09-01','2018-03-01'),(97,'12면체 무지향성 스피커','12면체 입체모형의 스피커를 제작하여 무지향 음원을 재생할 수 있는 스피커를 제작한다.\r\n','김재용,김지은,시정민,이야긴,최예람,박혜림,홍성재,황대원','김재평','00','04','admin','2019-06-07',0,'','/img/project/d3ac7455-0ab4-4a94-bb1d-2ea1057b66e7-img1.png,/img/project/ae39f17f-8e56-46e4-a8ce-6276095f6698-img2.png,','/file/project/e875c754-e986-4125-8c6c-3020baa122c7-2018_방송음향영상과_12면체 무지향성 스피커.pdf,','','2018-09-01','2018-03-01'),(98,'차량 번호 인식 블랙박스','블랙박스라 하면 차량의 전후방을 영상을 찍어 보관 하는 형식이다. 영상을 찍으며 사건 , 사고를 기록함으로써 경찰들 에게 중요한 증거품이 되기도 한다. 하지만 많은 용량을 차지해서 주기적으로 블랙박스의 메모리를 초기화를 해줘야 한다. 이러한 단점을 보안하기 위해 기존에 영상으로 보관을 하는 것과 차량의 번호판 , 날짜, 시간, 좌표를 Text파일에 저장하여 영상을 초기화해도 Text파일에는 장기적으로 보관을 할 수 있게 제작 하였습니다.','홍건영,신동건,유영종,성지훈','오규태','00','02','2019','2019-06-07',0,'','/img/project/669440de-3557-4d09-b310-d0b0dbacf565-Blackbox1.jpg,/img/project/cacecc4b-f433-4e66-b1d5-a84e27a39907-Blackbox2.jpg,','/file/project/16077afc-bd57-4d0f-9776-d0ff66f17fa2-차량번호 인식 블랙박스.pdf,','','2018-09-01','2018-03-01'),(99,'독립형 열회수 환기장치','태양광과 에너지 사용의 효율화를 통해 저렴한 비용으로 쾌적한 실내환경을 조성해 주는 환기장치이다\r\n기대효과 및 활용 방안은 다음과 같다\r\n1. EC 등 작동효율이 높은 동작방식을 사용함으로써 취침 시에도 쾌적하고 조용한 환경을 조성해 줄 수 있다.  \r\n2. 태양광 에너지와 상용전원을 상호보완적으로 사용함으로써, 기상악화에 따른 제한사항을 극복하고  운용비용에 대한 부담을 경감시켜 줄 것이다.\r\n3. 열회수효율이 높은 축열소재를 사용하여 실내와 실외간 온도차가 큰 환경에서 환기를 실시할 때, 실내 온도조절장치의 가동수준을 적정수준으로 유지할 수 있다.\r\n4. 시공성이 좋아 설치가 간편하며, 필터 등의 소모품도 쉽게 교체할 수 있다','김도겸,박지원,백윤지,이서영,이재원,정준영','강윤진','00','07','admin','2019-06-07',0,'','/img/project/c22827f8-c2c9-4815-9d5b-ac32d2cf671c-s1.PNG,/img/project/fdbf65da-7f68-45c9-a013-909e19c470ea-s2.PNG,','/file/project/8e03f022-4627-418b-9378-cb4ad210e68c-건축설비소방과 - 독립형 열회수 환기장치.pdf,','','2017-11-01','2017-03-01'),(100,'앱 관리를 위한 인증 시스템 ','- 앱에서 사용할 수 있는 인증 시스템 \r\n- 대학생들이 각자의 분야에서 궁금증을 공유하면서,타인이 모르는 것은 알려주고, 내가 모르는 것을 질문하는 커뮤니 케이션 앱의 인증 연동','유준호,이상욱,정종원,이준규,최지원,이종창,김희민','류중경','00','01','admin','2019-06-07',0,'','/img/project/29a4c0b2-0dfb-4080-aeb4-fa87d3dd50fa-img1.png,/img/project/be4e1042-a783-449d-8af0-81bf4e42860d-img2.png,','/file/project/ccd33f07-dcd6-4e3f-a645-9720247343dc-2018_컴퓨터소프트웨어과_앱관리를위한인증시스템.pdf,','','2018-09-01','2018-03-01'),(101,'초음파 자','시중에 판매하는 줄자를 이용할 때에는 혼자서 거리 혹은 길이를 측정 하는데 자기 팔 길이 정도의 길이 만큼만 측정할 수 있다는 점과 대형 줄자가 아닌 이상 길어봤자 3m 이내의 길이 밖에 측정할 수 없다는 점이다. 그래서 단점을 보완하기 위해 초음파 센서를 이용하여 거리를 측정할 수 있는 거리 측정기와 초음파가 정확하게 반사 될 수 있도록 반사판을 제작 하여 정확성과 편리성을 높였다. 더불어 거리가 길어질수록 퍼져나가는 초음파의 특성 때문에 정확한 결과를 얻을 수 없을 수도 있다는 생각 하에 비슷한 작동 원리를 가지고 있지만 정확도와 집속율이 높은 라이다(Light Detection And Ranging, LIDAR)를 이용한 측정기 또한 제작해 보기로 하였다.','이범교,문경원,김용혁,조승철','장동현','00','02','2019','2019-06-07',0,'','/img/project/4d81b0f4-4607-4409-abce-1bf05a54964f-UltrasonicRuler1.jpg,/img/project/a5a7100d-bc27-4683-9f0c-a8512805a4b4-UltrasonicRuler2.jpg,','/file/project/2bc4ba67-4e3a-4c92-88a5-32338a3c977e-초음파 자.pdf,','','2018-09-01','2018-03-01'),(102,'실별 환기 제어(VAV 디퓨저)','다양한 용도의 공간으로 구성된 복합 빌딩에서 실사용 조건과 사용 및 비사용 시간대에 부합하도록 신속하고 정밀하게 운전제어 함으로서 최적의 쾌적성을 확보하는 동시에 에너지 절약을 꾀할 수 있는 신개념 공조(HVAC) 시스템입니다.\r\n실별 환기를 하게 되면 전체 세대를 환기할 때보다 환기량 자체가 감소하여 필터나 전열교환기의 교환에 대한 부담도 그만큼 감소하게 되고 열교환기 통과 풍량이 줄어 폐열회수 효율도 증가된다','이주용,정구빈,배건희,최일훈,민경범,김성우','오병길','00','07','admin','2019-06-07',0,'','/img/project/83ed90ac-3199-430e-811b-41e0cb88b688-s1.PNG,/img/project/2ea450fe-1bbb-4adb-8717-45c8df8c4ddb-s2.PNG,','/file/project/c06071c2-82df-42da-9fd8-85e73d97b6f6-건축설비소방과 - 실별 환기 제어[VAV 디퓨저].pdf,','','2017-11-01','2017-03-01'),(103,'아이 건강해','어린 아이들과 학생들을 위한 주기적 자가진단 어플리케이션','김준태,박정진,이민석,이진수,임지은','이영걸','00','01','admin','2019-06-07',0,'','/img/project/17afc114-af14-4440-8aeb-54df7c5d3060-img1.png,','','','2018-09-01','2018-03-01'),(104,'커넥트 홈','기존의 스마트미러를 기본으로 스마트미러의 기능과 편의성을 그대로 살리고 가전제품, LED 형광등 등을 통신망에 연결해 모니터링 및 제어 할 수 있는 차세대 스마트 홈 시스템이다.','강지회,신민제,박준형,민요섭,김은규,이승훈','유병일','00','02','2019','2019-06-07',0,'','/img/project/cf66a786-b3dd-45b6-a1a3-52797bfcf0db-ConnectHome1.jpg,/img/project/79a7ab52-795e-4397-8b8f-ba348845d025-ConnectHome2.jpg,','/file/project/c72750b0-1c5a-455a-ab54-c831bc5530b4-커넥트 홈.pdf,','','2018-09-01','2018-03-01'),(105,'아두유로','아두이노로 구현한 블루투스 통신이 가능한 자동차와 통신 모듈이 삽입 된 자체 제작 핸들, 센서를 삽입 해 작동하는 가속페달, 변속기어와의 연동을 통해 핸들을 조작하면 스마트 주차장과의 연동을 통해 스마트 주차장에서 돌발상황이 발 생했을 때 효율적으로 대처할 수 있는 원격 조작 플랫폼','권민재,안민식,조한진,전수홍,우재성,김영랑,박병호,서승현,채종민','박민재','00','01','admin','2019-06-07',0,'','/img/project/dcea9c22-dfb4-450e-ba97-21d2b251e9ec-img1.png,/img/project/1f4e840a-4968-4ecd-81ee-d0ff6904ce32-img2.png,','/file/project/13462e8e-914a-47fa-9b90-22e931a641bc-2018_컴퓨터소프트웨어과_아두유로.pdf,','','2018-09-01','2018-03-01'),(106,'에너지 절감형 제습 환기 시스템','새로운 환기장치 시공이 필요 없이 최소한의 설치 작업만으로 설치할 수 있는 에너지 절약형 환기시스템을 개발 제작한다.기존 히터를 사용하여 다량의 습도와 결로등을 막는 시스템 대비 50% 이하의 에너지만 사용하는 선행 제습키트를 Heat Pump로 구성하는 것을 목표로 하고 있다. 이러한 선행 제습키트 개발을 통하여 결로에 의한 제품 파손 방지 등 내구성을 증대 시켜 상품성을 확보 할 수 있도록 제품 구성을 할 것이다. \r\n에너지 절약형 환기시스템 구성을 위하여 필요 환기량 및 기존 환기 제품의 사양을 결정해야 한다. 필요 환기량에 상응하는 필요 제습량 및 히트펌프 용량 산정을 해야 한다. 급배기 환기시스템 장치를 이용하여 주거공간에 급기와 배기 덕트를 통하여 환기를 실시한다. 환기시스템은 제습용 히트 펌프가 내장되어 다습한 공기를 제습시켜 급기 시킨다','김현우,김지훈,이대화,이시훈,이정희,신지민','황용신','00','07','admin','2019-06-07',0,'','/img/project/28a56548-ef38-44b7-a862-8ada52c67f46-s1.PNG,/img/project/40aa7435-b32d-4f8a-a4ff-dfbfb5a33d15-s2.PNG,','/file/project/d76b0ad9-a4fe-4f61-985c-885ff84011ec-건축설비소방과 - 에너지 절감형 제습 환기 시스템.pdf,','','2017-11-01','2017-03-01'),(107,'벨니르','스마트폰 카메라를 이용해 단순히 영상과 음향을 녹화하는 것을 넘어서 공간의 소리를 입체적으로 녹음할 수 있는 이동형 고품질 스테레오 마이크 제작.','김건희,김광식,김수경,유희선,천영주','문건창','00','04','admin','2019-06-07',0,'','/img/project/d28b513f-d02e-4eaa-a863-bba1868806b0-img1.png,','','','2018-09-01','2018-03-01'),(108,'온돌 바닥급기와 스마트 배기','- 바닥스마트급기 : 바닥열을 이용한 급기시스템-   스마트배기 : 스마트팬(욕실겸용환기 배기팬)을 이용 해당 실을 개별 및 집중배기가 가능하도록 구성한 연동제어 환기 방식\r\n제품의 기본 이론은 주거공간의 바닥 축열을 이용하여 최적의 온도로 급기 하는 에너지 절약 환기시스템이다. 본제품의 특징은 에너지 절약적이며, 기존 환기시스템과 비교하여 손쉬운 필터교체가 가능하고, 외기오염 시 창문을 개방할 필요 없이 실내 공기의 환기기능한 시스템으로 그 장치의 크기도 설치 공간이 절약되는 컴팩트한 사이즈이다.','조건희,최병록,정희도,김필호,김현진,홍성찬','김동우','00','07','admin','2019-06-07',0,'','/img/project/df6a5034-f4c3-423d-8d4e-9ad4a98ed32f-s1.PNG,/img/project/1ade6435-3156-4740-a64c-f478d100fe1d-s2.PNG,','','','2017-11-01','2017-03-01'),(109,'Isotropic 무선전력전송 CUBE','최근 들어, 자기 공진 현상을 이용한 중단거리 무선전력전송 기술에 대한 연구가 국내외 산업체, 대학, 연구기관 등에서 활발하게 진행 중이다. 차후 무선전력 전송의 필요성이 크게 증대될 것으로 예상되고 있으며 이에 대한 기술적 성숙으로 인해 무선전력 전송에 관한 기술들과 이를 적용한 제품들이 많이 출시될 것으로 생각되고 있다.\r\n- 무선전력 전송 분야의 폭 넓은 시야 확보 및 구체적 작품 구상 능력 향상\r\n- 실전 교육을 통한 취업시 적응력 향상\r\n- 기업과의 무선 전력 전송 기술연계','강민구,강준송,이민석,김상범,이형래','김형락','00','02','admin','2019-06-07',0,'','/img/project/c9ce1011-9fc9-4932-838e-7329eaa6db65-s1.PNG,/img/project/89a1a952-a218-40e2-a099-9d21ddc0d9e9-s2.PNG,/img/project/24fa7c50-b03c-4047-9f61-f9e27e9cf445-s3.PNG,','/file/project/7d722e92-11c7-426c-9bd7-1c7dab8d85f7-디지털전자과 - Isotropic 무선전력전송 CUBE.pdf,','','2017-10-01','2017-03-01'),(110,'총동문회 홈페이지','대림대학교 총동문회 홈페이지 및 동문 데이터베이스를 개발하여 총동문회에 기증하고 동문정보를 입력하게 하여 궁극적으로 동문회 활성화를 꾀하며, 동문 상호간의 정보를 공유하여 동문회의 역할을 한층 향상시키는 계기가 됨\r\n총동문회 홈페이지 제작은 본 대학 총동문회의 발전과 활성화를 위하여 데이터베이스를 구축하여 동문들이 각자의 정보를 입력함으로써 동문들 간의 정보교류의 장을 통하여 동문회의 발전은 물론이고, 선후배간의 유대관계를 돈독히 함으로써 재학생들의 선후배간의 취업 활성화를 위해서도 필요한 시스템이다.','윤선도,장우찬,김도현,임창원,안예리,임은지','류중경','00','01','admin','2019-06-07',0,'','/img/project/06a78362-970c-4f96-b137-2d9d1e87b6d4-img1.png,/img/project/f4b965ff-afda-4071-a32d-76a289f047d0-img2.png,/img/project/d6ffcd86-3b16-4d26-86f0-06bde5fe66f9-img3.png,','/file/project/b61ff3b4-ffe2-42e9-a42a-56410cb6db88-컴퓨터소프트웨어과 - 총동문회 홈페이지.pdf,','','2017-09-01','2017-03-01'),(111,'비상상황인지 음성인식 CCTV','비명소리와 같은 90dB 이상의 높은 소리를 인식하고 음원 방향으로 카메라를 돌리는 소리인식 CCTV로 소리인식 모듈이 카메라에 탑제되어 있는 일체형 CCTV임\r\n일체형 음성인식CCTV는 CCTV 내부에 음성센서와 마이크로콘트롤러를 탑재하여 음성방향을 인식하여 회전형 카메라를 음원방향으로 회전시켜 확인하고 촬영한다.내부에 마이크로컨트롤러와 CCTV간 RS485통신을 이용하여 카메라의 움직임을 제어하고 개발된 응용소프트웨어는 줌인아웃, 팬, 틸트 등의 세부제어 및 화면저장 등의 기능을 탑재하였다\r\n일체형으로 제작하기 위하여 틀을 3D print로 틀을 제작하여, 그 안에 마이크와 CCTV간의 통신부가 연결하고, 촬영화면과 ptz제어가 가능한 소프트웨어프로그램과 연동을 시켰다','전범석,황인성,최재준,김선인,곽태근','정우석','00','02','admin','2019-06-07',0,'','/img/project/f0fd579a-83e8-4469-a99f-62cad4650704-s1.PNG,/img/project/65bdbc27-5133-4d40-9482-43cf78adbc49-s2.PNG,/img/project/478a4879-7bd4-4b17-87e9-7183696765a3-s3.PNG,/img/project/589f3d29-096a-470e-aea0-8ac292be3e79-s4.PNG,','/file/project/af64790c-fba9-4ef2-b8b3-c102c89b3ffc-디지털전자과 - 비상상황인지 음성인식 CCTV.pdf,','','2017-11-01','2017-03-01'),(112,'스마트센싱 기반 아동청소년맞춤형 성장발달 서비스 개발','- 아동운동/생체정보 측정 스마트센싱 기기 연동\r\n- 전문의료진과 연계하여 아동청소년이 즐겁게 참여하는 맞춤형 성장발달상태 서비스 모델 개발\r\n- 스마트 센싱기술과 연동한 체계적이고 통합적인 아동청소년 맞춤형 건강관리 정보제공 서비스','현병훈,이승환,윤상혁,김은제,하동진,이호성,박경주','김종훈','00','01','admin','2019-06-07',0,'','/img/project/961d40e4-9d8e-4dff-93eb-abe58939a3d6-img1.png,/img/project/75b74f8e-28bf-4061-8250-120453f216cf-img2.png,/img/project/45bb7612-54fc-4eef-ae14-5644dbb5d076-img3.png,','/file/project/ebd2fc7f-9444-4f3f-9eeb-2cbe0d5c2394-컴퓨터소프트웨어과 - 스마트센싱 기반 아동청소년 맞춤형 성장발달 서비스 개발.pdf,','','2017-09-01','2017-03-01'),(113,'소형 광고 시스템 모듈 및응용 소프트웨어 개발','최근 마케팅의 일환으로 버스, 지하철, 건물 등 다양한 광고 시스템들을 쉽게 접할 수 있고 대림대학교 또한 각 건물 마다 TV와 함께 설치되어 있으나 비대한 시스템 부피, 높은 가격, 발열에 의한 화재 등의 문제점이 있다. 따라서, 개발된 작품은 매우 작은 사이즈, 저비용, 가벼운 OS 개발로 발열 최소화 등 다양한 장점 보유하도록 개발하였고 광고 내용을 제어할 수 있는 응용소프트웨어를 함께 제작하였다.','이기중,금동헌,최효준,남일준,박성훈','유병일','00','02','admin','2019-06-07',0,'','/img/project/61a0b337-8aba-4a69-9814-e8e5bf7a8d4a-s1.PNG,/img/project/8b0b2531-785c-4758-b50e-de8006a1b3ee-s2.PNG,/img/project/f5d22d18-26ec-4f81-bd4a-ec77881b9e2e-s3.PNG,','/file/project/3e96c0f8-80d0-41dd-ad9f-60e01907bfab-디지털전자과 - 소형 광고 시스템 모듈 및 응용 소프트웨어 개발.pdf,','','2017-10-01','2017-03-01'),(114,'단렌즈 초점거리 자동측정 장치','단렌즈 초점거리 자동측정 장치는 광학 장비의 부품 렌즈의 품질 검사에 사용될 수 있는 장치이다.','최예린,최성혁,박희용,이진우,배동현,정현준,이선병','김태욱','00','03','2019','2019-06-07',0,'','/img/project/169c2bb4-6acb-43f3-9687-5b8d8967a95e-AutoMeasuringEquipment1.jpg,/img/project/836f2d08-3b5b-40f3-ad6b-80c0153b4e20-AutoMeasuringEquipment2.jpg,','/file/project/f16a99e9-fe8f-4883-8356-79fdb0f9cefc-단렌즈 초점거리 자동측정 장치.pdf,','','2018-09-01','2018-03-01'),(115,'건축현장 공기단축을 위한 골조 패키지시스템 개발','본 작품은 건물의 골조 중 철근콘크리트 구조체의 벽체를 대상으로 골조공사와 마감공사의 작업과정을 줄일 수 있는 방안을 위한 패키지 시스템을 개발하였다. 이를 위하여 기존의 특허정보의 검색을 통한 아이디어의 도출과 참여 학생들과 의 수차례에 걸친 회의, 협약기업 담당자와의 멘토링을 통해 작품의 구현가능성을 검토하고, 도면을 작성하여 작품을 제작 하였다.','전준승,김민수,김진호,김현,고동현,김세영','권오철','00','06','admin','2019-06-07',0,'','/img/project/97cb0126-284f-42e3-a903-48d3a8c1d11d-건축.png,/img/project/490b4bf8-1773-4c37-8fc2-96b111e25d80-건축2.png,','/file/project/b82419b2-4703-4049-ae82-7a3b010374bd-건축과 - 건축현장 공기단축을 위한 골조 패키지시스템 개발.hwp,','','2018-09-01','2018-03-01'),(116,'스마트 국기게양대','국기를 자동으로 게양해주고 비가 오면 자동으로 하강하는 장치\r\n- 현재 지자체별로 가로등에 평균 매 월 3회 이상 다른 기를 게양하고 있음.\r\n- 가로등의 국기게양대에 우천이나 강설 시 비를 맞지 않도록 기를 내려야 하나 현실적으로  어려움이 있어 도로변에 비나 눈을 맞으며 장시간 방치되는 경우가 많음.\r\n- 기존의 제품은 수동형으로 되어 있어 사람이 직접 게양을 해야 함.\r\n- 이러한 불편을 해소하기 위해 여러 특허가 출원되고 있으나 기존 특허는 모두 기어 등을 이용한 기계적인 방식으로 국기를 게양하는 방식으로 여러 문제점들이 발생하여 상용화되지 못하고 있음','손범진,유상정,심훈,진준형','오규태','00','02','admin','2019-06-07',0,'','/img/project/fdc6d1e6-c9d2-4e06-9524-ae174222abe8-s1.PNG,/img/project/aba0a84e-e695-43e3-a46c-46ce0ea8b5e7-s2.PNG,','/file/project/74c37610-c1ed-4425-a0f6-f4967ae65094-디지털전자과 - 스마트 국기게양대.pdf,','','2017-11-01','2017-03-01'),(117,'반도체 장비 recipe 제어 system 구현','본 작품에서는 PC program과 같은 고난이도의 제어가 아닌 가장 기본적인 PLC 방식을 이용하여 recipe를 구현하고 가장 많이 사용되어지는 부품 중 하나인 servo motor를 사용자 입력 방식으로 제어, 작동하는 시스템을 구현하였다. Cleaning 공정 설비 중 single 설비의 chemical을 wafer 전면에 분사하는 swing 노즐의 움직임을 servo motor를 이용, 원점 회귀, 이동 속도, 이동 거리를 사용자가 터치 패널로 직접 제어할 수 있다.','김병수,최성민,최한규,신동진,오예지,이재진,이유정','김광수','00','03','2019','2019-06-07',0,'','/img/project/b070b61b-c4e1-470a-bbb2-cb9d376466f9-RecipeSystem1.jpg,/img/project/cba0d864-c0dc-468e-9d01-32eb2beae997-RecipeSystem2.jpg,','/file/project/74183aeb-8270-489d-9a86-d2654b7dbc8b-반도체 장비 recipe 제어 system 구현.pdf,','','2018-09-01','2018-03-01'),(118,'반려동물 건강 체크를 위한스마트 배변 패드','최근 많은 관심이 있는 반려 동물의 건강관리를 위해, IoT 센서를 이용하여 새로운 서비스를 만들어 내고자 반려동물을 위한 건강 체크 솔루션을 제작<br/>IoT 서비스 이용하고 반려동물의 건강체크 솔루션을 구축하기 위한 하나의 방법으로 스마트 배변 패드를 구현.<br/>배변과 관련된 서비스 기반을 실행, IoT 서비스로 연결하고, 메시지 서비스 및 건강 체크를 위한 서비스를 제공','이인정,김상중,전현민,박호현,고병환,손동민,박재형','박민재','00','01','admin','2019-06-07',0,'','/img/project/7b27cf14-5191-4413-b831-4998cf722d3c-img1.png,/img/project/8041d181-42e5-47c8-8df8-8ec4fad0371c-img2.png,/img/project/9f29a9de-3893-4025-b941-54071dcc48f7-img3.png,','/file/project/c036a777-1b58-48f3-ba53-d58db7dfcaad-컴퓨터소프트웨어과 - 반려동물 건강 체크를 위한 스마트 배변 패드.pdf,','','2017-09-01','2017-03-01'),(119,'스마트 도슨트 시스템','미술관이나 박물관에서 관람객이 작품을 감상할 때 원하는 작품의 위치나 전시장 전체의 지도, 맘에 드는 작품의 자세한 설명이 필요할 때 도슨트 대신 설명을 도와주는 시스템.\r\n현재 기술이 점점 발전하고 있는 시점에서 좀 더 편리하고 실용적인 기술을 만들어 보고자 Beacon을 선정','나경진,정재욱,박도현,신동혁','유영길','00','02','admin','2019-06-07',0,'','/img/project/dcec9f92-bb85-4aa4-8f6d-70240a288445-s1.PNG,/img/project/8941c55d-4600-4c1f-8cb6-38dce15afc6a-s2.PNG,','/file/project/99b98936-f4fc-4216-a120-8e936eb2a8d5-디지털전자과 - 스마트 도슨트 시스템.pdf,','','2017-11-01','2017-03-01'),(120,'회전 판진동형 흡음장치','회전 판진동형 흡음장치를 개발하여 흡음력을 극대화 시켜 공간의 반사음을 최소화 시키며, 적은 면적을 적용함에도 불구하고 흡음이 높은 마감모듈을 보여주는 장치\r\n일반적인 흡음재는 대부분 벽에 고정되어 있어서 음악공연이나 스피치 등 모든 환경에 적응 시킬 수 없는 단점이 존재하였다. 하지만 이러한 흡음재를 회전 시킴으로 인해 각 목적에 맞는 환경에 흡음률을 변화시킬 수 있다.','김도형,김기욱,최하은,임소연,황준희,김진희,이현호','김재평','00','04','admin','2019-06-07',0,'','/img/project/926422d5-7e3d-4dd5-bf26-ecc227d2f26e-img1.png,/img/project/5f78de40-e2fb-4199-85c5-2f2ed8fd0719-img2.png,','/file/project/715e9ebd-cfe8-4fd5-a93e-8b501dffcf2c-방송음향영상과 - 회전 판진동형  흡음장치.pdf,','','2017-09-01','2017-03-01'),(121,'스마트 팩토리를 위한 전원 모니터링 시스템','전원 및 제어용 하네스는 전원장치의 핵심 부품이며, 수십 미터 이상의 길이를 가지는 하네스 1개의 조립 후/조립 중 불량은 장비 신뢰성 및 공정 효율에 큰 영향을 미친다. 이러한 전원장치, 특히 반도체 장비용 전원장비에 특화한 하네스 불량 검사를 자동화하는 것을 목표로 아이디어를 도출, 하네스 검사 시스템을 만들어 보았다. 스마트 모니터링 시스템은 기계의 에너지 소비를 지속적으로 기록 및 검사하는 전력 시스템에서 제조 효율성과 같은 전반적인 감시와 분석이 필요한 공장 모니터링 시스템까지 다종의 형태가 존재한다. 이 중 하나로 제조 단계에서 품질관리를 위한 서브시스템에 집중, 협약기업에서 필요로 하는 하네스의 품질 관리 시스템을 PLC와 휴먼 인터페이스 유닛를 가지고 제작','김재준,조성민,전계근,최용현,모재연,이성훈','최동영','00','03','admin','2019-06-07',0,'','/img/project/9c61fd76-fcac-40a3-8713-32501c9733b5-img1.png,/img/project/432ccdda-c74c-4168-9dfa-9eb22bf6dec7-img2.png,','/file/project/3f9c8f04-99fc-401d-8f98-ecb3bb0b1141-메카트로닉스 - 스마트 팩토링을 위한 전원 모니터링 시스템.pdf,','','2017-09-01','2017-03-01'),(122,'반도체 장비의 wet nozzle tilting system','현재 반도체 생산라인에 사용되고 있는 반도체 wet 장비 중 대부분이 Single 설비로 wafer 한 장이 순차적으로 진행되고 있다. Single 설비는 아래 그림 1에 보이는 바와 같이 wafer가 회전하는 가운데 Swing 또는 Fixed Nozzle에서 케미컬을 분사하여 wafer 표면에서 특정 물질의 식각 또는 particle을 제거하는 설비이다.','양시헌,양기영,오인규,신동권,김정훈,박용경,정종일','양경택','00','03','admin','2019-06-07',0,'','/img/project/01fc2caa-4427-4ad6-a55f-dff50671a670-img1.png,/img/project/d25af62a-1eb5-4fae-ab11-3d638cfbd3c5-img2.png,/img/project/b7ca23a4-ab86-4316-8675-9037ae10fdfe-img3.png,','/file/project/58f929d9-354c-49b7-92e1-9284aa62e68c-메카트로닉스 - 반도체 장비의 wet nozzle tilting system.pdf,','','2017-09-01','2017-03-01'),(123,'긴급 구호 Shelter','재해를 입은 이재민을 위한 긴급 구호 주택 시스템 개발 \r\n대공간 구조시스템을 응용하여 이동과 조립이 가능한 구조시스템 개발','박새영,서지인,박수빈,심종민,조성래','장명호','00','06','admin','2019-06-07',0,'','/img/project/e7cd2e0c-1911-4aca-b8a8-72b92a984d75-건축과.png,/img/project/12d168d6-167e-4abe-bf98-c409807a1b5f-건축과2.png,','/file/project/22ee5576-5676-4ff3-a769-d90d0fd6551c-건축과 - 긴급구조 Shelter.pdf,','','2018-09-01','2018-03-01'),(124,'고출력 광학 부품','고출력 광섬유 레이저에 사용되는 펌프 콤바이너와 CPS의 수냉식 기구부\r\n고출력 광섬유 레이저에서 높은 출력을 얻기 위해서는 많은 열이 발생하게 된다. 이러한 열을 효율적으로 처리하기 위해 수냉식 기구부를 설계하였다. 현재는 공랭식으로 파이버가 쿨링 플레이트 위에 얹어지는 형태이고 수냉식은 파이버에 바로 물로 식히는 방법입니다. 이러한 수냉식 기구부는 펌프 콤바이너와 CPS에서 발열되는 온도를 효율적으로 냉각시켜 주는 장치로 이를 통해 더 높은 파워의 레이저를 구현할 수 있다','김승민,김영훈,김종혁,박흥열,원산해,정시웅,안광훈','안영기','00','03','admin','2019-06-07',0,'','/img/project/4a485a47-f271-49ba-8e9c-7c795c954255-img1.png,/img/project/d784b705-f6af-48a4-808e-27e2023238a4-img2.png,/img/project/75f4971c-37c6-4714-b01a-2b46f172236c-img3.png,','/file/project/db42b8cb-f8f1-4124-9525-01666a48a9d0-메카트로닉스 - 고출력 광학 부품.pdf,','','2017-09-01','2017-03-01'),(125,'사용자 중심 주소형 P형 자동화재탐지설비','저층 건축물에 일반적으로 사용되고 있는 P형 자동화재탐지설비의 경우 화재위치 표시를 하나의 경계구역인 600m2를 표시하고 있어, 화재발생 장소를 정확하게 파악하는데 어려움이 있다. 화재초기 및 비화재보시 조기에 발견 및 조치를 할 수 있는 시스템이다.','이근효,최용선,서원덕,조영재,이원길,박재흥,강원진,김영수','옥경재','00','07','admin','2019-06-07',0,'','/img/project/68e80dfb-f3c3-4315-aeec-8134eda14d43-도면.png,','/file/project/4c45d0e0-9712-402c-8775-8c603be6588c-건축설비소방과 - 사용자 중심 주소형 P형 자동화재탐지설비.pdf,','','2018-09-01','2018-03-01'),(126,'스마트 시스템 분배기','1. 쾌적한 실내 환경 및 에너지 절약을 위하여 난방배관을 실별로 구성하고 메인밸브와 존별 밸브를 이용하여 온수 유량을 조절하여 공급하는 시스템 분배기입니다. \r\n2. 실별로 비례제어 밸브를 적용하여 난방 온수코일의 길이 차이로 인한 마찰손실의 증가로 유량부족이 우려되는 실을 설계대로 유량을 확보 할 수 있도록 제작된 분배기입니다.','옥원무,민성호,임재현,유성현,이서진,양인규,허성진','오병길','00','07','admin','2019-06-07',0,'','/img/project/0f2ffbe8-42d6-419b-a11f-6bf2eed08fca-설비.png,/img/project/9b90f2b2-1641-49a1-9396-e80a1ff7479b-설비2.png,','/file/project/58a248e5-fd76-4c44-ac71-f78005bde4cb-건축설비소방과 - 스마트 시스템 분배기.pdf,','','2018-09-01','2018-03-01'),(127,'실내 공기 질 모니터링 장치','전열교환은 열 회수 환기방법의 하나로 환기시 배출되는 공기 중의 에너지를 도입외기에 전달하여 실내온도 및 습도를 유지시키는 가장 이상적인 환기 시스템으로서 환기시 버려지는 열을 회수할 수 있는 환기장치를 말합니다.','오지훈,유상준,김민재,박진원,이준호,심기민,윤민욱,전미리','황용신','00','07','admin','2019-06-07',0,'','/img/project/755f5ae7-599b-4c46-9e6c-777daab3839f-플로우.png,/img/project/290c3732-392d-4327-bc9a-87c7f7c65c2a-플로우2.png,','/file/project/6ea5569a-1b79-40db-87b9-34b9317630fc-건축설비소방과 - 실내 공기 질 모니터링 장치.pdf,','','2018-09-01','2018-03-01'),(128,'쾌적한 실내 환경을 위한 고효율 하이브리드 제습냉방 환기시스템','2004년 5월 이후 공기질관리법이 시행되었다. 신축 공동주택에 대한 실내 공기질의 기준이 제시되고, 환기 설비를 의무화 하고 있다.<br/>따라서 공조설비의 환기 요규량의 증가에 따라 더욱 많은 외기 공기의 실내로의 도입이 필수적이다.<br/>하지만 미세먼지, 황사 등 실외 공기의 질이 나빠 공기를 바로 사용 불가하며 온도조절에 의해 실외 공기를 바로 유입할 시 많은 에너지 손실을 가져오므로 환기시 에너지 회수를 해야만 에너지를 아낄 수 있다.<br/>에너지를 아끼며 환기를 해주기 위해서 기존에는 필터식 전열교환기를 널리 사용 하였으나, 전열 교환기의 재질이 다량의 습기나 결로에 취약성을 갖기 때문에 핵심 부품인 공기 필터와 전열 교환기를 주기적으로 교체를 해주어야 한다. <br/>현재 환기에 의한 잠열 냉방 용량이 크게 증대 되므로 이를 처리하기 위한 새로운 에너지 절약형 공조시스템에 관심이 집중되고 있다. <br/>따라서 공기 중 포함되 어 있는 습도의 효율적인 처리 문제는 에너지 절약과 밀접한 관계에 있으므로, 내구성을 겸비한 에너지 소모가 적은 제습 환기시스템의 개발 이 시급한 실정이다.','변규태,최윤서,윤상현,신원진,권우석,조경은,류예빈','김동우','00','07','admin','2019-06-07',0,'','/img/project/3d95a695-1b5b-4bbf-bb06-dc133e761b6a-그림.png,/img/project/73d99365-5591-470b-b082-f0eeade104c8-그림2.png,','/file/project/10206587-c2c1-4c86-ac0c-c56b56fa9b09-건축설비소방과 - 쾌적한 실내 환경을 위한 고효율 하이브리드 제습냉방 환기시스템.pdf,','','2018-09-01','2018-03-01'),(129,'스마트 약통','약 또는 영양제를 주기적으로 복용하는 사람들이 많아지는 시대입니다. <br/>IOT 기술을 도입하여 약의 복용을 기계적으로 도와 편의성과 복용 순응도를 높이고자 하는 약통을 만들어 보았습니다.','이상진,이성재,황인성','안창호','00','02','admin','2019-06-07',0,'','/img/project/2f63b5ec-56cb-4438-a40a-260ee2541990-약통.png,/img/project/123c37fa-ab18-4c0d-8b2e-65475735d88f-약통2.png,','/file/project/354ef173-ac5e-4012-aeb0-ee1b9d5ec5c3-디지털전자과 - 스마트 약통.pdf,','','2018-09-01','2018-03-01');
/*!40000 ALTER TABLE `projectboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authority` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'anonymous',
  `mail` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hp` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isAccountNonExpired` tinyint(4) NOT NULL DEFAULT '0',
  `isAccountNonLocked` tinyint(4) NOT NULL DEFAULT '0',
  `isCredentialsNonExpired` tinyint(4) NOT NULL DEFAULT '0',
  `isEnabled` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('201530207','$2a$10$oSJoYON9X2PdHoRDOrXVAeGesiUtNY8/joxfe3WcRAtsUxIX6sbTK','김영수','user','kys17326@naver.com','010-3198-7632',1,1,1,1),('2016','$2a$10$uX8j76rsiEv90lVK8EyrRuk.Mv7fsEhYKgA3xwDRyUo8JRmoaS5cS','십육년','none_auth','gkrgrk@naver.com','010-1234-1234',1,1,1,1),('2019','$2a$10$uBQd8uj.Jt/GFiIrm/71b.AWowtE9A58AlUlk3yrcNhtR/sWBcf0K','TestID','user','dytjq0805@naver.com','010-4852-3074',1,1,1,1),('2tester','$2a$10$aiMol2ytCrLSuVOK93yDiu1ySmKsEiYNrzJMSXJaa.NVGOzFupKVe','테스터','none_auth','ss@nae.com','010-1111-1111',1,1,1,1),('admin','$2a$10$Qn6REoJHWgOmvQYgsJa5wO2TE.62iXbInLND5AZUCb2Ugp3fiTrqO','관리자','admin','gkrgrk@gmail.com','01086313655',1,1,1,1),('lastTest','$2a$10$k7AoTG3CetDFp2wRzx7LDOWQFXfQumpAjpqSDaPJG0VNx4ixPScay','망함','none_auth','te00012345@naver.com','010-2233-0000',1,1,1,1),('tester','$2a$10$gbdJRcxG290hZO1ah96Uh.GsZ8/H7M/U8Rnm7PANdhqShLvKWTflG','군대리아','user','test@naver.com','01236547',1,1,1,1),('tester6','$2a$10$jyA1Ognk9NdjlEDWdO11F.nzAFHHHTgmSAfFJdZCFrc7jJyzPjKjy','ww','user','ww@ww.wwa','010-4852-3077',1,1,1,1);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-10 14:54:52
