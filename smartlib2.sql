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

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `author` varchar(100) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `description` text,
  `cover` varchar(500) DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT '0.0',
  `rating_count` int(11) DEFAULT '0',
  `borrow_count` int(11) DEFAULT '0',
  `stock` int(11) DEFAULT '1',
  `total_stock` int(11) DEFAULT '1',
  `available` int(11) DEFAULT '1',
  `is_new` int(11) DEFAULT '0',
  `is_hot` int(11) DEFAULT '0',
  `tags` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`(50)),
  KEY `idx_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `book` */

insert  into `book`(`id`,`title`,`author`,`isbn`,`publisher`,`category`,`description`,`cover`,`rating`,`rating_count`,`borrow_count`,`stock`,`total_stock`,`available`,`is_new`,`is_hot`,`tags`,`created_at`,`updated_at`) values 
(1,'Vue.js 3设计与实现','霍春阳',NULL,NULL,'前端开发','Vue.js 3深入解析','https://img1.doubanio.com/view/subject/s/public/s34200289.jpg',9.2,0,156,3,1,1,1,1,'Vue,前端','2025-12-27 15:13:01','2025-12-27 15:13:01'),
(2,'Spring Boot实战','王松',NULL,NULL,'后端开发','Spring Boot企业级开发','https://img2.doubanio.com/view/subject/s/public/s29483747.jpg',8.7,0,89,2,1,1,0,1,'Spring,Java','2025-12-27 15:13:01','2025-12-27 15:13:01'),
(3,'Python数据分析','李明',NULL,NULL,'数据分析','Python数据分析实战','https://img3.doubanio.com/view/subject/s/public/s29631790.jpg',9.0,0,120,5,1,1,1,0,'Python,数据','2025-12-27 15:13:01','2025-12-27 15:13:01'),
(4,'深度学习入门','斋藤康毅',NULL,NULL,'人工智能','深度学习经典入门','https://img1.doubanio.com/view/subject/s/public/s33514627.jpg',9.5,0,200,4,1,1,0,1,'AI,深度学习','2025-12-27 15:13:01','2025-12-27 15:13:01');

/*Table structure for table `borrow_record` */

DROP TABLE IF EXISTS `borrow_record`;

CREATE TABLE `borrow_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `book_title` varchar(200) NOT NULL,
  `book_author` varchar(100) DEFAULT NULL,
  `book_isbn` varchar(20) DEFAULT NULL,
  `borrow_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'BORROWED',
  `is_overdue` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_status` (`status`),
  CONSTRAINT `borrow_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `borrow_record_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `borrow_record` */

insert  into `borrow_record`(`id`,`user_id`,`book_id`,`book_title`,`book_author`,`book_isbn`,`borrow_date`,`due_date`,`return_date`,`status`,`is_overdue`,`created_at`) values 
(1,1,1,'Vue.js 3设计与实现','霍春阳',NULL,'2025-12-10','2025-12-24',NULL,'BORROWED',0,'2025-12-27 15:13:01'),
(2,1,2,'Spring Boot实战','王松',NULL,'2025-12-01','2025-12-15',NULL,'RETURNED',0,'2025-12-27 15:13:01');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `content` text NOT NULL,
  `likes` int(11) DEFAULT '0',
  `has_liked` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `idx_book_id` (`book_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `comment` */

insert  into `comment`(`id`,`user_id`,`book_id`,`user_name`,`avatar`,`content`,`likes`,`has_liked`,`created_at`,`updated_at`) values 
(1,1,1,'test',NULL,'这本书非常不错！',5,0,'2025-12-27 15:13:01','2025-12-27 15:13:01'),
(2,2,1,'admin',NULL,'Vue 3必读经典',12,0,'2025-12-27 15:13:01','2025-12-27 15:13:01');

/*Table structure for table `community_post` */

DROP TABLE IF EXISTS `community_post`;

CREATE TABLE `community_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `category` varchar(50) DEFAULT 'general',
  `author_name` varchar(50) DEFAULT NULL,
  `author_avatar` varchar(500) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `comments` int(11) DEFAULT '0',
  `likes` int(11) DEFAULT '0',
  `collects` int(11) DEFAULT '0',
  `liked` int(11) DEFAULT '0',
  `collected` int(11) DEFAULT '0',
  `images` text,
  `tags` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `idx_category` (`category`),
  CONSTRAINT `community_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `community_post` */

insert  into `community_post`(`id`,`user_id`,`title`,`content`,`category`,`author_name`,`author_avatar`,`views`,`comments`,`likes`,`collects`,`liked`,`collected`,`images`,`tags`,`created_at`,`updated_at`) values 
(1,1,'Vue 3.4 新特性深度解析','分享Vue 3.4新特性...','technology','前端探索者',NULL,1250,42,89,0,0,0,NULL,'Vue,前端','2025-12-27 15:13:01','2025-12-27 15:13:01'),
(2,2,'Spring Boot性能优化','Spring Boot优化经验...','technology','后端工程师',NULL,890,23,45,0,0,0,NULL,'Spring,Java','2025-12-27 15:13:01','2025-12-27 15:13:01'),
(3,1,'Vue 3.4 新特性深度解析','最近研究了Vue 3.4的新特性...','technology','前端探索者',NULL,1250,42,89,0,0,0,NULL,'Vue,前端,JavaScript','2025-12-27 15:40:56','2025-12-27 15:40:56'),
(4,2,'Spring Boot性能优化指南','分享一些Spring Boot项目性能优化的实践经验...','technology','后端工程师',NULL,890,23,45,0,0,0,NULL,'Spring Boot,Java,性能优化','2025-12-27 15:40:56','2025-12-27 15:40:56');

/*Table structure for table `recommendation` */

DROP TABLE IF EXISTS `recommendation`;

CREATE TABLE `recommendation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `algorithm` varchar(50) DEFAULT 'collaborative',
  `reason` varchar(200) DEFAULT NULL,
  `score` decimal(5,2) DEFAULT '0.00',
  `is_read` int(11) DEFAULT '0',
  `is_liked` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `recommendation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recommendation_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `recommendation` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png',
  `score` int(11) DEFAULT '0',
  `borrow_count` int(11) DEFAULT '0',
  `current_borrow` int(11) DEFAULT '0',
  `consecutive_days` int(11) DEFAULT '0',
  `role` varchar(20) DEFAULT 'USER',
  `status` int(11) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_username` (`username`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`student_id`,`phone`,`avatar`,`score`,`borrow_count`,`current_borrow`,`consecutive_days`,`role`,`status`,`created_at`,`updated_at`) values 
(1,'test','123456','test@example.com','20240001','13800138000','https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png',150,12,5,7,'USER',1,'2025-12-27 15:13:01','2025-12-27 16:46:46'),
(2,'admin','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iK6pFjyV9i4W5JgYz7J5e6wUQ8Ym','admin@example.com','20240000','13900139000','https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png',500,50,3,30,'ADMIN',1,'2025-12-27 15:13:01','2025-12-27 15:13:01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
