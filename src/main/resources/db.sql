CREATE DATABASE  IF NOT EXISTS `accounts`;
USE `accounts`;
--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(45) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN');
INSERT INTO `role` VALUES (2,'ROLE_USER');
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(255) NULL DEFAULT NULL,
	`password` VARCHAR(255) NULL DEFAULT NULL,
	`district_id` INT(11) NULL DEFAULT NULL,
	`designation` VARCHAR(50) NULL DEFAULT NULL,
	`userdisplayname` VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_user_district` (`district_id`),
	CONSTRAINT `FK_user_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
	`user_id` INT(11) NOT NULL,
	`role_id` INT(11) NOT NULL,
	PRIMARY KEY (`user_id`, `role_id`),
	INDEX `fk_user_role_roleid_idx` (`role_id`),
	CONSTRAINT `fk_user_role_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `fk_user_role_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;



DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
	`id` INT(20) NOT NULL AUTO_INCREMENT,
	`d_discription` VARCHAR(255) NULL DEFAULT NULL,
	`d_name` VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;



ALTER TABLE `district`
	CHANGE COLUMN `d_name` `d_name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci' AFTER `d_discription`;
	
insert into district (id , d_name , d_discription) values (1 , 'd1' , 'd1');

update user set userdesplayname ='श्री पंकज मिश्रा' where id=6 


DROP TABLE IF EXISTS `reportm`;
CREATE TABLE `reportm` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`month` INT(11) NOT NULL DEFAULT '0',
	`year` INT(11) NOT NULL DEFAULT '0',
	`newdmd_crr` DOUBLE NULL DEFAULT NULL,
	`new_dmd_tl_apr` DOUBLE NULL DEFAULT NULL,
	`newdmd_ls_yr_tl` DOUBLE NULL DEFAULT NULL,
	`rec_ls_yr_tl` DOUBLE NULL DEFAULT NULL,
	`rem_apr` DOUBLE NULL DEFAULT NULL,
	`rem_crr` DOUBLE NULL DEFAULT NULL,
	`rem_ls_yr_tl` DOUBLE NULL DEFAULT NULL,
	`total_rec` DOUBLE NULL DEFAULT NULL,
	`t_rec_apr` DOUBLE NULL DEFAULT NULL,
	`t_rec_crr` DOUBLE NULL DEFAULT NULL,
	`user_id` INT(11) NULL DEFAULT NULL,
	`report_name` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;



DROP TABLE IF EXISTS `reportname`;
CREATE TABLE `reportname` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`report_name` VARCHAR(255) NULL DEFAULT NULL,
	`report_desc` VARCHAR(255) NULL DEFAULT NULL,
	`report_type` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

"INSERT INTO `district` (`id`, `d_name`, `d_discription`) VALUES  	(1, 'd1', 'खमरिया')";
