/*
 Navicat Premium Data Transfer

 Source Server         : sql.m50.vhostgo.com
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : sql.m50.vhostgo.com:3306
 Source Schema         : timliusq

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 27/04/2021 16:11:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for me_agent
-- ----------------------------
DROP TABLE IF EXISTS `me_agent`;
CREATE TABLE `me_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(50) DEFAULT NULL COMMENT '联系地址',
  `hztime` varchar(20) DEFAULT NULL COMMENT '合作日期',
  `contacts` varchar(20) DEFAULT NULL COMMENT '联系人',
  `hzflg` tinyint(1) NOT NULL DEFAULT '1' COMMENT '合作状态1进行2停止',
  `note` text COMMENT '备注',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  `province` varchar(10) DEFAULT NULL COMMENT '省份',
  `city` varchar(10) DEFAULT NULL COMMENT '市区',
  `area` varchar(10) DEFAULT NULL COMMENT '区/镇',
  `addr` varchar(30) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of me_agent
-- ----------------------------
BEGIN;
INSERT INTO `me_agent` VALUES (9, '华裔', '13321232222', '上海-市辖区-浦东新区-防守打法', '2021-04-30', '联系人', 1, '内部', 0, '上海', '市辖区', '浦东新区', '防守打法');
INSERT INTO `me_agent` VALUES (10, '我是第二个', '', '上海-市辖区-浦东新区-', '', '', 2, '', 1619344840, '上海', '市辖区', '浦东新区', '');
INSERT INTO `me_agent` VALUES (11, '迪桑了哦', '', '上海-市辖区-浦东新区-', '', '', 1, '', 1619345035, '上海', '市辖区', '浦东新区', '');
INSERT INTO `me_agent` VALUES (12, '迪桑了哦到访', '', '上海-市辖区-浦东新区-', '', '', 1, '', 1619345044, '上海', '市辖区', '浦东新区', '');
INSERT INTO `me_agent` VALUES (13, '迪桑了哦', NULL, '---', NULL, NULL, 1, '', 1619406994, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for me_agentcost
-- ----------------------------
DROP TABLE IF EXISTS `me_agentcost`;
CREATE TABLE `me_agentcost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agentid` int(11) NOT NULL COMMENT '代理商id',
  `agentname` varchar(11) DEFAULT NULL COMMENT '代理商名称',
  `jdtype` varchar(20) DEFAULT NULL COMMENT '鉴定类型',
  `ybtype` varchar(20) DEFAULT NULL COMMENT '样本类型',
  `cost` float DEFAULT NULL COMMENT '成本',
  `note` text COMMENT '备注',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of me_agentcost
-- ----------------------------
BEGIN;
INSERT INTO `me_agentcost` VALUES (11, 9, '华裔', '隐私', '指甲', 600, '我是备注内容', 1619427705);
INSERT INTO `me_agentcost` VALUES (12, 9, '华裔', '隐私', '口腔拭子', 500, '个', 1619427766);
INSERT INTO `me_agentcost` VALUES (13, 10, '我是第二个', '隐私', '口腔拭子', 350, '', 1619429961);
INSERT INTO `me_agentcost` VALUES (14, 9, '华裔', '隐私', '牙刷', 100, '', 1619430268);
INSERT INTO `me_agentcost` VALUES (15, 11, '迪桑了哦', '隐私', '毛发1', 100, '', 1619430331);
COMMIT;

-- ----------------------------
-- Table structure for me_config
-- ----------------------------
DROP TABLE IF EXISTS `me_config`;
CREATE TABLE `me_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL COMMENT '类型',
  `value` varchar(10) NOT NULL COMMENT '内容',
  `price` float DEFAULT NULL COMMENT '采样成本',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of me_config
-- ----------------------------
BEGIN;
INSERT INTO `me_config` VALUES (9, 'yblx', '毛发1', 500, 1619077488);
INSERT INTO `me_config` VALUES (10, 'yblx', '指甲', 600, 2147483647);
INSERT INTO `me_config` VALUES (11, 'yblx', '口腔拭子', 400, 1619077488);
INSERT INTO `me_config` VALUES (12, 'yblx', '牙刷', 400, 1619077488);
INSERT INTO `me_config` VALUES (20, 'jdlx', '无创', NULL, 1619430559);
INSERT INTO `me_config` VALUES (15, 'jdlx', '隐私', NULL, 1619164745);
INSERT INTO `me_config` VALUES (16, 'skfs', '支付宝', NULL, 1619164755);
INSERT INTO `me_config` VALUES (17, 'cyfs', '上门', NULL, 1619165532);
INSERT INTO `me_config` VALUES (21, 'jdlx', '司法', NULL, 1619430565);
INSERT INTO `me_config` VALUES (22, 'yblx', '精液', NULL, 1619430581);
INSERT INTO `me_config` VALUES (23, 'khbq', '有钱', NULL, 1619508987);
INSERT INTO `me_config` VALUES (24, 'khbq', '任性', NULL, 1619510067);
INSERT INTO `me_config` VALUES (26, 'khbq', '大客户', NULL, 1619510085);
INSERT INTO `me_config` VALUES (27, 'khbq', '可以跟踪', NULL, 1619510090);
COMMIT;

-- ----------------------------
-- Table structure for me_consume
-- ----------------------------
DROP TABLE IF EXISTS `me_consume`;
CREATE TABLE `me_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '客户id',
  `cusname` varchar(20) NOT NULL COMMENT '客户姓名',
  `cusphone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `cjtype` varchar(5) NULL COMMENT '成交类型;定金/订单',
  `sgyj` varchar(10) NULL COMMENT '试管是否邮寄',
  `sgyjkd` varchar(20) NULL COMMENT '试管邮寄快递信息',
  `sgyjkddh` varchar(20) NULL COMMENT '试管邮寄快递单号',
  `djrq` int(11) NULL COMMENT '定金日期',
  `cjrq` int(11) NOT NULL COMMENT '订单日期',
  `jdksrq` int(11) NULL COMMENT '鉴定开始日期',
  `jdrname` varchar(30) NOT NULL COMMENT '鉴定人信息',
  `agentid` int(11) NOT NULL COMMENT '代理商id',
  `agentname` varchar(20) NOT NULL COMMENT '代理商名称',
  `ybtype` varchar(20) NOT NULL COMMENT '样本类型',
  `jdtype` varchar(20) NOT NULL COMMENT '鉴定类型',
  `price` float NOT NULL COMMENT '客户付款价格',
  `fktype` varchar(20) NOT NULL COMMENT '付款方式',
  `skzh` varchar(20) NOT NULL COMMENT '收款账户',
  `cyfs` varchar(20) NOT NULL COMMENT '采样方式',
  `cycb` float DEFAULT NULL COMMENT '采样成本',
  `bgtime` int(11) NOT NULL COMMENT '报告出来时间',
  `bgresult` tinyint(1) DEFAULT NULL COMMENT '报告结果;支持/不支持/补样',
  `bgtype` varchar(20) DEFAULT NULL COMMENT '报告通知方式邮寄/自取',
  `bgexpress` varchar(20) DEFAULT NULL COMMENT '报告快递信息',
  `bgexpressdh` varchar(20) DEFAULT NULL COMMENT '邮寄单号',
  `bgexpressfy` float DEFAULT NULL COMMENT '邮寄费用',
  `express` varchar(20) DEFAULT NULL COMMENT '快递信息',
  `note` text COMMENT '备注',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cusid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for me_customer
-- ----------------------------
DROP TABLE IF EXISTS `me_customer`;
CREATE TABLE `me_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `wx` varchar(11) DEFAULT NULL COMMENT '微信',
  `qq` varchar(11) DEFAULT NULL COMMENT 'QQ',
  `mail` varchar(11) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(50) DEFAULT NULL COMMENT '联系地址',
  `flg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '成交状态0未成交1成交',
  `sum` float NOT NULL COMMENT '成交金额',
  `creatid` int(11) NOT NULL COMMENT '登记人id',
  `creatname` varchar(20) NOT NULL COMMENT '登记人姓名',
  `note` text COMMENT '备注',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  `sex` varchar(1) DEFAULT NULL COMMENT '性别',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `area` varchar(20) DEFAULT NULL COMMENT '县区',
  `addr` varchar(50) DEFAULT NULL COMMENT '详细地址',
  `tag` varchar(200) DEFAULT NULL COMMENT '客户标签',
  PRIMARY KEY (`id`),
  KEY `creatid` (`creatid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for me_user
-- ----------------------------
DROP TABLE IF EXISTS `me_user`;
CREATE TABLE `me_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `username` varchar(20) DEFAULT NULL COMMENT '登录账号',
  `userpwd` varchar(20) DEFAULT NULL COMMENT '登录密码',
  `baseprice` float DEFAULT NULL COMMENT '工资',
  `job` varchar(20) DEFAULT NULL COMMENT '职位',
  `royalties` int(3) DEFAULT NULL COMMENT '提成,百分比',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `entrytime` int(11) DEFAULT NULL COMMENT '入职日期',
  `note` text COMMENT '备注',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  `staue` tinyint(1) NOT NULL DEFAULT '1' COMMENT '员工状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of me_user
-- ----------------------------
BEGIN;
INSERT INTO `me_user` VALUES (9, '刘宝骏', '15858149426', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `me_user` VALUES (10, '马丹', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `me_user` VALUES (11, '毛梦蝶', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
