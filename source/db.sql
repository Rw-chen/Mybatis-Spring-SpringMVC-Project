/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : uims_db

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 16/12/2022 15:43:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adminName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('admin', '0x3f', '王山而');
INSERT INTO `administrator` VALUES ('rwchen', '2023888', '陈瑞武');
INSERT INTO `administrator` VALUES ('test', '123', '王二麻子');

-- ----------------------------
-- Table structure for classinfo
-- ----------------------------
DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `className` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `classSize` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `className`(`className`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classinfo
-- ----------------------------
INSERT INTO `classinfo` VALUES (1, '蜀汉', 33);
INSERT INTO `classinfo` VALUES (2, '曹魏', 50);
INSERT INTO `classinfo` VALUES (3, '东吴', 32);
INSERT INTO `classinfo` VALUES (4, '二次元', 22);

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `classroomName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `capacity` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `classname`(`classroomName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES (1, 'A101', 300);
INSERT INTO `classroom` VALUES (2, 'B203', 50);
INSERT INTO `classroom` VALUES (3, 'F001', 200);
INSERT INTO `classroom` VALUES (4, 'C002', 300);
INSERT INTO `classroom` VALUES (5, 'B207', 300);
INSERT INTO `classroom` VALUES (6, 'C004', 300);
INSERT INTO `classroom` VALUES (7, 'C005', 300);
INSERT INTO `classroom` VALUES (8, 'C006', 250);
INSERT INTO `classroom` VALUES (9, 'C007', 240);
INSERT INTO `classroom` VALUES (10, 'B001', 250);
INSERT INTO `classroom` VALUES (11, 'B205', 100);
INSERT INTO `classroom` VALUES (12, 'B309', 50);
INSERT INTO `classroom` VALUES (21, 'A105', 50);
INSERT INTO `classroom` VALUES (22, 'B305', 100);
INSERT INTO `classroom` VALUES (25, 'B304', 200);
INSERT INTO `classroom` VALUES (27, 'C206', 180);
INSERT INTO `classroom` VALUES (28, 'D312', 200);
INSERT INTO `classroom` VALUES (29, 'A501', 200);
INSERT INTO `classroom` VALUES (30, 'D403', 205);
INSERT INTO `classroom` VALUES (31, 'D408', 200);

-- ----------------------------
-- Table structure for classschedule
-- ----------------------------
DROP TABLE IF EXISTS `classschedule`;
CREATE TABLE `classschedule`  (
  `caid` int UNSIGNED NOT NULL,
  `times` int UNSIGNED NOT NULL,
  `csid` int UNSIGNED NOT NULL,
  `weekth` int UNSIGNED NOT NULL,
  `dayth` int UNSIGNED NOT NULL,
  `courseth` int UNSIGNED NOT NULL,
  PRIMARY KEY (`caid`, `times`) USING BTREE,
  UNIQUE INDEX `uq`(`csid`, `weekth`, `dayth`, `courseth`) USING BTREE,
  CONSTRAINT `fk4` FOREIGN KEY (`caid`) REFERENCES `coursearrangement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk5` FOREIGN KEY (`csid`) REFERENCES `classroom` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classschedule
-- ----------------------------
INSERT INTO `classschedule` VALUES (1, 1, 1, 1, 1, 1);
INSERT INTO `classschedule` VALUES (2, 1, 2, 1, 3, 3);
INSERT INTO `classschedule` VALUES (29, 1, 2, 1, 3, 4);
INSERT INTO `classschedule` VALUES (6, 1, 2, 1, 4, 2);
INSERT INTO `classschedule` VALUES (5, 1, 2, 1, 5, 3);
INSERT INTO `classschedule` VALUES (1, 3, 2, 2, 1, 1);
INSERT INTO `classschedule` VALUES (7, 1, 2, 2, 3, 1);
INSERT INTO `classschedule` VALUES (2, 3, 2, 2, 3, 3);
INSERT INTO `classschedule` VALUES (12, 1, 2, 3, 2, 1);
INSERT INTO `classschedule` VALUES (1, 2, 3, 1, 5, 3);
INSERT INTO `classschedule` VALUES (21, 1, 3, 2, 3, 5);
INSERT INTO `classschedule` VALUES (1, 4, 3, 2, 5, 3);
INSERT INTO `classschedule` VALUES (2, 4, 3, 2, 6, 6);
INSERT INTO `classschedule` VALUES (10, 1, 3, 3, 5, 3);
INSERT INTO `classschedule` VALUES (3, 1, 4, 5, 1, 6);
INSERT INTO `classschedule` VALUES (10, 2, 5, 2, 4, 3);
INSERT INTO `classschedule` VALUES (22, 1, 6, 1, 4, 4);
INSERT INTO `classschedule` VALUES (4, 1, 6, 2, 3, 2);
INSERT INTO `classschedule` VALUES (23, 1, 6, 3, 6, 4);
INSERT INTO `classschedule` VALUES (11, 1, 7, 4, 6, 1);

-- ----------------------------
-- Table structure for coursearrangement
-- ----------------------------
DROP TABLE IF EXISTS `coursearrangement`;
CREATE TABLE `coursearrangement`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `courseId` int UNSIGNED NOT NULL,
  `classId` int UNSIGNED NOT NULL,
  `teacherId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_fk1_fk2_fk3`(`courseId`, `classId`, `teacherId`) USING BTREE,
  INDEX `fk2`(`classId`) USING BTREE,
  INDEX `fk3`(`teacherId`) USING BTREE,
  CONSTRAINT `fk1` FOREIGN KEY (`courseId`) REFERENCES `courseinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk2` FOREIGN KEY (`classId`) REFERENCES `classinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk3` FOREIGN KEY (`teacherId`) REFERENCES `teacherinfo` (`workId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coursearrangement
-- ----------------------------
INSERT INTO `coursearrangement` VALUES (1, 1, 1, 't20051010');
INSERT INTO `coursearrangement` VALUES (6, 1, 2, 't20051010');
INSERT INTO `coursearrangement` VALUES (7, 1, 3, 't20051010');
INSERT INTO `coursearrangement` VALUES (8, 1, 4, 't20051010');
INSERT INTO `coursearrangement` VALUES (2, 2, 1, 't20050311');
INSERT INTO `coursearrangement` VALUES (3, 3, 2, 't20050311');
INSERT INTO `coursearrangement` VALUES (4, 4, 3, 't20170820');
INSERT INTO `coursearrangement` VALUES (12, 7, 3, 't20070701');
INSERT INTO `coursearrangement` VALUES (26, 8, 4, 't20108241');
INSERT INTO `coursearrangement` VALUES (27, 9, 2, 't20201024');
INSERT INTO `coursearrangement` VALUES (28, 10, 1, 't20180231');
INSERT INTO `coursearrangement` VALUES (18, 11, 2, 't20050301');
INSERT INTO `coursearrangement` VALUES (5, 12, 4, 't20180231');
INSERT INTO `coursearrangement` VALUES (10, 14, 4, 't20201024');
INSERT INTO `coursearrangement` VALUES (11, 15, 3, 't20051010');
INSERT INTO `coursearrangement` VALUES (13, 16, 4, 't20180231');
INSERT INTO `coursearrangement` VALUES (20, 23, 1, 't20101203');
INSERT INTO `coursearrangement` VALUES (29, 25, 1, 't19842341');
INSERT INTO `coursearrangement` VALUES (22, 25, 2, 't19842341');
INSERT INTO `coursearrangement` VALUES (23, 25, 3, 't19842341');
INSERT INTO `coursearrangement` VALUES (21, 25, 4, 't19842341');

-- ----------------------------
-- Table structure for courseinfo
-- ----------------------------
DROP TABLE IF EXISTS `courseinfo`;
CREATE TABLE `courseinfo`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `courseName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `credit` double UNSIGNED NOT NULL,
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_courseName`(`courseName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courseinfo
-- ----------------------------
INSERT INTO `courseinfo` VALUES (1, '计算机导论', 1, '让学生初步了解计算机的整体架构');
INSERT INTO `courseinfo` VALUES (2, 'C语言程序设计', 3, '让学生初步入门面向过程的编程语言');
INSERT INTO `courseinfo` VALUES (3, 'Java面向对象程序设计', 3, '学习面向对象的特性');
INSERT INTO `courseinfo` VALUES (4, 'MySql数据库原理及其应用', 3, '了解计算机的数据存储在哪里，怎样设计数据库，查询数据库中的数据');
INSERT INTO `courseinfo` VALUES (5, '高等数学上册', 4, '进入大学该掌握的数学');
INSERT INTO `courseinfo` VALUES (6, '高等数学下册', 4, '进入大学该掌握的数学');
INSERT INTO `courseinfo` VALUES (7, '大学英语1', 2, '大学生英语必修1');
INSERT INTO `courseinfo` VALUES (8, '大学英语2', 2, '大学生英语必修2');
INSERT INTO `courseinfo` VALUES (9, '大学英语3', 2, '大学生英语必修3');
INSERT INTO `courseinfo` VALUES (10, '大学英语4', 2, '大学生英语必修4');
INSERT INTO `courseinfo` VALUES (11, '马克思主义基本原理 ', 4, '了解社会的发展规律');
INSERT INTO `courseinfo` VALUES (12, '数据结构', 3, '计算机中的数据是怎样的');
INSERT INTO `courseinfo` VALUES (13, '计算机组成原理', 4, '计算机的的组成.....');
INSERT INTO `courseinfo` VALUES (14, '计算机操作系统', 3, '操作系统的诞生和一步步的走向');
INSERT INTO `courseinfo` VALUES (15, '计算机网络', 3, '计算机是如何通信的');
INSERT INTO `courseinfo` VALUES (16, '汇编语言', 5, '机器语言，汇编语言，计算机语言的净化史，带你一步一步入门计算机界的底层');
INSERT INTO `courseinfo` VALUES (23, '算法与设计', 2, 'aka,程序=算法+数据结构');
INSERT INTO `courseinfo` VALUES (24, '操作系统', 6, '计算机专业必修课程');
INSERT INTO `courseinfo` VALUES (25, 'Linux菜鸟教程', 3.5, '专业必修课');
INSERT INTO `courseinfo` VALUES (26, '概率论与数理统计', 3.5, '大学必修数学课');

-- ----------------------------
-- Table structure for statusinfo
-- ----------------------------
DROP TABLE IF EXISTS `statusinfo`;
CREATE TABLE `statusinfo`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of statusinfo
-- ----------------------------
INSERT INTO `statusinfo` VALUES (1, '管理员');
INSERT INTO `statusinfo` VALUES (2, '老师');
INSERT INTO `statusinfo` VALUES (3, '学生');

-- ----------------------------
-- Table structure for studentinfo
-- ----------------------------
DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo`  (
  `studentId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `studentName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int UNSIGNED NOT NULL,
  `classId` int UNSIGNED NOT NULL,
  PRIMARY KEY (`studentId`) USING BTREE,
  INDEX `fk_stu_class`(`classId`) USING BTREE,
  CONSTRAINT `fk_stu_class` FOREIGN KEY (`classId`) REFERENCES `classinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studentinfo
-- ----------------------------
INSERT INTO `studentinfo` VALUES ('12344342', 'pairdon', '啾啾最可爱', '女', 17, 4);
INSERT INTO `studentinfo` VALUES ('20023342', '32234324', '司马昭11111', '女', 34, 3);
INSERT INTO `studentinfo` VALUES ('20182301', 'bigsnow', '李星云', '男', 23, 2);
INSERT INTO `studentinfo` VALUES ('20222341', 'adsfofd', '许褚', '男', 50, 2);
INSERT INTO `studentinfo` VALUES ('20223301', 'liubei', '刘备', '男', 20, 1);
INSERT INTO `studentinfo` VALUES ('20223302', 'intelligent', '诸葛亮', '男', 18, 1);
INSERT INTO `studentinfo` VALUES ('20223303', 'strong', '关羽', '男', 23, 1);
INSERT INTO `studentinfo` VALUES ('20223304', 'fatfat', '张飞', '男', 25, 1);
INSERT INTO `studentinfo` VALUES ('20223305', 'sonson', '刘禅', '男', 23, 1);
INSERT INTO `studentinfo` VALUES ('20223306', 'ddddd', '孙尚香1', '男', 22, 4);
INSERT INTO `studentinfo` VALUES ('20223307', 'zdragon', '赵云', '男', 20, 1);
INSERT INTO `studentinfo` VALUES ('20223407', 'mcchao', '马超', '男', 20, 1);
INSERT INTO `studentinfo` VALUES ('20223408', 'adsfdsf', '曹操', '男', 25, 2);
INSERT INTO `studentinfo` VALUES ('20223410', 'dijkstra', '曹丕', '男', 10, 2);
INSERT INTO `studentinfo` VALUES ('20223411', 'wahhhh', '曹植', '男', 12, 4);
INSERT INTO `studentinfo` VALUES ('20223413', 'newbalance', '典韦', '男', 23, 2);
INSERT INTO `studentinfo` VALUES ('20233412', 'bro1', '夏侯渊', '男', 34, 2);
INSERT INTO `studentinfo` VALUES ('20233413', 'bro2', '夏侯惇', '男', 23, 2);
INSERT INTO `studentinfo` VALUES ('20234123', 'attribute', '杨修', '男', 23, 2);
INSERT INTO `studentinfo` VALUES ('20234233', 'green', '吕布', '男', 23, 2);
INSERT INTO `studentinfo` VALUES ('20234324', 'chenda', '司马懿', '男', 55, 2);
INSERT INTO `studentinfo` VALUES ('20303472', 'betary', '于禁', '男', 23, 2);
INSERT INTO `studentinfo` VALUES ('23403240', 'ewrdfs', '小乔', '女', 23, 3);
INSERT INTO `studentinfo` VALUES ('23424432', 'dfsfw3', '小白', '女', 32, 4);
INSERT INTO `studentinfo` VALUES ('23429087', 'betary', '曹丕', '男', 23, 2);
INSERT INTO `studentinfo` VALUES ('23432434', 'dasfkl', '黄盖', '男', 23, 3);
INSERT INTO `studentinfo` VALUES ('23434255', 'sdfdsa', '罗小黑', '男', 23, 4);
INSERT INTO `studentinfo` VALUES ('23434442', 'buyaobilian', '张楚岚', '男', 32, 4);
INSERT INTO `studentinfo` VALUES ('23434535', 'dasfd', '孙策', '男', 23, 3);
INSERT INTO `studentinfo` VALUES ('23443241', '1433223', '姜维', '男', 26, 2);
INSERT INTO `studentinfo` VALUES ('23452342', 'great', '孙坚', '男', 23, 3);
INSERT INTO `studentinfo` VALUES ('32234311', 'dasf', '周瑜', '男', 42, 3);
INSERT INTO `studentinfo` VALUES ('32423434', 'password1', '袁天罡', '男', 23, 2);
INSERT INTO `studentinfo` VALUES ('32443401', 'adsfdf', '大乔', '女', 20, 3);
INSERT INTO `studentinfo` VALUES ('34534544', 'sadffd', '孙权', '男', 23, 3);

-- ----------------------------
-- Table structure for teacherinfo
-- ----------------------------
DROP TABLE IF EXISTS `teacherinfo`;
CREATE TABLE `teacherinfo`  (
  `workId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `teacherName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int UNSIGNED NOT NULL,
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `academic` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`workId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacherinfo
-- ----------------------------
INSERT INTO `teacherinfo` VALUES ('t19842341', 'password', '路人甲', '男', 54, '教授', '博士', '教学经验丰富');
INSERT INTO `teacherinfo` VALUES ('t20001010', 'oldoldold', '李大钢', '男', 58, '教授', '博士', '计算机系的老教授，毕业于xx大学，主讲《计算机组成原理》，学生一致表示晦涩难懂');
INSERT INTO `teacherinfo` VALUES ('t20050301', 'goodgood', '马保国', '女', 20, '讲师', '本科', '擅长武术理论这门课程，常年教授《武术理论》这门课程，收到一致学生好评');
INSERT INTO `teacherinfo` VALUES ('t20050311', 'aaaa', '王胜天1', '女', 23, '副教授1', '博士1', '计算机体系结构》，《算法》，《数据结构》等课程');
INSERT INTO `teacherinfo` VALUES ('t20051010', 'justlove', '王大强', '男', 58, '教授', '博士', '多年教授计算机理论知识，拿手课程《计算机导论》');
INSERT INTO `teacherinfo` VALUES ('t20070701', 'linklink', '张倩倩', '女', 38, '讲师', '博士', '主讲《大学英语》，毕业于xx外国语大学，英语课讲的生动有活力，学生表示听了还想再听');
INSERT INTO `teacherinfo` VALUES ('t20101203', 'young', '占智', '男', 39, '助教', '硕士', '比较年轻的一位老师，刚来学校没多久，主讲《思想道德基础与法律修养》');
INSERT INTO `teacherinfo` VALUES ('t20108241', 'aswererw', '王小玲', '女', 32, '讲师', '博士', '博士毕业没多久，研究生期间研究交流变换，现在主讲《电工电子技术》');
INSERT INTO `teacherinfo` VALUES ('t20170820', 'qewrtyuioip', '张伟', '男', 35, '副教授', '博士', '计算机系老师，主讲《数据结构》，《算法设计》等');
INSERT INTO `teacherinfo` VALUES ('t20180231', 'likepotato', '夏风', '女', 28, '讲师', '博士', '主讲《操作系统》，《Linux操作系统》等');
INSERT INTO `teacherinfo` VALUES ('t20201024', 'amoment', '夏筱', '男', 27, '助教', '硕士1', '计算机系新来的老师，主讲《计算机网络》1');
INSERT INTO `teacherinfo` VALUES ('t20203421', 'i\'m the boss', '欧阳若婷', '女', 30, '讲师', '硕士', '此处省略一万字');

SET FOREIGN_KEY_CHECKS = 1;
