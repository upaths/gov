/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : gov

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-09-12 19:56:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(45) NOT NULL COMMENT '单位名称',
  `leader_name` varchar(45) NOT NULL COMMENT '领队姓名',
  `post` varchar(45) NOT NULL COMMENT '职务',
  `contact_person` varchar(45) NOT NULL COMMENT '联系人',
  `contact_info` varchar(45) NOT NULL COMMENT '联系方式',
  `number` int(11) NOT NULL COMMENT '参观人数',
  `content` varchar(200) NOT NULL COMMENT '参观内容',
  `date` datetime NOT NULL COMMENT '参观时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='预约登记';

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES ('1', '1', '2', '3', '4', '5', '6', '7', '2015-09-08 00:00:00');
INSERT INTO `appointment` VALUES ('3', 'w', 'c', 'a', 'dw', 'fw', '12', 'wdawdawd', '2015-10-01 13:42:45');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `cat_id` int(10) DEFAULT NULL COMMENT '类别',
  `date` datetime NOT NULL COMMENT '录入日期',
  `source` varchar(50) DEFAULT NULL COMMENT '信息来源',
  `short_title` varchar(50) DEFAULT NULL COMMENT '短标题',
  `position_id` varchar(50) DEFAULT NULL COMMENT '推荐位',
  `display` tinyint(1) DEFAULT '0' COMMENT '是否显示，1为显示',
  `content` mediumtext COMMENT '内容',
  `read_time` int(10) DEFAULT '0' COMMENT '阅读次数',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键词',
  `summary` varchar(100) DEFAULT NULL COMMENT '摘要',
  `thumb` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `url` varchar(100) DEFAULT NULL COMMENT '跳转链接',
  `doc` varchar(100) DEFAULT NULL COMMENT '文件',
  `redirect` tinyint(1) DEFAULT NULL COMMENT '是否跳转',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `sub_title` varchar(100) DEFAULT NULL COMMENT '副标题',
  `bold` tinyint(1) DEFAULT NULL COMMENT '加粗',
  `color` varchar(45) DEFAULT NULL COMMENT '颜色',
  PRIMARY KEY (`id`),
  KEY `FK_article_lb` (`cat_id`),
  KEY `fk_article_xxly_idx` (`source`),
  KEY `fk_article_tjw_idx` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1081 DEFAULT CHARSET=utf8 COMMENT='文章';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('79', 'dwadawd', '101', '2015-10-17 19:10:45', '中央纪委监察部网站', '', null, '1', 'dawdawd', '1', '', 'dawdawd', '', '', null, null, null, '', null, '');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '名称',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT '父类别ID，空为一级类别',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  `category_type` varchar(45) NOT NULL COMMENT '栏目类型，1为栏目，2为单页，3为专题，4为外链，5为文件',
  `display` tinyint(1) NOT NULL COMMENT '导航是否显示',
  `url` varchar(45) DEFAULT NULL COMMENT '外链的链接地址',
  `templet` varchar(45) DEFAULT NULL COMMENT '模板',
  `thumb` varchar(100) DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='信息类别';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('57', '廉政视频', '0', '4', '1', '1', null, '/ftl/list.ftl', null);
INSERT INTO `category` VALUES ('58', '高层声音', '60', '1', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('59', '学思践悟', '0', '8', '1', '0', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('60', '资料库', '0', '5', '1', '1', null, '/ftl/list.ftl', null);
INSERT INTO `category` VALUES ('61', '清风东营', '0', '9', '1', '0', null, '', null);
INSERT INTO `category` VALUES ('62', '政策法规', '0', '6', '1', '0', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('63', '专题专栏', '0', '2', '1', '1', null, '/ftl/list_picture.ftl', null);
INSERT INTO `category` VALUES ('64', '纪律审查', '0', '6', '1', '0', null, '/ftl/list.ftl', null);
INSERT INTO `category` VALUES ('65', '机构概况', '0', '1', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('66', '领导机构', '65', '1', '2', '1', null, '/ftl/content_child.ftl', null);
INSERT INTO `category` VALUES ('67', '组织机构', '65', '3', '2', '1', null, '/ftl/content_child.ftl', null);
INSERT INTO `category` VALUES ('68', '单位概况', '65', '2', '2', '1', null, '/ftl/content_child.ftl', null);
INSERT INTO `category` VALUES ('70', '时政要闻', '0', '8', '1', '0', null, '/ftl/list.ftl', null);
INSERT INTO `category` VALUES ('71', '曝光台', '0', '9', '1', '0', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('72', '信访举报', '0', '10', '1', '0', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('73', '互动交流', '0', '11', '1', '0', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('74', '业务解答', '73', '1', '1', '1', null, '/ftl/list.ftl', null);
INSERT INTO `category` VALUES ('75', '每月E题', '73', '2', '3', '1', null, '/ftl/topic.ftl', null);
INSERT INTO `category` VALUES ('76', '网友留言', '104', '4', '1', '1', null, '/ftl/message.ftl', null);
INSERT INTO `category` VALUES ('77', '视频专题', '73', '4', '4', '1', 'www.baidu.com', null, null);
INSERT INTO `category` VALUES ('78', '学习园地', '0', '12', '1', '0', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('79', '德廉知识测评', '78', '1', '4', '1', 'www.baidu.com', null, null);
INSERT INTO `category` VALUES ('80', '方正之声', '78', '2', '5', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('81', '清风镜鉴', '78', '3', '5', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('82', '预约登记', '78', '4', '1', '1', null, '/ftl/appointment.ftl', null);
INSERT INTO `category` VALUES ('83', '清风长廊', '0', '7', '1', '0', null, '', null);
INSERT INTO `category` VALUES ('84', '廉政影像', '83', '1', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('85', '勤廉典型', '83', '2', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('86', '警钟长鸣', '83', '3', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('87', '廉政文化作品', '83', '4', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('88', '廉政时评', '83', '5', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('89', '市直', '71', '1', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('90', '东营区', '71', '2', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('91', '河口区', '71', '2', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('92', '广饶县', '71', '3', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('93', '垦利县', '71', '4', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('94', '利津县', '71', '5', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('95', '如何举报', '72', '1', '4', '1', 'http://www.ccdi.gov.cn/jubao/xfjbzn/', '', null);
INSERT INTO `category` VALUES ('96', '我要举报', '72', '2', '4', '1', 'http://dongying.jb.mirror.gov.cn/', null, null);
INSERT INTO `category` VALUES ('97', '其他途径', '72', '3', '2', '1', 'www.sina.com', '/ftl/content_child.ftl', null);
INSERT INTO `category` VALUES ('98', '举报查询', '72', '4', '4', '1', 'http://dongying.jb.mirror.gov.cn/', null, null);
INSERT INTO `category` VALUES ('99', '东营', '64', '1', '1', '0', null, null, null);
INSERT INTO `category` VALUES ('100', '其它', '64', '2', '1', '0', null, null, null);
INSERT INTO `category` VALUES ('101', '党内法规制度', '62', '1', '1', '0', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('102', '国家法律法规', '62', '2', '1', '0', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('103', '省内法规制度', '62', '3', '1', '0', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('104', '四风举报', '0', '13', '1', '0', null, null, null);
INSERT INTO `category` VALUES ('105', '曝光通报', '104', '1', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('106', '案例警示', '104', '2', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('107', '我要举报', '104', '3', '4', '1', 'report.html', null, null);
INSERT INTO `category` VALUES ('108', '巡查信箱', '73', '3', '4', '0', 'inspection.html', null, null);
INSERT INTO `category` VALUES ('109', '工作程序', '65', '4', '2', '1', null, '/ftl/content_child.ftl', null);
INSERT INTO `category` VALUES ('110', '业务顾问', '0', '3', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('111', '业务解答', '110', '1', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('112', '法律释义', '110', '2', '1', '1', null, '/ftl/list_child.ftl', null);
INSERT INTO `category` VALUES ('113', '清风文苑', '83', '6', '1', '1', null, '/ftl/list_child.ftl', null);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `name` varchar(45) DEFAULT NULL COMMENT '站点名',
  `domain_name` varchar(100) DEFAULT NULL COMMENT '域名',
  `filing_num` varchar(100) DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(100) DEFAULT NULL COMMENT '版权信息',
  `toggle` tinyint(1) DEFAULT NULL COMMENT '站点开启关闭',
  `close_info` varchar(100) DEFAULT NULL COMMENT '关闭提示信息',
  `title` varchar(100) DEFAULT NULL COMMENT '网站标题',
  `keyword` varchar(1000) DEFAULT NULL COMMENT '关键字词',
  `description` varchar(1000) DEFAULT NULL COMMENT '网站描述',
  `prevent_copy` tinyint(1) DEFAULT NULL COMMENT '防复制功能，1为是，其他为否'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站配置';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('xxxx网站', 'www.xxx.gov.cn', '地址：xx省xx市', '版权所有：xxxx', null, '站点升级中已关闭，请稍后访问。', 'xxxx', 'xxxx', 'xxxx', null);

-- ----------------------------
-- Table structure for inspection
-- ----------------------------
DROP TABLE IF EXISTS `inspection`;
CREATE TABLE `inspection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team` varchar(45) DEFAULT NULL COMMENT '组别',
  `organization` varchar(45) DEFAULT NULL COMMENT '巡视单位',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='巡视组';

-- ----------------------------
-- Records of inspection
-- ----------------------------
INSERT INTO `inspection` VALUES ('1', '省委第一巡视组', '章丘市、平阴县、济阳县', '1');
INSERT INTO `inspection` VALUES ('2', '省委第二巡视组', '即墨市、平度市、莱西市', '2');
INSERT INTO `inspection` VALUES ('3', '省委第三巡视组', '枣庄市薛城区、台儿庄区、峄城区', '3');
INSERT INTO `inspection` VALUES ('4', '省委第四巡视组', '青州市、寿光市、昌乐县', '4');
INSERT INTO `inspection` VALUES ('5', '省委第五巡视组', '威海市文登区、荣成市、乳山市', '5');
INSERT INTO `inspection` VALUES ('6', '省委第六巡视组', '曲阜市、金乡县、梁山县', '6');
INSERT INTO `inspection` VALUES ('7', '省委第七巡视组', '宁津县、武城县、庆云县', '7');

-- ----------------------------
-- Table structure for inspect_report
-- ----------------------------
DROP TABLE IF EXISTS `inspect_report`;
CREATE TABLE `inspect_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(50) DEFAULT NULL COMMENT '举报人',
  `report_contact` varchar(50) DEFAULT NULL COMMENT '举报人联系方式',
  `report_condition` varchar(100) DEFAULT NULL COMMENT '举报人情况',
  `reported_name` varchar(50) DEFAULT NULL COMMENT '被举报人',
  `reported_condition` varchar(100) DEFAULT NULL COMMENT '被举报人情况',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `problem` varchar(1000) DEFAULT NULL COMMENT '问题',
  `doc` varchar(100) DEFAULT NULL COMMENT '附件',
  `inspect_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inspect_report_inspect_id_idx` (`inspect_id`),
  CONSTRAINT `fk_inspect_report_inspect_id` FOREIGN KEY (`inspect_id`) REFERENCES `inspection` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='巡视组举报';

-- ----------------------------
-- Records of inspect_report
-- ----------------------------
INSERT INTO `inspect_report` VALUES ('2', '', '', '', '1', '3', '4', '5', null, '2', '2015-09-20 13:48:45', '127.0.0.1');
INSERT INTO `inspect_report` VALUES ('3', '', '', '', '12', '3', '4', '55', '/upload/7fa2f209-1d5e-41c5-be5d-5b9fe72b1c76.jpg', '2', '2015-09-20 13:52:14', '127.0.0.1');
INSERT INTO `inspect_report` VALUES ('4', '2', '3', '4', '5', '6', '7', '8', '/upload/4b65edc8-e2f0-4018-b4de-4bc58afbb9b4.jpg', '1', '2015-09-20 13:55:54', '127.0.0.1');

-- ----------------------------
-- Table structure for ip_forbid
-- ----------------------------
DROP TABLE IF EXISTS `ip_forbid`;
CREATE TABLE `ip_forbid` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ip禁止';

-- ----------------------------
-- Records of ip_forbid
-- ----------------------------

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `url` varchar(500) NOT NULL COMMENT '路径',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  `cat_id` int(10) DEFAULT NULL COMMENT '类别',
  PRIMARY KEY (`id`),
  KEY `pk_links_lb_idx` (`cat_id`),
  CONSTRAINT `fk_links_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `link_category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES ('1', '百度', 'www.baidu.com', '1', '2');
INSERT INTO `links` VALUES ('2', '新浪', 'www.sina.com', '2', '2');
INSERT INTO `links` VALUES ('3', '天涯', 'www.tianya.cn', '3', '2');
INSERT INTO `links` VALUES ('4', '猫扑', 'www.mop.com', '4', '2');
INSERT INTO `links` VALUES ('5', '奇艺', 'www.iqiyi.com/', '5', '2');
INSERT INTO `links` VALUES ('6', '腾讯', 'www.qq.com', '6', '3');
INSERT INTO `links` VALUES ('7', '优酷', 'www.youku.com', '7', '3');
INSERT INTO `links` VALUES ('8', '人人', 'www.renren.com', '8', '3');
INSERT INTO `links` VALUES ('9', '天猫', 'www.tmall.com', '9', '4');
INSERT INTO `links` VALUES ('10', '开心网', 'www.kaixin001.com', '10', '4');
INSERT INTO `links` VALUES ('11', '网易', 'www.163.com', '11', '5');
INSERT INTO `links` VALUES ('12', '搜狐', 'www.sohu.com', '12', '5');
INSERT INTO `links` VALUES ('13', '知乎', 'www.zhihu.com', '13', '6');

-- ----------------------------
-- Table structure for link_category
-- ----------------------------
DROP TABLE IF EXISTS `link_category`;
CREATE TABLE `link_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='友情链接类别';

-- ----------------------------
-- Records of link_category
-- ----------------------------
INSERT INTO `link_category` VALUES ('2', '中央纪委监察部', '1');
INSERT INTO `link_category` VALUES ('3', '山东省纪委监察厅', '2');
INSERT INTO `link_category` VALUES ('4', '各市纪检监察机关', '3');
INSERT INTO `link_category` VALUES ('5', '各县区纪检监察机关', '4');
INSERT INTO `link_category` VALUES ('6', '新闻媒体', '5');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL COMMENT '登录用户',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `success` tinyint(1) NOT NULL COMMENT '是否成功',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8 COMMENT='登录日志';

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('109', '127.0.0.1', 'admin', '2015-08-21 21:01:05', '1');
INSERT INTO `log` VALUES ('110', '127.0.0.1', 'admin', '2015-08-21 21:02:15', '1');
INSERT INTO `log` VALUES ('111', '127.0.0.1', 'admin', '2015-08-21 21:05:26', '1');
INSERT INTO `log` VALUES ('112', '127.0.0.1', 'admin', '2015-08-21 21:55:37', '1');
INSERT INTO `log` VALUES ('113', '127.0.0.1', 'admin', '2015-08-21 22:04:16', '1');
INSERT INTO `log` VALUES ('114', '127.0.0.1', 'admin', '2015-08-21 22:26:56', '1');
INSERT INTO `log` VALUES ('115', '127.0.0.1', 'admin', '2015-08-21 23:05:11', '1');
INSERT INTO `log` VALUES ('116', '127.0.0.1', 'admin', '2015-08-21 23:19:55', '0');
INSERT INTO `log` VALUES ('117', '127.0.0.1', 'admin', '2015-08-21 23:20:06', '0');
INSERT INTO `log` VALUES ('118', '127.0.0.1', 'admin', '2015-08-21 23:20:27', '1');
INSERT INTO `log` VALUES ('119', '127.0.0.1', 'admin', '2015-08-22 11:10:59', '1');
INSERT INTO `log` VALUES ('120', '127.0.0.1', 'admin', '2015-08-22 11:22:27', '1');
INSERT INTO `log` VALUES ('121', '127.0.0.1', 'admin', '2015-08-22 11:29:34', '1');
INSERT INTO `log` VALUES ('122', '127.0.0.1', 'admin', '2015-08-26 21:23:12', '1');
INSERT INTO `log` VALUES ('123', '127.0.0.1', 'admin', '2015-08-26 21:57:46', '1');
INSERT INTO `log` VALUES ('124', '127.0.0.1', 'admin', '2015-08-27 20:29:57', '1');
INSERT INTO `log` VALUES ('125', '127.0.0.1', 'admin', '2015-08-31 20:32:27', '1');
INSERT INTO `log` VALUES ('126', '127.0.0.1', 'admin', '2015-08-31 21:25:50', '1');
INSERT INTO `log` VALUES ('127', '127.0.0.1', 'admin', '2015-08-31 21:26:39', '1');
INSERT INTO `log` VALUES ('128', '127.0.0.1', 'admin', '2015-08-31 22:59:25', '1');
INSERT INTO `log` VALUES ('129', '127.0.0.1', 'admin', '2015-09-01 20:02:19', '1');
INSERT INTO `log` VALUES ('130', '127.0.0.1', 'admin', '2015-09-01 21:22:23', '1');
INSERT INTO `log` VALUES ('131', '127.0.0.1', 'admin', '2015-09-06 20:24:17', '1');
INSERT INTO `log` VALUES ('132', '127.0.0.1', 'admin', '2015-09-06 22:11:24', '1');
INSERT INTO `log` VALUES ('133', '127.0.0.1', 'admin', '2015-09-07 20:29:03', '1');
INSERT INTO `log` VALUES ('134', '127.0.0.1', 'admin', '2015-09-07 20:29:27', '1');
INSERT INTO `log` VALUES ('135', '127.0.0.1', 'admin', '2015-09-07 21:14:58', '1');
INSERT INTO `log` VALUES ('136', '127.0.0.1', 'admin', '2015-09-07 21:23:22', '1');
INSERT INTO `log` VALUES ('137', '127.0.0.1', 'admin', '2015-09-07 21:47:03', '1');
INSERT INTO `log` VALUES ('138', '127.0.0.1', 'admin', '2015-09-07 21:47:51', '1');
INSERT INTO `log` VALUES ('139', '127.0.0.1', 'admin', '2015-09-07 21:50:03', '1');
INSERT INTO `log` VALUES ('140', '127.0.0.1', 'admin', '2015-09-07 21:55:39', '1');
INSERT INTO `log` VALUES ('141', '127.0.0.1', 'admin', '2015-09-07 22:30:18', '1');
INSERT INTO `log` VALUES ('142', '127.0.0.1', 'admin', '2015-09-07 22:30:32', '1');
INSERT INTO `log` VALUES ('143', '127.0.0.1', 'site', '2015-09-07 22:30:41', '1');
INSERT INTO `log` VALUES ('144', '127.0.0.1', 'info', '2015-09-07 22:31:00', '1');
INSERT INTO `log` VALUES ('145', '127.0.0.1', 'info', '2015-09-07 22:42:02', '1');
INSERT INTO `log` VALUES ('146', '127.0.0.1', 'site', '2015-09-07 22:44:11', '1');
INSERT INTO `log` VALUES ('147', '127.0.0.1', 'info', '2015-09-07 22:49:37', '1');
INSERT INTO `log` VALUES ('148', '127.0.0.1', 'admin', '2015-09-08 09:12:17', '1');
INSERT INTO `log` VALUES ('149', '127.0.0.1', 'admin', '2015-09-08 15:49:59', '1');
INSERT INTO `log` VALUES ('150', '127.0.0.1', 'admin', '2015-09-08 16:14:45', '0');
INSERT INTO `log` VALUES ('151', '127.0.0.1', 'admin', '2015-09-08 16:15:12', '1');
INSERT INTO `log` VALUES ('152', '127.0.0.1', 'admin', '2015-09-08 20:53:35', '1');
INSERT INTO `log` VALUES ('153', '127.0.0.1', 'admin', '2015-09-08 21:09:50', '1');
INSERT INTO `log` VALUES ('154', '127.0.0.1', 'admin', '2015-09-08 21:11:05', '1');
INSERT INTO `log` VALUES ('155', '127.0.0.1', 'admin', '2015-09-08 21:12:06', '1');
INSERT INTO `log` VALUES ('156', '127.0.0.1', 'admin', '2015-09-08 21:15:37', '1');
INSERT INTO `log` VALUES ('157', '127.0.0.1', 'admin', '2015-09-08 21:47:30', '1');
INSERT INTO `log` VALUES ('158', '127.0.0.1', 'admin', '2015-09-08 21:48:39', '1');
INSERT INTO `log` VALUES ('159', '127.0.0.1', 'admin', '2015-09-08 21:50:50', '1');
INSERT INTO `log` VALUES ('160', '127.0.0.1', 'admin', '2015-09-08 21:55:13', '1');
INSERT INTO `log` VALUES ('161', '127.0.0.1', 'admin', '2015-09-08 22:06:17', '1');
INSERT INTO `log` VALUES ('162', '127.0.0.1', 'admin', '2015-09-08 22:34:28', '1');
INSERT INTO `log` VALUES ('163', '127.0.0.1', 'admin', '2015-09-08 22:36:48', '0');
INSERT INTO `log` VALUES ('164', '127.0.0.1', 'admin', '2015-09-08 22:36:58', '1');
INSERT INTO `log` VALUES ('165', '127.0.0.1', 'admin', '2015-09-08 22:45:47', '1');
INSERT INTO `log` VALUES ('166', '127.0.0.1', 'admin', '2015-09-08 22:58:45', '1');
INSERT INTO `log` VALUES ('167', '127.0.0.1', 'admin', '2015-09-08 22:58:45', '1');
INSERT INTO `log` VALUES ('168', '127.0.0.1', 'admin', '2015-09-08 23:01:58', '1');
INSERT INTO `log` VALUES ('169', '127.0.0.1', 'admin', '2015-09-09 10:40:24', '1');
INSERT INTO `log` VALUES ('170', '127.0.0.1', 'admin', '2015-09-09 10:43:39', '1');
INSERT INTO `log` VALUES ('171', '127.0.0.1', 'admin', '2015-09-09 10:50:11', '1');
INSERT INTO `log` VALUES ('172', '127.0.0.1', 'admin', '2015-09-09 10:53:48', '1');
INSERT INTO `log` VALUES ('173', '127.0.0.1', 'admin', '2015-09-09 11:35:30', '0');
INSERT INTO `log` VALUES ('174', '127.0.0.1', 'admin', '2015-09-09 11:35:45', '1');
INSERT INTO `log` VALUES ('175', '127.0.0.1', 'admin', '2015-09-12 10:19:15', '1');
INSERT INTO `log` VALUES ('176', '127.0.0.1', 'admin', '2015-09-12 10:22:16', '1');
INSERT INTO `log` VALUES ('177', '127.0.0.1', 'admin', '2015-09-12 11:01:39', '1');
INSERT INTO `log` VALUES ('178', '127.0.0.1', 'admin', '2015-09-12 11:24:29', '1');
INSERT INTO `log` VALUES ('179', '127.0.0.1', 'admin', '2015-09-12 11:29:30', '1');
INSERT INTO `log` VALUES ('180', '127.0.0.1', 'admin', '2015-09-12 17:06:09', '0');
INSERT INTO `log` VALUES ('181', '127.0.0.1', 'admin', '2015-09-12 17:06:16', '1');
INSERT INTO `log` VALUES ('182', '127.0.0.1', 'admin', '2015-09-12 17:12:11', '1');
INSERT INTO `log` VALUES ('183', '127.0.0.1', 'admin', '2015-09-12 17:21:33', '1');
INSERT INTO `log` VALUES ('184', '127.0.0.1', 'admin', '2015-09-12 21:44:45', '1');
INSERT INTO `log` VALUES ('185', '127.0.0.1', 'admin', '2015-09-12 22:09:57', '1');
INSERT INTO `log` VALUES ('186', '127.0.0.1', 'admin', '2015-09-12 23:03:01', '1');
INSERT INTO `log` VALUES ('187', '127.0.0.1', 'admin', '2015-09-12 23:44:28', '1');
INSERT INTO `log` VALUES ('188', '127.0.0.1', 'admin', '2015-09-13 00:09:15', '1');
INSERT INTO `log` VALUES ('189', '127.0.0.1', 'admin', '2015-09-13 12:29:51', '1');
INSERT INTO `log` VALUES ('190', '127.0.0.1', 'admin', '2015-09-13 13:48:45', '1');
INSERT INTO `log` VALUES ('191', '127.0.0.1', 'admin', '2015-09-13 14:08:10', '1');
INSERT INTO `log` VALUES ('192', '127.0.0.1', 'admin', '2015-09-13 14:32:29', '1');
INSERT INTO `log` VALUES ('193', '127.0.0.1', 'admin', '2015-09-13 14:35:59', '1');
INSERT INTO `log` VALUES ('194', '127.0.0.1', 'admin', '2015-09-13 14:37:35', '1');
INSERT INTO `log` VALUES ('195', '127.0.0.1', 'admin', '2015-09-13 15:23:20', '1');
INSERT INTO `log` VALUES ('196', '127.0.0.1', 'admin', '2015-09-13 15:26:00', '1');
INSERT INTO `log` VALUES ('197', '127.0.0.1', 'admin', '2015-09-13 15:30:13', '1');
INSERT INTO `log` VALUES ('198', '127.0.0.1', 'admin', '2015-09-13 15:33:57', '1');
INSERT INTO `log` VALUES ('199', '127.0.0.1', 'admin', '2015-09-13 15:46:26', '1');
INSERT INTO `log` VALUES ('200', '127.0.0.1', 'admin', '2015-09-13 16:02:59', '1');
INSERT INTO `log` VALUES ('201', '127.0.0.1', 'admin', '2015-09-13 16:09:20', '1');
INSERT INTO `log` VALUES ('202', '127.0.0.1', 'admin', '2015-09-13 16:35:20', '1');
INSERT INTO `log` VALUES ('203', '127.0.0.1', 'admin', '2015-09-14 16:16:15', '1');
INSERT INTO `log` VALUES ('204', '127.0.0.1', 'admin', '2015-09-14 18:27:55', '1');
INSERT INTO `log` VALUES ('205', '127.0.0.1', 'admin', '2015-09-17 09:44:52', '1');
INSERT INTO `log` VALUES ('206', '127.0.0.1', 'admin', '2015-09-19 08:36:51', '1');
INSERT INTO `log` VALUES ('207', '127.0.0.1', 'admin', '2015-09-19 09:02:42', '1');
INSERT INTO `log` VALUES ('208', '127.0.0.1', 'admin', '2015-09-19 09:05:26', '1');
INSERT INTO `log` VALUES ('209', '127.0.0.1', 'admin', '2015-09-19 09:58:17', '1');
INSERT INTO `log` VALUES ('210', '192.168.10.242', 'admin', '2015-09-19 10:09:29', '1');
INSERT INTO `log` VALUES ('211', '127.0.0.1', 'admin', '2015-09-19 10:15:09', '1');
INSERT INTO `log` VALUES ('212', '127.0.0.1', 'admin', '2015-09-19 10:30:32', '1');
INSERT INTO `log` VALUES ('213', '127.0.0.1', 'admin', '2015-09-19 10:50:49', '1');
INSERT INTO `log` VALUES ('214', '127.0.0.1', 'admin', '2015-09-19 11:43:44', '1');
INSERT INTO `log` VALUES ('215', '127.0.0.1', 'admin', '2015-09-20 10:35:27', '1');
INSERT INTO `log` VALUES ('216', '127.0.0.1', 'admin', '2015-09-20 13:56:16', '1');
INSERT INTO `log` VALUES ('217', '127.0.0.1', 'admin', '2015-09-20 14:27:35', '1');
INSERT INTO `log` VALUES ('218', '168.254.6.100', 'admin', '2015-09-20 15:00:20', '1');
INSERT INTO `log` VALUES ('219', '168.254.6.100', 'admin', '2015-09-20 17:02:20', '1');
INSERT INTO `log` VALUES ('220', '168.254.6.100', 'admin', '2015-09-20 17:37:10', '1');
INSERT INTO `log` VALUES ('221', '168.254.6.100', 'admin', '2015-09-21 08:24:16', '1');
INSERT INTO `log` VALUES ('222', '168.254.6.100', 'admin', '2015-09-21 09:53:31', '1');
INSERT INTO `log` VALUES ('223', '168.254.6.100', 'admin', '2015-09-21 13:56:24', '1');
INSERT INTO `log` VALUES ('224', '168.254.6.34', 'admin', '2015-09-21 14:12:52', '1');
INSERT INTO `log` VALUES ('225', '168.254.6.121', 'admin', '2015-09-21 14:13:40', '1');
INSERT INTO `log` VALUES ('226', '168.254.6.121', 'admin', '2015-09-21 14:27:47', '1');
INSERT INTO `log` VALUES ('227', '168.254.6.121', 'admin', '2015-09-21 14:33:40', '1');
INSERT INTO `log` VALUES ('228', '168.254.6.121', 'admin', '2015-09-21 14:34:42', '1');
INSERT INTO `log` VALUES ('229', '168.254.6.121', 'admin', '2015-09-21 14:43:57', '1');
INSERT INTO `log` VALUES ('230', '168.254.6.34', 'admin', '2015-09-21 15:01:22', '1');
INSERT INTO `log` VALUES ('231', '168.254.6.100', 'admin', '2015-09-22 10:38:26', '1');
INSERT INTO `log` VALUES ('232', '168.254.6.100', 'admin', '2015-09-22 11:36:42', '1');
INSERT INTO `log` VALUES ('233', '127.0.0.1', 'admin', '2015-09-22 22:26:52', '1');
INSERT INTO `log` VALUES ('234', '127.0.0.1', 'admin', '2015-09-22 22:53:28', '1');
INSERT INTO `log` VALUES ('235', '127.0.0.1', 'admin', '2015-09-22 23:10:22', '1');
INSERT INTO `log` VALUES ('236', '127.0.0.1', 'admin', '2015-09-22 23:15:41', '1');
INSERT INTO `log` VALUES ('237', '127.0.0.1', 'admin', '2015-09-22 23:17:54', '1');
INSERT INTO `log` VALUES ('238', '127.0.0.1', 'admin', '2015-09-22 23:33:11', '1');
INSERT INTO `log` VALUES ('239', '127.0.0.1', 'admin', '2015-09-22 23:34:22', '1');
INSERT INTO `log` VALUES ('240', '127.0.0.1', 'admin', '2015-09-22 23:37:36', '1');
INSERT INTO `log` VALUES ('241', '127.0.0.1', 'admin', '2015-09-22 23:39:11', '1');
INSERT INTO `log` VALUES ('242', '127.0.0.1', 'admin', '2015-09-22 23:42:27', '0');
INSERT INTO `log` VALUES ('243', '127.0.0.1', 'admin', '2015-09-22 23:42:34', '1');
INSERT INTO `log` VALUES ('244', '127.0.0.1', 'admin', '2015-09-22 23:51:22', '1');
INSERT INTO `log` VALUES ('245', '127.0.0.1', 'admin', '2015-10-17 10:43:04', '1');
INSERT INTO `log` VALUES ('246', '127.0.0.1', 'admin', '2015-10-17 11:15:16', '1');
INSERT INTO `log` VALUES ('247', '127.0.0.1', 'admin', '2015-10-17 12:12:53', '1');
INSERT INTO `log` VALUES ('248', '127.0.0.1', 'admin', '2015-10-17 12:17:22', '1');
INSERT INTO `log` VALUES ('249', '127.0.0.1', 'admin', '2015-10-17 14:00:19', '1');
INSERT INTO `log` VALUES ('250', '127.0.0.1', 'admin', '2015-10-17 15:25:28', '1');
INSERT INTO `log` VALUES ('251', '127.0.0.1', 'admin', '2015-10-17 15:26:41', '1');
INSERT INTO `log` VALUES ('252', '127.0.0.1', 'admin', '2015-10-17 15:56:20', '1');
INSERT INTO `log` VALUES ('253', '127.0.0.1', 'admin', '2015-10-17 16:39:20', '1');
INSERT INTO `log` VALUES ('254', '127.0.0.1', 'admin', '2015-10-17 16:47:41', '1');
INSERT INTO `log` VALUES ('255', '127.0.0.1', 'admin', '2015-10-17 16:59:40', '1');
INSERT INTO `log` VALUES ('256', '127.0.0.1', 'admin', '2015-10-17 19:09:10', '1');
INSERT INTO `log` VALUES ('257', '127.0.0.1', 'admin', '2015-10-17 19:10:35', '1');
INSERT INTO `log` VALUES ('258', '127.0.0.1', 'admin', '2015-10-17 19:27:49', '1');
INSERT INTO `log` VALUES ('259', '127.0.0.1', 'admin', '2015-10-17 20:09:51', '1');
INSERT INTO `log` VALUES ('260', '127.0.0.1', 'admin', '2015-10-17 23:19:28', '1');
INSERT INTO `log` VALUES ('261', '127.0.0.1', 'admin', '2015-10-17 23:22:47', '1');
INSERT INTO `log` VALUES ('262', '127.0.0.1', 'admin', '2015-10-17 23:23:58', '1');
INSERT INTO `log` VALUES ('263', '127.0.0.1', 'admin', '2015-10-17 23:25:10', '0');
INSERT INTO `log` VALUES ('264', '127.0.0.1', 'admin', '2015-10-17 23:25:22', '1');
INSERT INTO `log` VALUES ('265', '127.0.0.1', 'admin', '2015-10-17 23:26:10', '1');
INSERT INTO `log` VALUES ('266', '127.0.0.1', 'admin', '2015-10-17 23:26:37', '1');
INSERT INTO `log` VALUES ('267', '127.0.0.1', 'admin', '2015-10-17 23:26:55', '1');
INSERT INTO `log` VALUES ('268', '127.0.0.1', 'admin', '2015-10-18 00:00:43', '1');
INSERT INTO `log` VALUES ('269', '127.0.0.1', 'admin', '2015-10-18 10:12:11', '1');
INSERT INTO `log` VALUES ('270', '127.0.0.1', 'admin', '2015-10-18 11:01:03', '1');
INSERT INTO `log` VALUES ('271', '127.0.0.1', 'admin', '2015-10-18 11:11:02', '1');
INSERT INTO `log` VALUES ('272', '127.0.0.1', 'admin', '2015-10-30 18:43:17', '1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `net_name` varchar(45) DEFAULT NULL COMMENT '网名',
  `ip` varchar(45) DEFAULT NULL,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `display` tinyint(1) DEFAULT '0' COMMENT '是否显示',
  `telephone` varchar(45) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='投诉建议';

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '王二小', '127.0.0.1', '留言标题', '留言内容', '2012-11-28 23:27:43', '1', null);
INSERT INTO `message` VALUES ('2', '', '127.0.0.1', 'ww', 'dwad', '2015-09-13 14:07:32', '1', '');
INSERT INTO `message` VALUES ('3', 'dwd', '127.0.0.1', 'ww', 'daw', '2015-09-13 14:07:42', '1', 'dw');
INSERT INTO `message` VALUES ('4', '&#23567;&#20255;', '168.254.6.100', '00000000', '&#28857;&#28857;&#28404;&#28404;', '2015-09-21 17:12:02', '1', '18865467725');

-- ----------------------------
-- Table structure for message_reply
-- ----------------------------
DROP TABLE IF EXISTS `message_reply`;
CREATE TABLE `message_reply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL COMMENT '日期',
  `message_id` int(11) unsigned NOT NULL,
  `reply` text NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='建议回复';

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dwmc` varchar(45) NOT NULL COMMENT '单位名称',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT '父单位，空为一级单位',
  `description` text COMMENT '描述，如果没有描述则显示第一个子单位描述',
  `px` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('8', '县局职能', null, '在此编辑县局职能~', '1');
INSERT INTO `organization` VALUES ('9', '县局领导', null, '在此编辑<span>县局领导内容~</span>', '2');
INSERT INTO `organization` VALUES ('10', '直属机构', null, '在此编辑直属机构内容~', '3');
INSERT INTO `organization` VALUES ('11', '制度制定', null, '在此编辑制度指定内容~', '4');
INSERT INTO `organization` VALUES ('12', '信息公开', null, '<p>\r\n	在此编辑信息公开内容~\r\n</p>', '5');
INSERT INTO `organization` VALUES ('13', '广饶县质量技术监督局稽查队', '10', '在此编辑广饶县质量技术监督局稽查队内容~', '1');
INSERT INTO `organization` VALUES ('14', '广饶县计量测试检定所', '10', '在此编辑<span style=\"font-family:宋体;font-size:12px;\">广饶县计量测试检定所内容</span>', '2');
INSERT INTO `organization` VALUES ('15', '广饶县产品质量监督检验所', '10', '在此编辑<span style=\"font-family:宋体;font-size:12px;\">广饶县产品质量监督检验所内容~</span>', '3');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '名称',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='推荐位';

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '特别关注', '1');
INSERT INTO `position` VALUES ('2', '首页轮显', '2');
INSERT INTO `position` VALUES ('3', '首页清风长廊', '3');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(50) DEFAULT NULL COMMENT '举报人',
  `report_contact` varchar(50) DEFAULT NULL COMMENT '举报人联系方式',
  `report_condition` varchar(100) DEFAULT NULL COMMENT '举报人情况',
  `reported_name` varchar(50) DEFAULT NULL COMMENT '被举报人',
  `reported_condition` varchar(100) DEFAULT NULL COMMENT '被举报人情况',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `problem` varchar(1000) DEFAULT NULL COMMENT '问题',
  `doc` varchar(100) DEFAULT NULL COMMENT '附件',
  `date` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', '23', '32', '332', '323', '323', '323', '323', '/upload/b53ceff3-abb5-4d5f-8973-00132f2aaf80.jpg', '2015-09-20 14:27:06', '127.0.0.1');

-- ----------------------------
-- Table structure for report_admin
-- ----------------------------
DROP TABLE IF EXISTS `report_admin`;
CREATE TABLE `report_admin` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='举报管理员';

-- ----------------------------
-- Records of report_admin
-- ----------------------------
INSERT INTO `report_admin` VALUES ('sifeng', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `report_admin` VALUES ('xinfang', 'E10ADC3949BA59ABBE56E057F20F883E');

-- ----------------------------
-- Table structure for report_msg
-- ----------------------------
DROP TABLE IF EXISTS `report_msg`;
CREATE TABLE `report_msg` (
  `id` varchar(32) NOT NULL,
  `report_name` varchar(45) DEFAULT NULL COMMENT '举报人',
  `report_id` varchar(45) DEFAULT NULL,
  `report_contact` varchar(45) DEFAULT NULL COMMENT '举报人联系方式',
  `report_status` varchar(45) DEFAULT NULL COMMENT '举报人政治面貌',
  `report_address` varchar(45) DEFAULT NULL COMMENT '举报人住址',
  `report_level` varchar(45) DEFAULT NULL COMMENT '举报人级别',
  `reported_name` varchar(45) NOT NULL COMMENT '被举报人姓名',
  `reported_org` varchar(45) NOT NULL COMMENT '被举报人单位',
  `reported_post` varchar(45) NOT NULL COMMENT '被举报人职务',
  `reported_level` varchar(45) NOT NULL COMMENT '被举报人级别',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `problem_type` varchar(45) NOT NULL COMMENT '问题类别',
  `problem_type_detail` varchar(45) NOT NULL COMMENT '问题细类',
  `problem` text NOT NULL COMMENT '问题',
  `answer` varchar(2000) DEFAULT NULL COMMENT '答复',
  `answered` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否答复',
  `signed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否署名',
  `org` varchar(45) NOT NULL COMMENT '单位',
  `date` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='举报信息';

-- ----------------------------
-- Records of report_msg
-- ----------------------------

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '名称',
  `url` varchar(45) DEFAULT NULL COMMENT '路径',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='访问资源（目录树）';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '站点管理', null, null, '1');
INSERT INTO `resource` VALUES ('2', '站点基本设置', '/admin/config_query.action', '1', '1');
INSERT INTO `resource` VALUES ('3', '用户管理', null, null, '2');
INSERT INTO `resource` VALUES ('4', '添加用户', '/admin/user_toAdd.action', '3', '2');
INSERT INTO `resource` VALUES ('5', '管理用户', '/admin/user_query.action', '3', '1');
INSERT INTO `resource` VALUES ('6', '修改密码', '/admin/user_toChangePassword.action', '3', '3');
INSERT INTO `resource` VALUES ('7', '栏目管理', '', null, '3');
INSERT INTO `resource` VALUES ('8', '管理栏目', '/admin/category_query.action', '7', '1');
INSERT INTO `resource` VALUES ('9', '添加栏目', '/admin/category_toAdd.action?type=1', '7', '2');
INSERT INTO `resource` VALUES ('10', '添加单页', '/admin/category_toAdd.action?type=2', '7', '3');
INSERT INTO `resource` VALUES ('11', '添加专题', '/admin/category_toAdd.action?type=3', '7', '4');
INSERT INTO `resource` VALUES ('12', '添加外链', '/admin/category_toAdd.action?type=4', '7', '5');
INSERT INTO `resource` VALUES ('13', '内容管理', null, null, '4');
INSERT INTO `resource` VALUES ('14', '管理内容', '/admin/article_main.action', '13', '1');
INSERT INTO `resource` VALUES ('15', '审核内容', '/admin/article_review.action', '13', '2');
INSERT INTO `resource` VALUES ('16', '管理来源', '/admin/source_query.action', '13', '3');
INSERT INTO `resource` VALUES ('17', '管理推荐位', '/admin/position_query.action', '13', '4');
INSERT INTO `resource` VALUES ('18', '互动管理', null, null, '5');
INSERT INTO `resource` VALUES ('19', '添加话题', '/admin/topic_toAdd.action', '18', '2');
INSERT INTO `resource` VALUES ('20', '管理话题', '/admin/topic_query.action', '18', '1');
INSERT INTO `resource` VALUES ('22', '审核留言', '/admin/msg_query.action', '18', '4');
INSERT INTO `resource` VALUES ('23', '预约登记', '/admin/apt_query.action', '18', '5');
INSERT INTO `resource` VALUES ('24', '系统扩展', null, null, '6');
INSERT INTO `resource` VALUES ('25', '后台操作日志', '/admin/log_query.action', '24', '1');
INSERT INTO `resource` VALUES ('26', 'IP地址禁止', '/admin/ip_forbid_query.action', '24', '2');
INSERT INTO `resource` VALUES ('27', '添加文件', '/admin/category_toAdd.action?type=5', '7', '6');
INSERT INTO `resource` VALUES ('28', '友情链接', '/admin/links_query.action', '24', '3');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(45) DEFAULT NULL COMMENT '角色编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', 'SUPER_ADMIN');
INSERT INTO `role` VALUES ('2', '站点管理员', 'SITE_ADMIN');
INSERT INTO `role` VALUES ('3', '发布人员', 'INFO_ENTRY');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_role_resource_role_idx` (`role_id`),
  KEY `pk_role_resource_resource_idx` (`resource_id`),
  CONSTRAINT `pk_role_resource_resource_id` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_role_resource_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='角色资源表';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('1', '1', '1');
INSERT INTO `role_resource` VALUES ('2', '1', '2');
INSERT INTO `role_resource` VALUES ('3', '1', '3');
INSERT INTO `role_resource` VALUES ('4', '1', '4');
INSERT INTO `role_resource` VALUES ('5', '1', '5');
INSERT INTO `role_resource` VALUES ('6', '1', '6');
INSERT INTO `role_resource` VALUES ('7', '1', '7');
INSERT INTO `role_resource` VALUES ('8', '1', '8');
INSERT INTO `role_resource` VALUES ('9', '1', '9');
INSERT INTO `role_resource` VALUES ('10', '1', '10');
INSERT INTO `role_resource` VALUES ('11', '1', '11');
INSERT INTO `role_resource` VALUES ('12', '1', '12');
INSERT INTO `role_resource` VALUES ('13', '1', '13');
INSERT INTO `role_resource` VALUES ('14', '1', '14');
INSERT INTO `role_resource` VALUES ('15', '1', '15');
INSERT INTO `role_resource` VALUES ('16', '1', '16');
INSERT INTO `role_resource` VALUES ('17', '1', '17');
INSERT INTO `role_resource` VALUES ('18', '1', '18');
INSERT INTO `role_resource` VALUES ('19', '1', '19');
INSERT INTO `role_resource` VALUES ('20', '1', '20');
INSERT INTO `role_resource` VALUES ('22', '1', '22');
INSERT INTO `role_resource` VALUES ('23', '1', '23');
INSERT INTO `role_resource` VALUES ('24', '1', '24');
INSERT INTO `role_resource` VALUES ('25', '1', '25');
INSERT INTO `role_resource` VALUES ('26', '1', '26');
INSERT INTO `role_resource` VALUES ('27', '1', '27');
INSERT INTO `role_resource` VALUES ('28', '1', '28');
INSERT INTO `role_resource` VALUES ('29', '2', '1');
INSERT INTO `role_resource` VALUES ('30', '2', '2');
INSERT INTO `role_resource` VALUES ('31', '2', '3');
INSERT INTO `role_resource` VALUES ('32', '2', '6');
INSERT INTO `role_resource` VALUES ('33', '2', '13');
INSERT INTO `role_resource` VALUES ('34', '2', '14');
INSERT INTO `role_resource` VALUES ('35', '2', '15');
INSERT INTO `role_resource` VALUES ('36', '2', '16');
INSERT INTO `role_resource` VALUES ('37', '2', '18');
INSERT INTO `role_resource` VALUES ('38', '2', '19');
INSERT INTO `role_resource` VALUES ('39', '2', '20');
INSERT INTO `role_resource` VALUES ('41', '2', '22');
INSERT INTO `role_resource` VALUES ('42', '2', '23');
INSERT INTO `role_resource` VALUES ('43', '2', '24');
INSERT INTO `role_resource` VALUES ('44', '2', '25');
INSERT INTO `role_resource` VALUES ('45', '2', '26');
INSERT INTO `role_resource` VALUES ('46', '2', '28');
INSERT INTO `role_resource` VALUES ('47', '3', '3');
INSERT INTO `role_resource` VALUES ('48', '3', '6');
INSERT INTO `role_resource` VALUES ('49', '3', '13');
INSERT INTO `role_resource` VALUES ('50', '3', '14');

-- ----------------------------
-- Table structure for source
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '名称',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章来源';

-- ----------------------------
-- Records of source
-- ----------------------------
INSERT INTO `source` VALUES ('1', '中央纪委监察部网站', '1');
INSERT INTO `source` VALUES ('2', '山东纪委监察厅网站', '2');
INSERT INTO `source` VALUES ('3', '东营纪委监察局网站', '3');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='专题';

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('2', 'aaaa', 'aafdfdfds', '2015年09月');
INSERT INTO `topic` VALUES ('3', 'a', 'b', '2015年11月');
INSERT INTO `topic` VALUES ('4', '232323', '<strong>dwadwda</strong>', '2015年09月');

-- ----------------------------
-- Table structure for topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `topic_comment`;
CREATE TABLE `topic_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `net_name` varchar(45) DEFAULT NULL COMMENT '网名',
  `ip` varchar(45) DEFAULT NULL COMMENT '评论ip',
  `comment` varchar(1000) NOT NULL COMMENT '评论',
  `date` datetime DEFAULT NULL COMMENT '评论日期',
  `display` tinyint(1) DEFAULT '0' COMMENT '是否显示',
  `topic_id` int(11) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`),
  KEY `fk_topic_comment_topic_id_idx` (`topic_id`),
  CONSTRAINT `fk_topic_comment_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='专题评论';

-- ----------------------------
-- Records of topic_comment
-- ----------------------------
INSERT INTO `topic_comment` VALUES ('1', '323', '127.0.0.1', '32323', '2015-09-08 01:00:00', '1', '2', null);
INSERT INTO `topic_comment` VALUES ('2', '32323', '127.0.0.1', '3adsadadwada', '2015-09-08 01:00:00', '0', '2', null);
INSERT INTO `topic_comment` VALUES ('4', 'ww', '127.0.0.1', '瞄准监督对象，聚焦“两个责任”，确保监督无空档。为切实加强对驻在部门单位的监督检查，对各统管派驻纪检组负责监督检查的驻在部门单位实行定期轮换调整制度。', '2015-09-13 15:33:44', '1', '3', '123456');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL,
  `realname` varchar(45) DEFAULT NULL COMMENT '真实姓名',
  `ip` varchar(45) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'E10ADC3949BA59ABBE56E057F20F883E', '超级管理员', '127.0.0.1', '2015-10-30 18:43:17');
INSERT INTO `user` VALUES ('info', 'E10ADC3949BA59ABBE56E057F20F883E', '发布人员', '127.0.0.1', '2015-09-07 22:49:37');
INSERT INTO `user` VALUES ('site', 'E10ADC3949BA59ABBE56E057F20F883E', '站点管理员', '127.0.0.1', '2015-09-07 22:44:11');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL COMMENT '用户名',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_role_role_idx` (`role_id`),
  KEY `fk_user_role_user_idx` (`username`),
  CONSTRAINT `fk_user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_username` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户、角色关系表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('5', 'admin', '1');
INSERT INTO `user_role` VALUES ('6', 'site', '2');
INSERT INTO `user_role` VALUES ('7', 'info', '3');
