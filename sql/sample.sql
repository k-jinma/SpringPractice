-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: sample
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'カテゴリID',
  `name` varchar(255) DEFAULT NULL COMMENT 'カテゴリ名',
  `description` varchar(255) DEFAULT NULL COMMENT 'カテゴリ概要',
  `created_by` varchar(255) NOT NULL COMMENT '作成者',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_by` varchar(255) NOT NULL COMMENT '更新者',
  `updated_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='カテゴリ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'食品','カテゴリ1の説明','ユーザ1','2023-09-29 08:00:00','ユーザ2','2023-09-29 08:30:00'),(2,'飲料','カテゴリ2の説明','ユーザ1','2023-09-29 09:00:00','ユーザ2','2023-09-29 09:30:00'),(3,'冷凍食品','カテゴリ3の説明','ユーザ1','2023-09-29 10:00:00','ユーザ2','2023-09-29 10:30:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_destinations`
--

DROP TABLE IF EXISTS `customer_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_destinations` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '顧客配送先ID',
  `customer_id` int NOT NULL COMMENT '顧客ID',
  `name` varchar(255) DEFAULT NULL COMMENT '顧客配送先名',
  `postal_code` varchar(14) DEFAULT NULL COMMENT '郵便番号',
  `address` varchar(255) DEFAULT NULL COMMENT '住所',
  `phone_number` varchar(14) DEFAULT NULL COMMENT '連絡先',
  `created_by` varchar(255) NOT NULL COMMENT '作成者',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_by` varchar(255) NOT NULL COMMENT '更新者',
  `updated_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='顧客配送先情報';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_destinations`
--

LOCK TABLES `customer_destinations` WRITE;
/*!40000 ALTER TABLE `customer_destinations` DISABLE KEYS */;
INSERT INTO `customer_destinations` VALUES (1,1,'東京本社','1234567','住所1','111-2222-3333','ユーザ1','2023-09-29 08:00:00','ユーザ2','2023-09-29 08:30:00'),(2,1,'大阪支社','2345678','住所2','222-3333-4444','ユーザ1','2023-09-29 09:00:00','ユーザ2','2023-09-29 09:30:00'),(3,3,'沖縄営業所','3456789','住所3','333-4444-5555','ユーザ1','2023-09-29 10:00:00','ユーザ2','2023-09-29 10:30:00'),(4,2,'本社','4567890','住所4','444-5555-6666','ユーザ1','2023-09-29 00:00:00','ユーザ2','2023-09-29 00:00:00');
/*!40000 ALTER TABLE `customer_destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_details` (
  `customer_id` int NOT NULL COMMENT '顧客ID',
  `contract_name` varchar(100) DEFAULT NULL COMMENT '担当者名',
  `billing_type` varchar(100) DEFAULT NULL COMMENT '請求種類',
  `contract_start_date` datetime DEFAULT NULL COMMENT '契約開始日',
  `contract_end_date` datetime DEFAULT NULL COMMENT '契約終了日',
  `description` varchar(100) DEFAULT NULL COMMENT '備考',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='顧客詳細';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` VALUES (1,'黒井清男','credit','2024-03-27 11:24:11','2024-03-27 11:24:11',NULL),(2,'風岡園果','debit','2024-03-27 11:24:11','2024-03-27 11:24:11',NULL),(3,'塩本恭彦','credit','2024-03-27 11:24:11','2024-03-27 11:24:11',NULL);
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '顧客ID',
  `name` varchar(255) DEFAULT NULL COMMENT '顧客名',
  `postal_code` varchar(14) DEFAULT NULL COMMENT '郵便番号',
  `address` varchar(255) DEFAULT NULL COMMENT '住所',
  `phone_number` varchar(14) DEFAULT NULL COMMENT '連絡先',
  `created_by` varchar(255) NOT NULL COMMENT '作成者',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_by` varchar(255) NOT NULL COMMENT '更新者',
  `updated_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='顧客情報';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'グローブテック・ソリューションズ','123-4567','住所1','111-2222-3333','ユーザ1','2023-09-29 08:00:00','ユーザ2','2023-09-29 08:30:00'),(2,'インフィニティ・フューチャー・エレクトロニクス','234-5678','住所2','222-3333-4444','ユーザ1','2023-09-29 09:00:00','ユーザ2','2023-09-29 09:30:00'),(3,'エコシステム・デバイス・ソリューションズ','345-6789','住所3','333-4444-5555','ユーザ1','2023-09-29 10:00:00','ユーザ2','2023-09-29 10:30:00');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_histories`
--

DROP TABLE IF EXISTS `inbound_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbound_histories` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '入荷履歴ID',
  `item_id` int NOT NULL COMMENT '商品ID',
  `supplier_id` int NOT NULL COMMENT '入荷先情報ID',
  `quantity` int DEFAULT NULL COMMENT '数量',
  `expected_date` datetime DEFAULT NULL COMMENT '入荷予定日',
  `status` int DEFAULT NULL COMMENT '入荷ステータス',
  `created_by` varchar(255) NOT NULL COMMENT '作成者',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_by` varchar(255) NOT NULL COMMENT '更新者',
  `updated_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='入荷履歴';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_histories`
--

LOCK TABLES `inbound_histories` WRITE;
/*!40000 ALTER TABLE `inbound_histories` DISABLE KEYS */;
INSERT INTO `inbound_histories` VALUES (1,1,1,10,'2024-01-01 00:00:00',1,'ユーザ1','2024-01-01 08:00:00','ユーザ2','2024-01-01 08:30:00'),(2,2,1,5,'2024-04-01 00:00:00',2,'ユーザ1','2024-01-01 09:00:00','ユーザ2','2024-01-01 09:30:00'),(3,3,2,20,'2024-05-01 00:00:00',1,'ユーザ1','2024-01-02 09:00:00','ユーザ2','2024-01-02 09:30:00');
/*!40000 ALTER TABLE `inbound_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `category_id` int DEFAULT NULL COMMENT 'カテゴリID',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名',
  `price` int DEFAULT NULL COMMENT '価格',
  `size` int DEFAULT NULL COMMENT 'サイズ',
  `created_by` varchar(255) NOT NULL COMMENT '作成者',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_by` varchar(255) NOT NULL COMMENT '更新者',
  `updated_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,'商品1',1000,1,'ユーザ1','2023-09-29 08:00:00','ユーザ2','2023-09-29 08:30:00'),(2,2,'商品2',2000,3,'ユーザ1','2023-09-29 09:00:00','ユーザ2','2023-09-29 09:30:00'),(3,1,'商品3',1500,2,'ユーザ1','2023-09-29 10:00:00','ユーザ2','2023-09-29 10:30:00');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_histories`
--

DROP TABLE IF EXISTS `outbound_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbound_histories` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '出荷履歴ID',
  `item_id` int DEFAULT NULL COMMENT '商品ID',
  `quantity` int DEFAULT NULL COMMENT '数量',
  `customer_destination_id` int DEFAULT NULL COMMENT '顧客配送先ID',
  `expected_date` datetime NOT NULL COMMENT '出荷予定日付',
  `status` int DEFAULT NULL COMMENT '出荷ステータス',
  `created_by` varchar(255) NOT NULL COMMENT '作成者',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_by` varchar(255) NOT NULL COMMENT '更新者',
  `updated_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='出荷履歴';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_histories`
--

LOCK TABLES `outbound_histories` WRITE;
/*!40000 ALTER TABLE `outbound_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbound_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '入荷先ID',
  `name` varchar(255) DEFAULT NULL COMMENT '入荷先名',
  `postal_code` varchar(14) DEFAULT NULL COMMENT '郵便番号',
  `address` varchar(255) DEFAULT NULL COMMENT '住所',
  `phone_number` varchar(14) DEFAULT NULL COMMENT '連絡先',
  `created_by` varchar(255) NOT NULL COMMENT '作成者',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_by` varchar(255) NOT NULL COMMENT '更新者',
  `updated_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='入荷先情報';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'入荷先1','1234567','住所1','111-2222-3333','ユーザ1','2023-09-29 08:00:00','ユーザ2','2023-09-29 08:30:00'),(2,'入荷先2','2345678','住所2','222-3333-4444','ユーザ1','2023-09-29 09:00:00','ユーザ2','2023-09-29 09:30:00'),(3,'入荷先3','3456789','住所3','333-4444-5555','ユーザ1','2023-09-29 10:00:00','ユーザ2','2023-09-29 10:30:00');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ユーザーID',
  `last_name` varchar(255) DEFAULT NULL COMMENT '名字',
  `first_name` varchar(255) DEFAULT NULL COMMENT '名前',
  `last_name_kana` varchar(255) DEFAULT NULL COMMENT '名字(ふりがな)',
  `first_name_kana` varchar(255) DEFAULT NULL COMMENT '名前(ふりがな)',
  `age` int DEFAULT NULL COMMENT '年齢',
  `phone_number` varchar(15) DEFAULT NULL COMMENT '電話番号',
  `postal_code` varchar(15) DEFAULT NULL COMMENT '郵便番号',
  `address` varchar(255) DEFAULT NULL COMMENT '住所',
  `created_by` varchar(255) NOT NULL COMMENT '作成者',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_by` varchar(255) NOT NULL COMMENT '更新者',
  `updated_at` datetime NOT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='ユーザー';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'佐藤','太郎','さとう','たろう',18,'000-7576-3042','123-4567','東京都渋谷区渋谷1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(2,'鈴木','由美子','すずき','ゆみこ',21,'000-6020-3902','567-8901','大阪府大阪市中央区大手町4-5-6','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(3,'高橋','健太','たかはし','けんた',67,'000-1209-3166','987-6543','北海道札幌市中央区北1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(4,'田中','美加子','たなか','みかこ',40,'000-6971-1259','345-6789','神奈川県横浜市西区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(5,'渡辺','直樹','わたなべ','なおき',42,'000-8018-5499','234-5678','京都府京都市東山区東1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(6,'伊藤','恵美','いとう','えみ',56,'000-2314-1824','678-9012','兵庫県神戸市中央区北1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(7,'山本','大輔','やまもと','だいすけ',40,'000-7167-5696','456-7890','広島県広島市南区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(8,'中村','さゆり','なかむら','さゆり',17,'000-3927-4434','789-0123','福岡県福岡市博多区博多1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(9,'小林','勇太','こばやし','ゆうた',91,'000-2740-0491','890-1234','宮城県仙台市青葉区青葉1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(10,'加藤','真理子','かとう','まりこ',35,'000-5369-1473','123-8901','愛知県名古屋市中区栄1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(11,'斎藤','雅彦','さいとう','みやひこ',39,'000-6794-0853','345-6789','大分県大分市大手町1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(12,'松本','千鶴','まつもと','ちづる',71,'000-1010-8185','678-1234','京都府京都市中京区中1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(13,'井上','健二','いのうえ','けんじ',52,'000-8603-4488','456-7890','北海道札幌市西区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(14,'木村','佳奈','きむら','かな',65,'000-3915-5950','234-5678','福岡県福岡市博多区博多1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(15,'清水','良太','しみず','りょうた',78,'000-9940-4454','890-1234','東京都新宿区新宿1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(16,'林','綾香','はやし','あやか',60,'000-0477-5503','123-4567','大阪府大阪市中央区大手前1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(17,'山田','啓介','やまだ','けいすけ',57,'000-0997-5383','567-8901','神奈川県横浜市西区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(18,'佐々木','真帆','ささき','まほ',15,'000-1323-1043','987-6543','京都府京都市東山区東1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(19,'荒木','勉','あらき','つとむ',36,'000-7810-0612','345-6789','北海道札幌市中央区北1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(20,'佐野','愛美','さの','まなみ',23,'000-3464-3803','234-5678','広島県広島市南区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(21,'杉山','裕子','すぎやま','ゆうこ',61,'000-8494-9214','678-9012','大阪府大阪市中央区大手前1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(22,'阿部','和也','あべ','かずや',41,'000-2232-3594','456-7890','福岡県福岡市博多区博多1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(23,'中島','真紀','なかじま','まき',67,'000-7632-6505','789-0123','仙台市青葉区青葉1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(24,'大野','健一','おおの','けんいち',71,'000-0863-4641','890-1234','札幌市中央区北1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(25,'藤田','桜','ふじた','さくら',56,'000-3122-6973','123-8901','名古屋市中区栄1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(26,'岡田','浩介','おかだ','ひろすけ',39,'000-7340-3798','345-6789','大分県大分市大手町1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(27,'関根','朋子','せきね','ともこ',63,'000-8383-5832','678-1234','京都府京都市中京区中1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(28,'西村','武','にしむら','たけし',67,'000-2265-4661','456-7890','札幌市西区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(29,'前田','美佳','まえだ','みか',24,'000-7205-6588','234-5678','福岡県福岡市博多区博多1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(30,'高田','明子','たかだ','あきこ',58,'000-5459-5660','890-1234','東京都新宿区新宿1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(31,'三浦','信夫','みうら','のぶお',71,'000-3843-1802','123-4567','大阪府大阪市中央区大手前1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(32,'岡本','京子','おかもと','きょうこ',40,'000-3690-1446','567-8901','神奈川県横浜市西区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(33,'金子','勝也','かねこ','まさや',16,'000-9976-8844','987-6543','京都府京都市東山区東1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(34,'村上','美香','むらかみ','みか',23,'000-8933-9265','345-6789','北海道札幌市中央区北1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(35,'吉田','大輝','よしだ','だいき',19,'000-1566-2030','234-5678','広島県広島市南区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(36,'川口','望','かわぐち','のぞむ',64,'000-0695-5089','678-9012','大阪府大阪市中央区大手前1','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(37,'小川','茜','おがわ','あかね',28,'000-0355-6046','456-7890','福岡県福岡市博多区博多1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(38,'石川','健司','いしかわ','けんじ',19,'000-0988-9887','789-0123','仙台市青葉区青葉1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(39,'佐久間','真琴','さくま','まこと',19,'000-9694-6073','890-1234','札幌市中央区北1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(40,'酒井','雄一','さかい','ゆういち',72,'000-9904-2247','123-8901','名古屋市中区栄1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(41,'永井','由香','ながい','ゆか',62,'000-5875-9563','345-6789','大分県大分市大手町1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(42,'菅原','裕美子','すがわら','ゆみこ',72,'000-6265-1491','678-1234','京都府京都市中京区中1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(43,'坂本','正太郎','さかもと','しょうたろう',26,'000-4177-2353','456-7890','札幌市西区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(44,'大塚','亜希子','おおつか','あきこ',37,'000-5961-7273','234-5678','福岡県福岡市博多区博多1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(45,'松田','雄大','まつだ','ゆうだい',26,'000-3254-1111','890-1234','東京都新宿区新宿1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(46,'木下','真緒','きのした','まお',13,'000-1202-1494','123-4567','大阪府大阪市中央区大手前1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(47,'東','美咲','あずま','みさき',53,'000-2888-6290','567-8901','神奈川県横浜市西区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(48,'西田','太一','にしだ','たいち',60,'000-5208-3523','987-6543','京都府京都市東山区東1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(49,'堀','未来','ほり','みらい',65,'000-5810-1703','345-6789','北海道札幌市中央区北1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(50,'竹内','和之','たけうち','かずゆき',18,'000-4971-1490','234-5678','広島県広島市南区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(51,'藤井','祐子','ふじい','ゆうこ',34,'000-8396-1403','678-9012','大阪府大阪市中央区大手前1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(52,'高木','大介','たかぎ','だいすけ',69,'000-0293-0949','456-7890','福岡県福岡市博多区博多1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(53,'佐伯','朋美','さえき','ともみ',71,'000-0546-5138','789-0123','仙台市青葉区青葉1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(54,'中川','拓也','なかがわ','たくや',78,'000-7717-8064','890-1234','札幌市中央区北1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(55,'鶴田','愛菜','つるた','あいな',27,'000-4643-4229','123-8901','名古屋市中区栄1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(56,'堀田','隆','ほった','たかし',29,'000-7997-3756','345-6789','大分県大分市大手町1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(57,'橋本','茜','はしもと','あかね',29,'000-1912-0828','678-1234','京都府京都市中京区中1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(58,'谷口','修','たにぐち','おさむ',36,'000-5624-6543','456-7890','札幌市西区南1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(59,'村田','千里','むらた','ちさと',44,'000-9019-1691','234-5678','福岡県福岡市博多区博多1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56'),(60,'福田','優樹','ふくだ','ゆうき',36,'000-7068-8090','890-1234','東京都新宿区新宿1-2-3','admin','2023-09-29 03:42:56','admin','2023-09-29 03:42:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28  2:09:22
