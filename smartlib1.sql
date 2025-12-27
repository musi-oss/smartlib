/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 5.7.44 : Database - smart_library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smart_library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `smart_library`;

/*Table structure for table `blockchain_record` */

DROP TABLE IF EXISTS `blockchain_record`;

CREATE TABLE `blockchain_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易ID',
  `block_hash` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_hash` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易类型：BORROW/RETURN/TRANSFER/BUY',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `book_id` int(11) NOT NULL COMMENT '图书ID',
  `data` text COLLATE utf8mb4_unicode_ci COMMENT '交易详情JSON',
  `timestamp` bigint(20) NOT NULL COMMENT '时间戳',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'CONFIRMED' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_book_id` (`book_id`),
  KEY `idx_transaction_id` (`transaction_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `blockchain_record` */

insert  into `blockchain_record`(`id`,`transaction_id`,`block_hash`,`previous_hash`,`transaction_type`,`user_id`,`book_id`,`data`,`timestamp`,`create_time`,`status`) values 
(1,'GENESIS_BLOCK','0000000000000000000000000000000000000000000000000000000000000000','0','GENESIS',0,0,'初始区块',1704067200000,'2025-12-20 18:48:25','CONFIRMED'),
(8,'BORROW-a8a18e39','bdb97922b737028f510bc1be14d9c40b50c377a7942ea8161947c390ed4c9350','0000000000000000000000000000000000000000000000000000000000000000','BORROW',1,1,'{\"borrowDays\":30,\"fee\":0,\"type\":\"borrow\",\"userId\":1,\"bookId\":1,\"bookTitle\":\"Spring Boot实战\",\"timestamp\":1766233795437}',1766233795454,'2025-12-20 20:29:55','CONFIRMED'),
(9,'BORROW-4977aa37','5fcd787bb6d3518fc8e0616b4fbe639dda8477eb548c0b787c72d4e69756fd4e','bdb97922b737028f510bc1be14d9c40b50c377a7942ea8161947c390ed4c9350','BORROW',1,1,'{\"borrowDays\":30,\"fee\":0,\"type\":\"borrow\",\"userId\":1,\"bookId\":1,\"bookTitle\":\"Spring Boot实战\",\"timestamp\":1766236435835}',1766236435841,'2025-12-20 21:13:55','CONFIRMED'),
(10,'BORROW-12e90164','71444c2da20fbed2e151c6cb00801f93e7e9bbb90605404c5f29004734d9e412','5fcd787bb6d3518fc8e0616b4fbe639dda8477eb548c0b787c72d4e69756fd4e','BORROW',1,1,'{\"borrowDays\":30,\"fee\":0,\"type\":\"borrow\",\"userId\":1,\"bookId\":1,\"bookTitle\":\"Spring Boot实战\",\"timestamp\":1766236607241}',1766236607243,'2025-12-20 21:16:47','CONFIRMED'),
(11,'RETURN-2ebbfe59','09fb91870da0924d8638ce9d69803597e5ee4f01f60252de57dc08dcaf8af53c','71444c2da20fbed2e151c6cb00801f93e7e9bbb90605404c5f29004734d9e412','RETURN',1,1,'{\"condition\":\"完好\",\"penalty\":0,\"type\":\"return\",\"userId\":1,\"bookId\":1,\"bookTitle\":\"Spring Boot实战\",\"timestamp\":1766236623271}',1766236623273,'2025-12-20 21:17:03','CONFIRMED'),
(12,'TRANSFER-46e08107','59215099bf00c14508004a2cf1039d4e49ab2e390a04d36206ef8c35b0d2ab1b','09fb91870da0924d8638ce9d69803597e5ee4f01f60252de57dc08dcaf8af53c','TRANSFER',1,1,'{\"fromUserId\":1,\"price\":0.0,\"type\":\"transfer\",\"toUserId\":2,\"bookId\":1,\"bookTitle\":\"Spring Boot实战\",\"timestamp\":1766236660324}',1766236660329,'2025-12-20 21:17:40','CONFIRMED'),
(13,'TRANSFER-41eb59d2','9fafde91543dd87a1f3bc71ab19ab61765dab1507106d1046b06b09eee1597f3','59215099bf00c14508004a2cf1039d4e49ab2e390a04d36206ef8c35b0d2ab1b','TRANSFER',1,1,'{\"fromUserId\":1,\"price\":50.0,\"type\":\"transfer\",\"toUserId\":2,\"bookId\":1,\"bookTitle\":\"Spring Boot实战\",\"timestamp\":1766236715295}',1766236715296,'2025-12-20 21:18:35','CONFIRMED'),
(14,'TRANSFER-4f5e2b8a','9b56be556dabc942884d598020dc1afe77f4bc0ed0c5e6b5cbe0991afaff26cc','9fafde91543dd87a1f3bc71ab19ab61765dab1507106d1046b06b09eee1597f3','TRANSFER',1,1,'{\"fromUserId\":1,\"price\":50.0,\"type\":\"transfer\",\"toUserId\":2,\"bookId\":1,\"bookTitle\":\"Spring Boot实战\",\"timestamp\":1766236724883}',1766236724885,'2025-12-20 21:18:44','CONFIRMED');

/*Table structure for table `blockchain_record_backup` */

DROP TABLE IF EXISTS `blockchain_record_backup`;

CREATE TABLE `blockchain_record_backup` (
  `id` int(11) NOT NULL DEFAULT '0',
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易ID',
  `block_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '当前区块哈希',
  `previous_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '前一个区块哈希',
  `transaction_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易类型：BORROW/RETURN/TRANSFER/BUY',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `book_id` int(11) NOT NULL COMMENT '图书ID',
  `data` text COLLATE utf8mb4_unicode_ci COMMENT '交易详情JSON',
  `timestamp` bigint(20) NOT NULL COMMENT '时间戳',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'CONFIRMED' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `blockchain_record_backup` */

insert  into `blockchain_record_backup`(`id`,`transaction_id`,`block_hash`,`previous_hash`,`transaction_type`,`user_id`,`book_id`,`data`,`timestamp`,`create_time`,`status`) values 
(1,'GENESIS_BLOCK','0000000000000000000000000000000000000000000000000000000000000000','0','GENESIS',0,0,'初始区块',1704067200000,'2025-12-20 18:48:25','CONFIRMED'),
(2,'BORROW-c314dad7','c12a6b153f43c8245889499f2718f4a5072956f58c0c4f7cdfee7fc31b00482b','0000000000000000000000000000000000000000000000000000000000000000','BORROW',1,1,'{\"borrowDays\":30,\"fee\":0,\"type\":\"borrow\",\"userId\":1,\"bookId\":1,\"bookTitle\":\"测试图书\",\"timestamp\":1766229355330}',1766229355343,'2025-12-20 19:15:55','CONFIRMED'),
(3,'BORROW-1d1ae3a9','b269354c8d0ba646c9d1a96f65534165ecd59a3373167555f62510ca266a61ff','c12a6b153f43c8245889499f2718f4a5072956f58c0c4f7cdfee7fc31b00482b','BORROW',1,1,'{\"borrowDays\":30,\"fee\":0,\"type\":\"borrow\",\"userId\":1,\"bookId\":1,\"bookTitle\":\"测试图书\",\"timestamp\":1766230953697}',1766230953697,'2025-12-20 19:42:33','CONFIRMED'),
(4,'BORROW-164318b1','38a04ae0a57354de3b2c81c51eef9be9ee09b1207239731a971d300f1d66d0f3','b269354c8d0ba646c9d1a96f65534165ecd59a3373167555f62510ca266a61ff','BORROW',1,1,'{\"borrowDays\":30,\"fee\":0,\"type\":\"borrow\",\"userId\":1,\"bookId\":1,\"bookTitle\":\"Spring Boot实战\",\"timestamp\":1766230953740}',1766230953743,'2025-12-20 19:42:33','CONFIRMED'),
(5,'RETURN-a22448be','eccfe4a2ca801e66b04a444f96472d30077a24649b7bf5916b12ed1c0646d11e','38a04ae0a57354de3b2c81c51eef9be9ee09b1207239731a971d300f1d66d0f3','RETURN',1,1,'{\"condition\":\"完好\",\"penalty\":0,\"type\":\"return\",\"userId\":1,\"bookId\":1,\"bookTitle\":\"Spring Boot实战\",\"timestamp\":1766230953764}',1766230953767,'2025-12-20 19:42:33','CONFIRMED'),
(6,'TRANSFER-dc2abe74','fc09efa2b40611c9d4720b9f7768dc4c57b8d4138743b9c571c5fd69e05972e5','eccfe4a2ca801e66b04a444f96472d30077a24649b7bf5916b12ed1c0646d11e','TRANSFER',1,1,'{\"fromUserId\":1,\"price\":0.0,\"type\":\"transfer\",\"toUserId\":2,\"bookId\":1,\"bookTitle\":\"Spring Boot实战\",\"timestamp\":1766230953784}',1766230953790,'2025-12-20 19:42:33','CONFIRMED'),
(7,'RETURN-8f0c7230','799e30dbeee8526c3ed4cbd54eeb693f638a8b70bdee1764bb9dc867ce75f9ef','fc09efa2b40611c9d4720b9f7768dc4c57b8d4138743b9c571c5fd69e05972e5','RETURN',1,1,'{\"condition\":\"完好\",\"penalty\":0,\"type\":\"return\",\"userId\":1,\"bookId\":1,\"bookTitle\":\"Spring Boot实战\",\"timestamp\":1766231315354}',1766231315356,'2025-12-20 19:48:35','CONFIRMED');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isbn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `tags` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `publish_year` int(11) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT '0.00',
  `rating_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `idx_category` (`category`),
  KEY `idx_author` (`author`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `book` */

insert  into `book`(`id`,`title`,`author`,`isbn`,`cover_url`,`category`,`stock`,`description`,`tags`,`created_at`,`publish_year`,`rating`,`rating_count`) values 
(1,'Spring Boot实战','张三','9787121344567',NULL,'计算机',5,NULL,'Java,后端,框架','2025-12-20 18:48:25',2023,4.95,44),
(2,'Vue.js设计与实现','李四','9787115580485',NULL,'计算机',3,NULL,'前端,JavaScript,Vue','2025-12-20 18:48:25',2023,4.85,84),
(3,'区块链原理与应用','王五','9787302587890',NULL,'计算机',2,NULL,'区块链,分布式,加密','2025-12-20 18:48:25',2023,5.16,18);

/*Table structure for table `borrow_record` */

DROP TABLE IF EXISTS `borrow_record`;

CREATE TABLE `borrow_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `borrow_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expected_return_time` datetime NOT NULL,
  `actual_return_time` datetime DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'BORROWED',
  `overdue_days` int(11) DEFAULT '0',
  `penalty` decimal(10,2) DEFAULT '0.00',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_book_id` (`book_id`),
  KEY `idx_status` (`status`),
  KEY `idx_borrow_time` (`borrow_time`),
  CONSTRAINT `borrow_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `borrow_record_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `borrow_record` */

insert  into `borrow_record`(`id`,`user_id`,`book_id`,`borrow_time`,`expected_return_time`,`actual_return_time`,`status`,`overdue_days`,`penalty`,`remarks`,`create_time`) values 
(1,1,1,'2025-12-16 19:37:28','2026-01-15 19:37:28',NULL,'BORROWED',0,0.00,NULL,'2025-12-26 19:37:28'),
(2,2,2,'2025-12-21 19:37:28','2026-01-05 19:37:28',NULL,'BORROWED',0,0.00,NULL,'2025-12-26 19:37:28'),
(3,1,3,'2025-11-16 19:37:28','2025-12-16 19:37:28',NULL,'RETURNED',0,0.00,NULL,'2025-12-26 19:37:28');

/*Table structure for table `community_comment` */

DROP TABLE IF EXISTS `community_comment`;

CREATE TABLE `community_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `like_count` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_post_id` (`post_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_parent_id` (`parent_id`),
  CONSTRAINT `community_comment_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `community_post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `community_comment` */

insert  into `community_comment`(`id`,`post_id`,`user_id`,`parent_id`,`content`,`like_count`,`create_time`) values 
(1,1,2,0,'写得很好，学到了！',0,'2025-12-26 19:33:58'),
(2,1,3,0,'感谢分享，很有帮助',0,'2025-12-26 19:33:58'),
(3,2,1,0,'可以使用props和$emit进行通信',0,'2025-12-26 19:33:58'),
(4,1,2,0,'写得很好，学到了！',0,'2025-12-26 19:34:42'),
(5,1,3,0,'感谢分享，很有帮助',0,'2025-12-26 19:34:42'),
(6,2,1,0,'可以使用props和$emit进行通信',0,'2025-12-26 19:34:42');

/*Table structure for table `community_post` */

DROP TABLE IF EXISTS `community_post`;

CREATE TABLE `community_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'NOTE',
  `view_count` int(11) DEFAULT '0',
  `like_count` int(11) DEFAULT '0',
  `comment_count` int(11) DEFAULT '0',
  `tags` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'PUBLISHED',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_post_type` (`post_type`),
  KEY `idx_create_time` (`create_time`),
  CONSTRAINT `community_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `community_post` */

insert  into `community_post`(`id`,`user_id`,`title`,`content`,`post_type`,`view_count`,`like_count`,`comment_count`,`tags`,`create_time`,`update_time`,`status`) values 
(1,1,'Spring Boot学习笔记','今天学习了Spring Boot的自动配置...','NOTE',0,0,0,'Spring Boot,Java,后端','2025-12-26 19:33:58','2025-12-26 19:33:58','PUBLISHED'),
(2,2,'Vue.js组件通信问题','请问Vue.js中父子组件如何通信？','QUESTION',0,0,0,'Vue.js,前端,JavaScript','2025-12-26 19:33:58','2025-12-26 19:33:58','PUBLISHED'),
(3,3,'推荐几本好的区块链书籍','最近对区块链感兴趣，求推荐...','SHARING',0,0,0,'区块链,书籍,推荐','2025-12-26 19:33:58','2025-12-26 19:33:58','PUBLISHED'),
(4,1,'Spring Boot学习笔记','今天学习了Spring Boot的自动配置...','NOTE',0,0,0,'Spring Boot,Java,后端','2025-12-26 19:34:42','2025-12-26 19:34:42','PUBLISHED'),
(5,2,'Vue.js组件通信问题','请问Vue.js中父子组件如何通信？','QUESTION',0,0,0,'Vue.js,前端,JavaScript','2025-12-26 19:34:42','2025-12-26 19:34:42','PUBLISHED'),
(6,3,'推荐几本好的区块链书籍','最近对区块链感兴趣，求推荐...','SHARING',0,0,0,'区块链,书籍,推荐','2025-12-26 19:34:42','2025-12-26 19:34:42','PUBLISHED');

/*Table structure for table `ocr_history` */

DROP TABLE IF EXISTS `ocr_history`;

CREATE TABLE `ocr_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `recognition_result` json DEFAULT NULL,
  `success` tinyint(1) DEFAULT '1',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_time` (`create_time`),
  CONSTRAINT `ocr_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ocr_history` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` int(11) DEFAULT '0',
  `borrow_count` int(11) DEFAULT '0',
  `user_type` enum('STUDENT','ADMIN','TEACHER') COLLATE utf8mb4_unicode_ci DEFAULT 'STUDENT',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login_time` datetime DEFAULT NULL,
  `preference_tags` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `idx_username` (`username`),
  KEY `idx_user_type` (`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`avatar_url`,`points`,`borrow_count`,`user_type`,`created_at`,`updated_at`,`last_login_time`,`preference_tags`) values 
(1,'admin','admin123','admin@smartlib.com',NULL,0,0,'ADMIN','2025-12-20 18:48:25','2025-12-20 18:48:25',NULL,NULL),
(2,'zhangsan','123456','zhangsan@stu.com',NULL,0,0,'STUDENT','2025-12-20 18:48:25','2025-12-20 18:48:25',NULL,NULL),
(3,'lisi','123456','lisi@stu.com',NULL,0,0,'STUDENT','2025-12-20 18:48:25','2025-12-20 18:48:25',NULL,NULL),
(4,'testuser','e10adc3949ba59abbe56e057f20f883e','test@test.com',NULL,0,0,'STUDENT','2025-12-26 19:39:06','2025-12-26 19:39:06',NULL,NULL);

/*Table structure for table `user_action` */

DROP TABLE IF EXISTS `user_action`;

CREATE TABLE `user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `action_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_value` decimal(5,2) DEFAULT '1.00',
  `action_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `metadata` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_book_id` (`book_id`),
  KEY `idx_action_type` (`action_type`),
  KEY `idx_action_time` (`action_time`),
  CONSTRAINT `user_action_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_action_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_action` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
