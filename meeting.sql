/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.7.13-log : Database - meeting
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`meeting` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `meeting`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `departmentid` int(16) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `departmentname` varchar(20) DEFAULT NULL COMMENT '部门名称',
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`departmentid`,`departmentname`) values (1,'技术部'),(2,'人事部'),(3,'财务部'),(4,'行政部'),(7,'运维部');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `employeeid` int(16) NOT NULL AUTO_INCREMENT COMMENT '用户ID（唯一）',
  `employeename` varchar(14) DEFAULT NULL COMMENT '员工姓名',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名（登录的账号）',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `status` varchar(20) DEFAULT NULL COMMENT '状态（0未审批 1审批通过 2审批未通过）',
  `departmentid` int(16) DEFAULT NULL COMMENT '部门编号',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `role` varchar(12) DEFAULT NULL COMMENT '角色（1普通用户 2管理员）',
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`employeeid`,`employeename`,`username`,`phone`,`email`,`status`,`departmentid`,`password`,`role`) values (8,'王晓华','wangxh','13671075406','wang@qq.com','1',1,'1','1'),(9,'林耀坤','linyk','13671075406','yang@qq.com','1',2,'1','2'),(10,'熊杰文','xiongjw','134555555','xiong@qq.com','1',3,'1','2'),(11,'王敏','wangmin','1324554321','wangm@qq.com','1',4,'1','2'),(16,'黄美玲','huangml','huangml@qq.com','13567898765','2',4,'1','2'),(17,'黄美玲','huangml002','huangml@qq.com','13567898765','2',1,'1','2'),(20,'王敏','wangmin002','13454332334','wang@qq.com','2',4,'1','2'),(21,'陈敏','chenm','13559994444','www@aa.com','1',2,'1','2'),(23,'陈晨','wangm','22·2','11','2',1,'1','2'),(25,'王晓华','wangxh222','111','1','2',4,'1','2'),(27,'张三','zhangsan','122','22','2',4,'1','2'),(29,'kxf','kxf','123','123@qq.com','1',1,'1','1'),(36,'许志斌','xzb','1','1','1',3,'123','2');

/*Table structure for table `meeting` */

DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `meetingid` int(16) NOT NULL AUTO_INCREMENT COMMENT '会议ID',
  `meetingname` varchar(20) DEFAULT NULL COMMENT '会议名称',
  `roomid` int(16) DEFAULT NULL COMMENT '房间号',
  `reservationistid` int(16) DEFAULT NULL COMMENT '预订会议人的ID',
  `numberofparticipants` int(16) DEFAULT NULL COMMENT '参加人数',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `reservationtime` datetime DEFAULT NULL COMMENT '预约时间',
  `canceledtime` datetime DEFAULT NULL COMMENT '取消时间',
  `description` varchar(200) DEFAULT NULL COMMENT '会议说明',
  `status` varchar(20) DEFAULT NULL COMMENT '状态（0没取消的会议 1取消的会议）',
  `canceledreason` varchar(255) DEFAULT NULL COMMENT '取消会议原因',
  PRIMARY KEY (`meetingid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `meeting` */

insert  into `meeting`(`meetingid`,`meetingname`,`roomid`,`reservationistid`,`numberofparticipants`,`starttime`,`endtime`,`reservationtime`,`canceledtime`,`description`,`status`,`canceledreason`) values (26,'测测',7,8,12,'2015-01-12 13:00:00','2015-01-12 15:00:00','2015-01-17 23:04:18','2015-01-11 01:06:20',NULL,'1',NULL),(27,'我看看',6,8,12,'2015-01-13 23:06:06','2015-01-14 03:06:08','2015-01-10 23:06:33','2015-01-11 01:01:42','我看看','1',NULL),(28,'运营会',5,8,12,'2015-01-10 23:26:11','2015-01-11 23:26:13','2015-01-10 23:26:26',NULL,'测试','0',NULL),(29,'市场部会议',6,8,12,'2015-01-10 23:44:22','2015-01-11 23:44:24','2015-01-10 23:44:41',NULL,'市场部','0',NULL),(30,'内部会议',10,8,12,'2015-01-10 23:55:59','2015-01-11 23:56:01','2015-01-10 23:56:20',NULL,'内部会议','0',NULL),(31,'我的会议',9,8,12,'2015-01-12 16:33:16','2015-01-13 16:33:18','2015-01-11 16:35:11',NULL,'测试','0',NULL),(32,'我的会议哈哈',5,8,10,'2015-01-12 16:40:31','2015-01-13 16:40:35','2015-01-11 16:40:50',NULL,'','0',NULL),(33,'哈哈',6,8,12,'2015-01-12 16:41:45','2015-01-13 16:41:48','2015-01-11 16:42:09','2015-01-12 11:44:57','你好','1',NULL),(34,'我的会议3',8,8,12,'2015-01-11 16:42:36','2015-01-13 16:42:38','2015-01-11 16:42:51',NULL,'测试','0',NULL),(35,'我的会议',7,8,12,'2015-01-11 16:44:03','2015-01-11 16:44:05','2015-01-11 16:44:35',NULL,'','0',NULL),(36,'我问问',7,8,12,'2015-01-11 16:56:57','2015-01-11 16:56:59','2015-01-11 16:57:56','2015-01-11 16:59:57','地点','1',NULL),(37,'我的会议4',7,8,12,'2015-01-12 16:59:26','2015-01-12 16:59:31','2015-01-11 16:59:49',NULL,'我的会议','0',NULL),(38,'班会',9,8,12,'2015-01-15 16:46:25','2015-01-16 18:46:53','2015-01-12 11:49:17','2015-01-12 11:49:37','班会','1',NULL),(39,'测试会议',5,8,12,'2015-01-14 14:41:11','2015-01-15 14:41:14','2015-01-14 14:44:07',NULL,'ss','0',NULL),(41,'206会议',5,36,4,'2021-04-16 23:17:28','2021-04-17 23:17:32','2021-04-16 23:17:55','2021-04-17 17:36:37','开会','1','xzb我儿'),(46,'206会议',5,36,4,'2021-04-16 13:02:26','2021-04-20 13:02:35','2021-04-17 13:02:53',NULL,'206大会','0',NULL),(47,'206会议',5,36,4,'2021-04-16 13:17:35','2021-04-20 13:17:46','2021-04-17 13:18:01',NULL,'206','0',NULL),(48,'206会议',5,36,1,'2021-04-18 13:23:10','2021-04-19 13:23:17','2021-04-17 13:23:30',NULL,'206','0',NULL);

/*Table structure for table `meetingparticipants` */

DROP TABLE IF EXISTS `meetingparticipants`;

CREATE TABLE `meetingparticipants` (
  `meetingid` int(16) NOT NULL COMMENT '会议ID',
  `employeeid` int(16) DEFAULT NULL COMMENT '参加会议的员工的员工ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `meetingparticipants` */

insert  into `meetingparticipants`(`meetingid`,`employeeid`) values (28,13),(28,23),(28,27),(28,16),(29,16),(29,13),(29,8),(30,15),(30,13),(30,8),(30,23),(27,8),(26,8),(25,8),(28,8),(31,8),(31,17),(31,23),(32,8),(32,17),(33,15),(34,8),(34,17),(35,8),(36,9),(36,8),(37,8),(37,23),(38,11),(38,16),(38,20),(39,13),(40,17),(40,23),(41,36),(42,29),(42,36),(43,10),(45,29),(46,29),(46,36),(47,29),(47,36),(48,29),(48,36);

/*Table structure for table `meetingroom` */

DROP TABLE IF EXISTS `meetingroom`;

CREATE TABLE `meetingroom` (
  `roomid` int(16) NOT NULL AUTO_INCREMENT COMMENT '会议室ID',
  `roomnum` int(16) NOT NULL COMMENT '会议室房间号',
  `roomname` varchar(20) NOT NULL COMMENT '会议室名称',
  `capacity` int(16) DEFAULT NULL COMMENT '可容纳人数',
  `status` varchar(20) DEFAULT NULL COMMENT '状态（0可用 1被占用）',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `meetingroom` */

insert  into `meetingroom`(`roomid`,`roomnum`,`roomname`,`capacity`,`status`,`description`) values (5,101,'第一会议室',15,'0','公共会议室'),(6,102,'第二会议室',5,'0','管理部门会议室'),(7,103,'第三会议室',12,'0','市场部专用会议室'),(8,401,'第四会议室',15,'0','公共会议室'),(9,201,'第五会议室',15,'0','最大会议室'),(10,601,'第六会议室',12,'0','需要提前三天预定');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
