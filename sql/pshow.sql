/*
SQLyog v10.2 
MySQL - 5.5.27 : Database - p_show
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`p_show` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `p_show`;

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id自增长',
  `projectName` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `projectNo` varchar(50) DEFAULT NULL COMMENT '项目代号',
  `createDate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `startDate` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `endDate` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `contactPerson` varchar(50) DEFAULT NULL COMMENT '联系人',
  `contact` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `company` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `del` varchar(1) DEFAULT NULL COMMENT '0/1,1:已删',
  `status` varchar(1) DEFAULT NULL COMMENT '0未开始，1进行中，2已结束，3停滞，4，已取消',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `project` */

insert  into `project`(`id`,`projectName`,`projectNo`,`createDate`,`startDate`,`endDate`,`remarks`,`contactPerson`,`contact`,`company`,`del`,`status`) values (1,'i','stm','2013-08-07 15:22:06','2013-08-07 ','2013-08-31 ','范德萨发范德萨发','曹郁','132564654','华为','1','0'),(2,'oipoip','stm','2013-08-07 15:22:46','2013-08-07 ','2013-08-31 ','范德萨发范德萨发','曹郁','132564654','华为','1','0'),(3,'fdsf','stm','2013-08-07 15:24:20','2013-08-07 ','2013-08-31 ','范德萨发范德萨发','曹郁','132564654','华为','0','0'),(4,'fsdfsdfsd','stm','2013-08-07 15:25:19','2013-08-07 ','2013-08-31 ','范德萨发范德萨发','曹郁','132564654','华为','1','0'),(5,'fsdfsdfsd','stm','2013-08-07 15:27:20','2013-08-07 ','2013-08-31 ','范德萨发范德萨发','曹郁','132564654','华为','0','0'),(6,'fsdfsdfsffsgfdg','发送到发送到','2013-08-07 15:27:34','2013-08-06 ','2013-08-07 ','烦烦烦','发生的都是','发生的发生的','发生地方','0','0'),(7,'etyhrhtrht','发送到发送到','2013-08-07 15:35:12','2013-08-06 ','2013-08-07 ','烦烦烦','发生的都是','发生的发生的','发生地方','0','0'),(8,'ryiuylkuy','stm','2013-08-07 15:43:23','2013-08-07 ','2013-08-31 ','范德萨发范德萨发','','132564654','华为','1','0'),(9,'oipupop','stm','2013-08-07 16:08:26','2013-08-07 ','2013-08-31 ','范德萨发范德萨发','曹郁','1325646541561561616','华为','1','0');

/*Table structure for table `tracking` */

DROP TABLE IF EXISTS `tracking`;

CREATE TABLE `tracking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '描述',
  `addTime` varchar(30) DEFAULT NULL COMMENT '增加时间',
  `editTime` varchar(30) DEFAULT NULL COMMENT '修改时间',
  `del` varchar(1) DEFAULT NULL COMMENT '0/1,1:已删',
  `projectId` bigint(20) DEFAULT NULL COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tracking` */

insert  into `tracking`(`id`,`title`,`content`,`addTime`,`editTime`,`del`,`projectId`) values (1,'放顶顶顶顶顶顶顶顶顶顶的','放顶顶顶顶顶顶顶顶顶顶的发反复反复反复反复反复反复','2013-08-07 15:51:25','2013-08-07 15:51:25','0',2),(2,'fsdfs','dfsdfsdfsdfdf','2013-08-07 17:35:42','2013-08-07 17:35:42','0',0),(3,'fffffffffff','fffffffffffffffffffffffffffffffff','2013-08-08 09:33:52','2013-08-08 09:33:52','0',0),(4,'ffffffff','fffffffffffffffffffffffff','2013-08-08 09:37:49','2013-08-08 09:37:49','0',5),(5,'ffffffffffff','fffffffffffffffffffffffffffff','2013-08-08 09:38:02','2013-08-08 09:38:02','0',4);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(30) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `del` varchar(1) DEFAULT NULL COMMENT '0/1,1:已删',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`userName`,`password`,`name`,`del`) values (1,'admin','1','张三','0'),(2,'ad','1231','adtest','0'),(3,'addd','123','addd','0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
