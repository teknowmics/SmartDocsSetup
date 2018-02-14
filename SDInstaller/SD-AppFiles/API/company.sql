CREATE DATABASE `DATABASE_NAME` CHARACTER SET utf8mb4;

USE `DATABASE_NAME`;

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

CREATE TABLE `country_master` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
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
UNIQUE KEY `IDX_COUNTRY_MASTER_CODE_ISO` (`code_iso`, `name`),
UNIQUE KEY `IDX_COUNTRY_MASTER_CODE_UN` (`code_un`, `name`)
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
(174,2,'Phillipines','PH','PHL','63',NULL,1,NOW(),NULL,NULL),
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


CREATE TABLE `region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
 );
 
 
CREATE TABLE `folder_type` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`image_url` VARCHAR(100) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_datetime` DATETIME NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB COMMENT = 'Master Table';

insert into folder_type (`id`,`name`,`created_by`,`created_datetime`) VALUES (1,'Normal',1,now()),(2,'Image',1,now()),(3,'Video',1,now()),(4,'Email',1,now());

CREATE TABLE `company_config` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`key` VARCHAR(100) NOT NULL,
`value` VARCHAR(300) NOT NULL,
`type` VARCHAR(10) DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
PRIMARY KEY (`id`),
KEY `IDX_COMPANY_CONFIG_KEY` (`key`),
CONSTRAINT `FK_COMPANY_CONFIG_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

INSERT INTO company_config (`id`,`key`,`value`,`type`,`status_id`) VALUES 
(1,'DEFAULT_PAGE_SIZE','30',1,1),
(2,'USER_DEFAULT_TIMEZONE','Asia/Calcutta',1,1),
(3,'MAX_PAGE_SIZE',100,1,1),
(4,'MAX_BULK_OPERATION_COUNT',1000,1,1),
(5,'DEFAULT_USER_ID',1,1,1),
(6,'DEFAULT_USER_GROUP_ID',1,1,1),
(7,'DEFAULT_SHARE_ID',1,1,1),
(8,'DEFAULT_LOCKER_ID',2,1,1),
(9,'DEFAULT_DISTRIBUTION_ID',3,1,1),
(10,'DEFAULT_FAVORITE_LIST_COUNT','10',1,1),
(11,'DEFAULT_SHARE_ROLE_ID',8,1,1),
(12,'HIDDEN_PERMISSION_NAME','---',1,1),
(13,'MAX_PERMISSION_NAME','FULL_CONTROL',1,1),
(14,'MAX_COMMENT_COUNT','20',1,1),
(15,'MAX_RETRY_COUNT','5',1,1),
(16,'CURRENT_USER_COUNT','0',1,1),
(18,'CURRENT_DEVICE_COUNT','0','1','1'),
(19,'MAX_SEARCH_RESULT_COUNT',500,1,1),
(20,'DEFAULT_DEPARTMENT_GROUP_MEMBER_ROLE',5,1,1),
(21,'MAX_STAMP_COUNT','10',1,1),
(22,'MAX_STAMP_SIZE','102400',1,1),
(23,'DEFAULT_WORKFLOW_CONTAINER_ID',4,1,1);

CREATE TABLE `storage` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`provider` ENUM('LOCAL','SOFTLAYER','AMAZON','CLOUDIAN','SCALITY','AZURE') NOT NULL COMMENT '1 LOCAL, 2 SOFTLAYER, 3 AMAZON, 4 CLOUDIAN, 5 SCALITY 6 AZURE',
`status_id` INT UNSIGNED NOT NULL,
`base_path` VARCHAR(200) NOT NULL,     
`credential_1` VARCHAR(200) DEFAULT NULL,
`credential_2` VARCHAR(200) DEFAULT NULL,
`credential_3` VARCHAR(200) DEFAULT NULL,
`credential_4` VARCHAR(200) DEFAULT NULL,
`credential_5` VARCHAR(200) DEFAULT NULL,
`credential_6` VARCHAR(200) DEFAULT NULL,
`credential_7` VARCHAR(200) DEFAULT NULL,
`credential_8` VARCHAR(200) DEFAULT NULL,
`unique_name` VARCHAR(200) NOT NULL,
`storage_size` BIGINT DEFAULT NULL,
`is_file_default` TINYINT DEFAULT 0,
`is_thumb_nail_default` TINYINT DEFAULT 0,
`storage_size_updated_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

INSERT INTO `storage`(`id`,`provider`,`status_id`,`base_path`,`credential_1`,`credential_2`,`credential_3`,`credential_4`,
`credential_5`,`credential_6`,`credential_7`,`credential_8`,`unique_name`,`storage_size`,`is_file_default`,
`is_thumb_nail_default`,`storage_size_updated_date`,`created_by`,`created_date`,`updated_by`,`updated_date`) 
VALUES (1,'LOCAL',1,'/data/sd_data/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LocalStorage',NULL,1,1,NULL,1,NOW(),NULL,NULL);

INSERT INTO `storage`(`id`,`provider`,`status_id`,`base_path`,`credential_1`,`credential_2`,`unique_name`,
`is_file_default`,`is_thumb_nail_default`,`created_by`,`created_date`)
VALUES (2,"SOFTLAYER",1,"Softlayer URL","Credential 1","Credential 2","primaySoftLayer",0,0,1,NOW());

INSERT INTO `storage`(`id`,`provider`,`status_id`,`base_path`,`credential_1`,`credential_2`,`credential_3`,
`credential_4`,`credential_5`,`credential_6`,`credential_7`,`credential_8`,`unique_name`,`storage_size`,
`is_file_default`,`is_thumb_nail_default`,`storage_size_updated_date`,`created_by`,`created_date`,`updated_by`,`updated_date`) 
VALUES (3,'LOCAL',1,'/var/localstorage/destfolder/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LocalStorageWS',NULL,0,0,NULL,1,NOW(),NULL,NULL);

INSERT INTO `storage`(`id`,`provider`,`status_id`,`base_path`,`credential_1`,`credential_2`,`unique_name`,`created_by`,
`created_date`) 
VALUES (4,"AMAZON",1,"Amazonaws URL","Credential 1","Credential 2","AmazonStorage",1,NOW());

INSERT INTO `storage`(`id`,`provider`,`status_id`,`base_path`,`credential_1`,`credential_2`,
`credential_3`,`credential_4`,`credential_5`,`credential_6`,`credential_7`,`credential_8`,
`unique_name`,`storage_size`,`is_file_default`,`is_thumb_nail_default`,`storage_size_updated_date`,
`created_by`,`created_date`,`updated_by`,`updated_date`) 
VALUES (5,'CLOUDIAN',1,'Cloudian URL','Credential 1','Credential 2',NULL,NULL,NULL,NULL,NULL,NULL,'CloudianStorage', NULL,0,0,NULL,1,NOW(),NULL,NULL);

INSERT INTO `storage`(`id`,`provider`,`status_id`,`base_path`,`credential_1`,`credential_2`,`unique_name`,`created_by`,
`created_date`)
VALUES (6,"SCALITY",1,"SCALITY URL","Credential 1","Credential 2","ScalityStorage",1,NOW());

INSERT INTO `storage`(`id`,`provider`,`status_id`,`base_path`,`credential_1`,`credential_2`,`unique_name`,`created_by`,
`created_date`)
VALUES (7,"AZURE",1,"AZURE URL","Credential 1","Credential 2","AzureStorage",1,NOW());

CREATE TABLE `storage_reference` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`storage_id` INT UNSIGNED NOT NULL,
`storage_path` VARCHAR(200) NOT NULL,
`file_size` INT NOT NULL,
`publish_status` INT DEFAULT NULL,
`thumbnail_storage_id` INT UNSIGNED DEFAULT NULL,
`thumbnail_storage_size` BIGINT UNSIGNED DEFAULT 0,
`file_page_count` INT DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_STORAGE_REFERENCE_STORAGE_ID_ID` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`)
) ENGINE=INNODB;

CREATE TABLE `device` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`status_id` INT UNSIGNED NOT NULL,
`device_id` VARCHAR(50) NOT NULL,
`device_name` VARCHAR(100) NOT NULL,
`description` VARCHAR(100) DEFAULT NULL,
`company_code` VARCHAR(100) NOT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') NOT NULL,
`last_login_date` DATETIME DEFAULT NULL,
`unread_log_file_count` INT DEFAULT NULL,
`total_log_file_count` INT DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_DEVICE_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;


CREATE TABLE `company` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`group_company_code` VARCHAR(100) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`auth_details_id` INT(10) UNSIGNED NOT NULL,
`country_id` INT UNSIGNED NOT NULL,
`language_id` INT UNSIGNED NOT NULL,
`group_company_name` VARCHAR (200) NOT NULL,
`company_type` ENUM ('Regular', 'Trial'),
`expiry_date` DATETIME DEFAULT NULL,
`legal_name` VARCHAR (200) NOT NULL,
`display_name` VARCHAR (200) DEFAULT NULL,
`display_name_key` VARCHAR(100) DEFAULT NULL,
`address1` VARCHAR (200) DEFAULT NULL,
`address2` VARCHAR (200) DEFAULT NULL,
`address3` VARCHAR (200) DEFAULT NULL,
`address4` VARCHAR (200) DEFAULT NULL,
`phone` VARCHAR (50) DEFAULT NULL,
`company_url` VARCHAR (200) DEFAULT NULL,
`upload_url1` VARCHAR (200) DEFAULT NULL,
`upload_url2` VARCHAR (200) DEFAULT NULL,
`upload_url3` VARCHAR (200) DEFAULT NULL,
`upload_url4` VARCHAR (200) DEFAULT NULL,
`upload_url5` VARCHAR (200) DEFAULT NULL,
`zip` VARCHAR (50) DEFAULT NULL,
`time_zone` VARCHAR (50) DEFAULT NULL,
`comments` VARCHAR(200) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_COMPANY_COMPANY_CODE` (`company_code`),
KEY `IDX_COMPANY_GROUP_COMPANY_CODE` (`group_company_code`),
CONSTRAINT `FK_COMPANY_STATUS` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_COMPANY_COUNTRY_ID` FOREIGN KEY (`country_id`) REFERENCES `country_master` (`id`),
CONSTRAINT `FK_COMPANY_LANGUAGE_ID` FOREIGN KEY (`language_id`) REFERENCES `language_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `user_category_master` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`status_id` INT UNSIGNED DEFAULT NULL,
`comments` VARCHAR(100) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_USER_CATEGORY_MASTER_COMPANY_CODE` (`company_code`),
CONSTRAINT `FK_USER_CATEGORY_MASTER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

insert into user_category_master(id,company_code,status_id,created_by,created_date) VALUES (1,COMPANY_CODE_REPLACE_HERE,1,1,now());

CREATE TABLE `user_category_language` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user_category_master_id` INT UNSIGNED NOT NULL,
`language_id` INT UNSIGNED NOT NULL,
`category_name` VARCHAR (200) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_USER_CATEGORY_LANGUAGE_MASTER_ID` FOREIGN KEY (`user_category_master_id`) REFERENCES `user_category_master` (`id`),
CONSTRAINT `FK_USER_CATEGORY_LANGUAGE_LANGUAGE_ID` FOREIGN KEY (`language_id`) REFERENCES `language_master` (`id`)
) ENGINE=INNODB;

INSERT INTO user_category_language
(id,user_category_master_id,language_id,category_name,created_by,created_date) VALUES 
(1,1,40,'Default_Category',1,NOW()),
(2,1,30,'Default_Category',1,NOW()),
(3,1,58,'Default_Category',1,NOW()),
(4,1,61,'Default_Category',1,NOW()),
(5,1,69,'Default_Category',1,NOW()),
(6,1,76,'Default_Category',1,NOW());

CREATE TABLE `user_designation_master` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`status_id` INT UNSIGNED DEFAULT NULL,
`comments` VARCHAR(200) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `IDX_USER_DESIGNATION_MASTER_COMPANY_CODE` (`company_code`),
  CONSTRAINT `FK_USER_DESIGNATION_MASTER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `user_designation_language` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user_designation_master_id` INT UNSIGNED NOT NULL,
`language_id` INT UNSIGNED NOT NULL,
`designation_name` VARCHAR (200) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_USER_DESIGNTION_LANGUAGE_MASTER_ID` FOREIGN KEY (`user_designation_master_id`) REFERENCES `user_designation_master` (`id`),
CONSTRAINT `FK_USER_DESIGNTION_LANGUAGE_LANGUAGE_ID` FOREIGN KEY (`language_id`) REFERENCES `language_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `department_master` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`name` VARCHAR(200) NOT NULL,
`name_key` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR(200) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_USER_DEPARTMENT_MASTER_COMPANY_CODE` (`company_code`),
CONSTRAINT `FK_DEPARTMENT_MASTER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `section_master` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`comments` VARCHAR(200) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_USER_SECTION_MASTER_COMPANY_CODE` (`company_code`),
CONSTRAINT `FK_SECTION_MASTER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `section_master_language` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`section_master_id` INT UNSIGNED NOT NULL,
`language_id` INT UNSIGNED NOT NULL,
`section_name` VARCHAR (200) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_SECTION_MASTER_LANGUAGE_SECT_MASTER_ID` FOREIGN KEY (`section_master_id`) REFERENCES `section_master` (`id`),
CONSTRAINT `FK_SECTION_MASTER_LANGUAGE_LANGUAGE_ID` FOREIGN KEY (`language_id`) REFERENCES `language_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `branch` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`branch_code` VARCHAR(50) DEFAULT NULL,
`name` VARCHAR(200),
`name_key` VARCHAR(100),
`address1` VARCHAR (200) DEFAULT NULL,
`address2` VARCHAR (200) DEFAULT NULL,
`address3` VARCHAR (200) DEFAULT NULL,
`address4` VARCHAR (200) DEFAULT NULL,
`telephone` VARCHAR (200) DEFAULT NULL,
`pin_zip` VARCHAR (50) DEFAULT NULL,
`description` VARCHAR(200) NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`), 
KEY `IDX_USER_BRANCH_COMPANY_CODE` (`company_code`),
KEY `IDX_USER_BRANCH_BRANCH_CODE` (`branch_code`),
CONSTRAINT `FK_BRANCH_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `user_group` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`container_id` INT DEFAULT NULL,
`department_master_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`external_group_id` VARCHAR (200) DEFAULT NULL,
`group_name` VARCHAR (200) NOT NULL,
`group_type` ENUM('DEPT','BRANCH','PUBLIC','PRIVATE','COMPANY','BRANCH_LEVEL','DEPARTMENT_LEVEL', 'DEPARTMENT_GUEST') NOT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_USER_GROUP_COMPANY_CODE` (`company_code`),
CONSTRAINT `FK_USER_GROUP_BRANCH_ID` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
CONSTRAINT `FK_USER_GROUP_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

INSERT INTO `user_group` (id,`company_code`, `branch_id`, `container_id`, `status_id`, `external_group_id`, `group_name`, `group_type`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1,COMPANY_CODE_REPLACE_HERE,NULL,NULL,1,NULL,'ALL-USERS','COMPANY',NULL,'1',NOW(),NULL,NULL);

CREATE TABLE `project` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`project_type_id` ENUM('1','2') DEFAULT '1' COMMENT '1 = Normal, 2 = Partner Project',
`status_id` INT UNSIGNED DEFAULT NULL,
`file_storage_id` INT UNSIGNED DEFAULT NULL,
`thumb_nail_storage_id` INT UNSIGNED DEFAULT NULL,
`quota` BIGINT NOT NULL,
`usage` BIGINT NOT NULL DEFAULT 0,
`alert_percent` INT UNSIGNED NOT NULL DEFAULT 80,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_master_id` INT UNSIGNED DEFAULT NULL,
`project_code` VARCHAR(100) DEFAULT NULL,
`actual_project_code` VARCHAR(100) DEFAULT NULL,
`name` VARCHAR (120) NOT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`container_status` ENUM('L','R') COMMENT 'L= Live R = Recycle',
`logo` VARCHAR (200) DEFAULT NULL,
`owner_id` INT DEFAULT NULL,
`company_code` VARCHAR(100) DEFAULT NULL,
`is_frozen` TINYINT DEFAULT NULL,
`start_date` DATETIME DEFAULT NULL,
`end_date` DATETIME DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`region_id` INT UNSIGNED DEFAULT NULL,
`is_department_level` TINYINT DEFAULT 0,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_PROJECT_NAME_COMPANY_CODE` (`name`,`company_code`),
UNIQUE INDEX `IDX_PROJECT_CODE` (`project_code`),
KEY `IDX_PROJECT_OWNER_ID` (`owner_id`),
KEY `IDX_PROJECT_CREATED_DATE` (`created_date`),
CONSTRAINT `FK_PROJECT_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE = INNODB  ;

CREATE TABLE `department` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_master_id` INT UNSIGNED NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`file_storage_id` INT UNSIGNED DEFAULT NULL,
`thumb_nail_storage_id` INT UNSIGNED DEFAULT NULL,
`quota` BIGINT NOT NULL,
`usage` BIGINT NOT NULL DEFAULT 0,
`alert_percent` INT UNSIGNED NOT NULL DEFAULT 80,
`name` VARCHAR (120) NOT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`logo` VARCHAR (200) DEFAULT NULL,
`owner_id` INT DEFAULT NULL,
`company_code` VARCHAR(100) NOT NULL,
`is_frozen` TINYINT DEFAULT NULL,
`portal_enabled` TINYINT DEFAULT 0,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
 UNIQUE INDEX `IDX_DEPARTMENT_NAME_COMPANY_CODE` (`name`, `company_code`,`branch_id`),
KEY `IDX_DEPARTMENT_OWNER_ID` (`owner_id`),
KEY `IDX_DEPARTMENT_CREATED_DATE` (`created_date`),
CONSTRAINT `FK_DEPARTMENT_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_DEPARTMENT_BRANCH_ID` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
CONSTRAINT `FK_DEPARTMENT_DEPARTMENT_MASTER_ID` FOREIGN KEY (`department_master_id`) REFERENCES `department_master` (`id`)
) ENGINE=INNODB;


CREATE TABLE `share` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_master_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`file_storage_id` INT UNSIGNED DEFAULT NULL,
`thumb_nail_storage_id` INT UNSIGNED DEFAULT NULL,
`quota` BIGINT NOT NULL,
`usage` BIGINT NOT NULL DEFAULT 0,
`alert_percent` INT UNSIGNED NOT NULL DEFAULT 80,
`name` VARCHAR (120) NOT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`company_code` VARCHAR(100) NOT NULL,
`owner_id` INT DEFAULT NULL,
`is_frozen` TINYINT DEFAULT NULL,
`logo` VARCHAR (200) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
 UNIQUE INDEX `IDX_SHARE_NAME_COMPANY_CODE` (`company_code`,`name`),
KEY `IDX_SHARE_OWNER_ID` (`owner_id`),
KEY `IDX_SHARE_CREATED_DATE` (`created_date`),
CONSTRAINT `FK_SHARE_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

insert into `share`(id,status_id,`quota`,name,actual_name,company_code,owner_id,created_by,created_date,is_frozen) VALUES
(1,1,2147483648,'global','global',COMPANY_CODE_REPLACE_HERE,1,1,now(),0),
(2,1,2147483648,'ELocker','ELocker',COMPANY_CODE_REPLACE_HERE,1,1,now(),0),
(3,1,2147483648,'Distribution','Distribution',COMPANY_CODE_REPLACE_HERE,1,1,now(),0),
(4,1,1099511627776,'Workflow','Workflow',COMPANY_CODE_REPLACE_HERE,1,1,now(),0);

CREATE TABLE `users` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`reports_to` INT(10) UNSIGNED DEFAULT NULL,
`user_type` ENUM('USER','PARTNER_USER','SYSTEM_USER') DEFAULT 'USER',
`personal_quota` BIGINT NOT NULL,
`usage` BIGINT NOT NULL DEFAULT 0,
`last_backup_id` INT(10) DEFAULT NULL,
`last_backup_status` ENUM('S','F') DEFAULT NULL COMMENT 'S= Success, F= Failure',
`last_backup_time` DATETIME DEFAULT NULL,
`group_company_code` VARCHAR(100) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`auth_details_id` INT(10) UNSIGNED NOT NULL,
`ldap_dn` VARCHAR(500) DEFAULT NULL,
`user_category_master_id` INT UNSIGNED DEFAULT NULL,
`role_id` INT UNSIGNED DEFAULT NULL,
`user_designation_master_id` INT UNSIGNED DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_master_id` INT UNSIGNED DEFAULT NULL,
`section_master_id` INT UNSIGNED DEFAULT NULL,
`language_id` INT UNSIGNED NOT NULL,
`is_guest_user`  TINYINT(4) NOT NULL DEFAULT '0',
`department_id` INT UNSIGNED DEFAULT NULL,
`region_id` INT UNSIGNED DEFAULT NULL,
`sys_privilege` INT UNSIGNED DEFAULT NULL,
`login_name` VARCHAR (100) NOT NULL,
`login_pwd` VARCHAR (200) NOT NULL,
`reset_login_pwd` TINYINT DEFAULT 0  NOT NULL COMMENT '0-Default, 1-Reset Request, 2- Pwd Reset',
`reset_pwd_date` DATETIME DEFAULT NULL,
`user_lock_date` DATETIME DEFAULT NULL,
`pwd_expiry` TINYINT DEFAULT NULL,
`transaction_pwd1` VARCHAR (200) DEFAULT NULL,
`transaction_pwd2` VARCHAR (200) DEFAULT NULL,
`matrix_pwd` VARCHAR (200) DEFAULT NULL,
`login_attempts` TINYINT DEFAULT 0,
`txn_pwd1_login_attempts` TINYINT DEFAULT 0,
`first_name` VARCHAR (200) NOT NULL,
`last_name` VARCHAR (200) DEFAULT NULL,
`email_id1` VARCHAR (100) DEFAULT NULL,
`email_id2` VARCHAR (100) DEFAULT NULL,
`cell_phone1` VARCHAR (50) DEFAULT NULL,
`cell_phone2` VARCHAR (50) DEFAULT NULL,
`timezone` VARCHAR (50) NOT NULL,
`image1_path` VARCHAR (200) DEFAULT NULL,
`image2_path` VARCHAR (200) DEFAULT NULL,
`external_user_id` VARCHAR (200) DEFAULT NULL,
`is_company_admin` TINYINT DEFAULT '0',
`is_branch_admin` TINYINT DEFAULT '0',
`alert_value` BIGINT DEFAULT '0',
`mail_value` BIGINT DEFAULT '0',
`enable_alert` TINYINT DEFAULT '0',
`max_device_count` INT(10) DEFAULT '0',
`current_device_count` INT(10) DEFAULT '0',
`comments` VARCHAR (200) DEFAULT NULL,
`partner_id`  INT(10) UNSIGNED DEFAULT NULL,
`is_partner_admin` TINYINT(4) UNSIGNED DEFAULT 0,
`previous_login_date` DATETIME DEFAULT NULL,
`login_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_USERS_LOGIN_NAME` (`login_name`),
UNIQUE KEY `IDX_UNIQUE_USERS` (`company_code`,`email_id1`),
CONSTRAINT `FK_USER_IS_ACTIVE` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_USER_CATEGORY_MASTER_ID` FOREIGN KEY (`user_category_master_id`) REFERENCES `user_category_master` (`id`),
CONSTRAINT `FK_USER_BRANCH_ID` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
CONSTRAINT `FK_USER_DEPARTMENT_MASTER_ID` FOREIGN KEY (`department_master_id`) REFERENCES `department_master` (`id`),
CONSTRAINT `FK_USER_LANG_ID` FOREIGN KEY (`language_id`) REFERENCES `language_master` (`id`),
CONSTRAINT `FK_USER_DEPARTMENT_ID` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
CONSTRAINT `FK_USER_REGION_ID` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=INNODB;

INSERT INTO `users` (id,`user_type`,`company_code`, `status_id`, `user_category_master_id`, `role_id`, `user_designation_master_id`, `branch_id`, `department_master_id`, `section_master_id`, `language_id`, `department_id`, `sys_privilege`, `login_name`, `login_pwd`, `pwd_expiry`, `transaction_pwd1`, `transaction_pwd2`, `matrix_pwd`, `login_attempts`, `first_name`, `email_id1`, `email_id2`, `cell_phone1`, `cell_phone2`, `timezone`, `image1_path`, `image2_path`, `external_user_id`, `comments`, `created_by`, `created_date`, `updated_by`, `updated_date`,`group_company_code`,`personal_quota`,`auth_details_id`) VALUES
(1,'SYSTEM_USER',COMPANY_CODE_REPLACE_HERE,1,1,10,NULL,NULL,NULL,NULL,40,NULL,'0','system','808d63ba47fcef6a7c52ec47cb63eb1b747a9d527a77385fc05c8a5ce8007586265d003b4130f6b0c8f3bb2ad89965a5da07289ba5d1e35321e160bea4f766f8',NULL,NULL,NULL,NULL,NULL,'System','noreply@smartdocsonline.com',NULL,'12345678',NULL,'Asia/Tokyo',NULL,NULL,NULL,NULL,'1',NOW(),NULL,NULL,25252,0,1);


CREATE TABLE `device_user_map` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`status_id` INT UNSIGNED NOT NULL,
`device_id` INT UNSIGNED NOT NULL,
`user_id` INT UNSIGNED NOT NULL,
`last_login_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_DEVICE_USER_MAP_USER_ID_DEVICE_ID` (`user_id`, `device_id`),
CONSTRAINT `FK_DEVICE_USER_MAP_DEVICE_ID` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`),
CONSTRAINT `FK_DEVICE_USER_MAP_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
 ) ENGINE=INNODB;

CREATE TABLE `password_policy` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `password_policy` TEXT NOT NULL,
  `status_id` INT(11) DEFAULT '1',
  `created_by` INT(11) UNSIGNED NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_by` INT(11) DEFAULT NULL,
  `updated_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `user_password_history` (
  `id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) unsigned NOT NULL,
  `login_pwd` varchar(200) NOT NULL,
  `created_by` INT(10) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `password_policy`(`id`,`password_policy`,`status_id`,`created_by`,`created_date`,`updated_by`,`updated_date`) values (1,'{\"generalRule\":{\"oldPasswordRestrictionlevel\":\"0\",\"passwordExpiryDays\":\"0\",\"allowedRetryCount\":\"5\",\"failedRule\":{\"lockForever\":\"true\",\"lockTime\":\"0\"}},\"complexRule\":{\"minPasswordLength":"6","maxPasswordLength":"200","passwordContainsRule":{"atleastOneUpperChar":false,"atleastOneLowerChar":false,"atleastOneNumber":false,"atleastOneSpecialChar":false}}}',1,1,NOW(),NULL,NULL);

CREATE TABLE `user_group_map`(
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user_group_id` INT UNSIGNED NOT NULL,
`user_id` INT UNSIGNED NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_USER_GROUP_MAP_USER_GROUP_ID` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`),
CONSTRAINT `FK_USER_GROUP_MAP_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
KEY `IDX_USER_GROUP_MAP_COMBINED` (`user_id`, `user_group_id`)
) ENGINE=INNODB;

CREATE TABLE `backup` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_master_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`file_storage_id` INT UNSIGNED DEFAULT NULL,
`thumb_nail_storage_id` INT UNSIGNED DEFAULT NULL,
`quota` BIGINT NOT NULL,
`usage` BIGINT NOT NULL DEFAULT 0,
`alert_percent` INT UNSIGNED NOT NULL DEFAULT 80,
`backup_device_id` INT UNSIGNED NOT NULL,
`name` VARCHAR (120) NOT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`logo` VARCHAR (200) DEFAULT NULL,
`owner_id` INT DEFAULT NULL,
`company_code` VARCHAR(100) NOT NULL,
`backup_mode` VARCHAR (200) DEFAULT NULL,
`client_path` VARCHAR (800) NOT NULL,
`backup_status` ENUM('BNS','BIP','S','F') COMMENT 'BNS=Backp_Not_Started, BIP=Backup_In_Progress, S= Success, F= Failure',
`delete_status` ENUM('L','R') COMMENT 'L= Live R = Recycle',
`storage_size` BIGINT DEFAULT NULL,
`backup_file_count` INT DEFAULT NULL,
`last_bkp_date` DATETIME NULL DEFAULT NULL,
`last_successful_bkp_date` DATETIME NULL DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
`error_code` VARCHAR(10) DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_BACKUP_COMPANY_CODE` (`company_code`),
KEY `IDX_BACKUP_DELETE_STATUS` (`delete_status`),
KEY `IDX_BACKUP_OWNER_ID` (`owner_id`),
KEY `IDX_BACKUP_CREATED_DATE` (`created_date`),
CONSTRAINT `FK_BACKUP_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_BACKUP_BACKUP_DEVICE_ID` FOREIGN KEY (`backup_device_id`) REFERENCES `device` (`id`)
) ENGINE=INNODB;


CREATE TABLE `project_txn` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'project_id',
`user_id` INT UNSIGNED NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`resource_type` ENUM('FILE','FOLDER') NOT NULL,
`txn_type` INT UNSIGNED NOT NULL COMMENT '1 = RESOURCE_DELETE,2 = RESOURCE_MOVED_TO_RecycleBin, 3 = RESOURCE_RESTORE',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_PROJECT_TXN_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`),
CONSTRAINT `FK_PROJECT_TXN_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=INNODB COMMENT = 'TXN Table';

CREATE TABLE `myfiles` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`status_id` INT UNSIGNED NOT NULL,
`file_storage_id` INT UNSIGNED DEFAULT NULL,
`thumb_nail_storage_id` INT UNSIGNED DEFAULT NULL,
`quota` BIGINT NOT NULL,
`usage` BIGINT NOT NULL DEFAULT 0,
`alert_percent` INT UNSIGNED NOT NULL DEFAULT 80,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_master_id` INT UNSIGNED DEFAULT NULL,
`name` VARCHAR (120) NOT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`logo` VARCHAR (200) DEFAULT NULL,
`owner_id` INT DEFAULT NULL,
`company_code` VARCHAR(100) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_MYFILES_OWNER_ID` (`owner_id`),
KEY `IDX_MYFILES_CREATED_DATE` (`created_date`),
UNIQUE INDEX `IDX_MYFILES_NAME_COMPANY_CODE` (`name`, `company_code`),
CONSTRAINT `FK_MYFILES_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;


CREATE TABLE `project_folder` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'project_id',
`status_id` INT UNSIGNED NOT NULL,
`container_txn_id` INT UNSIGNED DEFAULT NULL COMMENT 'project_txn_id',
`folder_category` ENUM('1','2','3','4','5','6','7') NOT NULL COMMENT '1 = Normal_Folder, 2 = Notification_Folder, 3 = Dept, 4 = Locker Public, 5 = Locker Private, 6=StudyFolder, 7=SeriesFolder',
`parent_id` INT UNSIGNED DEFAULT NULL,
`name` VARCHAR (120) DEFAULT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`folder_path` VARCHAR (800) DEFAULT NULL,
`tag_id` INT DEFAULT NULL,
`description` VARCHAR (120) DEFAULT NULL,
`folder_status` ENUM('L','R') NOT NULL,
`file_name_template` VARCHAR (255) DEFAULT NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`created_by` INT DEFAULT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
`folder_type_id` INT NOT NULL,
`checkout_by` INT DEFAULT NULL,
`checkout_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_PROJECT_FOLDER_NAME_PARENT_ID` (`name`, `parent_id`),
KEY `IDX_PROJECT_FOLDER_COMBINED` (`container_id`,`parent_id`,`status_id`,`folder_status`,`name`),
CONSTRAINT `FK_PROJECT_FOLDER_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`),
CONSTRAINT `FK_PROJECT_FOLDER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_PROJECT_FOLDER_CONTAINER_TXN_ID` FOREIGN KEY (`container_txn_id`) REFERENCES `project_txn` (`id`),
CONSTRAINT `FK_PROJECT_FOLDER_PARENT_FOLDER_ID` FOREIGN KEY (`parent_id`) REFERENCES `project_folder` (`id`)
)ENGINE = INNODB  ;

CREATE TABLE `department_txn` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'department_id',
`user_id` INT UNSIGNED NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`resource_type` ENUM('FILE','FOLDER') NOT NULL,
`txn_type` INT UNSIGNED NOT NULL COMMENT '1 = RESOURCE_DELETE,2 = RESOURCE_MOVED_TO_RecycleBin, 3 = RESOURCE_RESTORE',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_DEPARTMENT_TXN_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`),
CONSTRAINT `FK_DEPARTMENT_TXN_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=INNODB COMMENT = 'TXN Table';

CREATE TABLE `department_folder` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'department_id',
`parent_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`container_txn_id` INT UNSIGNED DEFAULT NULL COMMENT 'department_txn_id',
`section_master_id` INT UNSIGNED DEFAULT NULL,
`folder_category` ENUM('1','2','3','4','5','6','7') NOT NULL COMMENT '1 = Normal_Folder, 2 = Notification_Folder, 3 = Dept, 4 = Locker Public, 5 = Locker Private, 6=StudyFolder, 7=SeriesFolder',
`name` VARCHAR (120) DEFAULT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`folder_path` VARCHAR (800) DEFAULT NULL,
`tag_id` INT DEFAULT NULL,
`description` VARCHAR (120) DEFAULT NULL,
`folder_status` ENUM('L','R') NOT NULL,
`file_name_template` VARCHAR (255) DEFAULT NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`created_by` INT DEFAULT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
`folder_type_id` INT NOT NULL,
`checkout_by` INT DEFAULT NULL,
`checkout_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_DEPARTMENT_FOLDER_NAME_PARENT_ID` (`name`, `parent_id`),
KEY `IDX_DEPARTMENT_FOLDER_COMBINED` (`container_id`,`parent_id`,`status_id`,`folder_status`),
KEY `IDX_DEPARTMENT_FOLDER_SEARCH_COMBINED` (`container_id`,`status_id`,`folder_status`,`name`),
KEY `IDX_DEPARTMENT_FOLDER_COUNT_COMBINED` (`container_id`,`folder_path`(191),`status_id`,`folder_status`),
KEY `IDX_DEPARTMENT_FOLDER_FOLDER_STATUS` (`folder_status`),
CONSTRAINT `FK_DEPARTMENT_FOLDER_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`),
CONSTRAINT `FK_DEPARTMENT_FOLDER_PARENT_FOLDER_ID` FOREIGN KEY (`parent_id`) REFERENCES `department_folder` (`id`),
CONSTRAINT `FK_DEPARTMENT_FOLDER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_DEPARTMENT_FOLDER_CONTAINER_TXN_ID` FOREIGN KEY (`container_txn_id`) REFERENCES `department_txn` (`id`)
) ENGINE=INNODB;

CREATE TABLE `share_txn` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'share_id',
`user_id` INT UNSIGNED NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`resource_type` ENUM('FILE','FOLDER') NOT NULL,
`txn_type` INT UNSIGNED NOT NULL COMMENT '1 = RESOURCE_DELETE,2 = RESOURCE_MOVED_TO_RecycleBin, 3 = RESOURCE_RESTORE',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_SHARE_TXN_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`),
CONSTRAINT `FK_SHARE_TXN_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=INNODB COMMENT = 'TXN Table';

CREATE TABLE `share_folder` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'share_id',
`parent_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`container_txn_id` INT UNSIGNED DEFAULT NULL COMMENT 'share_txn_id',
`folder_type_id` INT UNSIGNED NOT NULL,
`folder_category` ENUM('1','2','3','4','5','6','7') NOT NULL COMMENT '1 = Normal_Folder, 2 = Notification_Folder, 3 = Dept, 4 = Locker Public, 5 = Locker Private, 6=StudyFolder, 7=SeriesFolder',
`locker_id` INT UNSIGNED DEFAULT NULL,
`name` VARCHAR (120) DEFAULT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`folder_path` VARCHAR (800) DEFAULT NULL,
`tag_id` INT DEFAULT NULL,
`folder_status` ENUM('L','R') NOT NULL,
`file_name_template` VARCHAR (255) DEFAULT NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`description` VARCHAR (120) DEFAULT NULL,
`start_date` DATETIME DEFAULT NULL,
`end_date` DATETIME DEFAULT NULL,
`created_by` INT DEFAULT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_SHARE_FOLDER_NAME_PARENT_ID` (`name`, `parent_id`),
KEY `IDX_SHARE_FOLDER_COMBINED` (`container_id`,`parent_id`,`status_id`,`folder_status`),
KEY `IDX_SHARE_FOLDER_COUNT_COMBINED` (`container_id`,`parent_id`,`status_id`,`folder_status`,`folder_category`,`created_by`,`start_date`,`end_date`,`folder_path`(191)),
CONSTRAINT `FK_SHARE_FOLDER_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`),
CONSTRAINT `FK_SHARE_FOLDER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_SHARE_FOLDER_CONTAINER_TXN_ID` FOREIGN KEY (`container_txn_id`) REFERENCES `share_txn` (`id`),
CONSTRAINT `FK_SHARE_FOLDER_PARENT_FOLDER_ID` FOREIGN KEY (`parent_id`) REFERENCES `share_folder` (`id`),
CONSTRAINT `FK_SHARE_FOLDER_FOLDER_TYPE_ID` FOREIGN KEY (`folder_type_id`) REFERENCES `folder_type` (`id`)
) ENGINE=INNODB;

INSERT INTO `share_folder`(`id`,`container_id`,`status_id`,`folder_type_id`,`folder_category`,`name`,`actual_name`,`folder_path`,`folder_status`,`created_by`,`created_date`)
VALUES
(1,1,1,1,1,'Default Share', 'Default Share', '/','L', 1, NOW()),
(2,2,1,1,1,'ELocker', 'ELocker', '/','L', 1, NOW()),
(3,3,1,1,1,'Distribution', 'Distribution', '/','L', 1, NOW()),
(4,4,1,1,1,'Workflow', 'Workflow', '/','L', 1, NOW())
;

CREATE TABLE `backup_txn` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'backup_id',
`backup_device_id` INT NOT NULL,
`created_file_count` INT DEFAULT NULL, 
`updated_file_count` INT DEFAULT NULL, 
`deleted_file_count` INT DEFAULT NULL, 
`failed_file_count` INT DEFAULT NULL, 
`success_file_count` INT(11) UNSIGNED DEFAULT NULL, 
`agent_version` VARCHAR(50) DEFAULT NULL,
`txn_hash` VARCHAR(50) DEFAULT NULL,
`txn_status` ENUM('BNS','BIP','S','F') COMMENT 'BNS=Backp_Not_Started, BIP=Backup_In_Progress, S= Success, F= Failure',
`bytes_uploaded` VARCHAR(100) DEFAULT 0,
`activity_count` INT DEFAULT 0,
`start_time` DATETIME NOT NULL,
`end_time` DATETIME NULL DEFAULT NULL,
`log_file_id` INT(10) UNSIGNED DEFAULT NULL,
`created_by` INT(10) NOT NULL,
`error_code` VARCHAR(10) DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_BACKUP_TXN_TXN_STATUS` (`txn_status`),
CONSTRAINT `FK_BACKUP_TXN_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `backup` (`id`)
) ENGINE=INNODB;


CREATE TABLE `backup_folder` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'backup_id',
`parent_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`container_txn_id` INT UNSIGNED DEFAULT NULL COMMENT 'backup_txn_id',
`folder_type_id` INT NOT NULL,
`folder_category` ENUM('1','2','3','4','5','6','7') NOT NULL COMMENT '1 = Normal_Folder, 2 = Notification_Folder, 3 = Dept, 4 = Locker Public, 5 = Locker Private, 6=StudyFolder, 7=SeriesFolder',
`name` VARCHAR(120) DEFAULT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`folder_path` VARCHAR(800) DEFAULT NULL,
`folder_hash` VARCHAR(200) DEFAULT NULL,
`tag_id` INT DEFAULT NULL,
`folder_status` ENUM('L','R') NOT NULL,
`file_name_template` VARCHAR (255) DEFAULT NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`description` VARCHAR (120) DEFAULT NULL,
`folder_backup_status` ENUM ('0','1','2') NOT NULL COMMENT '0 = Sucess,1 = Failure, 2 = BAckup_In_Progress',
`created_by` INT DEFAULT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_BACKUP_FOLDER_NAME_PARENT_ID` (`name`, `parent_id`),
KEY `IDX_BACKUP_FOLDER_COMBINED` (`container_id`,`parent_id`,`status_id`,`folder_status`,`name`),
CONSTRAINT `FK_BACKUP_FOLDER_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `backup` (`id`),
CONSTRAINT `FK_BACKUP_FOLDER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_BACKUP_FOLDER_CONTAINER_TXN_ID` FOREIGN KEY (`container_txn_id`) REFERENCES `backup_txn` (`id`),
CONSTRAINT `FK_BACKUP_FOLDER_PARENT_FOLDER_ID` FOREIGN KEY (`parent_id`) REFERENCES `backup_folder` (`id`)
) ENGINE=INNODB;


CREATE TABLE `myfiles_txn` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'myfiles_id',
`user_id` INT UNSIGNED NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`resource_type` ENUM('FILE','FOLDER') NOT NULL,
`txn_type` INT UNSIGNED NOT NULL COMMENT '1 = RESOURCE_DELETE,2 = RESOURCE_MOVED_TO_RecycleBin, 3 = RESOURCE_RESTORE',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_MYFILES_TXN_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `myfiles` (`id`),
CONSTRAINT `FK_MYFILES_TXN_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=INNODB COMMENT = 'TXN Table';

CREATE TABLE `myfiles_folder` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'myfiles_id',
`parent_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`container_txn_id` INT UNSIGNED DEFAULT NULL COMMENT 'myfiles_txn_id',
`folder_category` ENUM('1','2','3','4','5','6','7') NOT NULL COMMENT '1 = Normal_Folder, 2 = Notification_Folder, 3 = Dept, 4 = Locker Public, 5 = Locker Private, 6=StudyFolder, 7=SeriesFolder',
`folder_type_id` INT NOT NULL,
`name` VARCHAR (120) DEFAULT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`folder_path` VARCHAR (800) DEFAULT NULL,
`tag_id` INT DEFAULT NULL,
`folder_status` ENUM('L','R') NOT NULL,
`file_name_template` VARCHAR (255) DEFAULT NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`description` VARCHAR (120) DEFAULT NULL,
`created_by` INT DEFAULT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_MYFILES_FOLDER_NAME_PARENT_ID` (`name`, `parent_id`),
KEY `IDX_MYFILES_FOLDER_COMBINED` (`container_id`,`parent_id`,`status_id`,`folder_status`,`name`),
CONSTRAINT `FK_MYFILES_FOLDER_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `myfiles` (`id`),
CONSTRAINT `FK_MYFILES_FOLDER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_MYFILES_FOLDER_CONTAINER_TXN_ID` FOREIGN KEY (`container_txn_id`) REFERENCES `myfiles_txn` (`id`),
CONSTRAINT `FK_MYFILES_FOLDER_PARENT_FOLDER_ID` FOREIGN KEY (`parent_id`) REFERENCES `myfiles_folder` (`id`)
) ENGINE=INNODB;



CREATE TABLE `business_file_category` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`name` VARCHAR(100) NOT NULL,
`name_key` VARCHAR (100) DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`comments` VARCHAR(100) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_BUSINESS_FILE_CATEGORY_NAME_CODE` (`company_code`, `name`),
CONSTRAINT `FK_BUSINESS_FILE_CATEGORY_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `tag` (	
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`tag_name` VARCHAR (200) DEFAULT NULL,
`tag_type` ENUM( '1','2') COMMENT '1 Predefined, 2 Custom',
`container_id` INT DEFAULT NULL,
`container_type` ENUM( '1','2','3','4','5') DEFAULT NULL COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`rank` INT UNSIGNED NOT NULL DEFAULT 0,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `universal_file_info` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`file_name` VARCHAR (191) NOT NULL,
`container_id` INT NOT NULL,
`container_type` ENUM( '1','2','3','4','5') NOT NULL COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`container_name` VARCHAR (120) DEFAULT NULL,
`parent_folder_id` INT UNSIGNED NOT NULL,
`parent_folder_name` VARCHAR (120) DEFAULT NULL,
`file_source` VARCHAR(255) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `project_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`container_id` INT UNSIGNED NOT NULL COMMENT 'project_id',
`status_id` INT UNSIGNED NOT NULL,
`workflow_status` tinyint(4) DEFAULT '0' COMMENT 'workflow usage status',
`workflow_file_status` ENUM('APPROVED','REJECTED','REVIEWED') DEFAULT NULL,
`container_txn_id` INT UNSIGNED DEFAULT NULL COMMENT 'project_txn_id',
`checkout_by` INT DEFAULT NULL,
`parent_folder_id` INT UNSIGNED DEFAULT NULL,
`parent_file_id` INT UNSIGNED DEFAULT NULL,
`child_file_count` INT UNSIGNED DEFAULT NULL,
`storage_reference_id` INT UNSIGNED NOT NULL,
`language_id` INT UNSIGNED DEFAULT NULL,
`business_file_category_id` INT UNSIGNED DEFAULT NULL,
`file_type_id` INT NOT NULL,
`file_name` VARCHAR (191) NOT NULL,
`actual_name` VARCHAR (191) NOT NULL,
`tag` TEXT DEFAULT NULL,
`file_size` INT DEFAULT NULL,
`file_version_size` BIGINT DEFAULT NULL,
`document_name` VARCHAR (191) DEFAULT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`author` VARCHAR (120) DEFAULT NULL,
`advanced_properties` VARCHAR(1024) DEFAULT NULL COMMENT 'key:value|key:value format',
`content_hash` VARCHAR (200) DEFAULT NULL,
`file_hash` VARCHAR (200) DEFAULT NULL,
`tag_id` INT DEFAULT NULL,
`encrypted` INT DEFAULT NULL,
`index_status` INT DEFAULT NULL,
`metadata_index_status` INT DEFAULT NULL,
`external_id` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`os_access_date` DATETIME DEFAULT NULL,
`os_created_date` DATETIME DEFAULT NULL,
`os_modified_date` DATETIME DEFAULT NULL,
`view_count` INT DEFAULT NULL,
`version_view_count` INT DEFAULT 0,
`revision_number` INT DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`version_download_count` INT DEFAULT 0,
`file_path` VARCHAR (800) NOT NULL,
`is_public` TINYINT(4) DEFAULT 1 NULL COMMENT 'is_public = 1 means, the file is publicly accessible from generated "Public access link',
`file_status` ENUM('L','R') NOT NULL,
`device_id` INT DEFAULT NULL,
`file_source` VARCHAR(255) DEFAULT NULL,
`attached_wkf_process_instance_id` INT(10) NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`issue_date` DATETIME DEFAULT NULL,
`expiry_date` DATETIME DEFAULT NULL,
`uploaded_by` INT NOT NULL,
`uploaded_date` DATETIME NOT NULL,
`checkout_date` DATETIME DEFAULT NULL,
`locked_status` TINYINT DEFAULT 0,
`locked_by` INT DEFAULT NULL,
`locked_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_PROJECT_FILE_NAME_PARENT_FOLDER_ID` (`file_name`, `parent_folder_id`),
KEY `IDX_PROJECT_FILE_COMBINED` (`container_id`,`parent_folder_id`,`status_id`,`file_status`,`file_name`),
CONSTRAINT `FK_PROJECT_FILE_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`),
CONSTRAINT `FK_PROJECT_FILE_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_PROJECT_FILE_PROJECT_TXN_ID` FOREIGN KEY (`container_txn_id`) REFERENCES `project_txn` (`id`),
CONSTRAINT `FK_PROJECT_FILE_PARENT_FOLDER_ID` FOREIGN KEY (`parent_folder_id`) REFERENCES `project_folder` (`id`),
CONSTRAINT `FK_PROJECT_FILE_STORAGE_REFERENCE_ID` FOREIGN KEY (`storage_reference_id`) REFERENCES `storage_reference` (`id`),
CONSTRAINT `FK_PROJECT_FILE_BUSINESS_FILE_CATEGORY_ID` FOREIGN KEY (`business_file_category_id`) REFERENCES `business_file_category` (`id`)
) ENGINE=INNODB;

CREATE TABLE `department_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`container_id` INT UNSIGNED NOT NULL COMMENT 'department_id',
`status_id` INT UNSIGNED NOT NULL,
`workflow_status` tinyint(4) DEFAULT '0' COMMENT 'workflow usage status',
`workflow_file_status` ENUM('APPROVED','REJECTED','REVIEWED') DEFAULT NULL,
`container_txn_id` INT UNSIGNED DEFAULT NULL COMMENT 'department_txn_id',
`checkout_by` INT DEFAULT NULL,
`parent_folder_id` INT UNSIGNED DEFAULT NULL,
`parent_file_id` INT UNSIGNED DEFAULT NULL,
`child_file_count` INT UNSIGNED DEFAULT NULL,
`storage_reference_id` INT UNSIGNED DEFAULT NULL,
`language_id` INT UNSIGNED DEFAULT NULL,
`business_file_category_id` INT UNSIGNED DEFAULT NULL,
`file_type_id` INT NOT NULL,
`file_name` VARCHAR (191) NOT NULL,
`actual_name` VARCHAR (191) NOT NULL,
`tag` TEXT DEFAULT NULL,
`file_size` INT DEFAULT NULL,
`file_version_size` BIGINT DEFAULT NULL,
`document_name` VARCHAR (191) DEFAULT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`author` VARCHAR (120) DEFAULT NULL,
`advanced_properties` VARCHAR(1024) DEFAULT NULL COMMENT 'key:value|key:value format',
`content_hash` VARCHAR (200) DEFAULT NULL,
`file_hash` VARCHAR (200) DEFAULT NULL,
`tag_id` INT DEFAULT NULL,
`encrypted` INT DEFAULT NULL,
`index_status` INT DEFAULT NULL,
`metadata_index_status` INT DEFAULT NULL,
`external_id` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`os_access_date` DATETIME DEFAULT NULL,
`os_created_date` DATETIME DEFAULT NULL,
`os_modified_date` DATETIME DEFAULT NULL,
`view_count` INT DEFAULT NULL,
`version_view_count` INT DEFAULT 0,
`revision_number` INT DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`version_download_count` INT DEFAULT 0,
`file_path` VARCHAR (800) NOT NULL,
`is_public` TINYINT(4) DEFAULT 1 NULL COMMENT 'is_public = 1 means, the file is publicly accessible from generated "Public access link',
`file_status` ENUM('L','R') NOT NULL,
`device_id` INT DEFAULT NULL,
`file_source` VARCHAR(255) DEFAULT NULL,
`attached_wkf_process_instance_id` INT(10) NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`issue_date` DATETIME DEFAULT NULL,
`expiry_date` DATETIME DEFAULT NULL,
`uploaded_by` INT NOT NULL,
`uploaded_date` DATETIME NOT NULL,
`checkout_date` DATETIME DEFAULT NULL,
`locked_status` TINYINT DEFAULT 0,
`locked_by` INT DEFAULT NULL,
`locked_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_DEPARTMENT_FILE_NAME_PARENT_FOLDER_ID` (`file_name`, `parent_folder_id`),
KEY `IDX_DEPARTMENT_FILE_COMBINED` (`container_id`,`parent_folder_id`,`status_id`,`file_status`,`file_name`),
KEY `IDX_DEPARTMENT_FILE_COUNT_COMBINED` (`container_id`, `file_path`(191), `status_id`, `file_status`),
KEY `IDX_DEPARTMENT_FILE_SEARCH_COMBINED` (`container_id`,`status_id`,`file_status`,`file_name`),
CONSTRAINT `FK_DEPARTMENT_FILE_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`),
CONSTRAINT `FK_DEPARTMENT_FILE_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_DEPARTMENT_FILE_PROJECT_TXN_ID` FOREIGN KEY (`container_txn_id`) REFERENCES `department_txn` (`id`),
CONSTRAINT `FK_DEPARTMENT_FILE_PARENT_FOLDER_ID` FOREIGN KEY (`parent_folder_id`) REFERENCES `department_folder` (`id`),
CONSTRAINT `FK_DEPARTMENT_FILE_STORAGE_REFEENCE_ID` FOREIGN KEY (`storage_reference_id`) REFERENCES `storage_reference` (`id`),
CONSTRAINT `FK_DEPARTMENT_FILE_BUSINESS_FILE_CATEGORY_ID` FOREIGN KEY (`business_file_category_id`) REFERENCES `business_file_category` (`id`)
) ENGINE=INNODB;

CREATE TABLE `share_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`container_id` INT UNSIGNED NOT NULL COMMENT 'share_id',
`status_id` INT UNSIGNED NOT NULL,
`workflow_status` tinyint(4) DEFAULT '0' COMMENT 'workflow usage status',
`workflow_file_status` ENUM('APPROVED','REJECTED','REVIEWED') DEFAULT NULL,
`container_txn_id` INT UNSIGNED DEFAULT NULL COMMENT 'share_txn_id',
`checkout_by` INT DEFAULT NULL,
`parent_folder_id` INT UNSIGNED DEFAULT NULL,
`parent_file_id` INT UNSIGNED DEFAULT NULL,
`child_file_count` INT UNSIGNED DEFAULT NULL,
`storage_reference_id` INT UNSIGNED DEFAULT NULL,
`language_id` INT UNSIGNED DEFAULT NULL,
`business_file_category_id` INT UNSIGNED DEFAULT NULL,
`distributed_status` INT UNSIGNED DEFAULT NULL,
`file_type_id` INT NOT NULL,
`file_name` VARCHAR (191) NOT NULL,
`actual_name` VARCHAR (191) NOT NULL,
`tag` TEXT DEFAULT NULL,
`file_size` INT DEFAULT NULL,
`file_version_size` BIGINT DEFAULT NULL,
`document_name` VARCHAR (191) DEFAULT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`author` VARCHAR (120) DEFAULT NULL,
`advanced_properties` VARCHAR(1024) DEFAULT NULL COMMENT 'key:value|key:value format',
`content_hash` VARCHAR (200) DEFAULT NULL,
`file_hash` VARCHAR (200) DEFAULT NULL,
`tag_id` INT DEFAULT NULL,
`encrypted` INT DEFAULT NULL,
`index_status` INT DEFAULT NULL,
`metadata_index_status` INT DEFAULT NULL,
`external_id` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`os_access_date` DATETIME DEFAULT NULL,
`os_created_date` DATETIME DEFAULT NULL,
`os_modified_date` DATETIME DEFAULT NULL,
`view_count` INT DEFAULT NULL,
`version_view_count` INT DEFAULT 0,
`revision_number` INT DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`version_download_count` INT DEFAULT 0,
`file_path` VARCHAR (800) NOT NULL,
`is_public` TINYINT(4) DEFAULT 1 NULL COMMENT 'is_public = 1 means, the file is publicly accessible from generated "Public access link',
`file_status` ENUM('L','R') NOT NULL,
`device_id` INT DEFAULT NULL,
`file_source` VARCHAR(255) DEFAULT NULL,
`attached_wkf_process_instance_id` INT(10) NULL,
`issue_date` DATETIME DEFAULT NULL,
`expiry_date` DATETIME DEFAULT NULL,
`start_date` DATETIME DEFAULT NULL,
`end_date` DATETIME DEFAULT NULL,
`uploaded_by` INT NOT NULL,
`uploaded_date` DATETIME NOT NULL,
`locked_status` TINYINT DEFAULT 0,
`locked_by` INT DEFAULT NULL,
`locked_date` DATETIME DEFAULT NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_copy_file_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_copy_container_type` ENUM( '1','2','3','4','5') DEFAULT NULL COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`wkf_form_task_map_id` INT(10) UNSIGNED DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_SHARE_FILE_NAME_PARENT_FOLDER_ID` (`file_name`, `parent_folder_id`),
KEY `IDX_SHARE_FILE_COMBINED` (`container_id`,`parent_folder_id`,`status_id`,`file_status`,`file_name`),
KEY `IDX_SHARE_FILE_COUNT_COMBINED` (`created_by`,`distributed_status`,`container_id`,`parent_folder_id`,`status_id`,`file_status`),
CONSTRAINT `FK_SHARE_FILE_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`),
CONSTRAINT `FK_SHARE_FILE_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_SHARE_FILE_PROJECT_TXN_ID` FOREIGN KEY (`container_txn_id`) REFERENCES `share_txn` (`id`),
CONSTRAINT `FK_SHARE_FILE_PARENT_FOLDER_ID` FOREIGN KEY (`parent_folder_id`) REFERENCES `share_folder` (`id`),
CONSTRAINT `FK_SHARE_FILE_STORAGE_REFEENCE_ID` FOREIGN KEY (`storage_reference_id`) REFERENCES `storage_reference` (`id`),
CONSTRAINT `FK_SHARE_FILE_DISTRIBUTED_STATUS` FOREIGN KEY (`distributed_status`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_SHARE_FILE_BUSINESS_FILE_CATEGORY_ID` FOREIGN KEY (`business_file_category_id`) REFERENCES `business_file_category` (`id`)
) ENGINE=INNODB;

CREATE TABLE `backup_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`container_id` INT UNSIGNED NOT NULL COMMENT 'backup_id',
`status_id` INT UNSIGNED NOT NULL,
`workflow_status` tinyint(4) DEFAULT '0' COMMENT 'workflow usage status',
`workflow_file_status` ENUM('APPROVED','REJECTED','REVIEWED') DEFAULT NULL,
`parent_folder_id` INT UNSIGNED DEFAULT NULL,
`parent_file_id` INT UNSIGNED DEFAULT NULL,
`child_file_count` INT UNSIGNED DEFAULT NULL,
`file_type_id` INT NOT NULL,
`container_txn_id` INT UNSIGNED DEFAULT NULL COMMENT 'backup_txn_id',
`storage_reference_id` INT UNSIGNED DEFAULT NULL,
`language_id` INT UNSIGNED DEFAULT NULL,
`business_file_category_id` INT UNSIGNED DEFAULT NULL,
`file_name` VARCHAR (191) NOT NULL,
`actual_name` VARCHAR (191) NOT NULL,
`tag` TEXT DEFAULT NULL,
`file_size` INT DEFAULT NULL,
`file_version_size` BIGINT DEFAULT NULL,
`document_name` VARCHAR (191) DEFAULT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`author` VARCHAR (120) DEFAULT NULL,
`advanced_properties` VARCHAR(1024) DEFAULT NULL COMMENT 'key:value|key:value format',
`content_hash` VARCHAR (200) DEFAULT NULL,
`file_hash` VARCHAR (200) DEFAULT NULL,
`tag_id` INT DEFAULT NULL,
`encrypted` INT DEFAULT NULL,
`index_status` INT DEFAULT NULL,
`metadata_index_status` INT DEFAULT NULL,
`external_id` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`os_access_date` DATETIME DEFAULT NULL,
`os_created_date` DATETIME DEFAULT NULL,
`os_modified_date` DATETIME DEFAULT NULL,
`view_count` INT DEFAULT NULL,
`version_view_count` INT DEFAULT 0,
`revision_number` INT DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`version_download_count` INT DEFAULT 0,
`file_path` VARCHAR (800) NOT NULL,
`is_public` TINYINT(4) DEFAULT 1 NULL COMMENT 'is_public = 1 means, the file is publicly accessible from generated "Public access link',
`file_status` ENUM('L','R') NOT NULL,
`device_id` INT DEFAULT NULL,
`file_source` VARCHAR(255) DEFAULT NULL,
`attached_wkf_process_instance_id` INT(10) NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`issue_date` DATETIME DEFAULT NULL,
`expiry_date` DATETIME DEFAULT NULL,
`uploaded_by` INT NOT NULL,
`uploaded_date` DATETIME NOT NULL,
`locked_status` TINYINT DEFAULT 0,
`locked_by` INT DEFAULT NULL,
`locked_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_BACKUP_FILE_NAME_PARENT_FOLDER_ID` (`file_name`, `parent_folder_id`),
KEY `IDX_BACKUP_FILE_COMBINED` (created_by,`parent_folder_id`,`status_id`,`file_status`,`file_name`),
CONSTRAINT `FK_BACKUP_FILE_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `backup` (`id`),
CONSTRAINT `FK_BACKUP_FILE_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_BACKUP_FILE_PROJECT_TXN_ID` FOREIGN KEY (`container_txn_id`) REFERENCES `backup_txn` (`id`),
CONSTRAINT `FK_BACKUP_FILE_PARENT_FOLDER_ID` FOREIGN KEY (`parent_folder_id`) REFERENCES `backup_folder` (`id`),
CONSTRAINT `FK_BACKUP_FILE_STORAGE_REFEENCE_ID` FOREIGN KEY (`storage_reference_id`) REFERENCES `storage_reference` (`id`),
CONSTRAINT `FK_BACKUP_FILE_BUSINESS_FILE_CATEGORY_ID` FOREIGN KEY (`business_file_category_id`) REFERENCES `business_file_category` (`id`)
) ENGINE=INNODB;

CREATE TABLE `myfiles_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`container_id` INT UNSIGNED NOT NULL COMMENT 'myfiles_id',
`status_id` INT UNSIGNED NOT NULL,
`workflow_status` tinyint(4) DEFAULT '0' COMMENT 'workflow usage status',
`workflow_file_status` ENUM('APPROVED','REJECTED','REVIEWED') DEFAULT NULL,
`container_txn_id` INT UNSIGNED DEFAULT NULL COMMENT 'myfiles_txn_id',
`parent_folder_id` INT UNSIGNED DEFAULT NULL,
`parent_file_id` INT UNSIGNED DEFAULT NULL,
`child_file_count` INT UNSIGNED DEFAULT NULL,
`file_type_id` INT NOT NULL,
`storage_reference_id` INT UNSIGNED DEFAULT NULL,
`language_id` INT UNSIGNED DEFAULT NULL,
`business_file_category_id` INT UNSIGNED DEFAULT NULL,
`file_name` VARCHAR (191) NOT NULL,
`actual_name` VARCHAR (191) NOT NULL,
`tag` TEXT DEFAULT NULL,
`file_size` INT DEFAULT NULL,
`file_version_size` BIGINT DEFAULT NULL,
`document_name` VARCHAR (191) DEFAULT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`author` VARCHAR (120) DEFAULT NULL,
`advanced_properties` VARCHAR(1024) DEFAULT NULL COMMENT 'key:value|key:value format',
`content_hash` VARCHAR (200) DEFAULT NULL,
`file_hash` VARCHAR (200) DEFAULT NULL,
`tag_id` INT DEFAULT NULL,
`encrypted` INT DEFAULT NULL,
`index_status` INT DEFAULT NULL,
`metadata_index_status` INT DEFAULT NULL,
`external_id` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`os_access_date` DATETIME DEFAULT NULL,
`os_created_date` DATETIME DEFAULT NULL,
`os_modified_date` DATETIME DEFAULT NULL,
`view_count` INT DEFAULT NULL,
`version_view_count` INT DEFAULT 0,
`revision_number` INT DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`version_download_count` INT DEFAULT 0,
`file_path` VARCHAR (800) NOT NULL,
`is_public` TINYINT(4) DEFAULT 1 NULL COMMENT 'is_public = 1 means, the file is publicly accessible from generated "Public access link',
`file_status` ENUM('L','R') NOT NULL,
`device_id` INT DEFAULT NULL,
`file_source` VARCHAR(255) DEFAULT NULL,
`attached_wkf_process_instance_id` INT(10) NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`issue_date` DATETIME DEFAULT NULL,
`expiry_date` DATETIME DEFAULT NULL,
`uploaded_by` INT NOT NULL,
`uploaded_date` DATETIME NOT NULL,
`locked_status` TINYINT DEFAULT 0,
`locked_by` INT DEFAULT NULL,
`locked_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_MYFILES_FILE_NAME_PARENT_FOLDER_ID` (`file_name`, `parent_folder_id`),
KEY `IDX_MYFILES_FILE_COMBINED` (`container_id`,`parent_folder_id`,`status_id`,`file_status`,`file_name`),
KEY `IDX_MYFILES_FILE_COUNT_COMBINED` (`container_id`,`file_path`(191),`status_id`,`file_status`),
CONSTRAINT `FK_MYFILES_FILE_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `myfiles` (`id`),
CONSTRAINT `FK_MYFILES_FILE_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_MYFILES_FILE_PROJECT_TXN_ID` FOREIGN KEY (`container_txn_id`) REFERENCES `myfiles_txn` (`id`),
CONSTRAINT `FK_MYFILES_FILE_PARENT_FOLDER_ID` FOREIGN KEY (`parent_folder_id`) REFERENCES `myfiles_folder` (`id`),
CONSTRAINT `FK_MYFILES_FILE_STORAGE_REFEENCE_ID` FOREIGN KEY (`storage_reference_id`) REFERENCES `storage_reference` (`id`),
CONSTRAINT `FK_MYFILES_FILE_BUSINESS_FILE_CATEGORY_ID` FOREIGN KEY (`business_file_category_id`) REFERENCES `business_file_category` (`id`)
) ENGINE=INNODB;

CREATE TABLE `myfiles_folder_tag` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`myfiles_folder_id` INT NOT NULL,
`tag_name` VARCHAR (200) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
`action_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`)
)ENGINE=INNODB;

CREATE TABLE `project_file_version` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`file_id` INT UNSIGNED NOT NULL COMMENT 'project_file_id',
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`storage_reference_id` INT UNSIGNED DEFAULT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`workflow_file_status` ENUM('APPROVED','REJECTED','REVIEWED') DEFAULT NULL,
`container_id` INT UNSIGNED NOT NULL,
`file_size` INT NOT NULL,
`content_hash` VARCHAR (200) DEFAULT NULL,
`index_status` INT DEFAULT NULL,
`view_count` INT DEFAULT NULL,
`revision_number` INT DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`version_status` ENUM('L','R') NOT NULL COMMENT 'project_file_version_status',
`external_id` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`file_source` VARCHAR(255) DEFAULT NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`os_access_date` DATETIME DEFAULT NULL,
`os_created_date` DATETIME DEFAULT NULL,
`os_modified_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_PROJECT_FILE_VERSION_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `project_file` (`id`),
CONSTRAINT `FK_PROJECT_FILE_VERSION_STORAGE_REFEENCE_ID` FOREIGN KEY (`storage_reference_id`) REFERENCES `storage_reference` (`id`),
CONSTRAINT `FK_PROJECT_FILE_VERSION_DEVICE_ID` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`),
CONSTRAINT `FK_PROJECT_FILE_VERSION_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `department_file_version` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`file_id` INT UNSIGNED NOT NULL COMMENT 'department_file_id',
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`storage_reference_id` INT UNSIGNED DEFAULT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`workflow_file_status` ENUM('APPROVED','REJECTED','REVIEWED') DEFAULT NULL,
`container_id` INT UNSIGNED NOT NULL,
`file_size` INT NOT NULL,
`content_hash` VARCHAR (200) DEFAULT NULL,
`index_status` INT DEFAULT NULL,
`view_count` INT DEFAULT NULL,
`revision_number` INT DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`version_status` ENUM('L','R') NOT NULL COMMENT 'department_file_version_status',
`external_id` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`file_source` VARCHAR(255) DEFAULT NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`os_access_date` DATETIME DEFAULT NULL,
`os_created_date` DATETIME DEFAULT NULL,
`os_modified_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_DEPARTMENT_FILE_VERSION_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `department_file` (`id`),
CONSTRAINT `FK_DEPARTMENT_FILE_VERSION_STORAGE_REFEENCE_ID` FOREIGN KEY (`storage_reference_id`) REFERENCES `storage_reference` (`id`),
CONSTRAINT `FK_DEPARTMENT_FILE_VERSION_DEVICE_ID` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`),
CONSTRAINT `FK_DEPARTMENT_FILE_VERSION_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `share_file_version` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`file_id` INT UNSIGNED NOT NULL COMMENT 'share_file_id',
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`device_id` INT UNSIGNED DEFAULT NULL,
`storage_reference_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`workflow_file_status` ENUM('APPROVED','REJECTED','REVIEWED') DEFAULT NULL,
`container_id` INT UNSIGNED NOT NULL,
`file_size` INT NOT NULL,
`content_hash` VARCHAR (200) DEFAULT NULL,
`index_status` INT DEFAULT NULL,
`view_count` INT DEFAULT NULL,
`revision_number` INT DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`version_status` ENUM('L','R') NOT NULL COMMENT 'share_file_version_status',
`external_id` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`file_source` VARCHAR(255) DEFAULT NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`os_access_date` DATETIME DEFAULT NULL,
`os_created_date` DATETIME DEFAULT NULL,
`os_modified_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_SHARE_FILE_VERSION_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `share_file` (`id`),
CONSTRAINT `FK_SHARE_FILE_VERSION_DEVICE_ID` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`),
CONSTRAINT `FK_SHARE_FILE_VERSION_STORAGE_REFEENCE_ID` FOREIGN KEY (`storage_reference_id`) REFERENCES `storage_reference` (`id`),
CONSTRAINT `FK_SHARE_FILE_VERSION_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `backup_file_version` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`file_id` INT UNSIGNED NOT NULL COMMENT 'backup_file_id',
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`device_id` INT UNSIGNED DEFAULT NULL,
`storage_reference_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`workflow_file_status` ENUM('APPROVED','REJECTED','REVIEWED') DEFAULT NULL,
`container_id` INT UNSIGNED NOT NULL,
`file_size` INT NOT NULL,
`content_hash` VARCHAR (200) DEFAULT NULL,
`index_status` INT DEFAULT NULL,
`view_count` INT DEFAULT NULL,
`revision_number` INT DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`version_status` ENUM('L','R') NOT NULL COMMENT 'backup_file_version_status',
`external_id` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`file_source` VARCHAR(255) DEFAULT NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`os_access_date` DATETIME DEFAULT NULL,
`os_created_date` DATETIME DEFAULT NULL,
`os_modified_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_BACKUP_FILE_VERSION_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `backup_file` (`id`),
CONSTRAINT `FK_BACKUP_FILE_VERSION_DEVICE_ID` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`),
CONSTRAINT `FK_BACKUP_FILE_VERSION_STORAGE_REFEENCE_ID` FOREIGN KEY (`storage_reference_id`) REFERENCES `storage_reference` (`id`),
CONSTRAINT `FK_BACKUP_FILE_VERSION_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `myfiles_file_version` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`file_id` INT UNSIGNED NOT NULL COMMENT 'myfiles_file_id',
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`device_id` INT UNSIGNED DEFAULT NULL,
`storage_reference_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`workflow_file_status` ENUM('APPROVED','REJECTED','REVIEWED') DEFAULT NULL,
`container_id` INT UNSIGNED NOT NULL,
`file_size` INT NOT NULL,
`content_hash` VARCHAR (200) DEFAULT NULL,
`index_status` INT DEFAULT NULL,
`view_count` INT DEFAULT NULL,
`revision_number` INT DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`version_status` ENUM('L','R') NOT NULL COMMENT 'myfiles_file_version_status',
`external_id` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`file_source` VARCHAR(255) DEFAULT NULL,
`wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
`os_access_date` DATETIME DEFAULT NULL,
`os_created_date` DATETIME DEFAULT NULL,
`os_modified_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_MYFILES_FILE_VERSION_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `myfiles_file` (`id`),
CONSTRAINT `FK_MYFILES_FILE_VERSION_DEVICE_ID` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`),
CONSTRAINT `FK_MYFILES_FILE_VERSION_STORAGE_REFEENCE_ID` FOREIGN KEY (`storage_reference_id`) REFERENCES `storage_reference` (`id`),
CONSTRAINT `FK_MYFILES_FILE_VERSION_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `base_role_permission` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`permission_code` VARCHAR(50) NOT NULL,
`name` VARCHAR(50) NOT NULL,
`permission_value` INT NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_BASE_ROLE_PERMISSION_PERMISSION_CODE` (`permission_code`)
) ENGINE=INNODB;

INSERT INTO base_role_permission (`id`,`permission_code`,`name`,`permission_value`) VALUES
(1,'PROJECT_MANAGE_PERMISSION','PROJECT_MANAGE_PERMISSION',1),
(2,'PROJECT_MANAGE_MEMBER','PROJECT_MANAGE_MEMBER',2),
(3,'PROJECT_FREEZE_UNFREEZE','PROJECT_FREEZE_UNFREEZE',4),
(4,'PROJECT_VIEW_LOG','PROJECT_VIEW_LOG',8),
(5,'DEPARTMENT_MANAGE_PERMISSION','DEPARTMENT_MANAGE_PERMISSION',16),
(6,'DEPARTMENT_MANAGE_MEMBER','DEPARTMENT_MANAGE_MEMBER',32),
(7,'DEPARTMENT_VIEW_LOG','DEPARTMENT_VIEW_LOG',64),
(8,'SHARE_MANAGE_PERMISSION','SHARE_MANAGE_PERMISSION',128),
(9,'SHARE_MANAGE_MEMBER','SHARE_MANAGE_MEMBER',256),
(10,'SHARE_FREEZE_UNFREEZE','SHARE_FREEZE_UNFREEZE',512),
(11,'SHARE_VIEW_LOG','SHARE_VIEW_LOG',1024);


CREATE TABLE `base_folder_permission` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`permission_code` VARCHAR(50) NOT NULL,
`name` VARCHAR(50) NOT NULL,
`permission_value` INT NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_BASE_FOLDER_PERMISSION_PERMISSION_CODE` (`permission_code`)
) ENGINE=INNODB;

INSERT INTO base_folder_permission (`id`,`permission_code`,`name`,`permission_value`) VALUES
(1,'LIST_FILES','LIST_FILES',1),
(2,'LIST_FOLDERS','LIST_FOLDERS',2),
(3,'PREVIEW','PREVIEW',4),
(4,'DOWNLOAD','DOWNLOAD',8),
(5,'ADD_FILES','ADD_FILES',16),
(6,'ADD_FOLDERS','ADD_FOLDERS',32),
(7,'MODIFY_FILES','MODIFY_FILES',64),
(8,'RENAME_FILES','RENAME_FILES',128),
(9,'RENAME_FOLDERS','RENAME_FOLDERS',256),
(10,'DELETE_FILES','DELETE_FILES',512),
(11,'DELETE_FOLDERS','DELETE_FOLDERS',1024),
(12,'SHARE_FILE', 'SHARE_FILE', 2048),
(13,'SHARE_FOLDERS','SHARE_FOLDERS', 4096);


CREATE TABLE `folder_permission_set` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`name` VARCHAR(50) NOT NULL,
`description` VARCHAR(50) DEFAULT NULL,
`display_order` TINYINT(4) COMMENT 'Permission Display order',
`permission_set_value` INT NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_FOLDER_PERMISSION_SET_NAME_COMPANY_CODE` (`name`,`company_code`)
) ENGINE=INNODB;

INSERT  INTO folder_permission_set(id,company_code, name, description, display_order, permission_set_value,created_by,created_date,updated_by,updated_date)
VALUES
(1,COMPANY_CODE_REPLACE_HERE, '---', 'No Permission',1,0,1,NOW(),NULL,NULL),
(2,COMPANY_CODE_REPLACE_HERE, 'READ', 'View-Download',3,6159,1,NOW(),NULL,NULL),
(3,COMPANY_CODE_REPLACE_HERE, 'EDIT', 'Edit',4,6655,1,NOW(),NULL,NULL),
(4,COMPANY_CODE_REPLACE_HERE, 'FULL_CONTROL','Read-Edit-Delete',5,16383,1,NOW(),NULL,NULL),
(5,COMPANY_CODE_REPLACE_HERE, 'VIEW', 'View', 2,6151,1,NOW(),NULL,NULL);


 CREATE TABLE `role` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`name` VARCHAR(50) NOT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`role_type` ENUM('1','2') NOT NULL DEFAULT 1,
`role_category` ENUM('1','2') NOT NULL DEFAULT 1,
`department_id` INT UNSIGNED DEFAULT NULL,
`system_privilege` INT NOT NULL,
`permission_set_id` INT UNSIGNED DEFAULT NULL,
`max_permission_set_id` INT UNSIGNED DEFAULT NULL,
`min_permission_set_id` INT UNSIGNED DEFAULT NULL,
`container_privilege` INT NOT NULL,
`is_all_project` TINYINT DEFAULT NULL,
`is_all_department` TINYINT DEFAULT NULL,
`is_all_share` TINYINT DEFAULT NULL,
`default_project_admin` TINYINT DEFAULT NULL,
`default_department_admin` TINYINT DEFAULT NULL,
`default_share_admin` TINYINT DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_ROLE_COMPANY_NAME` (`name`),
KEY `IDX_ROLE_COMBINED` (`company_code`,`default_project_admin`,`status_id`),
CONSTRAINT `FK_ROLE_FOLDER_PERMISSION_SET_ID` FOREIGN KEY (`permission_set_id`) REFERENCES `folder_permission_set` (`id`),
CONSTRAINT `FK_ROLE_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
)ENGINE=INNODB; 

INSERT INTO `role` (`id`,`company_code`,`name`,`description`,`role_type`,`system_privilege`,`permission_set_id`,`max_permission_set_id`,`min_permission_set_id`,`container_privilege`,`is_all_project`,`is_all_department`,`is_all_share`,`default_project_admin`,`default_department_admin`,`default_share_admin`,`status_id`,`created_by`,`created_date`) VALUES (1,COMPANY_CODE_REPLACE_HERE,'Project Admin',NULL,'2',0,4,4,2,2047,0,0,0,0,0,0,1,1,NOW());
INSERT INTO `role` (`id`,`company_code`,`name`,`description`,`role_type`,`system_privilege`,`permission_set_id`,`max_permission_set_id`,`min_permission_set_id`,`container_privilege`,`is_all_project`,`is_all_department`,`is_all_share`,`default_project_admin`,`default_department_admin`,`default_share_admin`,`status_id`,`created_by`,`created_date`) VALUES (2,COMPANY_CODE_REPLACE_HERE,'Project User',NULL,'2',0,1,4,1,0,0,0,0,0,0,0,1,1,NOW());
INSERT INTO `role` (`id`,`company_code`,`name`,`description`,`role_type`,`system_privilege`,`permission_set_id`,`max_permission_set_id`,`min_permission_set_id`,`container_privilege`,`is_all_project`,`is_all_department`,`is_all_share`,`default_project_admin`,`default_department_admin`,`default_share_admin`,`status_id`,`created_by`,`created_date`) VALUES (3,COMPANY_CODE_REPLACE_HERE,'Project Guest User',NULL,'2',0,1,4,1,0,0,0,0,0,0,0,1,1,NOW());
INSERT INTO `role` (`id`,`company_code`,`name`,`description`,`role_type`,`system_privilege`,`permission_set_id`,`max_permission_set_id`,`min_permission_set_id`,`container_privilege`,`is_all_project`,`is_all_department`,`is_all_share`,`default_project_admin`,`default_department_admin`,`default_share_admin`,`status_id`,`created_by`,`created_date`) VALUES (4,COMPANY_CODE_REPLACE_HERE,'Department Admin',NULL,'2',0,4,4,2,2047,0,0,0,0,1,0,1,1,NOW());
INSERT INTO `role` (`id`,`company_code`,`name`,`description`,`role_type`,`system_privilege`,`permission_set_id`,`max_permission_set_id`,`min_permission_set_id`,`container_privilege`,`is_all_project`,`is_all_department`,`is_all_share`,`default_project_admin`,`default_department_admin`,`default_share_admin`,`status_id`,`created_by`,`created_date`) VALUES (5,COMPANY_CODE_REPLACE_HERE,'Department User',NULL,'2',0,1,4,1,0,0,0,0,0,0,0,1,1,NOW());
INSERT INTO `role` (`id`,`company_code`,`name`,`description`,`role_type`,`system_privilege`,`permission_set_id`,`max_permission_set_id`,`min_permission_set_id`,`container_privilege`,`is_all_project`,`is_all_department`,`is_all_share`,`default_project_admin`,`default_department_admin`,`default_share_admin`,`status_id`,`created_by`,`created_date`) VALUES (6,COMPANY_CODE_REPLACE_HERE,'Department Guest User',NULL,'2',0,1,4,1,0,0,0,0,0,0,0,1,1,NOW());
INSERT INTO `role` (`id`,`company_code`,`name`,`description`,`role_type`,`system_privilege`,`permission_set_id`,`max_permission_set_id`,`min_permission_set_id`,`container_privilege`,`is_all_project`,`is_all_department`,`is_all_share`,`default_project_admin`,`default_department_admin`,`default_share_admin`,`status_id`,`created_by`,`created_date`) VALUES (7,COMPANY_CODE_REPLACE_HERE,'Share_Admin',NULL,'1',0,4,4,2,2047,0,0,1,0,0,1,1,1,NOW());
INSERT INTO `role` (`id`,`company_code`,`name`,`description`,`role_type`,`system_privilege`,`permission_set_id`,`max_permission_set_id`,`min_permission_set_id`,`container_privilege`,`is_all_project`,`is_all_department`,`is_all_share`,`default_project_admin`,`default_department_admin`,`default_share_admin`,`status_id`,`created_by`,`created_date`) VALUES (8,COMPANY_CODE_REPLACE_HERE,'Share_Normal_User',NULL,'1',0,4,4,1,128,0,0,1,0,0,0,1,1,NOW());
INSERT INTO `role` (`id`,`company_code`,`name`,`description`,`role_type`,`system_privilege`,`permission_set_id`,`max_permission_set_id`,`min_permission_set_id`,`container_privilege`,`is_all_project`,`is_all_department`,`is_all_share`,`default_project_admin`,`default_department_admin`,`default_share_admin`,`status_id`,`created_by`,`created_date`) VALUES (9,COMPANY_CODE_REPLACE_HERE,'Share_Guest_User',NULL,'1',0,1,4,1,0,0,0,1,0,0,0,1,1,NOW());
INSERT INTO `role` (`id`,`company_code`,`name`,`description`,`role_type`,`system_privilege`,`permission_set_id`,`max_permission_set_id`,`min_permission_set_id`,`container_privilege`,`is_all_project`,`is_all_department`,`is_all_share`,`default_project_admin`,`default_department_admin`,`default_share_admin`,`status_id`,`created_by`,`created_date`) VALUES (10,COMPANY_CODE_REPLACE_HERE,'User','User','1',0,1,4,1,0,0,0,0,0,0,0,1,1,NOW());


CREATE TABLE `project_folder_user_permission` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user_id` INT UNSIGNED NOT NULL,
`folder_id` INT UNSIGNED NOT NULL COMMENT 'project_folder_id',
`container_id` INT UNSIGNED NOT NULL COMMENT 'project',
`permission_set_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `IDX_PFUP_USER_ID_FOLDER_ID` (`user_id`, `folder_id`),
 CONSTRAINT `FK_PROJECT_FOLDER_USER_PERMISSION_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
 CONSTRAINT `FK_PROJECT_FOLDER_USER_PERMISSION_PROJECT_FOLDER_ID` FOREIGN KEY (`folder_id`) REFERENCES `project_folder` (`id`),
 CONSTRAINT `FK_PROJECT_FOLDER_USER_PERMISSION_PROJECT_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`),
 CONSTRAINT `FK_PROJECT_FOLDER_USER_PERMISSION_PERMISSION_SET_ID` FOREIGN KEY (`permission_set_id`) REFERENCES `folder_permission_set` (`id`)
)ENGINE=INNODB;

CREATE TABLE `department_folder_user_permission` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user_id` INT UNSIGNED NOT NULL,
`folder_id` INT UNSIGNED NOT NULL COMMENT 'department_folder_id',
`container_id` INT UNSIGNED NOT NULL COMMENT 'department',
`permission_set_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `IDX_DFUP_USER_ID_FOLDER_ID` (`user_id`, `folder_id`),
 CONSTRAINT `FK_DEPARTMENT_FOLDER_USER_PERMISSION_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
 CONSTRAINT `FK_DEPARTMENT_FOLDER_USER_PERMISSION_PROJECT_FOLDER_ID` FOREIGN KEY (`folder_id`) REFERENCES `department_folder` (`id`),
 CONSTRAINT `FK_DEPARTMENT_FOLDER_USER_PERMISSION_PROJECT_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`),
 CONSTRAINT `FK_DEPARTMENT_FOLDER_PERMISSION_SET_ID` FOREIGN KEY (`permission_set_id`) REFERENCES `folder_permission_set` (`id`)
)ENGINE=INNODB;

CREATE TABLE `share_folder_user_permission` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user_id` INT UNSIGNED NOT NULL,
`folder_id` INT UNSIGNED NOT NULL COMMENT 'share_folder_id',
`container_id` INT UNSIGNED NOT NULL COMMENT 'share',
`permission_set_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `IDX_SFUP_USER_ID_FOLDER_ID` (`user_id`, `folder_id`),
 CONSTRAINT `FK_SHARE_FOLDER_USER_PERMISSION_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
 CONSTRAINT `FK_SHARE_FOLDER_USER_PERMISSION_PROJECT_FOLDER_ID` FOREIGN KEY (`folder_id`) REFERENCES `share_folder` (`id`),
 CONSTRAINT `FK_SHARE_FOLDER_USER_PERMISSION_PROJECT_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`),
 CONSTRAINT `FK_SHARE_FOLDER_PERMISSION_SET_ID` FOREIGN KEY (`permission_set_id`) REFERENCES `folder_permission_set` (`id`)
)ENGINE=INNODB;


CREATE TABLE `project_folder_group_permission` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user_group_id` INT UNSIGNED NOT NULL,
`folder_id` INT UNSIGNED NOT NULL COMMENT 'project_folder_id',
`container_id` INT UNSIGNED NOT NULL COMMENT 'project',
`permission_set_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `IDX_PFGP_USER_GROUP_ID_FOLDER_ID` (`user_group_id`, `folder_id`),
 CONSTRAINT `FK_PROJECT_FOLDER_GROUP_PERMISSION_USER_ID` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`),
 CONSTRAINT `FK_PROJECT_FOLDER_GROUP_PERMISSION_PROJECT_FOLDER_ID` FOREIGN KEY (`folder_id`) REFERENCES `project_folder` (`id`),
 CONSTRAINT `FK_PROJECT_FOLDER_GROUP_PERMISSION_PROJECT_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`),
 CONSTRAINT `FK_PROJECT_FOLDER_GROUP_PERMISSION_SET_ID` FOREIGN KEY (`permission_set_id`) REFERENCES `folder_permission_set` (`id`)
)ENGINE=INNODB;

CREATE TABLE `department_folder_group_permission` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user_group_id` INT UNSIGNED NOT NULL,
`folder_id` INT UNSIGNED NOT NULL COMMENT 'department_folder_id',
`container_id` INT UNSIGNED NOT NULL COMMENT 'department',
`permission_set_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `IDX_DFGP_USER_GROUP_ID_FOLDER_ID` (`user_group_id`, `folder_id`),
 CONSTRAINT `FK_DEPARTMENT_FOLDER_GROUP_PERMISSION_USER_ID` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`),
 CONSTRAINT `FK_DEPARTMENT_FOLDER_GROUP_PERMISSION_PROJECT_FOLDER_ID` FOREIGN KEY (`folder_id`) REFERENCES `department_folder` (`id`),
 CONSTRAINT `FK_DEPARTMENT_FOLDER_GROUP_PERMISSION_PROJECT_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`),
 CONSTRAINT `FK_DEPARTMENT_FOLDER_GROUP_PERMISSION_SET_ID` FOREIGN KEY (`permission_set_id`) REFERENCES `folder_permission_set` (`id`)
)ENGINE=INNODB;

CREATE TABLE `share_folder_group_permission` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user_group_id` INT UNSIGNED NOT NULL,
`folder_id` INT UNSIGNED NOT NULL COMMENT 'share_folder_id',
`container_id` INT UNSIGNED NOT NULL COMMENT 'share',
`permission_set_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `IDX_SFGP_USER_GROUP_ID_FOLDER_ID` (`user_group_id`, `folder_id`),
 CONSTRAINT `FK_SHARE_FOLDER_GROUP_PERMISSION_USER_ID` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`),
 CONSTRAINT `FK_SHARE_FOLDER_GROUP_PERMISSION_PROJECT_FOLDER_ID` FOREIGN KEY (`folder_id`) REFERENCES `share_folder` (`id`),
 CONSTRAINT `FK_SHARE_FOLDER_GROUP_PERMISSION_PROJECT_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`),
 CONSTRAINT `FK_SHARE_FOLDER_GROUP_PERMISSION_SET_ID` FOREIGN KEY (`permission_set_id`) REFERENCES `folder_permission_set` (`id`)
)ENGINE=INNODB;

CREATE TABLE `action` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`company_code` VARCHAR(100) NOT NULL,
`value` INT UNSIGNED NOT NULL,
`enable_alert` TINYINT NOT NULL,
`category` ENUM('1','2','3','4','5','6') NOT NULL COMMENT '1-BACKUP 2-PROJECT 3-SHARE 4-DEPARTMENT 5-MYFILES 6-GENERAL',
`type` ENUM('1','2','3') NOT NULL COMMENT '1-FOLDER 2-FILE 3-COMMON',
`enable_log` TINYINT NOT NULL,
PRIMARY KEY (`id`),
KEY `IDX_ACTION_COMPANY_CODE` (`company_code`),
UNIQUE KEY `IDX_ACTION_VALUE` (`value`)
) ENGINE=INNODB;

INSERT INTO `action` (`id`, `name`, `company_code`, `value`, `enable_alert`, `category`, `type`, `enable_log`) VALUE
(1,'PROJECT_CREATED',COMPANY_CODE_REPLACE_HERE,'101','1','2','3','1'),
(2,'PROJECT_UPDATED',COMPANY_CODE_REPLACE_HERE,'102','1','2','3','1'),
(3,'PROJECT_MEMBER_ADDED',COMPANY_CODE_REPLACE_HERE,'103','1','2','3','1'),
(4,'PROJECT_MEMBER_REMOVED',COMPANY_CODE_REPLACE_HERE,'104','1','2','3','1'),
(5,'PROJECT_DELETED',COMPANY_CODE_REPLACE_HERE,'105','1','2','3','1'),
(6,'PROJECT_FREEZED',COMPANY_CODE_REPLACE_HERE,'106','1','2','3','1'),
(7,'PROJECT_UNFREEZED',COMPANY_CODE_REPLACE_HERE,'107','1','2','3','1'),
(8,'PROJECT_EXTENDED',COMPANY_CODE_REPLACE_HERE,'108','1','2','3','1'),
(9,'PROJECT_QUOTA_UPDATED',COMPANY_CODE_REPLACE_HERE,'151','1','2','3','1'),
(10,'PROJECT_FILE_GENERATE_PUBLIC_KEY',COMPANY_CODE_REPLACE_HERE,'152','1','2','2','1'),
(11,'PROJECT_FILE_REPUBLISH',COMPANY_CODE_REPLACE_HERE,'153','1','2','2','1'),
(12,'PROJECT_FOLDER_ADD_MAILDROP_FOLDER',COMPANY_CODE_REPLACE_HERE,'154','1','2','1','1'),
(13,'PROJECT_FOLDER_UPDATE_MAILDROP_FOLDER',COMPANY_CODE_REPLACE_HERE,'155','1','2','1','1'),
(14,'PROJECT_ADD_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'156','1','2','1','1'),
(15,'PROJECT_INVITE_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'157','1','2','1','1'),
(16,'PROJECT_REMOVE_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'158','1','2','1','1'),
(17,'PROJECT_FOLDER_ADDED',COMPANY_CODE_REPLACE_HERE,'109','1','2','1','1'),
(18,'PROJECT_FOLDER_RENAMED',COMPANY_CODE_REPLACE_HERE,'110','1','2','1','1'),
(19,'PROJECT_FOLDER_SET_PERMISSION',COMPANY_CODE_REPLACE_HERE,'111','1','2','1','1'),
(20,'PROJECT_FOLDER_PERMISSION_VIEWED',COMPANY_CODE_REPLACE_HERE,'112','1','2','1','1'),
(21,'PROJECT_FOLDER_MOVED',COMPANY_CODE_REPLACE_HERE,'113','1','2','1','1'),
(22,'PROJECT_FOLDER_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'114','1','2','1','1'),
(23,'PROJECT_FOLDER_RESTORED',COMPANY_CODE_REPLACE_HERE,'115','1','2','1','1'),
(24,'PROJECT_FOLDER_DOWNLOAD',COMPANY_CODE_REPLACE_HERE,'116','1','2','1','1'),
(25,'PROJECT_FOLDER_DELETED',COMPANY_CODE_REPLACE_HERE,'117','1','2','1','1'),
(26,'PROJECT_FILE_ADDED',COMPANY_CODE_REPLACE_HERE,'118','1','2','2','1'),
(27,'PROJECT_FILE_VERSION_ADDED',COMPANY_CODE_REPLACE_HERE,'119','1','2','2','1'),
(28,'PROJECT_FILE_RENAMED',COMPANY_CODE_REPLACE_HERE,'120','1','2','2','1'),
(29,'PROJECT_FILE_MOVED',COMPANY_CODE_REPLACE_HERE,'121','1','2','2','1'),
(30,'PROJECT_FILE_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'122','1','2','2','1'),
(31,'PROJECT_FILE_VIEWED',COMPANY_CODE_REPLACE_HERE,'123','1','2','2','1'),
(32,'PROJECT_FILE_DOWNLOADED',COMPANY_CODE_REPLACE_HERE,'124','1','2','2','1'),
(33,'PROJECT_FILE_HISTORY_DOWNLOADED',COMPANY_CODE_REPLACE_HERE,'126','1','2','2','1'),
(34,'PROJECT_FILE_CHECKED_OUT',COMPANY_CODE_REPLACE_HERE,'127','1','2','2','1'),
(35,'PROJECT_FILE_CHECKED_IN',COMPANY_CODE_REPLACE_HERE,'128','1','2','2','1'),
(36,'PROJECT_FILE_DELETED',COMPANY_CODE_REPLACE_HERE,'129','1','2','2','1'),
(37,'PROJECT_FILE_RESTORED',COMPANY_CODE_REPLACE_HERE,'130','1','2','2','1'),
(38,'PROJECT_FILE_ADD_ANNOTATION',COMPANY_CODE_REPLACE_HERE,'147','1','2','2','1'),
(39,'PROJECT_FILE_DELETE_ANNOTATION',COMPANY_CODE_REPLACE_HERE,'148','1','2','2','1'),
(40,'PROJECT_LINK_LOCKER',COMPANY_CODE_REPLACE_HERE,'149','0','2','3','1'),
(41,'PROJECT_UNLINK_LOCKER',COMPANY_CODE_REPLACE_HERE,'150','0','2','3','1'),
(42,'DEPARTMENT_CREATED',COMPANY_CODE_REPLACE_HERE,'201','1','4','3','1'),
(43,'DEPARTMENT_UPDATED',COMPANY_CODE_REPLACE_HERE,'202','1','4','3','1'),
(44,'DEPARTMENT_QUOTA_UPDATED',COMPANY_CODE_REPLACE_HERE,'244','1','4','3','1'),
(45,'DEPARTMENT_FILE_GENERATE_PUBLIC_KEY',COMPANY_CODE_REPLACE_HERE,'245','1','4','2','1'),
(46,'DEPARTMENT_FILE_REPUBLISH',COMPANY_CODE_REPLACE_HERE,'246','1','4','2','1'),
(47,'DEPARTMENT_FOLDER_ADD_MAILDROP_FOLDER',COMPANY_CODE_REPLACE_HERE,'247','1','4','1','1'),
(48,'DEPARTMENT_FOLDER_UPDATE_MAILDROP_FOLDER',COMPANY_CODE_REPLACE_HERE,'248','1','4','1','1'),
(49,'DEPARTMENT_ADD_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'249','1','4','1','1'),
(50,'DEPARTMENT_INVITE_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'250','1','4','1','1'),
(51,'DEPARTMENT_REMOVE_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'251','1','4','1','1'),
(52,'DEPARTMENT_MEMBER_ADDED',COMPANY_CODE_REPLACE_HERE,'203','1','4','3','1'),
(53,'DEPARTMENT_MEMBER_REMOVED',COMPANY_CODE_REPLACE_HERE,'204','1','4','3','1'),
(54,'DEPARTMENT_DELETED',COMPANY_CODE_REPLACE_HERE,'205','1','4','3','1'),
(55,'DEPARTMENT_FOLDER_ADDED',COMPANY_CODE_REPLACE_HERE,'206','1','4','1','1'),
(56,'DEPARTMENT_FOLDER_RENAMED',COMPANY_CODE_REPLACE_HERE,'207','1','4','1','1'),
(57,'DEPARTMENT_FOLDER_SET_PERMISSION',COMPANY_CODE_REPLACE_HERE,'208','1','4','1','1'),
(58,'DEPARTMENT_FOLDER_PERMISSION_VIEWED',COMPANY_CODE_REPLACE_HERE,'209','1','4','1','1'),
(59,'DEPARTMENT_FOLDER_MOVED',COMPANY_CODE_REPLACE_HERE,'210','1','4','1','1'),
(60,'DEPARTMENT_FOLDER_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'211','1','4','1','1'),
(61,'DEPARTMENT_FOLDER_RESTORED',COMPANY_CODE_REPLACE_HERE,'212','1','4','1','1'),
(62,'DEPARTMENT_FOLDER_DOWNLOAD',COMPANY_CODE_REPLACE_HERE,'213','1','4','1','1'),
(63,'DEPARTMENT_FOLDER_DELETED',COMPANY_CODE_REPLACE_HERE,'214','1','4','1','1'),
(64,'DEPARTMENT_FILE_ADDED',COMPANY_CODE_REPLACE_HERE,'215','1','4','2','1'),
(65,'DEPARTMENT_FILE_VERSION_ADDED',COMPANY_CODE_REPLACE_HERE,'216','1','4','2','1'),
(66,'DEPARTMENT_FILE_RENAMED',COMPANY_CODE_REPLACE_HERE,'217','1','4','2','1'),
(67,'DEPARTMENT_FILE_MOVED',COMPANY_CODE_REPLACE_HERE,'218','1','4','2','1'),
(68,'DEPARTMENT_FILE_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'219','1','4','2','1'),
(69,'DEPARTMENT_FILE_VIEWED',COMPANY_CODE_REPLACE_HERE,'220','1','4','2','1'),
(70,'DEPARTMENT_FILE_DOWNLOADED',COMPANY_CODE_REPLACE_HERE,'221','1','4','2','1'),
(71,'DEPARTMENT_FILE_HISTORY_DOWNLOADED',COMPANY_CODE_REPLACE_HERE,'223','1','4','2','1'),
(72,'DEPARTMENT_FILE_DELETED',COMPANY_CODE_REPLACE_HERE,'224','1','4','2','1'),
(73,'DEPARTMENT_FILE_RESTORED',COMPANY_CODE_REPLACE_HERE,'225','1','4','2','1'),
(74,'DEPARTMENT_FILE_ADD_ANNOTATION',COMPANY_CODE_REPLACE_HERE,'240','1','4','2','1'),
(75,'DEPARTMENT_FILE_DELETE_ANNOTATION',COMPANY_CODE_REPLACE_HERE,'241','1','4','2','1'),
(76,'DEPARTMENT_LINK_LOCKER',COMPANY_CODE_REPLACE_HERE,'242','0','4','3','1'),
(77,'DEPARTMENT_UNLINK_LOCKER',COMPANY_CODE_REPLACE_HERE,'243','0','4','3','1'),
(78,'SHARE_CREATED',COMPANY_CODE_REPLACE_HERE,'301','1','3','3','1'),
(79,'SHARE_UPDATED',COMPANY_CODE_REPLACE_HERE,'302','1','3','3','1'),
(80,'SHARE_QUOTA_UPDATED',COMPANY_CODE_REPLACE_HERE,'352','1','3','3','1'),
(81,'SHARE_FILE_GENERATE_PUBLIC_KEY',COMPANY_CODE_REPLACE_HERE,'353','1','3','2','1'),
(82,'SHARE_FILE_REPUBLISH',COMPANY_CODE_REPLACE_HERE,'354','1','3','2','1'),
(83,'SHARE_FOLDER_ADD_MAILDROP_FOLDER',COMPANY_CODE_REPLACE_HERE,'355','1','3','1','1'),
(84,'SHARE_FOLDER_UPDATE_MAILDROP_FOLDER',COMPANY_CODE_REPLACE_HERE,'356','1','3','1','1'),
(85,'SHARE_ADD_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'357','1','3','1','1'),
(86,'SHARE_INVITE_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'358','1','3','1','1'),
(87,'SHARE_REMOVE_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'359','1','3','1','1'),
(88,'SHARE_MEMBER_ADDED',COMPANY_CODE_REPLACE_HERE,'303','1','3','3','1'),
(89,'SHARE_MEMBER_REMOVED',COMPANY_CODE_REPLACE_HERE,'304','1','3','3','1'),
(90,'SHARE_DELETED',COMPANY_CODE_REPLACE_HERE,'305','1','3','3','1'),
(91,'SHARE_FREEZED',COMPANY_CODE_REPLACE_HERE,'306','1','3','3','1'),
(92,'SHARE_UNFREEZED',COMPANY_CODE_REPLACE_HERE,'307','1','3','3','1'),
(93,'SHARE_FOLDER_ADDED',COMPANY_CODE_REPLACE_HERE,'308','1','3','1','1'),
(94,'SHARE_FOLDER_RENAMED',COMPANY_CODE_REPLACE_HERE,'309','1','3','1','1'),
(95,'SHARE_FOLDER_SET_PERMISSION',COMPANY_CODE_REPLACE_HERE,'310','1','3','1','1'),
(96,'SHARE_FOLDER_PERMISSION_VIEWED',COMPANY_CODE_REPLACE_HERE,'311','1','3','1','1'),
(97,'SHARE_FOLDER_MOVED',COMPANY_CODE_REPLACE_HERE,'312','1','3','1','1'),
(98,'SHARE_FOLDER_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'313','1','3','1','1'),
(99,'SHARE_FOLDER_RESTORED',COMPANY_CODE_REPLACE_HERE,'314','1','3','1','1'),
(100,'SHARE_FOLDER_DOWNLOAD',COMPANY_CODE_REPLACE_HERE,'315','1','3','1','1'),
(101,'SHARE_FOLDER_DELETED',COMPANY_CODE_REPLACE_HERE,'316','1','3','1','1'),
(102,'SHARE_FOLDER_EXTENDED',COMPANY_CODE_REPLACE_HERE,'317','1','3','1','1'),
(103,'SHARE_FILE_ADDED',COMPANY_CODE_REPLACE_HERE,'318','1','3','2','1'),
(104,'SHARE_FILE_VERSION_ADDED',COMPANY_CODE_REPLACE_HERE,'319','1','3','2','1'),
(105,'SHARE_FILE_RENAMED',COMPANY_CODE_REPLACE_HERE,'320','1','3','2','1'),
(106,'SHARE_FILE_MOVED',COMPANY_CODE_REPLACE_HERE,'321','1','3','2','1'),
(107,'SHARE_FILE_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'322','1','3','2','1'),
(108,'SHARE_FILE_VIEWED',COMPANY_CODE_REPLACE_HERE,'323','1','3','2','1'),
(109,'SHARE_FILE_DOWNLOADED',COMPANY_CODE_REPLACE_HERE,'324','1','3','2','1'),
(110,'SHARE_FILE_HISTORY_DOWNLOADED',COMPANY_CODE_REPLACE_HERE,'326','1','3','2','1'),
(111,'SHARE_FILE_DELETED',COMPANY_CODE_REPLACE_HERE,'327','1','3','2','1'),
(112,'SHARE_FILE_RESTORED',COMPANY_CODE_REPLACE_HERE,'328','1','3','2','1'),
(113,'SHARE_FILE_ADD_ANNOTATION',COMPANY_CODE_REPLACE_HERE,'345','1','3','2','1'),
(114,'SHARE_FILE_DELETE_ANNOTATION',COMPANY_CODE_REPLACE_HERE,'346','1','3','2','1'),
(115,'LOCKER_LOGIN',COMPANY_CODE_REPLACE_HERE,'347','0','3','1','1'),
(116,'LOCKER_LOGOUT',COMPANY_CODE_REPLACE_HERE,'348','0','3','1','1'),
(117,'LOCKER_STATUS_CHANGE',COMPANY_CODE_REPLACE_HERE,'349','0','3','1','1'),
(118,'LINK_LOCKER_TO_CONTAINER',COMPANY_CODE_REPLACE_HERE,'350','0','3','1','1'),
(119,'UNLINK_LOCKER_FROM_CONTAINER',COMPANY_CODE_REPLACE_HERE,'351','0','3','1','1'),
(120,'BACKUP_CREATED',COMPANY_CODE_REPLACE_HERE,'401','1','1','3','1'),
(121,'BACKUP_UPDATED',COMPANY_CODE_REPLACE_HERE,'402','1','1','3','1'),
(122,'BACKUP_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'403','1','1','3','1'),
(123,'BACKUP_FOLDER_ADDED',COMPANY_CODE_REPLACE_HERE,'404','1','1','1','1'),
(124,'BACKUP_FOLDER_RENAMED',COMPANY_CODE_REPLACE_HERE,'405','1','1','1','1'),
(125,'BACKUP_FOLDER_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'406','1','1','1','1'),
(126,'BACKUP_FOLDER_DOWNLOAD',COMPANY_CODE_REPLACE_HERE,'407','1','1','1','1'),
(127,'BACKUP_FILE_ADDED',COMPANY_CODE_REPLACE_HERE,'408','1','1','2','1'),
(128,'BACKUP_FILE_VERSION_ADDED',COMPANY_CODE_REPLACE_HERE,'409','1','1','2','1'),
(129,'BACKUP_FILE_RENAMED',COMPANY_CODE_REPLACE_HERE,'410','1','1','2','1'),
(130,'BACKUP_FILE_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'411','1','1','2','1'),
(131,'BACKUP_FILE_VIEWED',COMPANY_CODE_REPLACE_HERE,'412','1','1','2','1'),
(132,'BACKUP_FILE_DOWNLOADED',COMPANY_CODE_REPLACE_HERE,'413','1','1','2','1'),
(133,'BACKUP_FILE_HISTORY_DOWNLOADED',COMPANY_CODE_REPLACE_HERE,'415','1','1','2','1'),
(134,'BACKUP_FILE_ADD_ANNOTATION',COMPANY_CODE_REPLACE_HERE,'427','1','1','2','1'),
(135,'BACKUP_FILE_DELETE_ANNOTATION',COMPANY_CODE_REPLACE_HERE,'428','1','1','2','1'),
(136,'BACKUP_FILE_GENERATE_PUBLIC_KEY',COMPANY_CODE_REPLACE_HERE,'429','1','1','2','1'),
(137,'BACKUP_FILE_REPUBLISH',COMPANY_CODE_REPLACE_HERE,'430','1','1','2','1'),
(138,'BACKUP_FOLDER_ADD_MAILDROP_FOLDER',COMPANY_CODE_REPLACE_HERE,'431','1','1','1','1'),
(139,'BACKUP_FOLDER_UPDATE_MAILDROP_FOLDER',COMPANY_CODE_REPLACE_HERE,'432','1','1','1','1'),
(140,'BACKUP_ADD_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'433','1','1','1','1'),
(141,'BACKUP_INVITE_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'434','1','1','1','1'),
(142,'BACKUP_REMOVE_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'435','1','1','1','1'),
(143,'MYFILES_CREATED',COMPANY_CODE_REPLACE_HERE,'501','1','5','3','1'),
(144,'MYFILES_FOLDER_ADDED',COMPANY_CODE_REPLACE_HERE,'502','1','5','1','1'),
(145,'MYFILES_FOLDER_RENAMED',COMPANY_CODE_REPLACE_HERE,'503','1','5','1','1'),
(146,'MYFILES_FOLDER_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'504','1','5','1','1'),
(147,'MYFILES_FOLDER_DOWNLOAD',COMPANY_CODE_REPLACE_HERE,'505','1','5','1','1'),
(148,'MYFILES_FILE_ADDED',COMPANY_CODE_REPLACE_HERE,'507','1','5','2','1'),
(149,'MYFILES_FILE_VERSION_ADDED',COMPANY_CODE_REPLACE_HERE,'508','1','5','2','1'),
(150,'MYFILES_FILE_RENAMED',COMPANY_CODE_REPLACE_HERE,'509','1','5','2','1'),
(151,'MYFILES_FILE_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'510','1','5','2','1'),
(152,'MYFILES_FILE_VIEWED',COMPANY_CODE_REPLACE_HERE,'511','1','5','2','1'),
(153,'MYFILES_FILE_DOWNLOADED',COMPANY_CODE_REPLACE_HERE,'512','1','5','2','1'),
(154,'MYFILES_FILE_HISTORY_DOWNLOADED',COMPANY_CODE_REPLACE_HERE,'514','1','5','2','1'),
(155,'MYFILES_FILE_ADD_ANNOTATION',COMPANY_CODE_REPLACE_HERE,'531','1','5','2','1'),
(156,'MYFILES_FILE_DELETE_ANNOTATION',COMPANY_CODE_REPLACE_HERE,'532','1','5','2','1'),
(157,'MYFILES_LINK_LOCKER',COMPANY_CODE_REPLACE_HERE,'533','0','5','3','1'),
(158,'MYFILES_UNLINK_LOCKER',COMPANY_CODE_REPLACE_HERE,'534','0','5','3','1'),
(159,'MYFILES_FILE_GENERATE_PUBLIC_KEY',COMPANY_CODE_REPLACE_HERE,'535','1','5','2','1'),
(160,'MYFILES_FILE_REPUBLISH',COMPANY_CODE_REPLACE_HERE,'536','1','5','2','1'),
(161,'MYFILES_FOLDER_ADD_MAILDROP_FOLDER',COMPANY_CODE_REPLACE_HERE,'537','1','5','1','1'),
(162,'MYFILES_FOLDER_UPDATE_MAILDROP_FOLDER',COMPANY_CODE_REPLACE_HERE,'538','1','5','1','1'),
(163,'MYFILES_ADD_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'539','1','5','1','1'),
(164,'MYFILES_INVITE_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'540','1','5','1','1'),
(165,'MYFILES_REMOVE_MAILDROP_FOLDER_MEMBER',COMPANY_CODE_REPLACE_HERE,'541','1','5','1','1'),
(166,'PROJECT_FOLDER_DELETED_FROM_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'131','1','2','1','1'),
(167,'PROJECT_FILE_DELETED_FROM_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'132','1','2','2','1'),
(168,'DEPARTMENT_FOLDER_DELETED_FROM_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'226','1','4','1','1'),
(169,'DEPARTMENT_FILE_DELETED_FROM_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'227','1','4','2','1'),
(170,'SHARE_FOLDER_DELETED_FROM_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'329','1','3','1','1'),
(171,'SHARE_FILE_DELETED_FROM_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'330','1','3','2','1'),
(172,'MYFILES_FOLDER_DELETED',COMPANY_CODE_REPLACE_HERE,'515','1','5','1','1'),
(173,'MYFILES_FILE_DELETED',COMPANY_CODE_REPLACE_HERE,'516','1','5','2','1'),
(174,'MYFILES_FOLDER_DELETED_FROM_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'517','1','5','1','1'),
(175,'MYFILES_FILE_DELETED_FROM_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'518','1','5','2','1'),
(176,'BACKUP_RESTORE_FROM_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'416','1','1','3','1'),
(177,'MYFILES_FILE_COPIED',COMPANY_CODE_REPLACE_HERE,'519','1','5','2','1'),
(178,'MYFILES_FILE_SHARE',COMPANY_CODE_REPLACE_HERE,'520','1','5','2','1'),
(179,'SHARE_FILE_SHARE',COMPANY_CODE_REPLACE_HERE,'332','1','3','2','1'),
(180,'SHARE_FILE_COPIED',COMPANY_CODE_REPLACE_HERE,'331','1','3','2','1'),
(181,'PROJECT_FILE_COPIED',COMPANY_CODE_REPLACE_HERE,'133','1','2','2','1'),
(182,'PROJECT_FILE_SHARE',COMPANY_CODE_REPLACE_HERE,'134','1','2','2','1'),
(183,'BACKUP_FILE_COPIED',COMPANY_CODE_REPLACE_HERE,'417','1','1','2','1'),
(184,'BACKUP_FILE_SHARE',COMPANY_CODE_REPLACE_HERE,'418','1','1','2','1'),
(185,'DEPARTMENT_FILE_SHARE',COMPANY_CODE_REPLACE_HERE,'229','1','4','2','1'),
(186,'DEPARTMENT_FILE_COPIED',COMPANY_CODE_REPLACE_HERE,'228','1','4','2','1'),
(187,'PROJECT_EMPTY_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'136','1','2','3','1'),
(188,'DEPARTMENT_EMPTY_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'231','1','4','3','1'),
(189,'SHARE_EMPTY_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'335','1','3','3','1'),
(190,'MYFILES_EMPTY_RECYCLE_BIN',COMPANY_CODE_REPLACE_HERE,'522','1','5','3','1'),
(191,'BACKUP_FILE_CHANGE_PUBLIC_ACCESS',COMPANY_CODE_REPLACE_HERE,'420','1','1','2','2'),
(192,'PROJECT_FILE_CHANGE_PUBLIC_ACCESS',COMPANY_CODE_REPLACE_HERE,'137','1','2','2','2'),
(193,'SHARE_FILE_CHANGE_PUBLIC_ACCESS',COMPANY_CODE_REPLACE_HERE,'336','1','3','2','2'),
(194,'DEPARTMENT_FILE_CHANGE_PUBLIC_ACCESS',COMPANY_CODE_REPLACE_HERE,'232','1','4','2','2'),
(195,'MYFILES_FILE_CHANGE_PUBLIC_ACCESS',COMPANY_CODE_REPLACE_HERE,'523','1','5','2','2'),
(196,'SHARE_FILE_DISTRIBUTE',COMPANY_CODE_REPLACE_HERE,'334','1','3','2','1'),
(197,'SHARE_FOLDER_SHARE',COMPANY_CODE_REPLACE_HERE,'333','1','3','1','1'),
(198,'PROJECT_FOLDER_SHARE',COMPANY_CODE_REPLACE_HERE,'135','1','2','1','1'),
(199,'DEPARTMENT_FOLDER_SHARE',COMPANY_CODE_REPLACE_HERE,'230','1','4','1','1'),
(200,'MYFILES_FOLDER_SHARE',COMPANY_CODE_REPLACE_HERE,'521','1','5','1','1'),
(201,'BACKUP_FOLDER_SHARE',COMPANY_CODE_REPLACE_HERE,'419','1','1','1','1'),
(202,'MYFILES_FILE_MOVED',COMPANY_CODE_REPLACE_HERE,'525','1','5','2','1'),
(203,'MYFILES_FOLDER_MOVED',COMPANY_CODE_REPLACE_HERE,'526','1','5','1','1'),
(204,'MYFILES_FOLDER_RESTORED',COMPANY_CODE_REPLACE_HERE,'524','1','5','1','1'),
(205,'PROJECT_MOVED_TO_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'138','1','2','3','1'),
(206,'PROJECT_RESTORED_FROM_RECYCLEBIN',COMPANY_CODE_REPLACE_HERE,'139','1','2','3','1'),
(207,'SHARE_FILE_DISTRIBUTION_SCHEDULED',COMPANY_CODE_REPLACE_HERE,'337','1','3','2','1'),
(208,'PROJECT_FILE_EDIT_PROPERTY',COMPANY_CODE_REPLACE_HERE,'140','1','2','2','1'),
(209,'PROJECT_FILE_ADD_TO_FAVORITES',COMPANY_CODE_REPLACE_HERE,'141','1','2','2','1'),
(210,'PROJECT_FOLDER_ADD_TO_FAVORITES',COMPANY_CODE_REPLACE_HERE,'142','1','2','1','1'),
(211,'PROJECT_FILE_ADD_COMMENT',COMPANY_CODE_REPLACE_HERE,'143','1','2','2','1'),
(212,'BACKUP_FILE_EDIT_PROPERTY',COMPANY_CODE_REPLACE_HERE,'421','1','1','2','1'),
(213,'BACKUP_FILE_ADD_TO_FAVORITES',COMPANY_CODE_REPLACE_HERE,'422','1','1','2','1'),
(214,'BACKUP_FOLDER_ADD_TO_FAVORITES',COMPANY_CODE_REPLACE_HERE,'423','1','1','1','1'),
(215,'BACKUP_FILE_ADD_COMMENT',COMPANY_CODE_REPLACE_HERE,'424','1','1','2','1'),
(216,'DEPARTMENT_FILE_EDIT_PROPERTY',COMPANY_CODE_REPLACE_HERE,'233','1','4','2','1'),
(217,'DEPARTMENT_FILE_ADD_TO_FAVORITES',COMPANY_CODE_REPLACE_HERE,'234','1','4','2','1'),
(218,'DEPARTMENT_FOLDER_ADD_TO_FAVORITES',COMPANY_CODE_REPLACE_HERE,'235','1','4','1','1'),
(219,'DEPARTMENT_FILE_ADD_COMMENT',COMPANY_CODE_REPLACE_HERE,'236','1','4','2','1'),
(220,'SHARE_FILE_EDIT_PROPERTY',COMPANY_CODE_REPLACE_HERE,'338','1','3','2','1'),
(221,'SHARE_FILE_ADD_TO_FAVORITES',COMPANY_CODE_REPLACE_HERE,'339','1','3','2','1'),
(222,'SHARE_FOLDER_ADD_TO_FAVORITES',COMPANY_CODE_REPLACE_HERE,'340','1','3','1','1'),
(223,'SHARE_FILE_ADD_COMMENT',COMPANY_CODE_REPLACE_HERE,'341','1','3','2','1'),
(224,'MYFILES_FILE_EDIT_PROPERTY',COMPANY_CODE_REPLACE_HERE,'527','1','5','2','1'),
(225,'MYFILES_FILE_ADD_TO_FAVORITES',COMPANY_CODE_REPLACE_HERE,'528','1','5','2','1'),
(226,'MYFILES_FOLDER_ADD_TO_FAVORITES',COMPANY_CODE_REPLACE_HERE,'529','1','5','1','1'),
(227,'MYFILES_FILE_ADD_COMMENT',COMPANY_CODE_REPLACE_HERE,'530','1','5','2','1'),
(228,'BACKUP_SUCCESS',COMPANY_CODE_REPLACE_HERE,'425','1','1','3','1'),
(229,'BACKUP_FAILED',COMPANY_CODE_REPLACE_HERE,'426','1','1','3','1'),
(230,'PROJECT_FOLDER_PERMISSION_REMOVED',COMPANY_CODE_REPLACE_HERE,'144','1','2','1','1'),
(231,'PROJECT_FILE_LOCKED',COMPANY_CODE_REPLACE_HERE,'145','1','2','2','1'),
(232,'PROJECT_FILE_UNLOCKED',COMPANY_CODE_REPLACE_HERE,'146','1','2','2','1'),
(233,'DEPARTMENT_FOLDER_PERMISSION_REMOVED',COMPANY_CODE_REPLACE_HERE,'237','1','4','1','1'),
(234,'DEPARTMENT_FILE_LOCKED',COMPANY_CODE_REPLACE_HERE,'238','1','4','2','1'),
(235,'DEPARTMENT_FILE_UNLOCKED',COMPANY_CODE_REPLACE_HERE,'239','1','4','2','1'),
(236,'SHARE_FOLDER_PERMISSION_REMOVED',COMPANY_CODE_REPLACE_HERE,'342','1','3','1','1'),
(237,'SHARE_FILE_LOCKED',COMPANY_CODE_REPLACE_HERE,'343','1','3','2','1'),
(238,'SHARE_FILE_UNLOCKED',COMPANY_CODE_REPLACE_HERE,'344','1','3','2','1'),
(239,'USER_ADDED',COMPANY_CODE_REPLACE_HERE,'901','0','6','3','1'),
(240,'USER_UPDATED',COMPANY_CODE_REPLACE_HERE,'902','0','6','3','1'),
(241,'USER_DELETED',COMPANY_CODE_REPLACE_HERE,'903','0','6','3','1'),
(242,'USER_STATUS_UPDATED',COMPANY_CODE_REPLACE_HERE,'904','0','6','3','1'),
(243,'USER_UNLOCKED',COMPANY_CODE_REPLACE_HERE,'905','0','6','3','1'),
(244,'USER_PROFILE_SET',COMPANY_CODE_REPLACE_HERE,'906','0','6','3','1'),
(245,'PROFILE_IMAGE_SET',COMPANY_CODE_REPLACE_HERE,'907','0','6','3','1'),
(246,'REMOVED_PROFILE_IMAGE',COMPANY_CODE_REPLACE_HERE,'908','0','6','3','1'),
(247,'RESET_PWD_BY_FORGOT_PWD',COMPANY_CODE_REPLACE_HERE,'909','0','6','3','1'),
(248,'RESET_PWD_BY_ADMIN',COMPANY_CODE_REPLACE_HERE,'910','0','6','3','1'),
(249,'RESET_PWD_BY_USER',COMPANY_CODE_REPLACE_HERE,'911','0','6','3','1'),
(250,'SETTINGS_CHANGED',COMPANY_CODE_REPLACE_HERE,'912','0','6','3','1'),
(251,'FEATURE_SETTINGS_CHANGED',COMPANY_CODE_REPLACE_HERE,'913','0','6','3','1'),
(252,'GROUP_ADDED',COMPANY_CODE_REPLACE_HERE,'914','0','6','3','1'),
(253,'GROUP_UPDATED',COMPANY_CODE_REPLACE_HERE,'915','0','6','3','1'),
(254,'DEVICE_ADDED',COMPANY_CODE_REPLACE_HERE,'916','0','6','3','1'),
(255,'DEVICE_DELETED',COMPANY_CODE_REPLACE_HERE,'917','0','6','3','1'),
(256,'DEVICE_USER_ADDED',COMPANY_CODE_REPLACE_HERE,'918','0','6','3','1'),
(257,'DEVICE_USER_DELETED',COMPANY_CODE_REPLACE_HERE,'919','0','6','3','1'),
(258,'DEVICE_ACTIVATED',COMPANY_CODE_REPLACE_HERE,'920','0','6','3','1'),
(259,'DEVICE_BLOCKED',COMPANY_CODE_REPLACE_HERE,'921','0','6','3','1'),
(260,'DEVICE_USER_ACTIVATED',COMPANY_CODE_REPLACE_HERE,'922','0','6','3','1'),
(261,'DEVICE_USER_BLOCKED',COMPANY_CODE_REPLACE_HERE,'923','0','6','3','1'),
(262,'USER_ALLOCATED',COMPANY_CODE_REPLACE_HERE,'924','0','6','3','1'),
(263,'USER_DEALLOCATED',COMPANY_CODE_REPLACE_HERE,'925','0','6','3','1'),
(264,'BACKUP_DELETED',COMPANY_CODE_REPLACE_HERE,'926','0','6','3','1'),
(265,'ERROR_LOG_DOWNLOADED',COMPANY_CODE_REPLACE_HERE,'927','0','6','3','1'),
(266,'DEVICE_LOG_DOWNLOAD',COMPANY_CODE_REPLACE_HERE,'928','0','6','3','1'),
(267,'USER_TYPE_CHANGED',COMPANY_CODE_REPLACE_HERE,'929','0','6','3','1'),
(268,'USER_ALLOCATED_TO_DEPARTMENT',COMPANY_CODE_REPLACE_HERE,'930','0','6','3','1'),
(269,'PARTNER_ADDED',COMPANY_CODE_REPLACE_HERE,'931','0','6','3','1'),
(270,'PARTNER_UPDATED',COMPANY_CODE_REPLACE_HERE,'932','0','6','3','1'),
(271,'PARTNER_LOGO_SET',COMPANY_CODE_REPLACE_HERE,'933','0','6','3','1'),
(272,'PARTNER_LOGO_REMOVED',COMPANY_CODE_REPLACE_HERE,'934','0','6','3','1'),
(273,'PARTNER_BLOCKED',COMPANY_CODE_REPLACE_HERE,'935','0','6','3','1'),
(274,'PARTNER_UNBLOCKED',COMPANY_CODE_REPLACE_HERE,'936','0','6','3','1'),
(275,'SET_TXN_PASSWORD_BY_USER',COMPANY_CODE_REPLACE_HERE,'937','0','6','3','1'),
(276,'RESET_TXN_PASSWORD_BY_USER',COMPANY_CODE_REPLACE_HERE,'938','0','6','3','1'),
(277,'RESET_TXN_PASSWORD_BY_ADMIN',COMPANY_CODE_REPLACE_HERE,'939','0','6','3','1'),
(278,'RESET_FORGOTTEN_TXN_PASSWORD_BY_ADMIN',COMPANY_CODE_REPLACE_HERE,'940','0','6','3','1'),
(279,'COMPANY_QUOTA_SET',COMPANY_CODE_REPLACE_HERE,'941','0','6','3','1'),
(280,'USER_LOGIN',COMPANY_CODE_REPLACE_HERE,'942','0','6','3','1'),
(281,'USER_LOGOUT',COMPANY_CODE_REPLACE_HERE,'943','0','6','3','1'),
(282,'LDAP_SETTINGS_ADD',COMPANY_CODE_REPLACE_HERE,'944','0','6','3','1'),
(283,'LDAP_SETTINGS_UPDATE',COMPANY_CODE_REPLACE_HERE,'945','0','6','3','1'),
(284,'REMINDER_CREATE_BY_USER',COMPANY_CODE_REPLACE_HERE,'1001','0','6','3','1'),
(285,'REMINDER_EDIT_BY_USER',COMPANY_CODE_REPLACE_HERE,'1002','0','6','3','1'),
(286,'REMINDER_DELETE_BY_USER',COMPANY_CODE_REPLACE_HERE,'1003','0','6','3','1'),
(287,'WORKFLOW_DEFINITION_CREATE',COMPANY_CODE_REPLACE_HERE,'1100','0','6','3','1'),
(288,'WORKFLOW_DEFINITION_UPDATE',COMPANY_CODE_REPLACE_HERE,'1101','0','6','3','1'),
(289,'WORKFLOW_INSTANCE_CREATION',COMPANY_CODE_REPLACE_HERE,'1102','0','6','3','1'),
(290,'WORKFLOW_INSTANCE_CANCELED',COMPANY_CODE_REPLACE_HERE,'1103','0','6','3','1'),
(291,'WORKFLOW_INSTANCE_COMPLETED',COMPANY_CODE_REPLACE_HERE,'1104','0','6','3','1'),
(292,'WORKFLOW_TASK_REASSIGN_BY_USER',COMPANY_CODE_REPLACE_HERE,'1105','0','6','3','1'),
(293,'WORKFLOW_TASK_REASSIGN_BY_ADMIN',COMPANY_CODE_REPLACE_HERE,'1106','0','6','3','1'),
(294,'WORKFLOW_TASK_COMPLETE_BY_ASSIGNEE',COMPANY_CODE_REPLACE_HERE,'1107','0','6','3','1'),
(295,'WORKFLOW_TASK_COMPLETE',COMPANY_CODE_REPLACE_HERE,'1108','0','6','3','1'),
(296,'WORKFLOW_TASK_STARTED',COMPANY_CODE_REPLACE_HERE,'1109','0','6','3','1'),
(297,'WORKFLOW_TASK_QUERY_CREATE',COMPANY_CODE_REPLACE_HERE,'1110','0','6','3','1'),
(298,'WORKFLOW_TASK_QUERY_DELETE',COMPANY_CODE_REPLACE_HERE,'1111','0','6','3','1'),
(299,'WORKFLOW_TASK_QUERY_COMPLETE',COMPANY_CODE_REPLACE_HERE,'1112','0','6','3','1'),
(300,'WORKFLOW_DEFINITION_ADD_GROUP_MEMBER',COMPANY_CODE_REPLACE_HERE,1113,0,'6','3',1),
(301,'WORKFLOW_DEFINITION_DELETE_GROUP_MEMBER',COMPANY_CODE_REPLACE_HERE,1114,0,'6','3',1),
(302,'WORKFLOW_DEFINITION_DELETE_USER_MEMBER',COMPANY_CODE_REPLACE_HERE,1115,0,'6','3',1),
(303,'WORKFLOW_DEFINITION_DELETE_OWNER_MEMBER',COMPANY_CODE_REPLACE_HERE,1116,0,'6','3',1),
(304,'WORKFLOW_DEFINITION_DELETE_OBSERVER_MEMBER',COMPANY_CODE_REPLACE_HERE,1117,0,'6','3',1),
(305,'WORKFLOW_DEFINITION_ADD_USER_MEMBER',COMPANY_CODE_REPLACE_HERE,1118,0,'6','3',1),
(306,'WORKFLOW_DEFINITION_ADD_OWNER_MEMBER',COMPANY_CODE_REPLACE_HERE,1119,0,'6','3',1),
(307,'WORKFLOW_DEFINITION_ADD_OBSERVER_MEMBER',COMPANY_CODE_REPLACE_HERE,1120,0,'6','3',1),
(308,'WORKFLOW_DEFINITION_DELETE',COMPANY_CODE_REPLACE_HERE,1121,0,'6','3',1),
(309,'WORKFLOW_TASK_FILE_ADDED',COMPANY_CODE_REPLACE_HERE,1122,0,'6','3',1),
(310,'WORKFLOW_TASK_FILE_DELETED',COMPANY_CODE_REPLACE_HERE,1123,0,'6','3',1),
(311,'BACKUP_DELETED_BY_USER',COMPANY_CODE_REPLACE_HERE,'436','1','1','3','1'),
(312,'CONTACT_CREATE',COMPANY_CODE_REPLACE_HERE,1124,0,'6','3',1),
(313,'CONTACT_UPDATE',COMPANY_CODE_REPLACE_HERE,1125,0,'6','3',1),
(314,'CONTACT_DELETE',COMPANY_CODE_REPLACE_HERE,1126,0,'6','3',1),
(315,'CONTACT_GROUP_CREATE',COMPANY_CODE_REPLACE_HERE,1127,0,'6','3',1),
(316,'CONTACT_GROUP_UPDATE',COMPANY_CODE_REPLACE_HERE,1128,0,'6','3',1),
(317,'CONTACT_GROUP_DELETE',COMPANY_CODE_REPLACE_HERE,1129,0,'6','3',1),
(318,'CONTACT_CATEGORY_CREATE',COMPANY_CODE_REPLACE_HERE,1130,0,'6','3',1),
(319,'CONTACT_CATEGORY_UPDATED',COMPANY_CODE_REPLACE_HERE,1131,0,'6','3',1),
(320,'CONTACT_CATEGORY_DELETE',COMPANY_CODE_REPLACE_HERE,1132,0,'6','3',1),
(321,'USER_LOGIN_ATTEMPT_FAILED',COMPANY_CODE_REPLACE_HERE,'946','0','6','3','1'),
(322,'USER_LOCKED',COMPANY_CODE_REPLACE_HERE,'947','0','6','3','1'),
(323,'PROJECT_QUOTA_ALERT_PERCENTAGE_REACHED',COMPANY_CODE_REPLACE_HERE,'159','1','2','2','1'),
(324,'DEPARTMENT_QUOTA_ALERT_PERCENTAGE_REACHED',COMPANY_CODE_REPLACE_HERE,'252','1','4','2','1'),
(325,'SHARE_QUOTA_ALERT_PERCENTAGE_REACHED',COMPANY_CODE_REPLACE_HERE,'360','1','3','2','1'),
(326,'BACKUP_QUOTA_ALERT_PERCENTAGE_REACHED',COMPANY_CODE_REPLACE_HERE,'437','1','1','2','1'),
(327,'MYFILES_QUOTA_ALERT_PERCENTAGE_REACHED',COMPANY_CODE_REPLACE_HERE,'542','1','5','2','1'),
(328,'ROLE_ADDED',COMPANY_CODE_REPLACE_HERE,'1150','0','6','3','1'),
(329,'ROLE_UPDATED',COMPANY_CODE_REPLACE_HERE,'1151','0','6','3','1'),
(330,'PROJECT_TEMPLATE_CREATED',COMPANY_CODE_REPLACE_HERE,'1152','0','6','3','1'),
(331,'PROJECT_TEMPLATE_UPDATED',COMPANY_CODE_REPLACE_HERE,'1153','0','6','3','1'),
(332,'PROJECT_TEMPLATE_DELETED',COMPANY_CODE_REPLACE_HERE,'1154','0','6','3','1'),
(333,'PROJECT_CATEGORY_ADDED',COMPANY_CODE_REPLACE_HERE,'1155','0','6','3','1'),
(334,'PROJECT_CATEGORY_UPDATED',COMPANY_CODE_REPLACE_HERE,'1156','0','6','3','1'),
(335,'PROJECT_TEMPLATE_RESTORED',COMPANY_CODE_REPLACE_HERE,'1157','0','6','3','1'),
(336,'COLLABORATION_EMAIL_ADDED',COMPANY_CODE_REPLACE_HERE,'1158','0','6','3','1'),
(337,'COLLABORATION_EMAIL_UPDATED',COMPANY_CODE_REPLACE_HERE,'1159','0','6','3','1'),
(338,'COLLABORATION_EMAIL_DELETED',COMPANY_CODE_REPLACE_HERE,'1160','0','6','3','1'),
(339,'COLLABORATION_EMAIL_STATUS_UPDATED',COMPANY_CODE_REPLACE_HERE,'1161','0','6','3','1'),
(340,'SET_PROJECT_SETTINGS',COMPANY_CODE_REPLACE_HERE,'160','1','2','2','1'),
(341,'PROJECT_EMAIL_SETTINGS_REMOVED',COMPANY_CODE_REPLACE_HERE,'161','1','2','2','1'),
(342,'UNDO_FILE_CHECKOUT',COMPANY_CODE_REPLACE_HERE,'162','1','2','2','1'),
(343,'STORAGE_ADDED',COMPANY_CODE_REPLACE_HERE,'1162','0','6','3','1'),
(344,'STORAGE_UPDATED',COMPANY_CODE_REPLACE_HERE,'1163','0','6','3','1'),
(345,'STORAGE_DELETED',COMPANY_CODE_REPLACE_HERE,'1164','0','6','3','1'),
(346,'REGION_ADDED',COMPANY_CODE_REPLACE_HERE,'1165','0','6','3','1'),
(347,'REGION_UPDATED',COMPANY_CODE_REPLACE_HERE,'1166','0','6','3','1'),
(348,'REGION_DELETED',COMPANY_CODE_REPLACE_HERE,'1167','0','6','3','1'),
(349,'PROJECT_FOLDER_EMPTY',COMPANY_CODE_REPLACE_HERE,'163','1','2','1','1'),
(350,'DEPARTMENT_FOLDER_EMPTY',COMPANY_CODE_REPLACE_HERE,'253','1','4','1','1'),
(351,'SHARE_FOLDER_EMPTY',COMPANY_CODE_REPLACE_HERE,'361','1','3','1','1'),
(352,'MYFILES_FOLDER_EMPTY',COMPANY_CODE_REPLACE_HERE,'543','1','5','1','1'),
(353,'PROJECT_SETTINGS_UPDATED',COMPANY_CODE_REPLACE_HERE,'164','0','2','1','1'),
(354,'DEPARTMENT_SETTINGS_UPDATED',COMPANY_CODE_REPLACE_HERE,'254','0','4','1','1'),
(355,'SHARE_SETTINGS_UPDATED',COMPANY_CODE_REPLACE_HERE,'362','0','3','1','1'),
(356,'PROJECT_FILE_DICOM_IMPORT',COMPANY_CODE_REPLACE_HERE,'165','1','2','2','1'),
(357,'DEPARTMENT_FILE_DICOM_IMPORT',COMPANY_CODE_REPLACE_HERE,'255','1','4','2','1'),
(358,'SHARE_FILE_DICOM_IMPORT',COMPANY_CODE_REPLACE_HERE,'363','1','3','2','1'),
(359,'BACKUP_FILE_DICOM_IMPORT',COMPANY_CODE_REPLACE_HERE,'438','1','1','2','1'),
(360,'MYFILES_FILE_DICOM_IMPORT',COMPANY_CODE_REPLACE_HERE,'544','1','5','2','1'),
(361,'WORKFLOW_CATEGORY_ADDED',COMPANY_CODE_REPLACE_HERE,'1168','0','6','3','1'),
(362,'WORKFLOW_CATEGORY_UPDATED',COMPANY_CODE_REPLACE_HERE,'1169','0','6','3','1'),
(363,'WORKFLOW_CATEGORY_DELETED',COMPANY_CODE_REPLACE_HERE,'1170','0','6','3','1'),
(364,'WORKFLOW_DEFINITION_RESTORED',COMPANY_CODE_REPLACE_HERE,'1171','1','6','3','1'),
(365,'PROJECT_CATEGORY_DELETED',COMPANY_CODE_REPLACE_HERE,'1200','0','6','3','1'),
(366,'PROJECT_CATEGORY_MASTER_ADDED',COMPANY_CODE_REPLACE_HERE,'1201','0','6','3','1'),
(367,'PROJECT_CATEGORY_MASTER_UPDATED',COMPANY_CODE_REPLACE_HERE,'1202','0','6','3','1'),
(368,'PROJECT_CATEGORY_MASTER_DELETED',COMPANY_CODE_REPLACE_HERE,'1203','1','6','3','1'),
(369,'PASSWORD_POLICY_UPDATED', COMPANY_CODE_REPLACE_HERE, '1204', '0', '6', '3', '1'),
(370,'WKF_ADHOC_REPORT_TEMPLATE_ADDED',COMPANY_CODE_REPLACE_HERE,'1205','0','6','3','1'),
(371,'WKF_ADHOC_REPORT_TEMPLATE_EDITED',COMPANY_CODE_REPLACE_HERE,'1206','0','6','3','1'),
(372,'WKF_ADHOC_REPORT_TEMPLATE_DELETED',COMPANY_CODE_REPLACE_HERE,'1207','0','6','3','1'),
(373,'WKF_ADHOC_REPORT_TEMPLATE_RUN',COMPANY_CODE_REPLACE_HERE,'1208','0','6','3','1');

CREATE TABLE `backup_txn_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`backup_txn_id` INT UNSIGNED NOT NULL,
`activity` TINYINT UNSIGNED NOT NULL,
`object_type` ENUM('1','2') NOT NULL COMMENT '1 = Folder 2 = File',
`relative_path` VARCHAR(800) NOT NULL,
`activity_status` TINYINT NOT NULL,
`old_value` VARCHAR(120) DEFAULT NULL,
`new_value` VARCHAR(120) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`modified_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_BACKUP_TXN_LOG_BACKUP_TXN_ID` FOREIGN KEY (`backup_txn_id`) REFERENCES `backup_txn` (`id`)
) ENGINE=INNODB;

CREATE TABLE `project_member` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'project_id',
`user_id` INT UNSIGNED NOT NULL,
`role_id` INT UNSIGNED DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
CONSTRAINT `FK_PROJECT_MEMBER_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`),
CONSTRAINT `FK_PROJECT_MEMBER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`), 
CONSTRAINT `FK_PROJECT_MEMBER_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`), 
KEY `IDX_PROJECT_MEMBER_COMBINED` (`container_id`,`user_id`),
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `department_member` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'department_id',
`user_id` INT UNSIGNED NOT NULL,
`role_id` INT UNSIGNED DEFAULT NULL,
`created_by` INT DEFAULT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
CONSTRAINT `FK_DEPARTMENT_MEMBER_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`),
CONSTRAINT `FK_DEPARTMENT_MEMBER_CONTAINER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`), 
CONSTRAINT `FK_DEPARTMENT_MEMBER_CONTAINER_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`), 
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `share_member` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'share_id',
`user_id` INT UNSIGNED NOT NULL,
`role_id` INT UNSIGNED DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
CONSTRAINT `FK_SHARE_MEMBER_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`),
CONSTRAINT `FK_SHARE_MEMBER_CONTAINER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`), 
CONSTRAINT `FK_SHARE_MEMBER_CONTAINER_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`), 
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `project_member_group` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'project_id',
`user_group_id` INT UNSIGNED NOT NULL,
`role_id` INT UNSIGNED DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
CONSTRAINT `FK_PROJECT_MEMBER_GROUP_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`),
CONSTRAINT `FK_PROJECT_MEMBER_GROUP_CONTAINER_USER_GROUP_ID` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`), 
CONSTRAINT `FK_PROJECT_MEMBER_GROUP_CONTAINER_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`), 
KEY `IDX_PROJECT_MEMBER_GROUP_COMBINED` (`container_id`,`user_group_id`),
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `department_member_group` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'department_id',
`user_group_id` INT UNSIGNED NOT NULL,
`role_id` INT UNSIGNED DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
CONSTRAINT `FK_DEPARTMENT_MEMBER_GROUP_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`),
CONSTRAINT `FK_DEPARTMENT_MEMBER_GROUP_CONTAINER_USER_GROUP_ID` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`), 
CONSTRAINT `FK_DEPARTMENT_MEMBER_GROUP_CONTAINER_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`), 
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `share_member_group` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'share_id',
`user_group_id` INT UNSIGNED NOT NULL,
`role_id` INT UNSIGNED DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
CONSTRAINT `FK_SHARE_MEMBER_GROUP_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`),
CONSTRAINT `FK_SHARE_MEMBER_GROUP_CONTAINER_USER_GROUP_ID` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`), 
CONSTRAINT `FK_SHARE_MEMBER_GROUP_CONTAINER_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`), 
PRIMARY KEY (`id`)
) ENGINE=INNODB;

INSERT INTO `share_member_group`(id,container_id,user_group_id,role_id,created_by,created_date) VALUES 
(1,1,1,8,1,NOW()),
(2,2,1,8,1,NOW()),
(3,3,1,8,1,NOW()),
(4,4,1,8,1,NOW());

CREATE TABLE `company_setting_config`(
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`key` VARCHAR(100) NOT NULL,
`value` VARCHAR(400) NOT NULL,
`company_code` VARCHAR(100) NOT NULL,
`status_id` TINYINT NOT NULL,
`updated_by` INT DEFAULT NULL,	
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_COMPANY_SETTING_CONFIG_COMPANY_CODE` (`company_code`)
) ENGINE=INNODB;

CREATE TABLE `company_feature_config`(
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`key` VARCHAR(100) NOT NULL,
`value` VARCHAR(300) NOT NULL,
`company_code` VARCHAR(100) NOT NULL,
`status_id` TINYINT NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_COMPANY_FEATURE_CONFIG_COMPANY_CODE` (`company_code`)
) ENGINE=INNODB;


CREATE TABLE `category_type_master` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`comments` VARCHAR(100) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_CATEGORY_TYPE_MASTER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

insert into category_type_master (`id`, `name`,`status_id`,`created_by`,`created_date`) VALUES 
(1,'Audio',1,1,NOW()),
(2,'Video',1,1,NOW()),
(3,'Document',1,1,NOW()),
(4,'Other',1,1,NOW()),
(5,'Images',1,1,NOW());


CREATE TABLE `category_type_master_language` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`category_type_master_id` INT UNSIGNED NOT NULL,
`language_id` INT UNSIGNED NOT NULL,
`category_name` VARCHAR (200) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_CATEGORY_TYPE_MASTER_LANGUAGE_CATEGORY_TYPE_MASTER_ID` FOREIGN KEY (`category_type_master_id`) REFERENCES `category_type_master` (`id`),
CONSTRAINT `FK_CATEGORY_TYPE_MASTER_LANGUAGE_LANGUAGE_ID` FOREIGN KEY (`language_id`) REFERENCES `language_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `file_type` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`category_type_master_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`extension` VARCHAR(50) NOT NULL,
`name` VARCHAR(100) NOT NULL,
`is_publish_enabled` TINYINT NOT NULL,
`is_index_enabled` TINYINT NOT NULL,
`is_upload_enabled` TINYINT NOT NULL,
`is_publishable` TINYINT NOT NULL,
`is_indexable` TINYINT NOT NULL,
`max_file_size` INT DEFAULT NULL,
`content_type_file` VARCHAR(100) DEFAULT NULL,
`content_type_image` VARCHAR(100) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
 CONSTRAINT `FK_FILE_TYPE_CATEGORY_TYPE_MASTER_ID` FOREIGN KEY (`category_type_master_id`) REFERENCES `category_type_master` (`id`),
 CONSTRAINT `FK_FILE_TYPE_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB
COMMENT = 'Master Table';

INSERT INTO `file_type` (`id`, `category_type_master_id`, `status_id`, `extension`, `name`, `created_by`, `created_date`,`is_publish_enabled`,`is_index_enabled`,content_type_file,content_type_image,company_code,is_upload_enabled,is_publishable,is_indexable) VALUES
('1','3','1','PPT','Powerpoint','1',NOW(),1,1,'application/vnd.ms-powerpoint','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1),
('2','3','1','DOC','Word','1',NOW(),1,1,'application/msword','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1),
('3','3','1','PDF','PDF','1',NOW(),1,1,'application/pdf','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1),
('4','3','1','XLS','Excel','1',NOW(),1,1,'application/vnd.ms-excel','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1),
('5','3','1','PPTX','Powerpoint','1',NOW(),1,1,'application/vnd.openxmlformats-officedocument.presentationml.presentation','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1),
('6','3','1','DOCX','Word','1',NOW(),1,1,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1),
('7','3','1','XLSX','Excel','1',NOW(),1,1,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1),
('8','3','1','RTF','Rich Text Format','1',NOW(),1,1,'application/rtf','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1),
('9','5','1','JPG','JPG Format','1',NOW(),1,0,'image/jpeg','image/jpg',COMPANY_CODE_REPLACE_HERE,1,1,0),
('10','5','1','JPEG','JPG Format','1',NOW(),1,0,'image/jpeg','image/jpg',COMPANY_CODE_REPLACE_HERE,1,1,0),
('11','5','1','BMP','Windows Bitmap','1',NOW(),1,0,'image/bmp','image/png',COMPANY_CODE_REPLACE_HERE,1,1,0),
('12','5','1','PNG','Portable Network Graphics','1',NOW(),1,0,'image/png','image/png',COMPANY_CODE_REPLACE_HERE,1,1,0),
('13','5','1','GIF','Graphic Interchange Format','1',NOW(),1,0,'image/gif','image/png',COMPANY_CODE_REPLACE_HERE,1,1,0),
('14','5','1','TIF','Tagged Image File Format(TIFF)','1',NOW(),1,0,'image/tiff','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('15','2','1','AVI','AVI Format','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('16','2','1','WMV','Windows Media Video Format','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('17','2','1','MPG','Mpeg Video Format','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('18','2','1','MP4','Mpeg4 Video Format','1',NOW(),0,0,'video/mp4',NULL,COMPANY_CODE_REPLACE_HERE,1,0,0),
('19','2','1','3GP','3GPP Video Format','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('20','2','1','MOV','QuickTime Video Format','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('21','2','1','M4V','Mpeg4 Video Format','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('22','1','1','WAV','WAVE Audio Format','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('23','1','1','WMA','Windows Media Audio Format','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('24','1','1','OGG','Ogg Vorbis Format','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('25','1','1','AAC','Advanced Audio Coding','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('26','1','1','MP3','MP3','1',NOW(),0,0,'video/mp4',NULL,COMPANY_CODE_REPLACE_HERE,1,0,0),
('27','4','1','ZIP','ZIP Archive Format','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('28','4','1','RAR','RAR Archive format','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('29','3','1','TXT','Text File','1',NOW(),0,1,'application/octet-stream','text/plain',COMPANY_CODE_REPLACE_HERE,1,0,0),
('30','2','1','SWF','SWF File','1',NOW(),0,0,'application/x-shockwave-flash','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('31','4','1','other','Others','1',NOW(),0,0,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('32','5','1','DWG','AutoCAD','1',NOW(),1,1,'application/acad','image/svg+xml',COMPANY_CODE_REPLACE_HERE,1,1,1),
('33','5','1','DXF','Drawing eXchange Format','1',NOW(),1,1,'application/dxf','image/svg+xml',COMPANY_CODE_REPLACE_HERE,1,1,1),
('34','3','1','HWP','Hangul','1',NOW(),1,1,'application/octet-stream','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1),
('35','4','1','EMAIL','Email','1',NOW(),1,1,'application/octet-stream','text/plain',COMPANY_CODE_REPLACE_HERE,1,1,1),
('36','4','1','SVG','Scalable Vector Graphics','1',NOW(),1,0,'application/svg','image/svg+xml',COMPANY_CODE_REPLACE_HERE,1,1,0),
('37','4','1','SDN','SD Note','1',NOW(),1,1,'application/octet-stream','text/plain',COMPANY_CODE_REPLACE_HERE,1,1,1),
('38','5','1','GDS','GDS','1',NOW(),1,0,'application/octet-stream','image/jpg',COMPANY_CODE_REPLACE_HERE,1,1,0),
('39','5','1','GDSII','GDSII','1',NOW(),1,0,'application/octet-stream','image/jpg',COMPANY_CODE_REPLACE_HERE,1,1,0),
('40','5','1','GDS2','GDS2','1',NOW(),1,0,'application/octet-stream','image/jpg',COMPANY_CODE_REPLACE_HERE,1,1,0),
('41','3','1','DCM','Dicom','1',NOW(),0,0,'Application/dicom','image/png',COMPANY_CODE_REPLACE_HERE,1,0,0),
('42','5','1','DWF','AutoCAD','1',NOW(),1,1,'application/acad','image/svg+xml',COMPANY_CODE_REPLACE_HERE,1,1,1),
('43','3','1','ODT','Writer','1',NOW(),1,1,'application/msword','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1),
('44','3','1','ODS','Calc','1',NOW(),1,1,'application/vnd.ms-excel','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1),
('45','3','1','ODP','Impress','1',NOW(),1,1,'application/vnd.ms-powerpoint','image/png',COMPANY_CODE_REPLACE_HERE,1,1,1);

CREATE TABLE `project_folder_role_permission` ( 
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
`role_id` INT UNSIGNED DEFAULT NULL,
`folder_id` INT UNSIGNED NOT NULL COMMENT 'project_folder_id',
`container_id` INT UNSIGNED NOT NULL COMMENT 'project',
`permission_set_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_PFRP_ROLE_ID_FOLDER_ID` (`role_id`, `folder_id`),
CONSTRAINT `FK_PROJECT_FOLDER_ROLE_PERMISSION_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
CONSTRAINT `FK_PROJECT_FOLDER_ROLE_PERMISSION_FOLDER_ID` FOREIGN KEY (`folder_id`) REFERENCES `project_folder` (`id`),
CONSTRAINT `FK_PROJECT_FOLDER_ROLE_PERMISSION_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`)
) ENGINE=INNODB;

CREATE TABLE `department_folder_role_permission` ( 
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
`role_id` INT UNSIGNED DEFAULT NULL,
`folder_id` INT UNSIGNED NOT NULL COMMENT 'department_folder_id',
`container_id` INT UNSIGNED NOT NULL COMMENT 'department',
`permission_set_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_DFRP_ROLE_ID_FOLDER_ID` (`role_id`, `folder_id`),
CONSTRAINT `FK_DEPARTMENT_FOLDER_ROLE_PERMISSION_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
CONSTRAINT `FK_DEPARTMENT_FOLDER_ROLE_PERMISSION_FOLDER_ID` FOREIGN KEY (`folder_id`) REFERENCES `department_folder` (`id`),
CONSTRAINT `FK_DEPARTMENT_FOLDER_ROLE_PERMISSION_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`)
) ENGINE=INNODB;

CREATE TABLE `share_folder_role_permission` ( 
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
`role_id` INT UNSIGNED DEFAULT NULL,
`folder_id` INT UNSIGNED NOT NULL COMMENT 'share_folder_id',
`container_id` INT UNSIGNED NOT NULL COMMENT 'share',
`permission_set_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_SFRP_ROLE_ID_FOLDER_ID` (`role_id`, `folder_id`),
CONSTRAINT `FK_SHARE_FOLDER_ROLE_PERMISSION_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
CONSTRAINT `FK_SHARE_FOLDER_ROLE_PERMISSION_FOLDER_ID` FOREIGN KEY (`folder_id`) REFERENCES `share_folder` (`id`),
CONSTRAINT `FK_SHARE_FOLDER_ROLE_PERMISSION_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`)
) ENGINE=INNODB;

CREATE TABLE `distribution` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`share_file_id` INT UNSIGNED NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`subject` VARCHAR(1024) DEFAULT NULL,
`message` VARCHAR(1024) DEFAULT NULL,
`link` VARCHAR(1024) NOT NULL,
`view_count` INT DEFAULT '0',
`download_count` INT DEFAULT '0',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_DISTRIBUTION_SHARE_FILE_ID` FOREIGN KEY (`share_file_id`) REFERENCES `share_file` (`id`),
CONSTRAINT `FK_DISTRIBUTION_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `distribution_map` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`distribution_id` INT UNSIGNED NOT NULL,
`status_id` INT UNSIGNED DEFAULT '1',
`type` ENUM('1','2') COMMENT 'USER,GROUP',
`type_id` INT NOT NULL,  
`read_status` INT UNSIGNED DEFAULT 0,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_DISTRIBUTION_MAP_DISTRIBUTION_ID` FOREIGN KEY (`distribution_id`) REFERENCES `distribution` (`id`),
CONSTRAINT `FK_DISTRIBUTION_MAP_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `backup_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'backup',
`container_name` VARCHAR(200) NOT NULL,
`company_code` VARCHAR(100) NOT NULL,
`action_id` INT UNSIGNED NOT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`action_user_id` INT UNSIGNED DEFAULT NULL,
`txn_id` INT UNSIGNED DEFAULT NULL,
`file_count` INT UNSIGNED DEFAULT 0,
`file_size` BIGINT UNSIGNED DEFAULT 0,
`file_version_size` BIGINT UNSIGNED DEFAULT NULL,
`file_version_count`  INT DEFAULT 0,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`action_user_ip` VARCHAR(200) DEFAULT NULL,
`log_details` TEXT DEFAULT NULL,
`action_date` DATETIME(3) NOT NULL,
`comments` VARCHAR(200) NULL,
PRIMARY KEY (`id`),
KEY `IDX_BACKUP_LOG_COMPANY_CODE` (`company_code`)
) ENGINE=INNODB;

CREATE TABLE `department_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'Department',
`container_name` VARCHAR(200) NOT NULL,
`company_code` VARCHAR(100) NOT NULL,
`action_id` INT UNSIGNED NOT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`action_user_id` INT UNSIGNED DEFAULT NULL,
`txn_id` INT UNSIGNED DEFAULT NULL,
`file_count` INT UNSIGNED DEFAULT 0,
`file_size` BIGINT UNSIGNED DEFAULT 0,
`file_version_size` BIGINT UNSIGNED DEFAULT NULL,
`file_version_count`  INT DEFAULT 0,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`action_user_ip` VARCHAR(200) DEFAULT NULL,
`log_details` TEXT DEFAULT NULL,
`action_date` DATETIME(3) NOT NULL,
`comments` VARCHAR(200) NULL,
PRIMARY KEY (`id`),
KEY `IDX_DEPARTMENT_COMPANY_CODE` (`company_code`),
KEY `IDX_DEPARTMENT_LOG_CONTAINER_ID` (`container_id`),
KEY `IDX_DEPARTMENT_LOG_ACTION_DATE` (`action_date`)
) ENGINE=INNODB;

CREATE TABLE `project_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'Project',
`container_name` VARCHAR(200) NOT NULL,
`company_code` VARCHAR(100) NOT NULL,
`action_id` INT UNSIGNED NOT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`action_user_id` INT UNSIGNED DEFAULT NULL,
`txn_id` INT UNSIGNED DEFAULT NULL,
`file_count` INT UNSIGNED DEFAULT 0,
`file_size` BIGINT UNSIGNED DEFAULT 0,
`file_version_size` BIGINT UNSIGNED DEFAULT 0,
`file_version_count`  INT DEFAULT 0,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`action_user_ip` VARCHAR(200) DEFAULT NULL,
`log_details` TEXT DEFAULT NULL,
`action_date` DATETIME(3) NOT NULL,
`comments` VARCHAR(200) NULL,
PRIMARY KEY (`id`),
KEY `IDX_PROJECT_LOG_COMPANY_CODE` (`company_code`)
) ENGINE=INNODB;

CREATE TABLE `share_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'backup',
`container_name` VARCHAR(200) NOT NULL,
`company_code` VARCHAR(100) NOT NULL,
`action_id` INT UNSIGNED NOT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`action_user_id` INT UNSIGNED DEFAULT NULL,
`txn_id` INT UNSIGNED DEFAULT NULL,
`file_count` INT UNSIGNED DEFAULT 0,
`file_size` BIGINT UNSIGNED DEFAULT 0,
`file_version_size` BIGINT UNSIGNED DEFAULT 0,
`file_version_count`  INT DEFAULT 0,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`action_user_ip` VARCHAR(200) DEFAULT NULL,
`log_details` TEXT DEFAULT NULL,
`action_date` DATETIME(3) NOT NULL,
`comments` VARCHAR(200) NULL,
PRIMARY KEY (`id`),
KEY `IDX_SHARE_LOG_COMPANY_CODE` (`company_code`)
) ENGINE=INNODB;

CREATE TABLE `myfiles_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'backup',
`container_name` VARCHAR(200) NOT NULL,
`company_code` VARCHAR(100) NOT NULL,
`action_id` INT UNSIGNED NOT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`action_user_id` INT UNSIGNED DEFAULT NULL,
`txn_id` INT UNSIGNED DEFAULT NULL,
`file_count` INT UNSIGNED DEFAULT 0,
`file_size` BIGINT UNSIGNED DEFAULT 0,
`file_version_size` BIGINT UNSIGNED DEFAULT 0,
`file_version_count`  INT DEFAULT 0,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`action_user_ip` VARCHAR(200) DEFAULT NULL,
`log_details` TEXT DEFAULT NULL,
`action_date` DATETIME(3) NOT NULL,
`comments` VARCHAR(200) NULL,
PRIMARY KEY (`id`),
KEY `IDX_MYFILES_LOG_COMPANY_CODE` (`company_code`),
KEY `IDX_MYFILES_LOG_CONTAINER_ID` (`container_id`),
KEY `IDX_MYFILES_LOG_ACTION_DATE` (`action_date`)
) ENGINE=INNODB;

CREATE TABLE `backup_resource_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'backup_file/backup_folder',
`company_code` VARCHAR(100) NOT NULL,
`container_name` VARCHAR(200) NOT NULL,
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`resource_id` INT UNSIGNED NOT NULL,
`resource_name` VARCHAR(200) DEFAULT NULL,
`file_version_size` INT DEFAULT NULL,
`file_version_count`  INT DEFAULT 0,
`file_size_deviation` INT DEFAULT NULL,
`resource_type` ENUM('1','2') NOT NULL COMMENT '1 = File 2= Folder',
`action_id` INT UNSIGNED NOT NULL,
`action_mode` ENUM('COPY','MAIL_DROP','CONTAINER_EMAIL','WEB_DOCUMENT') DEFAULT NULL,
`file_type_id` INT UNSIGNED DEFAULT NULL,
`file_category_id` INT UNSIGNED DEFAULT NULL,
`folder_type_id` INT UNSIGNED DEFAULT NULL,
`folder_category_id` INT UNSIGNED DEFAULT NULL,
`action_user_id` INT UNSIGNED NOT NULL,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`log_details` TEXT DEFAULT NULL,
`action_date` DATETIME(3) NOT NULL,
`comments` VARCHAR(200) NULL,`action_user_ip` VARCHAR(200) DEFAULT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`txn_id` INT UNSIGNED DEFAULT NULL,
`file_count` INT UNSIGNED DEFAULT 0,
`file_size` BIGINT UNSIGNED DEFAULT 0,
PRIMARY KEY (`id`),
KEY `IDX_BACKUP_RESOURCE_LOG_CONTAINER_ID` (`container_id`)
) ENGINE=INNODB;

CREATE TABLE `department_resource_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'department_file/ department_folder',
`company_code` VARCHAR(100) NOT NULL,
`container_name` VARCHAR(200) NOT NULL,
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`resource_id` INT UNSIGNED NOT NULL,
`resource_name` VARCHAR(200) DEFAULT NULL,
`file_version_size` INT DEFAULT NULL,
`file_version_count`  INT DEFAULT 0,
`file_size_deviation` INT DEFAULT NULL,
`resource_type` ENUM('1','2') NOT NULL COMMENT '1 = File 2= Folder',
`action_id` INT UNSIGNED NOT NULL,
`action_mode` ENUM('COPY','MAIL_DROP','CONTAINER_EMAIL','WEB_DOCUMENT') DEFAULT NULL,
`file_type_id` INT UNSIGNED DEFAULT NULL,
`file_category_id` INT UNSIGNED DEFAULT NULL,
`folder_type_id` INT UNSIGNED DEFAULT NULL,
`folder_category_id` INT UNSIGNED DEFAULT NULL,
`action_user_id` INT UNSIGNED NOT NULL,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`log_details` TEXT DEFAULT NULL,
`action_date` DATETIME(3) NOT NULL,
`comments` VARCHAR(200) NULL,
`action_user_ip` VARCHAR(200) DEFAULT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`txn_id` INT UNSIGNED DEFAULT NULL,
`file_count` INT UNSIGNED DEFAULT 0,
`file_size` BIGINT UNSIGNED DEFAULT 0,
PRIMARY KEY (`id`),
KEY `IDX_DEPARTMENT_RESOURCE_LOG_CONTAINER_ID` (`container_id`),
KEY `IDX_DEPARTMENT_RESOURCE_LOG_ACTION_DATE` (`action_date`)
) ENGINE=INNODB;

CREATE TABLE `myfiles_resource_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'myfiles_file/ myfiles_folder',
`company_code` VARCHAR(100) NOT NULL,
`container_name` VARCHAR(200) NOT NULL,
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`resource_id` INT UNSIGNED NOT NULL,
`resource_name` VARCHAR(200) DEFAULT NULL,
`file_version_size` INT DEFAULT NULL,
`file_version_count`  INT DEFAULT 0,
`file_size_deviation` INT DEFAULT NULL,
`resource_type` ENUM('1','2') NOT NULL COMMENT '1 = File 2= Folder',
`action_id` INT UNSIGNED NOT NULL,
`action_mode` ENUM('COPY','MAIL_DROP','CONTAINER_EMAIL','WEB_DOCUMENT') DEFAULT NULL,
`file_type_id` INT UNSIGNED DEFAULT NULL,
`file_category_id` INT UNSIGNED DEFAULT NULL,
`folder_type_id` INT UNSIGNED DEFAULT NULL,
`folder_category_id` INT UNSIGNED DEFAULT NULL,
`action_user_id` INT UNSIGNED NOT NULL,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`log_details` TEXT DEFAULT NULL,
`action_date` DATETIME(3) NOT NULL,
`comments` VARCHAR(200) NULL,
`action_user_ip` VARCHAR(200) DEFAULT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`txn_id` INT UNSIGNED DEFAULT NULL,
`file_count` INT UNSIGNED DEFAULT 0,
`file_size` BIGINT UNSIGNED DEFAULT 0,
PRIMARY KEY (`id`),
  KEY `IDX_MYFILES_RESOURCE_LOG_CONTAINER_ID` (`container_id`),
  KEY `IDX_MYFILES_RESOURCE_LOG_ACTION_DATE` (`action_date`)
) ENGINE=INNODB;

CREATE TABLE `project_resource_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'project_file/ project_folder',
`company_code` VARCHAR(100) NOT NULL,
`container_name` VARCHAR(200) NOT NULL,
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`resource_id` INT UNSIGNED NOT NULL,
`resource_name` VARCHAR(200) DEFAULT NULL,
`file_version_size` INT DEFAULT NULL,
`file_version_count`  INT DEFAULT 0,
`file_size_deviation` INT DEFAULT NULL,
`resource_type` ENUM('1','2') NOT NULL COMMENT '1 = File 2= Folder',
`action_mode` ENUM('COPY','MAIL_DROP','CONTAINER_EMAIL','WEB_DOCUMENT') DEFAULT NULL,
`action_id` INT UNSIGNED NOT NULL,
`file_type_id` INT UNSIGNED DEFAULT NULL,
`file_category_id` INT UNSIGNED DEFAULT NULL,
`folder_type_id` INT UNSIGNED DEFAULT NULL,
`folder_category_id` INT UNSIGNED DEFAULT NULL,
`action_user_id` INT UNSIGNED NOT NULL,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`log_details` TEXT DEFAULT NULL,
`action_date` DATETIME(3) NOT NULL,
`comments` VARCHAR(200) NULL,
`action_user_ip` VARCHAR(200) DEFAULT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`txn_id` INT UNSIGNED DEFAULT NULL,
`file_count` INT UNSIGNED DEFAULT 0,
`file_size` BIGINT UNSIGNED DEFAULT 0,
PRIMARY KEY (`id`),
KEY `IDX_PROJECT_RESOURCE_LOG_CONTAINER_ID` (`container_id`),
KEY `IDX_PROJECT_RESOURCE_LOG_ACTION_DATE` (`action_date`)
) ENGINE=INNODB;

CREATE TABLE `share_resource_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'share_file/ share_folder',
`company_code` VARCHAR(100) NOT NULL,
`container_name` VARCHAR(200) NOT NULL,
`universal_id` INT(10) NULL COMMENT 'UniversalFileInfoId',
`resource_id` INT UNSIGNED NOT NULL,
`resource_name` VARCHAR(200) DEFAULT NULL,
`file_version_size` INT DEFAULT NULL,
`file_version_count`  INT DEFAULT 0,
`file_size_deviation` INT DEFAULT NULL,
`resource_type` ENUM('1','2') NOT NULL COMMENT '1 = File 2= Folder',
`action_id` INT UNSIGNED NOT NULL,
`action_mode` ENUM('COPY','MAIL_DROP','CONTAINER_EMAIL','WEB_DOCUMENT') DEFAULT NULL,
`file_type_id` INT UNSIGNED DEFAULT NULL,
`file_category_id` INT UNSIGNED DEFAULT NULL,
`folder_type_id` INT UNSIGNED DEFAULT NULL,
`folder_category_id` INT UNSIGNED DEFAULT NULL,
`action_user_id` INT UNSIGNED NOT NULL,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`log_details` TEXT DEFAULT NULL,
`action_date` DATETIME(3) NOT NULL,
`comments` VARCHAR(200) NULL,
`action_user_ip` VARCHAR(200) DEFAULT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`txn_id` INT UNSIGNED DEFAULT NULL,
`file_count` INT UNSIGNED DEFAULT 0,
`file_size` BIGINT UNSIGNED DEFAULT 0,
`locker_id` INT UNSIGNED DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `general_log` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`action_id` INT UNSIGNED NOT NULL,
`device_id` INT UNSIGNED DEFAULT NULL,
`device_type` ENUM('SDAgent','AndroidAgent','IPhoneAgent','OutlookAgent','MSOfficeAgent') DEFAULT NULL,
`branch_id` INT UNSIGNED DEFAULT NULL,
`department_id` INT UNSIGNED DEFAULT NULL,
`target_id` INT UNSIGNED DEFAULT NULL,
`target_name` VARCHAR(200) DEFAULT NULL,
`target_type` ENUM('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26') NOT NULL COMMENT '1 = User 2= Group 3= Device 4= Settings 5= Features 6= Backup 7=Partner 8=reminder 9= workflow 10=company 11=LDAP settings 12=workflow_instance 13=workflow_task 14=workflow_query 15=contact 16=contact_group 17=contact_category 18=Role 19=Project Template 20=project_category 21=collaboration_email 22=STORAGE 23=REGION 24=wfk_category 25=password_policy 26=WkfAdhocReportTemplate',
`target_id_2` INT UNSIGNED DEFAULT NULL,
`target_name_2` VARCHAR(200) DEFAULT NULL,
`target_type_2` ENUM('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26') NULL COMMENT '1 = User 2= Group 3= Device 4= Settings 5= Features 6= Backup 7=Partner 8=reminder 9= workflow 10=company 11=LDAP settings 12=workflow_instance 13=workflow_task 14=workflow_query 15=contact 16=contact_group 17=contact_category 18=Role 19=Project Template 20=project_category 21=collaboration_email 22=STORAGE 23=REGION 24=wfk_category 25=password_policy 26=WkfAdhocReportTemplate',
`action_user_id` INT UNSIGNED DEFAULT NULL,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`action_user_ip` VARCHAR(200) DEFAULT NULL,
`log_details` TEXT DEFAULT NULL,
`action_date` DATETIME(3) NOT NULL,
`comments` VARCHAR(200) NULL,
PRIMARY KEY (`id`),
KEY `IDX_GENERAL_LOG_COMPANY_CODE` (`company_code`)
) ENGINE=INNODB;

CREATE TABLE `resource_share` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`subject` VARCHAR(200) DEFAULT NULL,
`message` VARCHAR(500) NOT NULL,
`share_mode` ENUM( '1','2') NULL COMMENT '1 - Direct Share, 2 - Copy Share',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `resource_share_user` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`container_id` INT NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`share_id` INT UNSIGNED NOT NULL,
`user_id` INT UNSIGNED NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`target_container_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`target_resource_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`read_status` TINYINT UNSIGNED DEFAULT NULL,
`target_resource_parent_id` INT DEFAULT NULL,
`is_downloadable` TINYINT DEFAULT 1,
`show_annotation` TINYINT DEFAULT 0,
`edit_annotation` TINYINT DEFAULT 0,
`enable_reshare` TINYINT DEFAULT 1,
`parent_shared_id` INT(10) UNSIGNED DEFAULT NULL,
`parent_shared_type` ENUM( 'USER','GROUP') DEFAULT NULL,
`start_date` DATETIME NOT NULL,
`end_date` DATETIME DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`resource_type` ENUM( '1','2') COMMENT '1 File, 2 Folder',
`view_count` INT DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_RESOURCE_SHARE_USER_CONTAINER_ID` (`container_id`),
CONSTRAINT `FK_RESOURCE_SHARE_USER_SHARE_ID` FOREIGN KEY (`share_id`) REFERENCES `resource_share` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_USER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `resource_share_user_group` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`container_id` INT NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`share_id` INT UNSIGNED NOT NULL,
`user_group_id` INT UNSIGNED NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`target_container_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`target_resource_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`target_resource_parent_id` INT DEFAULT NULL,
`is_downloadable` TINYINT DEFAULT 1,
`show_annotation` TINYINT DEFAULT 0,
`edit_annotation` TINYINT DEFAULT 0,
`enable_reshare` TINYINT DEFAULT 1,
`parent_shared_id` INT(10) UNSIGNED DEFAULT NULL,
`parent_shared_type` ENUM( 'USER','GROUP') DEFAULT NULL,
`start_date` DATETIME NOT NULL,
`end_date` DATETIME DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`resource_type` ENUM( '1','2') COMMENT '1 File, 2 Folder',
`view_count` INT DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_RESOURCE_SHARE_USER_GROUP_CONTAINER_ID` (`container_id`),
CONSTRAINT `FK_RESOURCE_SHARE_USER_GROUP_SHARE_ID` FOREIGN KEY (`share_id`) REFERENCES `resource_share` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_USER_GROUP_USER_GROUP_ID` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_USER_GROUP_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `resource_share_anonymous` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`container_id` INT NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`share_id` INT UNSIGNED NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`target_container_id` INT UNSIGNED DEFAULT NULL COMMENT 'target copying containerId if share_mode is 2',
`target_resource_id` INT UNSIGNED DEFAULT NULL COMMENT 'copied resourceId for share if share_mode is 2',
`read_status` TINYINT UNSIGNED DEFAULT NULL,
`email` VARCHAR(100) DEFAULT NULL,
`target_resource_parent_id` INT DEFAULT NULL,
`is_downloadable` TINYINT DEFAULT 1,
`show_annotation` TINYINT DEFAULT 0,
`edit_annotation` TINYINT DEFAULT 0,
`enable_reshare` TINYINT DEFAULT 1,
`parent_shared_id` INT(10) UNSIGNED DEFAULT NULL,
`parent_shared_type` ENUM( 'USER','GROUP') DEFAULT NULL,
`start_date` DATETIME DEFAULT NULL,
`end_date` DATETIME DEFAULT NULL,
`download_count` INT DEFAULT 0,
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`resource_type` ENUM( '1','2') COMMENT '1 File, 2 Folder',
`view_count` INT DEFAULT 0,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_RESOURCE_SHARE_ANONYMOUS_CONTAINER_ID` (`container_id`),
CONSTRAINT `FK_RESOURCE_SHARE_ANONYMOUS_SHARE_ID` FOREIGN KEY (`share_id`) REFERENCES `resource_share` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_ANONYMOUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `user_alert_map` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user_id` INT UNSIGNED NOT NULL,
`container_id` INT NOT NULL,
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`created_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`),
CONSTRAINT `FK_USER_ALERT_MAP_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)ENGINE=INNODB;

CREATE TABLE `backup_favorites` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'backup_id',
`status_id` INT UNSIGNED NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`resource_type` ENUM('1','2') NOT NULL COMMENT '1 = Folder 2= File',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_BACKUP_FAV_CONTAINER_ID_RESOURCEID_RESOURCE_TYPE_CREATED_BY` (`container_id`,`resource_id`,`resource_type`,`created_by`),
KEY `IDX_BACKUP_FAVOURITE_COMBINED` (`resource_id`, `resource_type`, `container_id`, `created_by`),
CONSTRAINT `FK_BACKUP_FAVORITES_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `backup` (`id`),
CONSTRAINT `FK_BACKUP_FAVORITES_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `myfiles_favorites` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'myfiles_id',
`status_id` INT UNSIGNED NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`resource_type` ENUM('1','2') NOT NULL COMMENT '1 = Folder 2= File',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_MYFILES_FAV_CONTAINER_ID_RESOURCEID_RESOURCE_TYPE_CREATED_BY` (`container_id`,`resource_id`,`resource_type`,`created_by`),
KEY `IDX_MYFILES_FAVOURITE_COMBINED` (`resource_id`, `resource_type`, `container_id`, `created_by`),
CONSTRAINT `FK_MYFILES_FAVORITES_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `myfiles` (`id`),
CONSTRAINT `FK_MYFILES_FAVORITES_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `project_favorites` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'project_id',
`status_id` INT UNSIGNED NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`resource_type` ENUM('1','2') NOT NULL COMMENT '1 = Folder 2= File',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_PROJECT_FAV_CONTAINER_ID_RESOURCEID_RESOURCE_TYPE_CREATED_BY` (`container_id`,`resource_id`,`resource_type`,`created_by`),
KEY `IDX_PROJECT_FAVOURITE_COMBINED` (`resource_id`, `resource_type`, `container_id`, `created_by`),
CONSTRAINT `FK_PROJECT_FAVORITES_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`),
CONSTRAINT `FK_PROJECT_FAVORITES_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `share_favorites` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'share_id',
`status_id` INT UNSIGNED NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`resource_type` ENUM('1','2') NOT NULL COMMENT '1 = Folder 2= File',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_SHARE_FAV_CONTAINER_ID_RESOURCEID_RESOURCE_TYPE_CREATED_BY` (`container_id`,`resource_id`,`resource_type`,`created_by`),
KEY `IDX_SHARE_FAVOURITE_COMBINED` (`resource_id`, `resource_type`, `container_id`, `created_by`),
CONSTRAINT `FK_SHARE_FAVORITES_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`),
CONSTRAINT `FK_SHARE_FAVORITES_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `department_favorites` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL COMMENT 'department_id',
`status_id` INT UNSIGNED NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`resource_type` ENUM('1','2') NOT NULL COMMENT '1 = Folder 2= File',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_DEPT_FAV_CONTAINER_ID_RESOURCEID_RESOURCE_TYPE_CREATED_BY` (`container_id`,`resource_id`,`resource_type`,`created_by`),
KEY `IDX_DEPARTMENT_FAVOURITE_COMBINED` (`resource_id`, `resource_type`, `container_id`, `created_by`),
CONSTRAINT `FK_DEPARTMENT_FAVORITES_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`),
CONSTRAINT `FK_DEPARTMENT_FAVORITES_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

 CREATE TABLE `property_master` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code`VARCHAR(100) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`name` VARCHAR(50) NOT NULL,
`property_type` ENUM('1','2','3','4','5','6') COMMENT '1=String, 2=Long, 3=Boolean, 4=Date, 5=Double, 6=List',
`possible_values` TEXT DEFAULT NULL,
`default_value` VARCHAR(255) DEFAULT NULL,
`created_by` INT NOT NULL COMMENT 'companyAdmin userId',
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL COMMENT 'companyAdmin userId',
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_PROPERTY_MASTER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

INSERT INTO `property_master` (`id`,`company_code`,`status_id`,`name`,`property_type`,`possible_values`,`default_value`,`created_by`,`created_date`,`updated_by`,`updated_date`) VALUES (1,COMPANY_CODE_REPLACE_HERE,1,'Tags','1',NULL,NULL,1,CURTIME(),NULL,NULL);

CREATE TABLE `project_file_comment` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revison_number` INT UNSIGNED NOT NULL,
`comment` VARCHAR(200) NOT NULL,
`created_by` INT UNSIGNED,
`email` VARCHAR(100) DEFAULT NULL,
`type` ENUM( '1','2') NOT NULL COMMENT '1 Internal, 2 public',
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_PROJECT_FILE_COMMENT_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`),
CONSTRAINT `FK_PROJECT_FILE_COMMENT_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `project_file` (`id`)
) ENGINE=INNODB;

CREATE TABLE `backup_file_comment` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revison_number` INT UNSIGNED NOT NULL,
`comment` VARCHAR(200) NOT NULL,
`created_by` INT UNSIGNED,
`email` VARCHAR(100) DEFAULT NULL,
`type` ENUM( '1','2') NOT NULL COMMENT '1 Internal, 2 public',
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_BACKUP_FILE_COMMENT_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `backup` (`id`),
CONSTRAINT `FK_BACKUP_FILE_COMMENT_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `backup_file` (`id`)
) ENGINE=INNODB;

CREATE TABLE `department_file_comment` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revison_number` INT UNSIGNED NOT NULL,
`comment` VARCHAR(200) NOT NULL,
`created_by` INT UNSIGNED,
`email` VARCHAR(100) DEFAULT NULL,
`type` ENUM( '1','2') NOT NULL COMMENT '1 Internal, 2 public',
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_DEPARTMENT_FILE_COMMENT_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`),
CONSTRAINT `FK_DEPARTMENT_FILE_COMMENT_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `department_file` (`id`)
) ENGINE=INNODB;

CREATE TABLE `share_file_comment` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revison_number` INT UNSIGNED NOT NULL,
`comment` VARCHAR(200) NOT NULL,
`created_by` INT UNSIGNED,
`email` VARCHAR(100) DEFAULT NULL,
`type` ENUM( '1','2') NOT NULL COMMENT '1 Internal, 2 public',
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_SHARE_FILE_COMMENT_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`),
CONSTRAINT `FK_SHARE_FILE_COMMENT_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `share_file` (`id`)
) ENGINE=INNODB;

CREATE TABLE `myfiles_file_comment` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revison_number` INT UNSIGNED NOT NULL,
`comment` VARCHAR(200) NOT NULL,
`created_by` INT UNSIGNED,
`email` VARCHAR(100) DEFAULT NULL,
`type` ENUM( '1','2') NOT NULL COMMENT '1 Internal, 2 public',
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_MYFILES_FILE_COMMENT_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `myfiles` (`id`),
CONSTRAINT `FK_MYFILES_FILE_COMMENT_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `myfiles_file` (`id`)
) ENGINE=INNODB;

CREATE TABLE `user_alert_message` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`alert_type` ENUM('1','2','3','4') COMMENT '1 = Activity Notification, 2= Reminder Notification, 3=Workflow Notifications, 4=Workflow Query',
`action_id` INT UNSIGNED DEFAULT NULL,
`container_id` INT UNSIGNED DEFAULT NULL,
`container_name` VARCHAR(200) DEFAULT NULL COMMENT 'ProjectName, BackupName',
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`resource_id` INT UNSIGNED,
`resource_name` VARCHAR(200) DEFAULT NULL COMMENT 'FileName, FolderName',
`resource_type` ENUM('1','2') COMMENT '1 = File 2= Folder',
`resource_parent_id` INT DEFAULT NULL,
`file_type_id` INT UNSIGNED DEFAULT NULL,
`file_category_id` INT UNSIGNED DEFAULT NULL,
`folder_type_id` INT UNSIGNED DEFAULT NULL,
`folder_category_id` INT UNSIGNED DEFAULT NULL,
`subject` VARCHAR (200) DEFAULT NULL,
`message` TEXT DEFAULT NULL,
`read_status` INT UNSIGNED DEFAULT 0,
`target_user_id`  INT UNSIGNED NOT NULL,
`action_user_id` INT UNSIGNED DEFAULT NULL,
`action_user_login_name` VARCHAR(200) DEFAULT NULL,
`action_user_email` VARCHAR(200) DEFAULT NULL,
`action_user_first_name` VARCHAR(200) DEFAULT NULL,
`action_user_last_name` VARCHAR(200) DEFAULT NULL,
`action_details` TEXT DEFAULT NULL,
`action_date` DATETIME NOT NULL,
`object_id` INT UNSIGNED DEFAULT NULL,
`object_name` VARCHAR(200) DEFAULT NULL,
`object_type` ENUM('1','2','3','4','5') DEFAULT NULL COMMENT '1 = User 2= Group 3= Device 4= Settings 5= Features',
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `multi_language` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`language_id` INT UNSIGNED NOT NULL,
`object_id` INT DEFAULT NULL,
`type_id` ENUM('100', '101', '102', '103','104','105') NOT NULL 
COMMENT '100 = FileCategoryName, 101 = DepartmentName, 102 = BranchName, 103 = CompanyDisplayName,104 =WorkFlowCategory, 105 =WorkFlowTaskActionRule',
`language_key` VARCHAR (100) NOT NULL,
`language_value` VARCHAR (250) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `resource_share_user_group_member` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`container_id` INT NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`share_id` INT UNSIGNED NOT NULL,
`group_share_id` INT UNSIGNED NOT NULL,
`user_group_id` INT UNSIGNED NOT NULL,
`user_id` INT UNSIGNED NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`read_status` TINYINT UNSIGNED DEFAULT NULL,
`target_container_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`target_resource_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`target_resource_parent_id` INT DEFAULT NULL,
`is_downloadable` TINYINT DEFAULT 1,
`show_annotation` TINYINT DEFAULT 0,
`edit_annotation` TINYINT DEFAULT 0,
`enable_reshare` TINYINT DEFAULT 1,
`parent_shared_id` INT(10) UNSIGNED DEFAULT NULL,
`parent_shared_type` ENUM( 'USER','GROUP') DEFAULT NULL,
`start_date` DATETIME NOT NULL,
`end_date` DATETIME DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`resource_type` ENUM( '1','2') COMMENT '1 File, 2 Folder',
`view_count` INT DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_RESOURCE_SHARE_USER_GROUP_MEMBER_CONTAINER_ID` (`container_id`),
CONSTRAINT `FK_RESOURCE_SHARE_USER_GROUP_MEMBER_SHARE_ID` FOREIGN KEY (`share_id`) REFERENCES `resource_share` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_USER_GROUP_MEMBER_USER_GROUP_ID` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_USER_GROUP_MEMBER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;


CREATE TABLE `resource_share_public` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` BIGINT NOT NULL,
`container_id` INT NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`share_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`target_container_id` INT UNSIGNED DEFAULT NULL COMMENT 'target copying containerId if share_mode is 2',
`target_resource_id` INT UNSIGNED DEFAULT NULL COMMENT 'copied resourceId for share if share_mode is 2',
`read_status` TINYINT UNSIGNED DEFAULT NULL,
`revision_number` INT UNSIGNED NOT NULL,
`target_resource_parent_id` INT DEFAULT NULL,
`is_downloadable` TINYINT DEFAULT 1,
`show_annotation` TINYINT DEFAULT 0,
`edit_annotation` TINYINT DEFAULT 0,
`enable_reshare` TINYINT DEFAULT 1,
`parent_shared_id` INT(10) UNSIGNED DEFAULT NULL,
`parent_shared_type` ENUM( 'USER','GROUP') DEFAULT NULL,
`start_date` DATETIME DEFAULT NULL,
`end_date` DATETIME DEFAULT NULL,
`download_count` INT DEFAULT 0,
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`resource_type` ENUM( '1','2') COMMENT '1 File, 2 Folder',
`view_count` INT DEFAULT 0,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_RESOURCE_SHARE_PUBLIC_CONTAINER_ID` (`container_id`),
CONSTRAINT `FK_RESOURCE_SHARE_PUBLIC_SHARE_ID` FOREIGN KEY (`share_id`) REFERENCES `resource_share` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_PUBLIC_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `error_log_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`device_id` INT DEFAULT NULL,
`container_id` INT UNSIGNED DEFAULT NULL COMMENT 'container_id for container logs from client',
`container_txn_id` INT UNSIGNED DEFAULT NULL COMMENT 'container_txn_id for container logs from client',
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile for container logs from client',
`file_name` VARCHAR (120) NOT NULL,
`file_size` INT DEFAULT NULL,
`storage_reference_id` INT UNSIGNED NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`read_status` INT UNSIGNED DEFAULT 0,
`file_type` ENUM( '1','2') DEFAULT NULL COMMENT '1 applicationLog, 2 BackupTxn log',
`download_count` INT DEFAULT NULL,
`view_count` INT DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`os_created_date` DATETIME DEFAULT NULL,
`os_modified_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `processed_containers` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT(10) UNSIGNED NOT NULL,
`container_type` ENUM( '1','2','3','4','5') NOT NULL COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
PRIMARY KEY (`id`)
) ENGINE=INNODB;


CREATE TABLE `reminder` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `job_key` VARCHAR(50) DEFAULT NULL,
  `priority` TINYINT(1) DEFAULT '0',
  `name` VARCHAR(200) NOT NULL,
  `mail_subject` varchar(200) DEFAULT NULL,
  `note` VARCHAR(1024) DEFAULT NULL,
  `message` TEXT,
  `reminder_date` DATETIME NOT NULL,
  `reminder_channel` INT(10) NOT NULL,
  `reminder_mode` ENUM('CUSTOM','DOCUMENT','WORKFLOW','WKFPROCESS') NOT NULL DEFAULT 'CUSTOM',
  `reminder_style` ENUM('NORMAL','MEETING') DEFAULT NULL,
  `reminder_description` VARCHAR(1024) DEFAULT NULL,
  `is_shared` TINYINT(1) DEFAULT '0',
  `is_external` TINYINT(1) DEFAULT '0' NULL,
  `have_attachment` TINYINT(1) DEFAULT '0',
  `repeat_mode` ENUM('NO_REPEAT','DAILY','WEEKLY','MONTHLY','YEARLY','SPECIFIC_DATE') DEFAULT 'NO_REPEAT',
  `status_id` INT(10) UNSIGNED NOT NULL DEFAULT '1',  
  `created_by` INT(10) NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_by` INT(10) unsigned DEFAULT NULL,
  `updated_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_REMINDER_REMINDER_MODE` (`reminder_mode`)
) ENGINE=INNODB;


CREATE TABLE `reminder_alert` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reminder_id` INT(10) UNSIGNED DEFAULT NULL,
  `status_id` INT(10) UNSIGNED NOT NULL,
  `job_key` VARCHAR(50) DEFAULT NULL,
  `alert_type` ENUM('BEFORE','AFTER') DEFAULT 'BEFORE',  
  `alert_mode` ENUM('DAY','HOUR','MIN') NOT NULL,
  `alert_time` INT(10) NOT NULL,  
  PRIMARY KEY (`id`),
  KEY `FK_REMINDER_ALERT_REMINDER_ID` (`reminder_id`),
  CONSTRAINT `FK_REMINDER_ALERT_REMINDER_ID` FOREIGN KEY (`reminder_id`) REFERENCES `reminder` (`id`)
) ENGINE=INNODB;


CREATE TABLE `reminder_doc_map` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reminder_id` INT(10) UNSIGNED NOT NULL,
  `container` ENUM('BACKUP','PROJECT','SHARE','DEPARTMENT','MYFILES') NOT NULL,
  `file_id` INT(10) NOT NULL,
  `public_link` TEXT NULL,
  `created_date` DATETIME NOT NULL,
  `created_by` INT(10) NOT NULL,
  `updated_date` DATETIME NULL,
  `updated_by` INT(10) NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REMINDER_DOC_MAP_REMINDER_ID` (`reminder_id`),
  CONSTRAINT `FK_REMINDER_DOC_MAP_REMINDER_ID` FOREIGN KEY (`reminder_id`) REFERENCES `reminder` (`id`)
) ENGINE=INNODB;


CREATE TABLE `reminder_instance` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reminder_id` INT(10) UNSIGNED DEFAULT NULL,
  `status_id` INT(10) UNSIGNED NOT NULL,
  `reminder_date` DATETIME NOT NULL,
  `notification_count` INT(10) DEFAULT '0',
  `total_notification_count` INT(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_REMINDER_REPEAT_INSTANCE_REMINDER_ID` (`reminder_id`),
  KEY `IDX_REMINDER_INSTANCE_REMINDER_DATE` (`reminder_date`),
  CONSTRAINT `FK_REMINDER_REPEAT_INSTANCE_REMINDER_ID` FOREIGN KEY (`reminder_id`) REFERENCES `reminder` (`id`)
) ENGINE=INNODB;

CREATE TABLE `reminder_notification_history` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `instance_id` INT(10) UNSIGNED NOT NULL,
  `alert_id` INT(10) UNSIGNED NOT NULL,
  `reminder_id` INT(10) UNSIGNED NOT NULL,
  `scheduled_fire_date` DATETIME DEFAULT NULL,
  `actual_fire_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `reminder_repeat` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reminder_id` INT(10) UNSIGNED NOT NULL,
  `job_key` VARCHAR(50) DEFAULT NULL,
  `repeat_type` ENUM('DAILY','WEEKLY','MONTHLY','YEARLY') NOT NULL,
  `repeat_day` INT(10) DEFAULT NULL,
  `end_mode` ENUM('NEVER','AFTER','ON') DEFAULT NULL,
  `end_interval` INT(10) DEFAULT NULL,
  `end_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REMINDER_REPEAT_REMINDER_ID` (`reminder_id`),
  CONSTRAINT `FK_REMINDER_REPEAT_REMINDER_ID` FOREIGN KEY (`reminder_id`) REFERENCES `reminder` (`id`)
) ENGINE=INNODB;

CREATE TABLE `reminder_share_user_map` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reminder_id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REMINDER_SHARE_USER_MAP_REMINDER_ID` (`reminder_id`),
  KEY `FK_REMINDER_SHARE_USER_MAP_USER_ID` (`user_id`),
  CONSTRAINT `FK_REMINDER_SHARE_USER_MAP_REMINDER_ID` FOREIGN KEY (`reminder_id`) REFERENCES `reminder` (`id`),
  CONSTRAINT `FK_REMINDER_SHARE_USER_MAP_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=INNODB;

CREATE TABLE `reminder_share_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `reminder_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REMINDER_GROUP_GROUP_ID` (`group_id`),
  KEY `FK_REMINDER_GROUP_REMINDER_ID` (`reminder_id`),
  CONSTRAINT `FK_REMINDER_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `user_group` (`id`),
  CONSTRAINT `FK_REMINDER_GROUP_REMINDER_ID` FOREIGN KEY (`reminder_id`) REFERENCES `reminder` (`id`)
) ENGINE=INNODB;

CREATE TABLE `reminder_specified_date` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reminder_id` INT(10) UNSIGNED NOT NULL,
  `status_id` INT(10) UNSIGNED NOT NULL,
  `job_key` VARCHAR(50) DEFAULT NULL,  
  `start_date` DATETIME NOT NULL,  
  PRIMARY KEY (`id`),
  KEY `FK_REMINDER_SPECIFIED_DATE_REMINDER_ID` (`reminder_id`),
  CONSTRAINT `FK_REMINDER_SPECIFIED_DATE_REMINDER_ID` FOREIGN KEY (`reminder_id`) REFERENCES `reminder` (`id`)
) ENGINE=INNODB;

CREATE TABLE `auth_details` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `auth_type` ENUM('LDAP','CPNYDB') NOT NULL COMMENT 'LDAP= LDAP Server, CPNYDB= Company database',  
  `url` VARCHAR(250) DEFAULT NULL,
  `port` INT(11) DEFAULT NULL,
  `user_name` VARCHAR(250) DEFAULT NULL,
  `password` VARCHAR(250) DEFAULT NULL,
  `domain_name` VARCHAR(250) DEFAULT NULL,
  `extra_details` TEXT,
  `status_id` INT UNSIGNED NOT NULL,
  `created_by` INT(11) NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_by` INT(11) DEFAULT NULL,
  `updated_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`name`)
) ENGINE=INNODB;

INSERT INTO `auth_details`(`id`,`name`,`auth_type`,`status_id`,`created_by`,`created_date`) VALUES(1,"Company database","CPNYDB",1,1,NOW());

CREATE TABLE `wf_category` (
 `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
 `name` VARCHAR (50) NOT NULL,
 `name_key` VARCHAR (50) DEFAULT NULL,
 `status_id` INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_WF_CATEGORY_STATUS_ID` FOREIGN KEY(`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB; 

INSERT INTO wf_category
(id,name,name_key,status_id) VALUES 
(1,'HR','WF_CATEGORY_1',1),
(2,'FINANCE','WF_CATEGORY_2',1);


CREATE TABLE `wf_task_action_rule` (
 `id` INT UNSIGNED NOT NULL,
 `name` VARCHAR (50) NOT NULL,
 `name_key` VARCHAR (100) DEFAULT NULL,
 `type` ENUM ( 'TASK_TYPE', 'TASK_COMPLETION_RULE','TASK_OVERDUE_RULE') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

INSERT INTO wf_task_action_rule
(id,name,name_key,type) VALUES 
(1,'Approve','WF_TASK_ACTION_RULE_1','TASK_TYPE'),
(2,'Review','WF_TASK_ACTION_RULE_2','TASK_TYPE'),
(3,'Any one','WF_TASK_ACTION_RULE_3','TASK_COMPLETION_RULE'),
(4,'Atleast 50%','WF_TASK_ACTION_RULE_4','TASK_COMPLETION_RULE'),
(5,'More than 50%','WF_TASK_ACTION_RULE_5','TASK_COMPLETION_RULE'),
(6,'All','WF_TASK_ACTION_RULE_6','TASK_COMPLETION_RULE'), 
(7,'Wait for Completion','WF_TASK_ACTION_RULE_7','TASK_OVERDUE_RULE'), 
(8,'Auto Approve','WF_TASK_ACTION_RULE_8','TASK_OVERDUE_RULE'),
(9,'Auto Reject','WF_TASK_ACTION_RULE_9','TASK_OVERDUE_RULE');



CREATE TABLE `wf_form_definition` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`xml_definition`  TEXT NOT NULL, 
`status_id` INT UNSIGNED NOT NULL, 
`created_by` INT NOT NULL,
`created_date` DATETIME DEFAULT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_WF_FORM_DEFINITION_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;



CREATE TABLE `wf_definition` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`process_name` VARCHAR(100) NOT NULL,
`process_description` VARCHAR(400) DEFAULT NULL,
`wf_category_id` INT UNSIGNED NOT NULL,
`wf_form_definition_id` INT UNSIGNED DEFAULT NULL,
`xml_definition`  TEXT DEFAULT NULL, 
`status_id` INT UNSIGNED NOT NULL, 
`max_approval_docs` INT UNSIGNED DEFAULT NULL,
`max_reference_docs` INT UNSIGNED DEFAULT NULL,
`notify_task_start_initiator` TINYINT DEFAULT 1,
`notify_task_start_observers` TINYINT DEFAULT 1,
`notify_wf_completion_initiator` TINYINT DEFAULT 1,
`notify_wf_completion_observers` TINYINT DEFAULT 1,
`is_public` TINYINT DEFAULT 1,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_WF_DEFINITION_CATEGORY_ID` FOREIGN KEY (`wf_category_id`) REFERENCES `wf_category` (`id`),
CONSTRAINT `FK_WF_DEFINITION_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_WF_DEFINITION_FORM_DEFINITION_ID` FOREIGN KEY (`wf_form_definition_id`) REFERENCES `wf_form_definition` (`id`)
) ENGINE=INNODB;



CREATE TABLE `wf_form_fields_master` (
 `id` INT UNSIGNED NOT NULL,
 `name` VARCHAR (50) NOT NULL,
 `name_key` VARCHAR (100) DEFAULT NULL,
 `data_type` ENUM('1','2','3','4','5') NOT NULL COMMENT '1 =Integer , 2 = String, 3 = Date, 4=Boolean, 5=Decimal',
  PRIMARY KEY (`id`)
 )ENGINE=INNODB;
 
 INSERT INTO wf_form_fields_master
(id,name,name_key,data_type) VALUES 
(1,'Single Line Text','WF_FORM_FIELDS_MASTER_1',2),
(2,'Multi Line Text','WF_FORM_FIELDS_MASTER_2',2),
(3,'Yes or No','WF_FORM_FIELDS_MASTER_3',4), 
(4,'Numeric','WF_FORM_FIELDS_MASTER_4',1),
(5,'Decimal','WF_FORM_FIELDS_MASTER_5',5),
(6,'Date','WF_FORM_FIELDS_MASTER_6',3), 
(7,'List','WF_FORM_FIELDS_MASTER_7',2);



CREATE TABLE `wf_form_list_master` (
 `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
 `name` VARCHAR (50) NOT NULL,
 `list_values` VARCHAR (2000) NOT NULL,
 PRIMARY KEY (`id`)
 )ENGINE=INNODB;
 
 INSERT INTO wf_form_list_master
(id,name,list_values) VALUES 
(1,'LeaveType','Sick Leave,Casual Leave,Maternity');



CREATE TABLE `wf_definition_users` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`type` ENUM ( 'OBSERVER','OWNER','USER') NOT NULL,
`wf_definition_id` INT UNSIGNED NOT NULL,
`user_id` INT UNSIGNED NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_DEFINITION_USER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_WF_DEFINITION_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
CONSTRAINT `FK_WF_DEFINITION_ID` FOREIGN KEY (`wf_definition_id`) REFERENCES `wf_definition` (`id`)
) ENGINE=INNODB;


CREATE TABLE `wf_instance` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`definition_id` INT UNSIGNED NOT NULL,
`process_name` VARCHAR(100) DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL, 
`wf_current_task_id` INT UNSIGNED DEFAULT NULL,
`wf_task_count` INT UNSIGNED DEFAULT NULL,
`wf_completed_task_id` INT UNSIGNED DEFAULT NULL,
`can_withdraw_workflow` TINYINT UNSIGNED DEFAULT NULL,
`notify_wf_completion_initiator` TINYINT  DEFAULT '1',
`notify_wf_completion_observers` TINYINT  DEFAULT '1',
`actual_start_time` DATETIME DEFAULT NULL,
`actual_end_time` DATETIME DEFAULT NULL,
`schedule_start_time` DATETIME DEFAULT NULL,
`schedule_end_time` DATETIME DEFAULT NULL,
`completed_task_count` INT UNSIGNED DEFAULT NULL,
`comment` VARCHAR(400) DEFAULT NULL,
`is_overdue` TINYINT DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_WF_INSTANCE_STATUS_ID` FOREIGN KEY(`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_WF_INSTANCE_DEFINITION_ID` FOREIGN KEY (`definition_id`) REFERENCES `wf_definition` (`id`)
)ENGINE=INNODB;


CREATE TABLE `wf_task` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`description` VARCHAR(200) DEFAULT NULL,
`task_type` ENUM ('APPROVAL','REVIEW') NOT NULL,
`wf_instance_id` INT UNSIGNED NOT NULL, 
`task_step_no` INT UNSIGNED DEFAULT NULL,
`wf_task_completion_rule_id` INT UNSIGNED NOT NULL, 
`wf_task_overdue_rule_id` INT UNSIGNED NOT NULL, 
`status_id` INT UNSIGNED NOT NULL,
`duration` int(11) DEFAULT NULL COMMENT 'In Minutes',
`actual_duration` INT UNSIGNED DEFAULT NULL,
`duration_type` ENUM('DAY','HOUR','MIN') DEFAULT NULL,
`notify_completion_observers` TINYINT UNSIGNED DEFAULT '1',
`notify_completion_initiator` TINYINT UNSIGNED DEFAULT '1',
`can_withdraw_workflow` TINYINT UNSIGNED DEFAULT '1',
`can_delegate_task` TINYINT(3) DEFAULT '0',
`notify_start_initiator` TINYINT DEFAULT '1',
`notify_start_observers` TINYINT  DEFAULT '1',
`actual_start_time` DATETIME DEFAULT NULL,
`actual_end_time` DATETIME DEFAULT NULL,
`schedule_start_time` DATETIME DEFAULT NULL,
`schedule_end_time` DATETIME DEFAULT NULL,
`last_allocation_id` INT UNSIGNED DEFAULT NULL,
`job_key` VARCHAR(50) DEFAULT NULL,
`is_overdue` TINYINT DEFAULT NULL,
 PRIMARY KEY (`id`),
 CONSTRAINT `FK_WF_TASK_STATUS_ID` FOREIGN KEY(`status_id`) REFERENCES `status_master` (`id`),
 CONSTRAINT `FK_WF_TASK_COMPLETION_RULE_ID` FOREIGN KEY(`wf_task_completion_rule_id`) REFERENCES `wf_task_action_rule` (`id`),
 CONSTRAINT `FK_WF_TASK_OVERDUE_RULE_ID` FOREIGN KEY(`wf_task_overdue_rule_id`) REFERENCES `wf_task_action_rule` (`id`),
 CONSTRAINT `FK_WF_TASK_INSTANCE_ID` FOREIGN KEY(`wf_instance_id`) REFERENCES `wf_instance` (`id`)
)ENGINE=INNODB;

CREATE TABLE `wf_task_allocation`(
`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`wf_task_id` INT UNSIGNED NOT NULL,
`user_id` INT UNSIGNED NOT NULL,
`original_user_id` INT(10) UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`comment` VARCHAR(400) DEFAULT NULL,
`reminder_id` INT UNSIGNED DEFAULT NULL,
`actual_start_time` DATETIME DEFAULT NULL,
`actual_end_time` DATETIME DEFAULT NULL,
`schedule_start_time` DATETIME DEFAULT NULL,
`schedule_end_time` DATETIME DEFAULT NULL,
`is_overdue` TINYINT DEFAULT NULL,
`pending_query` INT(11) NOT NULL DEFAULT '0',
`created_date` DATETIME NULL DEFAULT NULL,
`created_by` INT(10) UNSIGNED DEFAULT NULL,
`updated_date` DATETIME NULL DEFAULT NULL,
`updated_by` INT(10) UNSIGNED DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_TASK_ALLOCATION_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`),
CONSTRAINT `FK_WF_TASK_ALLOCATION_TASK_ID` FOREIGN KEY(`wf_task_id`) REFERENCES `wf_task` (`id`),
CONSTRAINT `FK_WF_TASK_ALLOCATION_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
CONSTRAINT `FK_WF_TASK_ALLOCATION_REMINDER_ID` FOREIGN KEY (`reminder_id`) REFERENCES `reminder` (`id`)
)ENGINE=INNODB;

CREATE TABLE `wf_task_query`(
`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`wf_instance_id` INT(10) UNSIGNED NOT NULL,
`wf_task_id` INT(10) UNSIGNED NOT NULL,
`wf_task_allocation_id` INT(10) UNSIGNED NOT NULL,
`query` TEXT,
`answer` TEXT,
`completed_date` DATETIME DEFAULT NULL,
`status_id` INT(10) UNSIGNED NOT NULL,
`created_by` INT(10) UNSIGNED DEFAULT NULL,
`created_date` DATETIME DEFAULT NULL,
`updated_by` INT(10) UNSIGNED DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `fk_wf_task_query_instance_id_idx` (`wf_instance_id`),
KEY `fk_wf_task_query_task_id_idx` (`wf_task_id`),
KEY `fk_wf_task_query_task_allocation_id_idx` (`wf_task_allocation_id`),
CONSTRAINT `fk_wf_task_query_instance_id` FOREIGN KEY (`wf_instance_id`) REFERENCES `wf_instance` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT `fk_wf_task_query_task_allocation_id` FOREIGN KEY (`wf_task_allocation_id`) REFERENCES `wf_task_allocation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT `fk_wf_task_query_task_id` FOREIGN KEY (`wf_task_id`) REFERENCES `wf_task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB;

CREATE TABLE `wf_doc_files` (
`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`wf_instance_id` INT(10) UNSIGNED NOT NULL,
`wf_task_id` INT(10) UNSIGNED DEFAULT NULL,
`container` ENUM('BACKUP','PROJECT','SHARE','DEPARTMENT','MYFILES') NOT NULL,
`file_id` INT(10) NOT NULL,
`revision_number` INT(11) UNSIGNED DEFAULT '1',
`type` ENUM('APPROVE','REFERENCE') NOT NULL,
`public_link` TEXT NULL,
`status_id` INT(10) UNSIGNED NOT NULL,
`created_date` DATETIME DEFAULT NULL,
`created_by` INT(10) UNSIGNED DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
`updated_by` INT(10) UNSIGNED DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_DOC_FILES_INSTANCE_ID` FOREIGN KEY (`wf_instance_id`) REFERENCES `wf_instance` (`id`),
CONSTRAINT `FK_DOC_FILES_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `wf_form_data` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`wf_instance_id` INT UNSIGNED DEFAULT NULL,
`wf_definition_id` INT UNSIGNED DEFAULT NULL,
`wf_form_field_id` INT UNSIGNED NOT NULL,
`type` ENUM('1','2','3','4','5') NOT NULL COMMENT '1 =Integer , 2 = String, 3 = Date, 4=Boolean ,5=Decimal',
`name` VARCHAR(100) NOT NULL,
`string_value` TEXT DEFAULT NULL,
`int_value` INT DEFAULT NULL,
`date_value` DATETIME DEFAULT NULL,
`double_value` double DEFAULT NULL,
`boolean_value` TINYINT UNSIGNED DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_FORM_DATA_INSTANCE_ID` FOREIGN KEY (`wf_instance_id`) REFERENCES `wf_instance` (`id`),
CONSTRAINT `FK_FORM_DATA_DEFINITION_ID` FOREIGN KEY (`wf_definition_id`) REFERENCES `wf_definition` (`id`),
CONSTRAINT `FK_FORM_DATA_FORM_FIELD_ID` FOREIGN KEY (`wf_form_field_id`) REFERENCES `wf_form_fields_master` (`id`)
)ENGINE=INNODB;

CREATE TABLE `wf_company_holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` enum('PUBLIC','COMPANY','STANDARD') DEFAULT 'PUBLIC',
  `name` VARCHAR(50) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 ;

CREATE TABLE `wf_task_file` (
`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`task_id` INT(10) UNSIGNED NOT NULL,
`user_id` INT(10) UNSIGNED NOT NULL,
`wf_instance_id` INT(10) UNSIGNED NOT NULL,
`allocation_id` INT(10) UNSIGNED NOT NULL,
`container` ENUM('BACKUP','PROJECT','SHARE','DEPARTMENT','MYFILES') NOT NULL,
`file_id` INT(10) UNSIGNED NOT NULL,
`public_link` TEXT NULL,
`status_id` INT(10) UNSIGNED NOT NULL,
`created_date` DATETIME NOT NULL,
`created_by` INT(10) UNSIGNED NOT NULL,
`updated_date` DATETIME DEFAULT NULL,
`updated_by` INT(11) DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `FK_TASK_DOC_FILES_TASK_ID` (`task_id`),
CONSTRAINT `FK_TASK_DOC_FILES_TASK_ID` FOREIGN KEY (`task_id`) REFERENCES `wf_task` (`id`)
) ENGINE=INNODB;

CREATE TABLE `partner` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR (120) NOT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`logo_path` VARCHAR (200) DEFAULT NULL,
`business_phone` VARCHAR (50) DEFAULT NULL,
`address_line_1` VARCHAR (200) DEFAULT NULL,
`address_line_2` VARCHAR (200) DEFAULT NULL,
`address_line_3` VARCHAR (200) DEFAULT NULL,
`address_line_4` VARCHAR (200) DEFAULT NULL,
`address_line_5` VARCHAR (50) DEFAULT NULL,
`country_id` INT DEFAULT NULL,
`expiry_date` DATETIME DEFAULT NULL,
`company_code` VARCHAR(100) DEFAULT NULL,
`status_id` INT UNSIGNED DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_PARTNER_NAME_COMPANY_CODE` (`name`, `company_code`),
KEY `IDX_PARTNER_CREATED_DATE` (`created_date`),
CONSTRAINT `FK_PARTNER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE = INNODB  ;


CREATE TABLE `an_stamp` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR (120) NOT NULL,
`actual_name` VARCHAR (120) NOT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`type_id` ENUM ( '1','2') DEFAULT NULL,
`file_name` VARCHAR (120) NOT NULL,
`file_type_id` INT NOT NULL,
`storage_reference_id` INT DEFAULT NULL,
`company_code` VARCHAR(100) DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_STAMP_NAME_COMPANY_CODE` (`name`, `company_code`),
KEY `IDX_STAMP_CREATED_DATE` (`created_date`),
CONSTRAINT `FK_STAMP_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE = INNODB;


CREATE TABLE `an_project_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revision_number` INT UNSIGNED NOT NULL,
`annotation` LONGTEXT NOT NULL,
`source` ENUM ('1','2','3') DEFAULT '1' COMMENT '1=DIRECT  2=ANONYMOUS_SHARE 3=INTERNAL_SHARE',
`comments` LONGTEXT DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_AN_PROJ_FILE` (`file_id`, `revision_number`, `created_by`),
CONSTRAINT `FK_PROJECT_FILE_ANN_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`),
CONSTRAINT `FK_PROJECT_FILE_ANN_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `project_file` (`id`),
FULLTEXT(`comments`)
) ENGINE=INNODB;

CREATE TABLE `an_backup_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revision_number` INT UNSIGNED NOT NULL,
`annotation` LONGTEXT NOT NULL,
`source` ENUM ('1','2','3') DEFAULT '1' COMMENT '1=DIRECT  2=ANONYMOUS_SHARE 3=INTERNAL_SHARE',
`comments` LONGTEXT DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_AN_BKP_FILE` (`file_id`, `revision_number`, `created_by`),
CONSTRAINT `FK_BKP_FILE_ANN_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `backup` (`id`),
CONSTRAINT `FK_BKP_FILE_ANN_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `backup_file` (`id`),
FULLTEXT(`comments`)
) ENGINE=INNODB;

CREATE TABLE `an_myfiles_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revision_number` INT UNSIGNED NOT NULL,
`annotation` LONGTEXT NOT NULL,
`source` ENUM ('1','2','3') DEFAULT '1' COMMENT '1=DIRECT  2=ANONYMOUS_SHARE 3=INTERNAL_SHARE',
`comments` LONGTEXT DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_AN_MY_FILE` (`file_id`, `revision_number`, `created_by`),
CONSTRAINT `FK_MY_FILE_ANN_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `myfiles` (`id`),
CONSTRAINT `FK_MY_FILE_ANN_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `myfiles_file` (`id`),
FULLTEXT(`comments`)
) ENGINE=INNODB;

CREATE TABLE `an_share_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revision_number` INT UNSIGNED NOT NULL,
`annotation` LONGTEXT NOT NULL,
`source` ENUM ('1','2','3') DEFAULT '1' COMMENT '1=DIRECT  2=ANONYMOUS_SHARE 3=INTERNAL_SHARE',
`comments` LONGTEXT DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_SH_MY_FILE` (`file_id`, `revision_number`, `created_by`),
CONSTRAINT `FK_SH_FILE_ANN_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`),
CONSTRAINT `FK_SH_FILE_ANN_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `share_file` (`id`),
FULLTEXT(`comments`)
) ENGINE=INNODB;

CREATE TABLE `an_department_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revision_number` INT UNSIGNED NOT NULL,
`annotation` LONGTEXT NOT NULL,
`source` ENUM ('1','2','3') DEFAULT '1' COMMENT '1=DIRECT  2=ANONYMOUS_SHARE 3=INTERNAL_SHARE',
`comments` LONGTEXT DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_SH_MY_FILE` (`file_id`, `revision_number`, `created_by`),
CONSTRAINT `FK_DP_FILE_ANN_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`),
CONSTRAINT `FK_DP_FILE_ANN_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `department_file` (`id`),
FULLTEXT(`comments`)
) ENGINE=INNODB;



CREATE TABLE `maildrop_mail` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`status_id` INT UNSIGNED NOT NULL,
`host` VARCHAR (150) NOT NULL,
`port` VARCHAR (5) NOT NULL,
`email` VARCHAR (150) NOT NULL,
`password` VARCHAR (150) NOT NULL,
`unique_name` VARCHAR(200) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_EMAIL` (`email`)
) ENGINE=INNODB;

CREATE TABLE `maildrop_folder` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`status_id` INT UNSIGNED NOT NULL,
`owner_id` INT UNSIGNED NOT NULL,
`container_type` ENUM( '1','2','3','4','5') NOT NULL COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`container_id` INT UNSIGNED NOT NULL,
`folder_id` INT UNSIGNED NOT NULL,
`unique_name` VARCHAR (150) NOT NULL,
`invitation_title` VARCHAR (150) DEFAULT NULL,
`expiry_date` DATETIME DEFAULT NULL,
`notify_inviter` TINYINT DEFAULT '1',
`notify_invitee` TINYINT DEFAULT '1',
`is_public` TINYINT DEFAULT '0',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_UNIQUE_NAME` (`unique_name`),
UNIQUE KEY `IDX_UNIQUE_FOLDER` (`container_type`, `folder_id`)
) ENGINE=INNODB;

CREATE TABLE `maildrop_folder_member` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`maildrop_folder_id` INT UNSIGNED NOT NULL,
`user_id` INT UNSIGNED DEFAULT NULL,
`email` VARCHAR (150) NOT NULL,
`is_invited` TINYINT(4) NOT NULL,
`invited_date` DATETIME DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_UNIQUE_FOLDER_ID_EMAIL` (`maildrop_folder_id`, `email`),
CONSTRAINT `FK_MAILDROPFOLDER_ID` FOREIGN KEY (`maildrop_folder_id`) REFERENCES `maildrop_folder` (`id`)
) ENGINE=INNODB;

CREATE TABLE `locker_container_map` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`share_folder_id` INT UNSIGNED NOT NULL COMMENT 'id of the locker',
`container_id` INT UNSIGNED DEFAULT NULL,
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_SHARE_FOLDER_CONTAINER_MAP_SHARE_FOLDER_ID` FOREIGN KEY (`share_folder_id`) REFERENCES `share_folder` (`id`)
) ENGINE=INNODB;

CREATE TABLE `company_level_quota` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
`name` VARCHAR (250) NOT NULL,
`display_name` VARCHAR (250) NOT NULL,
`containers` VARCHAR (250),
`quota` BIGINT NOT NULL DEFAULT -1,
`allocated_quota` BIGINT NOT NULL DEFAULT 0,
`usage` BIGINT NOT NULL DEFAULT 0,
`alert_percent` INT UNSIGNED NOT NULL DEFAULT 80,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`)
) ENGINE = INNODB;

INSERT INTO `company_level_quota`(`id`,`name`,`display_name`,`containers`,`quota`,`allocated_quota`,`created_by`,`created_date`)
VALUES (1,"TOTAL_COMPANY_QUOTA","TOTAL COMPANY QUOTA","BACKUP,MYFILES,PROJECT,SHARE,DEPARTMENT,PARTNER,LOCKER",-1,0,1,NOW()),
 (2,"COMPANY_PERSONAL_QUOTA","COMPANY PERSONAL QUOTA","BACKUP,MYFILES",-1,0,1,NOW()),
 (3,"COMPANY_PROJECT_QUOTA","COMPANY PROJECT QUOTA","PROJECT",-1,0,1,NOW()),
 (4,"COMPANY_SHARE_QUOTA","COMPANY SHARE QUOTA","SHARE",2147483648,2147483648,1,NOW()),
 (5,"COMPANY_DEPARTMENT_QUOTA","COMPANY DEPARTMENT QUOTA","DEPARTMENT",-1,0,1,NOW()),
 (6,"COMPANY_PARTNER_QUOTA","COMPANY PARTNER QUOTA","PARTNER",-1,0,1,NOW()),
 (7,"COMPANY_LOCKER_QUOTA","COMPANY LOCKER QUOTA","LOCKER",2147483648,2147483648,1,NOW()),
 (8,"COMPANY_DISTRIBUTION_QUOTA","COMPANY DISTRIBUTION QUOTA","DISTRIBUTION",2147483648,2147483648,1,NOW());


CREATE TABLE `contianer_user_usage` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
`user_id` INT UNSIGNED NOT NULL,
`container_id` INT UNSIGNED NOT NULL,
`container_type` ENUM( '1','2','3','4','5','6','7','8') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile, 6 Partner, 7 Locker, 8 Distribution',
`usage` BIGINT NOT NULL DEFAULT 0,
PRIMARY KEY (`id`),
UNIQUE KEY `UQ_CONTIANER_USER_USAGE_USER_CONTAINER_TYPE` (`user_id`,`container_id`,`container_type`)
) ENGINE = INNODB;

CREATE TABLE `action_identifier` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,  
  `action_type_id` ENUM( '1','2','3','4','5','6','7') COMMENT '1 FILE_UPLOAD, 2 FILE_DELETE, 3 FILE_VERSION_DELETE, 4 FOLDER_DELETE, 5 CONTAINER_DELETE, 6 ALLOCATED_QUOTA_UPDATE, 7 EMAIL_FILE_DELETE',
  `object_data` BLOB NOT NULL,  
  `status_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;


CREATE TABLE `wf_definition_groups` (
 `id` INT(11) NOT NULL AUTO_INCREMENT,
 `wf_definition_id` INT(11) UNSIGNED NOT NULL ,
 `user_group_id` INT(11) UNSIGNED NOT NULL ,
 `status_id` INT(10) UNSIGNED NOT NULL ,
 `created_by` INT(11) NOT NULL  ,
 `created_date` DATETIME DEFAULT NULL ,
 `updated_by` INT(11) DEFAULT NULL ,
 `updated_date` DATETIME DEFAULT NULL ,
 PRIMARY KEY (`id`),
 KEY `fk_wf_shared_groups_user_group_id_idx` (`user_group_id`),
 KEY `fk_wf_shared_groups_status_id_idx` (`status_id`),
 KEY `fk_wf_definition_groups_definition_id_idx` (`wf_definition_id`),
 CONSTRAINT `fk_wf_definition_groups_definition_id` FOREIGN KEY (`wf_definition_id`) REFERENCES `wf_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
 CONSTRAINT `fk_wf_shared_groups_status_id` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
 CONSTRAINT `fk_wf_shared_groups_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=INNODB;

/* #13330*/

CREATE TABLE `an_st_project_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revision_number` INT UNSIGNED NOT NULL,
`stamp_an` LONGTEXT DEFAULT NULL,
`source` ENUM ('1','2','3') DEFAULT '1' COMMENT '1=DIRECT  2=ANONYMOUS_SHARE 3=INTERNAL_SHARE',
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_AN_ST_PROJ_FILE` (`file_id`, `revision_number`, `created_by`),
CONSTRAINT `FK_PROJECT_FILE_ANN_ST_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `project` (`id`),
CONSTRAINT `FK_PROJECT_FILE_ANN_ST_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `project_file` (`id`)
) ENGINE=INNODB;

CREATE TABLE `an_st_backup_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revision_number` INT UNSIGNED NOT NULL,
`stamp_an` LONGTEXT DEFAULT NULL,
`source` ENUM ('1','2','3') DEFAULT '1' COMMENT '1=DIRECT  2=ANONYMOUS_SHARE 3=INTERNAL_SHARE',
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_AN_ST_BKP_FILE` (`file_id`, `revision_number`, `created_by`),
CONSTRAINT `FK_BKP_FILE_ANN_ST_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `backup` (`id`),
CONSTRAINT `FK_BKP_FILE_ANN_ST_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `backup_file` (`id`)
) ENGINE=INNODB;

CREATE TABLE `an_st_myfiles_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revision_number` INT UNSIGNED NOT NULL,
`stamp_an` LONGTEXT DEFAULT NULL,
`source` ENUM ('1','2','3') DEFAULT '1' COMMENT '1=DIRECT  2=ANONYMOUS_SHARE 3=INTERNAL_SHARE',
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_AN_ST_MY_FILE` (`file_id`, `revision_number`, `created_by`),
CONSTRAINT `FK_MY_FILE_ANN_ST_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `myfiles` (`id`),
CONSTRAINT `FK_MY_FILE_ANN_ST_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `myfiles_file` (`id`)
) ENGINE=INNODB;

CREATE TABLE `an_st_share_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revision_number` INT UNSIGNED NOT NULL,
`stamp_an` LONGTEXT DEFAULT NULL,
`source` ENUM ('1','2','3') DEFAULT '1' COMMENT '1=DIRECT  2=ANONYMOUS_SHARE 3=INTERNAL_SHARE',
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_AN_ST_SH_FILE` (`file_id`, `revision_number`, `created_by`),
CONSTRAINT `FK_SH_FILE_ANN_ST_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `share` (`id`),
CONSTRAINT `FK_SH_FILE_ANN_ST_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `share_file` (`id`)
) ENGINE=INNODB;

CREATE TABLE `an_st_department_file` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`container_id` INT UNSIGNED NOT NULL,
`file_id` INT UNSIGNED NOT NULL,
`revision_number` INT UNSIGNED NOT NULL,
`stamp_an` LONGTEXT DEFAULT NULL,
`source` ENUM ('1','2','3') DEFAULT '1' COMMENT '1=DIRECT  2=ANONYMOUS_SHARE 3=INTERNAL_SHARE',
`status_id` INT UNSIGNED NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `IDX_AN_ST_DP_FILE` (`file_id`, `revision_number`, `created_by`),
CONSTRAINT `FK_DP_FILE_ANN_ST_CONTAINER_ID` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`),
CONSTRAINT `FK_DP_FILE_ANN_ST_FILE_ID` FOREIGN KEY (`file_id`) REFERENCES `department_file` (`id`)
) ENGINE=INNODB;

CREATE TABLE `contacts` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`status_id` INT UNSIGNED NOT NULL,
`owner_user_id` INT UNSIGNED NOT NULL,
`is_private` INT UNSIGNED NOT NULL,
`first_name` VARCHAR (100) NOT NULL,
`original_first_name` VARCHAR (100) DEFAULT NULL,
`middle_name` VARCHAR (100) DEFAULT NULL,
`last_name` VARCHAR (100) DEFAULT NULL,
`display_name` VARCHAR (100) NOT NULL,
`image_path` VARCHAR (200) DEFAULT NULL,
`gender` VARCHAR (1) DEFAULT NULL,
`dob` DATETIME NULL,
`primary_email` VARCHAR (100) DEFAULT NULL,
`private_email` VARCHAR (100) DEFAULT NULL,
`private_cell_phone` VARCHAR (50) DEFAULT NULL,
`private_telephone` VARCHAR (50) DEFAULT NULL,
`category_id` INT UNSIGNED DEFAULT NULL, /*[TBD]*/
`company_name` VARCHAR (200) DEFAULT NULL,
`company_url` VARCHAR (200) DEFAULT NULL,
`designation` VARCHAR (100) DEFAULT NULL,
`department` VARCHAR (100) DEFAULT NULL,
`business_email` VARCHAR (100) DEFAULT NULL,
`business_cell_phone` VARCHAR (50) DEFAULT NULL,
`business_telephone` VARCHAR (50) DEFAULT NULL,
`address1` VARCHAR (100) DEFAULT NULL,
`address2` VARCHAR (100) DEFAULT NULL,
`city` VARCHAR (100) DEFAULT NULL,
`business_city` VARCHAR (100) DEFAULT NULL,
`state` VARCHAR (100) DEFAULT NULL,
`business_state` VARCHAR (100) DEFAULT NULL,
`country` VARCHAR (100) DEFAULT NULL,
`business_country` VARCHAR (100) DEFAULT NULL,
`zip` VARCHAR (100) DEFAULT NULL,
`business_zip` VARCHAR (100) DEFAULT NULL,
`comments` VARCHAR (200) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_UNIQUE_CONTACT` (`owner_user_id`,`first_name`, `last_name`)
) ENGINE=INNODB;

CREATE TABLE `contacts_category` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`description` VARCHAR(100) DEFAULT NULL,
`original_name` VARCHAR (100) DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`is_private` INT UNSIGNED NOT NULL,
`owner_id` INT UNSIGNED DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_UNIQUE_CONTACT_CATEGORY` (`owner_id`,`name`,`is_private`)
) ENGINE=INNODB;

CREATE TABLE `contacts_group` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`description` VARCHAR(100) DEFAULT NULL,
`original_name` VARCHAR (100) DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`is_private` INT UNSIGNED NOT NULL,
`owner_id` INT UNSIGNED DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_UNIQUE_CONTACT_GROUP` (`owner_id`, `name`,`is_private`)
) ENGINE=INNODB;

CREATE TABLE `contacts_group_map` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`contact_id` INT UNSIGNED NOT NULL,
`group_id` VARCHAR(100) NOT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_UNIQUE_CONTACT_GROUP_MAP` (`contact_id`, `group_id`)
) ENGINE=INNODB;

CREATE TABLE `reminder_share_contact` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_id` INT(10) UNSIGNED NOT NULL,
  `reminder_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REMINDER_SHARE_CONTACT_CONTACT_ID` (`contact_id`),
  KEY `FK_REMINDER_SHARE_CONTACT_REMINDER_ID` (`reminder_id`),
  CONSTRAINT `FK_REMINDER_SHARE_CONTACT_CONTACT_ID` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`),
  CONSTRAINT `FK_REMINDER_SHARE_CONTACT_REMINDER_ID` FOREIGN KEY (`reminder_id`) REFERENCES `reminder` (`id`)
) ENGINE=INNODB;

CREATE TABLE `reminder_share_contact_group` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` INT(10) UNSIGNED NOT NULL,
  `reminder_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REMINDER_CONTACT_GROUP_GROUP_ID` (`group_id`),
  KEY `FK_REMINDER_CONTACT_GROUP_REMINDER_ID` (`reminder_id`),
  CONSTRAINT `FK_REMINDER_CONTACT_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `contacts_group` (`id`),
  CONSTRAINT `FK_REMINDER_CONTACT_GROUP_REMINDER_ID` FOREIGN KEY (`reminder_id`) REFERENCES `reminder` (`id`)
) ENGINE=INNODB;

CREATE TABLE `resource_share_contact` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`container_id` INT NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`share_id` INT UNSIGNED NOT NULL,
`contact_id` INT UNSIGNED NOT NULL,
`email` VARCHAR(200) NOT NULL,
`first_name` VARCHAR (100) NOT NULL,
`middle_name` VARCHAR (100) DEFAULT NULL,
`last_name` VARCHAR (100) DEFAULT NULL,
`display_name` VARCHAR (100) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`target_container_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`target_resource_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`read_status` TINYINT UNSIGNED DEFAULT NULL,
`target_resource_parent_id` INT DEFAULT NULL,
`is_downloadable` TINYINT DEFAULT 1,
`show_annotation` TINYINT DEFAULT 0,
`edit_annotation` TINYINT DEFAULT 0,
`enable_reshare` TINYINT DEFAULT 1,
`parent_shared_id` INT(10) UNSIGNED DEFAULT NULL,
`parent_shared_type` ENUM( 'USER','GROUP') DEFAULT NULL,
`start_date` DATETIME NOT NULL,
`end_date` DATETIME DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`resource_type` ENUM( '1','2') COMMENT '1 File, 2 Folder',
`view_count` INT DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_RESOURCE_SHARE_CNT_CONTAINER_ID` (`container_id`),
CONSTRAINT `FK_RESOURCE_SHARE_CNT_SHARE_ID` FOREIGN KEY (`share_id`) REFERENCES `resource_share` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_CNT_USER_ID` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_CNT_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `resource_share_contact_group` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`container_id` INT NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`share_id` INT UNSIGNED NOT NULL,
`contact_group_id` INT UNSIGNED NOT NULL,
`name` VARCHAR(100) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`target_container_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`target_resource_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`target_resource_parent_id` INT DEFAULT NULL,
`is_downloadable` TINYINT DEFAULT 1,
`show_annotation` TINYINT DEFAULT 0,
`edit_annotation` TINYINT DEFAULT 0,
`enable_reshare` TINYINT DEFAULT 1,
`parent_shared_id` INT(10) UNSIGNED DEFAULT NULL,
`parent_shared_type` ENUM( 'USER','GROUP') DEFAULT NULL,
`start_date` DATETIME NOT NULL,
`end_date` DATETIME DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`resource_type` ENUM( '1','2') COMMENT '1 File, 2 Folder',
`view_count` INT DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_RESOURCE_SHARE_CNT_GROUP_CONTAINER_ID` (`container_id`),
CONSTRAINT `FK_RESOURCE_SHARE_CNT_GROUP_SHARE_ID` FOREIGN KEY (`share_id`) REFERENCES `resource_share` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_CNT_GROUP_USER_GROUP_ID` FOREIGN KEY (`contact_group_id`) REFERENCES `contacts_group` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_CNT_GROUP_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `resource_share_contact_group_member` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`company_code` VARCHAR(100) NOT NULL,
`container_id` INT NOT NULL,
`resource_id` INT UNSIGNED NOT NULL,
`share_id` INT UNSIGNED NOT NULL,
`group_share_id` INT UNSIGNED NOT NULL,
`contact_group_id` INT UNSIGNED NOT NULL,
`group_name` VARCHAR(100) NOT NULL,
`contact_id` INT UNSIGNED NOT NULL,
`email` VARCHAR(200) NOT NULL,
`first_name` VARCHAR (100) NOT NULL,
`middle_name` VARCHAR (100) DEFAULT NULL,
`last_name` VARCHAR (100) DEFAULT NULL,
`display_name` VARCHAR (100) NOT NULL,
`status_id` INT UNSIGNED NOT NULL,
`read_status` TINYINT UNSIGNED DEFAULT NULL,
`target_container_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`target_resource_id` INT UNSIGNED DEFAULT NULL COMMENT 'only if share_mode is 2',
`target_resource_parent_id` INT DEFAULT NULL,
`is_downloadable` TINYINT DEFAULT 1,
`show_annotation` TINYINT DEFAULT 0,
`edit_annotation` TINYINT DEFAULT 0,
`enable_reshare` TINYINT DEFAULT 1,
`parent_shared_id` INT(10) UNSIGNED DEFAULT NULL,
`parent_shared_type` ENUM( 'USER','GROUP') DEFAULT NULL,
`start_date` DATETIME NOT NULL,
`end_date` DATETIME DEFAULT NULL,
`download_count` INT DEFAULT NULL,
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`resource_type` ENUM( '1','2') COMMENT '1 File, 2 Folder',
`view_count` INT DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `IDX_RESOURCE_SHARE_CNT_GROUP_MEMBER_CONTAINER_ID` (`container_id`),
CONSTRAINT `FK_RESOURCE_SHARE_CNT_GROUP_MEMBER_SHARE_ID` FOREIGN KEY (`share_id`) REFERENCES `resource_share` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_CNT_GROUP_MEMBER_USER_GROUP_ID` FOREIGN KEY (`contact_group_id`) REFERENCES `contacts_group` (`id`),
CONSTRAINT `FK_RESOURCE_SHARE_CNT_GROUP_MEMBER_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;


CREATE TABLE `report_favorites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `report_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REPORT_FAVORITES_STATUS_ID` (`status_id`),
  CONSTRAINT `FK_REPORT_FAVORITES_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=InnoDB;

CREATE TABLE `background_process` (
  `id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('PENDING','COMPLETED','CANCELLED','FAILED') NOT NULL,
  `created_by` INT(10) unsigned NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `project_category` (
  `id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL,
  `description` VARCHAR(200) DEFAULT NULL,
  `project_category_master_id` INT(10) unsigned DEFAULT NULL,
  `created_by` INT(10) unsigned NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_by` INT DEFAULT NULL,
  `updated_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `project_category_map` (
  `id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_category_id` INT(10) unsigned DEFAULT NULL,
  `project_category_master_id` INT(10) unsigned DEFAULT NULL,
  `project_id` INT(10) unsigned DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `created_by` INT(10) unsigned NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `project_category_master` (
  `id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `display_order` INT(11) DEFAULT '1',
  `created_by` INT(10) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` INT(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `project_template` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`category_id` INT UNSIGNED DEFAULT NULL,
`structure` LONGTEXT NOT NULL,
`department_id` INT DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`template_status` ENUM('L','R') NOT NULL,
`description` VARCHAR(200) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `IDX_PROJECT_TEMPLATE_NAME_CODE` (`name`),
CONSTRAINT `FK_PROJECT_TEMPLATE_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `department_prtl_section_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `container_id` int(10) unsigned NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `folder_id` int(10) unsigned NOT NULL,
  `order_field` varchar(120) DEFAULT NULL,
  `display_limit` int(10) NOT NULL,
  `map_id` varchar(45) DEFAULT NULL,
  `revision_no` int(10) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `container_id_idx` (`container_id`),
  CONSTRAINT `fk_department_prtl_section_config_1` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `department_prtl_file_publish` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section_config_id` int(10) unsigned NOT NULL,
  `container_id` int(10) unsigned NOT NULL,
  `folder_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  `publish_status` tinyint(4) NOT NULL,
  `revision_number` int(11) NOT NULL,
  `published_date` datetime NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `container_id_idx` (`container_id`),
  KEY `section_config_id_idx` (`section_config_id`),
  CONSTRAINT `dept_prtl-file_publish_sec_config` FOREIGN KEY (`section_config_id`) REFERENCES `department_prtl_section_config` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dept_prtl_file_publish_container_id` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `department_prtl_mssg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `container_id` int(10) unsigned NOT NULL,
  `message_text` text NOT NULL,
  `revision_no` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `container_id_UNIQUE` (`container_id`),
  KEY `fk_department_prtl_mssg_1_idx` (`container_id`),
  CONSTRAINT `fk_department_prtl_mssg_1` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `department_discssn` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `container_id` int(10) unsigned NOT NULL,
  `name` varchar(120) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_commt_sequence` int(11) NOT NULL,
  `description` varchar(120) DEFAULT NULL,
  `last_commt_date` datetime DEFAULT NULL,
  `created_by_loginname` varchar(100) NOT NULL,
  `created_by_firstname` varchar(100) NOT NULL,
  `created_by_lastname` varchar(100) DEFAULT NULL,
  `last_cmmt_by_firstname` varchar(100) DEFAULT NULL,
  `last_cmmt_by_lastname` varchar(100) DEFAULT NULL,
  `last_cmmt_owner` varchar(100) DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_department_discssn_container_id` (`container_id`),
  KEY `IDX_department_discssn_status_id` (`status_id`),
  CONSTRAINT `fk_department_discssn_container_id` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_department_discssn_status_id` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `department_discssn_commt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` int(10) unsigned NOT NULL,
  `commt_sequence` int(11) NOT NULL,
  `commt_text` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by_loginname` varchar(100) NOT NULL,
  `created_by_firstname` varchar(100) NOT NULL,
  `created_by_lastname` varchar(100) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_department_discssn_commt_dicussion_id` (`discussion_id`),
  CONSTRAINT `fk_department_discssn_commt_discussion_id` FOREIGN KEY (`discussion_id`) REFERENCES `department_discssn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `department_discssn_read_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `discussion_id` int(10) unsigned NOT NULL,
  `last_read_comment_id` int(10) unsigned NOT NULL,
  `recent_read_commt_seq` int(10) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_department_discssn_read_status_user_id` (`user_id`),
  KEY `IDX_department_discssn_read_status_discussion_id` (`discussion_id`),
  KEY `IDX_department_discssn_read_status_last_read_comment_id` (`last_read_comment_id`),
  CONSTRAINT `fk_department_discssn_read_status_dicussion_id` FOREIGN KEY (`discussion_id`) REFERENCES `department_discssn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_department_discssn_read_status_last_read_comment_id` FOREIGN KEY (`last_read_comment_id`) REFERENCES `department_discssn_commt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_department_discssn_read_status_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE `department_prtl_extrnl_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `container_id` int(10) unsigned NOT NULL,
  `name` varchar(120) NOT NULL,
  `link_url` text NOT NULL,
  `order_sequence` int(10) NOT NULL,
  `revision_no` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_department_prtl_extrnl_links_container_id_idx` (`container_id`),
  CONSTRAINT `fk_department_prtl_extrnl_links_container_id` FOREIGN KEY (`container_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;


CREATE TABLE `collaboration_email` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`status_id` INT UNSIGNED NOT NULL,
`host_name` VARCHAR (100) NOT NULL,
`port` INT NOT NULL,
`email` VARCHAR (100) NOT NULL,
`password` VARCHAR (100) NOT NULL,
`tls_enable` TINYINT(4) DEFAULT 1,
`mail_protocol` VARCHAR (100) NOT NULL,
`mail_folder` VARCHAR (100) DEFAULT 'INBOX',
`description` VARCHAR (200) DEFAULT NULL,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_COLLABORATION_EMAIL_STATUS` FOREIGN KEY (`status_id`) REFERENCES `status_master` (`id`)
) ENGINE=INNODB;

CREATE TABLE `contianer_collaboration_email_map` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
`email_alias` VARCHAR (100) NOT NULL,
`container_id` INT UNSIGNED NOT NULL,
`container_type` ENUM( '1','2','3','4','5') COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
`folder_id` INT UNSIGNED DEFAULT NULL,
`status_id` INT UNSIGNED NOT NULL,
`notify_failure` TINYINT DEFAULT '1',
`notify_success_sender` TINYINT DEFAULT '1',
`notify_success_admin` TINYINT DEFAULT '1',
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE = INNODB;

CREATE TABLE `collaboration_email_map` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`email_id` INT UNSIGNED NOT NULL,
`email_alias` VARCHAR (100) NOT NULL,
`is_default` TINYINT(4) DEFAULT 0,
`created_by` INT NOT NULL,
`created_date` DATETIME NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `FK_COLLABORATION_EMAIL_ID` FOREIGN KEY (`email_id`) REFERENCES `collaboration_email` (`id`)
) ENGINE = INNODB;

CREATE TABLE `wkf_process_category` (
`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR (50) NOT NULL,
`description` VARCHAR (200) DEFAULT NULL,
`created_by` INT(10) NOT NULL,
`created_date` DATETIME NOT NULL,
`updated_by` INT(10) DEFAULT NULL,
`updated_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_process_definition` (
  `id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `wkf_process_def` longtext NOT NULL COMMENT 'Workflow process definition',
  `wkf_process_key` VARCHAR(120) DEFAULT NULL,
  `act_proc_def_id` VARCHAR(120) DEFAULT NULL COMMENT 'activity process def Id after publishing',
  `wkf_process_category_id` int(10) unsigned NOT NULL,
  `name` VARCHAR(120) NOT NULL,
  `description` VARCHAR(200) DEFAULT NULL,
  `wkf_status_id` INT(10) unsigned NOT NULL COMMENT 'Published or Draft',
  `status_id` INT(10) unsigned NOT NULL,
  `process_status` ENUM('L','R') NOT NULL,
  `revision_number` INT(11) unsigned DEFAULT NULL,
  `created_by` INT(10) NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_by` INT(10) DEFAULT NULL,
  `updated_date` DATETIME DEFAULT NULL,
  `main_doc_upload_field_count` INT(11) UNSIGNED DEFAULT '0',
  `ref_doc_upload_field_count` INT(11) UNSIGNED DEFAULT '0',
  `has_file_upload` TINYINT(4) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `wkf_process_definition_version` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
  `wkf_process_def` LONGTEXT NOT NULL COMMENT 'Workflow process definition', 
  `act_proc_def_id` VARCHAR(120)  DEFAULT NULL COMMENT 'activity process def Id after publishing',
  `wkf_process_category_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(120)  NOT NULL,
  `description` VARCHAR(200)  DEFAULT NULL,
  `revision_number` INT(11) UNSIGNED NOT NULL,
  `created_by` INT(10) NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_by` INT(10) DEFAULT NULL,
  `updated_date` DATETIME DEFAULT NULL,
  `main_doc_upload_field_count` INT(11) UNSIGNED DEFAULT '0',
  `ref_doc_upload_field_count` INT(11) UNSIGNED DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_observer_map` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
  `revision_number` INT(11) UNSIGNED NOT NULL,
  `observer_id` INT(10) NOT NULL COMMENT 'Id of the user who is the observer in the workflow',
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_owner_map` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
  `revision_number` INT(11) UNSIGNED NOT NULL,
  `owner_id` INT(10) NOT NULL COMMENT 'Id of the user who is the owner in the workflow',
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_task_definition`(
`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
`revision_number` INT(11) UNSIGNED NOT NULL,
`wkf_task_key` VARCHAR(120) NOT NULL,
`name` VARCHAR(120) NOT NULL,
`description` VARCHAR(200) DEFAULT NULL,
`duration` INT(11) UNSIGNED DEFAULT NULL,
`wkf_task_category` ENUM('SYSTEM','MANUAL') DEFAULT 'MANUAL',
`wkf_task_type` ENUM('START','APPROVE','REVIEW','SYSTEM_TASK') DEFAULT NULL,
`enable_delegation` TINYINT(4) DEFAULT 0,
`update_file_status` TINYINT(4) DEFAULT 0,
`form_key` VARCHAR(120) DEFAULT NULL,
PRIMARY KEY (`id`)
)ENGINE=INNODB;

CREATE TABLE `wkf_task_reminder` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
  `revision_number` INT(11) UNSIGNED NOT NULL,
  `wkf_task_def_id` INT(10) UNSIGNED NOT NULL,
  `duration` INT(11) UNSIGNED NOT NULL,
  `duration_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE=INNODB;

CREATE TABLE `wkf_task_file_map` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wkf_task_instance_id` int(11) unsigned NOT NULL,
  `is_parent_task` tinyint(1) DEFAULT '0',
  `wkf_process_def_id` int(11) DEFAULT NULL,
  `def_revision_number` int(11) DEFAULT NULL,
  `wkf_process_name` varchar(120) DEFAULT NULL,
  `wkf_process_instance_id` int(11) DEFAULT NULL,
  `wkf_process_instance_name` varchar(120) DEFAULT NULL,
  `wkf_task_instance_name` varchar(120) DEFAULT NULL,
  `file_id` int(11) unsigned NOT NULL COMMENT 'sourceFile id',
  `container_type` enum('1','2','3','4','5') NOT NULL COMMENT '1 backup, 2 Project, 3 Share, 4 Department, 5 Myfile',
  `container_id` int(11) unsigned NOT NULL COMMENT 'id of sourceFile container',
  `revision_number` int(11) unsigned NOT NULL COMMENT 'sourceFile revision number',
  `workflow_file_id` int(11) unsigned NOT NULL,
  `workflow_file_status` enum('APPROVED','REJECTED','REVIEWED') DEFAULT NULL,
  `is_last_updated` tinyint(1) DEFAULT '0',
  `action_user_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `wkf_service_task` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL,
  `description` VARCHAR(200) DEFAULT NULL,
  `task_parameters` TEXT NOT NULL,
  `bean_name` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

INSERT INTO `wkf_service_task` (`id`,`name`,`description`,`task_parameters`,`bean_name`)
VALUES ('1', 'Copy File', 'Copy file', '{\"parameters\":[{\"label\":\"Source container Type\",\"variable\":\"sourceContainerType\",\"dataType\":\"STRING\",\"required\":false,\"displayOrder\":1},{\"label\":\"Source Container\",\"variable\":\"sourceContainerId\",\"dataType\":\"INTEGER\",\"required\":false,\"displayOrder\":2},{\"label\":\"Source File\",\"variable\":\"sourceFileIds\",\"dataType\":\"STRING\",\"required\":true,\"displayOrder\":3},{\"label\":\"Destination Container Type\",\"variable\":\"destContainerType\",\"dataType\":\"STRING\",\"required\":true,\"displayOrder\":4},{\"label\":\"Destination Container\",\"variable\":\"destContainerId\",\"dataType\":\"INTEGER\",\"required\":true,\"displayOrder\":5},{\"label\":\"Destination Folder\",\"variable\":\"destFolderId\",\"dataType\":\"INTEGER\",\"required\":false,\"displayOrder\":6}]}', 'copyFileSystemTask');


INSERT INTO `wkf_service_task` (`id`,`name`,`description`,`task_parameters`,`bean_name`)
VALUES('2', 'Create Folder', 'Create folder', '{\"parameters\":[{\"label\":\"Container Type\",\"variable\":\"containerType\",\"dataType\":\"STRING\",\"required\":true,\"displayOrder\":1},{\"label\":\"Container\",\"variable\":\"containerId\",\"dataType\":\"INTEGER\",\"required\":true,\"displayOrder\":2},{\"label\":\"Parent Id\",\"variable\":\"parentId\",\"dataType\":\"INTEGER\",\"required\":false,\"displayOrder\":3},{\"label\":\"Folder name\",\"variable\":\"folderName\",\"dataType\":\"STRING\",\"required\":true,\"displayOrder\":4},{\"label\":\"Folder description\",\"variable\":\"folderDescription\",\"dataType\":\"STRING\",\"required\":false,\"displayOrder\":5}]}', 'createFolderSystemTask');

INSERT INTO `wkf_service_task` (`id`,`name`,`description`,`task_parameters`,`bean_name`)
VALUES('3', 'Lock File', 'Lock or Unlock file', '{\"parameters\":[{\"label\":\"Container Type\",\"variable\":\"containerType\",\"dataType\":\"STRING\",\"required\":true,\"displayOrder\":1},{\"label\":\"Container\",\"variable\":\"containerId\",\"dataType\":\"INTEGER\",\"required\":true,\"displayOrder\":2},{\"label\":\"File\",\"variable\":\"fileIds\",\"dataType\":\"STRING\",\"required\":true,\"displayOrder\":3},{\"label\":\"Locked\",\"variable\":\"isLock\",\"dataType\":\"BOOLEAN\",\"required\":true,\"displayOrder\":4}]}', 'lockUnlockFileSystemTask');



INSERT INTO `wkf_service_task` (`id`,`name`,`description`,`task_parameters`,`bean_name`)
VALUES('4', 'Create Project', 'Create project', '{\"parameters\":[{\"label\":\"Project Name\",\"variable\":\"projectName\",\"dataType\":\"STRING\",\"required\":true,\"displayOrder\":1},{\"label\":\"Project Type\",\"variable\":\"projectTypeId\",\"dataType\":\"INTEGER\",\"required\":false,\"displayOrder\":2},{\"label\":\"Description\",\"variable\":\"description\",\"dataType\":\"STRING\",\"required\":false,\"displayOrder\":3},{\"label\":\"Start Date\",\"variable\":\"startDate\",\"dataType\":\"STRING\",\"required\":false,\"displayOrder\":4},{\"label\":\"End Date\",\"variable\":\"endDate\",\"dataType\":\"STRING\",\"required\":true,\"displayOrder\":5},{\"label\":\"Template\",\"variable\":\"templateId\",\"dataType\":\"INTEGER\",\"required\":false,\"displayOrder\":6},{\"label\":\"Category\",\"variable\":\"categoryId\",\"dataType\":\"INTEGER\",\"required\":false,\"displayOrder\":7}]}', 'createProjectSystemTask');


INSERT INTO `wkf_service_task` (`id`,`name`,`description`,`task_parameters`,`bean_name`)
VALUES('5', 'Add Project Member', 'Add group or user member to project', '{\"parameters\":[{\"label\":\"Container\",\"variable\":\"containerId\",\"dataType\":\"INTEGER\",\"required\":true,\"displayOrder\":1},{\"label\":\"User Details\",\"variable\":\"userDetails\",\"dataType\":\"STRING\",\"required\":false,\"displayOrder\":2},{\"label\":\"Group Details\",\"variable\":\"groupDetails\",\"dataType\":\"STRING\",\"required\":false,\"displayOrder\":3}]}', 'addMemberToProjectSystemTask');

CREATE TABLE `wkf_form_task_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wkf_process_def_id` int(10) unsigned NOT NULL,
  `revision_number` int(11) unsigned NOT NULL,
  `wkf_task_def_id` int(10) unsigned NOT NULL,
  `field_reference_id` varchar(120) NOT NULL,
  `field_type` varchar(120) NOT NULL,
  `default_value` TEXT DEFAULT NULL,
  `is_required` tinyint(4) unsigned DEFAULT '0',
  `field_access_type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;


CREATE TABLE `message` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` INT(10) UNSIGNED DEFAULT NULL,
  `subject` VARCHAR(200) DEFAULT NULL,
  `message` TEXT DEFAULT NULL,
  `message_type` ENUM('WORKFLOW') NOT NULL,
  `status_id` INT(10) UNSIGNED DEFAULT NULL,
  `root_parent_id` INT(10) UNSIGNED DEFAULT NULL,
  `wkf_process_instance_id` INT(10) UNSIGNED DEFAULT NULL,
  `wkf_task_instance_id` INT(10) UNSIGNED DEFAULT NULL,
  `is_edit` TINYINT(3) UNSIGNED DEFAULT '0',
  `created_by` INT(10) UNSIGNED NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `message_recipient` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message_id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `is_read` TINYINT UNSIGNED DEFAULT 0,
  `is_repiled` TINYINT UNSIGNED DEFAULT 0,
  `replied_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_visibility_user_map` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
 `revision_number` INT(11) UNSIGNED NOT NULL,
 `user_id` INT(10) NOT NULL COMMENT 'Id of the visible user',
 PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_visibility_group_map` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
 `revision_number` INT(11) UNSIGNED NOT NULL,
 `user_group_id` INT(10) NOT NULL COMMENT 'Id of the visible userGroup',
 PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_owner_group_map` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
  `revision_number` INT(11) UNSIGNED NOT NULL,
  `user_group_id` INT(10) NOT NULL COMMENT 'Id of the group whose members are the owner in the workflow',
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_owner_role_map` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
  `revision_number` INT(11) UNSIGNED NOT NULL,
  `role_id` INT(10) NOT NULL COMMENT 'Id of the role who is the owner in the workflow',
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_observer_group_map` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
  `revision_number` INT(11) UNSIGNED NOT NULL,
  `user_group_id` INT(10) NOT NULL COMMENT 'Id of the group whose members are the observer in the workflow',
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_observer_role_map` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
  `revision_number` INT(11) UNSIGNED NOT NULL,
  `role_id` INT(10) NOT NULL COMMENT 'Id of the role who is the observer in the workflow',
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_visibility_role_map` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
 `revision_number` INT(11) UNSIGNED NOT NULL,
 `role_id` INT(10) NOT NULL COMMENT 'Id of the visible role',
 PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_process_instance` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `wkf_process_def_id` INT(10) UNSIGNED NOT NULL,
 `wkf_process_key` VARCHAR(120) NOT NULL,
 `wkf_process_name` VARCHAR(120) NOT NULL,
 `act_proc_def_id` VARCHAR(120) DEFAULT NULL COMMENT 'activity process def Id after publishing',
 `act_proc_instance_id` VARCHAR(120) DEFAULT NULL COMMENT 'activity process instance Id',
 `name` VARCHAR(120) NOT NULL,
 `description` VARCHAR(200)  DEFAULT NULL,
 `status_id` INT UNSIGNED NOT NULL,
 `revision_number` INT(11) UNSIGNED NOT NULL,
 `activiti_status` ENUM('IN_PROGRESS','COMPLETED','CANCELLED','FAILED') DEFAULT 'IN_PROGRESS',
 `last_task_instance_id` INT UNSIGNED DEFAULT NULL COMMENT 'Last taskId while completing the processInstance',
 `priority` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 : Low 2 : High',
 `approval_task_status` ENUM('APPROVED','REJECTED') DEFAULT NULL,
 `created_by` INT(10) NOT NULL,
 `created_date` DATETIME NOT NULL,
 `updated_by` INT(10) DEFAULT NULL,
 `updated_date` DATETIME DEFAULT NULL,
 `completed_date` DATETIME DEFAULT NULL,
 `comments` VARCHAR(200) NULL,
 PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_task_instance` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `parent_task_id` INT(10) UNSIGNED DEFAULT NULL COMMENT 'parent Tasks id for logical grouping',
 `delegate_parent_id` INT(10) NULL COMMENT 'Id of parent task from which it is delegated',
 `delegate_super_parent_id` INT(10) NULL COMMENT 'Id of task from which the delegation is started',
 `act_task_instance_id` VARCHAR(120) DEFAULT NULL COMMENT 'activity task instance Id',
 `act_execution_id` VARCHAR(120) DEFAULT NULL COMMENT 'activity execution Id',
 `name` VARCHAR(120) NOT NULL,
 `description` VARCHAR(200) DEFAULT NULL,
 `status_id` INT UNSIGNED NOT NULL, 
 `priority` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 : Low 2 : High',
 `wkf_task_key` VARCHAR(120) NOT NULL, 
 `wkf_task_category` ENUM('SYSTEM','MANUAL') DEFAULT 'MANUAL',
 `wkf_task_type` ENUM('APPROVE','REVIEW','SYSTEM_TASK') DEFAULT NULL,
 `wkf_process_instance_id` INT(10) UNSIGNED NOT NULL,
 `wkf_process_instance_name` VARCHAR(120) NOT NULL, 
 `wkf_process_definition_id` INT(10) UNSIGNED NOT NULL,
 `wkf_process_key` VARCHAR(120) NOT NULL,
 `revision_number` INT(11) UNSIGNED NOT NULL,
 `activiti_task_status` ENUM('IN_PROGRESS','COMPLETED','CANCELLED') DEFAULT 'IN_PROGRESS',
 `completion_mode` ENUM('USER','SYSTEM','AUTO') DEFAULT NULL,
 `is_overdue` TINYINT(3) DEFAULT 0,
 `task_status` ENUM('APPROVED','REJECTED','COMPLETED','FAILED','DELEGATED'),
 `failure_code` VARCHAR(10) DEFAULT NULL,
 `execution_details` TEXT DEFAULT NULL,
 `assigned_to_id` INT(10) DEFAULT NULL,
 `assigned_date` DATETIME DEFAULT NULL,
 `assigned_by` INT(10) DEFAULT NULL,
 `enable_delegation` TINYINT(4) DEFAULT 0,
 `update_file_status` TINYINT(4) DEFAULT 0,
 `is_delegated` TINYINT UNSIGNED DEFAULT 0 COMMENT '0 : not delegated, 1 : Delegated task',
 `delegation_comment` VARCHAR(200) NULL,
 `is_escalated` TINYINT(4) DEFAULT NULL,
 `due_date` DATETIME DEFAULT NULL,
 `created_by` INT(10) DEFAULT NULL,
 `created_date` DATETIME DEFAULT NULL,
 `updated_by` INT(10) DEFAULT NULL,
 `updated_date` DATETIME DEFAULT NULL,
 `completed_date` DATETIME DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=INNODB;

CREATE TABLE `wkf_service_task_exe_details` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `act_proc_instance_id` VARCHAR(120) NOT NULL,
 `act_task_instance_id` VARCHAR(120) NOT NULL,
 `message` LONGTEXT NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=INNODB;

create table ACT_GE_PROPERTY (
    NAME_ varchar(64),
    VALUE_ varchar(300),
    REV_ integer,
    primary key (NAME_)
) ENGINE=InnoDB;

insert into ACT_GE_PROPERTY
values ('schema.version', '5.22.0.0', 1);

insert into ACT_GE_PROPERTY
values ('schema.history', 'create(5.22.0.0)', 1);

insert into ACT_GE_PROPERTY
values ('next.dbid', '1', 1);

create table ACT_GE_BYTEARRAY (
    ID_ varchar(64),
    REV_ integer,
    NAME_ varchar(255),
    DEPLOYMENT_ID_ varchar(64),
    BYTES_ LONGBLOB,
    GENERATED_ TINYINT,
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_RE_DEPLOYMENT (
    ID_ varchar(64),
    NAME_ varchar(255),
    CATEGORY_ varchar(255),
    TENANT_ID_ varchar(255) default '',
    DEPLOY_TIME_ timestamp(3) NULL,
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_RE_MODEL (
    ID_ varchar(64) not null,
    REV_ integer,
    NAME_ varchar(255),
    KEY_ varchar(255),
    CATEGORY_ varchar(255),
    CREATE_TIME_ timestamp(3) null,
    LAST_UPDATE_TIME_ timestamp(3) null,
    VERSION_ integer,
    META_INFO_ varchar(4000),
    DEPLOYMENT_ID_ varchar(64),
    EDITOR_SOURCE_VALUE_ID_ varchar(64),
    EDITOR_SOURCE_EXTRA_VALUE_ID_ varchar(64),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_RU_EXECUTION (
    ID_ varchar(64),
    REV_ integer,
    PROC_INST_ID_ varchar(64),
    BUSINESS_KEY_ varchar(191),
    PARENT_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    SUPER_EXEC_ varchar(64),
    ACT_ID_ varchar(255),
    IS_ACTIVE_ TINYINT,
    IS_CONCURRENT_ TINYINT,
    IS_SCOPE_ TINYINT,
    IS_EVENT_SCOPE_ TINYINT,
    SUSPENSION_STATE_ integer,
    CACHED_ENT_STATE_ integer,
    TENANT_ID_ varchar(255) default '',
    NAME_ varchar(255),
    LOCK_TIME_ timestamp(3) NULL,
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_RU_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(255) NOT NULL,
    LOCK_EXP_TIME_ timestamp(3) NULL,
    LOCK_OWNER_ varchar(255),
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    RETRIES_ integer,
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    DUEDATE_ timestamp(3) NULL,
    REPEAT_ varchar(255),
    HANDLER_TYPE_ varchar(255),
    HANDLER_CFG_ varchar(4000),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_RE_PROCDEF (
    ID_ varchar(64) not null,
    REV_ integer,
    CATEGORY_ varchar(255),
    NAME_ varchar(255),
    KEY_ varchar(191) not null,
    VERSION_ integer not null,
    DEPLOYMENT_ID_ varchar(64),
    RESOURCE_NAME_ varchar(4000),
    DGRM_RESOURCE_NAME_ varchar(4000),
    DESCRIPTION_ varchar(4000),
    HAS_START_FORM_KEY_ TINYINT,
    HAS_GRAPHICAL_NOTATION_ TINYINT,
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(191) default '',
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_RU_TASK (
    ID_ varchar(64),
    REV_ integer,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    NAME_ varchar(255),
    PARENT_TASK_ID_ varchar(64),
    DESCRIPTION_ varchar(4000),
    TASK_DEF_KEY_ varchar(255),
    OWNER_ varchar(255),
    ASSIGNEE_ varchar(255),
    DELEGATION_ varchar(64),
    PRIORITY_ integer,
    CREATE_TIME_ timestamp(3) NULL,
    DUE_DATE_ datetime(3),
    CATEGORY_ varchar(255),
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(255) default '',
    FORM_KEY_ varchar(255),
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_RU_IDENTITYLINK (
    ID_ varchar(64),
    REV_ integer,
    GROUP_ID_ varchar(191),
    TYPE_ varchar(255),
    USER_ID_ varchar(191),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),    
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_RU_VARIABLE (
    ID_ varchar(64) not null,
    REV_ integer,
    TYPE_ varchar(255) not null,
    NAME_ varchar(255) not null,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    TASK_ID_ varchar(64),
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_RU_EVENT_SUBSCR (
    ID_ varchar(64) not null,
    REV_ integer,
    EVENT_TYPE_ varchar(255) not null,
    EVENT_NAME_ varchar(255),
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    ACTIVITY_ID_ varchar(64),
    CONFIGURATION_ varchar(191),
    CREATED_ timestamp(3) not null DEFAULT CURRENT_TIMESTAMP(3),
    PROC_DEF_ID_ varchar(64),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_EVT_LOG (
    LOG_NR_ bigint auto_increment,
    TYPE_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    TIME_STAMP_ timestamp(3) not null,
    USER_ID_ varchar(255),
    DATA_ LONGBLOB,
    LOCK_OWNER_ varchar(255),
    LOCK_TIME_ timestamp(3) null,
    IS_PROCESSED_ tinyint default 0,
    primary key (LOG_NR_)
) ENGINE=InnoDB;

create table ACT_PROCDEF_INFO (
	ID_ varchar(64) not null,
    PROC_DEF_ID_ varchar(64) not null,
    REV_ integer,
    INFO_JSON_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB;

create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION(BUSINESS_KEY_);
create index ACT_IDX_TASK_CREATE on ACT_RU_TASK(CREATE_TIME_);
create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK(USER_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK(GROUP_ID_);
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR(CONFIGURATION_);
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE(TASK_ID_);
create index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK(PROC_DEF_ID_);
create index ACT_IDX_INFO_PROCDEF on ACT_PROCDEF_INFO(PROC_DEF_ID_);

alter table ACT_GE_BYTEARRAY
    add constraint ACT_FK_BYTEARR_DEPL 
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);

alter table ACT_RE_PROCDEF
    add constraint ACT_UNIQ_PROCDEF
    unique (KEY_,VERSION_, TENANT_ID_);
    
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCINST 
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_) on delete cascade on update cascade;

alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PARENT 
    foreign key (PARENT_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_SUPER 
    foreign key (SUPER_EXEC_) 
    references ACT_RU_EXECUTION (ID_);

alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_TSKASS_TASK 
    foreign key (TASK_ID_) 
    references ACT_RU_TASK (ID_);
    
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_ATHRZ_PROCEDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF(ID_);
    
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_IDL_PROCINST
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_);       
    
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_TASK
  	add constraint ACT_FK_TASK_PROCDEF
  	foreign key (PROC_DEF_ID_)
  	references ACT_RE_PROCDEF (ID_);
  
alter table ACT_RU_VARIABLE 
    add constraint ACT_FK_VAR_EXE 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION(ID_);

alter table ACT_RU_VARIABLE 
    add constraint ACT_FK_VAR_BYTEARRAY 
    foreign key (BYTEARRAY_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_EXCEPTION 
    foreign key (EXCEPTION_STACK_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_EVENT_SUBSCR
    add constraint ACT_FK_EVENT_EXEC
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION(ID_);
    
alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_SOURCE 
    foreign key (EDITOR_SOURCE_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_SOURCE_EXTRA 
    foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_DEPLOYMENT 
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);        

alter table ACT_PROCDEF_INFO 
    add constraint ACT_FK_INFO_JSON_BA 
    foreign key (INFO_JSON_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_PROCDEF_INFO 
    add constraint ACT_FK_INFO_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_PROCDEF_INFO
    add constraint ACT_UNIQ_INFO_PROCDEF
    unique (PROC_DEF_ID_);
create table ACT_HI_PROCINST (
    ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64) not null,
    BUSINESS_KEY_ varchar(191),
    PROC_DEF_ID_ varchar(64) not null,
    START_TIME_ datetime(3) not null,
    END_TIME_ datetime(3),
    DURATION_ bigint,
    START_USER_ID_ varchar(255),
    START_ACT_ID_ varchar(255),
    END_ACT_ID_ varchar(255),
    SUPER_PROCESS_INSTANCE_ID_ varchar(64),
    DELETE_REASON_ varchar(4000),
    TENANT_ID_ varchar(255) default '',
    NAME_ varchar(255),
    primary key (ID_),
    unique (PROC_INST_ID_)
) ENGINE=InnoDB;

create table ACT_HI_ACTINST (
    ID_ varchar(64) not null,
    PROC_DEF_ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64) not null,
    EXECUTION_ID_ varchar(64) not null,
    ACT_ID_ varchar(191) not null,
    TASK_ID_ varchar(64),
    CALL_PROC_INST_ID_ varchar(64),
    ACT_NAME_ varchar(255),
    ACT_TYPE_ varchar(255) not null,
    ASSIGNEE_ varchar(255),
    START_TIME_ datetime(3) not null,
    END_TIME_ datetime(3),
    DURATION_ bigint,
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_HI_TASKINST (
    ID_ varchar(64) not null,
    PROC_DEF_ID_ varchar(64),
    TASK_DEF_KEY_ varchar(255),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    NAME_ varchar(255),
    PARENT_TASK_ID_ varchar(64),
    DESCRIPTION_ varchar(4000),
    OWNER_ varchar(255),
    ASSIGNEE_ varchar(255),
    START_TIME_ datetime(3) not null,
    CLAIM_TIME_ datetime(3),
    END_TIME_ datetime(3),
    DURATION_ bigint,
    DELETE_REASON_ varchar(4000),
    PRIORITY_ integer,
    DUE_DATE_ datetime(3),
    FORM_KEY_ varchar(255),
    CATEGORY_ varchar(255),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_HI_VARINST (
    ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    NAME_ varchar(191) not null,
    VAR_TYPE_ varchar(100),
    REV_ integer,
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    CREATE_TIME_ datetime(3),
    LAST_UPDATED_TIME_ datetime(3),
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_HI_DETAIL (
    ID_ varchar(64) not null,
    TYPE_ varchar(255) not null,
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    ACT_INST_ID_ varchar(64),
    NAME_ varchar(191) not null,
    VAR_TYPE_ varchar(255),
    REV_ integer,
    TIME_ datetime(3) not null,
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_HI_COMMENT (
    ID_ varchar(64) not null,
    TYPE_ varchar(255),
    TIME_ datetime(3) not null,
    USER_ID_ varchar(255),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    ACTION_ varchar(255),
    MESSAGE_ varchar(4000),
    FULL_MSG_ LONGBLOB,
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_HI_ATTACHMENT (
    ID_ varchar(64) not null,
    REV_ integer,
    USER_ID_ varchar(255),
    NAME_ varchar(255),
    DESCRIPTION_ varchar(4000),
    TYPE_ varchar(255),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    URL_ varchar(4000),
    CONTENT_ID_ varchar(64),
    TIME_ datetime(3),
    primary key (ID_)
) ENGINE=InnoDB;

create table ACT_HI_IDENTITYLINK (
    ID_ varchar(64),
    GROUP_ID_ varchar(255),
    TYPE_ varchar(255),
    USER_ID_ varchar(191),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB;


create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST(END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST(BUSINESS_KEY_);
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST(START_TIME_);
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST(END_TIME_);
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL(PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL(ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL(TIME_);
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL(NAME_);
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL(TASK_ID_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST(PROC_INST_ID_);
create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST(NAME_, VAR_TYPE_);
create index ACT_IDX_HI_PROCVAR_TASK_ID on ACT_HI_VARINST(TASK_ID_);
create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST(PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST(EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK(USER_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK(TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK(PROC_INST_ID_);
create index ACT_IDX_HI_TASK_INST_PROCINST on ACT_HI_TASKINST(PROC_INST_ID_);
    
/*Workflow Reports (AdhocTemplate) - Start*/

CREATE TABLE `wkf_adhoc_report_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `wkf_process_def_id` int(10) unsigned NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `report_template_def` longtext NOT NULL COMMENT 'Workflow report template definition',
  `created_by` int(10) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `has_file_upload` tinyint(4) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

/*Workflow Reports (AdhocTemplate) - End*/

