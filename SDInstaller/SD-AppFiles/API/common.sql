CREATE DATABASE `sd_common_db` CHARACTER SET utf8mb4;

USE `sd_common_db`;

CREATE TABLE `status_master` (
 `id` INT UNSIGNED NOT NULL,
 `code` VARCHAR (150) NOT NULL,
 `name` VARCHAR (50) NOT NULL,
 `type` ENUM ( 'COMMON','BACKUP','WORKFLOW','WORKFLOW_TASK') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

INSERT INTO `status_master` (`id`, `code`, `name`, `type`) 
VALUES  
(1, 'ACTIVE', 'Active', 'COMMON'),
(2, 'INACTIVE', 'Inactive', 'COMMON'),
(3, 'DORMANT', 'Dormant', 'COMMON'),
(4, 'REGISTERD', 'Registered', 'COMMON'),
(5, 'BLOCKED', 'Blocked', 'COMMON'),
(6, 'RECYCLEBIN','Recyclebin','BACKUP'),
(9, 'PENDING','Pending','COMMON'),
(10, 'EXPIRED', 'Expired', 'COMMON'),
(11, 'SCHEDULED','Scheduled','COMMON'),
(12, 'LOCKED','Locked','COMMON'),
(13, 'NOT_SCHEDULED', 'Not Scheduled', 'COMMON'),
(14, 'DRAFT', 'Draft', 'WORKFLOW'),
(15, 'PUBLISHED', 'Published', 'WORKFLOW'),
(16, 'DELETED', 'Deleted', 'COMMON'),
(17, 'COMPLETED', 'Completed', 'WORKFLOW'),
(18, 'REJECTED', 'Rejected', 'WORKFLOW_TASK'),
(19, 'CANCELLED', 'Cancelled', 'WORKFLOW_TASK'),
(20, 'APPROVED', 'Approved', 'WORKFLOW_TASK'),
(21, 'STARTED', 'Started', 'WORKFLOW_TASK'),
(22, 'EXPIRED', 'Expired', 'WORKFLOW_TASK'),
(23, 'REVIEWED', 'Reviewed', 'WORKFLOW_TASK');

CREATE TABLE `group_company` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`status_id` INT UNSIGNED NOT NULL,
`group_name` VARCHAR (200) NOT NULL,
`group_company_code` BIGINT (20)NOT NULL,
`company_type` ENUM ('Regular', 'Trial'),
`share_mode` tinyint(4) NOT NULL,
`company_expiry` DATETIME NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`created_by` INT DEFAULT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_GROUP_COMPANY_GROUP_COMPANY_CODE` (`group_company_code`),
  CONSTRAINT `FK_GROUP_COMPANY_IS_ACTIVE` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;


CREATE TABLE `language_master` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`status_id` INT UNSIGNED NOT NULL,
`name` VARCHAR (200) NOT NULL,
`display_name` VARCHAR (200) NOT NULL,
`code_1` VARCHAR (200) DEFAULT NULL,
`code_2` VARCHAR (200) DEFAULT NULL,
`extension` VARCHAR(100) DEFAULT NULL,
`display_order` INT DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
 CONSTRAINT `FK_LANGUAGE_MASTER_STATUS` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

INSERT INTO `language_master` (`id`, `status_id`, `name`, `display_name`, `code_1`, `code_2`, `extension`, `display_order`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
('1','2','Abkhazian','Abkhazian','ab',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('2','2','Afar','Afar','aa',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('3','2','Afrikaans','Afrikaans','af',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('4','2','Akan','Akan','ak',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('5','2','Albanian','Albanian','sq',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('6','2','Amharic','Amharic','am',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('7','2','Arabic','Arabic','ar',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('8','2','Aragonese','Aragonese','an',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('9','2','Assamese','Assamese','as',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('10','2','Armenian','Armenian','hy',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('11','2','Avaric','Avaric','av',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('12','2','Avestan','Avestan','ae',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('13','2','Aymara','Aymara','ay',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('14','2','Azerbaijani','Azerbaijani','az',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('15','2','Bashkir','Bashkir','ba',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('16','2','Bambara','Bambara','bm',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('17','2','Basque','Basque','eu',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('18','2','Belarusian','Belarusian','be',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('19','2','Bengali','Bengali','bn',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('20','2','Bihari','Bihari','bh',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('21','2','Bislama','Bislama','bi',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('22','2','Bosnian','Bosnian','bs',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('23','2','Breton','Breton','br',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('24','2','Bulgarian','Bulgarian','bg',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('25','2','Burmese','Burmese','my',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('26','2','Catalan Valencian','Catalan Valencian','ca',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('27','2','Chamorro','Chamorro','ch',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('28','2','Chechen','Chechen','ce',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('29','2','Chichewa','Chichewa','ny',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('30','1','Chinese Simplified','简体中文','zh_cn',NULL,NULL,'3','1',NOW(),NULL,NULL),
('31','2','Chuvash','Chuvash','cv',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('32','2','Cornish','Cornish','kw',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('33','2','Corsican','Corsican','co',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('34','2','Cree','Cree','cr',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('35','2','Croatian','Croatian','hr',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('36','2','Czech','Czech','cs',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('37','2','Danish','Danish','da',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('38','2','Maldivian','Maldivian','dv',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('39','2','Dzongkha','Dzongkha','dz',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('40','1','English','English','en',NULL,NULL,'1','1',NOW(),NULL,NULL),
('41','2','Esperanto','Esperanto','eo',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('42','2','Estonian','Estonian','et',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('43','2','Ewe','Ewe','ee',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('44','2','Faroese','Faroese','fo',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('45','2','Fijian','Fijian','fj',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('46','2','Finnish','Finnish','fi',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('47','2','French','French','fr',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('48','2','Fula','Fula','ff',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('49','2','Galician','Galician','gl',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('50','2','German','German','de',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('51','2','Greek','Greek','el',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('52','2','Guaraní','Guaraní','gn',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('53','2','Gujarati','Gujarati','gu',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('54','2','Haitian','Haitian','ht',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('55','2','Hausa','Hausa','ha',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('56','2','Hebrew','Hebrew','he',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('57','2','Herero','Herero','hz',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('58','1','Hindi','हिंदी','hi',NULL,NULL,'7','1',NOW(),NULL,NULL),
('59','2','Hiri Motu','Hiri Motu','ho',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('60','2','Hungarian','Hungarian','hu',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('61','1','Indonesian','Bahasa','id',NULL,NULL,'5','1',NOW(),NULL,NULL),
('62','2','Irish','Irish','ga',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('63','2','Igbo','Igbo','ig',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('64','2','Inupiaq','Inupiaq','ik',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('65','2','Ido','Ido','io',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('66','2','Icelandic','Icelandic','is',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('67','2','Italian','Italian','it',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('68','2','Inuktitut','Inuktitut','iu',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('69','1','Japanese','日本語','ja',NULL,NULL,'2','1',NOW(),NULL,NULL),
('70','2','Javanese','Javanese','jv',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('71','2','Georgian','Georgian','ka',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('72','2','Kongo','Kongo','kg',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('73','2','Kazakh','Kazakh','kk',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('74','2','Central Khmer','Central Khmer','km',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('75','2','Kannada','Kannada','kn',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('76','1','Korean','한국어','ko',NULL,NULL,'6','1',NOW(),NULL,NULL),
('77','2','Kanuri','Kanuri','kr',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('78','2','Kashmiri','Kashmiri','ks',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('79','2','Kurdish','Kurdish','ku',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('80','2','Komi','Komi','kv',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('81','2','Kirghiz','Kirghiz','ky',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('82','2','Latin','Latin','la',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('83','2','Luxembourgish','Luxembourgish','lb',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('84','2','Luganda','Luganda','lg',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('85','2','Lingala','Lingala','ln',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('86','2','Lao','Lao','lo',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('87','2','Lithuanian','Lithuanian','lt',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('88','2','Luba-Katanga','Luba-Katanga','lu',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('89','2','Latvian','Latvian','lv',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('90','2','Malagasy','Malagasy','mg',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('91','2','Marshallese','Marshallese','mh',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('92','2','Manx','Manx','gv',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('93','2','Māori','Māori','mi',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('94','2','Macedonian','Macedonian','mk',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('95','2','Malayalam','Malayalam','ml',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('96','2','Mongolian','Mongolian','mn',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('97','2','Marathi','Marathi','mr',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('98','2','Malay','Malay','ms',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('99','2','Maltese','Maltese','mt',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('100','2','Nauru','Nauru','na',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('101','2','North Ndebele','North Ndebele','nd',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('102','2','Nepali','Nepali','ne',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('103','2','Ndonga','Ndonga','ng',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('104','2','Dutch','Dutch','nl',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('105','2','Norwegian','Norwegian','no',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('106','2','South Ndebele','South Ndebele','nr',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('107','2','Navajo','Navajo','nv',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('108','2','Oromo','Oromo','om',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('109','2','Oriya','Oriya','or',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('110','2','Ossetian','Ossetian','os',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('111','2','Punjabi','Punjabi','pa',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('112','2','Pāli','Pāli','pi',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('113','2','Persian','Persian','fa',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('114','2','Polish','Polish','pl',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('115','2','Portuguese','Portuguese','pt',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('116','2','Quechua','Quechua','qu',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('117','2','Kirundi','Kirundi','rn',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('118','2','Romanian','Romanian','ro',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('119','2','Russian','Russian','ru',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('120','2','Kinyarwanda','Kinyarwanda','rw',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('121','2','Sanskrit','Sanskrit','sa',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('122','2','Sardinian','Sardinian','sc',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('123','2','Sindhi','Sindhi','sd',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('124','2','Northern Sami','Northern Sami','se',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('125','2','Samoan','Samoan','sm',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('126','2','Sango','Sango','sg',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('127','2','Serbian','Serbian','sr',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('128','2','Gaelic','Gaelic','gd',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('129','2','Shona','Shona','sn',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('130','2','Sinhala','Sinhala','si',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('131','2','Slovak','Slovak','sk',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('132','2','Slovene','Slovene','sl',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('133','2','Somali','Somali','so',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('134','2','Southern Sotho','Southern Sotho','st',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('135','2','Sundanese','Sundanese','su',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('136','2','Swahili','Swahili','sw',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('137','2','Swati','Swati','ss',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('138','2','Swedish','Swedish','sv',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('139','1','Tamil','Tamil','ta',NULL,NULL,'9','1',NOW(),NULL,NULL),
('140','2','Telugu','Telugu','te',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('141','2','Tajik','Tajik','tg',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('142','2','Thai','Thai','th',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('143','2','Tigrinya','Tigrinya','ti',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('144','2','Tibetan','Tibetan','bo',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('145','2','Turkmen','Turkmen','tk',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('146','2','Tagalog','Tagalog','tl',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('147','2','Tswana','Tswana','tn',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('148','2','Tonga','Tonga','to',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('149','2','Turkish','Turkish','tr',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('150','2','Tsonga','Tsonga','ts',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('151','2','Tatar','Tatar','tt',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('152','2','Twi','Twi','tw',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('153','2','Tahitian','Tahitian','ty',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('154','2','Uighur','Uighur','ug',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('155','2','Ukrainian','Ukrainian','uk',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('156','2','Urdu','Urdu','ur',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('157','2','Uzbek','Uzbek','uz',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('158','2','Venda','Venda','ve',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('159','1','Vietnamese','Vietnamese','vi',NULL,NULL,'8','1',NOW(),NULL,NULL),
('160','2','Volapük','Volapük','vo',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('161','2','Walloon','Walloon','wa',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('162','2','Welsh','Welsh','cy',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('163','2','Wolof','Wolof','wo',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('164','2','Xhosa','Xhosa','xh',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('165','2','Yoruba','Yoruba','yo',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('166','2','Zhuang','Zhuang','za',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('167','2','Zulu','Zulu','zu',NULL,NULL,NULL,'1',NOW(),NULL,NULL),
('168','1','Chinese Traditional','繁體中文','zh_tn',NULL,NULL,4,'1',NOW(),NULL,NULL);

CREATE TABLE `admin_user` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`group_company_code` BIGINT (20) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`language_id` INT UNSIGNED NOT NULL DEFAULT 40,
`login_name` VARCHAR (100) NOT NULL,
`login_pwd` VARCHAR (200) NOT NULL,
`pwd_expiry` TINYINT (4) DEFAULT NULL,
`transaction_pwd1` VARCHAR (200) DEFAULT NULL,
`transaction_pwd2` VARCHAR (200) DEFAULT NULL,
`matrix_pwd` VARCHAR (200) DEFAULT NULL,
`login_attempts` TINYINT (4) NULL,
`first_name` VARCHAR (200) NOT NULL,
`last_name` VARCHAR (200) DEFAULT NULL,
`email_id1` VARCHAR (100) NOT NULL,
`email_id2` VARCHAR (100) DEFAULT NULL,
`cell_phone1` VARCHAR (200) DEFAULT NULL,
`cell_phone2` VARCHAR (200) DEFAULT NULL,
`timezone` VARCHAR (200) DEFAULT NULL,
`is_super_admin` TINYINT (4) NOT NULL,
`is_master_admin` TINYINT (4) NOT NULL,
`image1_path` VARCHAR (200) DEFAULT NULL,
`image2_path` VARCHAR (200) DEFAULT NULL,
`external_user_id` VARCHAR (200) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`created_by` INT (11) NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_ADMIN_USER_LOGIN_NAME` (`login_name`),
KEY `IDX_ADMIN_USER_GROUP_COMPANY_CODE` (`group_company_code`),
KEY `IDX_ADMIN_USER_EMAIL_ID1` (`email_id1`),
CONSTRAINT `FK_ADMIN_USER_IS_ACTIVE` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_ADMIN_USER_LANG_ID` FOREIGN KEY (`language_id`) REFERENCES `language_master` (`id`) 
) ENGINE=INNODB;

INSERT INTO admin_user (`id`,`login_name`, `login_pwd`,`status_id`,`language_id`,`group_company_code`,`first_name`,`email_id1`,`is_super_admin`,`is_master_admin`,`created_by`,`created_date`,`timezone`,`cell_phone1`) VALUES (1,'infraadmin','808d63ba47fcef6a7c52ec47cb63eb1b747a9d527a77385fc05c8a5ce8007586265d003b4130f6b0c8f3bb2ad89965a5da07289ba5d1e35321e160bea4f766f8',1,40,UNIX_TIMESTAMP(),'Admin','admin@teknowmics.com','1',0,1,now(),'Asia/Tokyo',12345678) ;

CREATE TABLE `country_master` (
`id` INT UNSIGNED NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`name` VARCHAR (150) NOT NULL,
`code_iso` VARCHAR (150) DEFAULT NULL,
`code_un` VARCHAR (150) DEFAULT NULL,
`country_code` INT NOT NULL,
`country_flag_path` VARCHAR (200) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_COUNTRY_MASTER_STATUS` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
UNIQUE KEY `code_iso` (`code_iso`, `name`),
UNIQUE KEY `code_un` (`code_un`, `name`)
) ENGINE=INNODB;

INSERT INTO `country_master` (`id`, `status_id`, `name`, `code_iso`, `code_un`, `country_code`, `country_flag_path`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1,1,'Afghanistan','AF','AFG','93',NULL,1,NOW(),NULL,NULL),
(2,2,'Aland Islands','AX','ALA','358',NULL,1,NOW(),NULL,NULL),
(3,2,'Albania','AL','ALB','355',NULL,1,NOW(),NULL,NULL),
(4,2,'Algeria','DZ','DZA','213',NULL,1,NOW(),NULL,NULL),
(5,2,'American Samoa','AS','ASM','684',NULL,1,NOW(),NULL,NULL),
(6,2,'Andorra','AD','AND','376',NULL,1,NOW(),NULL,NULL),
(7,2,'Angola','AO','AGO','244',NULL,1,NOW(),NULL,NULL),
(8,2,'Anguilla','AI','AIA','264',NULL,1,NOW(),NULL,NULL),
(9,2,'Antarctica','AQ','ATA','672',NULL,1,NOW(),NULL,NULL),
(10,2,'Antigua and Barbuda','AG','ATG','268',NULL,1,NOW(),NULL,NULL),
(11,2,'Argentina','AR','ARG','54',NULL,1,NOW(),NULL,NULL),
(12,2,'Armenia','AM','ARM','374',NULL,1,NOW(),NULL,NULL),
(13,2,'Aruba','AW','ABW','297',NULL,1,NOW(),NULL,NULL),
(14,2,'Australia','AU','AUS','61',NULL,1,NOW(),NULL,NULL),
(15,2,'Austria','AT','AUT','43',NULL,1,NOW(),NULL,NULL),
(16,2,'Azerbaijan','AZ','AZE','994',NULL,1,NOW(),NULL,NULL),
(17,2,'Bahamas','BS','BHS','242',NULL,1,NOW(),NULL,NULL),
(18,1,'Bahrain','BH','BHR','973',NULL,1,NOW(),NULL,NULL),
(19,1,'Bangladesh','BD','BGD','880',NULL,1,NOW(),NULL,NULL),
(20,2,'Barbados','BB','BRB','246',NULL,1,NOW(),NULL,NULL),
(21,2,'Belarus','BY','BLR','375',NULL,1,NOW(),NULL,NULL),
(22,2,'Belgium','BE','BEL','32',NULL,1,NOW(),NULL,NULL),
(23,2,'Belize','BZ','BLZ','501',NULL,1,NOW(),NULL,NULL),
(24,2,'Benin','BJ','BEN','229',NULL,1,NOW(),NULL,NULL),
(25,2,'Bermuda','BM','BMU','441',NULL,1,NOW(),NULL,NULL),
(26,2,'Bhutan','BT','BTN','975',NULL,1,NOW(),NULL,NULL),
(27,2,'Bolivia','BO','BOL','591',NULL,1,NOW(),NULL,NULL),
(28,2,'Bonaire','BQ','Bonaire','535',NULL,1,NOW(),NULL,NULL),
(29,2,'Bosnia and Herzegovina','BA','BIH','387',NULL,1,NOW(),NULL,NULL),
(30,2,'Botswana','BW','BWA','267',NULL,1,NOW(),NULL,NULL),
(31,2,'Bouvet Island','BV','BVT','123',NULL,1,NOW(),NULL,NULL),
(32,2,'Brazil','BR','BRA','55',NULL,1,NOW(),NULL,NULL),
(33,2,'British Indian Ocean Territory','IO','IOT','246',NULL,1,NOW(),NULL,NULL),
(34,1,'Brunei','BN','BRN','673',NULL,1,NOW(),NULL,NULL),
(35,2,'Bulgaria','BG','BGR','359',NULL,1,NOW(),NULL,NULL),
(36,2,'Burkina Faso','BF','BFA','226',NULL,1,NOW(),NULL,NULL),
(37,2,'Burundi','BI','BDI','257',NULL,1,NOW(),NULL,NULL),
(38,1,'Cambodia','KH','KHM','855',NULL,1,NOW(),NULL,NULL),
(39,2,'Cameroon','CM','CMR','237',NULL,1,NOW(),NULL,NULL),
(40,2,'Canada','CA','CAN',1,NULL,1,NOW(),NULL,NULL),
(41,2,'Cape Verde','CV','CPV','238',NULL,1,NOW(),NULL,NULL),
(42,2,'Cayman Islands','KY','CYM','345',NULL,1,NOW(),NULL,NULL),
(43,2,'Central African Republic','CF','CAF','236',NULL,1,NOW(),NULL,NULL),
(44,2,'Chad','TD','TCD','235',NULL,1,NOW(),NULL,NULL),
(45,2,'Chile','CL','CHL','56',NULL,1,NOW(),NULL,NULL),
(46,1,'China','CN','CHN','86',NULL,1,NOW(),NULL,NULL),
(47,2,'Christmas Island','CX','CXR','61',NULL,1,NOW(),NULL,NULL),
(48,2,'Cocos (Keeling) Islands','CC','CCK','61',NULL,1,NOW(),NULL,NULL),
(49,2,'Colombia','CO','COL','57',NULL,1,NOW(),NULL,NULL),
(50,2,'Comoros','KM','COM','269',NULL,1,NOW(),NULL,NULL),
(51,2,'Congo','CG','COG','242',NULL,1,NOW(),NULL,NULL),
(52,2,'Cook Islands','CK','COK','682',NULL,1,NOW(),NULL,NULL),
(53,2,'Costa Rica','CR','CRI','506',NULL,1,NOW(),NULL,NULL),
(54,2,'Cote d\'ivoire (Ivory Coast)','CI','CIV','225',NULL,1,NOW(),NULL,NULL),
(55,2,'Croatia','HR','HRV','385',NULL,1,NOW(),NULL,NULL),
(56,2,'Cuba','CU','CUB','53',NULL,1,NOW(),NULL,NULL),
(57,2,'Curacao','CW','CUW','599',NULL,1,NOW(),NULL,NULL),
(58,2,'Cyprus','CY','CYP','357',NULL,1,NOW(),NULL,NULL),
(59,2,'Czech Republic','CZ','CZE','420',NULL,1,NOW(),NULL,NULL),
(60,2,'Democratic Republic of the Congo','CD','COD','243',NULL,1,NOW(),NULL,NULL),
(61,2,'Denmark','DK','DNK','45',NULL,1,NOW(),NULL,NULL),
(62,2,'Djibouti','DJ','DJI','253',NULL,1,NOW(),NULL,NULL),
(63,2,'Dominica','DM','DMA','767',NULL,1,NOW(),NULL,NULL),
(64,2,'Dominican Republic','DO','DOM','809',NULL,1,NOW(),NULL,NULL),
(65,2,'Ecuador','EC','ECU','593',NULL,1,NOW(),NULL,NULL),
(66,2,'Egypt','EG','EGY','20',NULL,1,NOW(),NULL,NULL),
(67,2,'El Salvador','SV','SLV','503',NULL,1,NOW(),NULL,NULL),
(68,2,'Equatorial Guinea','GQ','GNQ','240',NULL,1,NOW(),NULL,NULL),
(69,2,'Eritrea','ER','ERI','291',NULL,1,NOW(),NULL,NULL),
(70,2,'Estonia','EE','EST','372',NULL,1,NOW(),NULL,NULL),
(71,2,'Ethiopia','ET','ETH','251',NULL,1,NOW(),NULL,NULL),
(72,2,'Falkland Islands (Malvinas)','FK','FLK','500',NULL,1,NOW(),NULL,NULL),
(73,2,'Faroe Islands','FO','FRO','298',NULL,1,NOW(),NULL,NULL),
(74,2,'Fiji','FJ','FJI','679',NULL,1,NOW(),NULL,NULL),
(75,2,'Finland','FI','FIN','358',NULL,1,NOW(),NULL,NULL),
(76,2,'France','FR','FRA','33',NULL,1,NOW(),NULL,NULL),
(77,2,'French Guiana','GF','GUF','594',NULL,1,NOW(),NULL,NULL),
(78,2,'French Polynesia','PF','PYF','689',NULL,1,NOW(),NULL,NULL),
(79,2,'French Southern Territories','TF','ATF','123',NULL,1,NOW(),NULL,NULL),
(80,2,'Gabon','GA','GAB','241',NULL,1,NOW(),NULL,NULL),
(81,2,'Gambia','GM','GMB','220',NULL,1,NOW(),NULL,NULL),
(82,2,'Georgia','GE','GEO','995',NULL,1,NOW(),NULL,NULL),
(83,2,'Germany','DE','DEU','49',NULL,1,NOW(),NULL,NULL),
(84,2,'Ghana','GH','GHA','233',NULL,1,NOW(),NULL,NULL),
(85,2,'Gibraltar','GI','GIB','350',NULL,1,NOW(),NULL,NULL),
(86,2,'Greece','GR','GRC','30',NULL,1,NOW(),NULL,NULL),
(87,2,'Greenland','GL','GRL','299',NULL,1,NOW(),NULL,NULL),
(88,2,'Grenada','GD','GRD','473',NULL,1,NOW(),NULL,NULL),
(89,2,'Guadaloupe','GP','GLP','590',NULL,1,NOW(),NULL,NULL),
(90,2,'Guam','GU','GUM','671',NULL,1,NOW(),NULL,NULL),
(91,2,'Guatemala','GT','GTM','502',NULL,1,NOW(),NULL,NULL),
(92,2,'Guernsey','GG','GGY','44',NULL,1,NOW(),NULL,NULL),
(93,2,'Guinea','GN','GIN','224',NULL,1,NOW(),NULL,NULL),
(94,2,'Guinea-Bissau','GW','GNB','245',NULL,1,NOW(),NULL,NULL),
(95,2,'Guyana','GY','GUY','592',NULL,1,NOW(),NULL,NULL),
(96,2,'Haiti','HT','HTI','509',NULL,1,NOW(),NULL,NULL),
(97,2,'Heard Island and McDonald Islands','HM','HMD','123',NULL,1,NOW(),NULL,NULL),
(98,2,'Honduras','HN','HND','504',NULL,1,NOW(),NULL,NULL),
(99,1,'Hong Kong','HK','HKG','852',NULL,1,NOW(),NULL,NULL),
(100,2,'Hungary','HU','HUN','36',NULL,1,NOW(),NULL,NULL),
(101,2,'Iceland','IS','ISL','354',NULL,1,NOW(),NULL,NULL),
(102,1,'India','IN','IND','91',NULL,1,NOW(),NULL,NULL),
(103,1,'Indonesia','ID','IDN','62',NULL,1,NOW(),NULL,NULL),
(104,1,'Iran','IR','IRN','98',NULL,1,NOW(),NULL,NULL),
(105,1,'Iraq','IQ','IRQ','964',NULL,1,NOW(),NULL,NULL),
(106,2,'Ireland','IE','IRL','353',NULL,1,NOW(),NULL,NULL),
(107,2,'Isle of Man','IM','IMN','44',NULL,1,NOW(),NULL,NULL),
(108,1,'Israel','IL','ISR','972',NULL,1,NOW(),NULL,NULL),
(109,2,'Italy','IT','ITA','39',NULL,1,NOW(),NULL,NULL),
(110,2,'Jamaica','JM','JAM','876',NULL,1,NOW(),NULL,NULL),
(111,1,'Japan','JP','JPN','81',NULL,1,NOW(),NULL,NULL),
(112,2,'Jersey','JE','JEY','44',NULL,1,NOW(),NULL,NULL),
(113,1,'Jordan','JO','JOR','962',NULL,1,NOW(),NULL,NULL),
(114,1,'Kazakhstan','KZ','KAZ','7',NULL,1,NOW(),NULL,NULL),
(115,2,'Kenya','KE','KEN','254',NULL,1,NOW(),NULL,NULL),
(116,2,'Kiribati','KI','KIR','686',NULL,1,NOW(),NULL,NULL),
(117,2,'Kosovo','XK','---','381',NULL,1,NOW(),NULL,NULL),
(118,1,'Kuwait','KW','KWT','965',NULL,1,NOW(),NULL,NULL),
(119,1,'Kyrgyzstan','KG','KGZ','996',NULL,1,NOW(),NULL,NULL),
(120,1,'Laos','LA','LAO','856',NULL,1,NOW(),NULL,NULL),
(121,2,'Latvia','LV','LVA','371',NULL,1,NOW(),NULL,NULL),
(122,1,'Lebanon','LB','LBN','961',NULL,1,NOW(),NULL,NULL),
(123,2,'Lesotho','LS','LSO','266',NULL,1,NOW(),NULL,NULL),
(124,2,'Liberia','LR','LBR','231',NULL,1,NOW(),NULL,NULL),
(125,2,'Libya','LY','LBY','218',NULL,1,NOW(),NULL,NULL),
(126,2,'Liechtenstein','LI','LIE','423',NULL,1,NOW(),NULL,NULL),
(127,2,'Lithuania','LT','LTU','370',NULL,1,NOW(),NULL,NULL),
(128,2,'Luxembourg','LU','LUX','352',NULL,1,NOW(),NULL,NULL),
(129,2,'Macao','MO','MAC','853',NULL,1,NOW(),NULL,NULL),
(130,2,'Macedonia','MK','MKD','389',NULL,1,NOW(),NULL,NULL),
(131,2,'Madagascar','MG','MDG','261',NULL,1,NOW(),NULL,NULL),
(132,2,'Malawi','MW','MWI','265',NULL,1,NOW(),NULL,NULL),
(133,1,'Malaysia','MY','MYS','60',NULL,1,NOW(),NULL,NULL),
(134,1,'Maldives','MV','MDV','960',NULL,1,NOW(),NULL,NULL),
(135,2,'Mali','ML','MLI','223',NULL,1,NOW(),NULL,NULL),
(136,2,'Malta','MT','MLT','356',NULL,1,NOW(),NULL,NULL),
(137,2,'Marshall Islands','MH','MHL','692',NULL,1,NOW(),NULL,NULL),
(138,2,'Martinique','MQ','MTQ','596',NULL,1,NOW(),NULL,NULL),
(139,2,'Mauritania','MR','MRT','222',NULL,1,NOW(),NULL,NULL),
(140,2,'Mauritius','MU','MUS','230',NULL,1,NOW(),NULL,NULL),
(141,2,'Mayotte','YT','MYT','262',NULL,1,NOW(),NULL,NULL),
(142,2,'Mexico','MX','MEX','52',NULL,1,NOW(),NULL,NULL),
(143,2,'Micronesia','FM','FSM','691',NULL,1,NOW(),NULL,NULL),
(144,2,'Moldava','MD','MDA','373',NULL,1,NOW(),NULL,NULL),
(145,2,'Monaco','MC','MCO','377',NULL,1,NOW(),NULL,NULL),
(146,1,'Mongolia','MN','MNG','976',NULL,1,NOW(),NULL,NULL),
(147,2,'Montenegro','ME','MNE','382',NULL,1,NOW(),NULL,NULL),
(148,2,'Montserrat','MS','MSR','664',NULL,1,NOW(),NULL,NULL),
(149,2,'Morocco','MA','MAR','212',NULL,1,NOW(),NULL,NULL),
(150,2,'Mozambique','MZ','MOZ','258',NULL,1,NOW(),NULL,NULL),
(151,2,'Myanmar (Burma)','MM','MMR','95',NULL,1,NOW(),NULL,NULL),
(152,2,'Namibia','NA','NAM','264',NULL,1,NOW(),NULL,NULL),
(153,2,'Nauru','NR','NRU','674',NULL,1,NOW(),NULL,NULL),
(154,1,'Nepal','NP','NPL','977',NULL,1,NOW(),NULL,NULL),
(155,2,'Netherlands','NL','NLD','31',NULL,1,NOW(),NULL,NULL),
(156,2,'New Caledonia','NC','NCL','687',NULL,1,NOW(),NULL,NULL),
(157,2,'New Zealand','NZ','NZL','64',NULL,1,NOW(),NULL,NULL),
(158,2,'Nicaragua','NI','NIC','505',NULL,1,NOW(),NULL,NULL),
(159,2,'Niger','NE','NER','227',NULL,1,NOW(),NULL,NULL),
(160,2,'Nigeria','NG','NGA','234',NULL,1,NOW(),NULL,NULL),
(161,2,'Niue','NU','NIU','683',NULL,1,NOW(),NULL,NULL),
(162,2,'Norfolk Island','NF','NFK','672',NULL,1,NOW(),NULL,NULL),
(163,1,'North Korea','KP','PRK','850',NULL,1,NOW(),NULL,NULL),
(164,2,'Northern Mariana Islands','MP','MNP','670',NULL,1,NOW(),NULL,NULL),
(165,2,'Norway','NO','NOR','47',NULL,1,NOW(),NULL,NULL),
(166,1,'Oman','OM','OMN','968',NULL,1,NOW(),NULL,NULL),
(167,1,'Pakistan','PK','PAK','92',NULL,1,NOW(),NULL,NULL),
(168,2,'Palau','PW','PLW','680',NULL,1,NOW(),NULL,NULL),
(169,2,'Palestine','PS','PSE','970',NULL,1,NOW(),NULL,NULL),
(170,2,'Panama','PA','PAN','507',NULL,1,NOW(),NULL,NULL),
(171,2,'Papua New Guinea','PG','PNG','675',NULL,1,NOW(),NULL,NULL),
(172,2,'Paraguay','PY','PRY','595',NULL,1,NOW(),NULL,NULL),
(173,2,'Peru','PE','PER','51',NULL,1,NOW(),NULL,NULL),
(174,1,'Phillipines','PH','PHL','63',NULL,1,NOW(),NULL,NULL),
(175,2,'Pitcairn','PN','PCN','123',NULL,1,NOW(),NULL,NULL),
(176,2,'Poland','PL','POL','48',NULL,1,NOW(),NULL,NULL),
(177,2,'Portugal','PT','PRT','351',NULL,1,NOW(),NULL,NULL),
(178,2,'Puerto Rico','PR','PRI','939',NULL,1,NOW(),NULL,NULL),
(179,1,'Qatar','QA','QAT','974',NULL,1,NOW(),NULL,NULL),
(180,2,'Reunion','RE','REU','262',NULL,1,NOW(),NULL,NULL),
(181,2,'Romania','RO','ROU','40',NULL,1,NOW(),NULL,NULL),
(182,2,'Russia','RU','RUS','7',NULL,1,NOW(),NULL,NULL),
(183,2,'Rwanda','RW','RWA','250',NULL,1,NOW(),NULL,NULL),
(184,2,'Saint Barthelemy','BL','BLM','590',NULL,1,NOW(),NULL,NULL),
(185,2,'Saint Helena','SH','Ascension and Tristan da Cunha','123',NULL,1,NOW(),NULL,NULL),
(186,2,'Saint Kitts and Nevis','KN','KNA','869',NULL,1,NOW(),NULL,NULL),
(187,2,'Saint Lucia','LC','LCA','758',NULL,1,NOW(),NULL,NULL),
(188,2,'Saint Martin','MF','MAF','590',NULL,1,NOW(),NULL,NULL),
(189,2,'Saint Pierre and Miquelon','PM','SPM','508',NULL,1,NOW(),NULL,NULL),
(190,2,'Saint Vincent and the Grenadines','VC','VCT','784',NULL,1,NOW(),NULL,NULL),
(191,2,'Samoa','WS','WSM','685',NULL,1,NOW(),NULL,NULL),
(192,2,'San Marino','SM','SMR','378',NULL,1,NOW(),NULL,NULL),
(193,2,'Sao Tome and Principe','ST','STP','239',NULL,1,NOW(),NULL,NULL),
(194,1,'Saudi Arabia','SA','SAU','966',NULL,1,NOW(),NULL,NULL),
(195,2,'Senegal','SN','SEN','221',NULL,1,NOW(),NULL,NULL),
(196,2,'Serbia','RS','SRB','381',NULL,1,NOW(),NULL,NULL),
(197,2,'Seychelles','SC','SYC','248',NULL,1,NOW(),NULL,NULL),
(198,2,'Sierra Leone','SL','SLE','232',NULL,1,NOW(),NULL,NULL),
(199,1,'Singapore','SG','SGP','65',NULL,1,NOW(),NULL,NULL),
(200,2,'Sint Maarten','SX','SXM','721',NULL,1,NOW(),NULL,NULL),
(201,2,'Slovakia','SK','SVK','421',NULL,1,NOW(),NULL,NULL),
(202,2,'Slovenia','SI','SVN','386',NULL,1,NOW(),NULL,NULL),
(203,2,'Solomon Islands','SB','SLB','677',NULL,1,NOW(),NULL,NULL),
(204,2,'Somalia','SO','SOM','252',NULL,1,NOW(),NULL,NULL),
(205,2,'South Africa','ZA','ZAF','27',NULL,1,NOW(),NULL,NULL),
(206,2,'South Georgia and the South Sandwich Islands','GS','SGS','500',NULL,1,NOW(),NULL,NULL),
(207,1,'South Korea','KR','KOR','82',NULL,1,NOW(),NULL,NULL),
(208,2,'South Sudan','SS','SSD','211',NULL,1,NOW(),NULL,NULL),
(209,2,'Spain','ES','ESP','34',NULL,1,NOW(),NULL,NULL),
(210,1,'Sri Lanka','LK','LKA','94',NULL,1,NOW(),NULL,NULL),
(211,2,'Sudan','SD','SDN','249',NULL,1,NOW(),NULL,NULL),
(212,2,'Suriname','SR','SUR','597',NULL,1,NOW(),NULL,NULL),
(213,2,'Svalbard and Jan Mayen','SJ','SJM','47',NULL,1,NOW(),NULL,NULL),
(214,2,'Swaziland','SZ','SWZ','268',NULL,1,NOW(),NULL,NULL),
(215,2,'Sweden','SE','SWE','46',NULL,1,NOW(),NULL,NULL),
(216,2,'Switzerland','CH','CHE','41',NULL,1,NOW(),NULL,NULL),
(217,1,'Syria','SY','SYR','963',NULL,1,NOW(),NULL,NULL),
(218,1,'Taiwan','TW','TWN','886',NULL,1,NOW(),NULL,NULL),
(219,1,'Tajikistan','TJ','TJK','992',NULL,1,NOW(),NULL,NULL),
(220,2,'Tanzania','TZ','TZA','255',NULL,1,NOW(),NULL,NULL),
(221,1,'Thailand','TH','THA','66',NULL,1,NOW(),NULL,NULL),
(222,2,'Timor-Leste (East Timor)','TL','TLS','670',NULL,1,NOW(),NULL,NULL),
(223,2,'Togo','TG','TGO','228',NULL,1,NOW(),NULL,NULL),
(224,2,'Tokelau','TK','TKL','690',NULL,1,NOW(),NULL,NULL),
(225,2,'Tonga','TO','TON','676',NULL,1,NOW(),NULL,NULL),
(226,2,'Trinidad and Tobago','TT','TTO','868',NULL,1,NOW(),NULL,NULL),
(227,2,'Tunisia','TN','TUN','216',NULL,1,NOW(),NULL,NULL),
(228,2,'Turkey','TR','TUR','90',NULL,1,NOW(),NULL,NULL),
(229,1,'Turkmenistan','TM','TKM','993',NULL,1,NOW(),NULL,NULL),
(230,2,'Turks and Caicos Islands','TC','TCA','649',NULL,1,NOW(),NULL,NULL),
(231,2,'Tuvalu','TV','TUV','688',NULL,1,NOW(),NULL,NULL),
(232,2,'Uganda','UG','UGA','256',NULL,1,NOW(),NULL,NULL),
(233,2,'Ukraine','UA','UKR','380',NULL,1,NOW(),NULL,NULL),
(234,1,'United Arab Emirates','AE','ARE','971',NULL,1,NOW(),NULL,NULL),
(235,2,'United Kingdom','GB','GBR','44',NULL,1,NOW(),NULL,NULL),
(236,1,'United States','US','USA',1,NULL,1,NOW(),NULL,NULL),
(237,2,'United States Minor Outlying Islands','UM','UMI','123',NULL,1,NOW(),NULL,NULL),
(238,2,'Uruguay','UY','URY','598',NULL,1,NOW(),NULL,NULL),
(239,1,'Uzbekistan','UZ','UZB','998',NULL,1,NOW(),NULL,NULL),
(240,2,'Vanuatu','VU','VUT','678',NULL,1,NOW(),NULL,NULL),
(241,2,'Vatican City','VA','VAT','39',NULL,1,NOW(),NULL,NULL),
(242,2,'Venezuela','VE','VEN','58',NULL,1,NOW(),NULL,NULL),
(243,1,'Vietnam','VN','VNM','84',NULL,1,NOW(),NULL,NULL),
(244,2,'Virgin Islands','VG','British Virgin Islands','123',NULL,1,NOW(),NULL,NULL),
(245,2,'Virgin Islands','VI','Virgin Islands of the United States','123',NULL,1,NOW(),NULL,NULL),
(246,2,'Wallis and Futuna','WF','WLF','681',NULL,1,NOW(),NULL,NULL),
(247,2,'Western Sahara','EH','ESH','212',NULL,1,NOW(),NULL,NULL),
(248,1,'Yemen','YE','YEM','967',NULL,1,NOW(),NULL,NULL),
(249,2,'Zambia','ZM','ZMB','260',NULL,1,NOW(),NULL,NULL),
(250,2,'Zimbabwe','ZW','ZWE','263',NULL,1,NOW(),NULL,NULL),
(251,2,'United Arab Emirates','UAE','UAE','971',NULL,1,NOW(),NULL,NULL);
  
  
CREATE TABLE `company_master` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_company_code` BIGINT (20) NOT NULL,
  `company_code` BIGINT (20) NOT NULL,
  `country_id` INT UNSIGNED NOT NULL,
  `status_id` INT UNSIGNED NOT NULL,
  `legal_name` VARCHAR (200) NOT NULL,
  `comments` VARCHAR (200) DEFAULT NULL,
  `company_type` ENUM ('Regular', 'Trial'),
  `expiry_date` DATETIME DEFAULT NULL,
  `company_url` VARCHAR (100) NULL,
  `created_by` INT NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_by` INT DEFAULT NULL,
  `updated_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_UNIQUE_KEY_COMPANY_CODE` (`company_code`),
  FULLTEXT KEY `IDX_COMPANY_MASTER_LEGAL_NAME` (`legal_name`),
  KEY `IDX_COMPANY_MASTER_GROUP_COMPANY_CODE` (`group_company_code`),
  CONSTRAINT `FK_COMPANY_MASTER_COUNTRY_ID` FOREIGN KEY (`country_id`) REFERENCES `country_master` (`id`),
  CONSTRAINT `FK_COMPANY_MASTER_STATUS` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `company_admin` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_code` BIGINT (20) NOT NULL,
  `group_company_code` BIGINT (20) NOT NULL,
  `status_id` INT UNSIGNED NOT NULL,
  `login_name` VARCHAR (100) NOT NULL,
  `first_name` VARCHAR (200) NOT NULL,
  `last_name` VARCHAR (200) DEFAULT NULL,
  `external_user_id` VARCHAR (200) DEFAULT NULL,
  `email_id1` VARCHAR (100) DEFAULT NULL,
  `email_id2` VARCHAR (100) DEFAULT NULL,
  `cell_phone1` VARCHAR (200) DEFAULT NULL,
  `cell_phone2` VARCHAR (200) DEFAULT NULL,
  `timezone` VARCHAR (200) NOT NULL,
  `image1_path` VARCHAR (200) DEFAULT NULL,
  `image2_path` VARCHAR (200) DEFAULT NULL,
  `comments` VARCHAR (200) DEFAULT NULL,
  `created_by` INT NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_by` INT DEFAULT NULL,
  `updated_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IDX_COMBO_VALUE_COMPANY_CODE_EMAIL1` (`company_code`,`email_id1`),
  UNIQUE INDEX `IDX_COMBO_VALUE_COMPANY_CODE_LOGIN_NAME` (`company_code`,`login_name`),
  KEY `IDX_COMPANY_ADMIN_GROUP_COMPANY_CODE` (`group_company_code`),
  CONSTRAINT `FK_COMPANY_ADMIN_STATUS` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `company_host_mapping` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` BIGINT (20) NOT NULL,
`host_name` VARCHAR (150) NOT NULL,
`company_db_name` VARCHAR (100) NOT NULL,
`authentication_type` VARCHAR (100) NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_COMPANY_HOST_MAPPING_HOST_COMPANY_COMPANY_CODE` (`host_name`,`company_code`),
KEY `IDX_COMPANY_HOST_MAPPING_HOST_COMPANY_DB_NAME` (`company_db_name`)
) ENGINE=INNODB;

CREATE TABLE `application_config`(
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`key` VARCHAR(100) NOT NULL,
`value` VARCHAR(300) NOT NULL,
`status_id` TINYINT(1) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_COMBO_KEY_VALUE` (`key`)
) ENGINE=INNODB;

INSERT INTO `application_config` (`id`, `key`, `value`, `status_id`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1,'APPLICATION_TITLE','SmartDocs','1','1',NOW(),NULL,NULL),
(2,'APPLICATION_LOGO','','1','1',NOW(),NULL,NULL),
(3,'APPLICATION_FOOTER','SmartDocs footer','1','1',NOW(),NULL,NULL),
(4,'STORAGE_TYPE','SOFTLAYER','1','1',NOW(),NULL,NULL),
(5,'STORAGE_BASE_URL','https://sng01.objectstorage.softlayer.net/Smartdocs','1','1',NOW(),NULL,NULL),
(6,'STORAGE_CREDENTIAL_1','SLOS383592-2:SL383592','1','1',NOW(),NULL,NULL),
(7,'STORAGE_CREDENTIAL_2','954995342cf4a0ac95aa20762a8854b8f03fc52f3aa76be31c8b130b4b3cc613','1','1',NOW(),NULL,NULL),
(8,'STORAGE_KEY','zHrrjAsgyTH1JpqsIJV3RZo8YLrqOOXkUocEL/whpnnfGAKjMW7Qg/s0kG/GDHVz',1,1,NOW(),NULL,NULL),
(9,'DEFAULT_SHARE_ID','1','1','1',NOW(),NULL,NULL),
(10,'DEFAULT_DISTRIBUTION_ID','3','1','1',NOW(),NULL,NULL),
(11,'DEFAULT_LOCKER_ID','2','1','1',NOW(),NULL,NULL);
 


CREATE TABLE `publisher_config` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`status_id` INT UNSIGNED NOT NULL,
`publisher_name` VARCHAR(100) NOT NULL,
`publisher_connection_string` VARCHAR(100) NOT NULL,
`ssh_user_name` VARCHAR(50) NOT NULL,
`ssh_password` VARCHAR(100) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`)
 ) ENGINE=INNODB; 

 
CREATE TABLE `indexer_config` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`status_id` INT UNSIGNED NOT NULL,
`indexer_name` VARCHAR(100) NOT NULL,
`zookeeper_connection_string` VARCHAR(100) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`)
 ) ENGINE=INNODB;   


CREATE TABLE `setting_master`(
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`key` VARCHAR(100) NOT NULL,
`possible_values`VARCHAR(400) DEFAULT NULL,
`default_value` VARCHAR(400) DEFAULT NULL,
`property_type` ENUM('1','2','3','4','5') COMMENT '1=String, 2=Long, 3=Boolean, 4=Date, 5=Double',
`component` VARCHAR(200) NOT NULL,
`status_id` TINYINT(1) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

INSERT INTO setting_master (`id`,`key`, `possible_values`, `default_value`, `component`, `status_id`,`property_type`) VALUES
(1,'MAX_NUMBER_USER', '0', '100', 'text',  1,2),
(2,'MAX_NUMBER_DEVICE', '0', '2147483647', 'text', 1,2),
(3,'MAIL_SERVICE_EMAIL_USERNAME','0','noreply@smartdocsonline.com','text',1,1),
(4,'COMPANY_DEFAULT_CHAR_SET','0','UTF-8','text',1,1),
(5,'MAIL_SERVICE_EMAIL_PASSWORD','0','Tks123@!#@','text',1,1),
(6,'MAIL_SERVICE_EMAIL_PORT','0',587,'text',1,2),
(7,'MAIL_SERVICE_EMAIL_HOST','0','smtp.office365.com','text',1,1),
(8,'MAIL_SERVICE_STARTTLS_ENABLE','TRUE|FALSE','TRUE','checkbox',1,3),
(9,'MAX_PROJECT_FILE_VERSION','0',3,'text',1,2),
(10,'MAX_BACKUP_FILE_VERSION','0',3,'text',1,2),
(11,'MAX_SHARE_FILE_VERSION','0',3,'text',1,2),
(12,'MAX_DEPARTMENT_FILE_VERSION','0',3,'text',1,2),
(13,'MAX_MYFILE_FILE_VERSION','0',3,'text',1,2),
(14,'USER_ACTIVATION_EMAIL_TITLE','0','SmartDocs User Activation','text',1,1),
(15,'USER_ACTIVATION_EMAIL_BODY','0','Administrator has activated your SmartDocs Account.  Click Login button to continue','text',1,1),
(16,'LDAP_USER_IMPORT_EMAIL_TITLE','0','User imported from Ldap server','text',1,1),
(17,'LDAP_USER_IMPORT_EMAIL_BODY','0','Dear User, Administrator has imported you to SmartDocs. Click Login button to continue ','text',1,1),
(18,'PASSWORD_RESET_EMAIL_TITLE','0','SmartDocs Password Reset','text',1,1),
(19,'PASSWORD_RESET_EMAIL_BODY','0','Dear User, 
A Password reset requested for your Smartdoc account.  Click Login button to continue.','text',1,1),
(20,'FORGET_PASSWORD_EMAIL_TITLE','0','SmartDocs Password Reset','text',1,1),
(21,'FORGET_PASSWORD_EMAIL_BODY','0','Dear User,
A Password reset requested for your Smartdoc account.  Click Login button to continue.','text',1,1),
(22,'USER_PASSWORD_RESET_EMAIL_TITLE','0','SmartDocs Password Reset','text',1,1),
(23,'USER_PASSWORD_RESET_EMAIL_BODY','0','Dear User,
Your smartdocs account password was reset.  Click Login button to continue.','text',1,1),
(24,'IS_COMPANY_LOGO_REQUIRED_IN_EMAIL','TRUE|FALSE','TRUE','checkbox',1,3),
(25,'SD_EMAIL_SIGNATURE', '0', 'This is a system generated email, please do not reply to this email.', 'text',  1,1),
(26,'DISTRIBUTE_FILE_EMAIL_TITLE', '0', 'SmartDocs File Distribution', 'text',  1,1),
(27,'SHARE_RESOURCE_EMAIL_TITLE', '0', 'SmartDocs File/Folder sharing', 'text',  1,1),
(28,'SHARE_RESOURCE_PASSWORD_EMAIL_TITLE', '0', 'SmartDocs File/Folder sharing: Password', 'text',  1,1),
(29,'DISTRIBUTE_FILE_EMAIL_BODY', '0', 'One File is distributed', 'text',  1,1),
(30,'SHARE_RESOURCE_EMAIL_BODY', '0', 'One File/Folder is shared', 'text',  1,1),
(31,'SHARE_RESOURCE_PASSWORD_EMAIL_BODY', '0', 'One File/Folder is shared', 'text',  1,1),
(32,'DEVICE_CACHE_LIFE', '0', '24', 'text', 1,2),
(33,'IS_DEVICE_APPROVAL_REQUIRED','TRUE|FALSE','TRUE','checkbox',1,3),
(34,'SD_ALERT_EMAIL_TITLE','0','SmartDocs Notification','text',1,1),
(35,'SD_ALERT_EMAIL_BODY','0','SmartDocs Notification','text',1,1),
(36,'SD_ALERT_EMAIL_MESSAGE','0','You have one notification from SmartDocs','text',1,1),
(37,'MAX_USER_ALERT_COUNT','0','50','text',1,1),
(38,'USER_DEFAULT_QUOTA', '0', '2147483648', 'text',  1,2),
(39,'PROJECT_DEFAULT_QUOTA', '0', '2147483648', 'text',  1,2),
(40,'PARTNER_DEFAULT_QUOTA', '0', '2147483648', 'text',  1,2),
(41,'DEPARTMENT_DEFAULT_QUOTA', '0', '2147483648', 'text',  1,2),
(42,'QUOTA_ALERT_PERCENTAGE', '0', '80', 'text',  1,2),
(43,'USER_DISPLAY_FORMAT','0|1|2|3|4','0','checkbox',1,2),
(44,'APPLICATION_TITLE','0','SmartDocs','text',1,1),
(45,'APPLICATION_FOOTER','0','SmartDocs footer','text',1,1),
(46,'DEFAULT_DEVICE_PER_USER_COUNT', '0', '1000', 'text',  1,2),
(47,'WORKFLOW_OVERDUE_COMPLETE_NOTIFICATION','TRUE|FALSE','TRUE','checkbox',1,3),
(48,'WORKFLOW_CANCEL_TASK_NOTIFICATION','TRUE|FALSE','TRUE','checkbox',1,3),
(49,'WORKFLOW_WAIT_TASK_INITIATOR_NOTIFICATION','TRUE|FALSE','TRUE','checkbox',1,3),
(50,'WORKFLOW_WAIT_TASK_OBSERVER_NOTIFICATION','TRUE|FALSE','TRUE','checkbox',1,3),
(51,'MAX_REMINDER_SHARE_GROUP_COUNT','0','5','text',1,2),
(52,'REMINDER_MAX_INVITEES','0','150','text',1,2),
(53,'REMINDER_MAX_FILE','0','25','text',1,2),
(54,'MAX_REMINDER_CONTACT_GROUP_COUNT','0','5','text',1,2),
(55,'MAX_REMINDER_CONTACT_INVITEES_COUNT','0','10','text',1,2),
(56,'USER_TXN_PASSWORD_SET_EMAIL_TITLE','0','SmartDocs transaction Password Set','text',1,1),
(57,'USER_TXN_PASSWORD_SET_EMAIL_BODY','0','Dear User,
Your smartdocs account transaction password was set.','text',1,1),
(58,'USER_TXN_PASSWORD_RESET_EMAIL_TITLE','0','SmartDocs transaction Password Reset','text',1,1),
(59,'USER_TXN_PASSWORD_RESET_EMAIL_BODY','0','Dear User,
Your smartdocs account transaction password was reset.','text',1,1),
(60,'USER_TXN_PASSWORD_RESET_BY_ADMIN_EMAIL_TITLE','0','SmartDocs transaction Password Reset','text',1,1),
(61,'USER_TXN_PASSWORD_RESET_BY_ADMIN_EMAIL_BODY','0','Dear User,
Your SmartDocs account transaction password was reset by admin. Click Reset Transaction Password button to continue.','text',1,1),
(62,'USER_RESET_FORGOTTEN_TXN_PASSWORD_EMAIL_TITLE','0','SmartDocs forgotten transaction Password Reset','text',1,1),
(63,'USER_RESET_FORGOTTEN_TXN_PASSWORD_EMAIL_BODY','0','Dear User,
Transaction Password has been reset based on your request. Click Reset Transaction Password button to continue.','text',1,1),
(65,'MAILDROP_INVITATION_BODY','0','Dear User,
You are invited to upload file to mail drop folder. Reply to this mail by attaching the file to be uploaded.','text',1,1),
(72,'TXN_PWD1_MAX_RETRY_COUNT', '0', '4', 'text',  1,2),
(73,'DROP_MAIL_SERVER_EMAIL', '0', '', 'text',  1, 1),
(74,'DROP_MAIL_SERVER_HOST', '0', '', 'text',  1, 1),
(75,'DROP_MAIL_SERVER_PORT', '0', '', 'text',  1, 2),
(76,'DROP_MAIL_SERVER_PASSWORD', '0', '', 'text',  1, 1),
(77,'DROP_MAIL_SUBJECT_TARGET_FOLDER_PREFIX', '0', 'FOLDER@', 'text',  1, 1),
(78,'DROP_MAIL_SUBJECT_TARGET_USER_PREFIX', '0', 'USER@', 'text',  1, 1),
(79,'DROP_MAIL_OPEN_ACCESS_ENABLED','TRUE|FALSE','TRUE','checkbox',1,3),
(80,'MAX_LOGIN_RETRY_COUNT_FOR_LOCK','0','5','text',1,2),
(81,'NOTIFICATION_RETENTION_PERIOD_DAYS','0','90','text',1,2),
(82,'DEFAULT_PROJECT_WORKSPACE','0','','text',1,1),
(83,'ALLOW_USER_TO_CHANGE_DEFAULT_PROJECT_WORKSPACE','TRUE|FALSE','TRUE','checkbox',1,3),
(84,'SHOW_COMPANY_NAME','TRUE|FALSE','TRUE','checkbox',1,3),
(85,'DROP_MAIL_SERVER_PROTOCOL','0','pop3s','text',1,1),
(86,'DROP_MAIL_SERVER_FOLDER','0','INBOX','text',1,1),
(87,'FORCE_WORKSPACE_BACKUP','TRUE|FALSE','FALSE','checkbox',1,3),
(88,'DELETE_FILE_FROM_WORKSPACE_AFTER_CHECKIN','TRUE|FALSE','FALSE','checkbox',1,3),
(89,'EMAIL_UPLOAD_FOLDER','0','INBOX','text',1,1),
(90,'ALLOW_USER_GROUP_IN_PROJECTS','TRUE|FALSE', 'TRUE', 'checkbox',1,3),
(91,'DEPARTMENT_LEVEL_PROJECT_ONLY','TRUE|FALSE', 'FALSE', 'checkbox',1,3),
(92,'ENABLE_DICOM_VIEWER_SUPPORT', 'TRUE|FALSE', 'TRUE', 'checkbox',1,3);

CREATE TABLE `feature_master`(
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`key` VARCHAR(200) NOT NULL,
`possible_values`VARCHAR(200) DEFAULT NULL,
`default_value` VARCHAR(200) NOT NULL,
`property_type` ENUM('1','2','3','4','5') COMMENT '1=String, 2=Long, 3=Boolean, 4=Date, 5=Double',
`component` VARCHAR(200) NOT NULL,
`status_id` TINYINT(1) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

INSERT INTO feature_master (`id`,`key`, `possible_values`, default_value,property_type, component, status_id) VALUES
(1,'BACKUP', 'TRUE|FALSE', 'TRUE',3, 'checkbox',  1),
(2,'MYFILES', 'TRUE|FALSE', 'TRUE',3, 'checkbox',  1),
(3,'PROJECT', 'TRUE|FALSE', 'TRUE',3, 'checkbox',  1),
(4,'DEPARTMENT', 'TRUE|FALSE', 'TRUE',3, 'checkbox',  1),
(5,'SHARE', 'TRUE|FALSE', 'TRUE',3,'checkbox',  1),
(6,'BACKUP_PUBLISHING', 'TRUE|FALSE', 'FALSE',3,'checkbox', 1),
(7,'MYFILES_PUBLISHING', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(8,'PROJECT_PUBLISHING', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(9,'DEPARTMENT_PUBLISHING', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(10,'SHARE_PUBLISHING', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(11,'BACKUP_INDEXING', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(12,'MYFILES_INDEXING', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(13,'PROJECT_INDEXING', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(14,'DEPARTMENT_INDEXING', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(15,'SHARE_INDEXING', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(16,'FILE_ANNOTATION', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(17,'PARTNER_PROJECT', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(18,'LOCKER', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(19,'CAD_PUBLISHING', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(20,'WORKFLOW', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(21,'REMINDER', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(22,'DISTRIBUTION', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(23,'CALENDER', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(24,'TOOLS', 'TRUE|FALSE', 'TRUE',3,'checkbox', 1),
(25,'REPORTS', 'TRUE|FALSE', 'FALSE',3,'checkbox', 1),
(26,'CONTACT','TRUE|FALSE','TRUE',3,'checkbox',1),
(27,'HELP','TRUE|FALSE','TRUE',3,'checkbox',1),
(28,'DEPARTMENT_PORTAL','TRUE|FALSE','TRUE',3,'checkbox',1),
(29,'ADVANCED_WORKFLOW','TRUE|FALSE','FALSE',3,'checkbox',1);

CREATE TABLE `group_company_setting_config`(
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`key` VARCHAR(100) NOT NULL,
`value` VARCHAR(400) NOT NULL,
`group_company_code` BIGINT (20) NOT NULL,
`status_id` TINYINT(1) NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_GROUP_COMPANY_SETTING_CONFIG_KEY` (`key`),
KEY `IDX_GROUP_COMPANY_SETTING_CONFIG_STATUS_ID` (`status_id`)
) ENGINE=INNODB;


CREATE TABLE `group_company_feature_config`(
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`key` VARCHAR(100) NOT NULL,
`value` VARCHAR(200) NOT NULL,
`group_company_code` BIGINT (20)NOT NULL,
`status_id` TINYINT(1) NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;



CREATE TABLE `indexer_allocation`(
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`indexer_config_id` INT UNSIGNED NOT NULL,
`collection_name` varchar(100) DEFAULT NULL,
`code` BIGINT NOT NULL,
`type` ENUM('CC','GCC') NOT NULL COMMENT 'GC= Group_Company, GCC= Group_Company_Code' ,
`status_id` TINYINT(1) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_INDEXER_ALLOCATION_INDEXER_CONFIG_ID` FOREIGN KEY (`indexer_config_id`) REFERENCES `indexer_config` (`id`)
) ENGINE=INNODB;


CREATE TABLE `publisher_allocation`(
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`publisher_config_id` INT UNSIGNED NOT NULL,
`code` BIGINT NOT NULL,
`type` ENUM('CC','GCC') NOT NULL COMMENT 'GC= Group_Company, GCC= Group_Company_Code' ,
`status_id` TINYINT(1) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_PUBLISHER_ALLOCATION_PUBLISHER_CONFIG_ID` FOREIGN KEY (`publisher_config_id`) REFERENCES `publisher_config` (`id`)
) ENGINE=INNODB;


CREATE TABLE `timezone_master` (
`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL,
`code` VARCHAR(200) DEFAULT NULL,
`display_name` VARCHAR(200) NOT NULL,
`display_order` INT NOT NULL,
`status_id` INT(10) UNSIGNED NOT NULL,
PRIMARY KEY (`id`),
KEY `FK_TIMEZONE_MASTER_STATUS_ID` (`status_id`),
CONSTRAINT `FK_TIMEZONE_MASTER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

insert into `timezone_master` (`id`, `name`, `code`, `display_name`, `display_order`, `status_id`) values
('1','US/Arizona','Sample','(GMT-07:00) US/Arizona','0','2'),
('2','US/Mountain','Sample','(GMT-06:00) US/Mountain','0','2'),
('3','America/Bahia_Banderas','Sample','(GMT-06:00) America/Bahia_Banderas','0','2'),
('4','America/Belize','Sample','(GMT-06:00) America/Belize','0','2'),
('5','America/Cancun','Sample','(GMT-06:00) America/Cancun','0','2'),
('6','America/Chicago','Sample','(GMT-06:00) America/Chicago','0','2'),
('7','America/Costa_Rica','Sample','(GMT-06:00) America/Costa_Rica','0','2'),
('8','America/El_Salvador','Sample','(GMT-06:00) Central America','0','2'),
('9','America/Guatemala','Sample','(GMT-06:00) Central America','0','2'),
('10','America/Indiana/Knox','Sample','(GMT-06:00) Central America','0','2'),
('11','America/Indiana/Tell_City','Sample','(GMT-06:00) Central America','0','2'),
('12','America/Knox_IN','Sample','(GMT-06:00) Central America','0','2'),
('13','America/Managua','Sample','(GMT-06:00) Central America','0','2'),
('14','America/Matamoros','Sample','(GMT-06:00) Central America','0','2'),
('15','America/Menominee','Sample','(GMT-06:00) Central America','0','2'),
('16','America/Merida','Sample','(GMT-06:00) Central America','0','2'),
('17','America/Mexico_City','Sample','(GMT-06:00) Mexico City','0','2'),
('18','America/Monterrey','Sample','(GMT-06:00) Monterrey','0','2'),
('19','America/North_Dakota/Beulah','Sample','(GMT-06:00) Central America','0','2'),
('20','America/North_Dakota/Center','Sample','(GMT-06:00) Central America','0','2'),
('21','America/North_Dakota/New_Salem','Sample','(GMT-06:00) Central America','0','2'),
('22','America/Rainy_River','Sample','(GMT-06:00) Central America','0','2'),
('23','America/Rankin_Inlet','Sample','(GMT-06:00) Central America','0','2'),
('24','America/Regina','Sample','(GMT-06:00) Central America','0','2'),
('25','America/Resolute','Sample','(GMT-06:00) Central America','0','2'),
('26','America/Swift_Current','Sample','(GMT-06:00) Central America','0','2'),
('27','America/Tegucigalpa','Sample','(GMT-06:00) Central America','0','2'),
('28','America/Winnipeg','Sample','(GMT-06:00) Central America','0','2'),
('29','CST','Sample','(GMT-6:00) EST','0','2'),
('30','CST6CDT','Sample','(GMT-6:00) EST','0','2'),
('31','Canada/Central','Sample','(GMT-06:00) Canada/Central','0','2'),
('32','Canada/East-Saskatchewan','Sample','(GMT-06:00) Saskatchewan','0','2'),
('33','Canada/Saskatchewan','Sample','(GMT-06:00) Saskatchewan','0','2'),
('34','Chile/EasterIsland','Sample','(GMT-08:00) Pacific Time (US & Canada)','0','2'),
('35','Etc/GMT+6','Sample','(GMT-08:00) Pacific Time (US & Canada)','0','2'),
('36','Mexico/General','Sample','(GMT-08:00) Pacific Time (US & Canada)','0','2'),
('37','Pacific/Easter','Sample','(GMT-08:00) Pacific Time (US & Canada)','0','2'),
('38','Pacific/Galapagos','Sample','(GMT-08:00) Pacific Time (US & Canada)','0','2'),
('39','SystemV/CST6','Sample','(GMT-08:00) Pacific Time (US & Canada)','0','2'),
('40','SystemV/CST6CDT','Sample','(GMT-6:00) EST','0','2'),
('41','US/Central','Sample','(GMT-06:00) Central Time (US & Canada)','0','2'),
('42','US/Indiana-Starke','Sample','(GMT-08:00) Pacific Time (US & Canada)','0','2'),
('43','America/Atikokan','Sample','(GMT-5:00) EST','0','2'),
('44','America/Bogota','Sample','(GMT-05:00) Bogota','0','2'),
('45','America/Cayman','Sample','(GMT-5:00) EST','0','2'),
('46','America/Coral_Harbour','Sample','(GMT-5:00) EST','0','2'),
('47','America/Detroit','Sample','(GMT-5:00) EST','0','2'),
('48','America/Eirunepe','Sample','(GMT-5:00) EST','0','2'),
('49','America/Fort_Wayne','Sample','(GMT-5:00) EST','0','2'),
('50','America/Grand_Turk','Sample','(GMT-5:00) EST','0','2'),
('51','America/Guayaquil','Sample','(GMT-5:00) EST','0','2'),
('52','America/Havana','Sample','(GMT-5:00) EST','0','2'),
('53','America/Indiana/Indianapolis','Sample','(GMT-5:00) IST','0','2'),
('54','America/Indiana/Marengo','Sample','(GMT-5:00) IST','0','2'),
('55','America/Indiana/Petersburg','Sample','(GMT-5:00) EST','0','2'),
('56','America/Indiana/Vevay','Sample','(GMT-5:00) EST','0','2'),
('57','America/Indiana/Vincennes','Sample','(GMT-5:00) IST','0','2'),
('58','America/Indiana/Winamac','Sample','(GMT-5:00) EST','0','2'),
('59','America/Indianapolis','Sample','(GMT-5:00) CST','0','2'),
('60','America/Iqaluit','Sample','(GMT-5:00) EST','0','2'),
('61','America/Jamaica','Sample','(GMT-5:00) EST','0','2'),
('62','America/Kentucky/Louisville','Sample','(GMT-5:00) GMT-05:00','0','2'),
('63','America/Kentucky/Monticello','Sample','(GMT-5:00) EST','0','2'),
('64','America/Lima','Sample','(GMT-05:00) Lima','0','2'),
('65','America/Louisville','Sample','(GMT-5:00) EST','0','2'),
('66','America/Montreal','Sample','(GMT-5:00) EST','0','2'),
('67','America/Nassau','Sample','(GMT-5:00) EST','0','2'),
('68','America/New_York','Sample','(GMT-5:00) EST','0','2'),
('69','America/Nipigon','Sample','(GMT-5:00) EST','0','2'),
('70','America/Panama','Sample','(GMT-5:00) VET','0','2'),
('71','America/Pangnirtung','Sample','(GMT-5:00) AST','0','2'),
('72','America/Port-au-Prince','Sample','(GMT-5:00) AST','0','2'),
('73','America/Porto_Acre','Sample','(GMT-5:00) AST','0','2'),
('74','America/Rio_Branco','Sample','(GMT-5:00) PYT','0','2'),
('75','America/Thunder_Bay','Sample','(GMT-5:00) AST','0','2'),
('76','America/Toronto','Sample','(GMT-5:00) AST','0','2'),
('77','Brazil/Acre','Sample','(GMT-5:00) AMT','0','2'),
('78','Canada/Eastern','Sample','(GMT-05:00) Eastern Time (US & Canada)','0','2'),
('79','Cuba','Sample','(GMT-5:00) AMT','0','2'),
('80','EST','Sample','(GMT-5:00) AST','0','2'),
('81','EST5EDT','Sample','(GMT-5:00) AST','0','2'),
('82','Etc/GMT+5','Sample','(GMT-5:00) AST','0','2'),
('83','IET','Sample','(GMT-5:00) AST','0','2'),
('84','Jamaica','Sample','(GMT-5:00) AST','0','2'),
('85','SystemV/EST5','Sample','(GMT-5:00) AST','0','2'),
('86','SystemV/EST5EDT','Sample','(GMT-5:00) GYT','0','2'),
('87','US/East-Indiana','Sample','(GMT-05:00) Indiana (East)','0','2'),
('88','US/Eastern','Sample','(GMT-05:00) Eastern Time (US & Canada)','1','1'),
('89','US/Michigan','Sample','(GMT-5:00) BOT','0','2'),
('90','America/Caracas','Sample','(GMT-04:30) Caracas','0','2'),
('91','America/Anguilla','Sample','(GMT-4:00) AMT','0','2'),
('92','America/Antigua','Sample','(GMT-4:00) AST','0','2'),
('93','America/Aruba','Sample','(GMT-4:00) AST','0','2'),
('94','America/Asuncion','Sample','(GMT-4:00) AST','0','2'),
('95','America/Barbados','Sample','(GMT-4:00) AST','0','2'),
('96','America/Blanc-Sablon','Sample','(GMT-4:00) AST','0','2'),
('97','America/Boa_Vista','Sample','(GMT-4:00) AMT','0','2'),
('98','America/Campo_Grande','Sample','(GMT-4:00) AST','0','2'),
('99','America/Cuiaba','Sample','(GMT-4:00) CLST','0','2'),
('100','America/Curacao','Sample','(GMT-4:00) AST','0','2'),
('101','America/Dominica','Sample','(GMT-4:00) AST','0','2'),
('102','America/Glace_Bay','Sample','(GMT-4:00) AST','0','2'),
('103','America/Goose_Bay','Sample','(GMT-4:00) AST','0','2'),
('104','America/Grenada','Sample','(GMT-4:00) AST','0','2'),
('105','America/Guadeloupe','Sample','(GMT-4:00) AST','0','2'),
('106','America/Guyana','Sample','(GMT-4:00) AST','0','2'),
('107','America/Halifax','Sample','(GMT-4:00) AST','0','2'),
('108','America/Kralendijk','Sample','(GMT-4:00) AST','0','2'),
('109','America/La_Paz','Sample','(GMT-04:00) La Paz','0','2'),
('110','America/Lower_Princes','Sample','(GMT-4:00) AST','0','2'),
('111','America/Manaus','Sample','(GMT-4:00) AMT','0','2'),
('112','America/Marigot','Sample','(GMT-4:00) AST','0','2'),
('113','America/Martinique','Sample','(GMT-4:00) CLST','0','2'),
('114','America/Moncton','Sample','(GMT-4:00) GMT-04:00','0','2'),
('115','America/Montserrat','Sample','(GMT-4:00) AST','0','2'),
('116','America/Port_of_Spain','Sample','(GMT-4:00) AST','0','2'),
('117','America/Porto_Velho','Sample','(GMT-4:00) AST','0','2'),
('118','America/Puerto_Rico','Sample','(GMT-4:00) NT','0','2'),
('119','America/Santiago','Sample','(GMT-03:00) Santiago','0','2'),
('120','America/Santo_Domingo','Sample','(GMT-4:00) NT','0','2'),
('121','America/St_Barthelemy','Sample','(GMT-4:00) WARST','0','2'),
('122','America/St_Kitts','Sample','(GMT-4:00) BRST','0','2'),
('123','America/St_Lucia','Sample','(GMT-4:00) WARST','0','2'),
('124','America/St_Thomas','Sample','(GMT-4:00) WARST','0','2'),
('125','America/St_Vincent','Sample','(GMT-4:00) WARST','0','2'),
('126','America/Thule','Sample','(GMT-4:00) WARST','0','2'),
('127','America/Tortola','Sample','(GMT-4:00) WARST','0','2'),
('128','America/Virgin','Sample','(GMT-4:00) WARST','0','2'),
('129','Antarctica/Palmer','Sample','(GMT-4:00) WARST','0','2'),
('130','Atlantic/Bermuda','Sample','(GMT-04:00) Atlantic Time (Canada)','0','2'),
('131','Brazil/West','Sample','(GMT-4:00) WARST','0','2'),
('132','Canada/Atlantic','Sample','(GMT-04:00) Atlantic Time (Canada)','0','2'),
('133','Chile/Continental','Sample','(GMT-4:00) WARST','0','2'),
('134','Etc/GMT+4','Sample','(GMT-4:00) WARST','0','2'),
('135','PRT','Sample','(GMT-4:00) WARST','0','2'),
('136','SystemV/AST4','Sample','(GMT-4:00) BRST','0','2'),
('137','SystemV/AST4ADT','Sample','(GMT-4:00) BRST','0','2'),
('138','America/St_Johns','Sample','(GMT-3:30) WARST','0','2'),
('139','CNT','Sample','(GMT-3:30) WARST','0','2'),
('140','Canada/Newfoundland','Sample','(GMT-03:30) Newfoundland','0','2'),
('141','AGT','Sample','(GMT-3:00) WARST','0','2'),
('142','America/Araguaina','Sample','(GMT-3:00) BRST','0','2'),
('143','America/Argentina/Buenos_Aires','Sample','(GMT-03:00) Buenos Aires','0','2'),
('144','America/Argentina/Catamarca','Sample','(GMT-3:00) WARST','0','2'),
('145','America/Argentina/ComodRivadavia','Sample','(GMT-3:00) BRST','0','2'),
('146','America/Argentina/Cordoba','Sample','(GMT-3:00) WARST','0','2'),
('147','America/Argentina/Jujuy','Sample','(GMT-3:00) PMST','0','2'),
('148','America/Argentina/La_Rioja','Sample','(GMT-3:00) UYT','0','2'),
('149','America/Argentina/Mendoza','Sample','(GMT-3:00) SRT','0','2'),
('150','America/Argentina/Rio_Gallegos','Sample','(GMT-3:00) BRST','0','2'),
('151','America/Argentina/Salta','Sample','(GMT-3:00) WARST','0','2'),
('152','America/Argentina/San_Juan','Sample','(GMT-3:00) BRST','0','2'),
('153','America/Argentina/San_Luis','Sample','(GMT-3:00) BRST','0','2'),
('154','America/Argentina/Tucuman','Sample','(GMT-3:00) Rothera','0','2'),
('155','America/Argentina/Ushuaia','Sample','(GMT-3:00) FKST','0','2'),
('156','America/Bahia','Sample','(GMT-3:00) BRST','0','2'),
('157','America/Belem','Sample','(GMT-3:00) BRST','0','2'),
('158','America/Buenos_Aires','Sample','(GMT-03:00) Buenos Aires','0','2'),
('159','America/Catamarca','Sample','(GMT-3:00) FNT','0','2'),
('160','America/Cayenne','Sample','(GMT-3:00) GET','0','2'),
('161','America/Cordoba','Sample','(GMT-3:00) FNT','0','2'),
('162','America/Fortaleza','Sample','(GMT-3:00) GMT-02:00','0','2'),
('163','America/Godthab','Sample','(GMT-3:00) EGST','0','2'),
('164','America/Jujuy','Sample','(GMT-3:00) AZOT','0','2'),
('165','America/Maceio','Sample','(GMT-3:00) CVT','0','2'),
('166','America/Mendoza','Sample','(GMT-3:00) GMT-01:00','0','2'),
('167','America/Miquelon','Sample','(GMT-3:00) GMT','0','2'),
('168','America/Montevideo','Sample','(GMT-3:00) GMT','0','2'),
('169','America/Paramaribo','Sample','(GMT-3:00) GMT','0','2'),
('170','America/Recife','Sample','(GMT-3:00) GMT','0','2'),
('171','America/Rosario','Sample','(GMT-3:00) GMT','0','2'),
('172','America/Santarem','Sample','(GMT-3:00) WET','0','2'),
('173','America/Sao_Paulo','Sample','(GMT-3:00) GMT','0','2'),
('174','Antarctica/Rothera','Sample','(GMT-3:00) GMT','0','2'),
('175','Atlantic/Stanley','Sample','(GMT-3:00) WET','0','2'),
('176','BET','Sample','(GMT-3:00) GMT','0','2'),
('177','Brazil/East','Sample','(GMT-3:00) GMT','0','2'),
('178','Etc/GMT+3','Sample','(GMT-3:00) GMT','0','2'),
('179','America/Noronha','Sample','(GMT-2:00) GMT','0','2'),
('180','Atlantic/South_Georgia','Sample','(GMT-2:00) GMT','0','2'),
('181','Brazil/DeNoronha','Sample','(GMT-2:00) GMT','0','2'),
('182','Etc/GMT+2','Sample','(GMT-2:00) GMT','0','2'),
('183','America/Scoresbysund','Sample','(GMT-1:00) GMT','0','2'),
('184','Atlantic/Azores','Sample','(GMT-01:00) Azores','0','2'),
('185','Atlantic/Cape_Verde','Sample','(GMT-01:00) Cape Verde Is.','0','2'),
('186','Etc/GMT+1','Sample','(GMT-1:00) WET','0','2'),
('187','Africa/Abidjan','Sample','(GMT0:00) WET','0','2'),
('188','Africa/Accra','Sample','(GMT0:00) GMT','0','2'),
('189','Africa/Bamako','Sample','(GMT0:00) GMT','0','2'),
('190','Africa/Banjul','Sample','(GMT0:00) GMT','0','2'),
('191','Africa/Bissau','Sample','(GMT0:00) GMT+00:00','0','2'),
('192','Africa/Casablanca','Sample','(GMT+00:00) Casablanca','0','2'),
('193','Africa/Conakry','Sample','(GMT0:00) GMT+00:00','0','2'),
('194','Africa/Dakar','Sample','(GMT0:00) GMT+00:00','0','2'),
('195','Africa/El_Aaiun','Sample','(GMT0:00) GMT','0','2'),
('196','Africa/Freetown','Sample','(GMT0:00) UTC','0','2'),
('197','Africa/Lome','Sample','(GMT0:00) UTC','0','2'),
('198','Africa/Monrovia','Sample','(GMT0:00) UTC','0','2'),
('199','Africa/Nouakchott','Sample','(GMT0:00) UTC','0','2'),
('200','Africa/Ouagadougou','Sample','(GMT0:00) GMT','0','2'),
('201','Africa/Sao_Tome','Sample','(GMT0:00) GMT','0','2'),
('202','Africa/Timbuktu','Sample','(GMT0:00) GMT','0','2'),
('203','America/Danmarkshavn','Sample','(GMT0:00) GMT','0','2'),
('204','Atlantic/Canary','Sample','(GMT0:00) GMT','0','2'),
('205','Atlantic/Faeroe','Sample','(GMT0:00) WET','0','2'),
('206','Atlantic/Faroe','Sample','(GMT0:00) GMT','0','2'),
('207','Atlantic/Madeira','Sample','(GMT0:00) GMT','0','2'),
('208','Atlantic/Reykjavik','Sample','(GMT0:00) GMT','0','2'),
('209','Atlantic/St_Helena','Sample','(GMT0:00) GMT','0','2'),
('210','Eire','Sample','(GMT0:00) GMT+00:00','0','2'),
('211','Etc/GMT','Sample','(GMT0:00) GMT','0','2'),
('212','Etc/GMT+0','Sample','(GMT0:00) GMT','0','2'),
('213','Etc/GMT-0','Sample','(GMT0:00) WET','0','2'),
('214','Etc/GMT0','Sample','(GMT0:00) UTC','0','2'),
('215','Etc/Greenwich','Sample','(GMT0:00) UTC','0','2'),
('216','Etc/UCT','Sample','(GMT0:00) UTC','0','2'),
('217','Etc/UTC','Sample','(GMT0:00) WET','0','2'),
('218','Etc/Universal','Sample','(GMT0:00) UTC','0','2'),
('219','Etc/Zulu','Sample','(GMT0:00) CET','0','2'),
('220','Europe/Belfast','Sample','(GMT+00:00) Belfast','0','2'),
('221','Europe/Dublin','Sample','(GMT+00:00) Dublin','0','2'),
('222','Europe/Guernsey','Sample','(GMT+00:00) Guernsey','0','2'),
('223','Europe/Isle_of_Man','Sample','(GMT+00:00) Isle_of_Man','0','2'),
('224','Europe/Jersey','Sample','(GMT+00:00) Jersey','0','2'),
('225','Europe/Lisbon','Sample','(GMT+00:00) Lisbon','0','2'),
('226','Europe/London','Sample','(GMT+00:00) London','0','2'),
('227','GB','Sample','(GMT+00:00) WAT','0','2'),
('228','GB-Eire','Sample','(GMT+00:00) WAT','0','2'),
('229','GMT','Sample','(GMT0:00) WAT','0','2'),
('230','GMT0','Sample','(GMT0:00) WAT','0','2'),
('231','Greenwich','Sample','(GMT0:00) WAT','0','2'),
('232','Iceland','Sample','(GMT0:00) CET','0','2'),
('233','Portugal','Sample','(GMT0:00) WAT','0','2'),
('234','UCT','Sample','(GMT0:00) CET','0','2'),
('235','UTC','Sample','(GMT0:00) CET','0','2'),
('236','Universal','Sample','(GMT0:00) CET','0','2'),
('237','WET','Sample','(GMT0:00) CET','0','2'),
('238','Zulu','Sample','(GMT0:00) GMT+01:00','0','2'),
('239','Africa/Algiers','Sample','(GMT+1:00) CET','0','2'),
('240','Africa/Bangui','Sample','(GMT+1:00) CET','0','2'),
('241','Africa/Brazzaville','Sample','(GMT+1:00) CET','0','2'),
('242','Africa/Ceuta','Sample','(GMT+1:00) CET','0','2'),
('243','Africa/Douala','Sample','(GMT+1:00) CET','0','2'),
('244','Africa/Kinshasa','Sample','(GMT+1:00) CET','0','2'),
('245','Africa/Lagos','Sample','(GMT+1:00) CET','0','2'),
('246','Africa/Libreville','Sample','(GMT+1:00) CET','0','2'),
('247','Africa/Luanda','Sample','(GMT+1:00) CET','0','2'),
('248','Africa/Malabo','Sample','(GMT+1:00) CET','0','2'),
('249','Africa/Ndjamena','Sample','(GMT+1:00) CET','0','2'),
('250','Africa/Niamey','Sample','(GMT+1:00) CET','0','2'),
('251','Africa/Porto-Novo','Sample','(GMT+1:00) CET','0','2'),
('252','Africa/Tunis','Sample','(GMT+1:00) CET','0','2'),
('253','Africa/Windhoek','Sample','(GMT+1:00) CET','0','2'),
('254','Arctic/Longyearbyen','Sample','(GMT+1:00) CET','0','2'),
('255','Atlantic/Jan_Mayen','Sample','(GMT+1:00) CET','0','2'),
('256','CET','Sample','(GMT+1:00) CET','0','2'),
('257','ECT','Sample','(GMT+1:00) CET','0','2'),
('258','Etc/GMT-1','Sample','(GMT+1:00) CET','0','2'),
('259','Europe/Amsterdam','Sample','(GMT+1:00) CET','0','2'),
('260','Europe/Andorra','Sample','(GMT+1:00) CET','0','2'),
('261','Europe/Belgrade','Sample','(GMT+1:00) CET','0','2'),
('262','Europe/Berlin','Sample','(GMT+1:00) CET','0','2'),
('263','Europe/Bratislava','Sample','(GMT+1:00) CET','0','2'),
('264','Europe/Brussels','Sample','(GMT+1:00) CET','0','2'),
('265','Europe/Budapest','Sample','(GMT+1:00) CET','0','2'),
('266','Europe/Busingen','Sample','(GMT+1:00) CET','0','2'),
('267','Europe/Copenhagen','Sample','(GMT+1:00) CET','0','2'),
('268','Europe/Gibraltar','Sample','(GMT+1:00) CET','0','2'),
('269','Europe/Ljubljana','Sample','(GMT+1:00) CET','0','2'),
('270','Europe/Luxembourg','Sample','(GMT+1:00) Middle','0','2'),
('271','Europe/Madrid','Sample','(GMT+1:00) CET','0','2'),
('272','Europe/Malta','Sample','(GMT+1:00) EET','0','2'),
('273','Europe/Monaco','Sample','(GMT+1:00) WAT','0','2'),
('274','Europe/Oslo','Sample','(GMT+1:00) WAT','0','2'),
('275','Europe/Paris','Sample','(GMT+1:00) EET','0','2'),
('276','Europe/Podgorica','Sample','(GMT+1:00) WAT','0','2'),
('277','Europe/Prague','Sample','(GMT+1:00) WAT','0','2'),
('278','Europe/Rome','Sample','(GMT+1:00) SAST','0','2'),
('279','Europe/San_Marino','Sample','(GMT+1:00) WAT','0','2'),
('280','Europe/Sarajevo','Sample','(GMT+1:00) WAT','0','2'),
('281','Europe/Skopje','Sample','(GMT+1:00) WAT','0','2'),
('282','Europe/Stockholm','Sample','(GMT+1:00) WAT','0','2'),
('283','Europe/Tirane','Sample','(GMT+1:00) SAST','0','2'),
('284','Europe/Vaduz','Sample','(GMT+1:00) SAST','0','2'),
('285','Europe/Vatican','Sample','(GMT+1:00) EET','0','2'),
('286','Europe/Vienna','Sample','(GMT+1:00) EET','0','2'),
('287','Europe/Warsaw','Sample','(GMT+1:00) EET','0','2'),
('288','Europe/Zagreb','Sample','(GMT+1:00) EET','0','2'),
('289','Europe/Zurich','Sample','(GMT+1:00) EET','0','2'),
('290','MET','Sample','(GMT+1:00) EET','0','2'),
('291','Poland','Sample','(GMT+1:00) EET','0','2'),
('292','ART','Sample','(GMT+2:00) IST','0','2'),
('293','Africa/Blantyre','Sample','(GMT+2:00) EET','0','2'),
('294','Africa/Bujumbura','Sample','(GMT+2:00) IST','0','2'),
('295','Africa/Cairo','Sample','(GMT+2:00) WAT','0','2'),
('296','Africa/Gaborone','Sample','(GMT+2:00) EET','0','2'),
('297','Africa/Harare','Sample','(GMT+2:00) EET','0','2'),
('298','Africa/Johannesburg','Sample','(GMT+2:00) GMT+02:00','0','2'),
('299','Africa/Kigali','Sample','(GMT+2:00) EET','0','2'),
('300','Africa/Lubumbashi','Sample','(GMT+2:00) EET','0','2'),
('301','Africa/Lusaka','Sample','(GMT+2:00) EET','0','2'),
('302','Africa/Maputo','Sample','(GMT+2:00) EET','0','2'),
('303','Africa/Maseru','Sample','(GMT+2:00) EET','0','2'),
('304','Africa/Mbabane','Sample','(GMT+2:00) EET','0','2'),
('305','Africa/Tripoli','Sample','(GMT+2:00) EET','0','2'),
('306','Asia/Amman','Sample','(GMT+2:00) Asia/Amman','2','1'),
('307','Asia/Beirut','Sample','(GMT+2:00) Asia/Beirut','3','1'),
('308','Asia/Damascus','Sample','(GMT+2:00) Asia/Damascus','4','1'),
('309','Asia/Gaza','Sample','(GMT+2:00) Asia/Gaza','5','1'),
('310','Asia/Hebron','Sample','(GMT+2:00) Asia/Hebron','6','1'),
('311','Asia/Istanbul','Sample','(GMT+2:00) Asia/Istanbul','7','1'),
('312','Asia/Jerusalem','Sample','(GMT+2:00) Asia/Jerusalem','8','1'),
('313','Asia/Nicosia','Sample','(GMT+2:00) Asia/Nicosia','9','1'),
('314','Asia/Tel_Aviv','Sample','(GMT+2:00) Asia/Tel_Aviv','10','1'),
('315','CAT','Sample','(GMT+2:00) IST','0','2'),
('316','EET','Sample','(GMT+2:00) EET','0','2'),
('317','Egypt','Sample','(GMT+2:00) EET','0','2'),
('318','Etc/GMT-2','Sample','(GMT+2:00) EAT','0','2'),
('319','Europe/Athens','Sample','(GMT+2:00) EAT','0','2'),
('320','Europe/Bucharest','Sample','(GMT+2:00) EAT','0','2'),
('321','Europe/Chisinau','Sample','(GMT+2:00) EAT','0','2'),
('322','Europe/Helsinki','Sample','(GMT+2:00) EAT','0','2'),
('323','Europe/Istanbul','Sample','(GMT+2:00) EAT','0','2'),
('324','Europe/Kiev','Sample','(GMT+2:00) EAT','0','2'),
('325','Europe/Mariehamn','Sample','(GMT+2:00) EAT','0','2'),
('326','Europe/Nicosia','Sample','(GMT+2:00) EAT','0','2'),
('327','Europe/Riga','Sample','(GMT+2:00) EAT','0','2'),
('328','Europe/Simferopol','Sample','(GMT+4:00) Syowa','0','2'),
('329','Europe/Sofia','Sample','(GMT+2:00) AST','0','2'),
('330','Europe/Tallinn','Sample','(GMT+2:00) AST','0','2'),
('331','Europe/Tiraspol','Sample','(GMT+2:00) AST','0','2'),
('332','Europe/Uzhgorod','Sample','(GMT+2:00) AST','0','2'),
('333','Europe/Vilnius','Sample','(GMT+2:00) AST','0','2'),
('334','Europe/Zaporozhye','Sample','(GMT+2:00) AST','0','2'),
('335','Israel','Sample','(GMT+2:00) EAT','0','2'),
('336','Libya','Sample','(GMT+2:00) GMT+03:00','0','2'),
('337','Turkey','Sample','(GMT+2:00) Further-EET','0','2'),
('338','Africa/Addis_Ababa','Sample','(GMT+3:00) Further-EET','0','2'),
('339','Africa/Asmara','Sample','(GMT+3:00) EAT','0','2'),
('340','Africa/Asmera','Sample','(GMT+3:00) EAT','0','2'),
('341','Africa/Dar_es_Salaam','Sample','(GMT+3:00) EAT','0','2'),
('342','Africa/Djibouti','Sample','(GMT+3:00) GMT+03:07','0','2'),
('343','Africa/Juba','Sample','(GMT+3:00) GMT+03:07','0','2'),
('344','Africa/Kampala','Sample','(GMT+3:00) GMT+03:07','0','2'),
('345','Africa/Khartoum','Sample','(GMT+3:00) GMT+03:07','0','2'),
('346','Africa/Mogadishu','Sample','(GMT+3:00) GMT+03:07','0','2'),
('347','Africa/Nairobi','Sample','(GMT+3:00) GMT+03:07','0','2'),
('348','Antarctica/Syowa','Sample','(GMT+3:00) IRST','0','2'),
('349','Asia/Aden','Sample','(GMT+3:00) Asia/Aden','11','1'),
('350','Asia/Baghdad','Sample','(GMT+3:00) Asia/Baghdad','12','1'),
('351','Asia/Bahrain','Sample','(GMT+3:00) Asia/Bahrain','13','1'),
('352','Asia/Kuwait','Sample','(GMT+3:00) Asia/Kuwait','14','1'),
('353','Asia/Qatar','Sample','(GMT+3:00) Asia/Qatar','15','1'),
('354','Asia/Riyadh','Sample','(GMT+3:00) Asia/Riyadh','16','1'),
('355','EAT','Sample','(GMT+3:00) GMT+04:00','0','2'),
('356','Etc/GMT-3','Sample','(GMT+3:00) MSK','0','2'),
('357','Europe/Kaliningrad','Sample','(GMT+3:00) Samara','0','2'),
('358','Europe/Minsk','Sample','(GMT+3:00) Volgograd','0','2'),
('359','Indian/Antananarivo','Sample','(GMT+3:00) Seychelles','0','2'),
('360','Indian/Comoro','Sample','(GMT+3:00) Mauritius','0','2'),
('361','Indian/Mayotte','Sample','(GMT+3:00) Reunion','0','2'),
('362','Asia/Riyadh87','Sample','(GMT+3:00) AMT','0','2'),
('363','Asia/Riyadh88','Sample','(GMT+3:00) MSK','0','2'),
('364','Asia/Riyadh89','Sample','(GMT+3:00) Asia/Riyadh','0','2'),
('365','Mideast/Riyadh87','Sample','(GMT+3:00) Mawson','0','2'),
('366','Mideast/Riyadh88','Sample','(GMT+3:00) Aqtau','0','2'),
('367','Mideast/Riyadh89','Sample','(GMT+3:00) Aqtobe','0','2'),
('368','Asia/Tehran','Sample','(GMT+3:30) Asia/Tehran','17','1'),
('369','Iran','Sample','(GMT+3:30) Turkmenistan','0','2'),
('370','Asia/Baku','Sample','(GMT+4:00) Asia/Baku','18','1'),
('371','Asia/Dubai','Sample','(GMT+4:00) Asia/Dubai','19','1'),
('372','Asia/Muscat','Sample','(GMT+4:00) Asia/Muscat','20','1'),
('373','Asia/Tbilisi','Sample','(GMT+4:00) Asia/Tbilisi','21','1'),
('374','Asia/Yerevan','Sample','(GMT+4:00) Asia/Yerevan','22','1'),
('375','Etc/GMT-4','Sample','(GMT+4:00) GMT+05:00','0','2'),
('376','Europe/Moscow','Sample','(GMT+4:00) French','0','2'),
('377','Europe/Samara','Sample','(GMT+4:00) Maldives','0','2'),
('378','Europe/Volgograd','Sample','(GMT+4:00) Pakistan','0','2'),
('379','Indian/Mahe','Sample','(GMT+4:00) IST','0','2'),
('380','Indian/Mauritius','Sample','(GMT+4:00) IST','0','2'),
('381','Indian/Reunion','Sample','(GMT+4:00) IST','0','2'),
('382','NET','Sample','(GMT+4:00) IST','0','2'),
('383','W-SU','Sample','(GMT+4:00) Nepal','0','2'),
('384','Asia/Kabul','Sample','(GMT+4:30) Asia/Kabul','23','1'),
('385','Antarctica/Mawson','Sample','(GMT+5:00) Vostok','0','2'),
('386','Asia/Aqtau','Sample','(GMT+5:00) Asia/Aqtau','24','1'),
('387','Asia/Aqtobe','Sample','(GMT+5:00) Asia/Aqtobe','25','1'),
('388','Asia/Ashgabat','Sample','(GMT+5:00) Asia/Ashgabat','26','1'),
('389','Asia/Ashkhabad','Sample','(GMT+5:00) Asia/Ashkhabad','27','1'),
('390','Asia/Dushanbe','Sample','(GMT+5:00) Asia/Dushanbe','28','1'),
('391','Asia/Karachi','Sample','(GMT+5:00) Asia/Karachi','29','1'),
('392','Asia/Oral','Sample','(GMT+5:00) Asia/Oral','30','1'),
('393','Asia/Samarkand','Sample','(GMT+5:00) Asia/Samarkand','31','1'),
('394','Asia/Tashkent','Sample','(GMT+5:00) Asia/Tashkent','32','1'),
('395','Etc/GMT-5','Sample','(GMT+5:00) GMT+06:00','0','2'),
('396','Indian/Kerguelen','Sample','(GMT+5:00) Indian','0','2'),
('397','Indian/Maldives','Sample','(GMT+5:00) Myanmar','0','2'),
('398','PLT','Sample','(GMT+5:00) Cocos','0','2'),
('399','Asia/Calcutta','Sample','(GMT+5:30) Asia/Calcutta','33','2'),
('400','Asia/Colombo','Sample','(GMT+5:30) Asia/Colombo','34','1'),
('401','Asia/Kolkata','Sample','(GMT+5:30) Asia/Kolkata','35','1'),
('402','IST','Sample','(GMT+5:30) Hovd','0','2'),
('403','Asia/Kathmandu','Sample','(GMT+5:45) Asia/Kathmandu','36','1'),
('404','Asia/Katmandu','Sample','(GMT+5:45) Asia/Katmandu','37','2'),
('405','Antarctica/Vostok','Sample','(GMT+6:00) Novosibirsk','0','2'),
('406','Asia/Almaty','Sample','(GMT+6:00) Asia/Almaty','38','1'),
('407','Asia/Bishkek','Sample','(GMT+6:00) Asia/Bishkek','39','1'),
('408','Asia/Dacca','Sample','(GMT+6:00) Asia/Dacca','40','2'),
('409','Asia/Dhaka','Sample','(GMT+6:00) Asia/Dhaka','41','1'),
('410','Asia/Qyzylorda','Sample','(GMT+6:00) Asia/Qyzylorda','42','1'),
('411','Asia/Thimbu','Sample','(GMT+6:00) Asia/Thimbu','43','1'),
('412','Asia/Thimphu','Sample','(GMT+6:00) Christmas','0','2'),
('413','Asia/Yekaterinburg','Sample','(GMT+6:00) Asia/Yekaterinburg','44','1'),
('414','BST','Sample','(GMT+6:00) WST','0','2'),
('415','Etc/GMT-6','Sample','(GMT+6:00) Brunei','0','2'),
('416','Indian/Chagos','Sample','(GMT+6:00) Choibalsan','0','2'),
('417','Asia/Rangoon','Sample','(GMT+6:30) Asia/Rangoon','45','1'),
('418','Indian/Cocos','Sample','(GMT+6:30) Indian/Cocos','0','2'),
('419','Antarctica/Davis','Sample','(GMT+7:00) CST','0','2'),
('420','Asia/Bangkok','Sample','(GMT+7:00) Asia/Bangkok','46','1'),
('421','Asia/Ho_Chi_Minh','Sample','(GMT+7:00) Asia/Ho_Chi_Minh','48','1'),
('422','Asia/Hovd','Sample','(GMT+7:00) Asia/Hovd','47','1'),
('423','Asia/Jakarta','Sample','(GMT+7:00) Asia/Jakarta','49','1'),
('424','Asia/Novokuznetsk','Sample','(GMT+7:00) Asia/Novokuznetsk','50','1'),
('425','Asia/Novosibirsk','Sample','(GMT+7:00) Asia/Novosibirsk','51','1'),
('426','Asia/Omsk','Sample','(GMT+7:00) Asia/Omsk','52','1'),
('427','Asia/Phnom_Penh','Sample','(GMT+7:00) Asia/Phnom_Penh','53','1'),
('428','Asia/Pontianak','Sample','(GMT+7:00) Asia/Pontianak','54','1'),
('429','Asia/Saigon','Sample','(GMT+7:00) Asia/Saigon','55','1'),
('430','Asia/Vientiane','Sample','(GMT+7:00) Asia/Vientiane','56','1'),
('431','Etc/GMT-7','Sample','(GMT+7:00) CST','0','2'),
('432','Indian/Christmas','Sample','(GMT+7:00) Central','0','2'),
('433','VST','Sample','(GMT+7:00) ULAT','0','2'),
('434','Antarctica/Casey','Sample','(GMT+8:00) ULAT','0','2'),
('435','Asia/Brunei','Sample','(GMT+8:00) CST','77','1'),
('436','Asia/Choibalsan','Sample','(GMT+8:00) Asia/Choibalsan','57','1'),
('437','Asia/Chongqing','Sample','(GMT+8:00) Asia/Chongqing','58','1'),
('438','Asia/Chungking','Sample','(GMT+8:00) Asia/Chungking','59','2'),
('439','Asia/Harbin','Sample','(GMT+8:00) Asia/Harbin','60','1'),
('440','Asia/Hong_Kong','Sample','(GMT+8:00) Asia/Hong_Kong','61','1'),
('441','Asia/Kashgar','Sample','(GMT+8:00) Asia/Kashgar','62','1'),
('442','Asia/Krasnoyarsk','Sample','(GMT+8:00) Asia/Krasnoyarsk','63','1'),
('443','Asia/Kuala_Lumpur','Sample','(GMT+8:00) Asia/Kuala_Lumpur','64','1'),
('444','Asia/Kuching','Sample','(GMT+8:00) Asia/Kuching','65','1'),
('445','Asia/Macao','Sample','(GMT+8:00) Asia/Macao','66','2'),
('446','Asia/Macau','Sample','(GMT+8:00) Asia/Macau','67','1'),
('447','Asia/Makassar','Sample','(GMT+8:00) Asia/Makassar','68','1'),
('448','Asia/Manila','Sample','(GMT+8:00) Asia/Manila','69','1'),
('449','Asia/Shanghai','Sample','(GMT+8:00) Asia/Shanghai','70','1'),
('450','Asia/Singapore','Sample','(GMT+8:00) Asia/Singapore','71','1'),
('451','Asia/Taipei','Sample','(GMT+8:00) Asia/Taipei','72','1'),
('452','Asia/Ujung_Pandang','Sample','(GMT+8:00) Asia/Ujung_Pandang','73','1'),
('453','Asia/Ulaanbaatar','Sample','(GMT+8:00) Asia/Ulaanbaatar','74','1'),
('454','Asia/Ulan_Bator','Sample','(GMT+8:00) Asia/Ulan_Bator','75','2'),
('455','Asia/Urumqi','Sample','(GMT+8:00) Asia/Urumqi','76','1'),
('456','Australia/Perth','Sample','(GMT+8:00) ACDT','0','2'),
('457','Australia/West','Sample','(GMT+8:00) ACDT','0','2'),
('458','CTT','Sample','(GMT+8:00) ACDT','0','2'),
('459','Etc/GMT-8','Sample','(GMT+8:00) ACDT','0','2'),
('460','Hongkong','Sample','(GMT+8:00) ACDT','0','2'),
('461','PRC','Sample','(GMT+8:00) ACDT','0','2'),
('462','Singapore','Sample','(GMT+8:00) EST','0','2'),
('463','Australia/Eucla','Sample','(GMT+8:45) Dumont-d','0','2'),
('464','Asia/Dili','Sample','(GMT+9:00) Asia/Dili','78','1'),
('465','Asia/Irkutsk','Sample','(GMT+9:00) Asia/Irkutsk','79','1'),
('466','Asia/Jayapura','Sample','(GMT+9:00) Asia/Jayapura','80','1'),
('467','Asia/Pyongyang','Sample','(GMT+9:00) Asia/Pyongyang','81','1'),
('468','Asia/Seoul','Sample','(GMT+9:00) Asia/Seoul','82','1'),
('469','Asia/Tokyo','Sample','(GMT+9:00) Asia/Tokyo','83','1'),
('470','Etc/GMT-9','Sample','(GMT+9:00) EST','0','2'),
('471','JST','Sample','(GMT+9:00) EST','0','2'),
('472','Japan','Sample','(GMT+9:00) EST','0','2'),
('473','Pacific/Palau','Sample','(GMT+9:00) EST','0','2'),
('474','ROK','Sample','(GMT+9:00) EST','0','2'),
('475','ACT','Sample','(GMT+9:30) EST','0','2'),
('476','Australia/Adelaide','Sample','(GMT+9:30) EST','0','2'),
('477','Australia/Broken_Hill','Sample','(GMT+9:30) EST','0','2'),
('478','Australia/Darwin','Sample','(GMT+9:30) GMT+10:00','0','2'),
('479','Australia/North','Sample','(GMT+9:30) Chuuk','0','2'),
('480','Australia/South','Sample','(GMT+9:30) Chamorro','0','2'),
('481','Australia/Yancowinna','Sample','(GMT+9:30) Papua','0','2'),
('482','AET','Sample','(GMT+10:00) Chamorro','0','2'),
('483','Antarctica/DumontDUrville','Sample','(GMT+10:00) Chuuk','0','2'),
('484','Asia/Khandyga','Sample','(GMT+10:00) Asia/Khandyga','84','1'),
('485','Asia/Yakutsk','Sample','(GMT+10:00) Asia/Yakutsk','85','1'),
('486','Australia/ACT','Sample','(GMT+10:00) Lord','0','2'),
('487','Australia/Brisbane','Sample','(GMT+10:00) Macquarie','0','2'),
('488','Australia/Canberra','Sample','(GMT+10:00) Sakhalin','0','2'),
('489','Australia/Currie','Sample','(GMT+10:00) Ust-Nera','0','2'),
('490','Australia/Hobart','Sample','(GMT+10:00) Vladivostok','0','2'),
('491','Australia/Lindeman','Sample','(GMT+10:00) GMT+11:00','0','2'),
('492','Australia/Melbourne','Sample','(GMT+10:00) Vanuatu','0','2'),
('493','Australia/NSW','Sample','(GMT+10:00) Solomon','0','2'),
('494','Australia/Queensland','Sample','(GMT+10:00) Kosrae','0','2'),
('495','Australia/Sydney','Sample','(GMT+10:00) New','0','2'),
('496','Australia/Tasmania','Sample','(GMT+10:00) Pohnpei','0','2'),
('497','Australia/Victoria','Sample','(GMT+10:00) Pohnpei','0','2'),
('498','Etc/GMT-10','Sample','(GMT+10:00) Solomon','0','2'),
('499','Pacific/Chuuk','Sample','(GMT+10:00) Norfolk','0','2'),
('500','Pacific/Guam','Sample','(GMT+10:00) NZST','0','2'),
('501','Pacific/Port_Moresby','Sample','(GMT+10:00) NZST','0','2'),
('502','Pacific/Saipan','Sample','(GMT+10:00) Anadyr','0','2'),
('503','Pacific/Truk','Sample','(GMT+10:00) Petropavlovsk-Kamchatski','0','2'),
('504','Pacific/Yap','Sample','(GMT+10:00) Magadan','0','2'),
('505','Australia/LHI','Sample','(GMT+10:30) GMT+12:00','0','2'),
('506','Australia/Lord_Howe','Sample','(GMT+10:30) Time','0','2'),
('507','Antarctica/Macquarie','Sample','(GMT+11:00) NZST','0','2'),
('508','Asia/Sakhalin','Sample','(GMT+11:00) Asia/Sakhalin','86','1'),
('509','Asia/Ust-Nera','Sample','(GMT+11:00) Asia/Ust-Nera','87','1'),
('510','Asia/Vladivostok','Sample','(GMT+11:00) Asia/Vladivostok','88','1'),
('511','Etc/GMT-11','Sample','(GMT+11:00) Tuvalu','0','2'),
('512','Pacific/Efate','Sample','(GMT+11:00) Time','0','2'),
('513','Pacific/Guadalcanal','Sample','(GMT+11:00) Time','0','2'),
('514','Pacific/Kosrae','Sample','(GMT+11:00) Nauru','0','2'),
('515','Pacific/Noumea','Sample','(GMT+11:00) Gilbert','0','2'),
('516','Pacific/Pohnpei','Sample','(GMT+11:00) Wake','0','2'),
('517','Pacific/Ponape','Sample','(GMT+11:00) Wallis','0','2'),
('518','SST','Sample','(GMT+11:00) CHAST','0','2'),
('519','Pacific/Norfolk','Sample','(GMT+11:30) CHAST','0','2'),
('520','Antarctica/McMurdo','Sample','(GMT+12:00) GMT+13:00','0','2'),
('521','Antarctica/South_Pole','Sample','(GMT+12:00) Time','0','2'),
('522','Asia/Anadyr','Sample','(GMT+12:00) Asia/Anadyr','89','1'),
('523','Asia/Kamchatka','Sample','(GMT+12:00) Asia/Kamchatka','90','1'),
('524','Asia/Magadan','Sample','(GMT+12:00) Asia/Magadan','91','1'),
('525','Etc/GMT-12','Sample','(GMT+12:00) Tonga','0','2'),
('526','Kwajalein','Sample','(GMT+12:00) GMT+14:00','0','2'),
('527','NST','Sample','(GMT+12:00) Line','0','2');


CREATE TABLE `tool_info` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` BIGINT (20) NOT NULL,
`group_company_code` BIGINT (20) NOT NULL,
`name` VARCHAR(100) NOT NULL,
`display_name` VARCHAR(100) NOT NULL,
`file_name` VARCHAR(100) NOT NULL,
`description` VARCHAR(400) DEFAULT NULL,
`type`ENUM('1','2') NOT NULL COMMENT '1=Downloadable 2=Link',
`version` VARCHAR(50) NOT NULL,
`size` INT DEFAULT NULL,
`server_path` VARCHAR(200) NOT NULL,
`logo_path` VARCHAR(200) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`download_count` INT NOT NULL,
`created_by` INT (11) NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`),
UNIQUE KEY `TOOL_INFO_NAME_COMPANY_CODE` (`name`,`company_code`),
CONSTRAINT `FK_TOOL_INFO_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
)ENGINE=INNODB;

CREATE TABLE `tool_access_info` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`tool_info_id` INT UNSIGNED NOT NULL,
`company_code` BIGINT NOT NULL,
`group_company_code` BIGINT (20) NOT NULL,
`file_name` VARCHAR(100) NOT NULL,
`version` VARCHAR(50),
`user_agent` VARCHAR(200) DEFAULT NULL,
`download_status` INT UNSIGNED NOT NULL,
`created_by` INT (11) NOT NULL,
`created_date` DATETIME NOT NULL,
 PRIMARY KEY (`id`)
)ENGINE=INNODB;

CREATE TABLE `action_category` (
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL COMMENT 'Category Name',
`alert_value` BIGINT NOT NULL COMMENT 'Bit value for alert and messages',
`status_id` INT UNSIGNED NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

INSERT INTO `action_category`(`id`,`name`,`alert_value`,`status_id`) 
VALUES(1,'Project Create',1,1),
(2,'Project Update',2,1),
(3,'Project Delete',4,1),
(4,'Project File Create',8,1),
(5,'Project File Update',16,1),
(6,'Project File Collaborate',32,1),
(7,'Project File Delete',64,1),
(8,'Project File Download',128,1),
(9,'Share File Create',256,1),
(10,'Share File Update',512,1),
(11,'Share File Collaborate',1024,1),
(12,'Share File Delete',2048,1),
(13,'Share File Download',4096,1),
(14,'Department Update',8192,1),
(15,'Department File Create',16384,1),
(16,'Department File Update',32768,1),
(17,'Department File Collaborate',65536,1),
(18,'Department File Delete',131072,1),
(19,'Department File Download',262144,1),
(20,'Backup Update',524288,1),
(21,'Backup File Update',1048576, 1),
(22,'Myfiles File Update',2097152, 1),
(23,'Project Folder Create',4194304,1),
(24,'Project Folder Update',8388608,1),
(25,'Project Folder Collaborate',16777216,1),
(26,'Project Folder Delete',33554432,1),
(27,'Project Folder Download',67108864,1),
(28,'Share Folder Create',134217728,1),
(29,'Share Folder Update',268435456,1),
(30,'Share Folder Collaborate',536870912,1),
(31,'Share Folder Delete',1073741824,1),
(32,'Share Folder Download',2147483648,1),
(33,'Department Folder Create',4294967296,1),
(34,'Department Folder Update',8589934592,1),
(35,'Department Folder Collaborate',17179869184,1),
(36,'Department Folder Delete',34359738368,1),
(37,'Department Folder Download',68719476736,1),
(38,'Backup Folder Update',137438953472, 1),
(39,'Myfiles Folder Update',274877906944, 1);

CREATE TABLE `action_category_map` (
`id` INT NOT NULL AUTO_INCREMENT,
`action_value` INT NOT NULL COMMENT 'client Db action table value',
`action_category_id` INT NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

INSERT INTO `action_category_map`(`id`,`action_value`,`action_category_id`) VALUES 
(1,101,1),(2,102,2),(3,103,2),(4,104,2),(5,106,2),(6,107,2),(7,108,2),(8,105,3),(9,138,3),(10,109,23),(11,118,4),(12,119,4),(13,133,4),(14,110,24),(15,111,24),(16,113,24),(17,120,5),(18,121,5),(19,127,5),(20,128,5),(21,140,5),(22,143,5),(23,134,6),(24,135,25),(25,114,26),(26,117,26),(27,122,7),(28,129,7),(29,131,26),(30,132,7),(31,116,27),(32,124,8),(33,126,8),(34,308,28),(35,318,9),(36,319,9),(37,331,9),(38,309,29),(39,310,29),(40,312,29),(41,315,32),(42,317,29),(43,320,10),(44,321,10),(45,338,10),(46,341,10),(47,332,11),(48,334,11),(49,333,30),(50,313,31),(51,316,31),(52,322,12),(53,327,12),(54,329,31),(55,330,12),(56,324,13),(57,326,13),(58,203,14),(59,204,14),(60,206,33),(61,215,15),(62,216,15),(63,228,15),(64,207,34),(65,210,34),(66,217,16),(67,218,16),(68,233,16),(69,236,16),(70,229,17),(71,230,35),(72,211,18),(73,214,36),(74,219,18),(75,224,18),(76,226,36),(77,227,18),(78,213,37),(79,221,19),(80,223,19),(81,425,20),(82,426,20),(83,144,24),(84,237,34),(85,342,29),(86,208,34),(87,424,21),(88,530,22);

CREATE TABLE QRTZ_JOB_DETAILS(
SCHED_NAME VARCHAR(50) NOT NULL,
JOB_NAME VARCHAR(100) NOT NULL,
JOB_GROUP VARCHAR(100) NOT NULL,
DESCRIPTION VARCHAR(250) NULL,
JOB_CLASS_NAME VARCHAR(250) NOT NULL,
IS_DURABLE VARCHAR(1) NOT NULL,
IS_NONCONCURRENT VARCHAR(1) NOT NULL,
IS_UPDATE_DATA VARCHAR(1) NOT NULL,
REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_TRIGGERS (
SCHED_NAME VARCHAR(50) NOT NULL,
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
JOB_NAME VARCHAR(100) NOT NULL,
JOB_GROUP VARCHAR(100) NOT NULL,
DESCRIPTION VARCHAR(250) NULL,
NEXT_FIRE_TIME BIGINT(13) NULL,
PREV_FIRE_TIME BIGINT(13) NULL,
PRIORITY INTEGER NULL,
TRIGGER_STATE VARCHAR(16) NOT NULL,
TRIGGER_TYPE VARCHAR(8) NOT NULL,
START_TIME BIGINT(13) NOT NULL,
END_TIME BIGINT(13) NULL,
CALENDAR_NAME VARCHAR(100) NULL,
MISFIRE_INSTR SMALLINT(2) NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
REFERENCES QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_SIMPLE_TRIGGERS (
SCHED_NAME VARCHAR(50) NOT NULL,
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
REPEAT_COUNT BIGINT(7) NOT NULL,
REPEAT_INTERVAL BIGINT(12) NOT NULL,
TIMES_TRIGGERED BIGINT(10) NOT NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_CRON_TRIGGERS (
SCHED_NAME VARCHAR(50) NOT NULL,
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
CRON_EXPRESSION VARCHAR(120) NOT NULL,
TIME_ZONE_ID VARCHAR(80),
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_SIMPROP_TRIGGERS
 (          
SCHED_NAME VARCHAR(50) NOT NULL,
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
STR_PROP_1 VARCHAR(512) NULL,
STR_PROP_2 VARCHAR(512) NULL,
STR_PROP_3 VARCHAR(512) NULL,
INT_PROP_1 INT NULL,
INT_PROP_2 INT NULL,
LONG_PROP_1 BIGINT NULL,
LONG_PROP_2 BIGINT NULL,
DEC_PROP_1 NUMERIC(13,4) NULL,
DEC_PROP_2 NUMERIC(13,4) NULL,
BOOL_PROP_1 VARCHAR(1) NULL,
BOOL_PROP_2 VARCHAR(1) NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_BLOB_TRIGGERS (
SCHED_NAME VARCHAR(50) NOT NULL,
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
BLOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_CALENDARS (
SCHED_NAME VARCHAR(50) NOT NULL,
CALENDAR_NAME VARCHAR(100) NOT NULL,
CALENDAR BLOB NOT NULL,
PRIMARY KEY (SCHED_NAME,CALENDAR_NAME))
ENGINE=InnoDB;

CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS (
SCHED_NAME VARCHAR(50) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_FIRED_TRIGGERS (
SCHED_NAME VARCHAR(50) NOT NULL,
ENTRY_ID VARCHAR(95) NOT NULL,
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
INSTANCE_NAME VARCHAR(100) NOT NULL,
FIRED_TIME BIGINT(13) NOT NULL,
SCHED_TIME BIGINT(13) NOT NULL,
PRIORITY INTEGER NOT NULL,
STATE VARCHAR(16) NOT NULL,
JOB_NAME VARCHAR(100) NULL,
JOB_GROUP VARCHAR(100) NULL,
IS_NONCONCURRENT VARCHAR(1) NULL,
REQUESTS_RECOVERY VARCHAR(1) NULL,
PRIMARY KEY (SCHED_NAME,ENTRY_ID))
ENGINE=InnoDB;

CREATE TABLE QRTZ_SCHEDULER_STATE (
SCHED_NAME VARCHAR(50) NOT NULL,
INSTANCE_NAME VARCHAR(100) NOT NULL,
LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
CHECKIN_INTERVAL BIGINT(13) NOT NULL,
PRIMARY KEY (SCHED_NAME,INSTANCE_NAME))
ENGINE=InnoDB;

CREATE TABLE QRTZ_LOCKS (
SCHED_NAME VARCHAR(50) NOT NULL,
LOCK_NAME VARCHAR(40) NOT NULL,
PRIMARY KEY (SCHED_NAME,LOCK_NAME))
ENGINE=InnoDB;

CREATE INDEX IDX_QRTZ_J_REQ_RECOVERY ON QRTZ_JOB_DETAILS(SCHED_NAME,REQUESTS_RECOVERY);
CREATE INDEX IDX_QRTZ_J_GRP ON QRTZ_JOB_DETAILS(SCHED_NAME,JOB_GROUP);

CREATE INDEX IDX_QRTZ_T_J ON QRTZ_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_T_JG ON QRTZ_TRIGGERS(SCHED_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_T_C ON QRTZ_TRIGGERS(SCHED_NAME,CALENDAR_NAME);
CREATE INDEX IDX_QRTZ_T_G ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);
CREATE INDEX IDX_QRTZ_T_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_N_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_N_G_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_NEXT_FIRE_TIME ON QRTZ_TRIGGERS(SCHED_NAME,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_ST ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_MISFIRE ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE_GRP ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_GROUP,TRIGGER_STATE);

CREATE INDEX IDX_QRTZ_FT_TRIG_INST_NAME ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME);
CREATE INDEX IDX_QRTZ_FT_INST_JOB_REQ_RCVRY ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME,REQUESTS_RECOVERY);
CREATE INDEX IDX_QRTZ_FT_J_G ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_FT_JG ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_FT_T_G ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
CREATE INDEX IDX_QRTZ_FT_TG ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);


CREATE TABLE `common_config` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`key` VARCHAR(100) NOT NULL,
`value` VARCHAR(300) NOT NULL,
PRIMARY KEY (`id`),
KEY `IDX_COMMON_CONFIG_KEY` (`key`)
) ENGINE=INNODB;


CREATE TABLE `license` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`file_name` VARCHAR(200) NOT NULL,
`mac_address` VARCHAR(100) DEFAULT NULL,
`expiry_date` datetime DEFAULT NULL,
`user_count` INT UNSIGNED NOT NULL,
`features` INT UNSIGNED DEFAULT 0,
`applied_by` VARCHAR(200) DEFAULT NULL,
`applied_date` datetime NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `multi_language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(10) unsigned NOT NULL COMMENT 'language id',
  `object_id` int(11) DEFAULT NULL,
  `type_id` enum('1','2','3','4','5') NOT NULL COMMENT '1 = report_category_name, 2 = report_filter_label, 3 = report_display_name, 4 = report_description, 5 =report_sort_name',
  `language_key` varchar(100) NOT NULL COMMENT 'language key',
  `language_value` varchar(100) NOT NULL COMMENT 'language value',
  `created_by` int(11) NOT NULL COMMENT 'created by',
  `created_date` datetime DEFAULT NULL COMMENT 'created date',
  `updated_by` int(11) DEFAULT NULL COMMENT 'updated by',
  `updated_date` datetime DEFAULT NULL COMMENT 'updated date',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  COMMENT='multi language';

/* Report Tables Creation - Start*/

--
-- Table structure for table `rp_category`
--

CREATE TABLE `rp_category` (
  `id` smallint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT 'category id',
  `name` varchar(200) DEFAULT NULL COMMENT 'category name',
  `name_key` varchar(100) DEFAULT NULL COMMENT 'category name key',
  `description` varchar(200) DEFAULT NULL COMMENT 'description',
  `status_id` tinyint(1) NOT NULL COMMENT 'status id',
  `category_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Table structure for table `rp_report_master`
--

CREATE TABLE `rp_report_master` (
  `id` smallint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT 'report id',
  `language_id` int(10) unsigned NOT NULL COMMENT 'language id',
  `name` varchar(200) DEFAULT NULL COMMENT 'report name',
  `display_name` varchar(200) DEFAULT NULL COMMENT 'display name',
  `display_name_key` varchar(100) DEFAULT NULL COMMENT 'display name key',
  `description` varchar(200) DEFAULT NULL COMMENT 'description',
  `description_key` varchar(100) DEFAULT NULL COMMENT 'description key',
  `category_id` smallint(1) unsigned NOT NULL COMMENT 'category id',
  `maximum_row` smallint(1) unsigned DEFAULT NULL COMMENT 'maximum records',
  `created_by` int(11) DEFAULT NULL COMMENT 'created by',
  `created_date` datetime DEFAULT NULL COMMENT 'created date',
  `updated_by` int(11) DEFAULT NULL COMMENT 'updated by',
  `updated_date` datetime DEFAULT NULL COMMENT 'modified date',
  `report_type` varchar(45) DEFAULT NULL COMMENT 'report type - infraadmin, user',
  `status_id` tinyint(1) NOT NULL COMMENT 'report type - ',
  PRIMARY KEY (`id`),
  KEY `IDX_rp_report_details_category_id` (`category_id`),
  CONSTRAINT `fk_rp_report_details_category_id` FOREIGN KEY (`category_id`) REFERENCES `rp_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

--
-- Table structure for table `rp_filter_details`
--

CREATE TABLE `rp_filter_details` (
  `id` smallint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT 'input control id',
  `name` varchar(100) DEFAULT NULL COMMENT 'input control name',
  `type` enum('list','text','date-range','number-range') DEFAULT NULL COMMENT 'input control type',
  `label` varchar(200) DEFAULT NULL COMMENT 'input control label',
  `label_key` varchar(100) DEFAULT NULL COMMENT 'label key',
  `data_type` enum('String','Integer','Boolean','Decimal','Date','UserList','DepartmentList','ProjectList','WorkflowCategoryList','WorkflowList','BranchList','CompanyList','static-list') DEFAULT NULL COMMENT 'datatypes',
  `list_api` varchar(450) DEFAULT NULL,
  `list_value` varchar(45) DEFAULT NULL,
  `list_displayvalue` varchar(45) DEFAULT NULL,
  `list_search` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Table structure for table `rp_sort_details`
--

CREATE TABLE `rp_sort_details` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sort id',
  `name` varchar(200) DEFAULT NULL COMMENT 'sort name',
  `name_key` varchar(100) DEFAULT NULL COMMENT 'sort name key',
  `field_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Table structure for table `rp_report_filter_relation`
--

CREATE TABLE `rp_report_filter_relation` (
  `id` mediumint(1) NOT NULL AUTO_INCREMENT COMMENT 'report control id',
  `report_master_id` smallint(1) unsigned NOT NULL COMMENT 'report id',
  `filter_details_id` smallint(1) unsigned NOT NULL COMMENT 'control id',
  `filter_order` tinyint(3) NOT NULL COMMENT 'filter order',
  `required` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_rp_report_filter_relation_report_master_id` (`report_master_id`),
  KEY `IDX_rp_report_filter_relation_filter_details_id` (`filter_details_id`),
  CONSTRAINT `fk_rp_report_filter_relation_filter_details_id` FOREIGN KEY (`filter_details_id`) REFERENCES `rp_filter_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rp_report_filter_relation_report_master_id` FOREIGN KEY (`report_master_id`) REFERENCES `rp_report_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

--
-- Table structure for table `rp_report_sort_relation`
--

CREATE TABLE `rp_report_sort_relation` (
  `id` mediumint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT 'report sort id',
  `report_master_id` smallint(1) unsigned NOT NULL COMMENT 'report id',
  `sort_details_id` tinyint(1) unsigned NOT NULL COMMENT 'sort by id',
  `sort_order` tinyint(3) NOT NULL COMMENT 'sort order',
  PRIMARY KEY (`id`),
  KEY `IDX_rp_report_sort_relation_report_master_id` (`report_master_id`),
  KEY `IDX_rp_report_sort_relation_sort_details_id` (`sort_details_id`),
  CONSTRAINT `fk_rp_report_sort_relation_report_master_id` FOREIGN KEY (`report_master_id`) REFERENCES `rp_report_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rp_report_sort_relation_sort_details_id` FOREIGN KEY (`sort_details_id`) REFERENCES `rp_sort_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

--
-- Table structure for table `rp_company_report_relation`
--

CREATE TABLE `rp_company_report_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'company report id',
  `company_code` bigint(20) NOT NULL COMMENT 'company id',
  `report_master_id` smallint(1) unsigned NOT NULL COMMENT 'report master id',
  PRIMARY KEY (`id`),
  KEY `IDX_rp_company_report_relation_company_code` (`company_code`),
  KEY `IDX_rp_company_report_relation_report_master_id` (`report_master_id`),
  CONSTRAINT `fk_rp_company_report_relation_company_code` FOREIGN KEY (`company_code`) REFERENCES `company_master` (`company_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rp_company_report_relation_report_master_id` FOREIGN KEY (`report_master_id`) REFERENCES `rp_report_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;


/* Report Tables Creation - End*/

/* Report Data - Start*/

--
-- Data for table `rp_category`
--


INSERT INTO `rp_category` (`id`,`name`,`name_key`,`description`,`status_id`,`category_type`) VALUES 
(1,'User Reports','RP_CATEGORY_NAME_1','User Reports',1,'user'),
(2,'Admin Reports','RP_CATEGORY_NAME_2','User Reports',1,'infraadmin'),
(3,'Company Admin Reports','RP_CATEGORY_NAME_3','Company Admin Reports',1,'companyadmin'),
(4,'Workflow Reports','RP_CATEGORY_NAME_4','User Reports - Work Flow Reports',1,'user');

--
-- Data for table `rp_report_master`
--

INSERT INTO `rp_report_master` (`id`,`language_id`, `name`, `display_name`, `display_name_key`, `description`,`description_key`,
`category_id`,`maximum_row`,`created_by`,`created_date`,`updated_by`,`updated_date`,`report_type`,`status_id`) VALUES
(101,40,'infra_Company_Master_List_Report','Company Master List Report','RP_DISPLAY_NAME_101','Report to see list of companies','RP_DESCRIPTION_101',2,1000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(102,40,'infra_Company_Users_Aggregate_Report','Company Users Aggregate Report','RP_DISPLAY_NAME_102','Report to see User count in companies','RP_DESCRIPTION_102',2,1000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(103,40,'infra_Company_Storage_Report','Company Storage Report','RP_DISPLAY_NAME_103','Report to see Storage data in companies','RP_DESCRIPTION_103',2,5000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(104,40,'infra_Company_Progress_Report','Company Progress Chart','RP_DISPLAY_NAME_104','Report to show progress chart of user count and data growth','RP_DESCRIPTION_104',2,5000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(106,40,'infra_Company_Aggregate_Actitvity_Report','Company Aggregate Actitvity Report','RP_DISPLAY_NAME_106','Aggregate report for company wise activity count','RP_DESCRIPTION_106',2,1000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),(107,40,'infra_Company_User_Activity_Report','Company User Activity Report','RP_DISPLAY_NAME_107','This report provides company wise user activity count','RP_DESCRIPTION_107',2,1000,1,utc_timestamp(),NULL,NULL,'infraadmin',2),
(108,58,'infra_Company_Master_List_Report',' कंपनी मास्टर सूची की रिपोर्ट ','RP_DISPLAY_NAME_108',' कंपनियों की सूची देखने के लिए रिपोर्ट ','RP_DESCRIPTION_108',2,1000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(109,69,'infra_Company_Master_List_Report',' 会社のマスターリストレポート','RP_DISPLAY_NAME_109',' 報告書は企業のリストを表示します','RP_DESCRIPTION_109',2,1000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(110,58,'infra_Company_Users_Aggregate_Report',' कंपनी के यूज़रस एग्रीगेट रिपोर्ट','RP_DISPLAY_NAME_110',' रिपोर्ट कंपनियों में यूज़रस की संख्या देखने के लिए','RP_DESCRIPTION_110',2,1000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(111,69,'infra_Company_Users_Aggregate_Report',' 会社のユーザー集計レポート','RP_DISPLAY_NAME_111',' 報告書は、企業内のユーザー数を表示するには','RP_DESCRIPTION_111',2,1000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(112,58,'infra_Company_Storage_Report',' कंपनी स्टोरेज रिपोर्ट ','RP_DISPLAY_NAME_112',' कंपनियों में स्टोरेज डेटा देखने के लिए रिपोर्ट','RP_DESCRIPTION_112',2,5000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(113,69,'infra_Company_Storage_Report',' 会社ストレージレポート','RP_DISPLAY_NAME_113',' 報告書は、企業のストレージデータを表示するには','RP_DESCRIPTION_113',2,5000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(114,58,'infra_Company_Progress_Report',' कंपनी प्रगति चार्ट ','RP_DISPLAY_NAME_114',' रिपोर्ट यूज़र गिनती और डेटा विकास की प्रगति चार्ट दिखाने के लिए ','RP_DESCRIPTION_114',2,5000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(115,69,'infra_Company_Progress_Report',' 会社プログレスチャート','RP_DISPLAY_NAME_115',' レポートには、ユーザー数やデータの成長の進行チャートを表示します','RP_DESCRIPTION_115',2,5000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(116,58,'infra_Company_Aggregate_Actitvity_Report',' कंपनी यूज़र गतिविधि रिपोर्ट','RP_DISPLAY_NAME_116',' इस रिपोर्ट में कंपनी वाइज़ गतिविधि गिनती प्रदान करता है ','RP_DESCRIPTION_116',2,1000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(117,69,'infra_Company_Aggregate_Actitvity_Report','当社集計活動報告','RP_DISPLAY_NAME_117',' 会社賢明な活動回数の集計レポート ','RP_DESCRIPTION_117',2,1000,1,utc_timestamp(),NULL,NULL,'infraadmin',1),
(201,40,'Actitvity_Report','Activity Report','RP_DISPLAY_NAME_201','Report for company wise activity count','RP_DESCRIPTION_201',2,1000,1,utc_timestamp(),NULL,NULL,'infraadmin',2),
(202,40,'Aggregate_Actitvity_Report','Aggregate Activity Report','RP_DISPLAY_NAME_202','Aggregate Report for company wise activity count','RP_DESCRIPTION_202',2,5000,1,utc_timestamp(),NULL,NULL,'infraadmin',2),
(301,40,'ca_User_Login_Report','User Login Report','RP_DISPLAY_NAME_301','Report to see user login details and file upload count','RP_DESCRIPTION_301',3,1000,1,utc_timestamp(),NULL,NULL,'companyadmin',1),
(302,40,'ca_Division_Quota_Usage_Report','Division Quota Usage Report','RP_DISPLAY_NAME_302','Report to see quota usage details of departments','RP_DESCRIPTION_302',3,1000,1,utc_timestamp(),NULL,NULL,'companyadmin',1),
(303,40,'ca_Project_Quota_Usage_Report','Project Quota Usage Report','RP_DISPLAY_NAME_303','Report to see  quota usage details of projects','RP_DESCRIPTION_303',3,1000,1,utc_timestamp(),NULL,NULL,'companyadmin',1),(304,40,'ca_Document_Upload_Report_Department','Document Upload Report - Department','RP_DISPLAY_NAME_304','Report to see number of document upload by each department','RP_DESCRIPTION_304',3,1000,1,utc_timestamp(),NULL,NULL,'companyadmin',1),(305,40,'ca_Document_Upload_Report_User','Document Upload Report - User','RP_DISPLAY_NAME_305','Report to see number of document upload by each user','RP_DESCRIPTION_305',3,1000,1,utc_timestamp(),NULL,NULL,'companyadmin',1),
(501,40,'user_User_Profile_Report','User Profile Report','RP_DISPLAY_NAME_501','This report provides profile snapshot of a system user','RP_DESCRIPTION_501',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(502,40,'user_Device_Management_Report','Device Management Report','RP_DISPLAY_NAME_502','This report provides list of devices used by an user','RP_DESCRIPTION_502',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(503,40,'user_Project_Details_Report','Project List Report','RP_DISPLAY_NAME_503','This report provides list of projects','RP_DESCRIPTION_503',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(504,40,'user_File_Checkout_History_Report','File Checkout / Checkin History Report','RP_DISPLAY_NAME_504','This report provides details of file checkout and check in history for each project','RP_DESCRIPTION_504',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),(505,40,'user_Internal_Share_Details_Report','Internal Share Details Reports','RP_DISPLAY_NAME_505','This report provides details of internal file and folder share history','RP_DESCRIPTION_505',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),(506,40,'user_External_Share_Details_Report','External Share Details Reports','RP_DISPLAY_NAME_506','This report provides details of external file and folder share history ','RP_DESCRIPTION_506',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(507,40,'user_Activity_Report','User Activity Report','RP_DISPLAY_NAME_507','This report provides user activity count','RP_DESCRIPTION_507',1,5000,1,utc_timestamp(),NULL,NULL,'user',1),
(508,69,'user_User_Profile_Report','ユーザープロファイル報告','RP_DISPLAY_NAME_508','このレポートには、システムユーザのプロファイルスナップショットを提供します','RP_DESCRIPTION_508',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(509,58,'user_User_Profile_Report','यूज़र प्रोफ़ाइल रिपोर्ट','RP_DISPLAY_NAME_509','इस रिपोर्ट में एक प्रणाली प्रयोक्ता की प्रोफाइल स्नैपशॉट प्रदान करता है','RP_DESCRIPTION_509',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(510,58,'user_Device_Management_Report','डिवाइस प्रबंधन की रिपोर्ट','RP_DISPLAY_NAME_510','इस रिपोर्ट में एक यूज़र द्वारा इस्तेमाल उपकरणों की सूची प्रदान करता है','RP_DESCRIPTION_510',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(511,69,'user_Device_Management_Report','デバイス管理レポート','RP_DISPLAY_NAME_511','このレポートはユーザーでされます','RP_DESCRIPTION_511',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(512,69,'user_Project_Details_Report','プロジェクトリストレポート','RP_DISPLAY_NAME_512','このレポートには、プロジェクトのリストを提供します','RP_DESCRIPTION_512',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(513,58,'user_Project_Details_Report','प्रोजेक्ट सूची की रिपोर्ट','RP_DISPLAY_NAME_513','इस रिपोर्ट में एक यूज़र द्वारा इस्तेमाल उपकरणों की सूची प्रदान करता है','RP_DESCRIPTION_513',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(514,69,'user_File_Checkout_History_Report','チェックアウト/チェックイン履歴レポートファイル','RP_DISPLAY_NAME_514','このレポートには、各プロジェクトのファイルのチェックアウトの詳細とチェックインの履歴を提供します','RP_DESCRIPTION_514',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),(515,58,'user_File_Checkout_History_Report','फ़ाइल चेकआउट / चेकइन इतिहास की रिपोर्ट','RP_DISPLAY_NAME_515',' इस रिपोर्ट में प्रत्येक प्रोजैक्ट के लिए इतिहास फ़ाइल चेकआउट और चेकइन  के विवरण प्रदान करता है ','RP_DESCRIPTION_515',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),(516,69,'user_Internal_Share_Details_Report','内部共有の詳細レポート','RP_DISPLAY_NAME_516','このレポートでは、内部ファイルとフォルダの共有履歴の詳細を提供します','RP_DESCRIPTION_516',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(517,58,'user_Internal_Share_Details_Report','आंतरिक शेयर विवरण रिपोर्ट','RP_DISPLAY_NAME_517',' इस रिपोर्ट में आंतरिक फाइल और फोल्डर शेयर इतिहास की जानकारी प्रदान करता है','RP_DESCRIPTION_517',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(518,69,'user_External_Share_Details_Report','外部共有の詳細レポート','RP_DISPLAY_NAME_518','このレポートでは、外部ファイルとフォルダの共有履歴の詳細を提供します','RP_DESCRIPTION_518',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(519,58,'user_External_Share_Details_Report','बाहरी शेयर विवरण रिपोर्ट','RP_DISPLAY_NAME_519',' इस रिपोर्ट में बाहरी फाइल और फोल्डर शेयर इतिहास की जानकारी प्रदान करता है ','RP_DESCRIPTION_519',1,1000,1,utc_timestamp(),NULL,NULL,'user',1),
(520,69,'user_Activity_Report','ユーザアクティビティレポート','RP_DISPLAY_NAME_520','このレポートは、ユーザアクティビティカウントを提供します','RP_DESCRIPTION_520',1,5000,1,utc_timestamp(),NULL,NULL,'user',1),
(521,58,'user_Activity_Report','यूजर गतिविधि रिपोर्ट','RP_DISPLAY_NAME_521',' इस रिपोर्ट में यह यूजर गतिविधि गणना प्रदान करता है','RP_DESCRIPTION_521',1,5000,1,utc_timestamp(),NULL,NULL,'user',1),
(522,40,'user_Overall_Workflow_Summary_Report','Overall Workflow Summary Report','RP_DISPLAY_NAME_522','This report provides summary of all workflows','RP_DESCRIPTION_522',4,5000,1,utc_timestamp(),NULL,NULL,'user',1),
(523,40,'user_Workflow_Based_Summary_Report','Workflow Based Summary Report','RP_DISPLAY_NAME_523','This report provides summary of a particular workflow','RP_DESCRIPTION_523',4,5000,1,utc_timestamp(),NULL,NULL,'user',1),
(524,40,'user_Workflow_Details_Report','Workflow Details Report','RP_DISPLAY_NAME_524','This report provideds details of all the workflows','RP_DESCRIPTION_524',4,5000,1,utc_timestamp(),NULL,NULL,'user',1),
(525,40,'user_Overall_Workflow_Performance_Report','Overall Workflow Performance Report','RP_DISPLAY_NAME_525','This report provideds basic Performance details of all the workflows','RP_DESCRIPTION_525',4,5000,1,utc_timestamp(),NULL,NULL,'user',1),(526,40,'user_Overall_Stepwise_Performance_Report','Overall Stepwise Performance Report','RP_DISPLAY_NAME_526','This report provideds stepwise perfomance details of workflows','RP_DESCRIPTION_526',4,5000,1,utc_timestamp(),NULL,NULL,'user',1),(527,40,'user_Step_Based_Performance_Report','Step Based Performance Report','RP_DISPLAY_NAME_527','This report provideds Performance details based on steps','RP_DESCRIPTION_527',4,5000,1,utc_timestamp(),NULL,NULL,'user',1),
(528,40,'user_Overall_User_Performance_Report','Overall User Performance Report','RP_DISPLAY_NAME_528','This report provideds overall perfomance details of all users','RP_DESCRIPTION_528',4,5000,1,utc_timestamp(),NULL,NULL,'user',1),(529,40,'user_Workflow_Based_User_Performance_Report','Workflow Based User Performance Report','RP_DISPLAY_NAME_529','This report provideds perfomance details of all workflows','RP_DESCRIPTION_529',4,5000,1,utc_timestamp(),NULL,NULL,'user',1),(530,40,'user_User_Based_Performance_Report','User Based Performance Report','RP_DISPLAY_NAME_530','This report provideds details about all user actions.','RP_DESCRIPTION_530',4,5000,1,utc_timestamp(),NULL,NULL,'user',1);

--
-- Data for table `rp_filter_details`
--

INSERT INTO `rp_filter_details` (`id`,`name`,`type`,`label`,`label_key`,`data_type`,`list_api`,
`list_value`,`list_displayvalue`,`list_search`) VALUES 
(1,'userid','list','User','RP_FILTER_LABEL_1','UserList','user/listAll','loginName','firstName,lastName','loginName'),(2,'departmentid','list','Department','RP_FILTER_LABEL_2','DepartmentList','department/listAll','departmentMasterId','name',NULL),(3,'projectid','list','Project','RP_FILTER_LABEL_3','ProjectList','project/list','projectId','projectName',NULL),(4,'workflowcategoryid','list','Workflow Category','RP_FILTER_LABEL_4','WorkflowCategoryList',NULL,NULL,NULL,NULL),(5,'workflowid','list','Workflow','RP_FILTER_LABEL_5','WorkflowList',NULL,NULL,NULL,NULL),
(6,'date','date-range','Date','RP_FILTER_LABEL_6','Date',NULL,NULL,NULL,NULL),(7,'companycode','list','Company','RP_FILTER_LABEL_7','CompanyList','superAdmin/company/list','companyCode','legalName',NULL),(8,'branchid','list','Branch','RP_FILTER_LABEL_8','BranchList','branch/listAll','id','displayName',NULL),
(9,'createddate','date-range','Created Date','RP_FILTER_LABEL_9','Date',NULL,NULL,NULL,NULL),
(10,'expirydate','date-range','Expiry Date','RP_FILTER_LABEL_10','Date',NULL,NULL,NULL,NULL),
(11,'companytype','list','Company Type','RP_FILTER_LABEL_11','static-list','[{\"key\":\"Regular\",\"value\":\"Regular\"},{\"key\":\"Trial\",\"value\":\"Trial\"}]','key','value',NULL),
(12,'companystatus','list','Company Status','RP_FILTER_LABEL_12','static-list','[{\"key\":\"1\",\"value\":\"Active\"},{\"key\":\"10\",\"value\":\"Expired\"}]','key','value',NULL),
(13,'status','list','Status','RP_FILTER_LABEL_13','static-list','[{\"key\":\"1\",\"value\":\"Active\"},{\"key\":\"2\",\"value\":\"Inactive\"}]','key','value',''),
(14,'owner','list','Owner','RP_FILTER_LABEL_14','UserList','user/listAll','loginName','firstName,lastName','loginName'),(15,'checkoutby','list','Checkout By','RP_FILTER_LABEL_15','UserList','user/listAll','loginName','firstName,lastName','loginName'),(16,'devicetype','list','Device Type','RP_FILTER_LABEL_16','static-list','[{\"key\":\"0\",\"value\":\"AndroidAgent\"},{\"key\":\"1\",\"value\":\"IPhoneAgent\"},{\"key\":\"2\",\"value\":\"SDAgent\"},{\"key\":\"3\",\"value\":\"OutlookAgent\"},{\"key\":\"4\",\"value\":\"MSOfficeAgent\"}]','value','value',''),
(17,'startdate','date-range','Start Date','RP_FILTER_LABEL_17','Date',NULL,NULL,NULL,NULL),
(18,'enddate','date-range','End Date','RP_FILTER_LABEL_18','Date',NULL,NULL,NULL,NULL),
(19,'checkoutdate','date-range','Check-out Date','RP_FILTER_LABEL_19','Date',NULL,NULL,NULL,NULL),
(20,'checkindate','date-range','Check-in Date','RP_FILTER_LABEL_20','Date',NULL,NULL,NULL,NULL),
(21,'addeddate','date-range','Added Date','RP_FILTER_LABEL_21','Date',NULL,NULL,NULL,NULL),
(22,'checkinstatus','list','Checkin Status','RP_FILTER_LABEL_22','static-list','[{\"key\":\"true\",\"value\":\"Not yet checkd-in\"},{\"key\":\"false\",\"value\":\"All\"}]','key','value',''),
(23,'sender','list','Sender','RP_FILTER_LABEL_23','UserList','user/listAll','loginName','firstName,lastName','loginName'),(24,'receiver','list','Receiver','RP_FILTER_LABEL_24','UserList','user/listAll','loginName','firstName,lastName','loginName'),(25,'containertype','list','Container Type','RP_FILTER_LABEL_25','static-list','[{\"key\":\"1\",\"value\":\"Backup\"},{\"key\":\"2\",\"value\":\"Project\"},{\"key\":\"3\",\"value\":\"Share\"},{\"key\":\"4\",\"value\":\"Department\"},{\"key\":\"5\",\"value\":\"MyFiles\"}]','key','value',NULL),
(26,'departmentid','list','Department','RP_FILTER_LABEL_2','DepartmentList','department/listAll','departmentMasterId','name',NULL),
(27,'owner','list','Owner','RP_FILTER_LABEL_27','UserList','user/listAll','loginName','firstName,lastName','loginName'),(28,'observer','list','Observer','RP_FILTER_LABEL_28','UserList','user/listAll','loginName','firstName,lastName','loginName'),(29,'createdby','list','Created By','RP_FILTER_LABEL_29','UserList','user/listAll','loginName','firstName,lastName','loginName'),(30,'categoryid','list','Workflow Category','RP_FILTER_LABEL_30','WorkflowCategoryList','wkf/category/list','id','name','name'),(31,'wkfprocessdefid','list','Workflow Name','RP_FILTER_LABEL_31','WorkflowCategoryList','wkf/definition/list','id','name','name'),(32,'date','date-range','Created Date','RP_FILTER_LABEL_32','Date',NULL,NULL,NULL,NULL),(33,'user','list','Assigned User','RP_FILTER_LABEL_33','UserList','user/listAll','loginName','firstName,lastName','loginName');

--
-- Data for table `rp_report_filter_relation`
--

INSERT INTO `rp_report_filter_relation` (`id`,`report_master_id`,`filter_details_id`,`filter_order`,`required`) VALUES 
(1,101,7,1,0),
(2,101,9,2,0),
(3,101,10,3,0),
(4,101,11,4,0),
(5,101,12,5,0),
(6,102,7,1,1),
(7,103,7,1,1),
(8,104,6,1,1),
(9,104,7,2,0),
(10,501,8,1,0),
(11,501,2,2,0),
(12,501,1,3,0),
(13,502,1,1,0),
(14,502,16,2,0),
(15,502,21,3,0),
(16,503,14,1,0),
(17,503,13,2,0),
(18,503,8,3,0),
(19,503,2,4,0),
(20,503,17,5,0),
(21,503,18,6,0),
(22,504,3,1,0),
(23,504,15,2,0),
(24,504,19,3,0),
(25,504,20,4,0),
(26,504,22,5,0),
(27,505,23,1,0),
(28,505,25,3,0),
(29,505,9,4,0),
(30,505,10,5,0),
(31,506,23,1,0),
(32,506,25,3,0),
(33,506,9,4,0),
(34,506,10,5,0),
(35,507,1,1,0),
(36,507,6,2,0),
(37,106,7,1,1),
(38,106,6,2,0),
(39,107,7,1,1),
(40,107,6,2,0),
(41,509,8,1,0),
(42,509,2,2,0),
(43,509,1,3,0),
(44,510,1,1,0),
(45,510,16,2,0),
(46,510,21,3,0),
(47,513,14,1,0),
(48,513,13,2,0),
(49,513,8,3,0),
(50,513,2,4,0),
(51,513,17,5,0),
(52,513,18,6,0),
(53,515,3,1,0),
(54,515,15,2,0),
(55,515,19,3,0),
(56,515,20,4,0),
(57,515,22,5,0),
(58,517,23,1,0),
(59,517,25,3,0),
(60,517,9,4,0),
(61,517,10,5,0),
(62,519,23,1,0),
(63,519,25,3,0),
(64,519,9,4,0),
(65,519,10,5,0),
(66,521,1,1,0),
(67,521,6,2,0),
(68,108,7,1,0),
(69,108,9,2,0),
(70,108,10,3,0),
(71,108,11,4,0),
(72,108,12,5,0),
(73,110,7,1,1),
(74,112,7,1,1),
(75,114,6,1,1),
(76,114,7,2,0),
(77,116,7,1,1),
(78,116,6,2,0),
(79,508,8,1,0),
(80,508,2,2,0),
(81,508,1,3,0),
(82,511,1,1,0),
(83,511,16,2,0),
(84,511,21,3,0),
(85,512,14,1,0),
(86,512,13,2,0),
(87,512,8,3,0),
(88,512,2,4,0),
(89,512,17,5,0),
(90,512,18,6,0),
(91,514,3,1,0),
(92,514,15,2,0),
(93,514,19,3,0),
(94,514,20,4,0),
(95,514,22,5,0),
(96,516,23,1,0),
(97,516,25,3,0),
(98,516,9,4,0),
(99,516,10,5,0),
(100,518,23,1,0),
(101,518,25,3,0),
(102,518,9,4,0),
(103,518,10,5,0),
(104,520,1,1,0),
(105,520,6,2,0),
(106,109,7,1,0),
(107,109,9,2,0),
(108,109,10,3,0),
(109,109,11,4,0),
(110,109,12,5,0),
(111,111,7,1,1),
(112,113,7,1,1),
(113,115,6,1,1),
(114,115,7,2,0),
(115,117,7,1,1),
(116,117,6,2,0),
(117,301,26,1,1),
(118,301,6,2,1),
(119,522,32,1,1),
(120,522,30,2,0),
(121,523,32,1,1),
(122,523,30,2,0),
(123,523,31,3,1),
(124,524,30,1,0),
(125,524,27,2,0),
(126,524,28,3,0),
(127,524,29,4,0),
(128,525,32,1,1),
(129,525,30,2,0),
(130,526,32,1,1),
(131,526,31,2,0),
(132,527,32,1,1),
(133,527,31,2,0),
(134,528,32,1,1),
(135,528,33,2,0),
(136,529,32,1,1),
(137,529,31,2,0),
(138,529,33,3,0),
(139,530,32,1,1),
(140,530,31,2,0),
(141,530,33,3,0),
(142,305,2,1,1);


/* Report Data - End*/


/* Report Procedures - Start*/

DELIMITER $$
CREATE  PROCEDURE `prod_company_activity_aggregate`(
IN fromdate DATE,
IN todate DATE,
IN companylist VARCHAR(2000))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 

DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name 
FROM temp_company_host_mapping WHERE host_name IS NOT NULL;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

DROP TEMPORARY TABLE IF EXISTS `temp_company_activity_summary`;
CREATE TEMPORARY TABLE `temp_company_activity_summary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(20) DEFAULT NULL,
  `company_db` varchar(100) DEFAULT NULL,
  `container` varchar(50) DEFAULT NULL,
  `activity_count` int(11) DEFAULT NULL,
  `report_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

DROP TEMPORARY TABLE IF EXISTS `temp_company_host_mapping`;
CREATE TEMPORARY TABLE `temp_company_host_mapping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(20) DEFAULT NULL,
  `host_name` varchar(150) DEFAULT NULL,
  `company_db_name` varchar(100) DEFAULT NULL,
  `authentication_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

IF companylist = '[ALL]' THEN
	INSERT INTO temp_company_host_mapping (id, company_code,host_name,company_db_name)
	SELECT id, company_code,host_name,company_db_name 
	  FROM company_host_mapping;
ELSE
	SET companylist=REPLACE(REPLACE(companylist,']',''),'[','');

	SET @company_list=CONCAT('INSERT INTO temp_company_host_mapping (company_code)
		VALUES (',REPLACE(companylist,',','),('),');');
		
	PREPARE comp_stmt FROM @company_list;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;
		
	UPDATE temp_company_host_mapping tc JOIN company_host_mapping hm ON (tc.company_code=hm.company_code)
	SET tc.host_name=hm.host_name, tc.company_db_name=hm.company_db_name;

END IF;

OPEN cur_company;

  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;

SET @company_report=CONCAT('
INSERT INTO temp_company_activity_summary (company_code, company_db, container, activity_count, report_date)

SELECT ',companycode,', ''',companydbname, ''',''Total'', sum(Activity_Count), now() FROM
(SELECT COUNT(id) AS Activity_Count FROM ',companydbname,'.share_resource_log sf 
WHERE DATE_FORMAT(sf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' 

UNION 

SELECT COUNT(id) AS Activity_Count
FROM ',companydbname,'.project_resource_log pf
WHERE DATE_FORMAT(pf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' 

UNION

SELECT COUNT(id) AS Activity_Count FROM ',companydbname,'.myfiles_resource_log mf
WHERE DATE_FORMAT(mf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' 

UNION

SELECT COUNT(id) AS Activity_Count FROM ',companydbname,'.department_resource_log df
WHERE DATE_FORMAT(df.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' 

UNION

SELECT COUNT(id) AS Activity_Count FROM ',companydbname,'.backup_resource_log bf 
WHERE DATE_FORMAT(bf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' ) temp;' );

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

END LOOP;

CLOSE cur_company;

SELECT `ca`.`id`, `ca`.`company_code`,
    `ca`.`company_db`, `ca`.`activity_count`, `ca`.`report_date`, 
    `cm`.`legal_name`, `cm`.`created_date`, `cm`.`expiry_date`, `cn`.`name`
FROM `temp_company_activity_summary` `ca` JOIN `sd_common_db`.`company_master` `cm` ON(`ca`.`company_code` = `cm`.`company_code`)
JOIN `sd_common_db`.`country_master` `cn` ON (`cm`.`country_id` = `cn`.`id`);

END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_company_activity_detail`(
IN fromdate DATE,
IN todate DATE)
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 

DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name FROM company_host_mapping;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

DROP TEMPORARY TABLE IF EXISTS `temp_company_activity_detail`;
CREATE TEMPORARY TABLE `temp_company_activity_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(20) DEFAULT NULL,
  `company_db` varchar(100) DEFAULT NULL,
  `container` varchar(50) DEFAULT NULL,
  `activity_count` int(11) DEFAULT NULL,
  `file_download` int(11) DEFAULT '0',
  `file_view` int(11) DEFAULT NULL,
  `file_upload` int(11) DEFAULT NULL,
  `report_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

OPEN cur_company;

  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;

SET @company_report=CONCAT('
INSERT INTO temp_company_activity_detail (company_code, company_db, container, activity_count, file_download, file_view, file_upload, report_date)
SELECT ',companycode,', ''',companydbname, ''',''share'',
COUNT(id),
IFNULL(SUM(CASE WHEN action_id = 324 THEN  1 ELSE 0 END),0),
IFNULL(SUM(CASE WHEN action_id = 323 THEN 1 ELSE 0 END),0),
IFNULL(SUM(CASE WHEN action_id = 318 THEN  1 ELSE 0 END),0), 
CURDATE() 
FROM ',companydbname,'.share_resource_log sf 
WHERE DATE_FORMAT(sf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' 

UNION 

SELECT ',companycode,', ''',companydbname,''',''Project'',
COUNT(id),
IFNULL(SUM(CASE WHEN action_id = 124 THEN  1 ELSE 0 END),0),
IFNULL(SUM(CASE WHEN action_id = 123 THEN 1 ELSE 0 END),0),
IFNULL(SUM(CASE WHEN action_id = 118 THEN  1 ELSE 0 END),0),
CURDATE()
FROM ',companydbname,'.project_resource_log pf
WHERE DATE_FORMAT(pf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' 

UNION

SELECT ',companycode,', ''',companydbname,''',''MyFiles'',
COUNT(id), 
IFNULL(SUM(CASE WHEN action_id = 512 THEN  1 ELSE 0 END),0),
IFNULL(SUM(CASE WHEN action_id = 511 THEN 1 ELSE 0 END),0),
IFNULL(SUM(CASE WHEN action_id = 507 THEN  1 ELSE 0 END),0),
CURDATE()
FROM ',companydbname,'.myfiles_resource_log mf
WHERE DATE_FORMAT(mf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' 

UNION

SELECT ',companycode,', ''',companydbname,''',''Department'', 
COUNT(id),
IFNULL(SUM(CASE WHEN action_id = 221 THEN  1 ELSE 0 END),0),
IFNULL(SUM(CASE WHEN action_id = 220 THEN 1 ELSE 0 END),0),
IFNULL(SUM(CASE WHEN action_id = 215 THEN  1 ELSE 0 END),0),
CURDATE() Date
FROM ',companydbname,'.department_resource_log df
WHERE DATE_FORMAT(df.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' 

UNION

SELECT ',companycode,', ''',companydbname,''',''Backup'', 
COUNT(id),
IFNULL(SUM(CASE WHEN action_id = 413 THEN  1 ELSE 0 END),0),
IFNULL(SUM(CASE WHEN action_id = 412 THEN 1 ELSE 0 END),0),
IFNULL(SUM(CASE WHEN action_id = 408 THEN  1 ELSE 0 END),0),
CURDATE() Date
FROM ',companydbname,'.backup_resource_log bf 
WHERE DATE_FORMAT(bf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' ;');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

END LOOP;

CLOSE cur_company;

SELECT `ca`.`id`, `ca`.`company_code`, `ca`.`container`,
    `ca`.`activity_count`, `ca`.`file_download`, `ca`.`file_view`, 
    `ca`.`file_upload`, `report_date`, `cm`.`legal_name`
FROM `sd_common_db`.`temp_company_activity_detail` `ca` JOIN `sd_common_db`.`company_master` `cm` ON(`ca`.`company_code` = `cm`.`company_code`);

END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_company_progress_details`(
IN fromdate DATE,
IN todate DATE,
IN companylist VARCHAR(2000))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 
DECLARE d1 DATE;
DECLARE d2 DATE;
DECLARE startDate DATE;
DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name 
FROM temp_company_host_mapping WHERE host_name IS NOT NULL;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

SET d1=fromdate;
SET d2=todate;



DROP TEMPORARY TABLE IF EXISTS temp_company_userdata_report;
create TEMPORARY table temp_company_userdata_report(
  `company_code` bigint(20) DEFAULT NULL,
  `company_db` varchar(100) DEFAULT NULL,
cmonth int,monthname varchar(15),cyear int,usercount int,datausage int);


DROP TEMPORARY TABLE IF EXISTS `temp_company_host_mapping`;
CREATE TEMPORARY TABLE `temp_company_host_mapping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(20) DEFAULT NULL,
  `host_name` varchar(150) DEFAULT NULL,
  `company_db_name` varchar(100) DEFAULT NULL,
  `authentication_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

IF companylist = '[ALL]' THEN
	INSERT INTO temp_company_host_mapping (id, company_code,host_name,company_db_name)
	SELECT id, company_code,host_name,company_db_name 
	  FROM company_host_mapping;
ELSE
	SET companylist=REPLACE(REPLACE(companylist,']',''),'[','');

	SET @company_list=CONCAT('INSERT INTO temp_company_host_mapping (company_code)
		VALUES (',REPLACE(companylist,',','),('),');');
		
	PREPARE comp_stmt FROM @company_list;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;
		
	UPDATE temp_company_host_mapping tc JOIN company_host_mapping hm ON (tc.company_code=hm.company_code)
	SET tc.host_name=hm.host_name, tc.company_db_name=hm.company_db_name;
END IF;

OPEN cur_company;

  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;
SET startDate=concat(year(d1),'-',month(d1),"-1");
	WHILE startDate < d2 DO		
        SET @company_report=CONCAT("
INSERT INTO temp_company_userdata_report(company_code, company_db, cmonth,monthname,cyear,usercount,datausage)
 SELECT ",companycode,",'",companydbname,"',month('",startDate,"'),monthname('",startDate,"'),
        year('",startDate,"'),(select count(id) from ",companydbname,".users 
         where created_date < DATE_ADD('",startDate,"', INTERVAL 1 MONTH)),999");
PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;        
        SET startDate = DATE_ADD(startDate, INTERVAL 1 MONTH);
	END WHILE;
END LOOP;

CLOSE cur_company;

SELECT `cm`.`legal_name` as `CompanyName`,ud.company_code,ud.company_db,ud.cyear,ud.cmonth,ud.monthname,ud.usercount,ud.datausage from temp_company_userdata_report ud 
 Left join `company_master` cm on  cm.company_code=ud.company_code;
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_comp_dept_file_count`(
IN incmpcode BIGINT,
IN deptlist VARCHAR(500),
IN fromDate DATE,
IN toDate DATE,
IN timezone VARCHAR(100))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 
DECLARE where_dept VARCHAR(2000);

DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name 
FROM sd_common_db.company_host_mapping WHERE company_code=incmpcode;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

DROP TEMPORARY TABLE IF EXISTS `temp_stat_dept_file_upload`;
CREATE TEMPORARY TABLE `temp_stat_dept_file_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `department_master_id` int(11) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `file_count_before` int(10) unsigned DEFAULT NULL,
  `file_count_between` int(10) unsigned DEFAULT NULL,
  `file_count_all` int(10) unsigned DEFAULT NULL,
  `last_login_date` DATETIME,
  `company_db_name` varchar(100) DEFAULT NULL,
  `company_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

SET where_dept='';

IF deptlist != '[ALL]' THEN
	SET deptlist=REPLACE(REPLACE(deptlist,']',''),'[','');
	SET where_dept=CONCAT('AND dp.id IN(',deptlist,')');
END IF;

OPEN cur_company;

  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;

SET @company_report=CONCAT('
INSERT INTO `temp_stat_dept_file_upload`
(`department_id`,
`department_master_id`,
`department_name`,
`file_count_before`,
`file_count_between`,
`file_count_all`,
`last_login_date`,
`company_db_name`,
`company_code`)
SELECT dp.id, dm.id, dm.`name`,0, 0, 0,NULL, ''',companydbname,''',''', companycode,'''
FROM ',companydbname,'.department_master dm LEFT JOIN ',companydbname,'.department dp ON (dm.id=dp.department_master_id) WHERE 1=1 ',where_dept,' ;');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE temp_stat_dept_file_upload du
SET du.file_count_before = du.file_count_before + (
SELECT COUNT(1) FROM ',companydbname,'.department_file 
WHERE container_id= du.department_id AND `created_date` < ''',fromDate,''')
WHERE du.company_code=''',companycode,''';');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE temp_stat_dept_file_upload du
SET du.file_count_between = du.file_count_between + (
SELECT COUNT(1) FROM ',companydbname,'.department_file 
WHERE container_id= du.department_id AND DATE_FORMAT(`created_date`,''%Y-%m-%d'') BETWEEN ''',fromDate,''' AND ''',toDate,''')
WHERE du.company_code=''',companycode,''';');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE temp_stat_dept_file_upload du
SET du.file_count_all = du.file_count_all + (
SELECT COUNT(1) FROM ',companydbname,'.department_file 
WHERE container_id= du.department_id )
WHERE du.company_code=''',companycode,''';');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE temp_stat_dept_file_upload du
SET du.last_login_date = (
SELECT login_date FROM ',companydbname,'.users 
WHERE department_id= du.department_id ORDER BY login_date DESC LIMIT 1)
WHERE du.company_code=''',companycode,''';');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

END LOOP;

CLOSE cur_company;

	SET @row_number:=0;

	SET @activity_report=CONCAT('
SELECT @row_number:=@row_number+1 AS rowid, department_name, `file_count_before`, `file_count_between`, `file_count_all`, CONVERT_TZ(last_login_date, ''GMT'',''',timezone,''') AS last_login_date FROM temp_stat_dept_file_upload;');
		
	PREPARE comp_stmt FROM @activity_report;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_comp_division_quota_usage`(
IN incmpcode BIGINT)
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 

DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name 
FROM sd_common_db.company_host_mapping WHERE company_code=incmpcode;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

DROP TEMPORARY TABLE IF EXISTS `temp_stat_division_quota_usage`;
CREATE TEMPORARY TABLE `temp_stat_division_quota_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `department_master_id` int(11) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `division_quota_allocated` bigint(20) unsigned DEFAULT NULL,
  `division_quota_usage` bigint(20) unsigned DEFAULT NULL,
  `no_of_files_upload` int(10) unsigned DEFAULT NULL,
  `company_db_name` varchar(100) DEFAULT NULL,
  `company_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;


OPEN cur_company;

  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;

SET @company_report=CONCAT('
INSERT INTO `temp_stat_division_quota_usage`
(`department_id`,
`department_master_id`,
`department_name`,
`division_quota_allocated`,
`division_quota_usage`,
`no_of_files_upload`,
`company_db_name`,
`company_code`)
SELECT dp.id, dm.id, dm.`name`,dp.quota, dp.`usage`,0, ''',companydbname,''',''', companycode,'''
FROM ',companydbname,'.department_master dm LEFT JOIN ',companydbname,'.department dp ON (dm.id=dp.department_master_id);');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE temp_stat_division_quota_usage du
SET du.no_of_files_upload = (SELECT count(id) FROM ',companydbname,'.department_file WHERE container_id= du.department_id AND status_id=1)
WHERE du.company_code=''',companycode,''';');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

END LOOP;

CLOSE cur_company;

	SET @row_number:=0;

	SET @activity_report=CONCAT('
SELECT @row_number:=@row_number+1 AS rowid, department_name, ROUND((division_quota_allocated/1024)/1024,2) AS quota_allocated, ROUND((division_quota_usage/1024)/1024,2) AS quota_usage, 
no_of_files_upload
FROM temp_stat_division_quota_usage;');
		
	PREPARE comp_stmt FROM @activity_report;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;

END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_comp_project_quota_usage`(
IN incmpcode BIGINT)
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 

DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name 
FROM sd_common_db.company_host_mapping WHERE company_code=incmpcode;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

DROP TEMPORARY TABLE IF EXISTS `temp_stat_project_quota_usage`;
CREATE TEMPORARY TABLE `temp_stat_project_quota_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `project_quota_allocated` bigint(20) unsigned DEFAULT NULL,
  `project_quota_usage` bigint(20) unsigned DEFAULT NULL,
  `no_of_files_upload` int(10) unsigned DEFAULT NULL,
  `company_db_name` varchar(100) DEFAULT NULL,
  `company_code` varchar(100) DEFAULT NULL,
  `department_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

OPEN cur_company;

  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;

SET @company_report=CONCAT('
INSERT INTO `temp_stat_project_quota_usage`
(`project_id`,
`project_name`,
`project_quota_allocated`,
`project_quota_usage`,
`no_of_files_upload`,
`company_db_name`,
`company_code`,
`department_master_id`)
SELECT pr.id, pr.name, pr.quota, pr.`usage`,0, ''',companydbname,''',''', companycode,''', dm.`id` 
FROM ',companydbname,'.project pr LEFT JOIN ',companydbname,'.department_master dm ON (pr.department_master_id=dm.id)
WHERE pr.status_id = 1;');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE temp_stat_project_quota_usage pu
SET pu.no_of_files_upload = (SELECT count(id) FROM ',companydbname,'.project_file WHERE container_id= pu.project_id AND status_id = 1)
WHERE pu.company_code=''',companycode,''';');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

END LOOP;

CLOSE cur_company;

	SET @row_number:=0;

	SET @activity_report=CONCAT('
SELECT @row_number:=@row_number+1 AS rowid, project_name, ROUND((project_quota_allocated/1024)/1024,2) AS quota_allocated, ROUND((project_quota_usage/1024)/1024,2) AS quota_usage, 
no_of_files_upload
FROM temp_stat_project_quota_usage;');
		
	PREPARE comp_stmt FROM @activity_report;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_comp_user_file_count`(
IN incmpcode BIGINT,
IN deptlist VARCHAR(500),
IN fromDate DATE,
IN toDate DATE,
IN timezone VARCHAR(100))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 
DECLARE where_dept VARCHAR(2000);
DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name 
FROM sd_common_db.company_host_mapping WHERE company_code=incmpcode;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
DROP TEMPORARY TABLE IF EXISTS `temp_stat_dept_file_upload`;
CREATE TEMPORARY TABLE `temp_stat_dept_file_upload` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) DEFAULT NULL,
  `first_name` VARCHAR (200) NOT NULL,
  `last_name` VARCHAR (200) DEFAULT NULL,
  `department_name` VARCHAR(100) DEFAULT NULL,
  `file_count_before` INT(10) UNSIGNED DEFAULT NULL,
  `file_count_between` INT(10) UNSIGNED DEFAULT NULL,
  `file_count_all` INT(10) UNSIGNED DEFAULT NULL,
  `last_login_date` DATETIME,
  `company_db_name` VARCHAR(100) DEFAULT NULL,
  `company_code` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;
SET where_dept='';
IF deptlist != '[ALL]' THEN
	SET deptlist=REPLACE(REPLACE(deptlist,']',''),'[','');
	SET where_dept=CONCAT('AND u.`department_id` IN(',deptlist,')');
END IF;
OPEN cur_company;
  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;
SET @company_report=CONCAT('
INSERT INTO `temp_stat_dept_file_upload`
(`user_id`,
`first_name`,
`last_name`,
`department_name`,
`file_count_before`,
`file_count_between`,
`file_count_all`,
`last_login_date`,
`company_db_name`,
`company_code`)
SELECT u.`id`, u.`first_name`, u.`last_name`, dm.`name`,0, 0, 0, u.`login_date`, ''',companydbname,''',''', companycode,'''
FROM ',companydbname,'.users u LEFT JOIN ',companydbname,'.department_master dm ON (dm.`id` = u.`department_master_id`) WHERE 1=1 ',where_dept,'  ORDER BY u.`department_id` DESC;');
PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;
SET @company_report=CONCAT('
UPDATE temp_stat_dept_file_upload du
SET du.file_count_before = du.file_count_before + (
SELECT COUNT(1) FROM ',companydbname,'.universal_file_info 
WHERE `created_by` = du.`user_id` AND `created_date` < ''',fromDate,'''
)
WHERE du.company_code=''',companycode,''';');
PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;
SET @company_report=CONCAT('
UPDATE temp_stat_dept_file_upload du
SET du.file_count_between = du.file_count_between + (
SELECT COUNT(1) FROM ',companydbname,'.universal_file_info 
WHERE `created_by` = du.`user_id` AND DATE_FORMAT(`created_date`,''%Y-%m-%d'') BETWEEN ''',fromDate,''' AND ''',toDate,'''
)
WHERE du.company_code=''',companycode,''';');
PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;
SET @company_report=CONCAT('
UPDATE temp_stat_dept_file_upload du
SET du.file_count_all = du.file_count_all + (
SELECT COUNT(1) FROM ',companydbname,'.universal_file_info 
WHERE `created_by` = du.`user_id` 
)
WHERE du.company_code=''',companycode,''';');
PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;
END LOOP;
CLOSE cur_company;
	SET @row_number:=0;
	SET @activity_report=CONCAT('
SELECT @row_number:=@row_number+1 AS rowid, `first_name`, `last_name`, `department_name`, `file_count_before`, `file_count_between`, `file_count_all`, CONVERT_TZ(last_login_date, ''GMT'',''',timezone,''') AS last_login_date FROM temp_stat_dept_file_upload;');
		
	PREPARE comp_stmt FROM @activity_report;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_comp_user_login_usage`(
IN incmpcode BIGINT,
IN deptlist VARCHAR(500),
IN fromdate DATE,
IN todate DATE,
IN timezone VARCHAR(100))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 
DECLARE where_dept VARCHAR(2000);

DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name 
FROM sd_common_db.company_host_mapping WHERE company_code=incmpcode;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

DROP TEMPORARY TABLE IF EXISTS `temp_stat_user_login_usage`;
CREATE TEMPORARY TABLE `temp_stat_user_login_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `login_name` varchar(100) DEFAULT NULL,
  `department_master_id` int(10) unsigned DEFAULT NULL,
  `department_name` varchar(45) DEFAULT NULL,
  `user_login_count` int(11) DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `no_of_files_upload` int(11) DEFAULT NULL,
  `company_db_name` varchar(100) DEFAULT NULL,
  `company_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

OPEN cur_company;

  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;

SET where_dept='';

IF deptlist != '[ALL]' THEN
SET deptlist=REPLACE(REPLACE(deptlist,']',''),'[','');

SET where_dept=CONCAT('AND ud.department_master_id IN(',deptlist,')');

END IF;

SET @company_report=CONCAT('
INSERT INTO `temp_stat_user_login_usage` (`user_id`, `login_name`, `department_master_id`, `department_name`, `user_login_count`, `last_login_date`, `no_of_files_upload`, `company_db_name`, `company_code`)
SELECT ud.id, ud.login_name, ud.department_master_id, dm.`name`,0, login_date, 0, ''',companydbname,''', ''',companycode,'''
FROM ',companydbname,'.users ud LEFT JOIN ',companydbname,'.department_master dm ON (ud.department_master_id = dm.id) WHERE 1=1 ',where_dept,' ;');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE `temp_stat_user_login_usage`
SET `user_login_count`= (SELECT count(id) FROM ',companydbname,'.general_log WHERE action_id=942 AND action_user_id = user_id AND DATE_FORMAT(action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''');');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE `temp_stat_user_login_usage` lr
SET lr.`no_of_files_upload`= lr.`no_of_files_upload` + (SELECT COUNT(id) FROM ',companydbname,'.share_resource_log sf 
WHERE sf.action_user_id= lr.`user_id` AND sf.action_id IN(318,319) AND DATE_FORMAT(sf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''');');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE `temp_stat_user_login_usage` lr
SET lr.`no_of_files_upload`= lr.`no_of_files_upload` + (SELECT COUNT(id) FROM ',companydbname,'.project_resource_log pf 
WHERE pf.action_user_id= lr.`user_id` AND pf.action_id IN(118, 119) AND DATE_FORMAT(pf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''');');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE `temp_stat_user_login_usage` lr
SET lr.`no_of_files_upload`= lr.`no_of_files_upload` + (SELECT COUNT(id) FROM ',companydbname,'.myfiles_resource_log mf 
WHERE mf.action_user_id= lr.`user_id` AND mf.action_id IN(507, 508) AND DATE_FORMAT(mf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''');');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE `temp_stat_user_login_usage` lr
SET lr.`no_of_files_upload`= lr.`no_of_files_upload` + (SELECT COUNT(id) FROM ',companydbname,'.department_resource_log df 
WHERE df.action_user_id= lr.`user_id` AND df.action_id IN(215, 216) AND DATE_FORMAT(df.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''');');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

SET @company_report=CONCAT('
UPDATE `temp_stat_user_login_usage` lr
SET lr.`no_of_files_upload`= lr.`no_of_files_upload` + (SELECT COUNT(id) FROM ',companydbname,'.backup_resource_log bf 
WHERE bf.action_user_id= lr.`user_id` AND bf.action_id IN(408, 409) AND DATE_FORMAT(bf.action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''');');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

END LOOP;

CLOSE cur_company;

	SET @row_number:=0;

	SET @activity_report=CONCAT('
SELECT @row_number:=@row_number+1 AS rowid, login_name, department_name, user_login_count, CONVERT_TZ(last_login_date, ''GMT'',''',timezone,''') AS last_login_date, no_of_files_upload
FROM temp_stat_user_login_usage;');
		
	PREPARE comp_stmt FROM @activity_report;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_infra_company_activity_aggregate`(
IN fromdate DATE,
IN todate DATE,
IN companylist VARCHAR(2000))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 
DECLARE wheredate VARCHAR(1000);

DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name 
FROM temp_company_host_mapping WHERE host_name IS NOT NULL;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

DROP TEMPORARY TABLE IF EXISTS `temp_company_activity_summary`;
CREATE TEMPORARY TABLE `temp_company_activity_summary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(20) DEFAULT NULL,
  `company_db` varchar(100) DEFAULT NULL,
  `ca_share` int(11) DEFAULT 0,
  `ca_project` int(11) DEFAULT 0,
  `ca_myfiles` int(11) DEFAULT 0,
  `ca_department` int(11) DEFAULT 0,
  `ca_backup` int(11) DEFAULT 0,
  `ca_others` int(11) DEFAULT 0,
  `report_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DROP TEMPORARY TABLE IF EXISTS `temp_company_host_mapping`;
CREATE TEMPORARY TABLE `temp_company_host_mapping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(20) DEFAULT NULL,
  `host_name` varchar(150) DEFAULT NULL,
  `company_db_name` varchar(100) DEFAULT NULL,
  `authentication_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

IF companylist IS NULL OR companylist = 'ALL' THEN
	SET companylist='[ALL]';
END IF;

IF companylist = '[ALL]' THEN
	INSERT INTO temp_company_host_mapping (id, company_code,host_name,company_db_name)
	SELECT id, company_code,host_name,company_db_name 
	  FROM company_host_mapping;
ELSE
	SET companylist=REPLACE(REPLACE(companylist,']',''),'[','');

	SET @company_list=CONCAT('INSERT INTO temp_company_host_mapping (company_code)
		VALUES (',REPLACE(companylist,',','),('),');');
	
	PREPARE comp_stmt FROM @company_list;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;
		
	UPDATE temp_company_host_mapping tc JOIN company_host_mapping hm ON (tc.company_code=hm.company_code)
	SET tc.host_name=hm.host_name, tc.company_db_name=hm.company_db_name;

END IF;

IF fromdate IS NULL OR todate IS NULL THEN
	SET wheredate = 'WHERE 1 = 1 ';
ELSE
	SET wheredate = CONCAT('WHERE DATE_FORMAT(action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' ');
END IF;

OPEN cur_company;

  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;

SET @company_report=CONCAT('
INSERT INTO temp_company_activity_summary (company_code, company_db, ca_share, ca_project,ca_myfiles, ca_department, ca_backup, ca_others, report_date)

SELECT ',companycode,',''',companydbname,''',
((SELECT COUNT(id) FROM ',companydbname,'.share_resource_log ',wheredate,') 
+ (SELECT COUNT(id) FROM ',companydbname,'.share_log ',wheredate,')) AS ''share_count'', 

((SELECT COUNT(id) FROM ',companydbname,'.project_resource_log ',wheredate,')
+ (SELECT COUNT(id) FROM ',companydbname,'.project_log ',wheredate,')) AS ''project_count'', 

((SELECT COUNT(id) FROM ',companydbname,'.myfiles_resource_log ',wheredate,') 
+ (SELECT COUNT(id) FROM ',companydbname,'.myfiles_log ',wheredate,')) AS ''myfiles_count'', 

((SELECT COUNT(id) FROM ',companydbname,'.department_resource_log ',wheredate,')
+ (SELECT COUNT(id) FROM ',companydbname,'.department_log ',wheredate,')) AS ''department_count'', 

((SELECT COUNT(id) FROM ',companydbname,'.backup_resource_log ',wheredate,')
+ (SELECT COUNT(id) FROM ',companydbname,'.backup_log ',wheredate,')) AS ''backup_count'', 

(SELECT COUNT(id) FROM ',companydbname,'.general_log ',wheredate,') AS ''others_count'', CURDATE() FROM ',companydbname,'.company c');

PREPARE comp_stmt FROM @company_report;

EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;
END LOOP;

CLOSE cur_company;

SELECT `ca`.`id`, `ca`.`company_code`,
    `ca`.`ca_share`, `ca`.`ca_project`, `ca`.`ca_myfiles`, `ca`.`ca_department`, `ca`.`ca_backup`, `ca`.`ca_others`, `ca`.`report_date`, 
    `cm`.`legal_name` AS 'company_name', `cm`.`created_date`, `cm`.`expiry_date`, `cn`.`name`
FROM `temp_company_activity_summary` `ca` JOIN `sd_common_db`.`company_master` `cm` ON(`ca`.`company_code` = `cm`.`company_code`)
JOIN `sd_common_db`.`country_master` `cn` ON (`cm`.`country_id` = `cn`.`id`) ORDER BY `ca`.`company_code`;

END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_infra_company_master_list`(IN companylist VARCHAR(2000),IN companytype VARCHAR(50),IN companystatus VARCHAR(50),IN crdatestart VARCHAR(30),IN crdateend VARCHAR(30),IN expdatestart VARCHAR(30),IN expdateend VARCHAR(30))
BEGIN
DECLARE t_companycode VARCHAR(2000) DEFAULT '';
DECLARE t_companytype VARCHAR(1000) DEFAULT '';
DECLARE t_companystatus VARCHAR(1000) DEFAULT '';
DECLARE t_createdate VARCHAR(1000) DEFAULT '';
DECLARE t_expirydate VARCHAR(1000) DEFAULT '';

SET companylist=REPLACE(REPLACE(companylist,']',''),'[','');
SET companytype=REPLACE(REPLACE(companytype,']',''),'[','');
SET companystatus=REPLACE(REPLACE(companystatus,']',''),'[','');

SET companytype=REPLACE(companytype,',',''',''');

IF companylist ='[ALL]' OR companylist ='ALL' OR companylist ='' OR companylist ='[]' OR companylist IS NULL THEN
SET t_companycode = '';
ELSE 
SET t_companycode = CONCAT(' AND `cm`.`company_code` IN (',companylist,')');
END IF;

IF companytype ='[ALL]' OR companytype ='ALL' OR companytype ='' OR companytype ='[]' OR companytype IS NULL THEN
SET t_companytype = '';
ELSE 
SET t_companytype = CONCAT(' AND `cm`.`company_type` IN (''',companytype,''')');
END IF;

IF companystatus ='[ALL]' OR companystatus ='ALL' OR companystatus ='' OR companystatus ='[]' OR companystatus IS NULL THEN
SET t_companystatus = '';
ELSE 
SET t_companystatus = CONCAT(' AND `cm`.`status_id` IN (',companystatus,')');
END IF;

IF crdatestart='' OR crdateend = '' OR crdatestart IS NULL OR crdateend IS NULL THEN
SET t_createdate = '';
ELSE 
SET t_createdate = CONCAT(' AND DATE_FORMAT(`cm`.`created_date`,''%Y-%m-%d'')  BETWEEN  ''',DATE_FORMAT(crdatestart,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(crdateend,'%Y-%m-%d'),'''');
END IF;

IF expdatestart='' OR expdateend = '' OR expdatestart IS NULL OR expdateend IS NULL THEN
SET t_expirydate = '';
ELSE 
SET t_expirydate = CONCAT(' AND DATE_FORMAT(`cm`.`expiry_date`,''%Y-%m-%d'') BETWEEN  ''',DATE_FORMAT(expdatestart,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(expdateend,'%Y-%m-%d'),'''');
END IF;

SET @company_report=CONCAT('SELECT
    `cm`.`group_company_code`,
    `cm`.`company_code`,
    `cm`.`legal_name`,
    `cm`.`company_type`,
    `cm`.`company_url`,
    `cm`.`expiry_date`,
    `cm`.`created_by`,
    `cm`.`created_date`,
     `cm`.`updated_date`,
    `cm`.`updated_by`,
    `gc`.`group_name`,
    `com`.`name` AS country_name,
    `sm`.`name` AS company_status
FROM
    `sd_common_db`.`company_master` cm
        LEFT JOIN
    `sd_common_db`.`group_company` gc ON (`gc`.`group_company_code` = `cm`.`group_company_code`)
        LEFT JOIN
    `sd_common_db`.`country_master` com ON (`com`.`id` = `cm`.`country_id`)
        LEFT JOIN
    `sd_common_db`.`status_master` sm ON (`sm`.`id` = `cm`.`status_id`)
        LEFT JOIN
    `sd_common_db`.`admin_user` cu ON (`cu`.`id` = `cm`.`created_by`)
        LEFT JOIN
    `sd_common_db`.`admin_user` uu ON (`uu`.`id` = `cm`.`updated_by`)
WHERE 1=1 ',t_companycode,t_companytype,t_companystatus,t_createdate,t_expirydate);
 
	PREPARE comp_stmt FROM @company_report;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_infra_company_storage_list`(IN companylist VARCHAR(2000))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 


DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name 
FROM temp_company_host_mapping WHERE host_name IS NOT NULL;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


DROP TEMPORARY TABLE IF EXISTS `sd_common_db`.`temp_infra_company_storage_list`;
CREATE TEMPORARY TABLE `sd_common_db`.`temp_infra_company_storage_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(30) DEFAULT NULL,
  `containers` varchar(250) DEFAULT NULL,
  `quota` bigint(30) DEFAULT '0',
  `allocated_quota` bigint(30) DEFAULT '0',
  `usage_quota` bigint(30) DEFAULT '0',
  `t_quota` bigint(30) DEFAULT '0',
  `t_allocated_quota` bigint(30) DEFAULT '0',
  `t_usage_quota` bigint(30) DEFAULT '0',
   PRIMARY KEY (`id`)
) ENGINE=INNODB;

DROP TEMPORARY TABLE IF EXISTS `temp_company_host_mapping`;
CREATE TEMPORARY TABLE `temp_company_host_mapping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(20) DEFAULT NULL,
  `host_name` varchar(150) DEFAULT NULL,
  `company_db_name` varchar(100) DEFAULT NULL,
  `authentication_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

IF companylist = '[ALL]' OR companylist = '[]' OR companylist = '[ ]' OR companylist = '' OR companylist = 'ALL' OR companylist IS NULL OR companylist = ' ' THEN
	INSERT INTO temp_company_host_mapping (id, company_code,host_name,company_db_name)
	SELECT id, company_code,host_name,company_db_name 
	  FROM company_host_mapping;
ELSE
	SET companylist=REPLACE(REPLACE(companylist,']',''),'[','');

	SET @company_list=CONCAT('INSERT INTO temp_company_host_mapping (company_code)
		VALUES (',REPLACE(companylist,',','),('),');');
		
	PREPARE comp_stmt FROM @company_list;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;
		
	UPDATE temp_company_host_mapping tc JOIN company_host_mapping hm ON (tc.company_code=hm.company_code)
	SET tc.host_name=hm.host_name, tc.company_db_name=hm.company_db_name;

END IF;



OPEN cur_company;

  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;

SET @company_report=CONCAT('
INSERT INTO temp_infra_company_storage_list (company_code,t_quota,t_allocated_quota,t_usage_quota)
SELECT 
    ',companycode,',(SELECT a.quota FROM ',companydbname,'.company_level_quota a WHERE a.name IN ("TOTAL_COMPANY_QUOTA")),(SELECT SUM(a.allocated_quota)  FROM ',companydbname,'.company_level_quota a WHERE a.name NOT IN ("TOTAL_COMPANY_QUOTA") ),(SELECT SUM(a.usage)  FROM ',companydbname,'.company_level_quota a WHERE a.name NOT IN ("TOTAL_COMPANY_QUOTA"))
FROM DUAL');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

END LOOP;

CLOSE cur_company;

SELECT `cm`.`legal_name`,`ca`.`company_code`,`com`.`name`,`cm`.`company_type`,`ca`.`t_quota`,`ca`.`t_allocated_quota`,`ca`.`t_usage_quota`,fun_format_filesize(`ca`.`t_quota`) AS f_quota,fun_format_filesize(`ca`.`t_allocated_quota`) AS f_allocated_quota,fun_format_filesize(`ca`.`t_usage_quota`) AS f_usage_quota
FROM `sd_common_db`.`temp_infra_company_storage_list` `ca` JOIN `sd_common_db`.`company_master` `cm` ON(`ca`.`company_code` = `cm`.`company_code`) LEFT JOIN `sd_common_db`.`country_master` `com` ON (`cm`.`country_id`=`com`.`id`);

END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_infra_company_user_activity`(
IN fromdate DATE,
IN todate DATE,
IN companylist VARCHAR(2000))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 
DECLARE wheredate VARCHAR(1000);

DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name 
FROM temp_company_host_mapping WHERE host_name IS NOT NULL;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

DROP TEMPORARY TABLE IF EXISTS `temp_company_activity_summary`;
CREATE TEMPORARY TABLE `temp_company_activity_summary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(20) DEFAULT NULL,
  `company_db` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_login` varchar(100) DEFAULT NULL,
  `ca_share` int(11) DEFAULT 0,
  `ca_project` int(11) DEFAULT 0,
  `ca_myfiles` int(11) DEFAULT 0,
  `ca_department` int(11) DEFAULT 0,
  `ca_backup` int(11) DEFAULT 0,
  `ca_others` int(11) DEFAULT 0,
  `report_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DROP TEMPORARY TABLE IF EXISTS `temp_company_host_mapping`;
CREATE TEMPORARY TABLE `temp_company_host_mapping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(20) DEFAULT NULL,
  `host_name` varchar(150) DEFAULT NULL,
  `company_db_name` varchar(100) DEFAULT NULL,
  `authentication_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

IF companylist IS NULL OR companylist = 'ALL' THEN
	SET companylist='[ALL]';
END IF;

IF companylist = '[ALL]' THEN
	INSERT INTO temp_company_host_mapping (id, company_code,host_name,company_db_name)
	SELECT id, company_code,host_name,company_db_name 
	  FROM company_host_mapping;
ELSE
	SET companylist=REPLACE(REPLACE(companylist,']',''),'[','');

	SET @company_list=CONCAT('INSERT INTO temp_company_host_mapping (company_code)
		VALUES (',REPLACE(companylist,',','),('),');');
		
	PREPARE comp_stmt FROM @company_list;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;
		
	UPDATE temp_company_host_mapping tc JOIN company_host_mapping hm ON (tc.company_code=hm.company_code)
	SET tc.host_name=hm.host_name, tc.company_db_name=hm.company_db_name;

END IF;

IF fromdate IS NULL OR todate IS NULL THEN
	SET wheredate = 'AND 1 = 1 ';
ELSE
	SET wheredate = CONCAT('AND DATE_FORMAT(action_date,''%Y-%m-%d'') BETWEEN ''',DATE_FORMAT(fromdate,'%Y-%m-%d'),''' AND ''',DATE_FORMAT(todate,'%Y-%m-%d'),''' ');
END IF;

OPEN cur_company;

  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;

SET @company_report=CONCAT('
INSERT INTO temp_company_activity_summary (company_code, company_db, user_id, user_login, ca_share, ca_project,ca_myfiles, ca_department, ca_backup, ca_others, report_date)

SELECT ',companycode,', ''',companydbname, ''', u.id, u.login_name,
((SELECT COUNT(id) FROM ',companydbname,'.share_resource_log 
WHERE action_user_id = u.id ',wheredate,') 
+ (SELECT COUNT(id) FROM ',companydbname,'.share_log 
WHERE action_user_id = u.id ',wheredate,')) AS ''share_count'', 

((SELECT COUNT(id) FROM ',companydbname,'.project_resource_log 
WHERE action_user_id = u.id ',wheredate,')
+ (SELECT COUNT(id) FROM ',companydbname,'.project_log 
WHERE action_user_id = u.id ',wheredate,')) AS ''project_count'', 

((SELECT COUNT(id) FROM ',companydbname,'.myfiles_resource_log 
WHERE action_user_id = u.id ',wheredate,') 
+ (SELECT COUNT(id) FROM ',companydbname,'.myfiles_log 
WHERE action_user_id = u.id ',wheredate,')) AS ''myfiles_count'', 

((SELECT COUNT(id) FROM ',companydbname,'.department_resource_log 
WHERE action_user_id = u.id ',wheredate,')
+ (SELECT COUNT(id) FROM ',companydbname,'.department_log 
WHERE action_user_id = u.id ',wheredate,')) AS ''department_count'', 

((SELECT COUNT(id) FROM ',companydbname,'.backup_resource_log 
WHERE action_user_id = u.id ',wheredate,')
+ (SELECT COUNT(id) FROM ',companydbname,'.backup_log 
WHERE action_user_id = u.id ',wheredate,')) AS ''backup_count'', 

(SELECT COUNT(id) FROM ',companydbname,'.general_log 
WHERE action_user_id = u.id ',wheredate,') AS ''backup_count'', CURDATE() FROM ',companydbname,'.users u');

PREPARE comp_stmt FROM @company_report;

EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;
END LOOP;

CLOSE cur_company;

SELECT `ca`.`id`, `ca`.`company_code`,
    `ca`.`user_id`, `ca`.`user_login`, `ca`.`ca_share`, `ca`.`ca_project`, `ca`.`ca_myfiles`, `ca`.`ca_department`, `ca`.`ca_backup`, `ca`.`ca_others`, `ca`.`report_date`, 
    `cm`.`legal_name` AS 'company_name', `cm`.`created_date`, `cm`.`expiry_date`, `cn`.`name`
FROM `temp_company_activity_summary` `ca` JOIN `sd_common_db`.`company_master` `cm` ON(`ca`.`company_code` = `cm`.`company_code`)
JOIN `sd_common_db`.`country_master` `cn` ON (`cm`.`country_id` = `cn`.`id`) WHERE `ca`.`user_id` > 0 ORDER BY `ca`.`company_code`,`ca`.`user_login`;

END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `prod_infra_company_users_count`(IN companylist VARCHAR(2000))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE companycode BIGINT; 
DECLARE companydbname VARCHAR(100); 


DECLARE cur_company CURSOR FOR SELECT company_code, company_db_name 
FROM temp_company_host_mapping WHERE host_name IS NOT NULL;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


DROP TEMPORARY TABLE IF EXISTS `sd_common_db`.`temp_company_users_count`;
CREATE TEMPORARY TABLE `sd_common_db`.`temp_company_users_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(30) DEFAULT NULL,
  `active_user_count` int(11) DEFAULT '0',
  `register_user_count` int(11) DEFAULT '0',
  `blocked_user_count` int(11) DEFAULT '0',
  `locked_user_count` int(11) DEFAULT '0',
  `total_user_count` int(11) DEFAULT '0',
   PRIMARY KEY (`id`)
) ENGINE=INNODB;

DROP TEMPORARY TABLE IF EXISTS `temp_company_host_mapping`;
CREATE TEMPORARY TABLE `temp_company_host_mapping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` bigint(20) DEFAULT NULL,
  `host_name` varchar(150) DEFAULT NULL,
  `company_db_name` varchar(100) DEFAULT NULL,
  `authentication_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

IF companylist = '[ALL]' OR companylist = '[]' OR companylist = '[ ]' OR companylist = '' OR companylist = 'ALL' OR companylist IS NULL OR companylist = ' ' THEN
	INSERT INTO temp_company_host_mapping (id, company_code,host_name,company_db_name)
	SELECT id, company_code,host_name,company_db_name 
	  FROM company_host_mapping;
ELSE
	SET companylist=REPLACE(REPLACE(companylist,']',''),'[','');

	SET @company_list=CONCAT('INSERT INTO temp_company_host_mapping (company_code)
		VALUES (',REPLACE(companylist,',','),('),');');
		
	PREPARE comp_stmt FROM @company_list;
	EXECUTE comp_stmt;
	DEALLOCATE PREPARE comp_stmt;
		
	UPDATE temp_company_host_mapping tc JOIN company_host_mapping hm ON (tc.company_code=hm.company_code)
	SET tc.host_name=hm.host_name, tc.company_db_name=hm.company_db_name;

END IF;


OPEN cur_company;

  read_loop: LOOP
    FETCH cur_company INTO companycode, companydbname;
    IF done THEN
      LEAVE read_loop;
    END IF;

SET @company_report=CONCAT('
INSERT INTO temp_company_users_count (company_code, active_user_count, register_user_count,blocked_user_count,locked_user_count,total_user_count)
SELECT 
    ',companycode,',(SELECT COUNT(`id`) FROM ',companydbname,'.users where status_id=1), (SELECT COUNT(`id`) FROM ',companydbname,'.users where status_id=4),(SELECT COUNT(`id`) FROM ',companydbname,'.users where status_id=5),(SELECT COUNT(`id`) FROM ',companydbname,'.users where status_id=12),(SELECT COUNT(`id`) FROM ',companydbname,'.users where status_id IN(1,4,5,12))
');

PREPARE comp_stmt FROM @company_report;
EXECUTE comp_stmt;
DEALLOCATE PREPARE comp_stmt;

END LOOP;

CLOSE cur_company;

SELECT `cm`.`legal_name`,`ca`.`active_user_count`,`ca`.`register_user_count`,`blocked_user_count`,`locked_user_count`,`total_user_count`
FROM `sd_common_db`.`temp_company_users_count` `ca` JOIN `sd_common_db`.`company_master` `cm` ON(`ca`.`company_code` = `cm`.`company_code`);

END$$
DELIMITER ;

/* Report Procedures - End*/


/* Report Function - Start*/


DELIMITER $$
CREATE FUNCTION `fun_format_filesize`(filesize FLOAT) RETURNS varchar(20) CHARSET utf8
BEGIN

DECLARE n INT DEFAULT 1;

IF filesize = -1 THEN
RETURN 'No Limit';
END IF;

IF filesize = 0 THEN
RETURN 0;
END IF;
LOOP     
IF filesize < 1024 THEN
        RETURN concat(round(filesize, 2), ' ', elt(n, 'Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB', 'BB'));
    END IF;
    SET filesize = filesize / 1024;
    SET n = n + 1;
END LOOP;

END$$
DELIMITER ;

/* Report Function - End*/