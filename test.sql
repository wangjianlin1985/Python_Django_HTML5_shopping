/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2019-02-01 13:50:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
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
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 用户', '6', 'add_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 用户', '6', 'change_user');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 用户', '6', 'delete_user');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 广告', '7', 'add_ad');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 广告', '7', 'change_ad');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 广告', '7', 'delete_ad');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 分类', '8', 'add_category');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 分类', '8', 'change_category');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 分类', '8', 'delete_category');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 品牌', '9', 'add_brand');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 品牌', '9', 'change_brand');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 品牌', '9', 'delete_brand');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 尺寸', '10', 'add_size');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 尺寸', '10', 'change_size');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 尺寸', '10', 'delete_size');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 标签', '11', 'add_tag');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 标签', '11', 'change_tag');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 标签', '11', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 商品', '12', 'add_furniture');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 商品', '12', 'change_furniture');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 商品', '12', 'delete_furniture');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 购物车条目', '13', 'add_caritem');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 购物车条目', '13', 'change_caritem');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 购物车条目', '13', 'delete_caritem');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 订单', '14', 'add_order');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 订单', '14', 'change_order');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 订单', '14', 'delete_order');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 订单条目', '15', 'add_order_list');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 订单条目', '15', 'change_order_list');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 订单条目', '15', 'delete_order_list');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_b4a38c66` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-05-06 01:41:04', '1', '6', '2', 'jack', '1', '');
INSERT INTO `django_admin_log` VALUES ('2', '2017-05-06 01:41:55', '1', '9', '1', '林氏木业', '1', '');
INSERT INTO `django_admin_log` VALUES ('3', '2017-05-06 01:42:15', '1', '9', '1', 'QuanU/全友', '2', '已修改 name 和 index 。');
INSERT INTO `django_admin_log` VALUES ('4', '2017-05-06 01:42:26', '1', '9', '2', '#0工厂', '1', '');
INSERT INTO `django_admin_log` VALUES ('5', '2017-05-06 01:42:36', '1', '9', '3', '奢家', '1', '');
INSERT INTO `django_admin_log` VALUES ('6', '2017-05-06 01:42:46', '1', '9', '4', '优轩木', '1', '');
INSERT INTO `django_admin_log` VALUES ('7', '2017-05-06 01:42:52', '1', '9', '5', '唐诗', '1', '');
INSERT INTO `django_admin_log` VALUES ('8', '2017-05-06 01:42:59', '1', '9', '6', '心居名家', '1', '');
INSERT INTO `django_admin_log` VALUES ('9', '2017-05-06 01:43:11', '1', '9', '7', '宜家', '1', '');
INSERT INTO `django_admin_log` VALUES ('10', '2017-05-06 01:43:23', '1', '9', '8', '慕比', '1', '');
INSERT INTO `django_admin_log` VALUES ('11', '2017-05-06 01:43:32', '1', '9', '9', '广兰', '1', '');
INSERT INTO `django_admin_log` VALUES ('12', '2017-05-06 01:43:39', '1', '9', '10', '美锦', '1', '');
INSERT INTO `django_admin_log` VALUES ('13', '2017-05-06 01:43:49', '1', '9', '11', '星之居', '1', '');
INSERT INTO `django_admin_log` VALUES ('14', '2017-05-06 01:45:30', '1', '8', '1', '布艺沙发---客厅', '1', '');
INSERT INTO `django_admin_log` VALUES ('15', '2017-05-06 01:45:54', '1', '8', '2', '实木沙发---客厅', '1', '');
INSERT INTO `django_admin_log` VALUES ('16', '2017-05-06 01:46:04', '1', '8', '3', '皮沙发---客厅', '1', '');
INSERT INTO `django_admin_log` VALUES ('17', '2017-05-06 01:46:16', '1', '8', '4', '电视柜---客厅', '1', '');
INSERT INTO `django_admin_log` VALUES ('18', '2017-05-06 01:46:28', '1', '8', '5', '茶几---客厅', '1', '');
INSERT INTO `django_admin_log` VALUES ('19', '2017-05-06 01:47:01', '1', '8', '6', '鞋柜---客厅', '1', '');
INSERT INTO `django_admin_log` VALUES ('20', '2017-05-06 01:47:17', '1', '8', '7', '实木床---卧室', '1', '');
INSERT INTO `django_admin_log` VALUES ('21', '2017-05-06 01:47:27', '1', '8', '8', '布艺床---卧室', '1', '');
INSERT INTO `django_admin_log` VALUES ('22', '2017-05-06 01:47:38', '1', '8', '9', '皮床---卧室', '1', '');
INSERT INTO `django_admin_log` VALUES ('23', '2017-05-06 01:48:13', '1', '8', '10', '床垫---卧室', '1', '');
INSERT INTO `django_admin_log` VALUES ('24', '2017-05-06 01:48:28', '1', '8', '11', '衣柜---卧室', '1', '');
INSERT INTO `django_admin_log` VALUES ('25', '2017-05-06 01:48:51', '1', '8', '12', '餐桌---餐厅/书房', '1', '');
INSERT INTO `django_admin_log` VALUES ('26', '2017-05-06 01:49:05', '1', '8', '13', '餐边柜---餐厅/书房', '1', '');
INSERT INTO `django_admin_log` VALUES ('27', '2017-05-06 01:49:21', '1', '8', '14', '书桌---餐厅/书房', '1', '');
INSERT INTO `django_admin_log` VALUES ('28', '2017-05-06 01:49:33', '1', '8', '15', '书柜---餐厅/书房', '1', '');
INSERT INTO `django_admin_log` VALUES ('29', '2017-05-06 01:50:16', '1', '8', '16', '卧室成套---成套', '1', '');
INSERT INTO `django_admin_log` VALUES ('30', '2017-05-06 01:50:35', '1', '8', '17', '客厅成套---成套', '1', '');
INSERT INTO `django_admin_log` VALUES ('31', '2017-05-06 01:50:49', '1', '8', '18', '餐厅成套---成套', '1', '');
INSERT INTO `django_admin_log` VALUES ('32', '2017-05-06 01:52:59', '1', '10', '1', '1800*2000', '1', '');
INSERT INTO `django_admin_log` VALUES ('33', '2017-05-06 01:53:09', '1', '10', '2', '1500*2000', '1', '');
INSERT INTO `django_admin_log` VALUES ('34', '2017-05-06 01:53:22', '1', '10', '3', '单人位', '1', '');
INSERT INTO `django_admin_log` VALUES ('35', '2017-05-06 01:53:30', '1', '10', '4', '双人位', '1', '');
INSERT INTO `django_admin_log` VALUES ('36', '2017-05-06 01:53:42', '1', '10', '5', '三人位', '1', '');
INSERT INTO `django_admin_log` VALUES ('37', '2017-05-06 01:53:53', '1', '10', '6', '1+2+3+茶几', '1', '');
INSERT INTO `django_admin_log` VALUES ('38', '2017-05-06 01:54:03', '1', '10', '7', '1400*800', '1', '');
INSERT INTO `django_admin_log` VALUES ('39', '2017-05-06 01:54:17', '1', '10', '8', '默认', '1', '');
INSERT INTO `django_admin_log` VALUES ('40', '2017-05-06 01:55:19', '1', '11', '1', '简约', '1', '');
INSERT INTO `django_admin_log` VALUES ('41', '2017-05-06 01:55:30', '1', '11', '2', '美式', '1', '');
INSERT INTO `django_admin_log` VALUES ('42', '2017-05-06 01:55:41', '1', '11', '3', '欧式', '1', '');
INSERT INTO `django_admin_log` VALUES ('43', '2017-05-06 01:55:51', '1', '11', '4', '中式', '1', '');
INSERT INTO `django_admin_log` VALUES ('44', '2017-05-06 01:55:59', '1', '11', '5', '地中海', '1', '');
INSERT INTO `django_admin_log` VALUES ('45', '2017-05-06 01:56:06', '1', '11', '6', '北欧', '1', '');
INSERT INTO `django_admin_log` VALUES ('46', '2017-05-06 02:01:29', '1', '9', '12', '林氏木业', '1', '');
INSERT INTO `django_admin_log` VALUES ('47', '2017-05-06 02:04:01', '1', '12', '1', '林氏木业 实木床', '1', '');
INSERT INTO `django_admin_log` VALUES ('48', '2017-05-06 02:06:12', '1', '12', '2', '奢家 实木床', '1', '');
INSERT INTO `django_admin_log` VALUES ('49', '2017-05-06 02:08:45', '1', '12', '3', '宜家 餐桌', '1', '');
INSERT INTO `django_admin_log` VALUES ('50', '2017-05-06 02:11:38', '1', '12', '4', '唐诗 布艺沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('51', '2017-05-06 02:14:34', '1', '12', '5', '林氏木业 实木床', '1', '');
INSERT INTO `django_admin_log` VALUES ('52', '2017-05-06 02:16:54', '1', '12', '6', '心居名家 皮沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('53', '2017-05-06 02:18:32', '1', '12', '7', '慕比 书柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('54', '2017-05-06 02:20:22', '1', '12', '8', '广兰 布艺沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('55', '2017-05-06 02:21:59', '1', '12', '9', '林氏木业 餐桌', '1', '');
INSERT INTO `django_admin_log` VALUES ('56', '2017-05-06 02:24:25', '1', '12', '10', '奢家 卧室成套', '1', '');
INSERT INTO `django_admin_log` VALUES ('57', '2017-05-06 02:26:03', '1', '12', '11', '广兰 客厅成套', '1', '');
INSERT INTO `django_admin_log` VALUES ('58', '2017-05-06 02:27:30', '1', '12', '12', '宜家 餐桌', '1', '');
INSERT INTO `django_admin_log` VALUES ('59', '2017-05-07 13:05:46', '1', '12', '13', '奢家 实木床', '1', '');
INSERT INTO `django_admin_log` VALUES ('60', '2017-05-07 13:09:19', '1', '12', '14', '奢家 餐边柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('61', '2017-05-07 13:14:00', '1', '12', '15', '星之居 实木沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('62', '2017-05-07 13:18:18', '1', '12', '16', '优轩木 餐边柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('63', '2017-05-07 13:20:07', '1', '8', '19', '餐椅---餐厅/书房', '1', '');
INSERT INTO `django_admin_log` VALUES ('64', '2017-05-07 13:22:28', '1', '12', '17', '宜家 餐椅', '1', '');
INSERT INTO `django_admin_log` VALUES ('65', '2017-05-07 13:25:45', '1', '12', '18', '林氏木业 餐桌', '1', '');
INSERT INTO `django_admin_log` VALUES ('66', '2017-05-07 13:31:07', '1', '12', '19', '心居名家 茶几', '1', '');
INSERT INTO `django_admin_log` VALUES ('67', '2017-05-07 13:35:38', '1', '12', '20', '广兰 茶几', '1', '');
INSERT INTO `django_admin_log` VALUES ('68', '2017-05-07 13:41:21', '1', '12', '21', '慕比 餐桌', '1', '');
INSERT INTO `django_admin_log` VALUES ('69', '2017-05-07 13:44:40', '1', '12', '22', '美锦 布艺沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('70', '2017-05-07 14:18:27', '1', '12', '23', '慕比 实木床', '1', '');
INSERT INTO `django_admin_log` VALUES ('71', '2017-05-07 14:21:16', '1', '12', '24', '心居名家 布艺沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('72', '2017-05-07 14:25:23', '1', '12', '25', '心居名家 书柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('73', '2017-05-07 14:29:20', '1', '12', '26', '广兰 衣柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('74', '2017-05-07 14:32:16', '1', '12', '27', '宜家 餐椅', '1', '');
INSERT INTO `django_admin_log` VALUES ('75', '2017-05-07 14:34:52', '1', '12', '28', '宜家 布艺床', '1', '');
INSERT INTO `django_admin_log` VALUES ('76', '2017-05-07 14:37:40', '1', '12', '29', '心居名家 茶几', '1', '');
INSERT INTO `django_admin_log` VALUES ('77', '2017-05-07 14:41:04', '1', '12', '30', '宜家 茶几', '1', '');
INSERT INTO `django_admin_log` VALUES ('78', '2017-05-07 14:45:20', '1', '12', '3', '宜家 餐桌', '2', '已修改 name 。');
INSERT INTO `django_admin_log` VALUES ('79', '2017-05-08 03:07:53', '1', '7', '1', '欧美家具特惠购', '1', '');
INSERT INTO `django_admin_log` VALUES ('80', '2017-05-08 03:08:29', '1', '7', '2', '居家每日一品', '1', '');
INSERT INTO `django_admin_log` VALUES ('81', '2017-05-08 03:09:08', '1', '7', '3', 'A家爆款直降', '1', '');
INSERT INTO `django_admin_log` VALUES ('82', '2017-05-08 03:09:35', '1', '7', '4', '左右沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('83', '2017-05-30 01:02:39', '1', '12', '31', '慕比 书柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('84', '2017-05-30 01:39:51', '1', '12', '31', '慕比 书柜', '3', '');
INSERT INTO `django_admin_log` VALUES ('85', '2017-05-28 08:25:54', '1', '12', '32', '广兰 布艺沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('86', '2017-05-28 08:28:52', '1', '12', '33', '心居名家 布艺沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('87', '2017-05-28 08:32:01', '1', '12', '34', '#0工厂 布艺沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('88', '2017-05-28 08:34:53', '1', '12', '35', '唐诗 实木沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('89', '2017-05-28 08:38:08', '1', '12', '36', '美锦 实木沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('90', '2017-05-28 08:44:03', '1', '12', '37', '心居名家 皮沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('91', '2017-05-28 08:47:07', '1', '12', '38', '心居名家 皮沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('92', '2017-05-28 08:50:02', '1', '12', '39', '星之居 皮沙发', '1', '');
INSERT INTO `django_admin_log` VALUES ('93', '2017-05-28 08:52:59', '1', '12', '40', '星之居 电视柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('94', '2017-05-28 09:01:19', '1', '12', '41', '宜家 电视柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('95', '2017-05-28 09:04:18', '1', '12', '42', '奢家 电视柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('96', '2017-05-28 09:08:12', '1', '12', '43', '宜家 鞋柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('97', '2017-05-28 09:11:32', '1', '12', '44', 'QuanU/全友 鞋柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('98', '2017-05-28 09:14:41', '1', '12', '45', 'QuanU/全友 布艺床', '1', '');
INSERT INTO `django_admin_log` VALUES ('99', '2017-05-28 09:17:01', '1', '12', '46', '#0工厂 布艺床', '1', '');
INSERT INTO `django_admin_log` VALUES ('100', '2017-05-28 09:19:57', '1', '12', '47', '宜家 布艺床', '1', '');
INSERT INTO `django_admin_log` VALUES ('101', '2017-05-28 09:22:56', '1', '12', '48', 'QuanU/全友 皮床', '1', '');
INSERT INTO `django_admin_log` VALUES ('102', '2017-05-28 09:25:46', '1', '12', '49', '#0工厂 皮床', '1', '');
INSERT INTO `django_admin_log` VALUES ('103', '2017-05-28 09:28:12', '1', '12', '50', '星之居 床垫', '1', '');
INSERT INTO `django_admin_log` VALUES ('104', '2017-05-28 09:30:30', '1', '12', '51', '唐诗 床垫', '1', '');
INSERT INTO `django_admin_log` VALUES ('105', '2017-05-28 09:32:49', '1', '12', '52', '心居名家 床垫', '1', '');
INSERT INTO `django_admin_log` VALUES ('106', '2017-05-28 10:39:42', '1', '12', '53', '奢家 衣柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('107', '2017-05-28 10:42:05', '1', '12', '54', '心居名家 衣柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('108', '2017-05-28 10:44:59', '1', '12', '55', '心居名家 衣柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('109', '2017-05-28 10:47:50', '1', '12', '56', '唐诗 衣柜', '1', '');
INSERT INTO `django_admin_log` VALUES ('110', '2017-05-28 10:51:19', '1', '12', '57', '奢家 卧室成套', '1', '');
INSERT INTO `django_admin_log` VALUES ('111', '2017-05-28 10:54:00', '1', '12', '58', '唐诗 卧室成套', '1', '');
INSERT INTO `django_admin_log` VALUES ('112', '2017-05-28 10:57:23', '1', '12', '59', 'QuanU/全友 客厅成套', '1', '');
INSERT INTO `django_admin_log` VALUES ('113', '2017-05-28 11:00:32', '1', '12', '60', 'QuanU/全友 客厅成套', '1', '');
INSERT INTO `django_admin_log` VALUES ('114', '2017-05-28 11:03:36', '1', '12', '61', '慕比 餐椅', '1', '');
INSERT INTO `django_admin_log` VALUES ('115', '2017-05-28 11:10:12', '1', '12', '62', '心居名家 餐厅成套', '1', '');
INSERT INTO `django_admin_log` VALUES ('116', '2017-05-28 11:14:20', '1', '12', '63', '广兰 书桌', '1', '');
INSERT INTO `django_admin_log` VALUES ('117', '2019-02-01 05:43:14', '1', '14', '69', '69', '2', '已修改 order_state 。');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'log entry', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'permission', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'group', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'content type', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'session', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', '用户', 'myApp', 'user');
INSERT INTO `django_content_type` VALUES ('7', '广告', 'myApp', 'ad');
INSERT INTO `django_content_type` VALUES ('8', '分类', 'myApp', 'category');
INSERT INTO `django_content_type` VALUES ('9', '品牌', 'myApp', 'brand');
INSERT INTO `django_content_type` VALUES ('10', '尺寸', 'myApp', 'size');
INSERT INTO `django_content_type` VALUES ('11', '标签', 'myApp', 'tag');
INSERT INTO `django_content_type` VALUES ('12', '商品', 'myApp', 'furniture');
INSERT INTO `django_content_type` VALUES ('13', '购物车条目', 'myApp', 'caritem');
INSERT INTO `django_content_type` VALUES ('14', '订单', 'myApp', 'order');
INSERT INTO `django_content_type` VALUES ('15', '订单条目', 'myApp', 'order_list');
INSERT INTO `django_content_type` VALUES ('16', '评价', 'myApp', 'comment');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1dqv2ogtpkj0clq417nadl0q3rsm5kij', 'OTEzMTQ5MjIxNGUzN2FlYjQ0N2I3NGExNzczYjdkMzkxNTFkMWE0YTqABJUDAAAAAAAAAH2ULg==', '2017-06-13 01:41:12');
INSERT INTO `django_session` VALUES ('3v0ar0z5mcv3jdad8uf83htxznz70qc0', 'OTEzMTQ5MjIxNGUzN2FlYjQ0N2I3NGExNzczYjdkMzkxNTFkMWE0YTqABJUDAAAAAAAAAH2ULg==', '2017-06-13 03:54:35');
INSERT INTO `django_session` VALUES ('91gx3wqgdpwwvhfxzd89mhkou67z1387', 'MWZjZjJhODY2MGMxMWFhODRkMzNmYzVhYjJmOGU2Yjg3NmU1YjQ1OTqABJVYAAAAAAAAAH2UKIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUjA1fYXV0aF91c2VyX2lklEsBdS4=', '2017-06-13 07:02:35');
INSERT INTO `django_session` VALUES ('blw3ffwgwfxkp2930l0waug9mlem7a05', 'OTEzMTQ5MjIxNGUzN2FlYjQ0N2I3NGExNzczYjdkMzkxNTFkMWE0YTqABJUDAAAAAAAAAH2ULg==', '2017-06-13 03:54:36');
INSERT INTO `django_session` VALUES ('gk5ujn25u3j57p41lgcu2p1vmy5re1uz', 'OTEzMTQ5MjIxNGUzN2FlYjQ0N2I3NGExNzczYjdkMzkxNTFkMWE0YTqABJUDAAAAAAAAAH2ULg==', '2017-05-25 07:47:22');
INSERT INTO `django_session` VALUES ('k0k3uz1q6z9dqwqk3dfk5p0g54etbunj', 'OTEzMTQ5MjIxNGUzN2FlYjQ0N2I3NGExNzczYjdkMzkxNTFkMWE0YTqABJUDAAAAAAAAAH2ULg==', '2017-06-13 01:41:49');
INSERT INTO `django_session` VALUES ('kp31l4alj6jbfpicrnz2nfeizfyc8l46', 'OTEzMTQ5MjIxNGUzN2FlYjQ0N2I3NGExNzczYjdkMzkxNTFkMWE0YTqABJUDAAAAAAAAAH2ULg==', '2017-05-23 02:55:01');
INSERT INTO `django_session` VALUES ('pycioywkl6cr9lr77rtf5al60cb8t3l4', 'OTEzMTQ5MjIxNGUzN2FlYjQ0N2I3NGExNzczYjdkMzkxNTFkMWE0YTqABJUDAAAAAAAAAH2ULg==', '2017-06-13 01:43:32');
INSERT INTO `django_session` VALUES ('rh70v8g6arhcz1ns3b8i3aw0jp6duurq', 'ZTlhNTgwODM4ODkwYjU5OTYxZTVlMGRkYzY3YzhjMTlhOWQyYzJiOTqABJWXAAAAAAAAAH2UKIwNX2F1dGhfdXNlcl9pZJSMATGUjBJfYXV0aF91c2VyX2JhY2tlbmSUjClkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZJSMD19hdXRoX3VzZXJfaGFzaJSMKDZhZjExYmM1YzA3MzM1ZjRiZmUyZTQ5NzVjZjgwMDdhZGUwMWFhOTGUdS4=', '2019-02-15 05:46:04');
INSERT INTO `django_session` VALUES ('uuf7hnvjefsiaf2xa0k8cqgkvd1mu460', 'OTEzMTQ5MjIxNGUzN2FlYjQ0N2I3NGExNzczYjdkMzkxNTFkMWE0YTqABJUDAAAAAAAAAH2ULg==', '2017-05-25 07:47:21');
INSERT INTO `django_session` VALUES ('x6qf4qdx46kbcs9yaf6gs3hkzedutee7', 'OTEzMTQ5MjIxNGUzN2FlYjQ0N2I3NGExNzczYjdkMzkxNTFkMWE0YTqABJUDAAAAAAAAAH2ULg==', '2017-06-13 03:54:35');
INSERT INTO `django_session` VALUES ('zu29qd5v3ep46mq00c8545yb0nluvyll', 'OTEzMTQ5MjIxNGUzN2FlYjQ0N2I3NGExNzczYjdkMzkxNTFkMWE0YTqABJUDAAAAAAAAAH2ULg==', '2017-06-13 01:40:58');

-- ----------------------------
-- Table structure for `myapp_ad`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_ad`;
CREATE TABLE `myapp_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `date_publish` datetime NOT NULL,
  `index` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_ad
-- ----------------------------
INSERT INTO `myapp_ad` VALUES ('1', '欧美家具特惠购', 'ad/2017/05/ad1.jpg', '2017-05-08 03:07:53', '1');
INSERT INTO `myapp_ad` VALUES ('2', '居家每日一品', 'ad/2017/05/ad2.jpg', '2017-05-08 03:08:29', '2');
INSERT INTO `myapp_ad` VALUES ('3', 'A家爆款直降', 'ad/2017/05/ad3.jpg', '2017-05-08 03:09:08', '3');
INSERT INTO `myapp_ad` VALUES ('4', '左右沙发', 'ad/2017/05/ad4.jpg', '2017-05-08 03:09:35', '4');

-- ----------------------------
-- Table structure for `myapp_brand`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_brand`;
CREATE TABLE `myapp_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `index` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_brand
-- ----------------------------
INSERT INTO `myapp_brand` VALUES ('1', 'QuanU/全友', '2');
INSERT INTO `myapp_brand` VALUES ('2', '#0工厂', '3');
INSERT INTO `myapp_brand` VALUES ('3', '奢家', '4');
INSERT INTO `myapp_brand` VALUES ('4', '优轩木', '5');
INSERT INTO `myapp_brand` VALUES ('5', '唐诗', '6');
INSERT INTO `myapp_brand` VALUES ('6', '心居名家', '7');
INSERT INTO `myapp_brand` VALUES ('7', '宜家', '8');
INSERT INTO `myapp_brand` VALUES ('8', '慕比', '9');
INSERT INTO `myapp_brand` VALUES ('9', '广兰', '10');
INSERT INTO `myapp_brand` VALUES ('10', '美锦', '11');
INSERT INTO `myapp_brand` VALUES ('11', '星之居', '12');
INSERT INTO `myapp_brand` VALUES ('12', '林氏木业', '1');

-- ----------------------------
-- Table structure for `myapp_caritem`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_caritem`;
CREATE TABLE `myapp_caritem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `furniture_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sum_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myApp_caritem_05beb0c3` (`furniture_id`),
  CONSTRAINT `furniture_id_refs_id_135b738e` FOREIGN KEY (`furniture_id`) REFERENCES `myapp_furniture` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_caritem
-- ----------------------------

-- ----------------------------
-- Table structure for `myapp_category`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_category`;
CREATE TABLE `myapp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typ` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `index` int(11) NOT NULL,
  `west_east` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_category
-- ----------------------------
INSERT INTO `myapp_category` VALUES ('1', '客厅', '布艺沙发', '1', '0');
INSERT INTO `myapp_category` VALUES ('2', '客厅', '实木沙发', '2', '0');
INSERT INTO `myapp_category` VALUES ('3', '客厅', '皮沙发', '3', '0');
INSERT INTO `myapp_category` VALUES ('4', '客厅', '电视柜', '4', '0');
INSERT INTO `myapp_category` VALUES ('5', '客厅', '茶几', '5', '0');
INSERT INTO `myapp_category` VALUES ('6', '客厅', '鞋柜', '6', '0');
INSERT INTO `myapp_category` VALUES ('7', '卧室', '实木床', '7', '0');
INSERT INTO `myapp_category` VALUES ('8', '卧室', '布艺床', '8', '0');
INSERT INTO `myapp_category` VALUES ('9', '卧室', '皮床', '9', '0');
INSERT INTO `myapp_category` VALUES ('10', '卧室', '床垫', '10', '0');
INSERT INTO `myapp_category` VALUES ('11', '卧室', '衣柜', '11', '0');
INSERT INTO `myapp_category` VALUES ('12', '餐厅/书房', '餐桌', '12', '1');
INSERT INTO `myapp_category` VALUES ('13', '餐厅/书房', '餐边柜', '13', '0');
INSERT INTO `myapp_category` VALUES ('14', '餐厅/书房', '书桌', '14', '0');
INSERT INTO `myapp_category` VALUES ('15', '餐厅/书房', '书柜', '15', '0');
INSERT INTO `myapp_category` VALUES ('16', '成套', '卧室成套', '16', '0');
INSERT INTO `myapp_category` VALUES ('17', '成套', '客厅成套', '17', '0');
INSERT INTO `myapp_category` VALUES ('18', '成套', '餐厅成套', '18', '0');
INSERT INTO `myapp_category` VALUES ('19', '餐厅/书房', '餐椅', '19', '0');

-- ----------------------------
-- Table structure for `myapp_comment`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_comment`;
CREATE TABLE `myapp_comment` (
  `comm` varchar(100) NOT NULL,
  `fur_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_comment
-- ----------------------------
INSERT INTO `myapp_comment` VALUES ('喜欢这个宝贝', '1', '44', '3', '10');
INSERT INTO `myapp_comment` VALUES ('不错啊', '2', '45', '3', '10');
INSERT INTO `myapp_comment` VALUES ('质量好的很！', '1', '46', '5', '11');
INSERT INTO `myapp_comment` VALUES ('可以收纳，很实用', '2', '47', '5', '11');
INSERT INTO `myapp_comment` VALUES ('家人都很喜欢', '2', '48', '5', '12');
INSERT INTO `myapp_comment` VALUES ('很喜欢', '2', '49', '4', '13');
INSERT INTO `myapp_comment` VALUES ('美观大方', '4', '50', '4', '13');
INSERT INTO `myapp_comment` VALUES ('原木的很贴心', '1', '51', '6', '14');
INSERT INTO `myapp_comment` VALUES ('贼喜欢，质量杠杠的', '2', '52', '6', '14');
INSERT INTO `myapp_comment` VALUES ('有了它，从此再也不怕失眠啦~\\(≧▽≦)/~啦啦啦', '5', '53', '6', '14');
INSERT INTO `myapp_comment` VALUES ('有了它，从此再也不怕睡沙发', '8', '54', '6', '15');
INSERT INTO `myapp_comment` VALUES ('原木纯品，你值得拥有！', '1', '55', '7', '16');
INSERT INTO `myapp_comment` VALUES ('收纳功能强悍', '2', '56', '7', '16');
INSERT INTO `myapp_comment` VALUES ('桌子椅子都很好，美观结实', '3', '57', '7', '16');
INSERT INTO `myapp_comment` VALUES ('非常喜欢', '1', '58', '8', '17');
INSERT INTO `myapp_comment` VALUES ('大气', '3', '59', '8', '17');
INSERT INTO `myapp_comment` VALUES ('喜欢喜欢！', '2', '60', '9', '18');
INSERT INTO `myapp_comment` VALUES ('好实用哦', '4', '61', '9', '18');
INSERT INTO `myapp_comment` VALUES ('真棒捏', '5', '62', '9', '19');
INSERT INTO `myapp_comment` VALUES ('喜欢', '1', '63', '3', '20');
INSERT INTO `myapp_comment` VALUES ('很实用', '2', '64', '3', '41');
INSERT INTO `myapp_comment` VALUES ('非常大气', '4', '65', '3', '41');
INSERT INTO `myapp_comment` VALUES ('坐上去很舒适', '8', '66', '3', '42');
INSERT INTO `myapp_comment` VALUES ('物美价廉！', '5', '67', '3', '43');
INSERT INTO `myapp_comment` VALUES ('很喜欢这个宝贝！', '4', '68', '4', '44');
INSERT INTO `myapp_comment` VALUES ('柔软舒适，很满意', '5', '69', '4', '44');
INSERT INTO `myapp_comment` VALUES ('是真皮', '6', '70', '5', '45');
INSERT INTO `myapp_comment` VALUES ('满意！', '5', '71', '5', '46');
INSERT INTO `myapp_comment` VALUES ('使用方便', '9', '72', '5', '47');
INSERT INTO `myapp_comment` VALUES ('这个床和我想象的一样好', '10', '73', '5', '48');
INSERT INTO `myapp_comment` VALUES ('不错', '26', '74', '5', '49');
INSERT INTO `myapp_comment` VALUES ('制作精美', '15', '75', '5', '49');
INSERT INTO `myapp_comment` VALUES ('很满意的一次购物\r\n', '3', '76', '5', '50');
INSERT INTO `myapp_comment` VALUES ('完美的书柜！', '7', '77', '4', '51');
INSERT INTO `myapp_comment` VALUES ('买到了梦想的床！', '13', '78', '4', '51');
INSERT INTO `myapp_comment` VALUES ('再大一点就更好了', '7', '79', '3', '52');
INSERT INTO `myapp_comment` VALUES ('很有质感！', '6', '80', '7', '53');
INSERT INTO `myapp_comment` VALUES ('舒适！', '8', '81', '7', '53');
INSERT INTO `myapp_comment` VALUES ('发货很快', '18', '82', '7', '54');
INSERT INTO `myapp_comment` VALUES ('很复古的柜子，喜欢', '14', '83', '8', '55');
INSERT INTO `myapp_comment` VALUES ('六件套，很实用', '10', '84', '8', '56');
INSERT INTO `myapp_comment` VALUES ('简约大方', '12', '85', '8', '56');
INSERT INTO `myapp_comment` VALUES ('质量很好啊', '20', '86', '8', '57');
INSERT INTO `myapp_comment` VALUES ('特别结实！', '9', '87', '8', '58');
INSERT INTO `myapp_comment` VALUES ('实木的，大家可以放心购买', '15', '88', '9', '59');
INSERT INTO `myapp_comment` VALUES ('看上去很有档次', '16', '89', '9', '59');
INSERT INTO `myapp_comment` VALUES ('蛮实用的', '10', '90', '9', '60');
INSERT INTO `myapp_comment` VALUES ('让我很惊喜，质量非常好', '13', '91', '9', '61');
INSERT INTO `myapp_comment` VALUES ('很结实的桌子', '9', '92', '9', '61');
INSERT INTO `myapp_comment` VALUES ('全家人都特别喜欢这个书柜', '7', '93', '6', '40');
INSERT INTO `myapp_comment` VALUES ('非常好的餐桌', '4', '94', '6', '39');
INSERT INTO `myapp_comment` VALUES ('既美观，又很实用', '2', '95', '6', '38');
INSERT INTO `myapp_comment` VALUES ('看起来很豪华', '15', '96', '6', '62');
INSERT INTO `myapp_comment` VALUES ('很小清新的家具！', '17', '97', '6', '63');
INSERT INTO `myapp_comment` VALUES ('一分价钱一分货，很好', '11', '98', '6', '64');
INSERT INTO `myapp_comment` VALUES ('很简单的桌子，但十分实用', '12', '99', '3', '65');
INSERT INTO `myapp_comment` VALUES ('很好', '7', '100', '8', '66');
INSERT INTO `myapp_comment` VALUES ('不错', '5', '101', '8', '66');
INSERT INTO `myapp_comment` VALUES ('蛮好的', '24', '102', '9', '67');
INSERT INTO `myapp_comment` VALUES ('睡起来很舒服！', '1', '103', '10', '69');
INSERT INTO `myapp_comment` VALUES ('很有弹性 舒服的！', '8', '104', '10', '69');

-- ----------------------------
-- Table structure for `myapp_furniture`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_furniture`;
CREATE TABLE `myapp_furniture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `old_price` double NOT NULL,
  `new_price` double NOT NULL,
  `discount` double NOT NULL,
  `desc` varchar(100) NOT NULL,
  `sales` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `image_url_i` varchar(100) NOT NULL,
  `image_url_l` varchar(100) NOT NULL,
  `image_url_m` varchar(100) NOT NULL,
  `image_url_r` varchar(100) NOT NULL,
  `image_url_c` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myApp_furniture_6f33f001` (`category_id`),
  KEY `myApp_furniture_5afadb1e` (`brand_id`),
  CONSTRAINT `brand_id_refs_id_88dd050b` FOREIGN KEY (`brand_id`) REFERENCES `myapp_brand` (`id`),
  CONSTRAINT `category_id_refs_id_4d6de1e7` FOREIGN KEY (`category_id`) REFERENCES `myapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_furniture
-- ----------------------------
INSERT INTO `myapp_furniture` VALUES ('1', '7', '原木床中式卧室家具双人床高箱储物床婚床 高箱床 ', '12', '3298', '2900', '1', '橡胶木 原木 床板高箱 40.0kg', '215', '3321', 'furniture/2017/05/1_c.jpg', 'furniture/2017/05/1_i.jpg', 'furniture/2017/05/1_l.jpg', 'furniture/2017/05/1_m.jpg', 'furniture/2017/05/1_c_QVQYGMS.jpg');
INSERT INTO `myapp_furniture` VALUES ('2', '7', '主卧室双人 胡桃木床高箱储物抽屉床现代中式婚床', '3', '4299', '3788', '1', '毛重: 65  是否带软靠: 否  家具结构: 框架结构 箱框结构 工艺: 雕刻', '447', '6443', 'furniture/2017/05/2_i.jpg', 'furniture/2017/05/2_l.jpg', 'furniture/2017/05/2_m.jpg', 'furniture/2017/05/2_r.jpg', 'furniture/2017/05/2_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('3', '12', '北欧实木餐桌椅组合橡木长方形饭桌家具', '7', '1999', '1699', '1', '款式定位: 艺术风格型  木质材质: 橡木  是否带滚轮: 否  包装方式: 组装  毛重: 35  是否可伸缩: 不可伸缩  适用人数: 6人', '248', '4388', 'furniture/2017/05/4_i.jpg', 'furniture/2017/05/4_l.jpg', 'furniture/2017/05/4_m.jpg', 'furniture/2017/05/4_r.jpg', 'furniture/2017/05/4_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('4', '1', '布艺沙发大小户型可拆洗简约现代客厅家具整装转角U型组合沙发', '5', '3199', '2899', '1', '款式定位: 经济型  图案: 植物花卉  是否带储物空间: 是  填充物: 海绵  毛重: 136  沙发组合形式: U形  是否组装: 整装  附加功能: 移动', '245', '5331', 'furniture/2017/05/3_i.jpg', 'furniture/2017/05/3_l.jpg', 'furniture/2017/05/3_m.jpg', 'furniture/2017/05/3_r.jpg', 'furniture/2017/05/4_c_wtnmVob.jpg');
INSERT INTO `myapp_furniture` VALUES ('5', '7', '林氏木业现代中式木床1.5米1.8成人双人床简约婚床卧室家具', '12', '4677', '4500', '1', '【独特设计】大气虎斑木色纹理，床头优雅曲线  【品质优异】泰国进口橡胶木，强承重双十字结构　【售后无忧】千城配送安装，9年老店，极有家品质认定', '521', '4221', 'furniture/2017/05/7_i.jpg', 'furniture/2017/05/7_l.jpg', 'furniture/2017/05/7_m.jpg', 'furniture/2017/05/7_r.jpg', 'furniture/2017/05/7_i_9Q74K9l.jpg');
INSERT INTO `myapp_furniture` VALUES ('6', '3', '星之居/美式真皮沙发三人位/油蜡皮头层牛皮羽绒沙发单人位', '6', '9884', '8999', '1', '极有家认证[优质网店]：7年好店，权威认证，买退无忧  商家承诺：提供“材质保真”服务，如材质与描述不符可获赔200%', '140', '2215', 'furniture/2017/05/8_i.jpg', 'furniture/2017/05/8_l.jpg', 'furniture/2017/05/8_m.jpg', 'furniture/2017/05/8_r.jpg', 'furniture/2017/05/8_r_7UIDB74.jpg');
INSERT INTO `myapp_furniture` VALUES ('7', '15', '美式纯全木书柜双门玻璃门带抽屉展示柜白蜡木书橱装饰柜陈列柜', '8', '8122', '5388', '1', '极有家认证[优质网店]：7年好店，权威认证，买退无忧', '101', '633', 'furniture/2017/05/10_i.jpg', 'furniture/2017/05/10_l.jpg', 'furniture/2017/05/9_m.jpg', 'furniture/2017/05/9_r.jpg', 'furniture/2017/05/10_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('8', '1', '【美式腔调-原创设计】美式乡村家具棉麻拉扣三人布艺沙发组合', '9', '8799', '7999', '1', '【原创设计】【美式调性潮流混搭】【出口棉麻面料】【手工拉扣铆钉】  极有家认证[优质网店]：11年好店，权威认证，买退无忧', '261', '5331', 'furniture/2017/05/11_i.jpg', 'furniture/2017/05/11_l.jpg', 'furniture/2017/05/11_m.jpg', 'furniture/2017/05/11_r.jpg', 'furniture/2017/05/11_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('9', '12', '林氏木业现代简约伸缩餐桌 小户型餐桌椅组合烤漆钢化玻璃饭桌', '12', '2799', '2599', '1', '伸缩功能 钢琴烤漆 钢化玻璃 圆角处理  商家承诺：购买“送货入户并安装”服务，未履行最高可获300元赔付', '325', '533', 'furniture/2017/05/12_i.jpg', 'furniture/2017/05/12_l.jpg', 'furniture/2017/05/12_m.jpg', 'furniture/2017/05/12_r.jpg', 'furniture/2017/05/12_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('10', '16', '奢家成套家具主卧套房家具卧室床衣柜组合套装整套组合六件套', '3', '18999', '15000', '1', '六件套包括：一个1.5或1.8米床+2个床头柜+一个衣柜+一个妆台+一个妆凳；排骨架床可配床垫20CM厚，高箱可配5CM厚无胶水棕垫；六件套不配床垫要另外购买。淘宝官方指定城市免费上门包安装的哈。', '57', '578', 'furniture/2017/05/13_i.jpg', 'furniture/2017/05/13_l.jpg', 'furniture/2017/05/13_m.jpg', 'furniture/2017/05/13_r.jpg', 'furniture/2017/05/13_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('11', '17', '大理石茶几电视柜组合套装简约现代客厅成套家具小户型伸缩茶几', '9', '9969', '8799', '1', '【关于我们：专业生产客厅家具十五年】 【关于产品：高档高温烤漆+4CM大理石台面+独特新颖的设计，让您享受高品质家具】 【 关于服务：价格不是衡量的唯一标准，当然也是很重要的，但是产品的质量和售前售后', '104', '252', 'furniture/2017/05/15_i.jpg', 'furniture/2017/05/15_l.jpg', 'furniture/2017/05/15_m.jpg', 'furniture/2017/05/15_r.jpg', 'furniture/2017/05/15_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('12', '12', '宜家实木餐桌椅组合 约克马克一桌四椅子成套装 简约现代餐厅家', '7', '799', '779', '1', '实心松木，天然材质，历久弥新。  可坐4人。', '221', '422', 'furniture/2017/05/17_i.jpg', 'furniture/2017/05/17_l.jpg', 'furniture/2017/05/17_m.jpg', 'furniture/2017/05/17_r.jpg', 'furniture/2017/05/17_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('13', '7', '澳林匹斯全实木床双人床 新古典床1.8米雕花美式床婚床欧式床', '3', '5688', '4599.99', '1', '全实木框架 精美雕花 尊贵优雅', '61', '442', 'furniture/2017/05/18_i_POr8fIG.jpg', 'furniture/2017/05/18_l_ZFo8iVj.jpg', 'furniture/2017/05/18_m_NC4iRSP.jpg', 'furniture/2017/05/18_r_k38jqtJ.jpg', 'furniture/2017/05/18_c_2SQuhpZ.jpg');
INSERT INTO `myapp_furniture` VALUES ('14', '13', '美式家具 欧式田园乡村玄关柜地中海餐柜橱柜酒柜边柜 美式餐边', '3', '1350', '950', '1', '怀旧复古是我们的代名词，岁月静好是我们的感觉~手工彩绘、环保大宝油漆、符合标准密度板，豪斯从材质到工艺再到设计，做旧已经不只是一种表象，而是深入骨髓！15天无理由退换货，分享美图还有小惊喜哦~一起感受', '123', '557', 'furniture/2017/05/19_i.jpg', 'furniture/2017/05/19_r.jpg', 'furniture/2017/05/19_m.jpg', 'furniture/2017/05/19_r_CXD8LLh.jpg', 'furniture/2017/05/19_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('15', '2', '实木中式沙发 新中式 楠木沙发组合 真牛皮沙发客厅家具', '11', '13990', '10230', '1', '精选黄牛头层真牛皮搭配东南亚进口楠木打造，21年实木家具制造经验。羽绒透气座包，经久耐用。打造高品质墅级臻品家具。极有家500城区可享受免费送货上门并安装服务，解决您运输安装的烦恼，三年质保期让您购买', '47', '777', 'furniture/2017/05/20_i.jpg', 'furniture/2017/05/20_l.jpg', 'furniture/2017/05/20_m.jpg', 'furniture/2017/05/20_r.jpg', 'furniture/2017/05/20_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('16', '13', '欧式美式鞋柜实木家具中式门厅间断玄关柜描金收纳柜餐边柜子包邮', '4', '1542', '1255', '1', '材质：框架抽屉柜脚都是实木，承重力强，不易断裂，大宝环保油漆，坚固耐用，密封性强。 包装：珍珠棉，泡沫，纸箱，木架，四重包装让亲购物无忧！ 安装：即买即用，无需安装，省时省心省力！', '318', '882', 'furniture/2017/05/21_i.jpg', 'furniture/2017/05/21_l.jpg', 'furniture/2017/05/21_m.jpg', 'furniture/2017/05/21_r.jpg', 'furniture/2017/05/21_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('17', '19', 'ZOMO 温莎椅 全实木餐椅 白橡木餐椅 纯实木家具 餐桌椅', '7', '999', '499', '1', '本款餐椅采用美国进口特级橡木，不掺杂密度板、中纤板、刨花板等人造板材。源自17世纪末的英国经典座椅！如琴弦般优雅 耳畔轻鸣悠远的历史之音！实木螺纽设计，每个细节都这么自然。椅面为马鞍形状，使人的体压得', '234', '977', 'furniture/2017/05/22_i.jpg', 'furniture/2017/05/22_l.jpg', 'furniture/2017/05/22_m.jpg', 'furniture/2017/05/22_r.jpg', 'furniture/2017/05/22_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('18', '12', ' 复古家具新中式喝茶桌木桌子功夫茶几不规则大板桌原木全实木餐', '12', '2399', '1799', '1', '采用实木跟优质钢管搭配制造而成，饰面采用立邦环保木器漆，安全环保。几十年老师傅监督制作，整体均以榫卯结构构成，实木拼接，不含纤维板，请放心选购。本产品支持私人定制，厂家直销，价格实惠。', '212', '771', 'furniture/2017/05/23_i.png', 'furniture/2017/05/23_l.png', 'furniture/2017/05/23_m.png', 'furniture/2017/05/23_r.png', 'furniture/2017/05/23_c.png');
INSERT INTO `myapp_furniture` VALUES ('19', '5', ' 多功能可升降茶几竹木储物小户型客厅茶几现代简约茶桌家具', '6', '1077', '997', '1', '大容量储物，升降功能，时尚款', '231', '991', 'furniture/2017/05/24_i.jpg', 'furniture/2017/05/24_l.jpg', 'furniture/2017/05/24_m.jpg', 'furniture/2017/05/24_m_ZtMQGH5.jpg', 'furniture/2017/05/24_r.jpg');
INSERT INTO `myapp_furniture` VALUES ('20', '5', '田园茶几 实木象牙白色时尚简约客厅茶几组合特价 爆款抢购', '9', '1600', '800', '1', '【有现货 早买早安排发货】 自家工厂生产网上直销，从源头降低成本，直接让消费者受惠。', '330', '9011', 'furniture/2017/05/25_i.jpg', 'furniture/2017/05/25_l.jpg', 'furniture/2017/05/25_m.jpg', 'furniture/2017/05/25_r.jpg', 'furniture/2017/05/25_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('21', '12', '地中海饭桌餐台 8人桌 欧式旋转圆桌 时尚爆款 限时抢购', '8', '1842', '1533', '1', '全国300大城市包送包安装，质保三年。拼的是服务与质量！ 圆桌可做8人，大气美观', '123', '1774', 'furniture/2017/05/26_i.jpg', 'furniture/2017/05/26_l.jpg', 'furniture/2017/05/26_m.jpg', 'furniture/2017/05/26_r.jpg', 'furniture/2017/05/26_i_UNWzadQ.jpg');
INSERT INTO `myapp_furniture` VALUES ('22', '1', '布艺小户型客厅实木地中海田园乡村风格单三人位组合整装', '10', '3188', '2588', '1', '【原创设计】【美式调性潮流混搭】【出口棉麻面料】【纯手工拉扣铜钉】', '253', '1233', 'furniture/2017/05/27_i.jpg', 'furniture/2017/05/27_l.jpg', 'furniture/2017/05/27_m.jpg', 'furniture/2017/05/27_r.jpg', 'furniture/2017/05/27_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('23', '7', '全实木床1.8米白色地中海婚床北欧双人床乡村田园床1.5米', '8', '2566', '1999', '1', '极有家认证[品质工厂]：高于国标，买退无忧', '132', '442', 'furniture/2017/05/28_i.jpg', 'furniture/2017/05/28_l.jpg', 'furniture/2017/05/28_m.jpg', 'furniture/2017/05/28_r.jpg', 'furniture/2017/05/28_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('24', '1', '拉扣布艺沙发组合客厅地中海田园风格简约三人整装小户型', '6', '2588', '1988', '1', '【原创设计】【美式调性潮流混搭】【出口棉麻面料】【纯手工拉扣铜钉】', '276', '911', 'furniture/2017/05/29_i.jpg', 'furniture/2017/05/29_l.jpg', 'furniture/2017/05/29_m.jpg', 'furniture/2017/05/29_r.jpg', 'furniture/2017/05/29_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('25', '15', '地中海风格转角书桌美式田园书柜欧式儿童电脑桌家具书架组合实木', '6', '2999', '1788', '1', '转角方向可以左右互换的 实木床脚 稳固承重 全国大部分地区包到地级市区物流点，部分县城及偏远地区拍前请联系客服', '72', '662', 'furniture/2017/05/30_i.jpg', 'furniture/2017/05/30_l.jpg', 'furniture/2017/05/30_m.jpg', 'furniture/2017/05/30_r.jpg', 'furniture/2017/05/30_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('26', '11', '简式253地中海复古彩绘三门衣柜美式实木欧式复古雕刻鎏金大衣', '9', '4100', '3988', '1', '厂家直销，超低价让利给顾客，品质质量保证。框架结构，安装简单，结实耐用。欧式田园风格，清新自然，使用美观大方。精致大气的设计，漂亮的细腻雕花，紧跟时尚潮流，.居家必备您值得拥有。 环保健康，以人为本，', '94', '991', 'furniture/2017/05/31_i.jpg', 'furniture/2017/05/31_l.jpg', 'furniture/2017/05/31_m.jpg', 'furniture/2017/05/31_r.jpg', 'furniture/2017/05/31_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('27', '19', '北欧宜家日式实木曲木椅靠背扶手餐椅家用电脑椅办公书桌', '7', '311', '199', '1', '大量回头客购买 北欧曲木工艺 超多颜色可选 可用作餐椅、会议椅、电脑椅、书桌椅等多种场合。', '142', '991', 'furniture/2017/05/32_i.jpg', 'furniture/2017/05/32_l.jpg', 'furniture/2017/05/32_m.jpg', 'furniture/2017/05/32_r.jpg', 'furniture/2017/05/32_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('28', '8', '北欧布艺床宜家双人床1.8米小户型主卧婚床日式简约现代可拆洗', '7', '3500', '2699', '1', '极有家认证[品质工厂]：高于国标，买退无忧', '62', '913', 'furniture/2017/05/33_i.jpg', 'furniture/2017/05/33_l.jpg', 'furniture/2017/05/33_m.jpg', 'furniture/2017/05/33_r.jpg', 'furniture/2017/05/33_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('29', '5', '北欧格调电视柜 简约现代 地柜 客厅家具 茶几电视柜组合', '6', '2588', '1922', '1', '极有家认证[优质网店]：11年好店，权威认证，买退无忧', '23', '1331', 'furniture/2017/05/34_i.jpg', 'furniture/2017/05/34_l.jpg', 'furniture/2017/05/34_m.jpg', 'furniture/2017/05/34_r.jpg', 'furniture/2017/05/34_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('30', '5', '北欧客厅现代实木长方形双层储物茶几日式宜家小户型橡木茶桌', '7', '1500', '899', '1', '全白橡木 高性价比 实用美观', '163', '1244', 'furniture/2017/05/35_i.jpg', 'furniture/2017/05/35_l.jpg', 'furniture/2017/05/35_m.jpg', 'furniture/2017/05/35_r.jpg', 'furniture/2017/05/35_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('32', '1', '小户型布艺沙发北欧简约可拆洗客厅单人双人三人卧室沙发 ', '9', '950', '780', '1', '0元包送货到楼下，3年质保，90天无理由免费退换货！　　【优质材料】棉麻工艺，实木框架，优质海绵座包　　　【独特设计】面积宽大线条流畅，人体力学线条造型！舒适居家选择。', '164', '885', 'furniture/2017/05/36_i.jpg', 'furniture/2017/05/36_l.jpg', 'furniture/2017/05/36_m.jpg', 'furniture/2017/05/36_r.jpg', 'furniture/2017/05/36_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('33', '1', '布艺沙发可拆洗现代简约大小户型沙发皮配布时尚沙发转角组合家具', '6', '3500', '2355', '1', '新款促销价 2080抢不停 三包到家 可随意更换颜色拆洗 皮配布沙发\\易清洁\\清爽自然\\高密度海绵\\现代时尚\\订做灵活\\多色可选\\', '92', '996', 'furniture/2017/05/37_i.jpg', 'furniture/2017/05/37_l.jpg', 'furniture/2017/05/37_m.jpg', 'furniture/2017/05/37_r.jpg', 'furniture/2017/05/37_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('34', '1', ' 北欧布艺沙发 客厅现代简约大小户型沙发可拆洗羽绒双三人位 ', '2', '3599', '2800', '1', '【羽绒填充】【全拆洗】【经典拉扣】', '123', '976', 'furniture/2017/05/38_i.jpg', 'furniture/2017/05/38_l.jpg', 'furniture/2017/05/38_m.jpg', 'furniture/2017/05/38_r.jpg', 'furniture/2017/05/38_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('35', '2', '实木沙发组合香樟木沙发多功能转角储物新中式仿古雕花客厅家具', '5', '4999', '4500', '1', '采用香樟木作为原材料，香樟木特性为自身附带香气使其具有实用功能,木质细密,纹理细腻,花纹精美。质地坚硬同时具有防蚊驱虫之功效！', '88', '443', 'furniture/2017/05/39_i.jpg', 'furniture/2017/05/39_l.jpg', 'furniture/2017/05/39_m.jpg', 'furniture/2017/05/39_r.jpg', 'furniture/2017/05/39_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('36', '2', ' 实木沙发 新中式沙发 现代实木布艺家具组合 贵妃转角', '10', '5555', '4300', '1', '必抢理由：★1、实木沙发：主体框架精选白蜡木打造，精致雕花扶手；★2、多种组合不同面料可选，适应不同的家居需求！极有家指定城区包配送安装！', '98', '664', 'furniture/2017/05/40_i.jpg', 'furniture/2017/05/40_l.jpg', 'furniture/2017/05/40_m.jpg', 'furniture/2017/05/40_r.jpg', 'furniture/2017/05/40_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('37', '3', '简约北欧真皮沙发现代皮艺小户型客厅单人双人三人皮沙发组合家具', '6', '3500', '2900', '1', '北欧风格真皮头层牛皮 现代简约商用、家居家用沙发 售后无忧', '21', '331', 'furniture/2017/05/41_i.jpg', 'furniture/2017/05/41_l.jpg', 'furniture/2017/05/41_m.jpg', 'furniture/2017/05/41_r.jpg', 'furniture/2017/05/41_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('38', '3', '美式真皮沙发简美实木皮布沙发欧式客厅整装沙发123组合包邮 ', '6', '7990', '7500', '1', '极有家认证[品牌专营]：品牌授权，正品保障', '101', '771', 'furniture/2017/05/42_i.jpg', 'furniture/2017/05/42._ljpg.jpg', 'furniture/2017/05/42_m.jpg', 'furniture/2017/05/42_r.jpg', 'furniture/2017/05/42_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('39', '3', '欧式真皮沙发 简约头层牛皮组合 奢华户型别墅实木雕花家具皮沙', '11', '15000', '13970', '1', '为大小户型、大平层和复式房型而设计。这次专注于全实木的雕花和皮料的采用，倾力打造皮艺沙发。为品质生活人士提提供实惠、优质的皮艺家具 卖点：传统的手工实木家具雕刻，头层真牛皮耐磨耐用，方便清理 。厂家直', '72', '441', 'furniture/2017/05/43_i.jpg', 'furniture/2017/05/43_l.jpg', 'furniture/2017/05/43_m.jpg', 'furniture/2017/05/43_r.jpg', 'furniture/2017/05/43_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('40', '4', '北欧格调电视柜 简约现代 地柜 客厅家具 茶几电视柜组合 ', '11', '1600', '1500', '1', '极有家认证[优质网店]：11年好店，权威认证，买退无忧', '102', '881', 'furniture/2017/05/44_i.jpg', 'furniture/2017/05/44_l.jpg', 'furniture/2017/05/44_m.jpg', 'furniture/2017/05/44_r.jpg', 'furniture/2017/05/44_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('41', '4', '北欧实木电视柜简约现代小户型客厅茶几组合白橡木视听柜日式家具', '7', '3500', '2900', '1', '极有家认证[优质网店]：10年好店，权威认证，买退无忧', '150', '442', 'furniture/2017/05/45_i.jpg', 'furniture/2017/05/45_l.jpg', 'furniture/2017/05/45_m.jpg', 'furniture/2017/05/45_r.jpg', 'furniture/2017/05/45_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('42', '4', '新款多功能自由组合伸缩电视柜 简约现代钢琴烤漆电视柜 ', '3', '490', '399', '1', '极有家认证[优质网店]：4年好店，权威认证，买退无忧', '141', '991', 'furniture/2017/05/46_i.jpg', 'furniture/2017/05/46_l.jpg', 'furniture/2017/05/46_m.jpg', 'furniture/2017/05/46_r.jpg', 'furniture/2017/05/46_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('43', '6', '楠竹换鞋凳穿鞋凳鞋架子实木宜家田园置物架储物收纳鞋柜特价包邮', '7', '310', '180', '1', '厂家直销.低价跑量.亲：购买前货比三家.我们值得您的购买~~~', '90', '510', 'furniture/2017/05/47_r.jpg', 'furniture/2017/05/47_l.jpg', 'furniture/2017/05/47_m.jpg', 'furniture/2017/05/47_r_RoM5QsS.jpg', 'furniture/2017/05/47_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('44', '6', '新中式鞋柜 老榆木鞋柜 刺猬紫檀家具红木 新品 储物柜 实木', '1', '3999', '3560', '1', '【通体实木打造】 【传统榫卯结构】 【健康环保品质】 【支持尺寸颜色定制】', '28', '477', 'furniture/2017/05/48_i.jpg', 'furniture/2017/05/48_l.jpg', 'furniture/2017/05/48_m.jpg', 'furniture/2017/05/48_r.jpg', 'furniture/2017/05/48_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('45', '8', ' 欧式布艺床北欧高靠背双人床1.8米现代简约软包床美式小户型', '1', '2500', '1600', '1', '新古典现代简约 拉扣双人软床 宾馆酒店 样板间', '38', '290', 'furniture/2017/05/49_i.jpg', 'furniture/2017/05/49_l.jpg', 'furniture/2017/05/49_m.jpg', 'furniture/2017/05/49_r.jpg', 'furniture/2017/05/49_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('46', '8', '北欧布艺床可拆洗卧室小户型布床气动储物双人床1.8米主卧床包', '2', '5000', '4800', '1', '极有家认证[优质网店]：3年好店，权威认证，买退无忧', '92', '911', 'furniture/2017/05/50_i.jpg', 'furniture/2017/05/50_l.jpg', 'furniture/2017/05/50_m.jpg', 'furniture/2017/05/50_r.jpg', 'furniture/2017/05/50_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('47', '8', '布床布艺床 小户型北欧宜家1.8米双人床可拆洗简约现代美式软', '7', '2600', '2300', '1', '北欧宜家风格布艺床。采用高档进口棉麻面料！面料厚实，手感舒适，使用年限更长，内置45密度高回弹海棉，经久耐用，内部框架采用加粗全实木框架，更加扎实稳固！经典北欧时尚风格，专注卧室家具小户型可拆洗软包简', '102', '901', 'furniture/2017/05/51_i.jpg', 'furniture/2017/05/51_l.jpg', 'furniture/2017/05/51_m.jpg', 'furniture/2017/05/51_r.jpg', 'furniture/2017/05/51_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('48', '9', '卧室皮床现代简约真皮床双人床1.8米1.5皮艺软床婚床储物床', '1', '5000', '4850', '1', '实木框架 减震排骨架 环保头层牛皮 五包到家', '70', '99', 'furniture/2017/05/52_i.jpg', 'furniture/2017/05/52_l.jpg', 'furniture/2017/05/52_m.jpg', 'furniture/2017/05/52_r.jpg', 'furniture/2017/05/52_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('49', '9', '美式皮床实木简欧式主卧室真皮储物床大小户型双人田园白色皮艺床', '2', '4500', '3500', '1', '极有家认证[品质工厂]：高于国标，买退无忧', '42', '390', 'furniture/2017/05/53_i.jpg', 'furniture/2017/05/53_l.jpg', 'furniture/2017/05/53_m.jpg', 'furniture/2017/05/53_r.jpg', 'furniture/2017/05/53_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('50', '10', ' 海马床垫 乳胶床垫1.8米1.5m双人软硬定做弹簧席梦思3', '11', '4200', '3890', '1', '【服务】千城三包到家！已卖了3万张的超高性价比软硬两用床垫。【卖点】护脊，可面拆，蚕丝针织面料+精钢/九区独立弹簧+环保椰棕/3E椰梦维可选 。【优惠】优惠券直接领取使用，详情请咨询客服MM。', '72', '571', 'furniture/2017/05/54_i.jpg', 'furniture/2017/05/54_l.jpg', 'furniture/2017/05/54_m.jpg', 'furniture/2017/05/54_r.jpg', 'furniture/2017/05/54_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('51', '10', '防滑榻榻米海绵床垫1.5米1.8m学生宿舍棉絮垫被1.2可折', '5', '70', '48', '1', '极有家认证[优质网店]：3年好店，权威认证，买退无忧', '91', '1022', 'furniture/2017/05/55_i.jpg', 'furniture/2017/05/55_l.jpg', 'furniture/2017/05/55_m.jpg', 'furniture/2017/05/55_r.jpg', 'furniture/2017/05/55_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('52', '10', '记忆棉床垫榻榻米床褥子海绵1.5m1.8m单人学生宿舍折叠加', '6', '210', '160', '1', '企业店铺[厂家直营]：权威认证，买退无忧 商家承诺：免费提供“运费险”，退货最高获赔25元运费理赔', '201', '280', 'furniture/2017/05/56_i.jpg', 'furniture/2017/05/56_l.jpg', 'furniture/2017/05/56_m.jpg', 'furniture/2017/05/56_r.jpg', 'furniture/2017/05/56_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('53', '11', '简约现代板式衣柜移门整体木衣柜推拉门卧室大衣柜两趟门组合衣橱', '3', '2400', '1200', '1', '高密度中纤板材，三聚氰胺饰面，安全环保；简约时尚外观， 让空间利用更充分；【★免费配送安装】【★中国板式品牌家具】【★专业板式家具二十年】【★全场五折，实惠到底】【★国际E1标准，安全环保】【★结构牢', '154', '839', 'furniture/2017/05/57_i.jpg', 'furniture/2017/05/57_l.jpg', 'furniture/2017/05/57_m.jpg', 'furniture/2017/05/57_r.jpg', 'furniture/2017/05/57_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('54', '11', '现代中式卧室家具实木衣柜五门整体木质橡木4 6开门大衣橱衣帽', '6', '2490', '1893', '1', '极有家认证[优质网店]：1年好店，权威认证，买退无忧', '179', '980', 'furniture/2017/05/58_i.jpg', 'furniture/2017/05/58_l.jpg', 'furniture/2017/05/58_m.jpg', 'furniture/2017/05/58_r.jpg', 'furniture/2017/05/58_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('55', '11', '地中海儿童衣柜实木美式乡村百叶门木质衣橱田园卧室柜子家具4门', '6', '3600', '2340', '1', '品牌保障 品质专享 五星服务 优质工艺 厂家直销，全国1500城市地区免费送货安装！购买无忧！', '39', '100', 'furniture/2017/05/59_i.jpg', 'furniture/2017/05/59_l.jpg', 'furniture/2017/05/59_m.jpg', 'furniture/2017/05/59_r.jpg', 'furniture/2017/05/59_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('56', '11', '白蜡木美式衣柜实木4门3门简约整体大衣柜子衣橱卧室家具移门衣', '5', '5599', '5339', '1', '【白色补差价500元！】精选美国进口FAS级白蜡木，纹理均匀，木性坚韧，抗压耐腐。白蜡木四门衣柜的细节：多种分类空间，储物更便利。柜顶采用多层棱边设计，层次感丰富，家具更生动有趣；关键是柜内设有透气孔', '96', '996', 'furniture/2017/05/60_i.jpg', 'furniture/2017/05/60_l.jpg', 'furniture/2017/05/60_m.jpg', 'furniture/2017/05/60_r.jpg', 'furniture/2017/05/60_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('57', '16', '卧室家具套装组合简约成人套房现代板式卧室成套家具套装五件套 ', '3', '4500', '3298', '1', '钢琴烤漆亮光家具，一个床+2个床头柜+一个床垫+一个衣柜。新款上市，数量有限抢完为止。淘宝官方指定城市百城免费送货上门包安装。（衣柜暗柜/裤架/顶柜/侧柜需另外购买，详情请咨询客服）', '44', '98', 'furniture/2017/05/61_i.jpg', 'furniture/2017/05/60_l_tzWYDUq.jpg', 'furniture/2017/05/61_m.jpg', 'furniture/2017/05/61_r.jpg', 'furniture/2017/05/61_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('58', '16', '北欧家具套装组合卧室现代简约小户型床衣柜组合卧室成套家具全屋', '5', '7401', '6841', '1', '极有家认证[全屋定制]：个性定制，权威认证，服务无忧', '10', '199', 'furniture/2017/05/62_i.jpg', 'furniture/2017/05/62_l.jpg', 'furniture/2017/05/62_m.jpg', 'furniture/2017/05/62_r.jpg', 'furniture/2017/05/62_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('59', '17', '全友家私现代简约客厅成套家具', '1', '1599', '833', '1', '全友家居官方直营店铺：546城区五包到家，1800+城市配送安装，3000+门店一站式服务；三年质保、终身维护！', '9', '100', 'furniture/2017/05/63_i.jpg', 'furniture/2017/05/63_l.jpg', 'furniture/2017/05/63_m.jpg', 'furniture/2017/05/63_r.jpg', 'furniture/2017/05/63_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('60', '17', '全友家私客厅成套家具组合新古典小户型 茶几+电视柜套装', '1', '3500', '3280', '1', '全友家居官方直营店铺：546城区五包到家，1800+城市配送安装，3000+门店一站式服务；三年质保、终身维护！', '32', '766', 'furniture/2017/05/64_i.jpg', 'furniture/2017/05/64_l.jpg', 'furniture/2017/05/64_m.jpg', 'furniture/2017/05/64_r.jpg', 'furniture/2017/05/64_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('61', '19', '北欧风格成套家具 餐桌1.6米+真皮餐椅2个+布艺餐椅+长凳', '8', '7500', '6600', '1', '极有家认证[优质网店]：6年好店，权威认证，买退无忧', '27', '190', 'furniture/2017/05/65_i.jpg', 'furniture/2017/05/65_l.jpg', 'furniture/2017/05/65_m.jpg', 'furniture/2017/05/65_r.jpg', 'furniture/2017/05/65_c.jpg');
INSERT INTO `myapp_furniture` VALUES ('62', '18', '美式乡村圆餐桌实木 成套餐桌椅组合简约圆桌餐厅家具小户型饭桌', '6', '2900', '1600', '1', '泰国进口橡胶木制作 桌面密度板贴樱桃木皮艺术拼花 ；319个城区免费送装入户；', '20', '92', 'furniture/2017/05/66_i.jpg', 'furniture/2017/05/66_l.jpg', 'furniture/2017/05/66_m.jpg', 'furniture/2017/05/66_r.jpg', 'furniture/2017/05/66_c.png');
INSERT INTO `myapp_furniture` VALUES ('63', '14', ' 长方形简约实木书桌 家用书房办公电脑台式桌 卧室儿童学习写', '9', '2000', '1900', '1', '工厂直销的，真正的实木桌子，支持定制。定制产品可以要求展示生产过程毛坯图，常规尺寸支持无条件退货。', '77', '100', 'furniture/2017/05/67_I.jpg', 'furniture/2017/05/67_l.jpg', 'furniture/2017/05/67_m.jpg', 'furniture/2017/05/67_r.jpg', 'furniture/2017/05/67_c.jpg');

-- ----------------------------
-- Table structure for `myapp_furniture_size`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_furniture_size`;
CREATE TABLE `myapp_furniture_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `furniture_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `furniture_id` (`furniture_id`,`size_id`),
  KEY `myApp_furniture_size_05beb0c3` (`furniture_id`),
  KEY `myApp_furniture_size_fea27a6d` (`size_id`),
  CONSTRAINT `furniture_id_refs_id_6eac7e88` FOREIGN KEY (`furniture_id`) REFERENCES `myapp_furniture` (`id`),
  CONSTRAINT `size_id_refs_id_d160ba2c` FOREIGN KEY (`size_id`) REFERENCES `myapp_size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_furniture_size
-- ----------------------------
INSERT INTO `myapp_furniture_size` VALUES ('1', '1', '1');
INSERT INTO `myapp_furniture_size` VALUES ('2', '1', '2');
INSERT INTO `myapp_furniture_size` VALUES ('3', '2', '1');
INSERT INTO `myapp_furniture_size` VALUES ('37', '3', '8');
INSERT INTO `myapp_furniture_size` VALUES ('5', '4', '6');
INSERT INTO `myapp_furniture_size` VALUES ('6', '5', '1');
INSERT INTO `myapp_furniture_size` VALUES ('7', '5', '2');
INSERT INTO `myapp_furniture_size` VALUES ('8', '6', '3');
INSERT INTO `myapp_furniture_size` VALUES ('9', '6', '5');
INSERT INTO `myapp_furniture_size` VALUES ('10', '7', '8');
INSERT INTO `myapp_furniture_size` VALUES ('11', '8', '6');
INSERT INTO `myapp_furniture_size` VALUES ('12', '9', '8');
INSERT INTO `myapp_furniture_size` VALUES ('13', '10', '8');
INSERT INTO `myapp_furniture_size` VALUES ('14', '11', '8');
INSERT INTO `myapp_furniture_size` VALUES ('15', '12', '8');
INSERT INTO `myapp_furniture_size` VALUES ('16', '13', '1');
INSERT INTO `myapp_furniture_size` VALUES ('17', '13', '2');
INSERT INTO `myapp_furniture_size` VALUES ('18', '14', '8');
INSERT INTO `myapp_furniture_size` VALUES ('19', '15', '8');
INSERT INTO `myapp_furniture_size` VALUES ('20', '16', '8');
INSERT INTO `myapp_furniture_size` VALUES ('21', '17', '8');
INSERT INTO `myapp_furniture_size` VALUES ('22', '18', '8');
INSERT INTO `myapp_furniture_size` VALUES ('23', '19', '8');
INSERT INTO `myapp_furniture_size` VALUES ('24', '20', '8');
INSERT INTO `myapp_furniture_size` VALUES ('25', '21', '8');
INSERT INTO `myapp_furniture_size` VALUES ('26', '22', '5');
INSERT INTO `myapp_furniture_size` VALUES ('27', '23', '1');
INSERT INTO `myapp_furniture_size` VALUES ('28', '23', '2');
INSERT INTO `myapp_furniture_size` VALUES ('29', '24', '5');
INSERT INTO `myapp_furniture_size` VALUES ('30', '25', '8');
INSERT INTO `myapp_furniture_size` VALUES ('31', '26', '8');
INSERT INTO `myapp_furniture_size` VALUES ('32', '27', '8');
INSERT INTO `myapp_furniture_size` VALUES ('33', '28', '1');
INSERT INTO `myapp_furniture_size` VALUES ('34', '28', '2');
INSERT INTO `myapp_furniture_size` VALUES ('35', '29', '8');
INSERT INTO `myapp_furniture_size` VALUES ('36', '30', '8');
INSERT INTO `myapp_furniture_size` VALUES ('39', '32', '3');
INSERT INTO `myapp_furniture_size` VALUES ('40', '32', '4');
INSERT INTO `myapp_furniture_size` VALUES ('41', '32', '5');
INSERT INTO `myapp_furniture_size` VALUES ('42', '33', '8');
INSERT INTO `myapp_furniture_size` VALUES ('43', '34', '3');
INSERT INTO `myapp_furniture_size` VALUES ('44', '34', '4');
INSERT INTO `myapp_furniture_size` VALUES ('45', '34', '5');
INSERT INTO `myapp_furniture_size` VALUES ('46', '35', '8');
INSERT INTO `myapp_furniture_size` VALUES ('47', '36', '7');
INSERT INTO `myapp_furniture_size` VALUES ('48', '37', '8');
INSERT INTO `myapp_furniture_size` VALUES ('49', '38', '8');
INSERT INTO `myapp_furniture_size` VALUES ('50', '39', '3');
INSERT INTO `myapp_furniture_size` VALUES ('51', '39', '4');
INSERT INTO `myapp_furniture_size` VALUES ('52', '39', '5');
INSERT INTO `myapp_furniture_size` VALUES ('53', '40', '8');
INSERT INTO `myapp_furniture_size` VALUES ('54', '41', '8');
INSERT INTO `myapp_furniture_size` VALUES ('55', '42', '8');
INSERT INTO `myapp_furniture_size` VALUES ('56', '43', '8');
INSERT INTO `myapp_furniture_size` VALUES ('57', '44', '8');
INSERT INTO `myapp_furniture_size` VALUES ('58', '45', '1');
INSERT INTO `myapp_furniture_size` VALUES ('59', '45', '2');
INSERT INTO `myapp_furniture_size` VALUES ('60', '46', '1');
INSERT INTO `myapp_furniture_size` VALUES ('61', '46', '2');
INSERT INTO `myapp_furniture_size` VALUES ('62', '47', '1');
INSERT INTO `myapp_furniture_size` VALUES ('63', '47', '2');
INSERT INTO `myapp_furniture_size` VALUES ('64', '48', '1');
INSERT INTO `myapp_furniture_size` VALUES ('65', '48', '2');
INSERT INTO `myapp_furniture_size` VALUES ('66', '49', '1');
INSERT INTO `myapp_furniture_size` VALUES ('67', '49', '2');
INSERT INTO `myapp_furniture_size` VALUES ('68', '50', '1');
INSERT INTO `myapp_furniture_size` VALUES ('69', '50', '2');
INSERT INTO `myapp_furniture_size` VALUES ('70', '51', '1');
INSERT INTO `myapp_furniture_size` VALUES ('71', '51', '2');
INSERT INTO `myapp_furniture_size` VALUES ('72', '52', '1');
INSERT INTO `myapp_furniture_size` VALUES ('73', '52', '2');
INSERT INTO `myapp_furniture_size` VALUES ('74', '53', '8');
INSERT INTO `myapp_furniture_size` VALUES ('75', '54', '8');
INSERT INTO `myapp_furniture_size` VALUES ('76', '55', '8');
INSERT INTO `myapp_furniture_size` VALUES ('77', '56', '8');
INSERT INTO `myapp_furniture_size` VALUES ('78', '57', '8');
INSERT INTO `myapp_furniture_size` VALUES ('79', '58', '8');
INSERT INTO `myapp_furniture_size` VALUES ('80', '59', '8');
INSERT INTO `myapp_furniture_size` VALUES ('81', '60', '8');
INSERT INTO `myapp_furniture_size` VALUES ('82', '61', '8');
INSERT INTO `myapp_furniture_size` VALUES ('83', '62', '8');
INSERT INTO `myapp_furniture_size` VALUES ('84', '63', '8');

-- ----------------------------
-- Table structure for `myapp_furniture_tag`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_furniture_tag`;
CREATE TABLE `myapp_furniture_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `furniture_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `furniture_id` (`furniture_id`,`tag_id`),
  KEY `myApp_furniture_tag_05beb0c3` (`furniture_id`),
  KEY `myApp_furniture_tag_5659cca2` (`tag_id`),
  CONSTRAINT `furniture_id_refs_id_85878abb` FOREIGN KEY (`furniture_id`) REFERENCES `myapp_furniture` (`id`),
  CONSTRAINT `tag_id_refs_id_bfd50b4a` FOREIGN KEY (`tag_id`) REFERENCES `myapp_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_furniture_tag
-- ----------------------------
INSERT INTO `myapp_furniture_tag` VALUES ('1', '1', '4');
INSERT INTO `myapp_furniture_tag` VALUES ('2', '2', '4');
INSERT INTO `myapp_furniture_tag` VALUES ('31', '3', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('4', '4', '4');
INSERT INTO `myapp_furniture_tag` VALUES ('5', '5', '4');
INSERT INTO `myapp_furniture_tag` VALUES ('6', '6', '2');
INSERT INTO `myapp_furniture_tag` VALUES ('7', '7', '2');
INSERT INTO `myapp_furniture_tag` VALUES ('8', '8', '2');
INSERT INTO `myapp_furniture_tag` VALUES ('9', '9', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('10', '10', '3');
INSERT INTO `myapp_furniture_tag` VALUES ('11', '11', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('12', '12', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('13', '13', '3');
INSERT INTO `myapp_furniture_tag` VALUES ('14', '14', '2');
INSERT INTO `myapp_furniture_tag` VALUES ('15', '15', '4');
INSERT INTO `myapp_furniture_tag` VALUES ('16', '16', '2');
INSERT INTO `myapp_furniture_tag` VALUES ('17', '17', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('18', '18', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('19', '19', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('20', '20', '3');
INSERT INTO `myapp_furniture_tag` VALUES ('21', '21', '5');
INSERT INTO `myapp_furniture_tag` VALUES ('22', '22', '5');
INSERT INTO `myapp_furniture_tag` VALUES ('23', '23', '5');
INSERT INTO `myapp_furniture_tag` VALUES ('24', '24', '5');
INSERT INTO `myapp_furniture_tag` VALUES ('25', '25', '5');
INSERT INTO `myapp_furniture_tag` VALUES ('26', '26', '5');
INSERT INTO `myapp_furniture_tag` VALUES ('27', '27', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('28', '28', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('29', '29', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('30', '30', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('33', '32', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('34', '33', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('35', '34', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('36', '35', '4');
INSERT INTO `myapp_furniture_tag` VALUES ('37', '36', '4');
INSERT INTO `myapp_furniture_tag` VALUES ('38', '37', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('39', '38', '2');
INSERT INTO `myapp_furniture_tag` VALUES ('40', '39', '3');
INSERT INTO `myapp_furniture_tag` VALUES ('41', '40', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('42', '41', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('43', '42', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('44', '43', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('45', '44', '4');
INSERT INTO `myapp_furniture_tag` VALUES ('46', '45', '3');
INSERT INTO `myapp_furniture_tag` VALUES ('47', '46', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('48', '47', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('49', '48', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('50', '49', '2');
INSERT INTO `myapp_furniture_tag` VALUES ('51', '50', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('52', '51', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('53', '52', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('54', '53', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('55', '54', '4');
INSERT INTO `myapp_furniture_tag` VALUES ('56', '55', '5');
INSERT INTO `myapp_furniture_tag` VALUES ('57', '56', '2');
INSERT INTO `myapp_furniture_tag` VALUES ('58', '57', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('59', '58', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('60', '59', '1');
INSERT INTO `myapp_furniture_tag` VALUES ('61', '60', '3');
INSERT INTO `myapp_furniture_tag` VALUES ('62', '61', '6');
INSERT INTO `myapp_furniture_tag` VALUES ('63', '62', '2');
INSERT INTO `myapp_furniture_tag` VALUES ('64', '63', '1');

-- ----------------------------
-- Table structure for `myapp_order`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_order`;
CREATE TABLE `myapp_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `price` varchar(10) NOT NULL,
  `order_state` varchar(10) NOT NULL,
  `staff` varchar(100) NOT NULL,
  `order_date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myApp_order_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_8bb2c78e` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_order
-- ----------------------------
INSERT INTO `myapp_order` VALUES ('38', '6', '3788.0', '评价完成', '主卧室双人 胡桃木床高箱储物抽屉床现代中式婚床', '2017-05-28');
INSERT INTO `myapp_order` VALUES ('39', '6', '2899.0', '评价完成', '布艺沙发大小户型可拆洗简约现代客厅家具整装转角U型组合沙发', '2017-05-28');
INSERT INTO `myapp_order` VALUES ('40', '6', '5388.0', '评价完成', '美式纯全木书柜双门玻璃门带抽屉展示柜白蜡木书橱装饰柜陈列柜', '2017-05-28');
INSERT INTO `myapp_order` VALUES ('41', '3', '6687.0', '评价完成', '主卧室双人 胡桃木床高箱储物抽屉床现代中式婚床', '2017-05-29');
INSERT INTO `myapp_order` VALUES ('42', '3', '7999.0', '评价完成', '【美式腔调-原创设计】美式乡村家具棉麻拉扣三人布艺沙发组合', '2017-05-15');
INSERT INTO `myapp_order` VALUES ('43', '3', '4500.0', '评价完成', '林氏木业现代中式木床1.5米1.8成人双人床简约婚床卧室家具', '2017-05-19');
INSERT INTO `myapp_order` VALUES ('44', '4', '7399.0', '评价完成', '布艺沙发大小户型可拆洗简约现代客厅家具整装转角U型组合沙发', '2017-05-19');
INSERT INTO `myapp_order` VALUES ('45', '5', '8999.0', '评价完成', '星之居/美式真皮沙发三人位/油蜡皮头层牛皮羽绒沙发单人位', '2017-05-20');
INSERT INTO `myapp_order` VALUES ('46', '5', '4500.0', '评价完成', '林氏木业现代中式木床1.5米1.8成人双人床简约婚床卧室家具', '2017-05-20');
INSERT INTO `myapp_order` VALUES ('47', '5', '2599.0', '评价完成', '林氏木业现代简约伸缩餐桌 小户型餐桌椅组合烤漆钢化玻璃饭桌', '2017-05-20');
INSERT INTO `myapp_order` VALUES ('48', '5', '15000.0', '评价完成', '奢家成套家具主卧套房家具卧室床衣柜组合套装整套组合六件套', '2017-05-20');
INSERT INTO `myapp_order` VALUES ('49', '5', '14218.0', '评价完成', '简式253地中海复古彩绘三门衣柜美式实木欧式复古雕刻鎏金大衣', '2017-05-20');
INSERT INTO `myapp_order` VALUES ('50', '5', '1699.0', '评价完成', '北欧实木餐桌椅组合橡木长方形饭桌家具', '2017-05-22');
INSERT INTO `myapp_order` VALUES ('51', '4', '9987.99', '评价完成', '美式纯全木书柜双门玻璃门带抽屉展示柜白蜡木书橱装饰柜陈列柜', '2017-05-22');
INSERT INTO `myapp_order` VALUES ('52', '3', '5388.0', '评价完成', '美式纯全木书柜双门玻璃门带抽屉展示柜白蜡木书橱装饰柜陈列柜', '2017-05-22');
INSERT INTO `myapp_order` VALUES ('53', '7', '16998.0', '评价完成', '星之居/美式真皮沙发三人位/油蜡皮头层牛皮羽绒沙发单人位', '2017-05-23');
INSERT INTO `myapp_order` VALUES ('54', '7', '1799.0', '评价完成', ' 复古家具新中式喝茶桌木桌子功夫茶几不规则大板桌原木全实木餐', '2017-05-23');
INSERT INTO `myapp_order` VALUES ('55', '8', '950.0', '评价完成', '美式家具 欧式田园乡村玄关柜地中海餐柜橱柜酒柜边柜 美式餐边', '2017-05-23');
INSERT INTO `myapp_order` VALUES ('56', '8', '15779.0', '评价完成', '奢家成套家具主卧套房家具卧室床衣柜组合套装整套组合六件套', '2017-05-24');
INSERT INTO `myapp_order` VALUES ('57', '8', '800.0', '评价完成', '田园茶几 实木象牙白色时尚简约客厅茶几组合特价 爆款抢购', '2017-05-25');
INSERT INTO `myapp_order` VALUES ('58', '8', '2599.0', '评价完成', '林氏木业现代简约伸缩餐桌 小户型餐桌椅组合烤漆钢化玻璃饭桌', '2017-05-26');
INSERT INTO `myapp_order` VALUES ('59', '9', '11485.0', '评价完成', '实木中式沙发 新中式 楠木沙发组合 真牛皮沙发客厅家具', '2017-05-27');
INSERT INTO `myapp_order` VALUES ('60', '9', '15000.0', '评价完成', '奢家成套家具主卧套房家具卧室床衣柜组合套装整套组合六件套', '2017-05-28');
INSERT INTO `myapp_order` VALUES ('61', '9', '7198.99', '评价完成', '澳林匹斯全实木床双人床 新古典床1.8米雕花美式床婚床欧式床', '2017-05-28');
INSERT INTO `myapp_order` VALUES ('62', '6', '10230.0', '评价完成', '实木中式沙发 新中式 楠木沙发组合 真牛皮沙发客厅家具', '2017-05-28');
INSERT INTO `myapp_order` VALUES ('63', '6', '499.0', '评价完成', 'ZOMO 温莎椅 全实木餐椅 白橡木餐椅 纯实木家具 餐桌椅', '2017-05-29');
INSERT INTO `myapp_order` VALUES ('64', '6', '8799.0', '评价完成', '大理石茶几电视柜组合套装简约现代客厅成套家具小户型伸缩茶几', '2017-05-29');
INSERT INTO `myapp_order` VALUES ('65', '3', '779.0', '评价完成', '宜家实木餐桌椅组合 约克马克一桌四椅子成套装 简约现代餐厅家', '2017-05-30');
INSERT INTO `myapp_order` VALUES ('66', '8', '9888.0', '评价完成', '美式纯全木书柜双门玻璃门带抽屉展示柜白蜡木书橱装饰柜陈列柜', '2017-05-30');
INSERT INTO `myapp_order` VALUES ('67', '9', '1988.0', '评价完成', '拉扣布艺沙发组合客厅地中海田园风格简约三人整装小户型', '2017-05-30');
INSERT INTO `myapp_order` VALUES ('68', '10', '10475.0', '未发货', '主卧室双人 胡桃木床高箱储物抽屉床现代中式婚床', '2019-01-31');
INSERT INTO `myapp_order` VALUES ('69', '10', '13799.0', '已收货', '原木床中式卧室家具双人床高箱储物床婚床 高箱床 ', '2019-02-01');

-- ----------------------------
-- Table structure for `myapp_order_list`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_order_list`;
CREATE TABLE `myapp_order_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `furniture` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `remark` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `list_date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myApp_order_list_68d25c7a` (`order_id`),
  CONSTRAINT `order_id_refs_id_2a7c4c07` FOREIGN KEY (`order_id`) REFERENCES `myapp_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_order_list
-- ----------------------------
INSERT INTO `myapp_order_list` VALUES ('53', '主卧室双人 胡桃木床高箱储物抽屉床现代中式婚床', '1', '38', '1', '6', '2017-05-28');
INSERT INTO `myapp_order_list` VALUES ('54', '布艺沙发大小户型可拆洗简约现代客厅家具整装转角U型组合沙发', '1', '39', '1', '6', '2017-05-28');
INSERT INTO `myapp_order_list` VALUES ('55', '美式纯全木书柜双门玻璃门带抽屉展示柜白蜡木书橱装饰柜陈列柜', '1', '40', '1', '6', '2017-05-28');
INSERT INTO `myapp_order_list` VALUES ('56', '主卧室双人 胡桃木床高箱储物抽屉床现代中式婚床', '1', '41', '1', '3', '2017-05-29');
INSERT INTO `myapp_order_list` VALUES ('57', '布艺沙发大小户型可拆洗简约现代客厅家具整装转角U型组合沙发', '1', '41', '1', '3', '2017-05-29');
INSERT INTO `myapp_order_list` VALUES ('58', '【美式腔调-原创设计】美式乡村家具棉麻拉扣三人布艺沙发组合', '1', '42', '1', '3', '2017-05-15');
INSERT INTO `myapp_order_list` VALUES ('59', '林氏木业现代中式木床1.5米1.8成人双人床简约婚床卧室家具', '1', '43', '1', '3', '2017-05-19');
INSERT INTO `myapp_order_list` VALUES ('60', '布艺沙发大小户型可拆洗简约现代客厅家具整装转角U型组合沙发', '1', '44', '1', '4', '2017-05-19');
INSERT INTO `myapp_order_list` VALUES ('61', '林氏木业现代中式木床1.5米1.8成人双人床简约婚床卧室家具', '1', '44', '1', '4', '2017-05-19');
INSERT INTO `myapp_order_list` VALUES ('62', '星之居/美式真皮沙发三人位/油蜡皮头层牛皮羽绒沙发单人位', '1', '45', '1', '5', '2017-05-19');
INSERT INTO `myapp_order_list` VALUES ('63', '林氏木业现代中式木床1.5米1.8成人双人床简约婚床卧室家具', '1', '46', '1', '5', '2017-05-20');
INSERT INTO `myapp_order_list` VALUES ('64', '林氏木业现代简约伸缩餐桌 小户型餐桌椅组合烤漆钢化玻璃饭桌', '1', '47', '1', '5', '2017-05-20');
INSERT INTO `myapp_order_list` VALUES ('65', '奢家成套家具主卧套房家具卧室床衣柜组合套装整套组合六件套', '1', '48', '1', '5', '2017-05-20');
INSERT INTO `myapp_order_list` VALUES ('66', '简式253地中海复古彩绘三门衣柜美式实木欧式复古雕刻鎏金大衣', '1', '49', '1', '5', '2017-05-20');
INSERT INTO `myapp_order_list` VALUES ('67', '实木中式沙发 新中式 楠木沙发组合 真牛皮沙发客厅家具', '1', '49', '1', '5', '2017-05-20');
INSERT INTO `myapp_order_list` VALUES ('68', '北欧实木餐桌椅组合橡木长方形饭桌家具', '1', '50', '1', '5', '2017-05-22');
INSERT INTO `myapp_order_list` VALUES ('69', '美式纯全木书柜双门玻璃门带抽屉展示柜白蜡木书橱装饰柜陈列柜', '1', '51', '1', '4', '2017-05-22');
INSERT INTO `myapp_order_list` VALUES ('70', '澳林匹斯全实木床双人床 新古典床1.8米雕花美式床婚床欧式床', '1', '51', '1', '4', '2017-05-22');
INSERT INTO `myapp_order_list` VALUES ('71', '美式纯全木书柜双门玻璃门带抽屉展示柜白蜡木书橱装饰柜陈列柜', '1', '52', '1', '3', '2017-05-22');
INSERT INTO `myapp_order_list` VALUES ('72', '星之居/美式真皮沙发三人位/油蜡皮头层牛皮羽绒沙发单人位', '1', '53', '1', '7', '2017-05-22');
INSERT INTO `myapp_order_list` VALUES ('73', '【美式腔调-原创设计】美式乡村家具棉麻拉扣三人布艺沙发组合', '1', '53', '1', '7', '2017-05-22');
INSERT INTO `myapp_order_list` VALUES ('74', ' 复古家具新中式喝茶桌木桌子功夫茶几不规则大板桌原木全实木餐', '1', '54', '1', '7', '2017-05-23');
INSERT INTO `myapp_order_list` VALUES ('75', '美式家具 欧式田园乡村玄关柜地中海餐柜橱柜酒柜边柜 美式餐边', '1', '55', '1', '8', '2017-05-23');
INSERT INTO `myapp_order_list` VALUES ('76', '奢家成套家具主卧套房家具卧室床衣柜组合套装整套组合六件套', '1', '56', '1', '8', '2017-05-24');
INSERT INTO `myapp_order_list` VALUES ('77', '宜家实木餐桌椅组合 约克马克一桌四椅子成套装 简约现代餐厅家', '1', '56', '1', '8', '2017-05-24');
INSERT INTO `myapp_order_list` VALUES ('78', '田园茶几 实木象牙白色时尚简约客厅茶几组合特价 爆款抢购', '1', '57', '1', '8', '2017-05-25');
INSERT INTO `myapp_order_list` VALUES ('79', '林氏木业现代简约伸缩餐桌 小户型餐桌椅组合烤漆钢化玻璃饭桌', '1', '58', '1', '8', '2017-05-26');
INSERT INTO `myapp_order_list` VALUES ('80', '实木中式沙发 新中式 楠木沙发组合 真牛皮沙发客厅家具', '1', '59', '1', '9', '2017-05-26');
INSERT INTO `myapp_order_list` VALUES ('81', '欧式美式鞋柜实木家具中式门厅间断玄关柜描金收纳柜餐边柜子包邮', '1', '59', '1', '9', '2017-05-26');
INSERT INTO `myapp_order_list` VALUES ('82', '奢家成套家具主卧套房家具卧室床衣柜组合套装整套组合六件套', '1', '60', '1', '9', '2017-05-27');
INSERT INTO `myapp_order_list` VALUES ('83', '澳林匹斯全实木床双人床 新古典床1.8米雕花美式床婚床欧式床', '1', '61', '1', '9', '2017-05-28');
INSERT INTO `myapp_order_list` VALUES ('84', '林氏木业现代简约伸缩餐桌 小户型餐桌椅组合烤漆钢化玻璃饭桌', '1', '61', '1', '9', '2017-05-28');
INSERT INTO `myapp_order_list` VALUES ('85', '实木中式沙发 新中式 楠木沙发组合 真牛皮沙发客厅家具', '1', '62', '1', '6', '2017-05-28');
INSERT INTO `myapp_order_list` VALUES ('86', 'ZOMO 温莎椅 全实木餐椅 白橡木餐椅 纯实木家具 餐桌椅', '1', '63', '1', '6', '2017-05-29');
INSERT INTO `myapp_order_list` VALUES ('87', '大理石茶几电视柜组合套装简约现代客厅成套家具小户型伸缩茶几', '1', '64', '1', '6', '2017-05-29');
INSERT INTO `myapp_order_list` VALUES ('88', '宜家实木餐桌椅组合 约克马克一桌四椅子成套装 简约现代餐厅家', '1', '65', '1', '3', '2017-05-30');
INSERT INTO `myapp_order_list` VALUES ('89', '美式纯全木书柜双门玻璃门带抽屉展示柜白蜡木书橱装饰柜陈列柜', '1', '66', '1', '8', '2017-05-30');
INSERT INTO `myapp_order_list` VALUES ('90', '林氏木业现代中式木床1.5米1.8成人双人床简约婚床卧室家具', '1', '66', '1', '8', '2017-05-30');
INSERT INTO `myapp_order_list` VALUES ('91', '拉扣布艺沙发组合客厅地中海田园风格简约三人整装小户型', '1', '67', '1', '9', '2017-05-30');
INSERT INTO `myapp_order_list` VALUES ('92', '主卧室双人 胡桃木床高箱储物抽屉床现代中式婚床', '2', '68', '0', '10', '2019-01-31');
INSERT INTO `myapp_order_list` VALUES ('93', '布艺沙发大小户型可拆洗简约现代客厅家具整装转角U型组合沙发', '1', '68', '0', '10', '2019-01-31');
INSERT INTO `myapp_order_list` VALUES ('94', '原木床中式卧室家具双人床高箱储物床婚床 高箱床 ', '2', '69', '1', '10', '2019-02-01');
INSERT INTO `myapp_order_list` VALUES ('95', '【美式腔调-原创设计】美式乡村家具棉麻拉扣三人布艺沙发组合', '1', '69', '1', '10', '2019-02-01');

-- ----------------------------
-- Table structure for `myapp_size`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_size`;
CREATE TABLE `myapp_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `index` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_size
-- ----------------------------
INSERT INTO `myapp_size` VALUES ('1', '1800*2000', '1');
INSERT INTO `myapp_size` VALUES ('2', '1500*2000', '2');
INSERT INTO `myapp_size` VALUES ('3', '单人位', '3');
INSERT INTO `myapp_size` VALUES ('4', '双人位', '4');
INSERT INTO `myapp_size` VALUES ('5', '三人位', '5');
INSERT INTO `myapp_size` VALUES ('6', '1+2+3+茶几', '6');
INSERT INTO `myapp_size` VALUES ('7', '1400*800', '7');
INSERT INTO `myapp_size` VALUES ('8', '默认', '8');

-- ----------------------------
-- Table structure for `myapp_tag`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_tag`;
CREATE TABLE `myapp_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_tag
-- ----------------------------
INSERT INTO `myapp_tag` VALUES ('1', '简约');
INSERT INTO `myapp_tag` VALUES ('2', '美式');
INSERT INTO `myapp_tag` VALUES ('3', '欧式');
INSERT INTO `myapp_tag` VALUES ('4', '中式');
INSERT INTO `myapp_tag` VALUES ('5', '地中海');
INSERT INTO `myapp_tag` VALUES ('6', '北欧');

-- ----------------------------
-- Table structure for `myapp_user`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_user`;
CREATE TABLE `myapp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_user
-- ----------------------------
INSERT INTO `myapp_user` VALUES ('1', 'pbkdf2_sha256$20000$y1UsMf00gaVG$E32G5RRFFXKWiiwT8CP8vUFdMWRvEiTyJhNEUOkN16E=', '2019-02-01 05:46:04', '1', 'admin', '', '', 'admin@123.com', '1', '1', '2017-05-06 01:38:31', '', '', null);
INSERT INTO `myapp_user` VALUES ('3', 'pbkdf2_sha256$12000$mwLoEEKbAiWj$GS0R9uNvWn0W0MR1KYHEYoAP/osW1xxuGmXyREIPra0=', '2017-05-30 00:34:10', '0', 'jack', '', '', 'jack@123.com', '0', '1', '2017-05-06 02:33:45', '南京', '123456789', null);
INSERT INTO `myapp_user` VALUES ('4', 'pbkdf2_sha256$12000$XDDvJ3LL0dBE$2yVFtTEhnUv8P6BtLZBKEVrBhaKGF/jE8gprw8J4m6w=', '2017-05-29 06:56:36', '0', 'rose', '', '', 'rose@qq.com', '0', '1', '2017-05-09 02:53:18', '南京', '18362983753', null);
INSERT INTO `myapp_user` VALUES ('5', 'pbkdf2_sha256$12000$k6ZjisAwi47U$me815XrLYnqY/vi7Gd5IPQrGOdevFtvy90nRXy2ZOD4=', '2017-05-29 09:17:33', '0', 'sara', '', '', 'sara@123.com', '0', '1', '2017-05-09 02:53:58', '无锡', '123456', null);
INSERT INTO `myapp_user` VALUES ('6', 'pbkdf2_sha256$12000$MyKVKEm1w73J$rpifiYD4r8Shc9hN3FTAE1P9kYk7QQpFjRhTu+FInaE=', '2017-05-29 07:00:28', '0', 'tom', '', '', 'tom@123.com', '0', '1', '2017-05-09 02:54:55', '苏州', '123456', null);
INSERT INTO `myapp_user` VALUES ('7', 'pbkdf2_sha256$12000$DEeIThG0l4cx$+WGTMd0lrkPejfpX2ZlNDt/hzFSMX+kqA/bVApgDJiA=', '2017-05-22 05:57:50', '0', 'emily', '', '', 'emily@qq.com', '0', '1', '2017-05-09 02:55:35', '南京', '123456', null);
INSERT INTO `myapp_user` VALUES ('8', 'pbkdf2_sha256$12000$H0yfmLWeldG0$GV6E9mc84AgUCxx7/7i6duOsgHSpzd5wWN9l3/XKt+8=', '2017-05-30 00:39:05', '0', 'hanna', '', '', 'hanna', '0', '1', '2017-05-09 07:52:48', '南京', '1234567', null);
INSERT INTO `myapp_user` VALUES ('9', 'pbkdf2_sha256$12000$1bI6P7Gw8h6H$yqZAtJ/gHpDPz/OKXRr4B4O8hGNYfbrDwQtv386G8fU=', '2017-05-30 03:54:50', '0', 'emma', '', '', 'emma@123.com', '0', '1', '2017-05-09 08:00:34', '北京', '1234', null);
INSERT INTO `myapp_user` VALUES ('10', 'pbkdf2_sha256$20000$GCuelespzlSB$YTUATXryrms6Mxa7G1Pgn7+LBCLY6Gy616oh78MnVW4=', '2019-02-01 05:43:43', '0', 'user1', '', '', 'zhanghan@163.com', '0', '1', '2019-01-31 15:26:18', '四川成都红星路', '13084050143', null);

-- ----------------------------
-- Table structure for `myapp_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_user_groups`;
CREATE TABLE `myapp_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `myApp_user_groups_6340c63c` (`user_id`),
  KEY `myApp_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_6fd162bb` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_4c8d6c6e` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `myapp_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `myapp_user_user_permissions`;
CREATE TABLE `myapp_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `myApp_user_user_permissions_6340c63c` (`user_id`),
  KEY `myApp_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_dd08e214` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_cd89e45d` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myapp_user_user_permissions
-- ----------------------------
