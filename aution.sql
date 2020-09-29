
/*111
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : aution

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2019-05-12 14:44:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `authority` int(11) DEFAULT '0' COMMENT '0-	超级管理员',
  `status` int(11) DEFAULT '1' COMMENT '1-启用 0-禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '0', '1');
INSERT INTO `admin` VALUES ('2', 'lucy', '123', '1', '1');
INSERT INTO `admin` VALUES ('3', 'jack', '123', '2', '0');
INSERT INTO `admin` VALUES ('4', 'mark', '123', '3', '1');
INSERT INTO `admin` VALUES ('5', 'tom', '123', '4', '1');
INSERT INTO `admin` VALUES ('6', 'kenny', '123456', '1', '1');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT NULL COMMENT '0-新闻公告、1-拍卖结果、2-系统消息\r\n',
  `content` varchar(255) DEFAULT NULL,
  `browseTimes` int(11) DEFAULT NULL,
  `releaseTime` datetime DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0-草稿 1-已上线',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '12333发布了拍卖品October手表', '0', '12333发布了拍卖品‘October手表’欢迎各大拍卖手们前来抢拍', '23', '2019-02-22 17:24:33', '36', '1');
INSERT INTO `article` VALUES ('2', '恭喜15236成功拍卖到国产汽车', '0', '恭喜15236成功拍卖到国产汽车。！！', '25', '2019-01-28 09:08:56', '36', '1');
INSERT INTO `article` VALUES ('8', '恭喜15236用户成功拍卖宝马车', '1', '恭喜15236用户成功拍卖宝马车,本次拍卖成交价15w元人民币，创造历史新高！', '0', '2019-01-27 10:38:04', '36', '0');
INSERT INTO `article` VALUES ('9', '恭喜15236成功拍卖到国产汽车。！！1', '1', '恭喜15236成功拍卖到国产汽车。！！contentfff', '5', '2019-01-27 10:59:39', '36', '0');
INSERT INTO `article` VALUES ('10', '恭喜15236成功拍卖到国产汽车。！！1', '1', '恭喜15236成功拍卖到国产汽车。！！contentfff', '11', '2019-01-27 11:00:04', '36', '1');
INSERT INTO `article` VALUES ('11', '恭喜15236成功拍卖到国产汽车。！！1', '1', '恭喜15236成功拍卖到国产汽车。！！contentfff', '13', '2019-01-24 16:41:15', '36', '1');
INSERT INTO `article` VALUES ('12', '恭喜15236成功拍卖到国产汽车。！！1', '1', '恭喜15236成功拍卖到国产汽车。！！contentfff', '22', '2019-01-24 16:41:18', '36', '1');
INSERT INTO `article` VALUES ('13', '恭喜15236成功拍卖到国产汽车。！！1', '2', '恭喜15236成功拍卖到国产汽车。！！contentfff', '1', '2019-01-09 16:41:22', '36', '1');
INSERT INTO `article` VALUES ('14', '恭喜15236成功拍卖到国产汽车。！！1', '1', '恭喜15236成功拍卖到国产汽车。！！contentfff', '0', '2019-01-18 16:41:25', '36', '0');
INSERT INTO `article` VALUES ('15', '恭喜15236成功拍卖到国产汽车。！！1', '2', '恭喜15236成功拍卖到国产汽车。！！contentfff', '14', '2019-01-22 16:41:29', '36', '1');
INSERT INTO `article` VALUES ('16', '恭喜15236成功拍卖到国产汽车。！！1', '2', '恭喜15236成功拍卖到国产汽车。！！contentfff', '13', '2019-01-16 16:41:34', '36', '1');
INSERT INTO `article` VALUES ('17', '恭喜15236成功拍卖到国产汽车。！！1', '1', '恭喜15236成功拍卖到国产汽车。！！contentfff', '18', '2019-01-20 16:41:40', '36', '0');
INSERT INTO `article` VALUES ('18', '恭喜15236成功拍卖到国产汽车。！！1', '1', '恭喜15236成功拍卖到国产汽车。！！contentfff', '120', '2019-01-08 16:41:43', '36', '1');
INSERT INTO `article` VALUES ('19', '恭喜15236成功拍卖到国产汽车。gdfgdfgdfdfdsfsd', '0', '恭喜15236成功拍卖到国产汽车。', '1002', '2019-01-28 12:42:25', '36', '1');
INSERT INTO `article` VALUES ('20', '恭喜15236成功拍卖到国产汽车。！！1', '1', '恭喜15236成功拍卖到国产汽车。！！contentfff', '11', '2019-01-23 16:41:51', '36', '1');
INSERT INTO `article` VALUES ('21', '恭喜15236成功拍卖到国产汽车。！！1', '1', '恭喜15236成功拍卖到国产汽车。！！contentfff', '10', '2019-01-27 11:02:05', '36', '1');
INSERT INTO `article` VALUES ('22', '恭喜15236成功拍卖到国产汽车。！！1', '1', '恭喜15236成功拍卖到国产汽车。！！contentfff', '6', '2019-01-01 16:41:59', '36', '1');
INSERT INTO `article` VALUES ('68', '恭喜185625用户成功拍卖青花瓷一件', '1', '恭喜185625用户成功拍卖青花瓷一件，成交价为1w元人民币。', '0', '2019-01-28 12:22:51', null, '1');
INSERT INTO `article` VALUES ('69', '用户152632发布了一件拍卖品‘笔记本电脑’', '0', '用户152632发布了一件拍卖品‘笔记本电脑’，欢迎各位拍卖手们前来抢拍。', '0', '2019-01-28 12:21:50', null, '0');
INSERT INTO `article` VALUES ('70', '【系统消息】您已经成功拍卖青花瓷', '2', '您已经成功拍卖青花瓷。【系统消息，无需回复】', '0', '2019-01-28 12:26:31', null, '0');
INSERT INTO `article` VALUES ('71', '【系统消息】很遗憾，你参与的拍卖被175255用户抢拍了', '2', '很遗憾，你参与的拍卖被175255用户抢拍了。【系统消息，无需回复】', '0', '2019-01-28 12:27:52', null, '1');
INSERT INTO `article` VALUES ('72', 'aaa', '2', 'aaaaa', '0', '2019-02-03 12:27:33', null, '1');
INSERT INTO `article` VALUES ('73', 'qqq', '0', 'qqqqq', '0', '2019-02-03 12:27:42', null, '0');
INSERT INTO `article` VALUES ('74', '11111', '0', '1211211', '0', '2019-05-09 17:01:23', '36', '1');

-- ----------------------------
-- Table structure for bidding
-- ----------------------------
DROP TABLE IF EXISTS `bidding`;
CREATE TABLE `bidding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `opTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0' COMMENT '竞价状态：1-竞价 10-竞拍成功 11-竞拍失败  2-交了保证金 20-保证金已经退还 21-保证金抵押拍卖价格',
  PRIMARY KEY (`id`),
  KEY `deposit_ibfk_2` (`buyer_id`),
  KEY `deposit_ibfk_3` (`pro_id`),
  CONSTRAINT `deposit_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`id`),
  CONSTRAINT `deposit_ibfk_3` FOREIGN KEY (`pro_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bidding
-- ----------------------------
INSERT INTO `bidding` VALUES ('1', '1', '6', '100', '2018-06-21 16:42:29', '2');
INSERT INTO `bidding` VALUES ('2', '1', '7', '100', '2018-06-21 16:42:29', '20');
INSERT INTO `bidding` VALUES ('3', '2', '6', '70', '2018-06-21 16:42:29', '21');
INSERT INTO `bidding` VALUES ('4', '3', '6', '26000', '2018-06-21 16:42:29', '1');
INSERT INTO `bidding` VALUES ('6', '5', '8', '40000', '2018-06-21 16:42:29', '2');
INSERT INTO `bidding` VALUES ('8', '6', '7', '70000', '2018-06-21 16:42:29', '10');
INSERT INTO `bidding` VALUES ('10', '7', '9', '20000', '2018-06-21 16:42:29', '11');
INSERT INTO `bidding` VALUES ('11', '8', '8', '1580', '2018-06-21 16:42:29', '2');
INSERT INTO `bidding` VALUES ('12', '10', '4', '240', '2018-06-21 16:42:29', '2');
INSERT INTO `bidding` VALUES ('13', '11', '10', '600', '2018-06-21 16:42:29', '2');
INSERT INTO `bidding` VALUES ('14', '15', '8', '2000', '2018-06-21 16:42:29', '2');
INSERT INTO `bidding` VALUES ('16', '17', '18', '340', '2018-06-21 16:42:29', '2');
INSERT INTO `bidding` VALUES ('17', '17', '18', '2720', '2018-06-21 16:42:29', '2');
INSERT INTO `bidding` VALUES ('20', '17', '7', '340', '2018-06-21 16:42:29', '2');
INSERT INTO `bidding` VALUES ('21', '17', '7', '3060', '2018-06-21 16:42:29', '2');
INSERT INTO `bidding` VALUES ('24', '21', '18', '100', '2018-06-21 16:54:09', '2');
INSERT INTO `bidding` VALUES ('25', '21', '18', '625', '2018-06-21 16:54:20', '2');
INSERT INTO `bidding` VALUES ('26', '21', '7', '100', '2018-06-21 16:56:04', '2');
INSERT INTO `bidding` VALUES ('27', '21', '7', '750', '2018-06-21 16:56:14', '2');
INSERT INTO `bidding` VALUES ('28', '17', '18', '3400', '2018-06-22 08:28:30', '2');
INSERT INTO `bidding` VALUES ('29', '18', '18', '200', '2018-06-22 10:28:53', '2');
INSERT INTO `bidding` VALUES ('30', '18', '18', '1600', '2018-06-22 10:29:09', '2');
INSERT INTO `bidding` VALUES ('31', '20', '18', '20', '2018-06-23 15:29:33', '1');
INSERT INTO `bidding` VALUES ('32', '33', '18', '24', '2018-06-24 11:17:07', '2');
INSERT INTO `bidding` VALUES ('33', '19', '18', '40', '2018-06-24 11:29:32', '2');
INSERT INTO `bidding` VALUES ('34', '21', '3', '100', '2018-06-24 12:19:38', '2');
INSERT INTO `bidding` VALUES ('35', '17', '22', '340', '2018-06-24 15:17:53', '2');
INSERT INTO `bidding` VALUES ('36', '34', '3', '120', '2018-06-24 16:46:56', '2');
INSERT INTO `bidding` VALUES ('37', '20', '3', '20', '2018-06-24 17:08:09', '1');
INSERT INTO `bidding` VALUES ('38', '20', '3', '155', '2018-06-24 17:10:22', '1');
INSERT INTO `bidding` VALUES ('39', '20', '24', '20', '2018-06-24 17:15:41', '1');
INSERT INTO `bidding` VALUES ('40', '33', '3', '24', '2018-06-24 17:17:43', '2');
INSERT INTO `bidding` VALUES ('41', '33', '3', '210', '2018-06-24 17:17:51', '1');
INSERT INTO `bidding` VALUES ('42', '20', '18', '160', '2018-06-24 17:21:41', '1');
INSERT INTO `bidding` VALUES ('43', '20', '3', '165', '2018-06-24 22:46:38', '1');
INSERT INTO `bidding` VALUES ('44', '20', '24', '170', '2018-06-24 22:51:47', '1');
INSERT INTO `bidding` VALUES ('45', '20', '18', '175', '2018-06-24 22:52:17', '1');
INSERT INTO `bidding` VALUES ('46', '20', '2', '20', '2018-06-24 22:55:30', '2');
INSERT INTO `bidding` VALUES ('47', '20', '2', '180', '2018-06-24 22:56:35', '1');
INSERT INTO `bidding` VALUES ('48', '20', '18', '185', '2018-06-24 22:57:03', '1');
INSERT INTO `bidding` VALUES ('49', '20', '8', '20', '2018-06-24 23:12:50', '2');
INSERT INTO `bidding` VALUES ('50', '20', '8', '190', '2018-06-24 23:13:43', '1');
INSERT INTO `bidding` VALUES ('51', '20', '18', '20', '2018-06-24 23:27:44', '2');
INSERT INTO `bidding` VALUES ('52', '20', '18', '200', '2018-06-24 23:27:45', '1');
INSERT INTO `bidding` VALUES ('53', '20', '19', '20', '2018-06-24 23:27:56', '2');
INSERT INTO `bidding` VALUES ('54', '20', '19', '220', '2018-06-24 23:27:56', '1');
INSERT INTO `bidding` VALUES ('55', '20', '20', '20', '2018-06-24 23:28:49', '2');
INSERT INTO `bidding` VALUES ('56', '20', '20', '220', '2018-06-24 23:28:49', '1');
INSERT INTO `bidding` VALUES ('57', '20', '21', '20', '2018-06-24 23:28:49', '2');
INSERT INTO `bidding` VALUES ('58', '20', '21', '230', '2018-06-24 23:28:49', '1');
INSERT INTO `bidding` VALUES ('59', '20', '22', '20', '2018-06-24 23:28:49', '2');
INSERT INTO `bidding` VALUES ('60', '20', '22', '240', '2018-06-24 23:28:50', '1');
INSERT INTO `bidding` VALUES ('61', '20', '23', '20', '2018-06-24 23:28:50', '2');
INSERT INTO `bidding` VALUES ('62', '20', '23', '250', '2018-06-24 23:28:50', '1');
INSERT INTO `bidding` VALUES ('63', '20', '24', '20', '2018-06-24 23:28:50', '2');
INSERT INTO `bidding` VALUES ('64', '20', '24', '260', '2018-06-24 23:28:50', '1');
INSERT INTO `bidding` VALUES ('65', '20', '1', '275', '2018-06-24 23:30:54', '1');
INSERT INTO `bidding` VALUES ('66', '20', '2', '280', '2018-06-24 23:30:54', '1');
INSERT INTO `bidding` VALUES ('67', '20', '3', '290', '2018-06-24 23:30:54', '1');
INSERT INTO `bidding` VALUES ('68', '20', '4', '300', '2018-06-24 23:30:54', '1');
INSERT INTO `bidding` VALUES ('69', '20', '5', '320', '2018-06-24 23:30:54', '1');
INSERT INTO `bidding` VALUES ('70', '20', '6', '310', '2018-06-24 23:30:54', '1');
INSERT INTO `bidding` VALUES ('71', '20', '7', '330', '2018-06-24 23:30:54', '1');
INSERT INTO `bidding` VALUES ('72', '20', '9', '335', '2018-06-24 23:30:55', '1');
INSERT INTO `bidding` VALUES ('73', '20', '18', '195', '2018-06-27 21:47:02', '1');
INSERT INTO `bidding` VALUES ('74', '20', '18', '200', '2018-06-27 22:20:08', '1');
INSERT INTO `bidding` VALUES ('75', '20', '18', '340', '2018-06-27 22:38:44', '1');
INSERT INTO `bidding` VALUES ('76', '2', '18', '70', '2018-07-02 10:03:16', '2');
INSERT INTO `bidding` VALUES ('77', '20', '4', '345', '2018-07-02 22:32:46', '1');
INSERT INTO `bidding` VALUES ('78', '2', '26', '70', '2019-01-03 13:45:36', '2');
INSERT INTO `bidding` VALUES ('79', '2', '26', '402.5', '2019-01-03 13:47:01', '1');
INSERT INTO `bidding` VALUES ('80', '2', '2', '70', '2019-01-03 14:08:15', '2');
INSERT INTO `bidding` VALUES ('81', '2', '2', '420', '2019-01-03 14:15:49', '1');
INSERT INTO `bidding` VALUES ('82', '1', '26', '100', '2019-01-03 16:43:38', '2');
INSERT INTO `bidding` VALUES ('83', '1', '26', '1525', '2019-01-03 16:45:22', '1');
INSERT INTO `bidding` VALUES ('84', '2', '26', '455', '2019-01-03 18:41:26', '1');
INSERT INTO `bidding` VALUES ('85', '10', '26', '240', '2019-01-04 09:40:54', '2');
INSERT INTO `bidding` VALUES ('86', '10', '26', '1320', '2019-01-04 09:41:16', '1');
INSERT INTO `bidding` VALUES ('87', '10', '3', '240', '2019-01-04 10:15:40', '2');
INSERT INTO `bidding` VALUES ('88', '10', '3', '1380', '2019-01-04 10:15:52', '1');
INSERT INTO `bidding` VALUES ('89', '10', '3', '1440', '2019-01-04 10:16:38', '1');
INSERT INTO `bidding` VALUES ('90', '10', '3', '1500', '2019-01-04 10:17:08', '1');
INSERT INTO `bidding` VALUES ('91', '10', '3', '1560', '2019-01-04 10:20:15', '1');
INSERT INTO `bidding` VALUES ('92', '11', '11', '600', '2019-01-04 16:34:00', '2');
INSERT INTO `bidding` VALUES ('93', '11', '11', '3300', '2019-01-04 16:34:08', '1');
INSERT INTO `bidding` VALUES ('96', '2', '3', '70', '2019-04-12 12:40:29', '2');
INSERT INTO `bidding` VALUES ('98', '2', '3', '490', '2019-04-12 13:13:14', '1');
INSERT INTO `bidding` VALUES ('100', '2', '3', '507', '2019-04-12 13:14:47', '1');
INSERT INTO `bidding` VALUES ('101', '2', '26', '524', '2019-04-12 13:16:15', '1');
INSERT INTO `bidding` VALUES ('102', '2', '3', '541', '2019-04-12 14:01:24', '1');
INSERT INTO `bidding` VALUES ('103', '2', '26', '558', '2019-04-13 09:36:39', '1');
INSERT INTO `bidding` VALUES ('104', '2', '3', '593', '2019-04-13 09:37:47', '1');
INSERT INTO `bidding` VALUES ('105', '10', '26', '1620', '2019-04-13 10:34:37', '1');
INSERT INTO `bidding` VALUES ('107', '2', '26', '628', '2019-04-13 11:17:14', '1');
INSERT INTO `bidding` VALUES ('108', '20', '10', '20', '2019-04-25 11:36:03', '2');
INSERT INTO `bidding` VALUES ('109', '22', '10', '100', '2019-04-25 12:01:36', '2');
INSERT INTO `bidding` VALUES ('110', '46', '26', '40', '2019-05-05 20:39:13', '21');
INSERT INTO `bidding` VALUES ('111', '46', '26', '220', '2019-05-05 20:39:29', '11');
INSERT INTO `bidding` VALUES ('112', '46', '2', '40', '2019-05-05 20:52:32', '20');
INSERT INTO `bidding` VALUES ('113', '46', '2', '240', '2019-05-05 20:52:40', '11');
INSERT INTO `bidding` VALUES ('114', '46', '7', '40', '2019-05-05 20:54:21', '20');
INSERT INTO `bidding` VALUES ('115', '46', '7', '250', '2019-05-05 20:54:27', '11');
INSERT INTO `bidding` VALUES ('116', '46', '26', '280', '2019-05-05 20:54:55', '10');
INSERT INTO `bidding` VALUES ('119', '52', '24', '40', '2019-05-05 23:16:14', '20');
INSERT INTO `bidding` VALUES ('120', '52', '24', '300', '2019-05-05 23:16:25', '11');
INSERT INTO `bidding` VALUES ('121', '52', '22', '40', '2019-05-05 23:17:14', '20');
INSERT INTO `bidding` VALUES ('122', '52', '22', '310', '2019-05-05 23:17:20', '11');
INSERT INTO `bidding` VALUES ('124', '21', '26', '100', '2019-05-06 14:22:08', '2');
INSERT INTO `bidding` VALUES ('125', '21', '26', '100', '2019-05-06 14:22:13', '2');
INSERT INTO `bidding` VALUES ('126', '21', '26', '550', '2019-05-06 14:22:20', '1');
INSERT INTO `bidding` VALUES ('127', '21', '2', '100', '2019-05-06 14:23:30', '2');
INSERT INTO `bidding` VALUES ('128', '21', '2', '600', '2019-05-06 14:23:39', '1');
INSERT INTO `bidding` VALUES ('131', '52', '24', '40', '2019-05-08 15:00:28', '2');
INSERT INTO `bidding` VALUES ('132', '52', '24', '480', '2019-05-08 15:00:35', '1');
INSERT INTO `bidding` VALUES ('133', '10', '2', '240', '2019-05-08 16:45:05', '2');
INSERT INTO `bidding` VALUES ('134', '10', '2', '1680', '2019-05-08 16:45:13', '1');
INSERT INTO `bidding` VALUES ('135', '28', '26', '800', '2019-05-11 22:11:30', '2');
INSERT INTO `bidding` VALUES ('136', '28', '26', '4400', '2019-05-11 22:11:52', '1');
INSERT INTO `bidding` VALUES ('137', '58', '26', '10', '2019-05-12 11:11:16', '20');
INSERT INTO `bidding` VALUES ('138', '58', '26', '80', '2019-05-12 11:12:39', '11');
INSERT INTO `bidding` VALUES ('139', '58', '42', '10', '2019-05-12 11:13:26', '21');
INSERT INTO `bidding` VALUES ('140', '58', '42', '95', '2019-05-12 11:13:33', '10');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `originalPost_id` int(11) DEFAULT NULL,
  `commentTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pro_id` (`pro_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_ibfk_3` (`originalPost_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`originalPost_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('8', '21', '11', 'Great！', null, '2019-04-20 14:53:37');
INSERT INTO `comment` VALUES ('9', '21', '11', '挺热闹啊！', null, '2019-04-20 14:54:43');
INSERT INTO `comment` VALUES ('10', '21', '10', '哈哈哈', '8', '2019-04-20 15:21:56');
INSERT INTO `comment` VALUES ('11', '21', '10', '宝贝不错哟', null, '2019-04-20 15:23:51');
INSERT INTO `comment` VALUES ('12', '21', '10', '我出500', null, '2019-04-20 15:33:31');
INSERT INTO `comment` VALUES ('13', '2', '26', ' good！', null, '2019-04-22 11:11:11');
INSERT INTO `comment` VALUES ('15', '2', '26', '哈哈', '13', '2019-04-23 11:18:13');
INSERT INTO `comment` VALUES ('17', '2', '3', '嘿嘿', '13', '2019-04-23 11:22:43');
INSERT INTO `comment` VALUES ('18', '2', '3', '不错哟', '13', '2019-04-23 11:27:55');
INSERT INTO `comment` VALUES ('19', '2', '3', '哈哈哈', '13', '2019-04-23 11:40:30');
INSERT INTO `comment` VALUES ('20', '2', '3', '很好', '13', '2019-04-25 09:00:05');
INSERT INTO `comment` VALUES ('21', '2', '26', 'nice', null, '2019-04-25 09:22:31');
INSERT INTO `comment` VALUES ('22', '2', '4', '哪里nice了？', '21', '2019-04-25 09:23:12');
INSERT INTO `comment` VALUES ('23', '2', '3', '哈哈', '13', '2019-04-25 09:39:12');
INSERT INTO `comment` VALUES ('24', '46', '26', '宝贝不错', null, '2019-04-28 21:22:45');
INSERT INTO `comment` VALUES ('26', '52', '26', '很可爱的小猫咪', null, '2019-05-07 11:59:36');
INSERT INTO `comment` VALUES ('27', '17', '26', '好', null, '2019-05-08 14:57:53');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `origin_user_id` int(11) DEFAULT NULL COMMENT '原评论用户',
  `pro_id` int(11) DEFAULT NULL,
  `isRead` int(11) DEFAULT '0' COMMENT '0-未读 1-已读',
  `msgType` int(11) DEFAULT '0' COMMENT '1-提醒消息 2-评论回复消息 3-拍卖消息',
  `releaseTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('3', '尊敬的坚强的坚强ゝ,你设置提醒的拍卖品\'小米6\'已经结束，快来看看吧~', '26', '1', '1', '1', '2019-04-24 10:12:17');
INSERT INTO `message` VALUES ('4', '尊敬的柠檬草精铃,你设置提醒的拍卖品\'小米6\'已经结束，快来看看吧~', '3', '1', '1', '1', '2019-04-25 08:59:51');
INSERT INTO `message` VALUES ('5', '柠檬草精铃回复了你的评论\" good！\":很好', '26', '2', '1', '2', '2019-04-25 09:00:05');
INSERT INTO `message` VALUES ('6', 'Alan回复了你的评论\"nice\":哪里nice了？', '26', '2', '1', '2', '2019-04-25 09:23:12');
INSERT INTO `message` VALUES ('7', '柠檬草精铃回复了你的评论\" good！\":哈哈', '26', '2', '1', '2', '2019-04-25 09:39:12');
INSERT INTO `message` VALUES ('8', '尊敬的LiMing,你参与报名的\'翡翠手镯\'正在火热进行中，赶快来参与竞拍吧~', '10', '11', '1', '3', '2019-04-25 11:45:51');
INSERT INTO `message` VALUES ('47', '尊敬的LiMing,你参与报名的\'Uniqlo短袖\'正在火热进行中，赶快来参与竞拍吧~', '10', '20', '1', '3', '2019-04-25 16:19:46');
INSERT INTO `message` VALUES ('48', '尊敬的LiMing,你参与报名的\'罗蒙男装\'正在火热进行中，赶快来参与竞拍吧~', '10', '22', '1', '3', '2019-04-25 16:19:46');
INSERT INTO `message` VALUES ('49', '尊敬的坚强的坚强ゝ，恭喜你，你参与的竞拍\'小米6\'已经结束，幸运的你是最终的获胜者，请在3日内交付余款完成拍卖交易，否则，你的保证金不会退还噢！', '26', '1', '1', '3', '2019-04-25 16:22:57');
INSERT INTO `message` VALUES ('50', '尊敬的坚强的坚强ゝ，恭喜你，你参与的竞拍\'小米6\'已经结束，幸运的你是最终的获胜者，请在3日内交付余款完成拍卖交易，否则，你的保证金不会退还噢！', '26', '2', '1', '3', '2019-04-25 16:22:58');
INSERT INTO `message` VALUES ('51', '尊敬的坚强的坚强ゝ，恭喜你，你参与的竞拍\'小米6\'已经结束，幸运的你是最终的获胜者，请在3日内交付余款完成拍卖交易，否则，你的保证金不会退还噢！', '26', '10', '1', '3', '2019-04-25 16:22:58');
INSERT INTO `message` VALUES ('52', '尊敬的坚强的坚强ゝ,你设置提醒的拍卖品\'全友餐桌\'正在火热进行中，赶快来参与竞拍吧~', '26', '25', '1', '1', '2019-05-03 09:52:48');
INSERT INTO `message` VALUES ('54', '尊敬的坚强的坚强ゝ,你参与报名的\'纯种博美犬\'正在火热进行中，赶快来参与竞拍吧~', '26', '46', '1', '3', '2019-05-05 20:39:18');
INSERT INTO `message` VALUES ('55', '尊敬的Linda,你参与报名的\'纯种博美犬\'正在火热进行中，赶快来参与竞拍吧~', '2', '46', '1', '3', '2019-05-05 20:52:34');
INSERT INTO `message` VALUES ('56', '尊敬的William,你参与报名的\'semir外套\'正在火热进行中，赶快来参与竞拍吧~', '7', '21', '0', '3', '2019-05-05 20:54:10');
INSERT INTO `message` VALUES ('57', '尊敬的William,你参与报名的\'纯种博美犬\'正在火热进行中，赶快来参与竞拍吧~', '7', '46', '0', '3', '2019-05-05 20:54:25');
INSERT INTO `message` VALUES ('68', '尊敬的坚强的坚强ゝ，恭喜你，你参与的竞拍\'纯种博美犬\'已经结束，幸运的你是最终的获胜者，请在3日内交付余款完成拍卖交易，否则，你的保证金不会退还噢！', '26', '46', '1', '3', '2019-05-06 14:19:07');
INSERT INTO `message` VALUES ('70', '尊敬的坚强的坚强ゝ,你参与报名的\'semir外套\'正在火热进行中，赶快来参与竞拍吧~', '26', '21', '1', '3', '2019-05-06 14:22:16');
INSERT INTO `message` VALUES ('71', '尊敬的Linda，你参与的竞拍\'纯种博美犬\'已经结束，很遗憾，竞拍失败！，保证金将在3个工作日内退还！', '2', '46', '1', '3', '2019-05-06 14:23:17');
INSERT INTO `message` VALUES ('72', '尊敬的Linda,你参与报名的\'semir外套\'正在火热进行中，赶快来参与竞拍吧~', '2', '21', '1', '3', '2019-05-06 14:23:33');
INSERT INTO `message` VALUES ('73', '尊敬的Linda,你参与报名的\'一项寒秋\'正在火热进行中，赶快来参与竞拍吧~', '2', '10', '0', '3', '2019-05-08 16:45:08');
INSERT INTO `message` VALUES ('74', '尊敬的孤独的造梦者,你参与报名的\'SONY数码\'正在火热进行中，赶快来参与竞拍吧~', '26', '28', '1', '3', '2019-05-11 22:11:33');
INSERT INTO `message` VALUES ('75', '尊敬的孤独的造梦者,你设置提醒的拍卖品\'珍珠耳环\'已经结束，快来看看吧~', '26', '14', '1', '1', '2019-05-11 22:18:11');
INSERT INTO `message` VALUES ('76', '尊敬的孤独的造梦者,你设置提醒的拍卖品\'珍珠耳环\'已经结束，快来看看吧~', '26', '1', '1', '3', '2019-05-11 22:18:11');
INSERT INTO `message` VALUES ('77', '尊敬的孤独的造梦者,你设置提醒的拍卖品\'渔翁摆件\'正在火热进行中，赶快来参与竞拍吧~', '26', '59', '1', '1', '2019-05-12 11:10:42');
INSERT INTO `message` VALUES ('78', '尊敬的孤独的造梦者,你设置提醒的拍卖品\'渔翁摆件\'正在火热进行中，赶快来参与竞拍吧~', '26', '1', '1', '3', '2019-05-12 11:10:43');
INSERT INTO `message` VALUES ('79', '尊敬的孤独的造梦者,你参与报名的\'壁画邮票\'正在火热进行中，赶快来参与竞拍吧~', '26', '58', '1', '3', '2019-05-12 11:11:41');
INSERT INTO `message` VALUES ('80', '尊敬的___尛羙°猫,你参与报名的\'壁画邮票\'正在火热进行中，赶快来参与竞拍吧~', '42', '58', '1', '3', '2019-05-12 11:13:29');
INSERT INTO `message` VALUES ('81', '尊敬的孤独的造梦者，你参与的竞拍\'壁画邮票\'已经结束，很遗憾，竞拍失败！，保证金将在3个工作日内退还！', '26', '58', '1', '3', '2019-05-12 11:14:04');
INSERT INTO `message` VALUES ('82', '尊敬的___尛羙°猫，恭喜你，你参与的竞拍\'壁画邮票\'已经结束，幸运的你是最终的获胜者，请在3日内交付余款完成拍卖交易，否则，你的保证金不会退还噢！', '42', '58', '1', '3', '2019-05-12 11:14:44');

-- ----------------------------
-- Table structure for order1
-- ----------------------------
DROP TABLE IF EXISTS `order1`;
CREATE TABLE `order1` (
  `id` varchar(255) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `pro_id` int(11) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL COMMENT '发货地址',
  `address2` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `lastOpTime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-待发货 2-待收货 3-订单完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order1
-- ----------------------------
INSERT INTO `order1` VALUES ('201905061528064626', '26', '46', '江西省 南昌市 青山湖区', '江西省 南昌市 青山湖区', '2019-05-06 19:19:51', '3');
INSERT INTO `order1` VALUES ('201905121115065842', '42', '58', '江西省 南昌市 青山湖区', '暂无', '2019-05-12 11:15:06', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `initialprice` double DEFAULT NULL,
  `nowprice` double DEFAULT '0',
  `uploadDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '1-已上线 0-已下架',
  `seller_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '-- 0-已下架 已发布(11-今日拍卖 12即将开始) 2-待审核 3-假删除 4-已结束',
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `deadline` datetime DEFAULT NULL,
  `click_num` int(11) DEFAULT '0',
  `join_num` int(11) DEFAULT '0',
  `isFinished` int(11) DEFAULT '0',
  `isPayed` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `product_ibfk_4` FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '小米66666', '2019050916321005ee989c-bea8-4187-81ab-8f554d4da902.jpg;', '500', '1525', '2019-05-09 16:32:10', '华为nova新手机', '4', '36', '1', '2019-05-17 11:57:11', '2019-06-22 11:57:11', '77', '3', '0', '0');
INSERT INTO `product` VALUES ('2', 'vivoX5', '2.jpg;', '350', '628', '2018-06-12 15:06:47', '步步高vivoX5', '4', '36', '1', '2019-05-17 11:57:11', '2019-06-22 11:57:11', '607', '10', '0', '0');
INSERT INTO `product` VALUES ('3', '梅赛德斯', '3.jpg;', '130000', '130000', '2018-06-12 17:06:25', '（破）青岛安基电力设备有限公司破产财产', '1', '36', '11', '2019-05-17 11:57:11', '2019-06-22 11:57:11', '68', '1', '0', '0');
INSERT INTO `product` VALUES ('4', '捷豹', '4.jpg;', '230000', '230000', '2018-06-13 12:23:27', '鲁A31209捷豹牌轿车一辆', '1', '36', '11', '2019-05-17 11:57:11', '2019-06-22 11:57:11', '10', '0', '0', '0');
INSERT INTO `product` VALUES ('5', '宝马', '5.jpg;', '200000', '200000', '2018-06-08 09:28:35', '宝马x7', '1', '36', '11', '2019-05-17 11:57:11', '2019-06-22 11:57:11', '63', '2', '0', '0');
INSERT INTO `product` VALUES ('6', '丰田车', '6.jpg;', '350000', '350000', '2018-06-14 15:30:43', '一汽丰田普拉多', '1', '36', '11', '2019-05-17 11:57:11', '2019-06-22 11:57:11', '28', '2', '0', '0');
INSERT INTO `product` VALUES ('7', '大众汽车', '7.jpg;', '100000', '100000', '2018-06-15 17:36:38', '大众汽车迈腾', '1', '36', '11', '2019-05-17 11:57:11', '2019-06-22 11:57:11', '22', '2', '0', '0');
INSERT INTO `product` VALUES ('8', '蔡昌平书法', '8.jpg;', '7900', '7900', '2018-06-09 16:38:46', '蔡昌平书法作品十二幅', '2', '36', '11', '2019-05-17 11:57:11', '2019-06-22 11:57:11', '10', '1', '0', '0');
INSERT INTO `product` VALUES ('9', '词一首', '9.jpg;', '1000', '1000', '2018-06-07 16:40:54', '张思亭的诗词《词一首》', '2', '36', '11', '2019-05-17 11:57:11', '2019-06-22 11:57:11', '14', '0', '0', '0');
INSERT INTO `product` VALUES ('10', '一项寒秋', '10.jpg;', '1200', '1680', '2018-06-10 16:43:30', '蒋思昉的诗词《一项寒秋》', '2', '36', '11', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '126', '4', '0', '0');
INSERT INTO `product` VALUES ('11', '翡翠手镯', '11.jpg;', '3000', '3300', '2018-06-09 20:44:55', '玻璃种翡翠手镯', '3', '36', '11', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '28', '3', '0', '0');
INSERT INTO `product` VALUES ('12', '项链', '12.jpg;', '50000', '50000', '2018-06-14 16:46:12', '宝格丽项链', '3', '36', '11', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '22', '0', '0', '0');
INSERT INTO `product` VALUES ('13', '玛瑙手串', '13.jpg;', '8000', '8000', '2018-06-14 16:47:20', '玛瑙手串', '3', '36', '11', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '7', '0', '0', '0');
INSERT INTO `product` VALUES ('14', '珍珠耳环', '14.jpg;', '5000', '5000', '2018-06-15 20:48:32', '珍珠耳环', '3', '36', '11', '2019-05-07 11:57:11', '2019-05-11 22:18:11', '24', '0', '1', '0');
INSERT INTO `product` VALUES ('15', 'iphone6 plus', '20190512083511556f1afe-c0e6-45df-b7a4-bf2278b3d501.jpg;', '10000', '10000', '2019-05-12 08:35:12', 'iPhone6 plus 64G', '4', '36', '11', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '10', '1', '0', '0');
INSERT INTO `product` VALUES ('16', '钻石戒指', '16.jpg;', '1500', '14300', '2018-06-15 20:50:35', '钻石承诺，永不褪色', '4', '36', '11', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '310', '5', '0', '0');
INSERT INTO `product` VALUES ('17', '三星GS7', '17.jpg;27.JPG;28.JPG;', '1700', '3400', '2018-06-15 16:52:01', '三星Galaxy S7', '4', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '714', '6', '0', '0');
INSERT INTO `product` VALUES ('18', '小米7', '18.jpg;', '1000', '1600', '2018-06-14 20:53:27', '小米6', '4', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '127', '2', '0', '0');
INSERT INTO `product` VALUES ('19', 'nikeT恤', '19.JPG;', '200', '200', '2018-06-14 20:00:00', '全新正品', '5', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '39', '1', '0', '0');
INSERT INTO `product` VALUES ('20', 'Uniqlo短袖', '201904300933394f5658c2-4aa2-4b5b-aa8a-2a2161f8ebf7.jpg;', '100', '350', '2019-04-30 09:33:39', '9.9成新', '5', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '489', '36', '0', '0');
INSERT INTO `product` VALUES ('21', 'semir外套', '21.JPG;', '500', '600', '2018-06-14 00:00:00', '新款女装', '5', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '344', '8', '0', '0');
INSERT INTO `product` VALUES ('22', '罗蒙男装', '22.JPG;', '500', '500', '2018-06-14 10:12:05', '男款西装', '5', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '36', '1', '0', '0');
INSERT INTO `product` VALUES ('23', '林氏沙发', '23.JPG;', '2000', '2000', '2018-06-14 10:24:06', '精品沙发', '6', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '12', '0', '0', '0');
INSERT INTO `product` VALUES ('24', '林氏公主床', '24.JPG;', '2000', '2000', '2018-06-14 10:25:25', '欧式精装', '6', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '14', '0', '0', '0');
INSERT INTO `product` VALUES ('25', '全友餐桌', '25.JPG;', '1500', '1500', '2018-06-14 10:27:26', '家庭聚餐', '6', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '5', '0', '0', '0');
INSERT INTO `product` VALUES ('26', '桌椅三件套', '26.JPG;', '1200', '1500', '2018-06-14 10:28:37', '生活办公', '6', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '15', '1', '0', '0');
INSERT INTO `product` VALUES ('27', '数码相机', '27.JPG;', '6000', '6000', '2018-06-14 10:35:08', '单反专业', '7', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '7', '0', '0', '0');
INSERT INTO `product` VALUES ('28', 'SONY数码', '28.JPG;', '4000', '4400', '2018-06-14 10:35:11', '单反业余', '7', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '15', '3', '0', '0');
INSERT INTO `product` VALUES ('29', '格力空调', '29.JPG;', '4000', '4000', '2018-06-14 10:39:48', '变频空调', '7', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '7', '3', '0', '0');
INSERT INTO `product` VALUES ('30', '晶弘冰箱', '30.JPG;', '1500', '1500', '2018-06-14 10:41:12', '四门冰箱', '7', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '10', '0', '0', '0');
INSERT INTO `product` VALUES ('31', '小天鹅洗衣机', '31.JPG;', '8888', '8888', '2018-06-14 10:43:32', '洗烘一体复式', '7', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '44', '0', '0', '0');
INSERT INTO `product` VALUES ('32', 'SK-II神仙水', '32.JPG;', '1200', '1200', '2018-06-14 10:50:42', '护肤品套装', '8', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '5', '0', '0', '0');
INSERT INTO `product` VALUES ('33', 'YSL黑管唇釉', '33.JPG;', '120', '210', '2018-06-14 10:57:35', '唇釉', '8', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '59', '3', '0', '0');
INSERT INTO `product` VALUES ('34', 'Chanel香水', '34.JPG;', '600', '600', '2018-06-14 11:00:55', '女士邂逅柔情系列', '8', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '5', '1', '0', '0');
INSERT INTO `product` VALUES ('35', '防晒霜', '35.JPG;', '300', '300', '2018-06-14 11:02:38', '防晒保湿', '8', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '89', '0', '0', '0');
INSERT INTO `product` VALUES ('36', '面膜', '36.JPG;', '300', '300', '2018-06-14 11:04:56', '补水美白', '8', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '10', '0', '0', '0');
INSERT INTO `product` VALUES ('41', '王牌机械键盘', '20190429104049d4017663-1991-4d1c-b3ba-f6b2a2b7f8ad.jpg;', '20', '20', '2019-04-29 10:40:49', '手感好游戏键盘', '4', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '39', '4', '0', '0');
INSERT INTO `product` VALUES ('46', '纯种博美犬', '20190426113610731c07db-b715-4b0e-ba39-54ba185f17b9.jpg;', '200', '280', '2019-04-26 11:36:10', '宠爱天下靓爆镜宠物 纯种博美犬白色博美活体幼犬狗狗带保险芯片', '9', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '55', '3', '1', '0');
INSERT INTO `product` VALUES ('52', '猫咪活物', '20190429105412fc39aab0-cbd0-47cf-b453-7a9f4bfb5a1f.jpg;2019042910541222a7175e-6a0c-4fa7-9065-4ef48e6273a9.jpg;20190429105412323872f6-05ba-4eac-8fdb-c47ce2b1af3f.jpg;', '200', '480', '2019-04-29 10:54:12', '猫咪活幼体英短猫咪活物宠物小猫幼崽活物布偶蓝猫幼猫活体短毛猫', '9', '36', '1', '2019-05-07 11:57:11', '2019-05-22 11:57:11', '2086', '5', '1', '1');
INSERT INTO `product` VALUES ('54', '66666', '20190508160401d20af6f2-7e6d-4146-8e30-c66f931d5244.jpg;', '666', '666', '2019-05-08 16:04:01', '666666666666', '1', '36', '1', '2019-05-08 20:03:27', '2019-05-10 16:03:30', '0', '0', '0', '0');
INSERT INTO `product` VALUES ('55', '小米6', '201905091649540ba87f3e-9b60-4f3e-814f-e466b7bba141.jpg;', '100', '100', '2019-05-09 16:49:54', '小米6手机', '4', '36', '1', '2019-05-10 16:49:26', '2019-05-15 16:49:28', '2', '0', '0', '0');
INSERT INTO `product` VALUES ('56', '外文旧书', '2019051122002853cf4135-63bf-4a2e-8e26-544542ad833e.jpg;20190511234448d3d6ce6e-e2a8-4a0a-84e1-8ddb087141d6.jpg;', '25', '25', '2019-05-11 22:00:28', '复古怀旧文艺硬皮精装外文旧书老书古董书装饰摆件摄影道具', '10', '36', '12', '2019-05-12 22:00:06', '2019-05-16 22:00:17', '0', '0', '0', '0');
INSERT INTO `product` VALUES ('58', '壁画邮票', '201905112349114a7b16fe-79bf-4fe0-b452-18b2720d5a3f.jpg;', '50', '95', '2019-05-11 23:49:11', '斯里兰卡 1973年壁画邮票（改值）', '10', '36', '12', '2019-05-12 11:11:24', '2019-05-12 11:12:30', '12', '2', '1', '1');
INSERT INTO `product` VALUES ('59', '渔翁摆件', '20190511235300736067f5-fb2b-4e42-bf34-811302bb3466.jpg;20190511235300abd8bdbd-b22a-4adf-982e-c2d8753bbe8b.jpg;', '300', '300', '2019-05-11 23:53:00', '黄杨木渔翁摆件', '10', '36', '12', '2019-05-12 11:01:30', '2019-05-15 23:52:48', '9', '0', '0', '0');
INSERT INTO `product` VALUES ('60', '民国大洋', '201905120007020ec39108-3d50-4f6b-96e5-9f69c5207a65.jpg;2019051200070245bc24ef-93b1-4ee7-9735-d17c82ac4913.jpg;', '98', '98', '2019-05-12 00:07:02', '银圆银币元大头真品大洋民国三年全套鉴定收藏级古董评级币袁世凯', '10', '36', '12', '2019-05-13 00:06:41', '2019-05-15 00:06:44', '2', '0', '0', '0');

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `recommend_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `recommend_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES ('1', '26', '1');
INSERT INTO `recommend` VALUES ('2', '26', '2');
INSERT INTO `recommend` VALUES ('7', '3', '1');
INSERT INTO `recommend` VALUES ('10', '3', '4');
INSERT INTO `recommend` VALUES ('11', '26', '4');
INSERT INTO `recommend` VALUES ('12', '6', '4');
INSERT INTO `recommend` VALUES ('13', '6', '5');
INSERT INTO `recommend` VALUES ('14', '6', '1');
INSERT INTO `recommend` VALUES ('15', '3', '5');
INSERT INTO `recommend` VALUES ('16', '26', '5');
INSERT INTO `recommend` VALUES ('17', '5', '5');
INSERT INTO `recommend` VALUES ('18', '11', '5');
INSERT INTO `recommend` VALUES ('19', '10', '5');
INSERT INTO `recommend` VALUES ('20', '26', '6');
INSERT INTO `recommend` VALUES ('21', '4', '4');
INSERT INTO `recommend` VALUES ('22', '10', '3');
INSERT INTO `recommend` VALUES ('23', '10', '4');
INSERT INTO `recommend` VALUES ('28', '26', '9');
INSERT INTO `recommend` VALUES ('29', '27', '4');
INSERT INTO `recommend` VALUES ('30', '2', '9');
INSERT INTO `recommend` VALUES ('31', '7', '9');
INSERT INTO `recommend` VALUES ('32', '24', '9');
INSERT INTO `recommend` VALUES ('33', '22', '9');
INSERT INTO `recommend` VALUES ('34', '2', '5');
INSERT INTO `recommend` VALUES ('35', '2', '2');
INSERT INTO `recommend` VALUES ('36', '26', '3');
INSERT INTO `recommend` VALUES ('37', '26', '7');
INSERT INTO `recommend` VALUES ('38', '42', '7');
INSERT INTO `recommend` VALUES ('39', '42', '4');
INSERT INTO `recommend` VALUES ('40', '26', '10');
INSERT INTO `recommend` VALUES ('41', '42', '10');

-- ----------------------------
-- Table structure for subscribe
-- ----------------------------
DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pro_id` int(11) DEFAULT NULL,
  `pro_status` int(11) DEFAULT NULL COMMENT '11正在进行 12-即将开始 4-已结束',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pro_id` (`pro_id`),
  CONSTRAINT `subscribe_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `subscribe_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscribe
-- ----------------------------
INSERT INTO `subscribe` VALUES ('2', '26', '2', '11');
INSERT INTO `subscribe` VALUES ('4', '26', '10', '11');
INSERT INTO `subscribe` VALUES ('10', '3', '1', '4');
INSERT INTO `subscribe` VALUES ('11', '26', '25', '11');
INSERT INTO `subscribe` VALUES ('12', '26', '22', '11');
INSERT INTO `subscribe` VALUES ('13', '26', '21', '11');
INSERT INTO `subscribe` VALUES ('14', '27', '1', '4');
INSERT INTO `subscribe` VALUES ('15', '26', '46', '4');
INSERT INTO `subscribe` VALUES ('16', '26', '17', '11');
INSERT INTO `subscribe` VALUES ('17', '2', '10', '11');
INSERT INTO `subscribe` VALUES ('18', '26', '14', '4');
INSERT INTO `subscribe` VALUES ('19', '26', '59', '11');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) DEFAULT NULL,
  `specification` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `typeNameUnique` (`typeName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '车品配件', '车品配件是指车上的各种零件', '6');
INSERT INTO `type` VALUES ('2', '图书影音', '图书是指纸质书，影音包括光碟、光盘等', '3');
INSERT INTO `type` VALUES ('3', '珠宝首饰', '珍珠项链、金银手环和耳环等', '4');
INSERT INTO `type` VALUES ('4', '电子产品', '手机、电脑等', '8');
INSERT INTO `type` VALUES ('5', '服装搭配', 'T恤、短袖、外套等', '4');
INSERT INTO `type` VALUES ('6', '精品家具', '沙发、床、餐桌等', '4');
INSERT INTO `type` VALUES ('7', '数码家电', '数码相机、洗衣机、空调、冰箱等', '5');
INSERT INTO `type` VALUES ('8', '美妆生活', '防晒霜、面膜、香水等', '5');
INSERT INTO `type` VALUES ('9', '喵汪宠物', '各种狗狗，喵咪.....', '2');
INSERT INTO `type` VALUES ('10', '古董收藏', '各种古董、收藏品等', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT '女',
  `age` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT '暂无',
  `account` double DEFAULT '0',
  `declaration` varchar(255) DEFAULT '这家伙很懒，什么也没有留下',
  `status` int(11) DEFAULT '1' COMMENT '2-删除（假删除）1-启用 0-禁用',
  `headpic` varchar(255) DEFAULT 'headimg1.jpg',
  `type` int(11) DEFAULT '1' COMMENT '1-竞买者 0-委托者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `telUnique` (`tel`),
  UNIQUE KEY `emailUnique` (`email`),
  UNIQUE KEY `usernameUnique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1523628', '1234567', 'Bob1', '女', '20', '15932488721', '456@q.com', '江西省 南昌市 青山湖区', '1480', '这家伙很懒，什么也没有留下', '2', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('2', '1263278', '123456', 'Linda', '女', '19', '15742362104', '2574@qq.com', '江西省 南昌市 青山湖区', '570', '这家伙很懒，什么也没有留下', '1', 'headimg4.jpg', '1');
INSERT INTO `user` VALUES ('3', '1364725', '123456', '柠檬草精铃', '女', '22', '15236201278', '123@136.com', '江西省 南昌市 青山湖区', '1026', '很高兴认识各位，请多多指教~', '1', '20190415184705f83957a3-4256-4894-81df-73286aadec2f.jpg', '1');
INSERT INTO `user` VALUES ('4', '1523647', '12304', 'Alan', '男', '18', '14523621745', '1235@136.com', '江西省 南昌市 青山湖区', '1000', '这家伙很懒，什么也没有留下', '1', 'headimg4.jpg', '1');
INSERT INTO `user` VALUES ('5', '1463529', '20145', 'Jack', '男', '19', '15823647125', '1478@qq.com', '江西省 南昌市 青山湖区', '1000', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('6', '1563210', '195362', 'Alice', '女', '20', '15632402145', '1520361425@qq.com', '江西省 南昌市 青山湖区', '1000', '这家伙很懒，什么也没有留下', '1', 'headimg4.jpg', '1');
INSERT INTO `user` VALUES ('7', '1523624', '1238', 'William', '男', '19', '15203614792', '1526342781@qq.com', '江西省 南昌市 青山湖区', '260', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('8', '1423623', '15236', 'Viola', '女', '19', '15203614772', '1523014796@qq.com', '江西省 南昌市 青山湖区', '980', '这家伙很懒，什么也没有留下', '1', 'headimg4.jpg', '1');
INSERT INTO `user` VALUES ('9', '1723624', '15262', 'David', '男', '20', '18503614792', '2145632058@qq.com', '江西省 南昌市 青山湖区', '1000', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('10', '1725324', '123321', 'LiMing', '女', '20', '15863247000', '412574515@qq.com', '江西省 南昌市 青山湖区', '880', '这家伙很懒，什么也没有留下', '1', 'headimg4.jpg', '1');
INSERT INTO `user` VALUES ('11', '1725325', '123', '大师傅', '女', '25', '14765328424', '425@qsd.bn', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('12', '1725326', '123', '施华蔻', '男', '25', '13567892345', '124@as.cc', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', 'headimg4.jpg', '1');
INSERT INTO `user` VALUES ('13', '1725327', '123', '圣诞树', '男', '31', '15203614793', '124@q.cs', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('18', '1725329', '123', '王大可', '男', '22', '18079803007', '2574022785@qq.com', '江西省 南昌市 青山湖区', '1250', '这家伙很懒，什么也没有留下', '1', 'headimg4.jpg', '1');
INSERT INTO `user` VALUES ('19', '1725330', '123', '马德里', '男', '22', '13567892349', '123@aa.com', '江西省 南昌市 青山湖区', '800', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('20', '1725331', '123', '淡淡的', '男', '22', '13689056732', '1235@qs.com', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', 'headimg4.jpg', '1');
INSERT INTO `user` VALUES ('21', '1725332', '223', 'fdd', '男', '23', '15263546523', '235@qs.com', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('22', '1725333', '123', '菲菲', '女', '22', '13904988499', '184@s.com', '江西省 南昌市 青山湖区', '7740', '这家伙很懒，什么也没有留下', '1', 'headimg4.jpg', '1');
INSERT INTO `user` VALUES ('23', '1725334', '135', '泛泛而谈', '男', '22', '18738923847', '182@sj.com', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('24', '1725335', '123', '大多数', '男', '22', '15769504859', '123@qq.com', '江西省 南昌市 青山湖区', '11660', '这家伙很懒，什么也没有留下', '1', 'headimg4.jpg', '1');
INSERT INTO `user` VALUES ('25', '1725336', '123123', '呃呃是S', '男', '22', '15079080496', '123@qs.com', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('26', '1725337', '123456', '孤独的造梦者', '男', '22', '18079002354', '111@qq.com', '上海市 上海市 黄浦区', '19720', '走，竞拍去！', '1', '20190511173124e9eefd11-9fb5-4b3a-9c3e-ce8a948e2fe8.jpg', '1');
INSERT INTO `user` VALUES ('27', '1725338', '111111', '淡淡的', '男', '22', '15244422041', '121@qq.com', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('30', '1725339', '123231', 'zhangsan', '男', '22', '15244422042', '122@qq.com', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('33', '1725340', '123456', 'zhangsan', '男', '22', '15079080499', '124@qq.com', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('34', '1725341', '122222', 'zhangsan', '男', '23', '15079080596', '1234@qq.com', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('35', '1725342', 'qqqqqq', 'zhangsan', '男', '22', '15079080455', '1233@qq.com', '江西省 南昌市 青山湖区', '0', '这家伙很懒，什么也没有留下', '1', '20190428141204266d88f2-f66c-485a-a758-b2b6b166411b.jpg', '1');
INSERT INTO `user` VALUES ('36', '1725343', '123456', '小店铺', '女', '22', '15263478920', '963@qq.com', '江西省 南昌市 青山湖区', '2085', '欢迎新老顾客前来竞拍！', '1', '20190511172045dc34a528-d0c7-422b-bd47-6d674f8d98ba.jpg', '0');
INSERT INTO `user` VALUES ('37', '1725344', '123456', '___Rubby丶', '男', '23', '15045625785', 'ajl@136.com', '暂无', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '1');
INSERT INTO `user` VALUES ('38', '1725345', '123456', '☆星雨悠悠℃', '男', '24', '15045625784', '126@136.com', '暂无', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '0');
INSERT INTO `user` VALUES ('39', '1725346', '123456', '六瓣═→ 丁香', '男', '24', '15045625783', '128@136.com', '暂无', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '0');
INSERT INTO `user` VALUES ('40', '1725347', '123456', '∨_______尜尜', '男', '25', '15045625781', '123@qq1.com', '暂无', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '0');
INSERT INTO `user` VALUES ('41', '1725348', '123456', '___Rubby丶', '男', '25', '15045625234', '126@126.com', '暂无', '0', '这家伙很懒，什么也没有留下', '1', 'headimg1.jpg', '0');
INSERT INTO `user` VALUES ('42', '1725349', '123456', '___尛羙°猫', '男', '24', '15869230242', '2574@136.com', '暂无', '105', '这家伙很懒，什么也没有留下', '1', '20190512092817c0c38c91-434e-4c48-89dc-c2d9ca230d11.jpg', '1');
DROP TRIGGER IF EXISTS `typeCount_product_insert`;
DELIMITER ;;
CREATE TRIGGER `typeCount_product_insert` BEFORE INSERT ON `product` FOR EACH ROW begin
		update type set count=count+1 where type.id=new.type_id;

	end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `typeCount_product_update`;
DELIMITER ;;
CREATE TRIGGER `typeCount_product_update` BEFORE UPDATE ON `product` FOR EACH ROW begin
		update type set count=count-1 where type.id=old.type_id;
		update type set count=count+1 where type.id=new.type_id;
	end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `typeCount_product_delete`;
DELIMITER ;;
CREATE TRIGGER `typeCount_product_delete` BEFORE DELETE ON `product` FOR EACH ROW begin
		update type set count=count-1 where type.id=old.type_id;
	end
;;
DELIMITER ;
