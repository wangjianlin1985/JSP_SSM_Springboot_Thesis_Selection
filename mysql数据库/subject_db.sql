/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : subject_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-07-02 16:27:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_classinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_classinfo`;
CREATE TABLE `t_classinfo` (
  `classNo` varchar(20) NOT NULL COMMENT 'classNo',
  `className` varchar(40) NOT NULL COMMENT '班级名称',
  `college` varchar(30) NOT NULL COMMENT '所属学院',
  `specialName` varchar(30) NOT NULL COMMENT '所属专业',
  `bornDate` varchar(20) default NULL COMMENT '成立日期',
  `mainTeacher` varchar(20) NOT NULL COMMENT '班主任',
  `classMemo` varchar(500) default NULL COMMENT '班级备注',
  PRIMARY KEY  (`classNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_classinfo
-- ----------------------------
INSERT INTO `t_classinfo` VALUES ('BJ001', '2018级计算机1班', '信息工程学院', '计算机科学与技术', '2018-03-01', '李明杰', 'test');
INSERT INTO `t_classinfo` VALUES ('BJ002', '2018级计算机2班', '信息工程学院', '计算机科学与技术', '2018-03-02', '李威', '优秀班级');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '老师回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '我怎么学习好安卓移动开发？', '我现在想学习安卓移动开发，那么多工具，我应当如何下手', 'STU001', '2018-03-04 16:48:26', '要先熟悉java编程，然后学习安卓几大组件！', '2018-03-04 16:48:35');
INSERT INTO `t_leaveword` VALUES ('2', '要多久才能学会安卓？', '我想进入新浪这样的大公司开发安卓的话，一般要学习多久？', 'STU001', '2018-03-08 00:22:05', '--', '--');
INSERT INTO `t_leaveword` VALUES ('3', 'aaaaa', 'bbbbb', 'STU001', '2018-03-10 11:17:46', 'cccc', '2018-03-10 11:18:19');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '新闻id',
  `title` varchar(80) NOT NULL COMMENT '新闻标题',
  `content` varchar(5000) NOT NULL COMMENT '新闻内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '学生选题网站成立了', '<p>同学们赶快来这里抢论文题目了，老师优质题目有限！</p>', '2018-03-04 16:49:11');

-- ----------------------------
-- Table structure for `t_opus`
-- ----------------------------
DROP TABLE IF EXISTS `t_opus`;
CREATE TABLE `t_opus` (
  `opusId` int(11) NOT NULL auto_increment COMMENT '成果id',
  `subjectObj` int(11) NOT NULL COMMENT '论文题目',
  `userObj` varchar(30) NOT NULL COMMENT '提交学生',
  `ktbg` varchar(60) NOT NULL COMMENT '开题报告',
  `wwwx` varchar(60) NOT NULL COMMENT '外文文献翻译',
  `lwcg` varchar(60) NOT NULL COMMENT '论文初稿',
  `lwzg` varchar(60) NOT NULL COMMENT '论文终稿',
  `otherFile` varchar(60) NOT NULL COMMENT '其他文件',
  `chengji` varchar(20) default NULL COMMENT '论文成绩',
  `evaluate` varchar(500) default NULL COMMENT '老师评价',
  PRIMARY KEY  (`opusId`),
  KEY `subjectObj` (`subjectObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_opus_ibfk_1` FOREIGN KEY (`subjectObj`) REFERENCES `t_subject` (`subjectId`),
  CONSTRAINT `t_opus_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_opus
-- ----------------------------
INSERT INTO `t_opus` VALUES ('1', '1', 'STU001', 'upload/f65e53e2-0b69-432d-afcf-7aa9a9ea6410.doc', 'upload/8153ba04-d7d0-47f4-8006-a10c01c0fca7.doc', 'upload/36e1cb7e-616a-44ac-a8ae-c436b8626ccb.doc', 'upload/34daba9a-d53f-4c99-b90e-edab4b1f8e79.doc', '', '83分', '还可以');
INSERT INTO `t_opus` VALUES ('2', '1', 'STU002', 'upload/093fe9e2-98d5-4acc-87f7-3172ab0f38b8.doc', 'upload/61bc2317-1058-45cf-935b-25b97b93df5b.doc', 'upload/4a06a23d-90e5-47c3-8423-21bfdd01b69b.doc', 'upload/69e50e8a-b9f1-48c4-a3c1-93778f1fc646.doc', '', '93', '做的非常good');

-- ----------------------------
-- Table structure for `t_subject`
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject` (
  `subjectId` int(11) NOT NULL auto_increment COMMENT '题目id',
  `subjectName` varchar(40) NOT NULL COMMENT '题目名称',
  `subjectTypeObj` int(11) NOT NULL COMMENT '题目类型',
  `sujectContent` varchar(8000) NOT NULL COMMENT '题目内容',
  `taskFile` varchar(60) NOT NULL COMMENT '任务书文件',
  `otherFile` varchar(60) NOT NULL COMMENT '其他资料文件',
  `personNum` int(11) NOT NULL COMMENT '限选人数',
  `teacherObj` varchar(20) NOT NULL COMMENT '指导老师',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`subjectId`),
  KEY `subjectTypeObj` (`subjectTypeObj`),
  KEY `teacherObj` (`teacherObj`),
  CONSTRAINT `t_subject_ibfk_1` FOREIGN KEY (`subjectTypeObj`) REFERENCES `t_subjecttype` (`typeId`),
  CONSTRAINT `t_subject_ibfk_2` FOREIGN KEY (`teacherObj`) REFERENCES `t_teacher` (`teacherNo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES ('1', '基于安卓员工考勤系统', '1', '<p>开发一个安卓app,实现对公司员工考勤管理！</p>', 'upload/5b7ceecd-96f7-4db1-b7ad-41ddb62332ec.doc', '', '2', 'TH001', '2018-03-04 16:45:40');
INSERT INTO `t_subject` VALUES ('2', 'SSM网络购物网站', '1', '<p>采用最新SSM后台框架实现一个JSP网络购物系统，支持在线支付，数据库用mysql!</p>', 'upload/5b7ceecd-96f7-4db1-b7ad-41ddb62332ec.doc', '', '3', 'TH002', '2018-03-04 17:04:29');
INSERT INTO `t_subject` VALUES ('3', '安卓学生成绩管理', '1', '<p>实现大学成绩管理</p>', 'upload/5b7ceecd-96f7-4db1-b7ad-41ddb62332ec.doc', '', '2', 'TH001', '2018-03-04 17:05:20');

-- ----------------------------
-- Table structure for `t_subjecttype`
-- ----------------------------
DROP TABLE IF EXISTS `t_subjecttype`;
CREATE TABLE `t_subjecttype` (
  `typeId` int(11) NOT NULL auto_increment COMMENT '类型编号',
  `typeName` varchar(20) NOT NULL COMMENT '类型名称',
  PRIMARY KEY  (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_subjecttype
-- ----------------------------
INSERT INTO `t_subjecttype` VALUES ('1', '实践操作型');
INSERT INTO `t_subjecttype` VALUES ('2', '理论研究型');

-- ----------------------------
-- Table structure for `t_subselect`
-- ----------------------------
DROP TABLE IF EXISTS `t_subselect`;
CREATE TABLE `t_subselect` (
  `selectId` int(11) NOT NULL auto_increment COMMENT '选题id',
  `subjectObj` int(11) NOT NULL COMMENT '论文题目',
  `userObj` varchar(30) NOT NULL COMMENT '选题学生',
  `selectTime` varchar(20) default NULL COMMENT '选题时间',
  `shenHeState` varchar(20) NOT NULL COMMENT '审核状态',
  PRIMARY KEY  (`selectId`),
  KEY `subjectObj` (`subjectObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_subselect_ibfk_1` FOREIGN KEY (`subjectObj`) REFERENCES `t_subject` (`subjectId`),
  CONSTRAINT `t_subselect_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_subselect
-- ----------------------------
INSERT INTO `t_subselect` VALUES ('1', '1', 'STU001', '2018-03-04 16:46:29', '审核通过');
INSERT INTO `t_subselect` VALUES ('2', '2', 'STU001', '2018-03-07 16:21:46', '待审核');
INSERT INTO `t_subselect` VALUES ('3', '1', 'STU002', '2018-03-10 11:11:19', '审核通过');
INSERT INTO `t_subselect` VALUES ('4', '3', 'STU001', '2018-04-07 15:09:27', '待审核');

-- ----------------------------
-- Table structure for `t_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `teacherNo` varchar(20) NOT NULL COMMENT 'teacherNo',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `teacherName` varchar(20) NOT NULL COMMENT '教师姓名',
  `teacherSex` varchar(4) NOT NULL COMMENT '教师性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `teacherPhoto` varchar(60) NOT NULL COMMENT '教师照片',
  `zhicheng` varchar(20) NOT NULL COMMENT '教师职称',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `teacherDesc` varchar(8000) NOT NULL COMMENT '教师介绍',
  PRIMARY KEY  (`teacherNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('TH001', '123', '王伟', '男', '2018-03-01', 'upload/381d5ebf-7e55-4783-aef7-23521ddf320e.jpg', '教授', '13953953953', '<p>精通计算机编程 已经桃李满天下</p>');
INSERT INTO `t_teacher` VALUES ('TH002', '123', '张芬', '女', '2018-03-01', 'upload/02c33a28-09a9-4981-807c-2b43939d10b4.jpg', '高级讲师', '13985089343', '<p>精通网站ui设计</p>');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `classObj` varchar(20) NOT NULL COMMENT '所在班级',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '学生照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(30) default NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`),
  KEY `classObj` (`classObj`),
  CONSTRAINT `t_userinfo_ibfk_1` FOREIGN KEY (`classObj`) REFERENCES `t_classinfo` (`classNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('STU001', '123', 'BJ001', '双鱼林', '男', '2018-03-02', 'upload/098f4cbc-8826-4d3d-951b-6bfb775e7828.jpg', '13598093842', 'dashen@163.com', '四川成都红星路13号', '2018-03-04 16:42:28');
INSERT INTO `t_userinfo` VALUES ('STU002', '123', 'BJ002', '王大帅', '男', '2018-03-02', 'upload/b240bc9c-236e-431e-9d8a-edfc64b23f30.jpg', '13985034934', 'dashuai@163.com', '四川自贡', '2018-03-10 11:10:53');

-- ----------------------------
-- Table structure for `t_video`
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video` (
  `videoId` int(11) NOT NULL auto_increment COMMENT '视频id',
  `subjectObj` int(11) NOT NULL COMMENT '论文题目',
  `userObj` varchar(30) NOT NULL COMMENT '答辩学生',
  `videoFile` varchar(60) NOT NULL COMMENT '答辩视频',
  `videoTime` varchar(20) NOT NULL COMMENT '视频时间',
  `videoDate` varchar(20) default NULL COMMENT '答辩日期',
  `videoMemo` varchar(8000) default NULL COMMENT '附加信息',
  PRIMARY KEY  (`videoId`),
  KEY `subjectObj` (`subjectObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_video_ibfk_1` FOREIGN KEY (`subjectObj`) REFERENCES `t_subject` (`subjectId`),
  CONSTRAINT `t_video_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_video
-- ----------------------------
INSERT INTO `t_video` VALUES ('1', '1', 'STU001', 'upload/ebfd62a3-096a-41ef-93f7-f5e360a1adc7.mp4', '15分钟', '2018-03-05', '<p>这个是测试的视频文件 学生的答辩视频 还支持在线播放哈！</p>');
