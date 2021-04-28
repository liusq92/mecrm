-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2021-03-06 09:52:46
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


-- --------------------------------------------------------
--
-- 表的结构 `me_user`员工表
--

CREATE TABLE IF NOT EXISTS `me_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(11) NULL COMMENT '手机号码',
  `username` varchar(20) NULL COMMENT '登录账号',
  `userpwd` varchar(20) NULL COMMENT '登录密码',
  `baseprice` float NULL COMMENT '工资',
  `job` varchar(20) NULL COMMENT '职位',
  `royalties` int(3) NULL COMMENT '提成,百分比',
  `sex` varchar(2) NULL COMMENT '性别',
  `entrytime` int(11) NULL COMMENT '入职日期',
  `note` text NULL COMMENT '备注',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;



--
-- 表的结构 `me_config`设置表
--

CREATE TABLE IF NOT EXISTS `me_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL COMMENT '类型',
  `value` varchar(10) NOT NULL COMMENT '内容',
  `price` float NULL COMMENT '采样成本',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9;




--
-- 表的结构 `me_agent`代理商
--

CREATE TABLE IF NOT EXISTS `me_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(11) NULL COMMENT '手机号码',
  `address` varchar(50) NULL COMMENT '联系地址',
  `hztime` varchar(20) NULL COMMENT '合作日期',
  `contacts` varchar(20) NULL COMMENT '联系人',
  `hzflg` tinyint(1) NOT NULL DEFAULT 1 COMMENT '合作状态1进行2停止',
  `note` text NULL COMMENT '备注',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;


--
-- 表的结构 `me_agentcost`代理商成本
--

CREATE TABLE IF NOT EXISTS `me_agentcost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agentid` int(11) NOT NULL COMMENT '代理商id',
  `agentname` varchar(11) NULL COMMENT '代理商名称',
  `jdtype` varchar(20) NULL COMMENT '鉴定类型',
  `ybtype` varchar(20) NULL COMMENT '样本类型',
  `cost` float NULL COMMENT '成本',
  `note` text NULL COMMENT '备注',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`agentid`) REFERENCES `me_agent` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 表的结构 `me_customer`客户表
--

CREATE TABLE IF NOT EXISTS `me_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(11) NULL COMMENT '手机号码',
  `wx` varchar(11) NULL COMMENT '微信',
  `qq` varchar(11) NULL COMMENT 'QQ',
  `mail` varchar(11) NULL COMMENT '邮箱',
  `address` varchar(50) NULL COMMENT '联系地址',
  `flg` tinyint(1) NOT NULL DEFAULT 0 COMMENT '成交状态0未成交1成交',
  `sum` float NOT NULL COMMENT '成交金额',
  `creatid` int(11) NOT NULL COMMENT '登记人id',
  `creatname` varchar(20) NOT NULL COMMENT '登记人姓名',
  `note` text NULL COMMENT '备注',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`creatid`) REFERENCES `me_user` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 表的结构 `me_consume`成交表
--

CREATE TABLE IF NOT EXISTS `me_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cusid` int(11) NOT NULL COMMENT '客户id',
  `cusname` varchar(20) NOT NULL COMMENT '客户姓名',
  `cusphone` varchar(11) NULL COMMENT '手机号码',
  `contime` int(11) NOT NULL COMMENT '成交日期',
  `jdrname` varchar(30) NOT NULL COMMENT '鉴定人信息',
  `agentid` int(11) NOT NULL COMMENT '代理商id',
  `agentname` varchar(20) NOT NULL COMMENT '代理商名称',
  `ybtype` varchar(20) NOT NULL COMMENT '样本类型',
  `jdtype` varchar(20) NOT NULL COMMENT '鉴定类型',
  `price` float NOT NULL COMMENT '总价格',
  `fktype` varchar(20) NOT NULL COMMENT '付款方式',
  `skzh` varchar(20) NOT NULL COMMENT '收款账户',
  `cyfs` varchar(20) NOT NULL COMMENT '采样方式',
  `cycb` float NULL COMMENT '采样成本',
  `bgtime` int(11) NOT NULL COMMENT '报告出来时间',
  `bgresult` tinyint(1) NULL COMMENT '报告结果',
  `bgtype` varchar(20) NULL COMMENT '报告通知方式邮寄/自取',
  `bgexpress` varchar(20) NULL COMMENT '报告快递信息',
  `bgexpressdh` varchar(20) NULL COMMENT '邮寄单号',
  `bgexpressfy` float NULL COMMENT '邮寄费用',
  `express` varchar(20) NULL COMMENT '快递信息',
  `note` text NULL COMMENT '备注',
  `creattime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`cusid`) REFERENCES `me_customer` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
