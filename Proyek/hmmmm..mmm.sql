/*
SQLyog Community v11.24 (32 bit)
MySQL - 5.5.27 : Database - warehouse_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`warehouse_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `warehouse_db`;

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `menu_name` varchar(32) NOT NULL,
  `menu_controller` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id`,`parent_id`,`menu_name`,`menu_controller`) values (1,1,'Menu yang tersedia','TMenu'),(5,1,'Role user dengan menu','TMenuPrivileges'),(6,1,'Seluruh user','TUser'),(7,1,'Seluruh database','TblDatabase'),(8,1,'Seluruh tabel output','TblOutput'),(9,1,'Seluruh server ','TblServer'),(10,1,'Seluruh tabel yang diambil','TblTake'),(11,1,'Seluruh menu dasar','Site');

/*Table structure for table `t_menu_privileges` */

DROP TABLE IF EXISTS `t_menu_privileges`;

CREATE TABLE `t_menu_privileges` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `menu_id` int(5) NOT NULL DEFAULT '0',
  `allow_view` tinyint(1) NOT NULL DEFAULT '0',
  `allow_add` tinyint(1) NOT NULL DEFAULT '0',
  `allow_edit` tinyint(1) NOT NULL DEFAULT '0',
  `allow_delete` tinyint(1) NOT NULL DEFAULT '0',
  `allow_admin` tinyint(1) NOT NULL DEFAULT '0',
  `allow_TambahKoneksi` tinyint(1) NOT NULL DEFAULT '0',
  `allow_Simpandatabase` tinyint(1) NOT NULL DEFAULT '0',
  `allow_Daftardatabase` tinyint(1) NOT NULL DEFAULT '0',
  `allow_Setting` tinyint(1) NOT NULL DEFAULT '0',
  `allow_register` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_menu_id` (`menu_id`) USING BTREE,
  KEY `idx_allow_view` (`allow_view`) USING BTREE,
  KEY `idx_allow_add` (`allow_add`) USING BTREE,
  KEY `idx_allow_edit` (`allow_edit`) USING BTREE,
  KEY `idx_allow_delete` (`allow_delete`) USING BTREE,
  CONSTRAINT `t_menu_privileges_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_menu_privileges_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu_privileges` */

insert  into `t_menu_privileges`(`id`,`user_id`,`menu_id`,`allow_view`,`allow_add`,`allow_edit`,`allow_delete`,`allow_admin`,`allow_TambahKoneksi`,`allow_Simpandatabase`,`allow_Daftardatabase`,`allow_Setting`,`allow_register`) values (18,1,1,1,0,0,0,1,0,0,0,0,0),(19,1,5,1,0,0,0,1,0,0,0,0,0),(20,1,6,1,1,0,0,1,0,0,0,0,0),(21,1,7,1,0,0,0,1,0,0,0,0,0),(24,1,8,1,1,1,1,1,0,0,0,0,0),(25,1,9,1,1,1,1,1,1,1,1,1,0),(26,1,10,1,1,0,1,1,0,0,0,0,0),(27,2,1,1,0,0,0,1,0,0,0,0,0),(28,2,5,1,0,0,0,1,0,0,0,0,0),(30,2,6,1,0,0,0,0,0,0,0,0,0),(31,2,7,1,0,0,0,0,0,0,0,0,0),(32,2,8,1,0,0,0,1,0,0,0,0,0),(33,2,9,1,1,0,0,1,0,1,1,0,0),(34,2,10,1,0,0,0,1,0,0,0,0,0),(35,10,1,1,0,0,0,1,0,0,0,0,0),(36,10,5,1,0,0,0,1,0,0,0,0,0),(37,10,6,1,1,0,0,1,0,0,0,0,0),(38,10,7,1,0,0,0,1,0,0,0,0,0),(39,10,8,1,1,1,1,1,0,0,0,0,0),(40,10,9,1,1,1,1,1,1,1,1,0,0),(41,10,8,1,1,0,1,1,0,0,0,0,0),(42,1,11,0,0,0,0,0,0,0,0,0,1),(43,10,11,0,0,0,0,0,0,0,0,0,1);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_role` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`name_role`) values (1,'admin'),(2,'user');

/*Table structure for table `t_setting` */

DROP TABLE IF EXISTS `t_setting`;

CREATE TABLE `t_setting` (
  `id` int(11) NOT NULL,
  `waktu_update` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_setting` */

insert  into `t_setting`(`id`,`waktu_update`) values (1,'5 minutes'),(2,'10 minutes'),(3,'1 hours');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_role` (`id_role`),
  CONSTRAINT `ref_role` FOREIGN KEY (`id_role`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`f_name`,`username`,`password`,`id_role`) values (1,'admin','admin','21232f297a57a5a743894a0e4a801fc3',1),(2,'sri','sri','d1565ebd8247bbb01472f80e24ad29b6',2),(3,'sahala','sahala','sahala',2),(9,'saya','saya','20c1a26a55039b30866c9d0aa51953ca',2),(10,'admin2','admin2','21232f297a57a5a743894a0e4a801fc3',1);

/*Table structure for table `tbl_database` */

DROP TABLE IF EXISTS `tbl_database`;

CREATE TABLE `tbl_database` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `database_name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `id_server` int(11) NOT NULL,
  `database_local` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_server` (`id_server`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_database` */

insert  into `tbl_database`(`id`,`database_name`,`id_server`,`database_local`) values (38,'banking',1,'dwh_banking');

/*Table structure for table `tbl_output` */

DROP TABLE IF EXISTS `tbl_output`;

CREATE TABLE `tbl_output` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_table` varchar(32) CHARACTER SET utf8 NOT NULL,
  `tbl_output_name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `list_fields` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`code_table`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_output` */

insert  into `tbl_output`(`id`,`code_table`,`tbl_output_name`,`deskripsi`,`list_fields`) values (15,'1069','Output1',NULL,NULL),(10,'2108','Output2',NULL,NULL),(13,'3741','Output3',NULL,NULL),(18,'8142','test',NULL,NULL),(19,'9205','test',NULL,NULL);

/*Table structure for table `tbl_server` */

DROP TABLE IF EXISTS `tbl_server`;

CREATE TABLE `tbl_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `port` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `host` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_server` */

insert  into `tbl_server`(`id`,`hostname`,`port`,`host`,`username`,`password`) values (1,'localhost','3306','127.0.0.1','root',''),(2,'Server29','3306','10.17.51.29','root',''),(3,'Coba ','3306','12.1.1.1','root',''),(4,'test','1234','Test','admin','admin'),(5,'localhost1','3306','127.0.0.1','admin','admin'),(6,'','','','admin','admin');

/*Table structure for table `tbl_take` */

DROP TABLE IF EXISTS `tbl_take`;

CREATE TABLE `tbl_take` (
  `code_table` varchar(32) CHARACTER SET utf8 NOT NULL,
  `tbl_name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `attribute` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `id_database` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `id_tbl_output` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`code_table`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_take` */

/* Procedure structure for procedure `test_multi_sets` */

/*!50003 DROP PROCEDURE IF EXISTS  `test_multi_sets` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
