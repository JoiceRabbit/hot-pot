/*
Navicat MySQL Data Transfer

Source Server         : MxShop
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : huoguo

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-20 13:29:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add group', '1', 'add_group');
INSERT INTO `auth_permission` VALUES ('2', 'Can change group', '1', 'change_group');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete group', '1', 'delete_group');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can view group', '1', 'view_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add content type', '3', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('10', 'Can change content type', '3', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete content type', '3', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can view content type', '3', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '4', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '4', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '4', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can view session', '4', 'view_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can add 短信验证码', '5', 'add_verifycode');
INSERT INTO `auth_permission` VALUES ('18', 'Can change 短信验证码', '5', 'change_verifycode');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete 短信验证码', '5', 'delete_verifycode');
INSERT INTO `auth_permission` VALUES ('20', 'Can add 用户', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('21', 'Can change 用户', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can delete 用户', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('23', 'Can view 用户', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('24', 'Can view 短信验证码', '5', 'view_verifycode');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 热搜词', '7', 'add_hotsearchwords');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 热搜词', '7', 'change_hotsearchwords');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 热搜词', '7', 'delete_hotsearchwords');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 促销信息', '8', 'add_discount');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 促销信息', '8', 'change_discount');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 促销信息', '8', 'delete_discount');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 商家', '9', 'add_store');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 商家', '9', 'change_store');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 商家', '9', 'delete_store');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 轮播商品', '10', 'add_banner');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 轮播商品', '10', 'change_banner');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 轮播商品', '10', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 商品', '11', 'add_goods');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 商品', '11', 'change_goods');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 商品', '11', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 商品类别', '12', 'add_goodscategory');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 商品类别', '12', 'change_goodscategory');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 商品类别', '12', 'delete_goodscategory');
INSERT INTO `auth_permission` VALUES ('43', 'Can view 轮播商品', '10', 'view_banner');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 促销信息', '8', 'view_discount');
INSERT INTO `auth_permission` VALUES ('45', 'Can view 商品', '11', 'view_goods');
INSERT INTO `auth_permission` VALUES ('46', 'Can view 商品类别', '12', 'view_goodscategory');
INSERT INTO `auth_permission` VALUES ('47', 'Can view 热搜词', '7', 'view_hotsearchwords');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 商家', '9', 'view_store');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 订单', '13', 'add_orderinfo');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 订单', '13', 'change_orderinfo');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 订单', '13', 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 订单商品', '14', 'add_ordergoods');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 订单商品', '14', 'change_ordergoods');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 订单商品', '14', 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 购物车', '15', 'add_shoppingcart');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 购物车', '15', 'change_shoppingcart');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 购物车', '15', 'delete_shoppingcart');
INSERT INTO `auth_permission` VALUES ('58', 'Can view 订单商品', '14', 'view_ordergoods');
INSERT INTO `auth_permission` VALUES ('59', 'Can view 订单', '13', 'view_orderinfo');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 购物车', '15', 'view_shoppingcart');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 发现页', '16', 'add_finds');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 发现页', '16', 'change_finds');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 发现页', '16', 'delete_finds');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 发现页', '16', 'view_finds');
INSERT INTO `auth_permission` VALUES ('65', 'Can add 用户评价', '17', 'add_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('66', 'Can change 用户评价', '17', 'change_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete 用户评价', '17', 'delete_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('68', 'Can add 用户收藏', '18', 'add_userfav');
INSERT INTO `auth_permission` VALUES ('69', 'Can change 用户收藏', '18', 'change_userfav');
INSERT INTO `auth_permission` VALUES ('70', 'Can delete 用户收藏', '18', 'delete_userfav');
INSERT INTO `auth_permission` VALUES ('71', 'Can add 收货地址', '19', 'add_useraddress');
INSERT INTO `auth_permission` VALUES ('72', 'Can change 收货地址', '19', 'change_useraddress');
INSERT INTO `auth_permission` VALUES ('73', 'Can delete 收货地址', '19', 'delete_useraddress');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 收货地址', '19', 'view_useraddress');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 用户收藏', '18', 'view_userfav');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 用户评价', '17', 'view_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('77', 'Can add User Widget', '20', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('78', 'Can change User Widget', '20', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete User Widget', '20', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('80', 'Can add User Setting', '21', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('81', 'Can change User Setting', '21', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('82', 'Can delete User Setting', '21', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('83', 'Can add Bookmark', '22', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can change Bookmark', '22', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('85', 'Can delete Bookmark', '22', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('86', 'Can add log entry', '23', 'add_log');
INSERT INTO `auth_permission` VALUES ('87', 'Can change log entry', '23', 'change_log');
INSERT INTO `auth_permission` VALUES ('88', 'Can delete log entry', '23', 'delete_log');
INSERT INTO `auth_permission` VALUES ('89', 'Can view Bookmark', '22', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('90', 'Can view log entry', '23', 'view_log');
INSERT INTO `auth_permission` VALUES ('91', 'Can view User Setting', '21', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('92', 'Can view User Widget', '20', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('93', 'Can add 广告图', '24', 'add_specialindex');
INSERT INTO `auth_permission` VALUES ('94', 'Can change 广告图', '24', 'change_specialindex');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete 广告图', '24', 'delete_specialindex');
INSERT INTO `auth_permission` VALUES ('96', 'Can view 广告图', '24', 'view_specialindex');
INSERT INTO `auth_permission` VALUES ('97', 'Can add 活动图', '25', 'add_imgsfinds');
INSERT INTO `auth_permission` VALUES ('98', 'Can change 活动图', '25', 'change_imgsfinds');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete 活动图', '25', 'delete_imgsfinds');
INSERT INTO `auth_permission` VALUES ('100', 'Can view 活动图', '25', 'view_imgsfinds');
INSERT INTO `auth_permission` VALUES ('101', 'Can add 推荐图', '26', 'add_neighborimg');
INSERT INTO `auth_permission` VALUES ('102', 'Can change 推荐图', '26', 'change_neighborimg');
INSERT INTO `auth_permission` VALUES ('103', 'Can delete 推荐图', '26', 'delete_neighborimg');
INSERT INTO `auth_permission` VALUES ('104', 'Can view 推荐图', '26', 'view_neighborimg');
INSERT INTO `auth_permission` VALUES ('105', 'Can add 商家实景图片', '27', 'add_store_detail');
INSERT INTO `auth_permission` VALUES ('106', 'Can change 商家实景图片', '27', 'change_store_detail');
INSERT INTO `auth_permission` VALUES ('107', 'Can delete 商家实景图片', '27', 'delete_store_detail');
INSERT INTO `auth_permission` VALUES ('108', 'Can view 商家实景图片', '27', 'view_store_detail');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('16', 'finds', 'finds');
INSERT INTO `django_content_type` VALUES ('25', 'finds', 'imgsfinds');
INSERT INTO `django_content_type` VALUES ('10', 'goods', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'goods', 'discount');
INSERT INTO `django_content_type` VALUES ('11', 'goods', 'goods');
INSERT INTO `django_content_type` VALUES ('12', 'goods', 'goodscategory');
INSERT INTO `django_content_type` VALUES ('7', 'goods', 'hotsearchwords');
INSERT INTO `django_content_type` VALUES ('24', 'goods', 'specialindex');
INSERT INTO `django_content_type` VALUES ('9', 'goods', 'store');
INSERT INTO `django_content_type` VALUES ('27', 'goods', 'store_detail');
INSERT INTO `django_content_type` VALUES ('4', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('26', 'trade', 'neighborimg');
INSERT INTO `django_content_type` VALUES ('14', 'trade', 'ordergoods');
INSERT INTO `django_content_type` VALUES ('13', 'trade', 'orderinfo');
INSERT INTO `django_content_type` VALUES ('15', 'trade', 'shoppingcart');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('5', 'users', 'verifycode');
INSERT INTO `django_content_type` VALUES ('19', 'user_operation', 'useraddress');
INSERT INTO `django_content_type` VALUES ('18', 'user_operation', 'userfav');
INSERT INTO `django_content_type` VALUES ('17', 'user_operation', 'userleavingmessage');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('20', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-01-11 21:42:38.796459');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-01-11 21:42:39.864521');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-01-11 21:42:42.804449');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-01-11 21:42:43.385988');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-01-11 21:42:43.425005');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-01-11 21:42:43.450013');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-01-11 21:42:43.491053');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-01-11 21:42:43.511064');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-01-11 21:42:43.556240');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-01-11 21:42:43.591251');
INSERT INTO `django_migrations` VALUES ('11', 'finds', '0001_initial', '2018-01-11 21:42:43.841342');
INSERT INTO `django_migrations` VALUES ('12', 'goods', '0001_initial', '2018-01-11 21:42:51.236588');
INSERT INTO `django_migrations` VALUES ('13', 'sessions', '0001_initial', '2018-01-11 21:42:51.640087');
INSERT INTO `django_migrations` VALUES ('14', 'users', '0001_initial', '2018-01-11 21:42:56.416690');
INSERT INTO `django_migrations` VALUES ('15', 'trade', '0001_initial', '2018-01-11 21:42:58.695157');
INSERT INTO `django_migrations` VALUES ('16', 'trade', '0002_auto_20180111_2142', '2018-01-11 21:43:05.038646');
INSERT INTO `django_migrations` VALUES ('17', 'user_operation', '0001_initial', '2018-01-11 21:43:06.512704');
INSERT INTO `django_migrations` VALUES ('18', 'user_operation', '0002_auto_20180111_2142', '2018-01-11 21:43:10.354215');
INSERT INTO `django_migrations` VALUES ('19', 'xadmin', '0001_initial', '2018-01-11 21:43:14.396705');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0002_log', '2018-01-11 21:43:16.328727');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0003_auto_20160715_0100', '2018-01-11 21:43:16.953104');
INSERT INTO `django_migrations` VALUES ('22', 'goods', '0002_auto_20180113_1632', '2018-01-13 16:32:19.651621');
INSERT INTO `django_migrations` VALUES ('23', 'finds', '0002_imgsfinds', '2018-01-13 17:38:24.275785');
INSERT INTO `django_migrations` VALUES ('24', 'goods', '0003_auto_20180113_1738', '2018-01-13 17:38:24.329112');
INSERT INTO `django_migrations` VALUES ('25', 'goods', '0004_auto_20180114_2008', '2018-01-14 20:08:29.539695');
INSERT INTO `django_migrations` VALUES ('26', 'trade', '0003_neighborimg', '2018-01-14 20:08:29.895989');
INSERT INTO `django_migrations` VALUES ('27', 'goods', '0005_store_detail', '2018-01-14 20:57:16.170806');
INSERT INTO `django_migrations` VALUES ('28', 'goods', '0006_auto_20180115_1956', '2018-01-15 19:57:16.412722');
INSERT INTO `django_migrations` VALUES ('29', 'goods', '0007_auto_20180115_1959', '2018-01-15 19:59:19.486469');
INSERT INTO `django_migrations` VALUES ('30', 'goods', '0008_auto_20180115_2013', '2018-01-15 20:13:18.835330');
INSERT INTO `django_migrations` VALUES ('31', 'user_operation', '0003_auto_20180116_2122', '2018-01-16 21:22:44.539657');
INSERT INTO `django_migrations` VALUES ('32', 'users', '0002_auto_20180116_2122', '2018-01-16 21:22:49.777950');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('nbnd74jxvjojm3jygooyhpef1u7ifk6e', 'ZDg1ZTVlYWQ0NTU3MDk2ZGM3NzkwNDg1YzQxZWM4ZGZmNWZmMTNiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMmY0NmYwOTNlYmI4YzBhNjY0OGUwMTQ3NmViYzViN2I3YzJhOTc4IiwiTElTVF9RVUVSWSI6W1sidXNlcl9vcGVyYXRpb24iLCJ1c2VyZmF2Il0sIiJdfQ==', '2018-02-03 12:57:58.365480');
INSERT INTO `django_session` VALUES ('u0u2t4um8daxq9pwhhht0b0xaf9vnqel', 'NDRjYTk0Yjc3ODg5Yjk3ZWEwZTJlMTdkNTRhMWE0MWRkMzM2NjY5Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMmY0NmYwOTNlYmI4YzBhNjY0OGUwMTQ3NmViYzViN2I3YzJhOTc4IiwiTElTVF9RVUVSWSI6W1siZ29vZHMiLCJzdG9yZSJdLCIiXX0=', '2018-01-29 20:09:04.923614');

-- ----------------------------
-- Table structure for finds_finds
-- ----------------------------
DROP TABLE IF EXISTS `finds_finds`;
CREATE TABLE `finds_finds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of finds_finds
-- ----------------------------
INSERT INTO `finds_finds` VALUES ('1', 'find/d370f40aecbb235f7511cdf9abc257d1.png', '金币商城', '0元好物在这里');
INSERT INTO `finds_finds` VALUES ('2', 'find/c1ae676107bd5d526d59b43d2dbbdf4e.jpg', '必吃爆料', '最夯外卖指南');
INSERT INTO `finds_finds` VALUES ('3', 'find/6178be131a9c3d10f641d5b72dbe570c.png', '推荐有奖', '5元现金拿不停');
INSERT INTO `finds_finds` VALUES ('4', 'find/dce4cc939a8e26c9a8baec4d1805c751_ygynLTQ.png', '百元红包', '红包福利领不停');
INSERT INTO `finds_finds` VALUES ('5', 'find/72438b8b1909d874f63fcaa68d701720.jpg', '周边优惠', '领取口碑好券');
INSERT INTO `finds_finds` VALUES ('6', 'find/bc89e013ad789dae695ffa4e92f9a04e.png', '免费流量', '每月最高500M');

-- ----------------------------
-- Table structure for finds_imgsfinds
-- ----------------------------
DROP TABLE IF EXISTS `finds_imgsfinds`;
CREATE TABLE `finds_imgsfinds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `imgUrl` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of finds_imgsfinds
-- ----------------------------
INSERT INTO `finds_imgsfinds` VALUES ('1', '红包', 'banner/微信图片_20180113174151.jpg', '1', '2018-01-13 17:42:00.000000');
INSERT INTO `finds_imgsfinds` VALUES ('2', '春运出票', 'banner/微信图片_20180113174155.jpg', '2', '2018-01-13 17:45:00.000000');
INSERT INTO `finds_imgsfinds` VALUES ('3', '春运出票', 'banner/微信图片_20180113174155_zCS1HRW.jpg', '3', '2018-01-13 17:46:00.000000');

-- ----------------------------
-- Table structure for goods_banner
-- ----------------------------
DROP TABLE IF EXISTS `goods_banner`;
CREATE TABLE `goods_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_banner_store_id_128a292c_fk_goods_store_id` (`store_id`),
  CONSTRAINT `goods_banner_store_id_128a292c_fk_goods_store_id` FOREIGN KEY (`store_id`) REFERENCES `goods_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_banner
-- ----------------------------
INSERT INTO `goods_banner` VALUES ('2', 'banner/5a0cf2f56ffd7_mhayArf.jpg', '1', '2018-01-11 22:11:00.000000', '3');
INSERT INTO `goods_banner` VALUES ('3', 'banner/5a0cf2f570046_cRhcnXD.jpg', '2', '2018-01-11 22:11:00.000000', '3');
INSERT INTO `goods_banner` VALUES ('4', 'banner/5a1224e1e6769_kfI4yZt.jpg', '3', '2018-01-11 22:12:00.000000', '3');

-- ----------------------------
-- Table structure for goods_discount
-- ----------------------------
DROP TABLE IF EXISTS `goods_discount`;
CREATE TABLE `goods_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate` varchar(20) NOT NULL,
  `desc` varchar(20) NOT NULL,
  `show` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_discount_store_id_14878749_fk_goods_store_id` (`store_id`),
  CONSTRAINT `goods_discount_store_id_14878749_fk_goods_store_id` FOREIGN KEY (`store_id`) REFERENCES `goods_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_discount
-- ----------------------------
INSERT INTO `goods_discount` VALUES ('5', '减', '满50减30，满100减10', '1', '2018-01-11 22:13:00.000000', '3');
INSERT INTO `goods_discount` VALUES ('6', '首', '新用户下单立减8元', '1', '2018-01-11 22:13:00.000000', '3');
INSERT INTO `goods_discount` VALUES ('7', '特', '特价59元！新五味小吃拼盘', '0', '2018-01-11 22:13:00.000000', '3');
INSERT INTO `goods_discount` VALUES ('8', '减', '满50减30，满100减10', '1', '2018-01-11 22:13:00.000000', '4');
INSERT INTO `goods_discount` VALUES ('9', '特', '五折特惠', '1', '2018-01-11 22:14:00.000000', '4');
INSERT INTO `goods_discount` VALUES ('10', '赠', '满88元赠送可口可乐1份', '0', '2018-01-13 11:08:32.000000', '4');
INSERT INTO `goods_discount` VALUES ('11', '减', '满20减8;满150减25', '1', '2018-01-14 14:54:00.000000', '5');
INSERT INTO `goods_discount` VALUES ('12', '特', '折扣商品6折起', '1', '2018-01-14 14:56:00.000000', '5');
INSERT INTO `goods_discount` VALUES ('13', '减', '满200减70;满500减180;', '1', '2018-01-14 14:56:00.000000', '6');
INSERT INTO `goods_discount` VALUES ('14', '特', '折扣商品6.77折起', '1', '2018-01-14 14:57:00.000000', '6');
INSERT INTO `goods_discount` VALUES ('15', '减', '满168减75;满268减95', '1', '2018-01-14 14:58:00.000000', '7');
INSERT INTO `goods_discount` VALUES ('16', '首', '新用户立减17元', '1', '2018-01-14 14:58:00.000000', '7');
INSERT INTO `goods_discount` VALUES ('17', '减', '满100减10;满300减40', '1', '2018-01-14 15:00:00.000000', '11');
INSERT INTO `goods_discount` VALUES ('18', '特', '折扣商品8.8折起', '1', '2018-01-14 15:00:00.000000', '11');
INSERT INTO `goods_discount` VALUES ('19', '减', '满80减15;满150减25', '1', '2018-01-14 15:01:00.000000', '10');
INSERT INTO `goods_discount` VALUES ('20', '首', '新用户立减17元', '1', '2018-01-14 15:02:00.000000', '10');
INSERT INTO `goods_discount` VALUES ('21', '特', '折扣商品5折起', '0', '2018-01-14 15:02:00.000000', '10');
INSERT INTO `goods_discount` VALUES ('22', '减', '满50减12;满80减20', '1', '2018-01-14 15:02:00.000000', '9');
INSERT INTO `goods_discount` VALUES ('23', '首', '新用户立减17元', '1', '2018-01-14 15:03:00.000000', '9');
INSERT INTO `goods_discount` VALUES ('24', '特', '折扣商品8折起', '0', '2018-01-14 15:04:00.000000', '9');
INSERT INTO `goods_discount` VALUES ('25', '减', '满30减13;满100减25', '1', '2018-01-14 15:04:00.000000', '8');
INSERT INTO `goods_discount` VALUES ('26', '首', '新用户立减17元', '1', '2018-01-14 15:06:00.000000', '8');
INSERT INTO `goods_discount` VALUES ('27', '赠', '满88元赠送可口可乐1份', '0', '2018-01-14 15:07:00.000000', '10');

-- ----------------------------
-- Table structure for goods_goods
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods`;
CREATE TABLE `goods_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `sold_num` int(11) NOT NULL,
  `fav` double NOT NULL,
  `fav_num` int(11) NOT NULL,
  `goods_num` int(11) NOT NULL,
  `shop_price` double NOT NULL,
  `desc` longtext,
  `img` varchar(100) DEFAULT NULL,
  `isDiscount` tinyint(1) NOT NULL,
  `discount` int(11) NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` (`category_id`),
  CONSTRAINT `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goods
-- ----------------------------
INSERT INTO `goods_goods` VALUES ('1', '菌汤锅底', '35', '98', '30', '30', '15', '菌汤锅底－新鲜的菌香扑面而来', 'goods/images/8964c5bea09be004aef642bfa9e98_aFwLw04.png', '0', '10', '0', '0', '2018-01-11 22:03:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('2', '平菇', '35', '94.1', '30', '30', '16', '素食者的最爱', 'goods/images/cc3bcab6f4eb0e65f41bf6b785a48_KFmCJzD.png', '0', '10', '0', '0', '2018-01-11 22:05:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('3', '雪花牛肉', '40', '93.8', '30', '30', '59', '雪花牛肉－160g，口感柔润，营养丰富，入口即化', 'goods/images/b158141d772444d4cc05c31c7af1d_MgA8Xjr.png', '1', '9', '1', '1', '2018-01-11 22:06:00.000000', '1');
INSERT INTO `goods_goods` VALUES ('4', '平菇', '30', '97', '30', '20', '10', '素食者的最爱', 'goods/images/cc3bcab6f4eb0e65f41bf6b785a48_pGpIZEW.png', '0', '10', '0', '0', '2018-01-11 22:07:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('5', '白菜', '40', '88', '30', '30', '10', '所有菜品为半成品，需要您涮后享用美味哟！', 'goods/images/5819e33b11d2d0b653a53ec99df8b.png', '0', '10', '0', '0', '2018-01-13 14:43:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('6', '精品牛羊双排', '103', '92', '15', '15', '168', '来自大草原', 'goods/images/t0150fbba5b40e0f59a.jpg', '1', '10', '0', '0', '2018-01-15 15:40:00.000000', '1');
INSERT INTO `goods_goods` VALUES ('7', '麻辣牛肉火锅', '99', '90', '35', '34', '138', '又麻又辣又香', 'goods/images/t01e44684fab4af7b5e.jpg', '1', '10', '0', '0', '2018-01-15 15:42:00.000000', '1');
INSERT INTO `goods_goods` VALUES ('8', '手工面', '87', '100', '23', '34', '12', '纯手工', 'goods/images/t01b9b75beb7973d5c2.jpg', '0', '10', '0', '0', '2018-01-15 15:42:00.000000', '2');
INSERT INTO `goods_goods` VALUES ('9', '香酥烧饼', '77', '90', '55', '14', '15', '和火锅很配哦', 'goods/images/t016d376caa61041c78.jpg', '0', '10', '0', '0', '2018-01-15 15:43:00.000000', '2');
INSERT INTO `goods_goods` VALUES ('10', '方便面', '69', '90', '46', '50', '5', '', 'goods/images/t017aecfc23282e0f4e.jpg', '0', '10', '0', '0', '2018-01-15 15:44:00.000000', '2');
INSERT INTO `goods_goods` VALUES ('11', '内蒙牛羊肉', '87', '100', '66', '66', '36', '来自大草原', 'goods/images/t0181e03dc2b3eb142c.jpg', '0', '10', '0', '0', '2018-01-15 15:45:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('12', '爽滑嫩牛肉', '122', '95', '56', '56', '33', '', 'goods/images/嫩牛肉.jpg', '0', '10', '0', '0', '2018-01-15 15:45:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('13', '手切鲜羊肉', '55', '99', '45', '56', '34', '', 'goods/images/手切鲜羊肉.jpg', '0', '10', '0', '0', '2018-01-15 15:46:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('14', '一级牛眼肉', '69', '84', '57', '44', '42', '', 'goods/images/牛眼肉.jpg', '0', '10', '0', '0', '2018-01-15 15:47:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('15', '雪花肥牛', '123', '88', '34', '44', '40', '', 'goods/images/雪花肥牛.png', '0', '10', '0', '0', '2018-01-15 15:48:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('16', '红薯片', '23', '82', '11', '54', '7', '', 'goods/images/红薯.jpg', '0', '10', '0', '0', '2018-01-15 15:49:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('17', '冬瓜', '30', '88', '55', '45', '5', '', 'goods/images/冬瓜.jpg', '0', '10', '0', '0', '2018-01-15 15:49:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('18', '黑木耳', '71', '91', '56', '66', '8', '东北黑木耳', 'goods/images/黑木耳.jpg', '0', '10', '0', '0', '2018-01-15 15:50:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('19', '蒿子杆', '22', '80', '44', '56', '5', '', 'goods/images/蒿子秆.jpg', '0', '10', '0', '0', '2018-01-15 15:51:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('20', '圆生菜', '51', '79', '56', '67', '5', '', 'goods/images/圆生菜.jpg', '0', '10', '0', '0', '2018-01-15 15:51:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('21', '油麦菜', '71', '91', '45', '56', '4', '', 'goods/images/油麦菜.jpg', '0', '10', '0', '0', '2018-01-15 15:52:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('22', '土豆片', '48', '95', '45', '57', '8', '火锅必备', 'goods/images/土豆片.jpg', '0', '10', '0', '0', '2018-01-15 15:53:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('23', '素菜拼盘', '51', '79', '67', '77', '25', '', 'goods/images/素材拼盘.jpg', '0', '10', '0', '0', '2018-01-15 15:53:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('24', '海带', '33', '96', '43', '65', '6', '', 'goods/images/海带.jpg', '0', '10', '0', '0', '2018-01-15 15:54:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('25', '金针菇', '66', '94', '65', '55', '7', '', 'goods/images/金针菇.jpg', '0', '10', '0', '0', '2018-01-15 15:55:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('26', '平菇', '81', '97', '45', '56', '8', '', 'goods/images/平菇.jpg', '0', '10', '0', '0', '2018-01-15 15:56:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('27', '香菇', '30', '88', '7', '46', '10', '', 'goods/images/香菇.jpg', '0', '10', '0', '0', '2018-01-15 15:56:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('28', '撒尿牛丸', '69', '89', '54', '65', '11', '', 'goods/images/牛丸.jpg', '0', '10', '0', '0', '2018-01-15 15:57:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('29', '蟹肉棒', '122', '95', '43', '56', '10', '自制', 'goods/images/蟹肉棒.png', '0', '10', '0', '0', '2018-01-15 15:58:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('30', '秘制虾滑', '125', '99', '65', '76', '15', '秘制，独家', 'goods/images/虾滑.jpg', '0', '10', '0', '0', '2018-01-15 15:58:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('31', '鱼丸', '69', '84', '43', '54', '13', '自制', 'goods/images/鱼丸.jpg', '0', '10', '0', '0', '2018-01-15 16:00:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('32', '陪伴聊天', '20', '99', '76', '6', '10', '气氛愉快，聊个海天海地', 'goods/images/聊天.jpg', '0', '10', '0', '0', '2018-01-15 16:01:00.000000', '8');
INSERT INTO `goods_goods` VALUES ('33', '随叫随到', '41', '95', '45', '45', '10', '随叫随到，最贴心，想什么时候吃，就什么时候吃', 'goods/images/随叫随到.jpg', '0', '10', '0', '0', '2018-01-15 16:02:00.000000', '8');
INSERT INTO `goods_goods` VALUES ('34', '燕京纯生', '23', '93', '45', '56', '12', '燕京纯生', 'goods/images/c584c3f5bf594f31c261ba13cffbejpeg.jpeg', '0', '10', '0', '0', '2018-01-15 16:53:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('35', '燕京鲜啤', '34', '90', '45', '34', '8', '燕京', 'goods/images/94cf957d1bea6a52ad903cc7a872bjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 16:54:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('36', '特色里脊', '11', '97', '30', '56', '1.5', '串', 'goods/images/000c82a82025f43838f9358d585d0jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 16:56:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('37', '雪碧(厅)', '23', '98', '45', '45', '5', '听装', 'goods/images/6e296a3691c77aecc9afe68af86a0jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 16:58:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('38', '鲜辣酱', '35', '94', '34', '45', '6', '小米辣、鸡精、盐、耗油、香油、香菜', 'goods/images/2ca3d5dca25519b101a8ec18ee5abjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 16:59:00.000000', '6');
INSERT INTO `goods_goods` VALUES ('39', '甜不辣', '30', '92', '45', '56', '1.5', '串', 'goods/images/8d7da786e3001652e7bc0a91e0fbfjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:00:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('40', '鸳鸯锅(番茄+白锅)', '33', '96', '43', '34', '40', '番茄+白锅', 'goods/images/1424db0323eb27daddb43b67ff5c6jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:01:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('41', '秘制红锅', '43', '95', '44', '56', '35', '秘制', 'goods/images/3b568deb18f567886f1514c388b3fjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:03:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('42', '芝麻酱', '45', '99', '65', '56', '6', '', 'goods/images/9d1396e5c2abdf52437d880f4437fjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:03:00.000000', '6');
INSERT INTO `goods_goods` VALUES ('43', '土豆片', '35', '98', '45', '45', '6', '', 'goods/images/83f8b2f13e523acf9aed2852bd385jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:04:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('44', '藕片', '45', '97', '34', '56', '6', '湖北藕', 'goods/images/ab44ed926a583b122367f6188f48djpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:05:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('45', '笋尖', '56', '93', '43', '56', '6', '', 'goods/images/e82172c84ee247c2fc778fdd09ebdjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:05:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('46', '金针菇', '33', '98', '45', '66', '15', '', 'goods/images/d1d6c501cc37c42dccf71fb166d2ejpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:06:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('47', '火锅方便面', '43', '97', '45', '56', '9', '3块一份', 'goods/images/646dcfe6498b5469f85558d176476jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:07:00.000000', '2');
INSERT INTO `goods_goods` VALUES ('48', '火锅面条', '65', '97', '64', '45', '9', '90g', 'goods/images/90560a986fbb71fd7d4e16fadd959jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:08:00.000000', '2');
INSERT INTO `goods_goods` VALUES ('49', '可乐(厅)', '6', '98', '65', '66', '5', '厅装', 'goods/images/802042347e3a57ef3bc41a5cdf626jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:08:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('50', '内蒙古肥牛i', '65', '100', '66', '54', '40', '215g', 'goods/images/b6b8833188e0618e685dd881a01e7jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:09:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('51', '澳洲肥牛', '54', '98', '56', '56', '50', '215g', 'goods/images/a3046ef03bb3305e55e89a0b3ed50jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:10:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('52', '进口羊羔钙', '45', '100', '43', '56', '50', '215g', 'goods/images/c644bf4f24b63da9eecf776ddffddjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:11:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('53', '陪伴聊天', '40', '99', '56', '45', '10', '最好的陪伴', 'goods/images/聊天_BnChHZr.jpg', '0', '10', '0', '0', '2018-01-15 17:15:00.000000', '8');
INSERT INTO `goods_goods` VALUES ('54', '随叫随到', '56', '100', '44', '45', '10', '根据您的时间而定', 'goods/images/随叫随到_127ASw5.jpg', '0', '10', '0', '0', '2018-01-15 17:16:00.000000', '8');
INSERT INTO `goods_goods` VALUES ('55', '随叫随到', '43', '100', '45', '5', '10', '根据您的时间而定', 'goods/images/随叫随到_1x1PxT5.jpg', '0', '10', '0', '0', '2018-01-15 17:17:00.000000', '8');
INSERT INTO `goods_goods` VALUES ('56', '陪伴聊天', '10', '99', '43', '45', '10', '气氛愉快，最好的陪伴', 'goods/images/聊天_BBHPjDY.jpg', '0', '10', '0', '0', '2018-01-15 17:17:00.000000', '8');
INSERT INTO `goods_goods` VALUES ('57', '随叫随到', '23', '99', '34', '5', '10', '随教随到，以您的需求为主', 'goods/images/随叫随到_W1JL38H.jpg', '0', '10', '0', '0', '2018-01-15 17:18:00.000000', '8');
INSERT INTO `goods_goods` VALUES ('58', '随叫随到', '55', '99', '55', '5', '10', '随时候着', 'goods/images/随叫随到_9XwAyTa.jpg', '0', '10', '0', '0', '2018-01-15 17:19:00.000000', '8');
INSERT INTO `goods_goods` VALUES ('59', '随叫随到', '33', '99', '43', '56', '0', '随时候命', 'goods/images/随叫随到_m1bSJqe.jpg', '0', '10', '0', '0', '2018-01-15 17:20:00.000000', '8');
INSERT INTO `goods_goods` VALUES ('60', '陪伴聊天', '35', '99', '33', '3', '10', '陪伴', 'goods/images/聊天_VTbTx6G.jpg', '0', '10', '0', '0', '2018-01-15 17:21:00.000000', '8');
INSERT INTO `goods_goods` VALUES ('61', '鸭血', '33', '99', '22', '33', '8', '110g', 'goods/images/4fd17c7f6398218ef642053e5e503jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:23:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('62', '鲜脑花', '71', '100', '34', '32', '16', '120g', 'goods/images/16d3d5d55a48ec46580145e9b81b2jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:24:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('63', '青虾', '0', '99', '45', '56', '25', '5只', 'goods/images/d13d0feaa85d072d526ef2b72ecacjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:25:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('64', '油麦菜', '45', '99', '65', '45', '6', '90g', 'goods/images/a19d289760e23462d0c4b5500504fjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:28:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('65', '茼蒿菜', '33', '99', '56', '65', '6', '80g', 'goods/images/a3281a5341da8429fa333f9cd6a1fjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:30:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('66', '圆生菜', '54', '98', '76', '56', '6', '155g', 'goods/images/7a73e4667c6a33329e8d3746e9edajpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:30:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('67', '川味香油', '43', '99', '34', '54', '6', '蒜末、香油、特色干碟、盐、鸡精、香菜、香葱', 'goods/images/6708a25e1cf2db2678019054c704bjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:35:00.000000', '6');
INSERT INTO `goods_goods` VALUES ('68', '香辣碟', '20', '99', '34', '43', '6', '特色干碟、花生碎', 'goods/images/c26c32def7d3fdc4801dcbdd03bb6jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:36:00.000000', '6');
INSERT INTO `goods_goods` VALUES ('69', '鸳鸯锅(红锅+白锅)', '54', '99', '34', '43', '40', '红白配', 'goods/images/464e52460ecfd963d35fc195e95d4jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:37:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('70', '怡宝矿泉水', '43', '100', '45', '56', '4', '', 'goods/images/98b44fc3723040522145f5c462c3bjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:46:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('71', '雪碧1.25L', '43', '99', '56', '56', '12', '1.25L', 'goods/images/0efb658217c21c839e27eb4643178jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:47:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('72', '品鉴45度', '45', '99', '45', '45', '35', '泸州老窖225ml', 'goods/images/02c0152feffb4000256d345ee2103jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:48:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('73', '热狗肠', '33', '99', '56', '45', '1.5', '串', 'goods/images/04af7c76420fb05493f134bb66279jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:49:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('74', '泡椒牛肉', '34', '99', '34', '45', '1.5', '串', 'goods/images/b23f3b0e60539a0529234e301c0a1jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:50:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('75', '香菜牛肉', '55', '100', '30', '45', '1.5', '串', 'goods/images/c207cae86280d9b91f60ff1819631jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:52:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('76', '霸王牛肉', '10', '100', '45', '56', '1.5', '串', 'goods/images/ae01d69e552943bc92625bc30dc6ejpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:52:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('77', '开花肠', '34', '100', '45', '30', '1.5', '串', 'goods/images/4695225964849060722e794bfe518jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:53:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('78', '豆腐', '45', '100', '33', '45', '8', '180g', 'goods/images/326b6890568d6f010d8f3ea741283jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 17:57:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('79', '不插电小火锅', '45', '99', '45', '56', '29', '方便实用', 'goods/images/27978f7669e5b861e040c70b4bb5f01750949.jpg', '0', '10', '0', '0', '2018-01-15 18:00:00.000000', '1');
INSERT INTO `goods_goods` VALUES ('80', '麻酱', '45', '99', '45', '54', '3', '纯芝麻', 'goods/images/886589c347b89f15713bf04940b0bd58337920.jpg', '0', '10', '0', '0', '2018-01-15 18:04:00.000000', '6');
INSERT INTO `goods_goods` VALUES ('81', '辣油', '34', '98', '43', '43', '5', '香辣', 'goods/images/16a26bc53db3e76a4ea661c18cde0547391168.jpg', '0', '10', '0', '0', '2018-01-15 18:05:00.000000', '6');
INSERT INTO `goods_goods` VALUES ('82', '菌类拼盘', '43', '93', '43', '34', '18', '丰富划算', 'goods/images/d455f097bd2692e981d3b08a2480d21c347370.jpg', '0', '10', '0', '0', '2018-01-15 18:06:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('83', '香菜香葱', '34', '99', '56', '45', '2', '绝佳配料', 'goods/images/0bb587a48abe7a7df90e31c217f72fbf74232.jpg', '0', '10', '0', '0', '2018-01-15 18:09:00.000000', '6');
INSERT INTO `goods_goods` VALUES ('84', '劲酒', '4', '99', '56', '45', '18', '小瓶装', 'goods/images/b8595bc88544b0910e07dd4024ca1jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:33:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('85', '白牛栏山', '5', '98', '43', '3', '20', '白瓶', 'goods/images/954c9305b5c47eabbf95f918868afjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:35:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('86', '燕京啤酒', '30', '100', '45', '56', '5', '厅装', 'goods/images/85845e758b04d4e7805fa3c2e2b45jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:36:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('87', '果粒橙', '33', '99', '32', '45', '15', '大瓶', 'goods/images/a7d03a7d93c6be4cb32e0521ed51djpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:36:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('88', '绿牛栏山', '4', '92', '30', '43', '18', '绿瓶装', 'goods/images/587a1871a3797431b80ae870f2be5jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:37:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('89', '椰汁', '15', '100', '30', '45', '8', '椰树牌', 'goods/images/84d44beb6d2d4ac943ea7dc266cd9jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:38:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('90', '手工面', '35', '100', '34', '45', '8', '纯手工', 'goods/images/6533b4d4bacb98100807d35dcf744jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:38:00.000000', '2');
INSERT INTO `goods_goods` VALUES ('91', '米饭', '45', '100', '30', '45', '3', '', 'goods/images/9496590f694cb8e89e088f9714682jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:39:00.000000', '2');
INSERT INTO `goods_goods` VALUES ('92', '烧饼', '35', '100', '30', '34', '3', '', 'goods/images/64c7b677819fc4e993af525a0464cjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:40:00.000000', '2');
INSERT INTO `goods_goods` VALUES ('93', '三鲜锅', '12', '100', '45', '34', '28', '锅具单点', 'goods/images/b7d69cb5bad9d55b81184ec4b6ef1jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:40:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('94', '番茄鸳鸯锅', '35', '92', '30', '45', '38', '锅具单点', 'goods/images/01b7e1ecafeab0a0e8d5908b7de3ajpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:41:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('95', '酸菜鸳鸯锅', '43', '98', '30', '45', '38', '锅具单点', 'goods/images/b42839f99e7b1c70d4db5062c25b1jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:42:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('96', '菌汤锅', '13', '98', '32', '43', '28', '锅具单点', 'goods/images/61d2072bd639ee02f1a51052fb648jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:43:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('97', '牛油麻辣锅', '35', '97', '22', '43', '28', '锅具单点', 'goods/images/33762eed147ce668be57839246db2jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:43:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('98', '鸳鸯锅具', '21', '100', '30', '45', '18', '需要自己配电磁炉，锅底单点', 'goods/images/0d5ca576d6b9e5026d28f9839b769jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:45:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('99', '不锈钢锅具', '32', '100', '30', '30', '16', '需要自己配电磁炉，不带锅底，需要单点', 'goods/images/e6f14e6e928237a4b8c8c90e3f2b8jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:46:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('100', '专用小火锅+燃油罐一套', '45', '100', '30', '30', '39', '锅底单点', 'goods/images/a213cf76e2bb383c2eabeda20e7ebjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:46:00.000000', '3');
INSERT INTO `goods_goods` VALUES ('101', '香辣酱', '35', '100', '34', '30', '6', '秘制', 'goods/images/ff3ab3388279426bdea0065a31630jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:48:00.000000', '6');
INSERT INTO `goods_goods` VALUES ('102', '味碟', '26', '98', '30', '30', '6', '秘制', 'goods/images/f4b0b600a2888a0010c5243617d0bjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:48:00.000000', '6');
INSERT INTO `goods_goods` VALUES ('103', '麻酱', '253', '100', '30', '300', '5', '配有葱姜蒜小料', 'goods/images/9d1396e5c2abdf52437d880f4437fjpeg_WA6Aj5R.jpeg', '0', '10', '0', '0', '2018-01-15 18:49:00.000000', '6');
INSERT INTO `goods_goods` VALUES ('104', '撒尿牛丸', '25', '92', '30', '30', '22', '', 'goods/images/fb10aa0b46e9d69ebdd7ff674dce4jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:50:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('105', '包心鱼丸', '33', '92', '30', '43', '26', '', 'goods/images/60d25fc9fae8a9f57a8aca63496d1jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:51:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('106', '秘制虾滑', '42', '100', '22', '45', '36', '自制', 'goods/images/ff8653cd50cd09305c41714e719d4jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:52:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('107', '秘制鱼滑', '33', '89', '23', '30', '36', '独家', 'goods/images/fc8898f87b20fdedc6758ea3f64c8jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:53:00.000000', '9');
INSERT INTO `goods_goods` VALUES ('108', '冻豆腐', '38', '87', '23', '30', '12', '', 'goods/images/2a207d9abde4786716168115a5482jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:54:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('109', '白萝卜', '14', '96', '32', '32', '8', '', 'goods/images/ec4317bc3fb5c3d1140c94febc1a8jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:55:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('110', '菇类大拼盘', '34', '100', '30', '34', '28', '种类丰富', 'goods/images/0a5bf47dd475dc4df8950d5d1ea94jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:56:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('111', '素菜拼盘', '43', '100', '30', '30', '26', '种类丰富', 'goods/images/150dc9ea67815a1813d158fe48f70jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:56:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('112', '红薯', '13', '87', '22', '30', '12', '', 'goods/images/49d984da08a6e2552bfe326c568d3jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:57:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('113', '香菜', '23', '91', '30', '30', '8', '', 'goods/images/41525359098a1816d8858cb883153jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:58:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('114', '冬瓜', '35', '95', '30', '34', '8', '', 'goods/images/18543f742516efd6619e9a5001cbejpeg.jpeg', '0', '10', '0', '0', '2018-01-15 18:59:00.000000', '5');
INSERT INTO `goods_goods` VALUES ('115', '羊上脑', '23', '100', '34', '30', '42', '', 'goods/images/6c84248a8cc330cc2fb7b04514f66jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 19:00:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('116', '内蒙古羔羊肉', '23', '89', '22', '30', '38', '来自大草原', 'goods/images/33db7810672190580f58df8f312dajpeg.jpeg', '0', '10', '0', '0', '2018-01-15 19:01:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('117', '牛羊双排', '35', '90', '23', '30', '48', '', 'goods/images/b849cd3d3f140e174ef6c8a3de1c9jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 19:01:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('118', '高钙羊肉', '23', '92', '30', '34', '42', '', 'goods/images/fda337e146c3b05ceddb827df3c65jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 19:02:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('119', '爽滑嫩牛肉', '22', '92', '34', '43', '38', '', 'goods/images/bf7c67df69160e23e491eb23831e5jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 19:03:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('120', '刺猬鸭胗花', '35', '93', '34', '30', '28', '', 'goods/images/bfe14de58f52bd94ec022a2f0dc32jpeg.jpeg', '0', '10', '0', '0', '2018-01-15 19:04:00.000000', '4');
INSERT INTO `goods_goods` VALUES ('121', '菠菜', '14', '93', '22', '45', '8', '', 'goods/images/f5aac068d23e0cdf0be7702850aebjpeg.jpeg', '0', '10', '0', '0', '2018-01-15 19:05:00.000000', '5');

-- ----------------------------
-- Table structure for goods_goodscategory
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodscategory`;
CREATE TABLE `goods_goodscategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(30) NOT NULL,
  `desc` longtext NOT NULL,
  `is_tab` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goodscategory
-- ----------------------------
INSERT INTO `goods_goodscategory` VALUES ('1', '优惠', '1', '美味又实惠，大家快来抢！', '0', '2018-01-11 21:48:00.000000');
INSERT INTO `goods_goodscategory` VALUES ('2', '主食', '2', '大家喜欢吃，才叫真好吃', '0', '2018-01-11 21:50:00.000000');
INSERT INTO `goods_goodscategory` VALUES ('3', '特色锅底/锅具', '5', '选择自己喜欢的', '0', '2018-01-11 21:55:00.000000');
INSERT INTO `goods_goodscategory` VALUES ('4', '肉类', '3', '选择自己喜欢的', '0', '2018-01-11 21:56:00.000000');
INSERT INTO `goods_goodscategory` VALUES ('5', '蔬菜类', '4', '素食的最爱', '0', '2018-01-11 21:57:00.000000');
INSERT INTO `goods_goodscategory` VALUES ('6', '独家蘸料', '7', '喜欢的', '0', '2018-01-11 22:04:00.000000');
INSERT INTO `goods_goodscategory` VALUES ('7', '酒水饮料', '8', '选喜欢的', '0', '2018-01-14 21:48:00.000000');
INSERT INTO `goods_goodscategory` VALUES ('8', '灵魂', '9', '本店特色', '0', '2018-01-14 21:49:00.000000');
INSERT INTO `goods_goodscategory` VALUES ('9', '荤菜类', '6', '新鲜', '0', '2018-01-14 21:50:00.000000');

-- ----------------------------
-- Table structure for goods_goods_store
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods_store`;
CREATE TABLE `goods_goods_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_goods_store_goods_id_6bfcc6a8_uniq` (`goods_id`,`store_id`),
  KEY `goods_goods_store_store_id_2b7b92a9_fk_goods_store_id` (`store_id`),
  CONSTRAINT `goods_goods_store_goods_id_9c45e743_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `goods_goods_store_store_id_2b7b92a9_fk_goods_store_id` FOREIGN KEY (`store_id`) REFERENCES `goods_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goods_store
-- ----------------------------
INSERT INTO `goods_goods_store` VALUES ('1', '1', '3');
INSERT INTO `goods_goods_store` VALUES ('2', '2', '3');
INSERT INTO `goods_goods_store` VALUES ('3', '3', '3');
INSERT INTO `goods_goods_store` VALUES ('4', '4', '4');
INSERT INTO `goods_goods_store` VALUES ('5', '5', '3');
INSERT INTO `goods_goods_store` VALUES ('6', '6', '5');
INSERT INTO `goods_goods_store` VALUES ('7', '7', '5');
INSERT INTO `goods_goods_store` VALUES ('8', '8', '5');
INSERT INTO `goods_goods_store` VALUES ('9', '9', '5');
INSERT INTO `goods_goods_store` VALUES ('10', '10', '5');
INSERT INTO `goods_goods_store` VALUES ('11', '11', '5');
INSERT INTO `goods_goods_store` VALUES ('12', '12', '5');
INSERT INTO `goods_goods_store` VALUES ('13', '13', '5');
INSERT INTO `goods_goods_store` VALUES ('14', '14', '5');
INSERT INTO `goods_goods_store` VALUES ('15', '15', '5');
INSERT INTO `goods_goods_store` VALUES ('16', '16', '5');
INSERT INTO `goods_goods_store` VALUES ('17', '17', '5');
INSERT INTO `goods_goods_store` VALUES ('18', '18', '5');
INSERT INTO `goods_goods_store` VALUES ('19', '19', '5');
INSERT INTO `goods_goods_store` VALUES ('20', '20', '5');
INSERT INTO `goods_goods_store` VALUES ('21', '21', '5');
INSERT INTO `goods_goods_store` VALUES ('22', '22', '5');
INSERT INTO `goods_goods_store` VALUES ('23', '23', '5');
INSERT INTO `goods_goods_store` VALUES ('24', '24', '5');
INSERT INTO `goods_goods_store` VALUES ('25', '25', '5');
INSERT INTO `goods_goods_store` VALUES ('26', '26', '5');
INSERT INTO `goods_goods_store` VALUES ('27', '27', '5');
INSERT INTO `goods_goods_store` VALUES ('28', '28', '5');
INSERT INTO `goods_goods_store` VALUES ('29', '29', '5');
INSERT INTO `goods_goods_store` VALUES ('30', '30', '5');
INSERT INTO `goods_goods_store` VALUES ('31', '31', '5');
INSERT INTO `goods_goods_store` VALUES ('32', '32', '5');
INSERT INTO `goods_goods_store` VALUES ('33', '33', '5');
INSERT INTO `goods_goods_store` VALUES ('34', '34', '6');
INSERT INTO `goods_goods_store` VALUES ('35', '35', '6');
INSERT INTO `goods_goods_store` VALUES ('36', '36', '6');
INSERT INTO `goods_goods_store` VALUES ('37', '37', '6');
INSERT INTO `goods_goods_store` VALUES ('38', '38', '6');
INSERT INTO `goods_goods_store` VALUES ('39', '39', '6');
INSERT INTO `goods_goods_store` VALUES ('40', '40', '6');
INSERT INTO `goods_goods_store` VALUES ('41', '41', '6');
INSERT INTO `goods_goods_store` VALUES ('42', '42', '6');
INSERT INTO `goods_goods_store` VALUES ('43', '43', '6');
INSERT INTO `goods_goods_store` VALUES ('44', '44', '6');
INSERT INTO `goods_goods_store` VALUES ('45', '45', '6');
INSERT INTO `goods_goods_store` VALUES ('46', '46', '6');
INSERT INTO `goods_goods_store` VALUES ('47', '47', '6');
INSERT INTO `goods_goods_store` VALUES ('48', '48', '6');
INSERT INTO `goods_goods_store` VALUES ('49', '49', '6');
INSERT INTO `goods_goods_store` VALUES ('50', '50', '6');
INSERT INTO `goods_goods_store` VALUES ('51', '51', '6');
INSERT INTO `goods_goods_store` VALUES ('52', '52', '6');
INSERT INTO `goods_goods_store` VALUES ('53', '53', '6');
INSERT INTO `goods_goods_store` VALUES ('54', '54', '6');
INSERT INTO `goods_goods_store` VALUES ('55', '55', '11');
INSERT INTO `goods_goods_store` VALUES ('56', '56', '11');
INSERT INTO `goods_goods_store` VALUES ('57', '57', '10');
INSERT INTO `goods_goods_store` VALUES ('58', '58', '9');
INSERT INTO `goods_goods_store` VALUES ('59', '59', '7');
INSERT INTO `goods_goods_store` VALUES ('60', '60', '7');
INSERT INTO `goods_goods_store` VALUES ('61', '61', '6');
INSERT INTO `goods_goods_store` VALUES ('62', '62', '6');
INSERT INTO `goods_goods_store` VALUES ('63', '63', '6');
INSERT INTO `goods_goods_store` VALUES ('64', '64', '6');
INSERT INTO `goods_goods_store` VALUES ('65', '65', '6');
INSERT INTO `goods_goods_store` VALUES ('66', '66', '6');
INSERT INTO `goods_goods_store` VALUES ('67', '67', '6');
INSERT INTO `goods_goods_store` VALUES ('68', '68', '6');
INSERT INTO `goods_goods_store` VALUES ('69', '69', '6');
INSERT INTO `goods_goods_store` VALUES ('70', '70', '6');
INSERT INTO `goods_goods_store` VALUES ('71', '71', '6');
INSERT INTO `goods_goods_store` VALUES ('72', '72', '6');
INSERT INTO `goods_goods_store` VALUES ('73', '73', '6');
INSERT INTO `goods_goods_store` VALUES ('74', '74', '6');
INSERT INTO `goods_goods_store` VALUES ('75', '75', '6');
INSERT INTO `goods_goods_store` VALUES ('76', '76', '6');
INSERT INTO `goods_goods_store` VALUES ('77', '77', '6');
INSERT INTO `goods_goods_store` VALUES ('78', '78', '6');
INSERT INTO `goods_goods_store` VALUES ('79', '79', '5');
INSERT INTO `goods_goods_store` VALUES ('80', '80', '5');
INSERT INTO `goods_goods_store` VALUES ('81', '81', '5');
INSERT INTO `goods_goods_store` VALUES ('82', '82', '5');
INSERT INTO `goods_goods_store` VALUES ('83', '83', '5');
INSERT INTO `goods_goods_store` VALUES ('84', '84', '8');
INSERT INTO `goods_goods_store` VALUES ('85', '85', '8');
INSERT INTO `goods_goods_store` VALUES ('86', '86', '8');
INSERT INTO `goods_goods_store` VALUES ('87', '87', '8');
INSERT INTO `goods_goods_store` VALUES ('88', '88', '8');
INSERT INTO `goods_goods_store` VALUES ('89', '89', '8');
INSERT INTO `goods_goods_store` VALUES ('90', '90', '8');
INSERT INTO `goods_goods_store` VALUES ('91', '91', '8');
INSERT INTO `goods_goods_store` VALUES ('92', '92', '8');
INSERT INTO `goods_goods_store` VALUES ('93', '93', '8');
INSERT INTO `goods_goods_store` VALUES ('94', '94', '8');
INSERT INTO `goods_goods_store` VALUES ('95', '95', '8');
INSERT INTO `goods_goods_store` VALUES ('96', '96', '8');
INSERT INTO `goods_goods_store` VALUES ('97', '97', '8');
INSERT INTO `goods_goods_store` VALUES ('98', '98', '8');
INSERT INTO `goods_goods_store` VALUES ('99', '99', '8');
INSERT INTO `goods_goods_store` VALUES ('100', '100', '8');
INSERT INTO `goods_goods_store` VALUES ('101', '101', '8');
INSERT INTO `goods_goods_store` VALUES ('102', '102', '8');
INSERT INTO `goods_goods_store` VALUES ('103', '103', '8');
INSERT INTO `goods_goods_store` VALUES ('104', '104', '8');
INSERT INTO `goods_goods_store` VALUES ('105', '105', '8');
INSERT INTO `goods_goods_store` VALUES ('106', '106', '8');
INSERT INTO `goods_goods_store` VALUES ('107', '107', '8');
INSERT INTO `goods_goods_store` VALUES ('108', '108', '8');
INSERT INTO `goods_goods_store` VALUES ('109', '109', '8');
INSERT INTO `goods_goods_store` VALUES ('110', '110', '8');
INSERT INTO `goods_goods_store` VALUES ('111', '111', '8');
INSERT INTO `goods_goods_store` VALUES ('112', '112', '8');
INSERT INTO `goods_goods_store` VALUES ('113', '113', '8');
INSERT INTO `goods_goods_store` VALUES ('114', '114', '8');
INSERT INTO `goods_goods_store` VALUES ('115', '115', '8');
INSERT INTO `goods_goods_store` VALUES ('116', '116', '8');
INSERT INTO `goods_goods_store` VALUES ('117', '117', '8');
INSERT INTO `goods_goods_store` VALUES ('118', '118', '8');
INSERT INTO `goods_goods_store` VALUES ('119', '119', '8');
INSERT INTO `goods_goods_store` VALUES ('120', '120', '8');
INSERT INTO `goods_goods_store` VALUES ('121', '121', '8');

-- ----------------------------
-- Table structure for goods_hotsearchwords
-- ----------------------------
DROP TABLE IF EXISTS `goods_hotsearchwords`;
CREATE TABLE `goods_hotsearchwords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotSearch` varchar(20) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_hotsearchwords
-- ----------------------------
INSERT INTO `goods_hotsearchwords` VALUES ('1', '白菜', '1', '2018-01-07 16:19:00.000000');
INSERT INTO `goods_hotsearchwords` VALUES ('2', '鸳鸯锅', '0', '2018-01-07 16:19:00.000000');

-- ----------------------------
-- Table structure for goods_specialindex
-- ----------------------------
DROP TABLE IF EXISTS `goods_specialindex`;
CREATE TABLE `goods_specialindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `imgUrl` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_specialindex
-- ----------------------------
INSERT INTO `goods_specialindex` VALUES ('1', '重庆火锅重铸家庭温暖亲情', 'banner/20171127151045599.jpeg', '1', '2018-01-13 16:32:00.000000');
INSERT INTO `goods_specialindex` VALUES ('2', '特色涮肉坊免费上门', 'banner/463da288b0e2e41edaf0bbb68b2d2e8f50933.jpg', '2', '2018-01-13 16:35:00.000000');
INSERT INTO `goods_specialindex` VALUES ('3', '鲜辣爽滑 唇齿留香', 'banner/E0F55ECAB78E38BAB9612ECF2A56DC56.jpg', '3', '2018-01-13 16:35:00.000000');
INSERT INTO `goods_specialindex` VALUES ('4', '内蒙特产小羊肉 陪你一起嗨', 'banner/5755881798756784335.jpg', '4', '2018-01-13 16:36:00.000000');

-- ----------------------------
-- Table structure for goods_store
-- ----------------------------
DROP TABLE IF EXISTS `goods_store`;
CREATE TABLE `goods_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `infomation` longtext NOT NULL,
  `logo` varchar(200) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `openingHours` varchar(100) NOT NULL,
  `notice` longtext NOT NULL,
  `pics` longtext,
  `startAmount` int(11) NOT NULL,
  `trans` int(11) NOT NULL,
  `orders` int(11) NOT NULL,
  `favComments` double NOT NULL,
  `address` varchar(100) NOT NULL,
  `praise` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_store
-- ----------------------------
INSERT INTO `goods_store` VALUES ('3', '淘汰郎小火锅（北京店）', '全国首家外送小火锅的互联网餐饮品牌。为您提供最极致的美食与体验。全线产品经米其林主厨研制创新。淘汰郎 99元一套 随叫随到', 'stores/f091f6aa61ee84329f0a1cbf07a31_kjATLWU.png', '13012392343', '09:00-22:50', '欢迎光临', '<p>w</p>', '15', '5', '420', '94.4', '北京市海淀区羊坊店路21号瑞海大厦1层1018', '0', '2018-01-11 22:00:00.000000');
INSERT INTO `goods_store` VALUES ('4', '呷哺呷哺(清河永泰园店)', '呷哺小鲜品质源自坚持！鲜菜上门，可涮可炒任性吃！', 'stores/b33049d6d8b9fe50ab5df5245606b.png', '13021921090', '09:00-22:50', '欢迎光临', '<p>w</p>', '15', '5', '648', '98.6', '北京市海淀区清河永泰园甲一号综合楼1层南侧02号商铺', '0', '2018-01-11 22:02:00.000000');
INSERT INTO `goods_store` VALUES ('5', '麻麻很辣火锅外卖', 'xxx', 'stores/dbca10a554f806b2f2c811db36f4b1c8212900.jpg', '13088453233', '09:00-22:50', '欢迎光临', '<p><strong>w</strong><br/></p>', '99', '19', '38', '99.1', 'kk', '0', '2018-01-14 14:29:00.000000');
INSERT INTO `goods_store` VALUES ('6', '六婆串串香火锅（六道口店）', 'ss', 'stores/3797f808e1351d326917894cab86bc7b38224.jpg', '13122435675', '09:00-22:50', '欢迎光临', '<p>c</p>', '100', '30', '18', '4', 'liu', '0', '2018-01-14 14:33:00.000000');
INSERT INTO `goods_store` VALUES ('7', '锅sir时尚火锅外卖（望京店）', 's', 'stores/1b0b11ca8d2c168f16a80c526c40380f50140.jpg', '13123435455', '09:00-22:50', '欢迎光临', '<p>w</p>', '30', '30', '132', '4.8', 'ss', '0', '2018-01-14 14:34:00.000000');
INSERT INTO `goods_store` VALUES ('8', '宽板凳老灶火锅', 'ss', 'stores/47dc9fbc94ab8c8d26e28a24ffe4594467220.jpg', '15947814344', '09:00-22:50', '欢迎光临', '<p>w</p>', '0', '80', '136', '4.4', 'k', '0', '2018-01-14 14:43:00.000000');
INSERT INTO `goods_store` VALUES ('9', '懒人小火锅', 's', 'stores/6fdec631fe1d6e24ce29defa96ae1c01813790.png', '15546355545', '09:00-22:50', '欢迎光临', '<p>w</p>', '10', '25', '119', '5', '24.1', '1', '2018-01-14 14:46:00.000000');
INSERT INTO `goods_store` VALUES ('10', '恒美轩老北京铜锅涮肉', 'ss', 'stores/66dcd8a04217e5ced8d96180ee0f50f7111824.jpg', '13254667966', '09:00-22:50', '欢迎光临', '<p>s</p>', '0', '35', '30', '5', '14.3', '0', '2018-01-14 14:47:00.000000');
INSERT INTO `goods_store` VALUES ('11', '老北京涮肉', 's', 'stores/bbc4eec51889e97d87de63475976fe1140960.jpg', '13547815455', '09:00-22:50', '欢迎光临', '<p>w</p>', '200', '37', '85', '3.9', '16.9', '0', '2018-01-14 14:49:00.000000');

-- ----------------------------
-- Table structure for goods_store_detail
-- ----------------------------
DROP TABLE IF EXISTS `goods_store_detail`;
CREATE TABLE `goods_store_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_store_detail_store_id_e8e042ea_fk_goods_store_id` (`store_id`),
  CONSTRAINT `goods_store_detail_store_id_e8e042ea_fk_goods_store_id` FOREIGN KEY (`store_id`) REFERENCES `goods_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_store_detail
-- ----------------------------
INSERT INTO `goods_store_detail` VALUES ('1', 'banner/3d4c45f1d3a0b50b0ba8b623a7e25a58.jpg', '1', '2018-01-14 21:06:00.000000', '4');
INSERT INTO `goods_store_detail` VALUES ('2', 'banner/5a3ee1bc03664b2ab7a9af7c4d90d4f7.jpg', '2', '2018-01-14 21:07:00.000000', '4');
INSERT INTO `goods_store_detail` VALUES ('3', 'banner/6b6c509d6f9ef216c4f69fa60738e6c0.jpg', '3', '2018-01-14 21:07:00.000000', '4');
INSERT INTO `goods_store_detail` VALUES ('4', 'banner/0efbc3ea47f305041ede82e0b9455653.jpg', '1', '2018-01-14 21:09:00.000000', '3');
INSERT INTO `goods_store_detail` VALUES ('5', 'banner/bbb0c233a27fe12b0ebdf364a8e33297.jpg', '2', '2018-01-14 21:09:00.000000', '3');
INSERT INTO `goods_store_detail` VALUES ('6', 'banner/bf8fd07479cc24289aecedc3e0ad9jpeg.jpeg', '1', '2018-01-15 16:50:00.000000', '6');
INSERT INTO `goods_store_detail` VALUES ('7', 'banner/a513cec178fff5155deedcc92b31djpeg.jpeg', '2', '2018-01-15 16:52:00.000000', '6');
INSERT INTO `goods_store_detail` VALUES ('8', 'banner/081824dd36784a5901f00c4716428jpeg.jpeg', '3', '2018-01-15 16:52:00.000000', '6');

-- ----------------------------
-- Table structure for trade_neighborimg
-- ----------------------------
DROP TABLE IF EXISTS `trade_neighborimg`;
CREATE TABLE `trade_neighborimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `imgUrl` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_neighborimg
-- ----------------------------
INSERT INTO `trade_neighborimg` VALUES ('1', '三鲜锅', 'banner/三鲜.jpg', '1', '2018-01-14 20:10:00.000000');
INSERT INTO `trade_neighborimg` VALUES ('2', '酸菜鸳鸯锅', 'banner/酸菜鸳鸯.jpg', '2', '2018-01-14 20:12:00.000000');
INSERT INTO `trade_neighborimg` VALUES ('3', '菌汤锅', 'banner/菌汤锅.jpg', '3', '2018-01-14 20:13:00.000000');
INSERT INTO `trade_neighborimg` VALUES ('4', '番茄锅', 'banner/番茄.jpg', '4', '2018-01-14 20:13:00.000000');
INSERT INTO `trade_neighborimg` VALUES ('5', '鸳鸯锅', 'banner/鸳鸯.jpg', '5', '2018-01-14 20:13:00.000000');
INSERT INTO `trade_neighborimg` VALUES ('6', '火锅牛肉粉', 'banner/牛肉.jpg', '6', '2018-01-14 20:13:00.000000');

-- ----------------------------
-- Table structure for trade_ordergoods
-- ----------------------------
DROP TABLE IF EXISTS `trade_ordergoods`;
CREATE TABLE `trade_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` (`goods_id`),
  KEY `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` (`order_id`),
  CONSTRAINT `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` FOREIGN KEY (`order_id`) REFERENCES `trade_orderinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_ordergoods
-- ----------------------------

-- ----------------------------
-- Table structure for trade_orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `trade_orderinfo`;
CREATE TABLE `trade_orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(30) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `post_script` varchar(200) NOT NULL,
  `total` double NOT NULL,
  `pay_time` datetime(6) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(20) NOT NULL,
  `singer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  UNIQUE KEY `trade_no` (`trade_no`),
  KEY `trade_orderinfo_store_id_11fdf63c_fk_goods_store_id` (`store_id`),
  KEY `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `trade_orderinfo_store_id_11fdf63c_fk_goods_store_id` FOREIGN KEY (`store_id`) REFERENCES `goods_store` (`id`),
  CONSTRAINT `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_orderinfo
-- ----------------------------
INSERT INTO `trade_orderinfo` VALUES ('1', '20180114121845151', null, 'paying', '很棒', '300', null, '海淀区天丰利', '舜顺', '13757578877', '2018-01-14 12:18:45.149482', '3', '1');
INSERT INTO `trade_orderinfo` VALUES ('2', '20180114121932120', null, 'TRADE_FINISHED', '很棒很棒', '600', null, '海淀区天丰利海淀区天丰利', '舜顺舜顺', '13757578877', '2018-01-14 12:19:32.934697', '3', '1');
INSERT INTO `trade_orderinfo` VALUES ('3', '20180114172103172', null, 'TRADE_FINISHED', '少辣', '170', null, '天丰利', 'slain', '13567678899', '2018-01-12 08:06:00.000000', '6', '1');
INSERT INTO `trade_orderinfo` VALUES ('4', '20180114172151186', null, 'TRADE_FINISHED', '五点来', '160', null, '天丰利四楼', 'sky', '13567675566', '2018-01-11 08:06:00.000000', '8', '1');

-- ----------------------------
-- Table structure for trade_shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `trade_shoppingcart`;
CREATE TABLE `trade_shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trade_shoppingcart_user_id_92225e66_uniq` (`user_id`,`goods_id`),
  KEY `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_shoppingcart_user_id_da423c9c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `headImg` varchar(100) NOT NULL,
  `redBag` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `hasPassword` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_name_789468f4_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$30000$na2LtxswtKdC$taZ2Itqz4YHAUnVdxqK26HfmoWgC3FN+Se7JfZaE008=', '2018-01-19 18:08:27.508503', '1', '1', '1', '1', '', '', '0', '0', '0');
INSERT INTO `users_userprofile` VALUES ('2', 'pbkdf2_sha256$36000$R7zqIaXqbuMJ$GzWeY/HCAm/7O9ZhIhgV2kWfzisY/uREE5LCrA/0FgU=', '2018-01-03 21:26:08.000000', '0', '0', '1', '2vf4n6', '18317725250', 'head\\toxiang.jpg', '0', '0', '0');
INSERT INTO `users_userprofile` VALUES ('3', 'pbkdf2_sha256$36000$1EDblXn8Igl7$WY+rdSGFV+PxUrjsiVJJ/yh+B6Ha5M9j2KOSuys4CMw=', '2018-01-10 21:26:14.000000', '0', '0', '1', 'slqbmu', '18888888888', 'head\\toxiang.jpg', '0', '0', '0');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for users_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `users_verifycode`;
CREATE TABLE `users_verifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verCode` varchar(10) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_verifycode
-- ----------------------------
INSERT INTO `users_verifycode` VALUES ('1', '843347', '13021935467', '2018-01-16 21:27:47.729913');

-- ----------------------------
-- Table structure for user_operation_useraddress
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_useraddress`;
CREATE TABLE `user_operation_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `detail_addr` varchar(100) NOT NULL,
  `signer_name` varchar(100) NOT NULL,
  `signer_sex` varchar(20) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_useraddr_user_id_fe128593_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `user_operation_useraddr_user_id_fe128593_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_useraddress
-- ----------------------------
INSERT INTO `user_operation_useraddress` VALUES ('1', '北京', '北京市', '海淀区', '海淀区', 'bobby', '1', '18888888888', '2018-01-09 12:46:36.603193', '1');
INSERT INTO `user_operation_useraddress` VALUES ('3', '', '', '', '朝阳区', 'dacer', '1', '18888888889', '2018-01-09 21:23:37.191911', '1');

-- ----------------------------
-- Table structure for user_operation_userfav
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userfav`;
CREATE TABLE `user_operation_userfav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `stores_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userfav_stores_id_7903062e_fk_goods_store_id` (`stores_id`),
  KEY `user_operation_userfav_user_id_4e4de070_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `user_operation_userfav_stores_id_7903062e_fk_goods_store_id` FOREIGN KEY (`stores_id`) REFERENCES `goods_store` (`id`),
  CONSTRAINT `user_operation_userfav_user_id_4e4de070_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_userfav
-- ----------------------------

-- ----------------------------
-- Table structure for user_operation_userleavingmessage
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userleavingmessage`;
CREATE TABLE `user_operation_userleavingmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `praise` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `file` varchar(100) NOT NULL,
  `time` datetime(6) NOT NULL,
  `is_Anonym` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userleav_user_id_70d909d6_fk_users_userprofile_id` (`user_id`),
  KEY `user_operation_userleavingme_store_id_1dbcb567_fk_goods_store_id` (`store_id`),
  CONSTRAINT `user_operation_userleav_user_id_70d909d6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `user_operation_userleavingme_store_id_1dbcb567_fk_goods_store_id` FOREIGN KEY (`store_id`) REFERENCES `goods_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_userleavingmessage
-- ----------------------------
INSERT INTO `user_operation_userleavingmessage` VALUES ('4', '4', '好好', 'message/images/2_ryGvaa0.jpg', '2018-01-08 18:22:00.000000', '0', '1', '4');
INSERT INTO `user_operation_userleavingmessage` VALUES ('5', '5', '嗯嗯还不错', 'message/images/4_Npa9FoR.jpg', '2018-01-08 18:23:00.000000', '1', '1', '4');
INSERT INTO `user_operation_userleavingmessage` VALUES ('6', '4', '没得说，看图片吧', 'message/images/2_N6VudfT.jpg', '2018-01-08 18:25:00.000000', '1', '1', '6');
INSERT INTO `user_operation_userleavingmessage` VALUES ('7', '5', '很好吃', 'message/images/1_2VBOOtw.jpg', '2018-01-08 20:22:00.000000', '1', '2', '6');
INSERT INTO `user_operation_userleavingmessage` VALUES ('8', '5', '很好吃的', 'message/images/0_xodLVOV.jpg', '2018-01-08 20:34:00.000000', '1', '2', '5');

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-01-11 21:50:27.321495', '127.0.0.1', '1', '优惠', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-01-11 21:50:54.321849', '127.0.0.1', '2', '热销', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-01-11 21:56:42.969650', '127.0.0.1', '3', '锅具', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-01-11 21:57:01.886469', '127.0.0.1', '4', '肉类', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-01-11 21:57:33.918369', '127.0.0.1', '5', '蔬菜类', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-01-11 22:02:30.196734', '127.0.0.1', '3', '淘汰郎小火锅（北京店）', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-01-11 22:03:13.298524', '127.0.0.1', '4', '呷哺呷哺(清河永泰园店)', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-01-11 22:03:30.258635', '127.0.0.1', '2', '呷哺呷哺(清河永泰园店)', 'delete', '', '9', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-01-11 22:03:37.012839', '127.0.0.1', '1', '淘汰郎小火锅（北京店）', 'delete', '', '9', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-01-11 22:04:43.079163', '127.0.0.1', '6', '锅底', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-01-11 22:05:23.269401', '127.0.0.1', '1', '菌汤锅底', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-01-11 22:06:06.710941', '127.0.0.1', '2', '平菇', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-01-11 22:07:07.009589', '127.0.0.1', '3', '雪花牛肉', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-01-11 22:08:03.383525', '127.0.0.1', '4', '平菇', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-01-11 22:11:58.934209', '127.0.0.1', '2', '淘汰郎小火锅（北京店）', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-01-11 22:12:06.550922', '127.0.0.1', '3', '淘汰郎小火锅（北京店）', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-01-11 22:12:13.626057', '127.0.0.1', '4', '淘汰郎小火锅（北京店）', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-01-11 22:13:24.001997', '127.0.0.1', '5', 'moneyOff', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-01-11 22:13:39.951993', '127.0.0.1', '6', 'specialOffer', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-01-11 22:13:51.246037', '127.0.0.1', '7', 'snack', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-01-11 22:14:06.137588', '127.0.0.1', '8', 'moneyOff', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-01-11 22:14:19.383930', '127.0.0.1', '9', 'snack', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-01-13 13:03:38.606896', '127.0.0.1', '3', '雪花牛肉', 'change', '修改 category', '11', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-01-13 13:03:52.876702', '127.0.0.1', '2', '腐竹', 'change', '修改 title', '11', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-01-13 14:43:03.704963', '127.0.0.1', '2', '平菇', 'change', '修改 title', '11', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-01-13 14:47:24.958912', '127.0.0.1', '5', '白菜', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-01-13 16:35:13.394489', '127.0.0.1', '1', '重庆火锅重铸家庭温暖亲情', 'create', '已添加', '24', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-01-13 16:35:37.271556', '127.0.0.1', '2', '特色涮肉坊免费上门', 'create', '已添加', '24', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-01-13 16:36:08.755748', '127.0.0.1', '3', '鲜辣爽滑 唇齿留香', 'create', '已添加', '24', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-01-13 16:36:53.181330', '127.0.0.1', '4', '内蒙特产小羊肉 陪你一起嗨', 'create', '已添加', '24', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-01-13 17:45:44.199900', '127.0.0.1', '1', '红包', 'create', '已添加', '25', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-01-13 17:46:44.015984', '127.0.0.1', '2', '春运出票', 'create', '已添加', '25', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-01-13 17:46:53.623883', '127.0.0.1', '3', '春运出票', 'create', '已添加', '25', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-01-14 14:33:03.197031', '127.0.0.1', '5', '麻麻很辣火锅外卖', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-01-14 14:34:26.329980', '127.0.0.1', '6', '六婆串串香火锅（六道口店）', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-01-14 14:43:30.641311', '127.0.0.1', '7', '锅sir时尚火锅外卖（望京店）', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-01-14 14:46:00.807121', '127.0.0.1', '8', '宽板凳老灶火锅', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-01-14 14:47:32.066140', '127.0.0.1', '9', '懒人小火锅', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-01-14 14:48:39.217227', '127.0.0.1', '10', '恒美轩老北京铜锅涮肉', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-01-14 14:50:47.725005', '127.0.0.1', '11', '老北京涮肉', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-01-14 14:56:14.131706', '127.0.0.1', '11', '减', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-01-14 14:56:55.231423', '127.0.0.1', '12', '折', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-01-14 14:57:55.822583', '127.0.0.1', '13', '减', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-01-14 14:58:17.269145', '127.0.0.1', '14', '折', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-01-14 14:58:42.539923', '127.0.0.1', '15', '减', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-01-14 15:00:06.180375', '127.0.0.1', '16', '首', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-01-14 15:00:52.272211', '127.0.0.1', '17', '减', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2018-01-14 15:01:19.930268', '127.0.0.1', '18', '特', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2018-01-14 15:02:06.208818', '127.0.0.1', '19', '减', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2018-01-14 15:02:27.799743', '127.0.0.1', '20', '首', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2018-01-14 15:02:47.664831', '127.0.0.1', '21', '特', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2018-01-14 15:03:26.243764', '127.0.0.1', '22', '减', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2018-01-14 15:04:01.126496', '127.0.0.1', '23', '首', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2018-01-14 15:04:20.180650', '127.0.0.1', '24', '特', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2018-01-14 15:06:07.271246', '127.0.0.1', '25', '减', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2018-01-14 15:06:30.725999', '127.0.0.1', '26', '首', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2018-01-14 15:06:56.401462', '127.0.0.1', '14', '特', 'change', '修改 cate', '8', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2018-01-14 15:07:09.602705', '127.0.0.1', '12', '特', 'change', '修改 cate', '8', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2018-01-14 15:08:12.884657', '127.0.0.1', '27', '赠', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2018-01-14 20:12:57.118622', '127.0.0.1', '1', '三鲜锅', 'create', '已添加', '26', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2018-01-14 20:13:15.085372', '127.0.0.1', '2', '酸菜鸳鸯锅', 'create', '已添加', '26', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2018-01-14 20:13:26.035330', '127.0.0.1', '3', '菌汤锅', 'create', '已添加', '26', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2018-01-14 20:13:40.560338', '127.0.0.1', '4', '番茄锅', 'create', '已添加', '26', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2018-01-14 20:13:59.852806', '127.0.0.1', '5', '鸳鸯锅', 'create', '已添加', '26', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2018-01-14 20:14:17.860701', '127.0.0.1', '6', '火锅牛肉粉', 'create', '已添加', '26', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2018-01-14 21:07:26.340066', '127.0.0.1', '1', '呷哺呷哺(清河永泰园店)', 'create', '已添加', '27', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2018-01-14 21:07:32.874525', '127.0.0.1', '2', '呷哺呷哺(清河永泰园店)', 'create', '已添加', '27', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2018-01-14 21:07:39.329484', '127.0.0.1', '3', '呷哺呷哺(清河永泰园店)', 'create', '已添加', '27', '1');
INSERT INTO `xadmin_log` VALUES ('69', '2018-01-14 21:09:51.902702', '127.0.0.1', '4', '淘汰郎小火锅（北京店）', 'create', '已添加', '27', '1');
INSERT INTO `xadmin_log` VALUES ('70', '2018-01-14 21:10:03.236704', '127.0.0.1', '5', '淘汰郎小火锅（北京店）', 'create', '已添加', '27', '1');
INSERT INTO `xadmin_log` VALUES ('71', '2018-01-14 21:47:48.573931', '127.0.0.1', '2', '主食', 'change', '修改 name 和 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('72', '2018-01-14 21:47:55.154247', '127.0.0.1', '1', '优惠', 'change', '修改 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('73', '2018-01-14 21:48:33.176833', '127.0.0.1', '2', '主食', 'change', '修改 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('74', '2018-01-14 21:49:16.841942', '127.0.0.1', '7', '酒水饮料', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('75', '2018-01-14 21:49:26.178930', '127.0.0.1', '7', '酒水饮料', 'change', '修改 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('76', '2018-01-14 21:49:46.628297', '127.0.0.1', '8', '灵魂', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('77', '2018-01-14 21:50:04.820319', '127.0.0.1', '3', '锅具', 'change', '修改 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('78', '2018-01-14 21:50:20.176317', '127.0.0.1', '4', '精品牛羊肉', 'change', '修改 name 和 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('79', '2018-01-14 21:50:26.296680', '127.0.0.1', '5', '蔬菜类', 'change', '修改 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('80', '2018-01-14 21:50:50.545491', '127.0.0.1', '9', '菌类', 'create', '已添加', '12', '1');
INSERT INTO `xadmin_log` VALUES ('81', '2018-01-14 21:51:25.626835', '127.0.0.1', '9', '菌类', 'change', '修改 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('82', '2018-01-14 21:51:30.929861', '127.0.0.1', '3', '锅具', 'change', '修改 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('83', '2018-01-14 21:52:06.578758', '127.0.0.1', '6', '火锅底料+蘸料', 'change', '修改 name', '12', '1');
INSERT INTO `xadmin_log` VALUES ('84', '2018-01-14 21:55:36.769015', '127.0.0.1', '9', '海鲜', 'change', '修改 name', '12', '1');
INSERT INTO `xadmin_log` VALUES ('85', '2018-01-14 21:55:48.531058', '127.0.0.1', '8', '灵魂', 'change', '修改 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('86', '2018-01-14 21:55:54.820822', '127.0.0.1', '7', '酒水饮料', 'change', '修改 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('87', '2018-01-14 21:56:02.029129', '127.0.0.1', '6', '火锅底料+蘸料', 'change', '修改 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('88', '2018-01-14 21:56:11.422373', '127.0.0.1', '9', '海鲜', 'change', '修改 code', '12', '1');
INSERT INTO `xadmin_log` VALUES ('89', '2018-01-14 21:57:35.261877', '127.0.0.1', '3', '雪花牛肉', 'change', '修改 category', '11', '1');
INSERT INTO `xadmin_log` VALUES ('90', '2018-01-15 15:42:01.167434', '127.0.0.1', '6', '精品牛羊双排', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('91', '2018-01-15 15:42:54.015825', '127.0.0.1', '7', '麻辣牛肉火锅', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('92', '2018-01-15 15:43:35.632705', '127.0.0.1', '8', '手工面', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('93', '2018-01-15 15:44:23.373998', '127.0.0.1', '9', '香酥烧饼', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('94', '2018-01-15 15:45:03.225307', '127.0.0.1', '10', '方便面', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('95', '2018-01-15 15:45:49.574614', '127.0.0.1', '11', '内蒙牛羊肉', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('96', '2018-01-15 15:46:53.841148', '127.0.0.1', '12', '爽滑嫩牛肉', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('97', '2018-01-15 15:47:33.685799', '127.0.0.1', '13', '手切鲜羊肉', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('98', '2018-01-15 15:48:26.610328', '127.0.0.1', '14', '一级牛眼肉', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('99', '2018-01-15 15:49:09.887433', '127.0.0.1', '15', '雪花肥牛', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('100', '2018-01-15 15:49:57.595011', '127.0.0.1', '16', '红薯片', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('101', '2018-01-15 15:50:44.736882', '127.0.0.1', '17', '冬瓜', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('102', '2018-01-15 15:51:16.486927', '127.0.0.1', '18', '黑木耳', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('103', '2018-01-15 15:51:56.787788', '127.0.0.1', '19', '蒿子杆', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('104', '2018-01-15 15:52:34.704526', '127.0.0.1', '20', '圆生菜', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('105', '2018-01-15 15:53:08.678507', '127.0.0.1', '21', '油麦菜', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('106', '2018-01-15 15:53:48.848905', '127.0.0.1', '22', '土豆片', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('107', '2018-01-15 15:54:33.763406', '127.0.0.1', '23', '素菜拼盘', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('108', '2018-01-15 15:55:09.916057', '127.0.0.1', '24', '海带', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('109', '2018-01-15 15:56:03.444157', '127.0.0.1', '25', '金针菇', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('110', '2018-01-15 15:56:39.917204', '127.0.0.1', '26', '平菇', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('111', '2018-01-15 15:57:21.341375', '127.0.0.1', '27', '香菇', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('112', '2018-01-15 15:58:17.188487', '127.0.0.1', '28', '撒尿牛丸', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('113', '2018-01-15 15:58:55.263723', '127.0.0.1', '29', '蟹肉棒', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('114', '2018-01-15 16:00:25.125305', '127.0.0.1', '30', '秘制虾滑', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('115', '2018-01-15 16:01:00.592442', '127.0.0.1', '31', '鱼丸', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('116', '2018-01-15 16:02:22.092464', '127.0.0.1', '32', '陪伴聊天', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('117', '2018-01-15 16:03:15.767239', '127.0.0.1', '33', '随叫随到', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('118', '2018-01-15 16:52:28.409234', '127.0.0.1', '6', '六婆串串香火锅（六道口店）', 'create', '已添加', '27', '1');
INSERT INTO `xadmin_log` VALUES ('119', '2018-01-15 16:52:53.267563', '127.0.0.1', '7', '六婆串串香火锅（六道口店）', 'create', '已添加', '27', '1');
INSERT INTO `xadmin_log` VALUES ('120', '2018-01-15 16:53:13.017618', '127.0.0.1', '8', '六婆串串香火锅（六道口店）', 'create', '已添加', '27', '1');
INSERT INTO `xadmin_log` VALUES ('121', '2018-01-15 16:54:20.062428', '127.0.0.1', '34', '燕京纯生', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('122', '2018-01-15 16:54:57.684376', '127.0.0.1', '35', '燕京鲜啤', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('123', '2018-01-15 16:55:54.987883', '127.0.0.1', '4', '肉类', 'change', '修改 name', '12', '1');
INSERT INTO `xadmin_log` VALUES ('124', '2018-01-15 16:56:46.970758', '127.0.0.1', '36', '特色里脊', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('125', '2018-01-15 16:57:50.402803', '127.0.0.1', '9', '荤菜类', 'change', '修改 name', '12', '1');
INSERT INTO `xadmin_log` VALUES ('126', '2018-01-15 16:59:36.128692', '127.0.0.1', '37', '雪碧(厅)', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('127', '2018-01-15 17:00:48.161841', '127.0.0.1', '38', '鲜辣酱', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('128', '2018-01-15 17:01:42.485641', '127.0.0.1', '39', '甜不辣', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('129', '2018-01-15 17:03:03.627400', '127.0.0.1', '40', '鸳鸯锅(番茄+白锅)', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('130', '2018-01-15 17:03:41.660413', '127.0.0.1', '41', '秘制红锅', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('131', '2018-01-15 17:04:28.085669', '127.0.0.1', '42', '芝麻酱', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('132', '2018-01-15 17:05:21.907713', '127.0.0.1', '43', '土豆片', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('133', '2018-01-15 17:05:59.095513', '127.0.0.1', '44', '藕片', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('134', '2018-01-15 17:06:39.979160', '127.0.0.1', '45', '笋尖', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('135', '2018-01-15 17:07:24.256707', '127.0.0.1', '46', '金针菇', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('136', '2018-01-15 17:08:11.608469', '127.0.0.1', '47', '火锅方便面', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('137', '2018-01-15 17:08:43.434013', '127.0.0.1', '48', '火锅面条', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('138', '2018-01-15 17:09:27.084271', '127.0.0.1', '49', '可乐(厅)', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('139', '2018-01-15 17:10:16.817866', '127.0.0.1', '50', '内蒙古肥牛i', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('140', '2018-01-15 17:11:02.384065', '127.0.0.1', '51', '澳洲肥牛', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('141', '2018-01-15 17:11:45.200288', '127.0.0.1', '52', '进口羊羔钙', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('142', '2018-01-15 17:13:21.869365', '127.0.0.1', '36', '特色里脊', 'change', '修改 category', '11', '1');
INSERT INTO `xadmin_log` VALUES ('143', '2018-01-15 17:16:25.174810', '127.0.0.1', '53', '陪伴聊天', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('144', '2018-01-15 17:17:19.266653', '127.0.0.1', '54', '随叫随到', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('145', '2018-01-15 17:17:59.591524', '127.0.0.1', '55', '随叫随到', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('146', '2018-01-15 17:18:57.216848', '127.0.0.1', '56', '陪伴聊天', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('147', '2018-01-15 17:19:57.816513', '127.0.0.1', '57', '随叫随到', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('148', '2018-01-15 17:20:44.008082', '127.0.0.1', '58', '随叫随到', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('149', '2018-01-15 17:21:23.841676', '127.0.0.1', '59', '随叫随到', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('150', '2018-01-15 17:22:10.040959', '127.0.0.1', '60', '陪伴聊天', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('151', '2018-01-15 17:24:20.617065', '127.0.0.1', '61', '鸭血', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('152', '2018-01-15 17:25:05.695520', '127.0.0.1', '62', '鲜脑花', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('153', '2018-01-15 17:25:50.544440', '127.0.0.1', '63', '青虾', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('154', '2018-01-15 17:26:52.233030', '127.0.0.1', '39', '甜不辣', 'change', '修改 shop_price', '11', '1');
INSERT INTO `xadmin_log` VALUES ('155', '2018-01-15 17:27:42.485000', '127.0.0.1', '39', '甜不辣', 'change', '修改 shop_price 和 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('156', '2018-01-15 17:30:08.209891', '127.0.0.1', '64', '油麦菜', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('157', '2018-01-15 17:30:51.986780', '127.0.0.1', '65', '茼蒿菜', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('158', '2018-01-15 17:31:35.344910', '127.0.0.1', '66', '圆生菜', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('159', '2018-01-15 17:36:37.646267', '127.0.0.1', '67', '川味香油', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('160', '2018-01-15 17:37:26.519208', '127.0.0.1', '68', '香辣碟', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('161', '2018-01-15 17:38:24.252625', '127.0.0.1', '69', '鸳鸯锅(红锅+白锅)', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('162', '2018-01-15 17:39:37.805277', '127.0.0.1', '3', '锅具', 'change', '没有数据变化', '12', '1');
INSERT INTO `xadmin_log` VALUES ('163', '2018-01-15 17:43:08.831782', '127.0.0.1', '6', '蘸料', 'change', '修改 name', '12', '1');
INSERT INTO `xadmin_log` VALUES ('164', '2018-01-15 17:43:19.765638', '127.0.0.1', '3', '锅底', 'change', '修改 name', '12', '1');
INSERT INTO `xadmin_log` VALUES ('165', '2018-01-15 17:43:39.465070', '127.0.0.1', '69', '鸳鸯锅(红锅+白锅)', 'change', '修改 category', '11', '1');
INSERT INTO `xadmin_log` VALUES ('166', '2018-01-15 17:43:56.397170', '127.0.0.1', '41', '秘制红锅', 'change', '修改 category', '11', '1');
INSERT INTO `xadmin_log` VALUES ('167', '2018-01-15 17:44:08.973436', '127.0.0.1', '40', '鸳鸯锅(番茄+白锅)', 'change', '修改 category', '11', '1');
INSERT INTO `xadmin_log` VALUES ('168', '2018-01-15 17:44:36.563815', '127.0.0.1', '1', '菌汤锅底', 'change', '修改 category', '11', '1');
INSERT INTO `xadmin_log` VALUES ('169', '2018-01-15 17:44:49.298333', '127.0.0.1', '3', '特色锅底', 'change', '修改 name', '12', '1');
INSERT INTO `xadmin_log` VALUES ('170', '2018-01-15 17:44:59.894317', '127.0.0.1', '6', '独家蘸料', 'change', '修改 name', '12', '1');
INSERT INTO `xadmin_log` VALUES ('171', '2018-01-15 17:47:48.210130', '127.0.0.1', '70', '怡宝矿泉水', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('172', '2018-01-15 17:48:27.044561', '127.0.0.1', '71', '雪碧1.25L', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('173', '2018-01-15 17:49:13.193294', '127.0.0.1', '72', '品鉴45度', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('174', '2018-01-15 17:50:02.644065', '127.0.0.1', '73', '热狗肠', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('175', '2018-01-15 17:52:11.643686', '127.0.0.1', '74', '泡椒牛肉', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('176', '2018-01-15 17:52:49.310475', '127.0.0.1', '75', '香菜牛肉', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('177', '2018-01-15 17:53:33.134113', '127.0.0.1', '76', '霸王牛肉', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('178', '2018-01-15 17:54:21.383838', '127.0.0.1', '77', '开花肠', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('179', '2018-01-15 17:54:34.087411', '127.0.0.1', '76', '霸王牛肉', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('180', '2018-01-15 17:54:46.212539', '127.0.0.1', '75', '香菜牛肉', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('181', '2018-01-15 17:54:55.013272', '127.0.0.1', '74', '泡椒牛肉', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('182', '2018-01-15 17:55:47.037862', '127.0.0.1', '71', '雪碧1.25L', 'change', '修改 img', '11', '1');
INSERT INTO `xadmin_log` VALUES ('183', '2018-01-15 17:56:19.822076', '127.0.0.1', '39', '甜不辣', 'change', '修改 img', '11', '1');
INSERT INTO `xadmin_log` VALUES ('184', '2018-01-15 17:57:06.464059', '127.0.0.1', '37', '雪碧(厅)', 'change', '修改 img', '11', '1');
INSERT INTO `xadmin_log` VALUES ('185', '2018-01-15 17:58:25.609581', '127.0.0.1', '78', '豆腐', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('186', '2018-01-15 18:03:52.817196', '127.0.0.1', '79', '不插电小火锅', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('187', '2018-01-15 18:05:02.400379', '127.0.0.1', '80', '麻酱', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('188', '2018-01-15 18:06:11.675737', '127.0.0.1', '81', '辣油', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('189', '2018-01-15 18:09:48.398753', '127.0.0.1', '82', '菌类拼盘', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('190', '2018-01-15 18:11:00.934158', '127.0.0.1', '83', '香菜香葱', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('191', '2018-01-15 18:35:21.960399', '127.0.0.1', '84', '劲酒', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('192', '2018-01-15 18:36:00.309770', '127.0.0.1', '85', '白牛栏山', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('193', '2018-01-15 18:36:46.770353', '127.0.0.1', '86', '燕京啤酒', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('194', '2018-01-15 18:37:34.978114', '127.0.0.1', '87', '果粒橙', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('195', '2018-01-15 18:38:15.416966', '127.0.0.1', '88', '绿牛栏山', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('196', '2018-01-15 18:38:56.886498', '127.0.0.1', '89', '椰汁', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('197', '2018-01-15 18:39:39.378105', '127.0.0.1', '90', '手工面', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('198', '2018-01-15 18:40:18.036182', '127.0.0.1', '91', '米饭', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('199', '2018-01-15 18:40:51.798763', '127.0.0.1', '92', '烧饼', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('200', '2018-01-15 18:41:53.611077', '127.0.0.1', '93', '三鲜锅', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('201', '2018-01-15 18:42:32.302961', '127.0.0.1', '94', '番茄鸳鸯锅', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('202', '2018-01-15 18:43:05.586308', '127.0.0.1', '95', '酸菜鸳鸯锅', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('203', '2018-01-15 18:43:40.240470', '127.0.0.1', '96', '菌汤锅', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('204', '2018-01-15 18:44:13.245184', '127.0.0.1', '97', '牛油麻辣锅', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('205', '2018-01-15 18:44:59.275646', '127.0.0.1', '3', '特色锅底/锅具', 'change', '修改 name', '12', '1');
INSERT INTO `xadmin_log` VALUES ('206', '2018-01-15 18:46:05.471377', '127.0.0.1', '98', '鸳鸯锅具', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('207', '2018-01-15 18:46:54.629077', '127.0.0.1', '99', '不锈钢锅具', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('208', '2018-01-15 18:48:01.570004', '127.0.0.1', '100', '专用小火锅+燃油罐一套', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('209', '2018-01-15 18:48:50.582291', '127.0.0.1', '101', '香辣酱', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('210', '2018-01-15 18:49:36.164680', '127.0.0.1', '102', '味碟', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('211', '2018-01-15 18:50:32.242264', '127.0.0.1', '103', '麻酱', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('212', '2018-01-15 18:51:33.999906', '127.0.0.1', '104', '撒尿牛丸', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('213', '2018-01-15 18:52:09.833029', '127.0.0.1', '105', '包心鱼丸', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('214', '2018-01-15 18:52:59.470623', '127.0.0.1', '106', '秘制虾滑', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('215', '2018-01-15 18:53:25.818756', '127.0.0.1', '105', '包心鱼丸', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('216', '2018-01-15 18:54:24.683907', '127.0.0.1', '107', '秘制鱼滑', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('217', '2018-01-15 18:55:04.141874', '127.0.0.1', '108', '冻豆腐', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('218', '2018-01-15 18:56:09.684037', '127.0.0.1', '109', '白萝卜', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('219', '2018-01-15 18:56:48.342431', '127.0.0.1', '110', '菇类大拼盘', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('220', '2018-01-15 18:57:25.074913', '127.0.0.1', '111', '素菜拼盘', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('221', '2018-01-15 18:58:52.482820', '127.0.0.1', '112', '红薯', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('222', '2018-01-15 18:59:34.924551', '127.0.0.1', '113', '香菜', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('223', '2018-01-15 19:00:10.300913', '127.0.0.1', '114', '冬瓜', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('224', '2018-01-15 19:01:07.166440', '127.0.0.1', '115', '羊上脑', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('225', '2018-01-15 19:01:49.331429', '127.0.0.1', '116', '内蒙古羔羊肉', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('226', '2018-01-15 19:02:38.059969', '127.0.0.1', '117', '牛羊双排', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('227', '2018-01-15 19:03:34.427477', '127.0.0.1', '118', '高钙羊肉', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('228', '2018-01-15 19:04:19.924668', '127.0.0.1', '119', '爽滑嫩牛肉', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('229', '2018-01-15 19:05:11.550049', '127.0.0.1', '120', '刺猬鸭胗花', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('230', '2018-01-15 19:05:51.224202', '127.0.0.1', '121', '菠菜', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('231', '2018-01-15 19:59:42.231821', '127.0.0.1', '121', '菠菜', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('232', '2018-01-15 20:00:23.966770', '127.0.0.1', '120', '刺猬鸭胗花', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('233', '2018-01-15 20:00:32.288726', '127.0.0.1', '119', '爽滑嫩牛肉', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('234', '2018-01-15 20:00:40.553647', '127.0.0.1', '118', '高钙羊肉', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('235', '2018-01-15 20:01:09.420018', '127.0.0.1', '105', '包心鱼丸', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('236', '2018-01-15 20:01:21.126063', '127.0.0.1', '112', '红薯', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('237', '2018-01-15 20:01:31.205123', '127.0.0.1', '114', '冬瓜', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('238', '2018-01-15 20:01:37.356384', '127.0.0.1', '113', '香菜', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('239', '2018-01-15 20:01:43.626831', '127.0.0.1', '115', '羊上脑', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('240', '2018-01-15 20:01:49.459887', '127.0.0.1', '117', '牛羊双排', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('241', '2018-01-15 20:01:55.454491', '127.0.0.1', '116', '内蒙古羔羊肉', 'change', '没有数据变化', '11', '1');
INSERT INTO `xadmin_log` VALUES ('242', '2018-01-15 20:02:02.672141', '127.0.0.1', '109', '白萝卜', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('243', '2018-01-15 20:02:12.409627', '127.0.0.1', '108', '冻豆腐', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('244', '2018-01-15 20:02:21.110473', '127.0.0.1', '104', '撒尿牛丸', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('245', '2018-01-15 20:02:37.292873', '127.0.0.1', '92', '烧饼', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('246', '2018-01-15 20:02:45.860073', '127.0.0.1', '91', '米饭', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('247', '2018-01-15 20:03:27.466890', '127.0.0.1', '45', '笋尖', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('248', '2018-01-15 20:03:44.669769', '127.0.0.1', '43', '土豆片', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('249', '2018-01-15 20:03:58.078755', '127.0.0.1', '42', '芝麻酱', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('250', '2018-01-15 20:04:11.138454', '127.0.0.1', '46', '金针菇', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('251', '2018-01-15 20:04:24.754764', '127.0.0.1', '24', '海带', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('252', '2018-01-15 20:04:36.028840', '127.0.0.1', '13', '手切鲜羊肉', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('253', '2018-01-15 20:04:48.179530', '127.0.0.1', '21', '油麦菜', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('254', '2018-01-15 20:04:58.309541', '127.0.0.1', '20', '圆生菜', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('255', '2018-01-15 20:05:09.172805', '127.0.0.1', '19', '蒿子杆', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('256', '2018-01-15 20:05:18.208836', '127.0.0.1', '17', '冬瓜', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('257', '2018-01-15 20:05:31.846591', '127.0.0.1', '16', '红薯片', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('258', '2018-01-15 20:06:00.261683', '127.0.0.1', '12', '爽滑嫩牛肉', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('259', '2018-01-15 20:06:10.470210', '127.0.0.1', '14', '一级牛眼肉', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('260', '2018-01-15 20:06:21.729262', '127.0.0.1', '15', '雪花肥牛', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('261', '2018-01-15 20:06:31.506362', '127.0.0.1', '10', '方便面', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('262', '2018-01-15 20:06:56.128522', '127.0.0.1', '70', '怡宝矿泉水', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('263', '2018-01-15 20:07:29.016523', '127.0.0.1', '28', '撒尿牛丸', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('264', '2018-01-15 20:07:49.101400', '127.0.0.1', '27', '香菇', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('265', '2018-01-15 20:08:03.709091', '127.0.0.1', '26', '平菇', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('266', '2018-01-15 20:08:22.293670', '127.0.0.1', '25', '金针菇', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('267', '2018-01-15 20:08:36.038334', '127.0.0.1', '23', '素菜拼盘', 'change', '修改 desc', '11', '1');
INSERT INTO `xadmin_log` VALUES ('268', '2018-01-15 20:08:54.287419', '127.0.0.1', '22', '土豆片', 'change', '没有数据变化', '11', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
