-- --------------------------------------------------------
-- 主机:                           localhost
-- 服务器版本:                        10.1.19-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 dj_brain 的数据库结构
CREATE DATABASE IF NOT EXISTS `dj_brain` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dj_brain`;

-- 导出  表 dj_brain.auth_group 结构
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.auth_group 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- 导出  表 dj_brain.auth_group_permissions 结构
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.auth_group_permissions 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- 导出  表 dj_brain.auth_permission 结构
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.auth_permission 的数据：~36 rows (大约)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add group', 3, 'add_group'),
	(8, 'Can change group', 3, 'change_group'),
	(9, 'Can delete group', 3, 'delete_group'),
	(10, 'Can add content type', 4, 'add_contenttype'),
	(11, 'Can change content type', 4, 'change_contenttype'),
	(12, 'Can delete content type', 4, 'delete_contenttype'),
	(13, 'Can add session', 5, 'add_session'),
	(14, 'Can change session', 5, 'change_session'),
	(15, 'Can delete session', 5, 'delete_session'),
	(16, 'Can add 用户', 6, 'add_user'),
	(17, 'Can change 用户', 6, 'change_user'),
	(18, 'Can delete 用户', 6, 'delete_user'),
	(19, 'Can add ability', 7, 'add_ability'),
	(20, 'Can change ability', 7, 'change_ability'),
	(21, 'Can delete ability', 7, 'delete_ability'),
	(22, 'Can add 答案', 8, 'add_answers'),
	(23, 'Can change 答案', 8, 'change_answers'),
	(24, 'Can delete 答案', 8, 'delete_answers'),
	(25, 'Can add exhistory', 9, 'add_exhistory'),
	(26, 'Can change exhistory', 9, 'change_exhistory'),
	(27, 'Can delete exhistory', 9, 'delete_exhistory'),
	(28, 'Can add 问题', 10, 'add_questions'),
	(29, 'Can change 问题', 10, 'change_questions'),
	(30, 'Can delete 问题', 10, 'delete_questions'),
	(31, 'Can add 量表', 11, 'add_scales'),
	(32, 'Can change 量表', 11, 'change_scales'),
	(33, 'Can delete 量表', 11, 'delete_scales'),
	(34, 'Can add activehistory', 12, 'add_activehistory'),
	(35, 'Can change activehistory', 12, 'change_activehistory'),
	(36, 'Can delete activehistory', 12, 'delete_activehistory'),
	(37, 'Can add 学生', 13, 'add_student'),
	(38, 'Can change 学生', 13, 'change_student'),
	(39, 'Can delete 学生', 13, 'delete_student');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- 导出  表 dj_brain.django_admin_log 结构
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_teacher_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_teacher_user_id` FOREIGN KEY (`user_id`) REFERENCES `teacher_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.django_admin_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- 导出  表 dj_brain.django_content_type 结构
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.django_content_type 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(5, 'sessions', 'session'),
	(7, 'teacher', 'ability'),
	(12, 'teacher', 'activehistory'),
	(8, 'teacher', 'answers'),
	(9, 'teacher', 'exhistory'),
	(10, 'teacher', 'questions'),
	(11, 'teacher', 'scales'),
	(13, 'teacher', 'student'),
	(6, 'teacher', 'user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- 导出  表 dj_brain.django_migrations 结构
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.django_migrations 的数据：~33 rows (大约)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2017-05-18 01:59:51.606822'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2017-05-18 01:59:51.716198'),
	(3, 'auth', '0001_initial', '2017-05-18 01:59:52.169330'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2017-05-18 01:59:52.231828'),
	(5, 'auth', '0003_alter_user_email_max_length', '2017-05-18 01:59:52.247453'),
	(6, 'auth', '0004_alter_user_username_opts', '2017-05-18 01:59:52.247453'),
	(7, 'auth', '0005_alter_user_last_login_null', '2017-05-18 01:59:52.263078'),
	(8, 'auth', '0006_require_contenttypes_0002', '2017-05-18 01:59:52.263078'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2017-05-18 01:59:52.263078'),
	(10, 'auth', '0008_alter_user_username_max_length', '2017-05-18 01:59:52.278703'),
	(11, 'teacher', '0001_initial', '2017-05-18 01:59:53.434964'),
	(12, 'admin', '0001_initial', '2017-05-18 01:59:53.622465'),
	(13, 'admin', '0002_logentry_remove_auto_add', '2017-05-18 01:59:53.638090'),
	(14, 'sessions', '0001_initial', '2017-05-18 01:59:53.684965'),
	(15, 'teacher', '0002_auto_20170522_0952', '2017-05-22 01:52:51.673224'),
	(16, 'teacher', '0002_auto_20170526_1044', '2017-05-26 09:33:06.510469'),
	(17, 'teacher', '0003_auto_20170526_1732', '2017-05-26 09:33:06.611922'),
	(18, 'teacher', '0004_activehistory', '2017-05-27 09:11:55.129722'),
	(19, 'teacher', '0005_auto_20170531_1421', '2017-05-31 06:21:26.673951'),
	(20, 'teacher', '0006_auto_20170531_1435', '2017-05-31 06:35:48.275598'),
	(21, 'teacher', '0002_auto_20170531_1619', '2017-05-31 08:19:29.661431'),
	(22, 'teacher', '0003_user_realname', '2017-06-01 01:30:12.041944'),
	(23, 'teacher', '0004_auto_20170601_1109', '2017-06-01 03:09:40.240907'),
	(24, 'teacher', '0005_student', '2017-06-01 05:08:29.666186'),
	(25, 'teacher', '0006_auto_20170601_1509', '2017-06-01 07:09:04.884043'),
	(26, 'teacher', '0002_auto_20170601_1749', '2017-06-01 09:49:20.213773'),
	(27, 'teacher', '0002_auto_20170601_1928', '2017-06-01 11:29:00.282701'),
	(28, 'teacher', '0003_auto_20170602_0931', '2017-06-02 01:31:54.198916'),
	(29, 'teacher', '0002_auto_20170605_1518', '2017-06-05 07:18:23.254009'),
	(30, 'teacher', '0003_auto_20170605_1518', '2017-06-05 07:18:54.252584'),
	(31, 'teacher', '0004_exhistory_stype', '2017-06-05 08:40:49.290568'),
	(32, 'teacher', '0005_user_modifytime', '2017-06-06 01:29:21.748621'),
	(33, 'teacher', '0002_auto_20170607_1333', '2017-06-07 05:33:26.894267');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- 导出  表 dj_brain.django_session 结构
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.django_session 的数据：~19 rows (大约)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('05xaf1dh98auou186ahcu54r7hrabq59', 'YTZlYzZkZjEwMWMxNzUxNmRhMjI4YWI4NjlhNmE5ZmNjMDAyNWUyODp7Il9hdXRoX3VzZXJfaWQiOiI0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDU3MGZiZGQ2ZjBkN2IwZjkzOWRjY2M1N2EyMDQ3ZGY1YTQzNDMxNiJ9', '2017-06-15 03:11:07.860519'),
	('2cgbat7as706tnrbn8rm75ts4jo5nngu', 'YTNlNmFhYjBmYzE2YjFjNzA1OWFiOTZjNDBjNThiMGYxMDA2ODNiNTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzI4MzUyZDE5ODljODNlY2M5N2YzZGZhNDRjMDc0Y2NmZjk4MjY3NSJ9', '2017-06-20 07:28:11.687748'),
	('4hgzn8d6n226kw3kw6wyp3d0ac5ms7i1', 'YTNlNmFhYjBmYzE2YjFjNzA1OWFiOTZjNDBjNThiMGYxMDA2ODNiNTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzI4MzUyZDE5ODljODNlY2M5N2YzZGZhNDRjMDc0Y2NmZjk4MjY3NSJ9', '2017-06-21 05:14:02.370115'),
	('4mgzcx9qkybkmmjiyownvp4oqjoul4te', 'YTNlNmFhYjBmYzE2YjFjNzA1OWFiOTZjNDBjNThiMGYxMDA2ODNiNTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzI4MzUyZDE5ODljODNlY2M5N2YzZGZhNDRjMDc0Y2NmZjk4MjY3NSJ9', '2017-06-03 23:33:01.202648'),
	('4z4dbsltb370b3ipntk7sy9g4kxixtxy', 'YTNlNmFhYjBmYzE2YjFjNzA1OWFiOTZjNDBjNThiMGYxMDA2ODNiNTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzI4MzUyZDE5ODljODNlY2M5N2YzZGZhNDRjMDc0Y2NmZjk4MjY3NSJ9', '2017-06-23 09:26:57.109795'),
	('6gath0oxsnj9v90xpzpk26lcb87uifc4', 'OTRlNmE1MzFmZDUwMTllNjU5ZTI0NzcxZWIyYjczYjU2MzEwNjFjMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjVhODc4OGUyNTEyZTMwOTA5OTNmYmFiMDhlNmM2NzUwNzAyZmU3MiIsIl9hdXRoX3VzZXJfaWQiOiI1NCJ9', '2017-06-15 09:04:29.810134'),
	('7qqhnisb0ossyeptn4r9kc706e643dpe', 'OTRlNmE1MzFmZDUwMTllNjU5ZTI0NzcxZWIyYjczYjU2MzEwNjFjMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjVhODc4OGUyNTEyZTMwOTA5OTNmYmFiMDhlNmM2NzUwNzAyZmU3MiIsIl9hdXRoX3VzZXJfaWQiOiI1NCJ9', '2017-06-15 06:32:09.603944'),
	('7u6kq9szaro57rgta0jajir79z3zj1vw', 'YmJkNDkwNTFjYjAxMDVjMjY1ZjI3YzRmYzljZTk5OTRiOWE5N2I2Mjp7Il9hdXRoX3VzZXJfaWQiOiI3NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2RhOTU2N2VhNGYwMDYyYmYzZTE0OTlhMTM5Y2JmZTk4N2IwMDA3OSJ9', '2017-06-19 01:52:21.057910'),
	('anqp7x6gfmo3k5zyx8cc69zpyzifit32', 'ZmM0MDg1YzU0MzU4MDFlYWNmMzYzMmM3M2E1YTU2NzUxNDljMzhhNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzI4MzUyZDE5ODljODNlY2M5N2YzZGZhNDRjMDc0Y2NmZjk4MjY3NSIsIl9hdXRoX3VzZXJfaWQiOiIzMyJ9', '2017-06-15 09:09:28.386060'),
	('bb4b9vlo46bzojy18k5dxeexvzn3wtio', 'OTQ2M2JkNzdmMzFiNjlmM2Y5MTdlZGM5Yzc3OThkZDMyNTNlOTc3MDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4ODMwYmUwYjkxMzIyMWIzZDRmNWVmM2RlYTM3YWIxNTY2OWU2YWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1MSJ9', '2017-06-15 02:19:14.372650'),
	('j7pqcq6sq74o04mrye4zy06etc1wqsc2', 'YjgwMTM1NmY4ZDU5NWY0YzRlMGQ2M2NmN2QxYzUxNGE3YWM0MDQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1YTg3ODhlMjUxMmUzMDkwOTkzZmJhYjA4ZTZjNjc1MDcwMmZlNzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1NCJ9', '2017-06-15 02:31:57.136578'),
	('k103zv1859cl4t683xek93wld1cqoskz', 'YTNlNmFhYjBmYzE2YjFjNzA1OWFiOTZjNDBjNThiMGYxMDA2ODNiNTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzI4MzUyZDE5ODljODNlY2M5N2YzZGZhNDRjMDc0Y2NmZjk4MjY3NSJ9', '2017-06-20 02:49:14.698259'),
	('k3yy7xcrg4fnzod6ksxn7f0yrmbfuhe9', 'YmJkNDkwNTFjYjAxMDVjMjY1ZjI3YzRmYzljZTk5OTRiOWE5N2I2Mjp7Il9hdXRoX3VzZXJfaWQiOiI3NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2RhOTU2N2VhNGYwMDYyYmYzZTE0OTlhMTM5Y2JmZTk4N2IwMDA3OSJ9', '2017-06-19 02:14:23.616672'),
	('ldnsxerw3uqxi4npvfqfyrt30v96qojd', 'YTNlNmFhYjBmYzE2YjFjNzA1OWFiOTZjNDBjNThiMGYxMDA2ODNiNTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzI4MzUyZDE5ODljODNlY2M5N2YzZGZhNDRjMDc0Y2NmZjk4MjY3NSJ9', '2017-06-23 08:14:00.298520'),
	('qz13w2c6y6xuawn9sqgmw0xbgm73gkkf', 'NGUzZjFhYThhZDExZTA3Y2JhNWE4MWZmZDZjOGY0OTczYmQwNjk0OTp7InNkYXRhcyI6eyJyZXN1bHRDb2RlIjoyMDAwMCwicmVzdWx0TXNnIjoiXHU4M2I3XHU1M2Q2XHU2MjEwXHU1MjlmIiwiaWQiOiIyNDYxNzg2ODA5NjE3NjEzOSIsImFjY291bnRfdXVpZCI6IjI0NjE3ODY4MDk2MTc2MTQwIiwibmFtZSI6Ilx1NTkyN1x1NzM4YiIsInVzZXJuYW1lIjoid2x5MDAxIiwiYWNjb3VudF9jb21lX2Zyb20iOiJlbXBsb3llZXMiLCJvcmdfdXVpZCI6IjI0NTkwNTE5MTM2OTQ0MTMxIiwicm9sZSI6eyJpZCI6Ijk2Nzk0MjMxODU0NTk2NzI0IiwibmFtZSI6Ilx1NTMzYlx1NzUxZiJ9LCJwcml2aWxlZ2VzIjp7IlVzZXJzIjpbImNyZWF0ZSIsInVwZGF0ZSIsImdldExpc3QiLCJkZXRhaWwiXSwiQ2FzZXMiOlsiY3JlYXRlIiwidXBkYXRlIiwiZ2V0TGlzdCIsImRldGFpbCIsInVwZGF0ZUxhbG9wYXRoaWVzIiwiZ2V0TGFsb3BhdGhpZXMiLCJjb2xsZWN0aW9uVGFibGUiLCJnZXRDb2xsZWN0aW9uVGFibGUiLCJldmFsdWF0aW9uRGV0YWlsIiwidXBkYXRlVmFsaWRUaW1lIiwiZ2V0QWxsRGlhZyIsImdldEFsbEdhbWVzIl0sIlNjYWxlcyI6WyJjcmVhdGUiLCJkZWxldGUiLCJ1cGRhdGUiLCJnZXRMaXN0IiwiZGV0YWlsIl0sIlRoaXJkcGFydHkiOlsidXBkYXRlTW9kdWxlIiwiY29tbWl0IiwiZ2V0TW9kdWxlcyIsImdldE1vZHVsZVN0YXR1cyJdLCJFdmFsdWF0aW9uIjpbInNjYWxlUmVjb2RpbmciLCJnZXRTY2FsZURldGFpbCIsImdldFNjYWxlQ2F0ZWdvcmllcyIsImdldFNjYWxlcyIsImdldFNjYWxlUGF0aWVudHMiLCJnZXRMaXN0IiwiZGVsZXRlIiwic2F2ZVJlcG9ydCIsImdldFNjYWxlU3RhdHVzIiwiZGV0YWlsIiwiZXZhbHVhdGlvbkRldGFpbCIsImdldENsb3VkQ2F0ZSIsImFzc2Vzc19zY2FsZXMiLCJhc3Nlc3Nfc3RhcnQiLCJiZUJyZWFrIiwiYXNzZXNzX3JlcG9ydCIsImFzc2Vzc19wcmVwYXJlIiwiYXNzZXNzX2VuZCIsImFzc2Vzc19oaXN0b3J5IiwiZ2V0UmVMaXN0Il0sIkxhbkV2YWx1YXRpb24iOlsiZ2V0TGlzdCIsImRlbFJlcG9ydCIsImRldGFpbCIsImdldFRhc2siLCJnZXRTdWJqZWN0Iiwic2F2ZVN1YmplY3QiLCJzYXZlUmVwb3J0Iiwic2F2ZVVuaXQiLCJpbml0VGFzayIsImdldENsb3VkQ2F0ZSJdLCJHYW1lIjpbImdldENvZ25MaXN0IiwiZ2V0RXhwZXJpZW5jZUdhbWVzIiwiZ2V0R2FtZURldGFpbCIsImdldEFsbEdhbWVzIl0sIlVzZXJEYWlseVRyYWluaW5nIjpbInNhdmVHYW1lIiwic2F2ZUdhbWVCeURvY3RvciIsImdldEdhbWVMaXN0QnlEb2N0b3IiXSwiVHJhaW4iOlsiZ2V0QWxsVGFza3MiLCJnZXRUb2RheVRhc2tzIiwic2F2ZVByb2dyYW0iLCJnZXRUcmFpblJlY29yZCIsImluaXQiLCJzYXZlUXVlc3Rpb24iLCJzYXZlVGFzayIsInB1c2hSZWhhYlRhc2siLCJnZXRDbG91ZFRyYWluUmVjb3JkIiwiZ2V0U3lzdGVtUHJvZ3JhbSIsImdldE1hbnVhbFByb2dyYW0iXX0sImRlZmF1bHRQYWdlIjoiL3BhdGllbnQvbGlzdCIsInN0YXR1cyI6IjIiLCJtb2JpbGUiOiIxMjMiLCJvcmdOYW1lIjoiNjZuYW8iLCJvcmdQcm92aW5jZUlkIjoiMCIsIm9yZ0NpdHlJZCI6IjAifSwiYWNjZXNzX3Rva2VuIjoiYmQ3NDNhZWVlMjcyNGNkNjI2MzQ4YzI5MDA5ZDUwMjI0MGMyZjYwYSJ9', '2017-06-01 02:47:35.399030'),
	('s3914g5fft9i5sdln3hnkb6be6u0pffl', 'ZmM0MDg1YzU0MzU4MDFlYWNmMzYzMmM3M2E1YTU2NzUxNDljMzhhNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzI4MzUyZDE5ODljODNlY2M5N2YzZGZhNDRjMDc0Y2NmZjk4MjY3NSIsIl9hdXRoX3VzZXJfaWQiOiIzMyJ9', '2017-06-16 00:58:06.433110'),
	('syh8skvycvtrfc9swyxc2id2klb7wz2v', 'ZGFjZGQ1YWZiZTViZjgxZWU2NDViZmZjYzZiZDE1NmMzODE0NzZmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyODM1MmQxOTg5YzgzZWNjOTdmM2RmYTQ0YzA3NGNjZmY5ODI2NzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOCJ9', '2017-06-15 06:25:52.789115'),
	('x76bd7s4ofwz0jkwl0dik5b0ohb4fhoe', 'YTNlNmFhYjBmYzE2YjFjNzA1OWFiOTZjNDBjNThiMGYxMDA2ODNiNTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzI4MzUyZDE5ODljODNlY2M5N2YzZGZhNDRjMDc0Y2NmZjk4MjY3NSJ9', '2017-06-02 21:00:43.068515'),
	('ybsdzk3m8uil04dta2sy3nzqi7751dky', 'MTkzODgxNjQwN2FlOTlkMzM3ZjMwNDEyODk3MWM0MjA3NTQ5MjhmZTp7Il9hdXRoX3VzZXJfaWQiOiI3OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWI4ZmU2MTJkMWRkZTUxMGEyNTllZjIxODIwZmUxYTRjZTY0OTJiMiJ9', '2017-06-19 02:27:35.870230');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- 导出  表 dj_brain.teacher_ability 结构
CREATE TABLE IF NOT EXISTS `teacher_ability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.teacher_ability 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `teacher_ability` DISABLE KEYS */;
INSERT INTO `teacher_ability` (`id`, `name`) VALUES
	(1, '注意力'),
	(2, '记忆力'),
	(3, '执行功能'),
	(4, '言语功能'),
	(5, '创造力'),
	(6, '情绪情感'),
	(7, '社会认知'),
	(8, '信息加工速度'),
	(9, '逻辑推理');
/*!40000 ALTER TABLE `teacher_ability` ENABLE KEYS */;

-- 导出  表 dj_brain.teacher_activehistory 结构
CREATE TABLE IF NOT EXISTS `teacher_activehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `last_active` datetime(6) NOT NULL,
  `active_date` date NOT NULL COMMENT '最后激活日期到天',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.teacher_activehistory 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `teacher_activehistory` DISABLE KEYS */;
INSERT INTO `teacher_activehistory` (`id`, `uid`, `mobile`, `code`, `last_active`, `active_date`) VALUES
	(1, 32, '15295565440', 'QB8X1F', '2017-06-02 09:38:30.845457', '0000-00-00'),
	(4, 32, '', 'V9MZ1I', '2017-06-02 09:43:11.806354', '0000-00-00'),
	(7, 32, '18810355439', 'QL9PMR', '2017-06-02 09:33:35.693412', '0000-00-00'),
	(22, 32, '15295565440', '2ABOXE', '2017-06-02 09:49:39.321909', '0000-00-00'),
	(23, 32, '15295565440', 'SIEQSB', '2017-06-02 09:50:40.746435', '0000-00-00'),
	(24, 32, '15295565440', 'U9E4FN', '2017-06-02 09:51:03.952447', '0000-00-00'),
	(25, 32, '18810355439', 'Q3I9VO', '2017-06-02 10:24:32.165888', '0000-00-00'),
	(26, 32, '18810355439', 'CO53K0', '2017-06-02 10:31:29.887964', '2017-06-02'),
	(27, 32, '18810355439', 'CXS3VE', '2017-06-02 11:30:39.840180', '2017-06-02'),
	(28, 32, '18810355439', '3A12S1', '2017-06-02 01:25:52.559558', '2017-06-02'),
	(29, 32, '18810355439', '6916A6', '2017-06-02 01:53:09.705407', '2017-06-02'),
	(30, 32, '18810355439', '91F1MC', '2017-06-02 01:54:28.094990', '2017-06-02');
/*!40000 ALTER TABLE `teacher_activehistory` ENABLE KEYS */;

-- 导出  表 dj_brain.teacher_answers 结构
CREATE TABLE IF NOT EXISTS `teacher_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `content` varchar(40) NOT NULL,
  `ans_score` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `ans_img` varchar(40) NOT NULL,
  `questions_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_answers_questions_id_a3e8086b_fk_teacher_questions_id` (`questions_id`),
  CONSTRAINT `teacher_answers_questions_id_a3e8086b_fk_teacher_questions_id` FOREIGN KEY (`questions_id`) REFERENCES `teacher_questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.teacher_answers 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `teacher_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_answers` ENABLE KEYS */;

-- 导出  表 dj_brain.teacher_exhistory 结构
CREATE TABLE IF NOT EXISTS `teacher_exhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `history` varchar(2000) NOT NULL,
  `endtime` datetime(6) NOT NULL,
  `stype` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.teacher_exhistory 的数据：~61 rows (大约)
/*!40000 ALTER TABLE `teacher_exhistory` DISABLE KEYS */;
INSERT INTO `teacher_exhistory` (`id`, `uid`, `history`, `endtime`, `stype`) VALUES
	(1, 540, '{"history":{"0":{"qid":"1","scoreR":"90","scoreX":146.41666666666666,"scoreT":131.775,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"90","scoreX":15.048543689320388,"scoreT":13.54368932038835,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"90","scoreX":13.439306358381502,"scoreT":12.095375722543352,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"90","scoreX":20.159151193633953,"scoreT":18.143236074270558,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"90","scoreX":14.552238805970148,"scoreT":13.097014925373134,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"90","scoreX":1.5089722675367048,"scoreT":1.3580750407830344,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"90","scoreX":6.796116504854369,"scoreT":6.116504854368932,"ability":"7","m":"34.0","sd":"8.24"}},"com":28.018413705389627}', '2017-05-18 07:16:01.975782', 1),
	(2, 540, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-18 07:22:19.572310', 1),
	(3, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 02:44:32.750328', 1),
	(4, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 02:46:16.727395', 1),
	(5, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 02:46:49.343661', 1),
	(6, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 02:48:11.452440', 1),
	(7, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 02:49:08.482580', 1),
	(8, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 02:54:04.121808', 1),
	(9, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 02:56:13.131278', 1),
	(10, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 03:05:07.580219', 1),
	(11, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 03:05:43.182958', 1),
	(12, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 03:07:06.581771', 1),
	(13, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 03:58:52.032562', 1),
	(14, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 04:15:05.353505', 1),
	(15, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 04:23:52.606319', 1),
	(16, 29, '{"history":{"0":{"qid":"1","scoreR":"0","scoreX":-3.5833333333333335,"scoreT":-3.225,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"0","scoreX":-2.4271844660194173,"scoreT":-2.1844660194174756,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"0","scoreX":-3.9017341040462425,"scoreT":-3.511560693641618,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"0","scoreX":-3.713527851458886,"scoreT":-3.3421750663129974,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"0","scoreX":-2.2388059701492535,"scoreT":-2.014925373134328,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"0","scoreX":-5.831973898858075,"scoreT":-5.248776508972267,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"0","scoreX":-4.126213592233009,"scoreT":-3.713592233009708,"ability":"7","m":"34.0","sd":"8.24"}},"com":-3.320070842069771}', '2017-05-22 04:24:18.004094', 1),
	(17, 29, '{"history":{"0":{"qid":"1","scoreR":"10","scoreX":13.083333333333334,"scoreT":11.775,"ability":"1","m":"2.15","sd":"0.6"},"1":{"qid":"4","scoreR":"10","scoreX":-0.48543689320388345,"scoreT":-0.4368932038834951,"ability":"2","m":"12.5","sd":"5.15"},"2":{"qid":"5","scoreR":"10","scoreX":-1.9749518304431597,"scoreT":-1.7774566473988438,"ability":"3","m":"20.25","sd":"5.19"},"3":{"qid":"7","scoreR":"10","scoreX":-1.0610079575596818,"scoreT":-0.9549071618037136,"ability":"4","m":"14.0","sd":"3.77"},"4":{"qid":"9","scoreR":"10","scoreX":-0.3731343283582089,"scoreT":-0.33582089552238803,"ability":"5","m":"12.0","sd":"5.36"},"5":{"qid":"10","scoreR":"10","scoreX":-5.0163132137031,"scoreT":-4.51468189233279,"ability":"6","m":"71.5","sd":"12.26"},"6":{"qid":"11","scoreR":"10","scoreX":-2.912621359223301,"scoreT":-2.621359223300971,"ability":"7","m":"34.0","sd":"8.24"}},"com":0.1619829965368284}', '2017-05-22 09:04:54.444621', 1),
	(18, 29, '{"history": {"0": {"qid": "1", "scoreR": "10", "scoreX": 13.083333333333334, "scoreT": 100.0, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "10", "scoreX": -0.48543689320388345, "scoreT": 31.36832337135741, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "10", "scoreX": -1.9749518304431597, "scoreT": 2.41368073432222, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "10", "scoreX": -1.0610079575596818, "scoreT": 14.434314240870675, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "10", "scoreX": -0.3731343283582089, "scoreT": 35.452423517108855, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "10", "scoreX": -5.0163132137031, "scoreT": 2.633621753895727e-05, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "10", "scoreX": -2.912621359223301, "scoreT": 0.17920445029238274, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 26.263996092881293}', '2017-05-22 09:06:59.504044', 1),
	(19, 29, '{"history": {"0": {"qid": "1", "scoreR": "10", "scoreX": 13.083333333333334, "scoreT": 100.0, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "10", "scoreX": -0.48543689320388345, "scoreT": 31.36832337135741, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "10", "scoreX": -1.9749518304431597, "scoreT": 2.41368073432222, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "10", "scoreX": -1.0610079575596818, "scoreT": 14.434314240870675, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "10", "scoreX": -0.3731343283582089, "scoreT": 35.452423517108855, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "10", "scoreX": -5.0163132137031, "scoreT": 2.633621753895727e-05, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "10", "scoreX": -2.912621359223301, "scoreT": 0.17920445029238274, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 26.263996092881293}', '2017-05-22 09:08:07.147959', 1),
	(20, 28, '{"history": {"0": {"qid": "1", "scoreR": "10", "scoreX": 13.083333333333334, "scoreT": 100.0, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "10", "scoreX": -0.48543689320388345, "scoreT": 31.36832337135741, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "10", "scoreX": -1.9749518304431597, "scoreT": 2.41368073432222, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "10", "scoreX": -1.0610079575596818, "scoreT": 14.434314240870675, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "10", "scoreX": -0.3731343283582089, "scoreT": 35.452423517108855, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "10", "scoreX": -5.0163132137031, "scoreT": 2.633621753895727e-05, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "10", "scoreX": -2.912621359223301, "scoreT": 0.17920445029238274, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 26.263996092881293}', '2017-05-22 09:09:05.515975', 1),
	(21, 28, '{"history": {"0": {"qid": "1", "scoreR": "90", "scoreX": 146.41666666666666, "scoreT": 100.0, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "90", "scoreX": 15.048543689320388, "scoreT": 100.00000000000142, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "90", "scoreX": 13.439306358381502, "scoreT": 99.99999999999997, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "90", "scoreX": 20.159151193633953, "scoreT": 100.00000000000284, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "90", "scoreX": 14.552238805970148, "scoreT": 99.99999999999999, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "90", "scoreX": 1.5089722675367048, "scoreT": 93.43470649995999, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "90", "scoreX": 6.796116504854369, "scoreT": 99.9999999994626, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 99.06210092848956}', '2017-05-24 03:01:35.130323', 1),
	(22, 32, '{"history": {"0": {"qid": "1", "scoreR": "90", "scoreX": 146.41666666666666, "scoreT": 100.0, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "90", "scoreX": 15.048543689320388, "scoreT": 100.00000000000142, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "90", "scoreX": 13.439306358381502, "scoreT": 99.99999999999997, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "90", "scoreX": 20.159151193633953, "scoreT": 100.00000000000284, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "90", "scoreX": 14.552238805970148, "scoreT": 99.99999999999999, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "90", "scoreX": 1.5089722675367048, "scoreT": 93.43470649995999, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "90", "scoreX": 6.796116504854369, "scoreT": 99.9999999994626, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 99.06210092848956}', '2017-05-24 06:09:31.564217', 1),
	(23, 48, '{"history": {"0": {"qid": "1", "scoreR": "10", "scoreX": 13.083333333333334, "scoreT": 100.0, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "10", "scoreX": -0.48543689320388345, "scoreT": 31.36832337135741, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "10", "scoreX": -1.9749518304431597, "scoreT": 2.41368073432222, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "30", "scoreX": 4.244031830238727, "scoreT": 99.99890230404456, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "10", "scoreX": -0.3731343283582089, "scoreT": 35.452423517108855, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "21", "scoreX": -4.1190864600326265, "scoreT": 0.0019018870726491824, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "54", "scoreX": 2.4271844660194173, "scoreT": 99.23917416233596, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 52.63920085374881}', '2017-06-01 02:42:32.762776', 1),
	(24, 46, '{"history": {"0": {"qid": "1", "scoreR": "10", "scoreX": 13.083333333333334, "scoreT": 100.0, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "0", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "10", "scoreX": -1.9749518304431597, "scoreT": 2.41368073432222, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "10", "scoreX": -1.0610079575596818, "scoreT": 14.434314240870675, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "10", "scoreX": -0.3731343283582089, "scoreT": 35.452423517108855, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "21", "scoreX": -4.1190864600326265, "scoreT": 0.0019018870726491824, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "54", "scoreX": 2.4271844660194173, "scoreT": 99.23917416233596, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 36.043188625624914}', '2017-06-01 02:47:41.239034', 1),
	(25, 46, '{"history": {"0": {"qid": "1", "scoreR": "0", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "0", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "0", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "0", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "0", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "21", "scoreX": -4.1190864600326265, "scoreT": 0.0019018870726491824, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "54", "scoreX": 2.4271844660194173, "scoreT": 99.23917416233596, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 14.470326533196054}', '2017-06-01 03:10:12.169417', 1),
	(26, 48, '{"history": {"0": {"qid": "1", "scoreR": "0", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "0", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "0", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "0", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "0", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "21", "scoreX": -4.1190864600326265, "scoreT": 0.0019018870726491824, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "54", "scoreX": 2.4271844660194173, "scoreT": 99.23917416233596, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 14.470326533196054}', '2017-06-01 04:09:52.946881', 1),
	(27, 48, '{"history": {"0": {"qid": "1", "scoreR": "0", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "0", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "0", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "0", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "0", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "21", "scoreX": -4.1190864600326265, "scoreT": 0.0019018870726491824, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "0", "scoreX": -4.126213592233009, "scoreT": 0.001843923885428051, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 0.29356507056026443}', '2017-06-01 04:10:20.009186', 1),
	(28, 61, '{"history": {"0": {"qid": "1", "scoreR": "0", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "0", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "0", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "0", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "0", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "21", "scoreX": -4.1190864600326265, "scoreT": 0.0019018870726491824, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "54", "scoreX": 2.4271844660194173, "scoreT": 99.23917416233596, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 14.470326533196054}', '2017-06-01 07:21:40.058188', 1),
	(29, 55, '{"com": 74.82791399344447, "history": {"3": {"scoreR": "23", "ability": "3", "scoreT": 52.79729883599035, "qid": "17", "scoreX": 0.07017543859649097, "m": "22.6", "sd": "5.7"}, "4": {"scoreR": "6", "ability": "9", "scoreT": 85.29989950802657, "qid": "18", "scoreX": 1.0493827160493827, "m": "4.3", "sd": "1.62"}, "7": {"scoreR": "41", "ability": "6", "scoreT": 26.1385295451506, "qid": "22", "scoreX": -0.6390804597701153, "m": "46.56", "sd": "8.7"}, "2": {"scoreR": "9", "ability": "2", "scoreT": 78.23045624142667, "qid": "16", "scoreX": 0.7799999999999998, "m": "7.44", "sd": "2.0"}, "1": {"scoreR": "8", "ability": "1", "scoreT": 99.99999999999592, "qid": "14", "scoreX": 7.457627118644068, "m": "3.6", "sd": "0.59"}, "5": {"scoreR": "18", "ability": "4", "scoreT": 89.4350226333145, "qid": "19", "scoreX": 1.25, "m": "13.0", "sd": "4.0"}, "8": {"scoreR": "96", "ability": "7", "scoreT": 41.607721681351705, "qid": "23", "scoreX": -0.2119392440833628, "m": "102.0", "sd": "28.31"}, "6": {"scoreR": "73", "ability": "0", "scoreT": 99.99999999998292, "qid": "20", "scoreX": 7.2796934865900385, "m": "16.0", "sd": "7.83"}, "0": {"scoreR": "22", "ability": "8", "scoreT": 99.94229749576091, "qid": "13", "scoreX": 3.25, "m": "9.0", "sd": "4.0"}}}', '2017-06-01 09:06:03.961429', 1),
	(30, 48, '{"com": 0.29356507056026443, "history": {"3": {"scoreR": "0", "ability": "4", "scoreT": 0.010219497974510479, "qid": "7", "scoreX": -3.713527851458886, "m": "14.0", "sd": "3.77"}, "4": {"scoreR": "0", "ability": "5", "scoreT": 1.2584271831399276, "qid": "9", "scoreX": -2.2388059701492535, "m": "12.0", "sd": "5.36"}, "2": {"scoreR": "0", "ability": "3", "scoreT": 0.004775301720241256, "qid": "5", "scoreX": -3.9017341040462425, "m": "20.25", "sd": "5.19"}, "1": {"scoreR": "0", "ability": "2", "scoreT": 0.7608258376640342, "qid": "4", "scoreX": -2.4271844660194173, "m": "12.5", "sd": "5.15"}, "5": {"scoreR": "21", "ability": "6", "scoreT": 0.0019018870726491824, "qid": "10", "scoreX": -4.1190864600326265, "m": "71.5", "sd": "12.26"}, "6": {"scoreR": "0", "ability": "7", "scoreT": 0.001843923885428051, "qid": "11", "scoreX": -4.126213592233009, "m": "34.0", "sd": "8.24"}, "0": {"scoreR": "0", "ability": "1", "scoreT": 0.01696186246506003, "qid": "1", "scoreX": -3.5833333333333335, "m": "2.15", "sd": "0.6"}}}', '2017-06-01 09:09:06.062942', 1),
	(31, 32, '{"history": {"0": {"qid": "13", "scoreR": "0", "scoreX": -2.25, "scoreT": 1.2224472655044747, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "0", "scoreX": -6.101694915254238, "scoreT": 5.2474773256211004e-08, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "0", "scoreX": -3.72, "scoreT": 0.00996113889759108, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "0", "scoreX": -3.9649122807017547, "scoreT": 0.0036711471256393787, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "0", "scoreX": -2.654320987654321, "scoreT": 0.3973409619242156, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "0", "scoreX": -3.25, "scoreT": 0.05770250423907551, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "100", "scoreX": 10.727969348659004, "scoreT": 99.99999999999926, "ability": "0", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "18", "scoreX": -3.2827586206896555, "scoreT": 0.051398322428283065, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "0", "scoreX": -3.602967149417167, "scoreT": 0.015730265081590214, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 11.306472406408323}', '2017-06-05 01:07:59.633651', 1),
	(32, 75, '{"history": {"0": {"qid": "1", "scoreR": "0", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "16", "scoreX": 0.6796116504854368, "scoreT": 75.16248046120644, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "0", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "0", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "0", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "21", "scoreX": -4.1190864600326265, "scoreT": 0.0019018870726491824, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "0", "scoreX": -4.126213592233009, "scoreT": 0.001843923885428051, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 10.922372873923466}', '2017-06-05 07:00:55.874919', 1),
	(33, 88, '{"history": {"0": {"qid": "1", "scoreR": "10", "scoreX": 13.083333333333334, "scoreT": 100.0, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "0", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "0", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "0", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "0", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "22", "scoreX": -4.037520391517129, "scoreT": 0.0027009575282110226, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "0", "scoreX": -4.126213592233009, "scoreT": 0.001843923885428051, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 14.576970385987478}', '2017-06-05 07:14:27.928212', 1),
	(34, 88, '{"history": {"0": {"qid": "1", "scoreR": "10", "scoreX": 13.083333333333334, "scoreT": 100.0, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "0", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "0", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "0", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "0", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "22", "scoreX": -4.037520391517129, "scoreT": 0.0027009575282110226, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "0", "scoreX": -4.126213592233009, "scoreT": 0.001843923885428051, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 14.576970385987478}', '2017-06-05 07:14:40.712455', 1),
	(35, 75, '{"history": {"0": {"qid": "26", "scoreR": "0", "scoreX": -5, "scoreT": 2.866515718502537e-05, "ability": "6", "m": "12.5", "sd": "2.5"}, "1": {"qid": "27", "scoreR": "0", "scoreX": -8.859649122807017, "scoreT": 0.0, "ability": "1", "m": "5.05", "sd": "0.57"}, "2": {"qid": "28", "scoreR": "0", "scoreX": -4.404145077720208, "scoreT": 0.0005310092829165556, "ability": "2", "m": "8.5", "sd": "1.93"}, "3": {"qid": "29", "scoreR": "0", "scoreX": -3.8709677419354835, "scoreT": 0.005420206904207328, "ability": "3", "m": "24.0", "sd": "6.2"}, "4": {"qid": "30", "scoreR": "0", "scoreX": -3.2679738562091503, "scoreT": 0.05416018549864269, "ability": "9", "m": "5.0", "sd": "1.53"}, "5": {"qid": "31", "scoreR": "0", "scoreX": -5.333333333333333, "scoreT": 4.821303365951363e-06, "ability": "4", "m": "16.0", "sd": "3.0"}, "6": {"qid": "32", "scoreR": "0", "scoreX": -2.111650485436893, "scoreT": 1.7358219452908643, "ability": "5", "m": "21.75", "sd": "10.3"}, "7": {"qid": "35", "scoreR": "18", "scoreX": -7.483731019522776, "scoreT": 3.6131710132454434e-12, "ability": "6", "m": "52.5", "sd": "4.61"}, "8": {"qid": "36", "scoreR": "0", "scoreX": -5.934210526315789, "scoreT": 1.476313838024584e-07, "ability": "7", "m": "112.75", "sd": "19.0"}}, "com": 0.19955188678579763}', '2017-06-05 07:15:50.491141', 1),
	(36, 75, '{"history": {"0": {"qid": "26", "scoreR": "0", "scoreX": -5, "scoreT": 2.866515718502537e-05, "ability": "6", "m": "12.5", "sd": "2.5"}, "1": {"qid": "27", "scoreR": "0", "scoreX": -8.859649122807017, "scoreT": 0.0, "ability": "1", "m": "5.05", "sd": "0.57"}, "2": {"qid": "28", "scoreR": "0", "scoreX": -4.404145077720208, "scoreT": 0.0005310092829165556, "ability": "2", "m": "8.5", "sd": "1.93"}, "3": {"qid": "29", "scoreR": "0", "scoreX": -3.8709677419354835, "scoreT": 0.005420206904207328, "ability": "3", "m": "24.0", "sd": "6.2"}, "4": {"qid": "30", "scoreR": "0", "scoreX": -3.2679738562091503, "scoreT": 0.05416018549864269, "ability": "9", "m": "5.0", "sd": "1.53"}, "5": {"qid": "31", "scoreR": "0", "scoreX": -5.333333333333333, "scoreT": 4.821303365951363e-06, "ability": "4", "m": "16.0", "sd": "3.0"}, "6": {"qid": "32", "scoreR": "0", "scoreX": -2.111650485436893, "scoreT": 1.7358219452908643, "ability": "5", "m": "21.75", "sd": "10.3"}, "7": {"qid": "35", "scoreR": "18", "scoreX": -7.483731019522776, "scoreT": 3.6131710132454434e-12, "ability": "6", "m": "52.5", "sd": "4.61"}, "8": {"qid": "36", "scoreR": "0", "scoreX": -5.934210526315789, "scoreT": 1.476313838024584e-07, "ability": "7", "m": "112.75", "sd": "19.0"}}, "com": 0.19955188678579763}', '2017-06-05 07:15:59.406844', 1),
	(37, 75, '{"history": {"0": {"qid": "13", "scoreR": "0", "scoreX": -2.25, "scoreT": 1.2224472655044747, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "0", "scoreX": -6.101694915254238, "scoreT": 5.2474773256211004e-08, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "0", "scoreX": -3.72, "scoreT": 0.00996113889759108, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "0", "scoreX": -3.9649122807017547, "scoreT": 0.0036711471256393787, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "0", "scoreX": -2.654320987654321, "scoreT": 0.3973409619242156, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "0", "scoreX": -3.25, "scoreT": 0.05770250423907551, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "0", "scoreX": -2.0434227330779056, "scoreT": 2.0505304488311933, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "18", "scoreX": -3.2827586206896555, "scoreT": 0.051398322428283065, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "0", "scoreX": -3.602967149417167, "scoreT": 0.015730265081590214, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 0.4231980118340929}', '2017-06-05 07:17:48.083200', 1),
	(38, 88, '{"history": {"0": {"qid": "13", "scoreR": "23", "scoreX": 3.5, "scoreT": 99.97673709209653, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "5", "scoreX": 2.3728813559322033, "scoreT": 99.11750338218435, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "6", "scoreX": -0.7200000000000002, "scoreT": 23.57624977792511, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "21", "scoreX": -0.2807017543859652, "scoreT": 38.946958151402335, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "4", "scoreX": -0.18518518518518506, "scoreT": 42.65418943159657, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "21", "scoreX": 2, "scoreT": 97.72498680518211, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "76", "scoreX": 7.662835249042145, "scoreT": 99.9999999999991, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "52", "scoreX": 0.6252873563218388, "scoreT": 73.4108761611449, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "101", "scoreX": -0.03532320734722713, "scoreT": 48.591100904442555, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 69.3331779673304}', '2017-06-05 07:18:17.959906', 1),
	(39, 75, '{"history": {"0": {"qid": "13", "scoreR": "0", "scoreX": -2.25, "scoreT": 1.2224472655044747, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "0", "scoreX": -6.101694915254238, "scoreT": 5.2474773256211004e-08, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "0", "scoreX": -3.72, "scoreT": 0.00996113889759108, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "0", "scoreX": -3.9649122807017547, "scoreT": 0.0036711471256393787, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "0", "scoreX": -2.654320987654321, "scoreT": 0.3973409619242156, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "0", "scoreX": -3.25, "scoreT": 0.05770250423907551, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "0", "scoreX": -2.0434227330779056, "scoreT": 2.0505304488311933, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "18", "scoreX": -3.2827586206896555, "scoreT": 0.051398322428283065, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "0", "scoreX": -3.602967149417167, "scoreT": 0.015730265081590214, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 0.4231980118340929}', '2017-06-05 07:18:32.461363', 1),
	(40, 87, '{"history": {"0": {"qid": "13", "scoreR": "23", "scoreX": 3.5, "scoreT": 99.97673709209653, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "5", "scoreX": 2.3728813559322033, "scoreT": 99.11750338218435, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "9", "scoreX": 0.7799999999999998, "scoreT": 78.23045624142667, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "21", "scoreX": -0.2807017543859652, "scoreT": 38.946958151402335, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "6", "scoreX": 1.0493827160493827, "scoreT": 85.29989950802657, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "14", "scoreX": 0.25, "scoreT": 59.87063256829239, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "67", "scoreX": 6.513409961685824, "scoreT": 99.9999999963268, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "54", "scoreX": 0.8551724137931033, "scoreT": 80.37721471762639, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "105", "scoreX": 0.1059696220416814, "scoreT": 54.21967727289763, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 77.33767543669774}', '2017-06-05 07:21:08.411064', 1),
	(41, 75, '{"history": {"0": {"qid": "13", "scoreR": "10", "scoreX": 0.25, "scoreT": 59.87063256829239, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "10", "scoreX": 10.847457627118645, "scoreT": 99.99999999999999, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "10", "scoreX": 1.2799999999999998, "scoreT": 89.97274320455581, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "10", "scoreX": -2.210526315789474, "scoreT": 1.353432811281986, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "10", "scoreX": 3.5185185185185186, "scoreT": 99.97830182365497, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "10", "scoreX": -0.75, "scoreT": 22.66273523768682, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "10", "scoreX": -0.7662835249042146, "scoreT": 22.17538095253088, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "50", "scoreX": 0.3954022988505745, "scoreT": 65.37269936197578, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "10", "scoreX": -3.249735075944896, "scoreT": 0.05775628175036491, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 51.27152024908099}', '2017-06-05 07:23:09.819699', 1),
	(42, 87, '{"history": {"0": {"qid": "13", "scoreR": "10", "scoreX": 0.25, "scoreT": 59.87063256829239, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "10", "scoreX": 10.847457627118645, "scoreT": 99.99999999999999, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "10", "scoreX": 1.2799999999999998, "scoreT": 89.97274320455581, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "10", "scoreX": -2.210526315789474, "scoreT": 1.353432811281986, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "10", "scoreX": 3.5185185185185186, "scoreT": 99.97830182365497, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "10", "scoreX": -0.75, "scoreT": 22.66273523768682, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "10", "scoreX": -0.7662835249042146, "scoreT": 22.17538095253088, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "50", "scoreX": 0.3954022988505745, "scoreT": 65.37269936197578, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "10", "scoreX": -3.249735075944896, "scoreT": 0.05775628175036491, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 51.27152024908099}', '2017-06-05 07:26:24.775026', 1),
	(43, 87, '{"history": {"0": {"qid": "13", "scoreR": "10", "scoreX": 0.25, "scoreT": 59.87063256829239, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "10", "scoreX": 10.847457627118645, "scoreT": 99.99999999999999, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "10", "scoreX": 1.2799999999999998, "scoreT": 89.97274320455581, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "10", "scoreX": -2.210526315789474, "scoreT": 1.353432811281986, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "10", "scoreX": 3.5185185185185186, "scoreT": 99.97830182365497, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "10", "scoreX": -0.75, "scoreT": 22.66273523768682, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "10", "scoreX": -0.7662835249042146, "scoreT": 22.17538095253088, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "50", "scoreX": 0.3954022988505745, "scoreT": 65.37269936197578, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "10", "scoreX": -3.249735075944896, "scoreT": 0.05775628175036491, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 51.27152024908099}', '2017-06-05 07:26:55.353815', 1),
	(44, 75, '{"history": {"0": {"qid": "13", "scoreR": "0", "scoreX": -2.25, "scoreT": 1.2224472655044747, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "0", "scoreX": -6.101694915254238, "scoreT": 5.2474773256211004e-08, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "0", "scoreX": -3.72, "scoreT": 0.00996113889759108, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "0", "scoreX": -3.9649122807017547, "scoreT": 0.0036711471256393787, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "0", "scoreX": -2.654320987654321, "scoreT": 0.3973409619242156, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "0", "scoreX": -3.25, "scoreT": 0.05770250423907551, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "0", "scoreX": -2.0434227330779056, "scoreT": 2.0505304488311933, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "18", "scoreX": -3.2827586206896555, "scoreT": 0.051398322428283065, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "0", "scoreX": -3.602967149417167, "scoreT": 0.015730265081590214, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 0.4231980118340929}', '2017-06-05 07:30:59.722848', 1),
	(45, 75, '{"history": {"0": {"qid": "13", "scoreR": "0", "scoreX": -2.25, "scoreT": 1.2224472655044747, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "0", "scoreX": -6.101694915254238, "scoreT": 5.2474773256211004e-08, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "0", "scoreX": -3.72, "scoreT": 0.00996113889759108, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "0", "scoreX": -3.9649122807017547, "scoreT": 0.0036711471256393787, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "0", "scoreX": -2.654320987654321, "scoreT": 0.3973409619242156, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "0", "scoreX": -3.25, "scoreT": 0.05770250423907551, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "0", "scoreX": -2.0434227330779056, "scoreT": 2.0505304488311933, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "18", "scoreX": -3.2827586206896555, "scoreT": 0.051398322428283065, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "0", "scoreX": -3.602967149417167, "scoreT": 0.015730265081590214, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 0.4231980118340929}', '2017-06-05 07:34:58.407559', 1),
	(46, 88, '{"history": {"0": {"qid": "13", "scoreR": "0", "scoreX": -2.25, "scoreT": 1.2224472655044747, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "0", "scoreX": -6.101694915254238, "scoreT": 5.2474773256211004e-08, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "0", "scoreX": -3.72, "scoreT": 0.00996113889759108, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "0", "scoreX": -3.9649122807017547, "scoreT": 0.0036711471256393787, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "0", "scoreX": -2.654320987654321, "scoreT": 0.3973409619242156, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "0", "scoreX": -3.25, "scoreT": 0.05770250423907551, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "0", "scoreX": -2.0434227330779056, "scoreT": 2.0505304488311933, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "18", "scoreX": -3.2827586206896555, "scoreT": 0.051398322428283065, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "0", "scoreX": -3.602967149417167, "scoreT": 0.015730265081590214, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 0.4231980118340929}', '2017-06-05 08:09:40.870397', 1),
	(47, 88, '{"history": {"0": {"qid": "13", "scoreR": "0", "scoreX": -2.25, "scoreT": 1.2224472655044747, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "0", "scoreX": -6.101694915254238, "scoreT": 5.2474773256211004e-08, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "0", "scoreX": -3.72, "scoreT": 0.00996113889759108, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "0", "scoreX": -3.9649122807017547, "scoreT": 0.0036711471256393787, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "0", "scoreX": -2.654320987654321, "scoreT": 0.3973409619242156, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "0", "scoreX": -3.25, "scoreT": 0.05770250423907551, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "0", "scoreX": -2.0434227330779056, "scoreT": 2.0505304488311933, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "18", "scoreX": -3.2827586206896555, "scoreT": 0.051398322428283065, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "0", "scoreX": -3.602967149417167, "scoreT": 0.015730265081590214, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 0.4231980118340929}', '2017-06-05 08:09:53.220715', 1),
	(48, 73, '{"history": {"0": {"qid": "1", "scoreR": "0", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "0", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "0", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "0", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "0", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "21", "scoreX": -4.1190864600326265, "scoreT": 0.0019018870726491824, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "0", "scoreX": -4.126213592233009, "scoreT": 0.001843923885428051, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 0.29356507056026443}', '2017-06-05 08:37:54.593605', 1),
	(49, 87, '{"history": {"0": {"qid": "1", "scoreR": "0", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "0", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "0", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "0", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "0", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "21", "scoreX": -4.1190864600326265, "scoreT": 0.0019018870726491824, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "50", "scoreX": 1.941747572815534, "scoreT": 97.39161667561312, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 14.206389749378506}', '2017-06-05 08:51:43.900061', 1),
	(50, 91, '{"history": {"0": {"qid": "1", "scoreR": "0", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "0", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "0", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "0", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "0", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "21", "scoreX": -4.1190864600326265, "scoreT": 0.0019018870726491824, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "54", "scoreX": 2.4271844660194173, "scoreT": 99.23917416233596, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 14.470326533196054}', '2017-06-07 08:35:06.485039', 1),
	(51, 93, '{"history": {"0": {"qid": "1", "scoreR": "", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "0", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "0", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "0", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "21", "scoreX": -4.1190864600326265, "scoreT": 0.0019018870726491824, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "0", "scoreX": -4.126213592233009, "scoreT": 0.001843923885428051, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 0.29356507056026443}', '2017-06-08 05:44:32.621653', 1),
	(52, 92, '{"history": {"0": {"qid": "26", "scoreR": "", "scoreX": -5, "scoreT": 2.866515718502537e-05, "ability": "6", "m": "12.5", "sd": "2.5"}, "1": {"qid": "27", "scoreR": "", "scoreX": -8.859649122807017, "scoreT": 0.0, "ability": "1", "m": "5.05", "sd": "0.57"}, "2": {"qid": "28", "scoreR": "", "scoreX": -4.404145077720208, "scoreT": 0.0005310092829165556, "ability": "2", "m": "8.5", "sd": "1.93"}, "3": {"qid": "29", "scoreR": "", "scoreX": -3.8709677419354835, "scoreT": 0.005420206904207328, "ability": "3", "m": "24.0", "sd": "6.2"}, "4": {"qid": "30", "scoreR": "", "scoreX": -3.2679738562091503, "scoreT": 0.05416018549864269, "ability": "9", "m": "5.0", "sd": "1.53"}, "5": {"qid": "31", "scoreR": "", "scoreX": -5.333333333333333, "scoreT": 4.821303365951363e-06, "ability": "4", "m": "16.0", "sd": "3.0"}, "6": {"qid": "32", "scoreR": "", "scoreX": -2.111650485436893, "scoreT": 1.7358219452908643, "ability": "5", "m": "21.75", "sd": "10.3"}, "7": {"qid": "35", "scoreR": "", "scoreX": -11.388286334056398, "scoreT": 0.0, "ability": "6", "m": "52.5", "sd": "4.61"}, "8": {"qid": "36", "scoreR": "", "scoreX": -5.934210526315789, "scoreT": 1.476313838024584e-07, "ability": "7", "m": "112.75", "sd": "19.0"}}, "com": 0.19955188678539618}', '2017-06-08 06:11:39.075586', 3),
	(53, 92, '{"history": {"0": {"qid": "26", "scoreR": "", "scoreX": -5, "scoreT": 2.866515718502537e-05, "ability": "6", "m": "12.5", "sd": "2.5"}, "1": {"qid": "27", "scoreR": "", "scoreX": -8.859649122807017, "scoreT": 0.0, "ability": "1", "m": "5.05", "sd": "0.57"}, "2": {"qid": "28", "scoreR": "", "scoreX": -4.404145077720208, "scoreT": 0.0005310092829165556, "ability": "2", "m": "8.5", "sd": "1.93"}, "3": {"qid": "29", "scoreR": "", "scoreX": -3.8709677419354835, "scoreT": 0.005420206904207328, "ability": "3", "m": "24.0", "sd": "6.2"}, "4": {"qid": "30", "scoreR": "", "scoreX": -3.2679738562091503, "scoreT": 0.05416018549864269, "ability": "9", "m": "5.0", "sd": "1.53"}, "5": {"qid": "31", "scoreR": "", "scoreX": -5.333333333333333, "scoreT": 4.821303365951363e-06, "ability": "4", "m": "16.0", "sd": "3.0"}, "6": {"qid": "32", "scoreR": "", "scoreX": -2.111650485436893, "scoreT": 1.7358219452908643, "ability": "5", "m": "21.75", "sd": "10.3"}, "7": {"qid": "35", "scoreR": "", "scoreX": -11.388286334056398, "scoreT": 0.0, "ability": "6", "m": "52.5", "sd": "4.61"}, "8": {"qid": "36", "scoreR": "", "scoreX": -5.934210526315789, "scoreT": 1.476313838024584e-07, "ability": "7", "m": "112.75", "sd": "19.0"}}, "com": 0.19955188678539618}', '2017-06-08 06:13:47.173723', 3),
	(54, 92, '{"history": {"0": {"qid": "26", "scoreR": "", "scoreX": -5, "scoreT": 2.866515718502537e-05, "ability": "6", "m": "12.5", "sd": "2.5"}, "1": {"qid": "27", "scoreR": "", "scoreX": -8.859649122807017, "scoreT": 0.0, "ability": "1", "m": "5.05", "sd": "0.57"}, "2": {"qid": "28", "scoreR": "", "scoreX": -4.404145077720208, "scoreT": 0.0005310092829165556, "ability": "2", "m": "8.5", "sd": "1.93"}, "3": {"qid": "29", "scoreR": "", "scoreX": -3.8709677419354835, "scoreT": 0.005420206904207328, "ability": "3", "m": "24.0", "sd": "6.2"}, "4": {"qid": "30", "scoreR": "", "scoreX": -3.2679738562091503, "scoreT": 0.05416018549864269, "ability": "9", "m": "5.0", "sd": "1.53"}, "5": {"qid": "31", "scoreR": "", "scoreX": -5.333333333333333, "scoreT": 4.821303365951363e-06, "ability": "4", "m": "16.0", "sd": "3.0"}, "6": {"qid": "32", "scoreR": "", "scoreX": -2.111650485436893, "scoreT": 1.7358219452908643, "ability": "5", "m": "21.75", "sd": "10.3"}, "7": {"qid": "35", "scoreR": "", "scoreX": -11.388286334056398, "scoreT": 0.0, "ability": "6", "m": "52.5", "sd": "4.61"}, "8": {"qid": "36", "scoreR": "", "scoreX": -5.934210526315789, "scoreT": 1.476313838024584e-07, "ability": "7", "m": "112.75", "sd": "19.0"}}, "com": 0.19955188678539618}', '2017-06-08 06:14:57.835807', 3),
	(55, 92, '{"history": {"0": {"qid": "26", "scoreR": "", "scoreX": -5, "scoreT": 2.866515718502537e-05, "ability": "6", "m": "12.5", "sd": "2.5"}, "1": {"qid": "27", "scoreR": "", "scoreX": -8.859649122807017, "scoreT": 0.0, "ability": "1", "m": "5.05", "sd": "0.57"}, "2": {"qid": "28", "scoreR": "", "scoreX": -4.404145077720208, "scoreT": 0.0005310092829165556, "ability": "2", "m": "8.5", "sd": "1.93"}, "3": {"qid": "29", "scoreR": "", "scoreX": -3.8709677419354835, "scoreT": 0.005420206904207328, "ability": "3", "m": "24.0", "sd": "6.2"}, "4": {"qid": "30", "scoreR": "", "scoreX": -3.2679738562091503, "scoreT": 0.05416018549864269, "ability": "9", "m": "5.0", "sd": "1.53"}, "5": {"qid": "31", "scoreR": "", "scoreX": -5.333333333333333, "scoreT": 4.821303365951363e-06, "ability": "4", "m": "16.0", "sd": "3.0"}, "6": {"qid": "32", "scoreR": "", "scoreX": -2.111650485436893, "scoreT": 1.7358219452908643, "ability": "5", "m": "21.75", "sd": "10.3"}, "7": {"qid": "35", "scoreR": "", "scoreX": -11.388286334056398, "scoreT": 0.0, "ability": "6", "m": "52.5", "sd": "4.61"}, "8": {"qid": "36", "scoreR": "", "scoreX": -5.934210526315789, "scoreT": 1.476313838024584e-07, "ability": "7", "m": "112.75", "sd": "19.0"}}, "com": 0.19955188678539618}', '2017-06-08 06:15:43.157195', 3),
	(56, 92, '{"history": {"0": {"qid": "26", "scoreR": "", "scoreX": -5, "scoreT": 2.866515718502537e-05, "ability": "6", "m": "12.5", "sd": "2.5"}, "1": {"qid": "27", "scoreR": "", "scoreX": -8.859649122807017, "scoreT": 0.0, "ability": "1", "m": "5.05", "sd": "0.57"}, "2": {"qid": "28", "scoreR": "", "scoreX": -4.404145077720208, "scoreT": 0.0005310092829165556, "ability": "2", "m": "8.5", "sd": "1.93"}, "3": {"qid": "29", "scoreR": "", "scoreX": -3.8709677419354835, "scoreT": 0.005420206904207328, "ability": "3", "m": "24.0", "sd": "6.2"}, "4": {"qid": "30", "scoreR": "", "scoreX": -3.2679738562091503, "scoreT": 0.05416018549864269, "ability": "9", "m": "5.0", "sd": "1.53"}, "5": {"qid": "31", "scoreR": "", "scoreX": -5.333333333333333, "scoreT": 4.821303365951363e-06, "ability": "4", "m": "16.0", "sd": "3.0"}, "6": {"qid": "32", "scoreR": "", "scoreX": -2.111650485436893, "scoreT": 1.7358219452908643, "ability": "5", "m": "21.75", "sd": "10.3"}, "7": {"qid": "35", "scoreR": "", "scoreX": -11.388286334056398, "scoreT": 0.0, "ability": "6", "m": "52.5", "sd": "4.61"}, "8": {"qid": "36", "scoreR": "", "scoreX": -5.934210526315789, "scoreT": 1.476313838024584e-07, "ability": "7", "m": "112.75", "sd": "19.0"}}, "com": 0.19955188678539618}', '2017-06-08 06:16:02.007765', 3),
	(57, 93, '{"history": {"0": {"qid": "1", "scoreR": "", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "", "scoreX": -5.831973898858075, "scoreT": 2.7387744550573945e-07, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "", "scoreX": -4.126213592233009, "scoreT": 0.001843923885428051, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 0.2932934115323782}', '2017-06-08 07:48:10.208459', 1),
	(58, 93, '{"history": {"0": {"qid": "1", "scoreR": "", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "", "scoreX": -5.831973898858075, "scoreT": 2.7387744550573945e-07, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "", "scoreX": -4.126213592233009, "scoreT": 0.001843923885428051, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 0.2932934115323782}', '2017-06-09 05:05:47.769014', 1),
	(59, 93, '{"history": {"0": {"qid": "13", "scoreR": "", "scoreX": -2.25, "scoreT": 1.2224472655044747, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "", "scoreX": -6.101694915254238, "scoreT": 5.2474773256211004e-08, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "", "scoreX": -3.72, "scoreT": 0.00996113889759108, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "", "scoreX": -3.9649122807017547, "scoreT": 0.0036711471256393787, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "", "scoreX": -2.654320987654321, "scoreT": 0.3973409619242156, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "", "scoreX": -3.25, "scoreT": 0.05770250423907551, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "", "scoreX": -2.0434227330779056, "scoreT": 2.0505304488311933, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "", "scoreX": -5.351724137931035, "scoreT": 4.356007033363733e-06, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "", "scoreX": -3.602967149417167, "scoreT": 0.015730265081590214, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 0.41748757112062074}', '2017-06-09 05:37:09.080865', 2),
	(60, 93, '{"history": {"0": {"qid": "13", "scoreR": "", "scoreX": -2.25, "scoreT": 1.2224472655044747, "ability": "8", "m": "9.0", "sd": "4.0"}, "1": {"qid": "14", "scoreR": "", "scoreX": -6.101694915254238, "scoreT": 5.2474773256211004e-08, "ability": "1", "m": "3.6", "sd": "0.59"}, "2": {"qid": "16", "scoreR": "", "scoreX": -3.72, "scoreT": 0.00996113889759108, "ability": "2", "m": "7.44", "sd": "2.0"}, "3": {"qid": "17", "scoreR": "", "scoreX": -3.9649122807017547, "scoreT": 0.0036711471256393787, "ability": "3", "m": "22.6", "sd": "5.7"}, "4": {"qid": "18", "scoreR": "", "scoreX": -2.654320987654321, "scoreT": 0.3973409619242156, "ability": "9", "m": "4.3", "sd": "1.62"}, "5": {"qid": "19", "scoreR": "", "scoreX": -3.25, "scoreT": 0.05770250423907551, "ability": "4", "m": "13.0", "sd": "4.0"}, "6": {"qid": "20", "scoreR": "", "scoreX": -2.0434227330779056, "scoreT": 2.0505304488311933, "ability": "5", "m": "16.0", "sd": "7.83"}, "7": {"qid": "22", "scoreR": "", "scoreX": -5.351724137931035, "scoreT": 4.356007033363733e-06, "ability": "6", "m": "46.56", "sd": "8.7"}, "8": {"qid": "23", "scoreR": "", "scoreX": -3.602967149417167, "scoreT": 0.015730265081590214, "ability": "7", "m": "102.0", "sd": "28.31"}}, "com": 0.41748757112062074}', '2017-06-09 05:38:11.303073', 2),
	(61, 93, '{"history": {"0": {"qid": "1", "scoreR": "", "scoreX": -3.5833333333333335, "scoreT": 0.01696186246506003, "ability": "1", "m": "2.15", "sd": "0.6"}, "1": {"qid": "4", "scoreR": "", "scoreX": -2.4271844660194173, "scoreT": 0.7608258376640342, "ability": "2", "m": "12.5", "sd": "5.15"}, "2": {"qid": "5", "scoreR": "", "scoreX": -3.9017341040462425, "scoreT": 0.004775301720241256, "ability": "3", "m": "20.25", "sd": "5.19"}, "3": {"qid": "7", "scoreR": "", "scoreX": -3.713527851458886, "scoreT": 0.010219497974510479, "ability": "4", "m": "14.0", "sd": "3.77"}, "4": {"qid": "9", "scoreR": "", "scoreX": -2.2388059701492535, "scoreT": 1.2584271831399276, "ability": "5", "m": "12.0", "sd": "5.36"}, "5": {"qid": "10", "scoreR": "", "scoreX": -5.831973898858075, "scoreT": 2.7387744550573945e-07, "ability": "6", "m": "71.5", "sd": "12.26"}, "6": {"qid": "11", "scoreR": "", "scoreX": -4.126213592233009, "scoreT": 0.001843923885428051, "ability": "7", "m": "34.0", "sd": "8.24"}}, "com": 0.2932934115323782}', '2017-06-09 09:27:06.636339', 1);
/*!40000 ALTER TABLE `teacher_exhistory` ENABLE KEYS */;

-- 导出  表 dj_brain.teacher_questions 结构
CREATE TABLE IF NOT EXISTS `teacher_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `img_src` varchar(40) NOT NULL,
  `sid` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `act_explain` varchar(40) NOT NULL,
  `right_answer` varchar(40) NOT NULL,
  `m` double NOT NULL,
  `sd` double NOT NULL,
  `ability_id` int(11) NOT NULL,
  `range_score` int(11) NOT NULL,
  `scales_id` int(11) NOT NULL,
  `min_score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_questions_scales_id_669fdb65_fk_teacher_scales_id` (`scales_id`),
  CONSTRAINT `teacher_questions_scales_id_669fdb65_fk_teacher_scales_id` FOREIGN KEY (`scales_id`) REFERENCES `teacher_scales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.teacher_questions 的数据：~25 rows (大约)
/*!40000 ALTER TABLE `teacher_questions` DISABLE KEYS */;
INSERT INTO `teacher_questions` (`id`, `title`, `img_src`, `sid`, `type`, `act_explain`, `right_answer`, `m`, `sd`, `ability_id`, `range_score`, `scales_id`, `min_score`) VALUES
	(1, '划消测验任务得分是 :', 'xx', 1, 3, 'sss', 'sss', 2.15, 0.6, 1, 10, 1, 0),
	(4, '数字广度测验任务得分是 :', 'xx', 1, 3, 'sss', 'sss', 12.5, 5.15, 2, 16, 1, 0),
	(5, '迷津测验任务得分是 :', 'xx', 1, 3, 'sss', 'sss', 20.25, 5.19, 3, 30, 1, 0),
	(7, '语义流畅性测试任务得分是 :', 'xx', 1, 3, 'sss', 'sss', 14, 3.77, 4, 30, 1, 0),
	(9, '非常规用途测验任务得分是 :', 'xx', 1, 3, 'sss', 'sss', 12, 5.36, 5, 100, 1, 0),
	(10, '幼儿情绪发展状况调查问卷得分是 :', 'xx', 1, 3, 'sss', 'sss', 71.5, 12.26, 6, 105, 1, 21),
	(11, '幼儿社会认知发展状况调查问卷得分是 :', 'xx', 1, 3, 'sss', 'sss', 34, 8.24, 7, 54, 1, 0),
	(13, '符号比较任务得分是 :', 'xx', 2, 3, 'sss', 'sss', 9, 4, 8, 30, 2, 0),
	(14, '划消测验任务得分是 :', 'xx', 2, 3, 'sss', 'sss', 3.6, 0.59, 1, 10, 2, 0),
	(16, '数字广度测验（倒背）任务得分是 :', 'xx', 2, 3, 'sss', 'sss', 7.44, 2, 2, 16, 2, 0),
	(17, '迷津测验任务得分是 :', 'xx', 2, 3, 'sss', 'sss', 22.6, 5.7, 3, 30, 2, 0),
	(18, '瑞文测验任务得分是 :', 'xx', 2, 3, 'sss', 'sss', 4.3, 1.62, 9, 10, 2, 0),
	(19, '类同测验任务得分是 :', 'xx', 2, 3, 'sss', 'sss', 13, 4, 4, 26, 2, 0),
	(20, '非常规用途测验任务得分是 :', 'xx', 2, 3, 'sss', 'sss', 16, 7.83, 5, 100, 2, 0),
	(22, '儿童情绪智力量表得分是 :', 'xx', 2, 3, 'sss', 'sss', 46.56, 8.7, 6, 72, 2, 18),
	(23, '儿童社会智力量表得分是 :', 'xx', 2, 3, 'sss', 'sss', 102, 28.31, 7, 144, 2, 0),
	(26, '符号比较B任务得分 :', 'xx', 3, 3, 'sss', 'sss', 12.5, 2.5, 8, 30, 3, 0),
	(27, '划消测验任务得分 :', 'xx', 3, 3, 'sss', 'sss', 5.05, 0.57, 1, 10, 3, 0),
	(28, '数字广度测验（倒背）任务得分是 :', 'xx', 3, 3, 'sss', 'sss', 8.5, 1.93, 2, 16, 3, 0),
	(29, '迷津测验B任务得分是  :', 'xx', 3, 3, 'sss', 'sss', 24, 6.2, 3, 30, 3, 0),
	(30, '瑞文测验B任务得分是 :', 'xx', 3, 3, 'sss', 'sss', 5, 1.53, 9, 10, 3, 0),
	(31, '类同测验任务得分是 :', 'xx', 3, 3, 'sss', 'sss', 16, 3, 4, 26, 3, 0),
	(32, '非常规用途测验任务得分是 :', 'xx', 3, 3, 'sss', 'sss', 21.75, 10.3, 5, 100, 3, 0),
	(35, '儿童情绪智力量表得分是 :', 'xx', 3, 3, 'sss', 'sss', 52.5, 4.61, 6, 72, 3, 18),
	(36, '儿童社会智力量表得分是  :', 'xx', 3, 3, 'sss', 'sss', 112.75, 19, 7, 144, 3, 0);
/*!40000 ALTER TABLE `teacher_questions` ENABLE KEYS */;

-- 导出  表 dj_brain.teacher_scales 结构
CREATE TABLE IF NOT EXISTS `teacher_scales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `stype` varchar(10) NOT NULL,
  `explain` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `stype` (`stype`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.teacher_scales 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `teacher_scales` DISABLE KEYS */;
INSERT INTO `teacher_scales` (`id`, `name`, `stype`, `explain`) VALUES
	(1, '3-6岁', 'A', '3-6岁儿童脑适能评估量表'),
	(2, '7-9岁', 'B', '7-9岁儿童脑适能评估量表'),
	(3, '10-12岁', 'C', '10-12岁儿童脑适能评估量表');
/*!40000 ALTER TABLE `teacher_scales` ENABLE KEYS */;

-- 导出  表 dj_brain.teacher_student 结构
CREATE TABLE IF NOT EXISTS `teacher_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(200) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `adduid` int(11) NOT NULL,
  `address` varchar(40) DEFAULT NULL,
  `organization` varchar(40) DEFAULT NULL,
  `sex` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `utype` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `guardian` varchar(40) DEFAULT NULL,
  `relationship` varchar(40) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.teacher_student 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `teacher_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_student` ENABLE KEYS */;

-- 导出  表 dj_brain.teacher_user 结构
CREATE TABLE IF NOT EXISTS `teacher_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(200),
  `qq` varchar(20) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `adduid` int(11) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `organization` varchar(40) DEFAULT NULL,
  `sex` int(11) unsigned zerofill DEFAULT NULL COMMENT '性别',
  `age` int(11) unsigned DEFAULT NULL,
  `grade` int(11) unsigned zerofill DEFAULT NULL,
  `utype` int(11) unsigned zerofill DEFAULT NULL,
  `guardian` varchar(40) COMMENT '联系人',
  `relationship` varchar(40) COMMENT '与联系人关系',
  `realname` varchar(20) DEFAULT NULL,
  `modifytime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.teacher_user 的数据：~79 rows (大约)
/*!40000 ALTER TABLE `teacher_user` DISABLE KEYS */;
INSERT INTO `teacher_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `avatar`, `qq`, `mobile`, `url`, `adduid`, `address`, `organization`, `sex`, `age`, `grade`, `utype`, `guardian`, `relationship`, `realname`, `modifytime`) VALUES
	(1, 'pbkdf2_sha256$36000$TXcEN1TdkAHT$/mx8Wa1BIk70pWQOerX0Fa9GqWZucnd6Zeotu5E3nFs=', NULL, 0, 'wushdong', '', '', 'wushidong@qq.com', 0, 1, '2017-05-18 08:37:17.477438', 'avatar/default.png', NULL, '15295565445', 'http://www.xuebuyuan.com', 18, NULL, NULL, 00000000001, NULL, NULL, NULL, 'xx', 'xx', NULL, '2017-06-06 01:29:21.639245'),
	(4, 'pbkdf2_sha256$36000$kpUpqVoPdsrN$kofKyZmJFvvhspZ0zbHhlIvMIen2tTAAyONPTgSU+o8=', '2017-05-18 08:42:19.930180', 0, 'wushdong2', '', '', 'wushidong@qq.com', 0, 1, '2017-05-18 08:42:19.900154', 'avatar/default.png', NULL, '15295565444', 'http://www.xuebuyuan.com', 18, NULL, NULL, 00000000001, NULL, NULL, NULL, 'xx', 'xx', NULL, '2017-06-06 01:29:21.639245'),
	(16, 'pbkdf2_sha256$36000$cW8NzBlQjyTQ$ivbykrllfSRarhPaeHEeQpoiODgTtPMfZu8N2uD4yK4=', '2017-05-18 08:46:11.672452', 0, 'xiaoxiao', '', '', 'xiaoxiao@qq.com', 0, 1, '2017-05-18 08:46:11.646860', 'avatar/default.png', NULL, '15295565443', 'http://www.xuebuyuan.com', 18, NULL, NULL, 00000000001, NULL, NULL, NULL, 'xx', 'xx', NULL, '2017-06-06 01:29:21.639245'),
	(17, 'pbkdf2_sha256$36000$r7zoPzsVn8NU$EgY3X3b8o8vo8e5otM4QUnGwWUYxY0xhdfSdW5isf1M=', '2017-05-18 08:46:43.015784', 0, 'xiaoxiao2', '', '', 'xiaoxiao@qq.com', 0, 1, '2017-05-18 08:46:42.993768', 'avatar/default.png', NULL, '15295565442', 'http://www.xuebuyuan.com', 18, NULL, NULL, 00000000001, NULL, NULL, NULL, 'xx', 'xx', NULL, '2017-06-06 01:29:21.639245'),
	(18, 'pbkdf2_sha256$36000$GrVMhbxC7YUf$iiJ8nSApJaSS6PccmjGV1DusyfzwtGf0/0Zg2vFQKCc=', '2017-06-09 09:26:57.103794', 0, 'wly001', '', '', 'dkal@dkal.com', 0, 1, '2017-05-19 01:36:10.336615', '/uploads/avatar/default.png', NULL, '15295565440', 'http://www.xuebuyuan.com', 0, NULL, NULL, 00000000001, 28, 00000000021, 00000000002, 'xx', 'xx', '王老师', '2017-06-06 01:29:21.639245'),
	(19, 'pbkdf2_sha256$36000$GrVMhbxC7YUf$iiJ8nSApJaSS6PccmjGV1DusyfzwtGf0/0Zg2vFQKCc=', '2017-05-19 11:06:23.000000', 0, '吴东', '', '', 'wudong@163.com', 0, 1, '0000-00-00 00:00:00.000000', '/uploads/avatar/2017/5/e00db868-3eb5-11e7-a756-dc9c521d6e7e.jpg', '1070490031', '15295565441', 'http://www.xuebuyuan.com', 18, NULL, NULL, 00000000001, NULL, NULL, NULL, 'xx', 'xx', NULL, '2017-06-06 01:29:21.639245'),
	(20, '', NULL, 0, '舞动', '', '', '', 0, 1, '2017-05-19 09:10:00.208382', 'avatar/default.png', NULL, NULL, NULL, 0, NULL, NULL, 00000000002, 12, 00000000011, 00000000002, 'xx', 'xx', NULL, '2017-06-06 01:29:21.639245'),
	(21, '', NULL, 0, '无懂', '', '', '', 0, 1, '2017-05-19 09:12:20.265859', 'avatar/default.png', NULL, NULL, NULL, 0, NULL, NULL, 00000000001, 12, 00000000011, 00000000002, 'xx', 'xx', NULL, '2017-06-06 01:29:21.639245'),
	(22, '', NULL, 0, '得到', '', '', '', 0, 1, '2017-05-19 09:17:39.506541', 'avatar/default.png', NULL, NULL, NULL, 18, NULL, NULL, 00000000001, 12, 00000000006, 00000000002, 'xx', 'xx', '得到', '2017-06-06 01:29:21.639245'),
	(24, '', NULL, 0, '得到1', '', '', '', 0, 1, '2017-05-19 09:18:02.704513', 'avatar/default.png', NULL, NULL, NULL, 18, NULL, NULL, 00000000001, 12, 00000000006, 00000000002, 'xx', 'xx', NULL, '2017-06-06 01:29:21.639245'),
	(25, '', NULL, 0, '得到12', '', '', '', 0, 1, '2017-05-19 09:18:33.813793', 'avatar/default.png', NULL, NULL, NULL, 18, NULL, NULL, 00000000001, 12, 00000000006, 00000000002, 'xx', 'xx', NULL, '2017-06-06 01:29:21.639245'),
	(26, '', NULL, 0, '解决', '', '', '', 0, 1, '2017-05-19 09:19:27.340545', 'avatar/default.png', NULL, NULL, NULL, 18, NULL, NULL, 00000000002, 11, 00000000004, 00000000002, 'xx', 'xx', NULL, '2017-06-06 01:29:21.639245'),
	(27, '', NULL, 0, '刚刚', '', '', '', 0, 1, '2017-05-19 09:20:34.239164', 'avatar/default.png', NULL, NULL, NULL, 18, NULL, NULL, 00000000002, 12, 00000000002, 00000000002, 'xx', 'xx', NULL, '2017-06-06 01:29:21.639245'),
	(28, 'pbkdf2_sha256$36000$aZpE5zGMKqmp$in0oovDOSaggY/5bbbmwiUjPIjpxeoqiMa3fVQGE+38=', NULL, 0, '急', '', '', '', 0, 1, '2017-05-19 09:21:43.045499', 'avatar/default.png', NULL, '15295565449', NULL, 18, NULL, NULL, 00000000002, 26, 00000000004, 00000000002, '个哥哥', '个哥哥', 'kkk', '2017-06-07 08:11:54.194883'),
	(29, 'pbkdf2_sha256$36000$EyCPmxpeoHqg$HOUcsipoX+OmSwKBSYK1kyVHGIOtS2cJiu3BPqjlyjo=', '2017-05-23 06:41:51.690378', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2017-05-23 06:11:11.274640', 'uploads/avatar/default.png', NULL, NULL, NULL, 0, NULL, NULL, 00000000000, 0, 00000000000, 00000000000, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(32, 'pbkdf2_sha256$36000$2SCJVTZWAQLV$iBZbChwFStNF3OV1WjGij2tuoPvmDpvOdRyxbWVKaK0=', '2017-06-05 05:16:18.079185', 0, 'dkal', '', '', '', 0, 1, '2017-05-23 06:21:24.163693', '/uploads/avatar/default.png', NULL, '18810355439', NULL, 18, NULL, NULL, 00000000002, 25, 00000000020, 00000000002, '谢谢', '谢', '笛卡尔', '2017-06-06 01:29:21.639245'),
	(33, 'pbkdf2_sha256$36000$GrVMhbxC7YUf$iiJ8nSApJaSS6PccmjGV1DusyfzwtGf0/0Zg2vFQKCc=', '2017-06-09 09:14:39.277593', 0, 'manager', '', '', 'manager@manager.com', 0, 1, '0000-00-00 00:00:00.000000', '/uploads/avatar/default.png', NULL, '15295565452', NULL, 0, NULL, NULL, 00000000002, 30, 00000000023, 00000000001, 'xx', 'xx', '管理员', '2017-06-06 01:29:21.639245'),
	(34, '', NULL, 0, 'teacher540', '', '', '', 0, 1, '2017-05-24 01:55:10.134322', 'uploads/avatar/default.png', NULL, '15263321456', NULL, 33, NULL, NULL, 00000000002, 52, 00000000004, 00000000003, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(35, '', NULL, 0, 'teacher541', '', '', '', 0, 1, '2017-05-24 01:57:10.421610', 'uploads/avatar/default.png', NULL, '12345567894', NULL, 33, NULL, NULL, 00000000002, 30, 00000000003, 00000000003, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(36, '', NULL, 0, 'teacher542', '', '', '', 0, 1, '2017-05-24 01:58:42.021278', '/uploads/avatar/2017/5/3b8ae510-4123-11e7-bbd4-dc9c521d6e7e.jpg', NULL, '12345678940', NULL, 33, NULL, NULL, 00000000001, 52, 00000000002, 00000000003, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(37, '123456', NULL, 0, '老师呢', '', '', '', 0, 1, '2017-05-24 03:08:10.563916', '/uploads/avatar/2017/5/d789a38c-4041-11e7-9f91-dc9c521d6e7e.jpg', NULL, '12348596742', NULL, 33, NULL, NULL, 00000000002, 23, 00000000001, 00000000003, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(38, '123456', NULL, 0, '舞动纯', '', '', '', 0, 1, '2017-05-24 04:12:21.386054', '/uploads/avatar/2017/5/1d0c989a-4045-11e7-8fc0-dc9c521d6e7e.jpg', NULL, '15298745629', NULL, 33, NULL, NULL, 00000000002, 45, 00000000001, 00000000002, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(39, '123456', NULL, 0, '舞动穿', '', '', '', 0, 1, '2017-05-24 04:13:23.075011', 'uploads/avatar/default.png', NULL, '15874125896', NULL, 33, NULL, NULL, 00000000002, 45, 00000000001, 00000000002, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(40, 'pbkdf2_sha256$36000$wUgyZP3V9t95$gUEyzkP6skFyFT3EzsEU0bU4wMdztVW5RgkbuWKSipM=', '2017-05-24 04:14:16.034042', 0, '懂得的', '', '', '', 0, 1, '2017-05-24 04:14:00.042474', 'uploads/avatar/default.png', NULL, '15298874556', NULL, 33, NULL, NULL, 00000000002, 34, 00000000020, 00000000002, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(41, 'pbkdf2_sha256$36000$y6bC6qIVB1uv$ZpuSJWlh1Mpu2PjSDzzFICmiQLiXCPtpedOOL7iMpiY=', '2017-05-26 07:16:56.496310', 0, 'wurong', '', '', 'wurong@wurong.com', 0, 1, '2017-05-26 07:13:54.318355', 'uploads/avatar/default.png', NULL, NULL, 'http://www.baidu.com', 0, NULL, NULL, 00000000000, 0, 00000000000, 00000000001, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(42, 'pbkdf2_sha256$36000$zUbpbWRCOvKI$+wS0DV2TvqQDkGiUpUqBRW3tALdPaq5NEwYj/rUu36s=', '2017-05-26 07:16:02.472270', 0, 'wurong2', '', '', 'wurong@wurong.com', 0, 0, '2017-05-26 07:16:02.462494', 'uploads/avatar/default.png', NULL, NULL, 'http://www.baidu.com', 0, NULL, NULL, 00000000000, 0, 00000000000, 00000000001, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(43, '', NULL, 0, '学生1', '', '', '', 0, 1, '2017-05-31 07:36:51.339270', 'uploads/avatar/default.png', NULL, '12300450703', NULL, 18, NULL, NULL, 00000000002, 1, 00000000002, 00000000003, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(44, '', NULL, 0, '学生2', '', '', '', 0, 1, '2017-05-31 07:37:35.529429', 'uploads/avatar/default.png', NULL, '15290565440', NULL, 18, NULL, NULL, 00000000002, 2, 00000000001, 00000000003, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(45, '', NULL, 0, '学生3', '', '', '', 0, 1, '2017-05-31 07:40:22.615191', 'uploads/avatar/default.png', NULL, '12309956723', NULL, 18, NULL, NULL, 00000000002, 2, 00000000002, 00000000003, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(46, '', NULL, 0, 'xuesheng4', '', '', '', 0, 1, '2017-05-31 07:43:31.101932', 'uploads/avatar/default.png', NULL, '15295565440', NULL, 18, NULL, NULL, 00000000002, 23, 00000000003, 00000000003, 'aa', '父子', 'None', '2017-06-06 01:29:21.639245'),
	(47, 'pbkdf2_sha256$36000$XXdTICYUIrrB$RwrPbDIuC2xK/itkrXRYzHuo82lsWFLIwJnOQC9mixo=', NULL, 0, '老师1', '', '', '', 0, 1, '2017-05-31 08:00:28.544159', 'uploads/avatar/default.png', NULL, '15295090440', NULL, 33, NULL, NULL, 00000000002, 2, 00000000020, 00000000002, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(48, '', NULL, 0, '学生6', '', '', '', 0, 1, '2017-05-31 08:04:38.389972', 'uploads/avatar/default.png', NULL, '12387459723', NULL, 18, NULL, NULL, 00000000002, 2, 00000000003, 00000000003, 'None', '啊啊', NULL, '2017-06-06 01:29:21.639245'),
	(49, 'pbkdf2_sha256$36000$Ue3masR7pJu3$i3i9X/R0yzrZMk0GJeD35wgYlYEI4wK23c5bSOOwa7Q=', '2017-06-01 03:11:07.853630', 0, '老师2', '', '', '', 0, 1, '2017-05-31 08:05:10.578696', 'uploads/avatar/default.png', NULL, '12308886723', NULL, 33, NULL, NULL, 00000000002, 30, 00000000020, 00000000002, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(50, 'pbkdf2_sha256$36000$lS6bNGsdappC$ClVR6SGoh2E/V4ec60ij+ICUOTmCeqX+EQDCjfOVspA=', NULL, 0, '学12', '', '', '', 0, 1, '2017-05-31 08:06:29.275566', 'uploads/avatar/default.png', NULL, '12345678946', NULL, 33, NULL, NULL, 00000000002, 12, 00000000021, 00000000002, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(51, 'pbkdf2_sha256$36000$A3Vmj4tclTeo$SId+5uHsFTMXPBHG+bqXzOIfSkKLis2Z0cnLj7JqmFQ=', '2017-06-01 02:30:11.583737', 0, '老师333', '', '', '', 0, 1, '2017-05-31 08:12:31.246891', 'uploads/avatar/default.png', NULL, '12300456884', NULL, 33, NULL, NULL, 00000000001, 12, 00000000025, 00000000002, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(52, 'pbkdf2_sha256$36000$1Bscu3iMtGgJ$zWv2X+vY2u4MEIbRJjUf8bGUHKMgoCL9BvAqK7+MElM=', '2017-06-01 03:09:44.342251', 0, '老师5', '', '', '', 0, 1, '2017-05-31 10:55:38.583704', '/uploads/avatar/default.png', NULL, '12300996723', NULL, 33, NULL, NULL, 00000000002, 99, 00000000022, 00000000002, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(53, '', NULL, 0, '学生11', '', '', '', 0, 1, '2017-06-01 02:19:31.281706', '/uploads/avatar/default.png', NULL, '12325648789', NULL, 51, NULL, NULL, 00000000002, 12, 00000000005, 00000000003, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(54, 'pbkdf2_sha256$36000$LkFd6HogZxjU$4pa001t9AKtr8Ety4pOZjOh/zaOIktfCrubMcZc8SuI=', '2017-06-01 09:04:29.802225', 0, '杨逸飞', '', '', '', 0, 1, '2017-06-01 02:31:47.927096', '/uploads/avatar/default.png', NULL, '13545448773', NULL, 33, NULL, NULL, 00000000002, 28, 00000000025, 00000000002, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(55, '', NULL, 0, '凤息颜', '', '', '', 0, 1, '2017-06-01 02:33:30.226805', '/uploads/avatar/default.png', NULL, '15554649888', NULL, 54, NULL, NULL, 00000000001, 12, 00000000010, 00000000003, NULL, NULL, '凤夕颜', '2017-06-06 01:29:21.639245'),
	(56, 'pbkdf2_sha256$36000$j13zaLmFL6PW$yn+/GUiiXTByFTGVEVhUyXuJaph/36DTFA5KliAFK1s=', NULL, 0, 'sdfas5', '', '', '', 0, 1, '2017-06-01 04:19:48.662762', '/uploads/avatar/default.png', NULL, '12387456723', NULL, 33, NULL, NULL, 00000000002, 35, 00000000021, 00000000002, NULL, NULL, NULL, '2017-06-06 01:29:21.639245'),
	(57, 'pbkdf2_sha256$36000$LEurn39N7Yne$q4Nj0H6DZdcDLBrFH6HIMB9MIGJIU4NPCpVnNpVKvVI=', NULL, 0, 'sdfas6', '', '', '', 0, 1, '2017-06-01 04:20:27.998012', '/uploads/avatar/default.png', NULL, '12387456700', NULL, 33, NULL, NULL, 00000000002, 24, 00000000020, 00000000002, NULL, NULL, '老师6', '2017-06-06 01:29:21.639245'),
	(58, 'pbkdf2_sha256$36000$1l5djfZldBdv$b7V51hfl4GPxAHD5q9S6leTuljuyZSBeYWnbW55DvKM=', NULL, 0, 'techer7', '', '', '', 0, 1, '2017-06-01 04:38:02.666700', '/uploads/avatar/default.png', NULL, '12387906723', NULL, 33, NULL, NULL, 00000000002, 30, 00000000025, 00000000002, NULL, NULL, '老师7', '2017-06-06 01:29:21.639245'),
	(59, '', NULL, 0, '1496299335.2379136', '', '', '', 0, 1, '2017-06-01 06:42:15.259915', '/uploads/avatar/default.png', NULL, '12387456723', NULL, 18, NULL, NULL, 00000000002, 23, 00000000001, 00000000003, NULL, NULL, '学生1', '2017-06-06 01:29:21.639245'),
	(60, '', NULL, 0, '1496300691.9199245', '', '', '', 0, 1, '2017-06-01 07:04:51.945926', '/uploads/avatar/default.png', NULL, '12300456723', NULL, 18, NULL, NULL, 00000000002, 3, 00000000001, 00000000003, NULL, NULL, '学生2', '2017-06-06 01:29:21.639245'),
	(61, '', NULL, 0, '1496301398.009281', '', '', '', 0, 1, '2017-06-01 07:16:38.049283', '/uploads/avatar/default.png', NULL, '12387456723', NULL, 18, NULL, NULL, 00000000002, 2, 00000000001, 00000000003, 'pa1', '父子', '学生1', '2017-06-06 01:29:21.639245'),
	(62, 'pbkdf2_sha256$36000$uxxVAcXN7wt2$rSNUjKACMwRNjf9oS19KSWl0BnuqA5mrgfAIU+Uis/I=', NULL, 0, 'laoshi', '', '', '', 0, 1, '2017-06-02 02:57:18.166270', '/uploads/avatar/default.png', NULL, '12300986723', NULL, 33, NULL, NULL, 00000000002, 30, 00000000022, 00000000002, '**', '**', '老师', '2017-06-06 01:29:21.639245'),
	(63, 'pbkdf2_sha256$36000$Q9qdSdSre0La$Sgoy9DpS0Xs9HdaTcuuXzmHxDxcPbYZc7TTy3ATktYI=', NULL, 0, 'laoshi2', '', '', '', 0, 1, '2017-06-02 03:02:20.766508', '/uploads/avatar/default.png', NULL, '12380056723', NULL, 33, NULL, NULL, 00000000002, 3, 00000000021, 00000000002, '**', '**', '老师', '2017-06-06 01:29:21.639245'),
	(64, 'pbkdf2_sha256$36000$UxEM9C6XbBD6$u/GkEQaCVUg/SC0rTOKRAfpjpvYP3iTu3e4co3JqdnY=', NULL, 0, 'laoshi9', '', '', '', 0, 1, '2017-06-02 03:02:47.734426', '/uploads/avatar/default.png', NULL, '12309996723', NULL, 33, NULL, NULL, 00000000002, 23, 00000000020, 00000000002, '**', '**', '老师', '2017-06-06 01:29:21.639245'),
	(65, 'pbkdf2_sha256$36000$XCZWmHb7kWOV$gzjWtAMyMprWMBYRJ9Pxh64QkklpYWibnUMYxGFHO94=', NULL, 0, 'laoshi5', '', '', '', 0, 1, '2017-06-02 07:00:34.649448', '/uploads/avatar/default.png', NULL, '12300450023', NULL, 33, NULL, NULL, 00000000002, 100, 00000000024, 00000000002, '**', '**', '老师1', '2017-06-06 01:29:21.639245'),
	(66, '', NULL, 0, '1496391075.7391465', '', '', '', 0, 1, '2017-06-02 08:11:15.765147', '/uploads/avatar/default.png', NULL, '', NULL, 18, NULL, NULL, 00000000002, 35, 00000000001, 00000000003, '**', '**', '学生2', '2017-06-06 01:29:21.639245'),
	(67, '', NULL, 0, '1496397013.2339485', '', '', '', 0, 1, '2017-06-02 09:50:13.253949', '/uploads/avatar/default.png', NULL, '', NULL, 18, NULL, NULL, 00000000002, 99, 00000000001, 00000000003, '**', '**', '学生2', '2017-06-06 01:29:21.639245'),
	(68, '', NULL, 0, '1496397354.5986898', '', '', '', 0, 1, '2017-06-02 09:55:54.622691', '/uploads/avatar/default.png', NULL, '', NULL, 18, NULL, NULL, 00000000002, 100, 00000000002, 00000000003, '**', '**', '学生4', '2017-06-06 01:29:21.639245'),
	(69, 'pbkdf2_sha256$36000$VBwoE3vnAEj1$vmTtynSdp4K6zwEok5ZzMrrk814CXXG2KcSfdVNuCYQ=', NULL, 0, 'laoshi6', '', '', '', 0, 1, '2017-06-04 01:32:18.527036', '/uploads/avatar/default.png', NULL, '12396456723', NULL, 33, NULL, NULL, 00000000002, 100, 00000000025, 00000000002, '**', '**', '老师6', '2017-06-06 01:29:21.639245'),
	(70, 'pbkdf2_sha256$36000$hhZNwmfsvmiY$7lybB+b8mOYiHz25iexg0vQt8ekgHbjXaUtnvXG5Y4k=', NULL, 0, 'xinjian1', '', '', '', 0, 1, '2017-06-04 05:47:41.145439', '/uploads/avatar/default.png', NULL, '12300459723', NULL, 33, NULL, NULL, 00000000002, 100, 00000000020, 00000000002, '**', '**', '新建1', '2017-06-06 01:29:21.639245'),
	(71, 'pbkdf2_sha256$36000$NsL7bSlEmQcs$vGOIPBv+bZuvmtfXXX5tbET7VYy0Ti71ArMcoEeF4mw=', NULL, 0, 'laoshi8', '', '', '', 0, 1, '2017-06-04 05:53:40.836012', '/uploads/avatar/default.png', NULL, '12399456723', NULL, 33, NULL, NULL, 00000000002, 100, 00000000020, 00000000002, '**', '**', '老师8', '2017-06-06 01:29:21.639245'),
	(72, 'pbkdf2_sha256$36000$yPHEl719cZPp$+VjbYqsN5P45gqLmAig/hgF9UoB2HXeX98qFVpikwzQ=', '2017-06-05 01:49:35.278111', 0, 'laoshi10', '', '', '', 0, 1, '2017-06-04 05:54:51.948080', '/uploads/avatar/default.png', NULL, '12306456723', NULL, 33, NULL, NULL, 00000000002, 28, 00000000025, 00000000002, '**', '**', '老师10', '2017-06-06 01:29:21.639245'),
	(73, '', NULL, 0, '1496556165.4411626', '', '', '', 0, 1, '2017-06-04 06:02:45.464163', '/uploads/avatar/default.png', NULL, '', NULL, 18, NULL, NULL, 00000000002, 3, 00000000003, 00000000003, '**', '**', '学生3', '2017-06-06 01:29:21.639245'),
	(74, '', NULL, 0, '1496556192.3847036', '', '', '', 0, 1, '2017-06-04 06:03:12.411705', '/uploads/avatar/default.png', NULL, '', NULL, 18, NULL, NULL, 00000000002, 4, 00000000001, 00000000003, '**', '**', '最新1', '2017-06-06 01:29:21.639245'),
	(75, '', NULL, 0, '1496556244.2416697', '', '', '', 0, 1, '2017-06-04 06:04:04.285672', '/uploads/avatar/default.png', NULL, '', NULL, 18, NULL, NULL, 00000000002, 3, 00000000002, 00000000003, '**', '**', '最新2', '2017-06-06 01:29:21.639245'),
	(76, '', NULL, 0, '1496627417.800122', '', '', '', 0, 1, '2017-06-05 01:50:17.807097', '/uploads/avatar/default.png', NULL, '', NULL, 72, NULL, NULL, 00000000002, 5, 00000000002, 00000000003, '**', '**', '呀呀', '2017-06-06 01:29:21.639245'),
	(77, 'pbkdf2_sha256$36000$AkYFrnF59HWv$/wUJ2XhJVu1bVmV2AiBy2wQGSPzi7Rfr9YRnF9hrih0=', '2017-06-05 02:14:23.608987', 0, 'gongsunshi', '', '', '', 0, 1, '2017-06-05 01:52:12.835783', '/uploads/avatar/default.png', NULL, '18889465362', NULL, 33, NULL, NULL, 00000000001, 35, 00000000025, 00000000002, '**', '**', '公孙大娘', '2017-06-06 01:29:21.639245'),
	(78, 'pbkdf2_sha256$36000$z4P50EhtVYop$JhlqQWVoVe/WzOHbXnbtTN4DmDWsyNqaU7+sxuFzPBI=', '2017-06-05 02:27:35.860259', 0, 'gongsunying', '', '', '', 0, 1, '2017-06-05 01:54:58.079641', '/uploads/avatar/default.png', NULL, '13348685464', NULL, 33, NULL, NULL, 00000000001, 35, 00000000025, 00000000002, '**', '**', '公孙盈', '2017-06-06 01:29:21.639245'),
	(79, '', NULL, 0, '1496628634.5919673', '', '', '', 0, 1, '2017-06-05 02:10:34.599285', '/uploads/avatar/default.png', NULL, '', NULL, 78, NULL, NULL, 00000000001, 11, 00000000009, 00000000003, '**', '**', '叶芷青', '2017-06-06 01:29:21.639245'),
	(80, '', NULL, 0, '1496628680.625197', '', '', '', 0, 1, '2017-06-05 02:11:20.633472', '/uploads/avatar/default.png', NULL, '', NULL, 78, NULL, NULL, 00000000001, 11, 00000000009, 00000000003, '**', '**', '萧白胭', '2017-06-06 01:29:21.639245'),
	(81, '', NULL, 0, '1496628694.872967', '', '', '', 0, 1, '2017-06-05 02:11:34.881353', '/uploads/avatar/default.png', NULL, '', NULL, 78, NULL, NULL, 00000000001, 10, 00000000008, 00000000003, '**', '**', '高绛婷', '2017-06-06 01:29:21.639245'),
	(82, '', NULL, 0, '1496628716.6777375', '', '', '', 0, 1, '2017-06-05 02:11:56.686100', '/uploads/avatar/default.png', NULL, '', NULL, 78, NULL, NULL, 00000000001, 8, 00000000006, 00000000003, '**', '**', '小七', '2017-06-06 01:29:21.639245'),
	(83, '', NULL, 0, '1496628739.7457113', '', '', '', 0, 1, '2017-06-05 02:12:19.754111', '/uploads/avatar/default.png', NULL, '', NULL, 78, NULL, NULL, 00000000001, 10, 00000000008, 00000000003, '**', '**', '王维林', '2017-06-06 01:29:21.639245'),
	(84, '', NULL, 0, '1496628771.0342567', '', '', '', 0, 1, '2017-06-05 02:12:51.042541', '/uploads/avatar/default.png', NULL, '', NULL, 78, NULL, NULL, 00000000001, 9, 00000000007, 00000000003, '**', '**', '曲云', '2017-06-06 01:29:21.639245'),
	(85, '', NULL, 0, '1496628788.9618127', '', '', '', 0, 1, '2017-06-05 02:13:08.970199', '/uploads/avatar/default.png', NULL, '', NULL, 78, NULL, NULL, 00000000001, 9, 00000000007, 00000000003, '**', '**', '苏雨鸾', '2017-06-06 01:29:21.639245'),
	(86, '', NULL, 0, '1496628878.1700478', '', '', '', 0, 1, '2017-06-05 02:14:38.178522', '/uploads/avatar/default.png', NULL, '', NULL, 77, NULL, NULL, 00000000002, 5, 00000000002, 00000000003, '**', '**', '撒', '2017-06-06 01:29:21.639245'),
	(87, '', NULL, 0, '1496646409.6030457', '', '', '', 0, 1, '2017-06-05 07:06:49.629047', '/uploads/avatar/default.png', NULL, '', NULL, 18, NULL, NULL, 00000000009, 13, 00000000002, 00000000003, '**', '**', '学生', '2017-06-06 01:29:21.639245'),
	(88, '', NULL, 0, '1496646694.199765', '', '', '', 0, 1, '2017-06-05 07:11:34.226766', '/uploads/avatar/default.png', NULL, '', NULL, 18, NULL, NULL, 00000000009, 2, 00000000002, 00000000003, '**', '**', '学生', '2017-06-06 01:29:21.639245'),
	(89, 'pbkdf2_sha256$36000$Jhn6TF6Au0KQ$94J/5eOnusc06fkzhprIt5XBkO9/tGu3JBrZECuUzWI=', NULL, 0, 'V', '', '', '', 0, 1, '2017-06-05 07:28:52.333235', '/uploads/avatar/default.png', NULL, '18374657394', NULL, 33, NULL, NULL, 00000000009, 40, 00000000020, 00000000002, '**', '**', '老师', '2017-06-06 01:29:21.639245'),
	(90, 'pbkdf2_sha256$36000$wPte5f49aMZ9$0L75yGWqG+AOuH8BEoCGL5RMpxjD1O8Am5tZP7Z72ik=', '2017-06-06 07:26:02.108980', 0, 'teacher543', '', '', '', 0, 1, '2017-06-06 07:25:46.136203', '/uploads/avatar/default.png', NULL, '12345678949', NULL, 33, NULL, NULL, 00000000001, 56, 00000000022, 00000000002, '**', '**', 'teacher540', '2017-06-06 07:25:46.137204'),
	(91, '', NULL, 0, '1496819469.8141677', '', '', '', 0, 1, '2017-06-07 07:11:09.842169', '/uploads/avatar/default.png', NULL, '', NULL, 18, NULL, NULL, 00000000009, 2, 00000000001, 00000000003, '未知', '未知', 'ewrwq', '2017-06-07 07:11:09.844169'),
	(92, '', NULL, 0, '1496821159.4964976', '', '', '', 0, 1, '2017-06-07 07:39:19.516498', '/uploads/avatar/default.png', NULL, '', NULL, 18, NULL, NULL, 00000000009, 12, 00000000002, 00000000003, '未知', '未知', 'xuesheng', '2017-06-07 07:45:54.663873'),
	(93, '', NULL, 0, '1496823525.698003', '', '', '', 0, 1, '2017-06-07 08:18:45.719004', '/uploads/avatar/default.png', NULL, '10374657394', NULL, 18, NULL, NULL, 00000000009, 2, 00000000003, 00000000003, '未知', '未知', 'feaf', '2017-06-07 10:38:48.428753'),
	(94, 'pbkdf2_sha256$36000$2IlXiUVxKlba$kMshgQJz1sVJ7VyiLSBXIUA/EUuAV8Aymfh7nmJR2Bs=', '2017-06-09 01:39:48.843346', 0, 'teacher54', '', '', '', 0, 1, '2017-06-09 01:39:35.878726', '/uploads/avatar/default.png', NULL, '12345567889', NULL, 33, NULL, NULL, 00000000002, 25, 00000000020, 00000000002, '无', '无', 'teacher54', '2017-06-09 01:39:35.878726'),
	(95, '', NULL, 0, '1496995132.2025156', '', '', '', 0, 1, '2017-06-09 07:58:52.231517', '/uploads/avatar/default.png', NULL, '', NULL, 18, NULL, NULL, 00000000001, 5, 00000000001, 00000000003, '无', '无', 'dfas', '2017-06-09 09:10:46.442276');
/*!40000 ALTER TABLE `teacher_user` ENABLE KEYS */;

-- 导出  表 dj_brain.teacher_user_groups 结构
CREATE TABLE IF NOT EXISTS `teacher_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_user_groups_user_id_group_id_e71cac6f_uniq` (`user_id`,`group_id`),
  KEY `teacher_user_groups_group_id_fbefdc9c_fk_auth_group_id` (`group_id`),
  CONSTRAINT `teacher_user_groups_group_id_fbefdc9c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `teacher_user_groups_user_id_f317a9bb_fk_teacher_user_id` FOREIGN KEY (`user_id`) REFERENCES `teacher_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.teacher_user_groups 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `teacher_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_user_groups` ENABLE KEYS */;

-- 导出  表 dj_brain.teacher_user_user_permissions 结构
CREATE TABLE IF NOT EXISTS `teacher_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_user_user_permis_user_id_permission_id_d9618db6_uniq` (`user_id`,`permission_id`),
  KEY `teacher_user_user_pe_permission_id_ada65146_fk_auth_perm` (`permission_id`),
  CONSTRAINT `teacher_user_user_pe_permission_id_ada65146_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `teacher_user_user_pe_user_id_c06b6d5b_fk_teacher_u` FOREIGN KEY (`user_id`) REFERENCES `teacher_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  dj_brain.teacher_user_user_permissions 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `teacher_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_user_user_permissions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
