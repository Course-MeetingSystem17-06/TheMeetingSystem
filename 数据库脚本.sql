/*
Navicat MySQL Data Transfer

Source Server         : my
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : meeting

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-07-07 14:59:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `Depart_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Depart_name` varchar(255) NOT NULL,
  PRIMARY KEY (`Depart_ID`),
  KEY `Depart_name` (`Depart_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('19', 'wua');
INSERT INTO `department` VALUES ('17', '开发部');
INSERT INTO `department` VALUES ('18', '销售部');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_name` varchar(255) NOT NULL,
  `Employee_password` varchar(255) NOT NULL,
  `Employee_username` varchar(255) NOT NULL,
  `Employee_telenumber` varchar(30) NOT NULL,
  `Employee_Email` varchar(255) NOT NULL,
  `Employee_department` varchar(255) NOT NULL,
  `Employee_state` int(11) NOT NULL DEFAULT '0',
  `Employee_limit` int(11) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Staff_Department` (`Employee_department`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('23', '姚汝达', 'aaa1111', 'yrd', '123456', '123456', '人事部', '1', '1');
INSERT INTO `employee` VALUES ('24', '刘子琪', 'a123456', '647', '123456', '123456', '人事部', '1', '1');
INSERT INTO `employee` VALUES ('25', '张三', 'aaa1111', 'zs', '19384758672', '128387jsdh@163.com', '开发部', '1', '2');
INSERT INTO `employee` VALUES ('26', '李四', 'aaa1111', 'lisi', '10293847567', 'lisi@126.com', '开发部', '1', '2');
INSERT INTO `employee` VALUES ('27', '王五', 'aaa1111', 'wangwu', '1928374758', 'wangwu@126.com', '开发部', '1', '2');
INSERT INTO `employee` VALUES ('28', 'Tom', 'aaa1111', 'Tom', '18273954759', 'tom222@163.com', '开发部', '1', '2');
INSERT INTO `employee` VALUES ('29', 'Jerry', 'aaa1111', 'Jerry', '18293847598', 'jefry@163.com', '开发部', '2', '2');
INSERT INTO `employee` VALUES ('30', 'Peter', 'aaa1111', 'Peter', '1827384758', 'peter@126.com', '销售部', '1', '2');
INSERT INTO `employee` VALUES ('31', '乌阿', 'aaa1111', 'wua', '64739573', '288kf@163.com', '销售部', '2', '2');
INSERT INTO `employee` VALUES ('32', ' ooo', 'aaa1111', ' ooo', '124451', '3254235', '开发部', '0', '2');

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting` (
  `Meeting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Meeting_name` varchar(255) NOT NULL COMMENT '会议名称',
  `Meeting_rname` varchar(255) NOT NULL COMMENT '会议室名称',
  `Meeting_pnumber` int(11) NOT NULL COMMENT '预计参加人数 Participate number',
  `Meeting_stime` datetime NOT NULL COMMENT '预计开始时间',
  `Meeting_etime` datetime NOT NULL COMMENT '预计结束时间',
  `Meeting_illustrate` varchar(255) DEFAULT NULL COMMENT '会议说明',
  `Meeting_booker` varchar(255) NOT NULL,
  `Meeting_state` int(11) NOT NULL,
  `Meeting_bookdate` datetime NOT NULL,
  `Meeting_cancelreason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Meeting_id`),
  KEY `Meeting_mname` (`Meeting_rname`),
  CONSTRAINT `Meeting_mname` FOREIGN KEY (`Meeting_rname`) REFERENCES `meetingroom` (`MeetingRoom_name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES ('39', '总结会', '第一会议室', '2', '2017-07-07 12:53:20', '2017-07-08 12:53:22', '444', '姚汝达', '2', '2017-07-07 12:53:29', '');
INSERT INTO `meeting` VALUES ('40', '报告会', '会议厅', '3', '2017-07-07 12:56:06', '2017-07-08 12:56:09', '', '姚汝达', '1', '2017-07-07 12:57:25', null);
INSERT INTO `meeting` VALUES ('41', '什么都不干', '第一会议室', '1', '2017-07-08 13:07:40', '2017-07-09 13:07:40', '什么都不干，就是想开个会！', '姚汝达', '1', '2017-07-07 13:08:10', null);
INSERT INTO `meeting` VALUES ('42', '乌阿大会', '第二会议室', '5', '2017-07-13 14:36:56', '2017-07-14 14:36:56', '乌阿开会', '姚汝达', '2', '2017-07-07 14:37:16', '222');

-- ----------------------------
-- Table structure for meetingemployee
-- ----------------------------
DROP TABLE IF EXISTS `meetingemployee`;
CREATE TABLE `meetingemployee` (
  `Employee_ID` int(11) NOT NULL,
  `Meeting_ID` int(11) NOT NULL,
  `MeetingEmployee_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`MeetingEmployee_ID`),
  KEY `meeting` (`Meeting_ID`),
  KEY `2` (`Employee_ID`),
  CONSTRAINT `2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`),
  CONSTRAINT `meeting` FOREIGN KEY (`Meeting_id`) REFERENCES `meeting` (`Meeting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meetingemployee
-- ----------------------------
INSERT INTO `meetingemployee` VALUES ('23', '39', '38');
INSERT INTO `meetingemployee` VALUES ('24', '39', '39');
INSERT INTO `meetingemployee` VALUES ('26', '40', '40');
INSERT INTO `meetingemployee` VALUES ('25', '40', '41');
INSERT INTO `meetingemployee` VALUES ('28', '40', '42');
INSERT INTO `meetingemployee` VALUES ('23', '41', '43');
INSERT INTO `meetingemployee` VALUES ('23', '42', '44');
INSERT INTO `meetingemployee` VALUES ('24', '42', '45');
INSERT INTO `meetingemployee` VALUES ('25', '42', '46');
INSERT INTO `meetingemployee` VALUES ('28', '42', '47');
INSERT INTO `meetingemployee` VALUES ('30', '42', '48');

-- ----------------------------
-- Table structure for meetingroom
-- ----------------------------
DROP TABLE IF EXISTS `meetingroom`;
CREATE TABLE `meetingroom` (
  `MeetingRoom_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MeetingRoom_number` varchar(10) NOT NULL,
  `MeetingRoom_name` varchar(20) NOT NULL,
  `MeetingRoom_max` int(11) NOT NULL,
  `MeetingRoom_state` int(11) NOT NULL,
  `MeetingRoom_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MeetingRoom_ID`),
  KEY `MeetingRoom_name` (`MeetingRoom_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meetingroom
-- ----------------------------
INSERT INTO `meetingroom` VALUES ('10', '201', '第一会议室', '20', '1', '20人会议室,桌椅+投影设备+饮水机.');
INSERT INTO `meetingroom` VALUES ('11', '205', '会议厅', '200', '1', '特殊情况时,最多容纳300人.');
INSERT INTO `meetingroom` VALUES ('12', '202', '第二会议室', '30', '1', '30人,咖啡及+椅子+投影仪.');
INSERT INTO `meetingroom` VALUES ('13', '203', '小组会议室A', '10', '1', '随时可借用.桌椅+投影仪.');
INSERT INTO `meetingroom` VALUES ('14', '204', '小组会议室B', '5', '1', '随时可借用.桌椅+投影仪.');
INSERT INTO `meetingroom` VALUES ('15', '101', '会议室A', '15', '0', ' ');
