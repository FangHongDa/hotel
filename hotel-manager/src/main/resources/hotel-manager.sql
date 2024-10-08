/*
 Navicat Premium Data Transfer

 Source Server         : localhost-3000
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3000
 Source Schema         : hotel-manager

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 26/02/2023 20:26:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for check_in
-- ----------------------------
DROP TABLE IF EXISTS `check_in`;
CREATE TABLE `check_in`  (
  `check_in_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '入住id',
  `order_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `room_number` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房间号',
  `room_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房间类型',
  `peo_count` int(11) NOT NULL DEFAULT 1 COMMENT '入住人数',
  `persons` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入住人',
  `ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `check_in_time` timestamp(0) NULL DEFAULT NULL COMMENT '入住时间',
  `check_out_time` timestamp(0) NULL DEFAULT NULL COMMENT '退房',
  `create_time` timestamp(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`check_in_id`) USING BTREE,
  UNIQUE INDEX `uqe_order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入住退房登记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of check_in
-- ----------------------------
INSERT INTO `check_in` VALUES (1, '1475808140408197120', '101', '单人房', 1, '何燕', '341502198810196427', '2022-01-08 21:05:49', NULL, '2022-01-08 21:05:49', '2022-01-14 13:57:13');
INSERT INTO `check_in` VALUES (2, '1475808836855648256', '121', '单人房', 1, '马淑珍', '350481197304037905', '2022-01-08 22:10:42', NULL, '2022-01-08 22:10:42', '2022-01-14 13:57:13');
INSERT INTO `check_in` VALUES (7, '1475807628921217024', '101', '单人房', 1, '杨秀芳', '130224197009132687', '2022-01-08 23:22:11', NULL, '2022-01-08 23:22:11', '2022-01-14 13:57:13');
INSERT INTO `check_in` VALUES (8, '1475810388878106624', '108', '单人房', 1, '宋阳', '512000196701014288', '2022-01-08 23:24:54', NULL, '2022-01-08 23:24:54', '2022-01-14 13:57:39');
INSERT INTO `check_in` VALUES (9, '1475815699806515200', '106', '豪华套房', 1, '毛玉', '130601195204145457', '2022-01-08 23:42:54', '2022-01-09 22:24:53', '2022-01-08 23:42:54', '2022-01-14 13:57:13');
INSERT INTO `check_in` VALUES (10, '1475814188321968128', '108', '单人房', 1, '陈红梅', '110107198510132428', '2022-01-08 23:45:00', NULL, '2022-01-08 23:45:00', '2022-01-14 13:57:13');
INSERT INTO `check_in` VALUES (11, '1475810920841666560', '101', '单人房', 1, '萧春梅', '520400196705056989', '2022-01-08 23:47:11', NULL, '2022-01-08 23:47:11', '2022-01-14 13:57:13');
INSERT INTO `check_in` VALUES (12, '1475801817629155328', '101', '单人房', 1, '蔡琳', '542100199401152966', '2022-01-08 23:51:19', '2022-01-14 16:43:46', '2022-01-08 23:51:19', '2022-01-14 16:43:46');
INSERT INTO `check_in` VALUES (13, '1478563594167197696', '108', '单人房', 1, '谢杰', '330782198309077942', '2022-01-09 00:08:19', '2022-01-09 22:25:44', '2022-01-09 00:08:19', '2022-01-14 13:57:44');
INSERT INTO `check_in` VALUES (14, '1481609735729430528', '121', '单人房', 2, '都利', '45142219420818691X，330782198309077942', '2022-01-13 20:52:41', '2022-01-14 16:48:48', '2022-01-13 20:52:41', '2022-01-14 16:48:48');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `type_id` bigint(20) NULL DEFAULT NULL COMMENT '酒店id',
  `approve` int(11) NULL DEFAULT NULL COMMENT '点赞数',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `room_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, '很好', 1, 1, '2022-01-14 13:52:57');
INSERT INTO `comment` VALUES (2, 2, '非常好', 2, 1, '2022-01-14 13:52:58');
INSERT INTO `comment` VALUES (3, 3, '行', 4, NULL, '2022-01-14 13:53:33');
INSERT INTO `comment` VALUES (4, 1, '房间很好', 2, NULL, '2022-01-14 13:53:04');
INSERT INTO `comment` VALUES (5, 1, '房间很好', 1, NULL, '2022-01-14 13:53:05');
INSERT INTO `comment` VALUES (6, 1, '好', 3, NULL, '2022-01-14 13:53:42');
INSERT INTO `comment` VALUES (7, 1, '房间还行', 1, NULL, '2022-01-14 13:53:08');
INSERT INTO `comment` VALUES (8, 5, '很不错', 3, NULL, '2022-01-14 13:53:10');
INSERT INTO `comment` VALUES (9, 5, '还行', 3, NULL, '2022-01-14 13:53:47');
INSERT INTO `comment` VALUES (10, 5, '是否', 3, NULL, '2022-01-14 13:53:13');
INSERT INTO `comment` VALUES (11, 5, '不错', 1, NULL, '2022-01-14 13:53:50');
INSERT INTO `comment` VALUES (19, 2, '房子好评', 5, NULL, '2022-01-14 14:14:29');
INSERT INTO `comment` VALUES (20, 2, '啊大多数', 6, NULL, '2022-01-14 14:15:29');
INSERT INTO `comment` VALUES (21, 2, 'adas', 6, NULL, '2022-01-14 14:17:33');
INSERT INTO `comment` VALUES (22, 2, 'eqe', 6, NULL, '2022-01-14 14:18:20');
INSERT INTO `comment` VALUES (23, 1, 'dsdsd', 16, NULL, '2022-01-14 14:18:51');
INSERT INTO `comment` VALUES (24, 78, '很好', 1, NULL, '2022-01-14 16:11:31');
INSERT INTO `comment` VALUES (25, 79, 'kkk', 4, NULL, '2022-01-14 16:26:40');
INSERT INTO `comment` VALUES (26, 2, 'bjbbbhjjh', 6, NULL, '2022-01-14 16:45:12');

-- ----------------------------
-- Table structure for department_info
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `department` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '可用' COMMENT '部门',
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uqe_status`(`department`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department_info
-- ----------------------------
INSERT INTO `department_info` VALUES (1, '技术部', '技术开发', '2022-01-02 23:42:43', '2022-01-04 15:34:11');
INSERT INTO `department_info` VALUES (2, '财务部', '管理财务信息', '2022-01-03 20:27:40', '2022-01-03 20:27:40');
INSERT INTO `department_info` VALUES (3, '保安部', '保卫工作', '2022-01-03 20:27:52', '2022-01-07 15:57:55');
INSERT INTO `department_info` VALUES (4, '厨务部', '厨师工作', '2022-01-03 20:28:25', '2022-01-07 15:48:35');

-- ----------------------------
-- Table structure for hotel_info
-- ----------------------------
DROP TABLE IF EXISTS `hotel_info`;
CREATE TABLE `hotel_info`  (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '酒店id',
  `hotel_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '酒店名',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码',
  `email` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `address` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `website` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站',
  `create_time` timestamp(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`hotel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_info
-- ----------------------------
INSERT INTO `hotel_info` VALUES (1, '嘉丽酒店', '13555600848', '13555600848', '892754472@qq.com', '广东省江门市蓬江区东城村五邑大学', 'https://gitee.com/huangsr', '2021-12-19 10:46:48', '2022-01-06 20:00:25');

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pay_order_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `order_type_id` int(11) NULL DEFAULT NULL,
  `order_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预订方式',
  `user_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `room_type_id` int(11) NULL DEFAULT NULL,
  `room_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房间类型',
  `num_of_room` int(11) NOT NULL DEFAULT 1 COMMENT '房间数',
  `order_date` date NOT NULL COMMENT '预订日期',
  `order_days` int(11) NOT NULL DEFAULT 1 COMMENT '预定天数',
  `order_status` int(11) NOT NULL DEFAULT 0 COMMENT '订单状态:0-已下单，1-已付款，2-已消费，-1-已取消，-2-被删除',
  `order_cost` double NOT NULL COMMENT '订单费用',
  `create_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES (1, '1475817145893502976', 2, '官网预订', 1, '刘俊', '13555600848', 1, '单人房', 1, '2021-12-19', 4, -1, 100, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (2, '1475817199786049536', 2, '官网预订', 1, '刘玉珍', '13555600848', 1, '单人房', 1, '2021-12-19', 2, -1, 0, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (3, '1475817240189792256', 2, '官网预订', 1, '孟秀兰', '13555600848', 1, '单人房', 1, '2021-12-19', 4, -1, 400, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (4, '1475801817629155328', 2, '官网预订', 1, '袁秀英', '13555600848', 1, '单人房', 1, '2021-12-28', 2, 2, 200, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (5, '1475807628921217024', 2, '官网预订', 1, '沈璐', '13555600848', 1, '单人房', 1, '2021-12-28', 1, 2, 100, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (6, '1475808140408197120', 2, '官网预订', 1, '丁艳', '13555600848', 1, '单人房', 1, '2021-12-28', 2, 2, 200, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (7, '1475808836855648256', 2, '官网预订', 1, '张瑞', '13555600848', 1, '单人房', 1, '2021-12-28', 2, 2, 200, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (8, '1475810388878106624', 2, '官网预订', 1, '黄柳', '13555600848', 1, '单人房', 1, '2021-12-28', 2, 2, 200, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (9, '1475810920841666560', 2, '官网预订', 1, '王慧', '13555600848', 1, '单人房', 1, '2021-12-28', 3, 2, 300, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (10, '1475812414278139904', 2, '官网预订', 1, '田龙', '13555600848', 2, '豪华套房', 1, '2021-12-28', 1, -1, 100, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (11, '1475813431673720832', 2, '官网预订', 1, '徐桂香', '13555600848', 1, '单人房', 1, '2021-12-28', 3, -1, 300, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (12, '1475814188321968128', 2, '官网预订', 1, '韩桂花', '13555600848', 1, '单人房', 1, '2021-12-28', 2, 2, 200, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (13, '1475815699806515200', 2, '官网预订', 1, '方勇', '13555600848', 2, '豪华套房', 1, '2021-12-28', 2, 2, 200, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (14, '1477838106440278016', 2, '官网预订', 4, '徐桂芝', '13555600848', 2, '豪华套房', 1, '2022-01-24', 3, 0, 900, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (15, '1477842857429049344', 2, '官网预订', 4, '郭玉英', '13555600848', 3, '总统房', 1, '2022-01-03', 2, 1, 200, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (16, '1478563594167197696', 2, '官网预订', 1, '张波', '13555600848', 1, '单人房', 1, '2022-01-05', 2, 2, 400, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (17, '1478995561929084928', 2, '官网预订', 1, '陈桂英', '13555600848', 2, '豪华套房', 1, '2022-01-07', 6, 1, 1800, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (18, '1479358293647859712', 2, '官网预订', 1, '郭慧', '13555600848', 2, '豪华套房', 1, '2022-01-07', 5, 0, 1500, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (19, '1479358940933885952', 2, '官网预订', 1, '王兰英', '13555600848', 3, 'tests', 1, '2022-01-07', 4, 0, 400, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (20, '1481601445624549376', 2, '官网预订', 1, '张丽丽', '13555600848', 3, '总统房', 1, '2022-01-13', 2, -1, 2400, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (21, '1481603261284225024', 2, '官网预订', 1, '陈红', '13555600848', 3, '总统房', 1, '2022-01-13', 2, -1, 2400, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (22, '1481605869118017536', 2, '官网预订', 1, '范凤英', '13555600848', 3, '总统房', 1, '2022-01-13', 2, -1, 2400, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (23, '1481608232495071232', 2, '官网预订', 1, '张兵', '13555600848', 3, '总统房', 1, '2022-01-13', 2, 1, 2400, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (24, '1481608768220938240', 2, '官网预订', 2, '黄宁', '13555600848', 2, '豪华套房', 1, '2022-01-13', 2, -1, 1000, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (25, '1481608925029187584', 2, '官网预订', 2, '黄荣', '13555600848', 2, '豪华套房', 1, '2022-01-13', 1, 1, 500, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (26, '1481609442300116992', 2, '官网预订', 2, '周雷', '13555600848', 1, '单人房', 1, '2022-01-13', 2, -1, 400, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (27, '1481609735729430528', 2, '官网预订', 2, '周静', '13555600848', 1, '单人房', 1, '2022-01-13', 1, 2, 200, '2022-01-13 23:30:34', '2022-01-13 23:30:34');
INSERT INTO `order_info` VALUES (28, '1481901941673541632', 2, '官网预订', 78, '梁恒森', '13555600848', 2, '豪华套房', 1, '2022-01-14', 1, 1, 500, '2022-01-14 16:12:38', '2022-01-14 16:12:38');
INSERT INTO `order_info` VALUES (29, '1481905718572990464', 2, '官网预订', 79, 'kk', '123432423', 5, '情侣房', 1, '2022-01-19', 2, 1, 200, '2022-01-14 16:27:44', '2022-01-14 16:27:44');
INSERT INTO `order_info` VALUES (30, '1481908392106246144', 2, '官网预订', 80, '绍荣', '13555600848', 1, '单人房', 1, '2022-01-14', 3, 1, 600, '2022-01-14 16:38:20', '2022-01-14 16:38:20');

-- ----------------------------
-- Table structure for order_type
-- ----------------------------
DROP TABLE IF EXISTS `order_type`;
CREATE TABLE `order_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'typeId',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方式',
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '预订方式表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_type
-- ----------------------------
INSERT INTO `order_type` VALUES (1, '手机预定', '支持在线', '2021-12-19 11:10:11', '2022-01-07 15:49:31');
INSERT INTO `order_type` VALUES (2, '官网预定', '通过官网网址进行预定', '2021-12-29 17:11:18', '2022-01-07 15:50:15');

-- ----------------------------
-- Table structure for room_info
-- ----------------------------
DROP TABLE IF EXISTS `room_info`;
CREATE TABLE `room_info`  (
  `room_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `room_number` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房间号码',
  `type_id` int(11) NOT NULL COMMENT '房间类型ID',
  `room_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房间类型',
  `room_price` double NOT NULL DEFAULT 0 COMMENT '房间价格',
  `room_discount` double NOT NULL DEFAULT 0 COMMENT '房间折扣',
  `room_status` int(11) NOT NULL DEFAULT 1 COMMENT '房间状态:1-可预订，2-已被预订，-3：已入住，-0：不可用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`room_id`) USING BTREE,
  UNIQUE INDEX `uqe_room_number`(`room_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房间信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_info
-- ----------------------------
INSERT INTO `room_info` VALUES (1, '1001', 5, '情侣房', 100, 21, 2, '情侣共住', '2021-12-19 11:57:41', '2022-01-08 21:26:30');
INSERT INTO `room_info` VALUES (9, '101', 1, '单人房', 200, 20, 1, '单间房', '2022-01-02 21:32:00', '2022-01-14 16:43:46');
INSERT INTO `room_info` VALUES (11, '106', 2, '豪华套房', 300, 21, 2, '豪华大方', '2022-01-06 08:10:56', '2022-01-14 16:12:38');
INSERT INTO `room_info` VALUES (12, '108', 1, '单人房', 200, 20, 1, '单身狗', '2022-01-08 21:43:34', '2022-01-09 22:25:44');
INSERT INTO `room_info` VALUES (13, '121', 1, '单人房', 200, 20, 1, '单身世界', '2022-01-08 21:44:03', '2022-01-14 16:48:48');
INSERT INTO `room_info` VALUES (14, '520', 5, '情侣房', 100, 21, 2, '情侣入住，加个减半', '2022-01-08 21:44:40', '2022-01-14 16:27:44');
INSERT INTO `room_info` VALUES (15, '204', 2, '豪华套房', 500, 21, 2, '大房子', '2022-01-13 20:03:03', '2022-01-13 20:49:10');
INSERT INTO `room_info` VALUES (16, '301', 3, '总统房', 1200, 21, 2, '总统专属', '2022-01-13 20:17:18', '2022-01-13 20:45:21');

-- ----------------------------
-- Table structure for room_type
-- ----------------------------
DROP TABLE IF EXISTS `room_type`;
CREATE TABLE `room_type`  (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `room_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房型备注',
  `price` double NOT NULL DEFAULT 0 COMMENT '预定价格',
  `discount` double NOT NULL COMMENT '预定折扣',
  `area` int(11) NOT NULL DEFAULT 12 COMMENT '房间大小:m2',
  `cover` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `bed_num` int(11) NOT NULL DEFAULT 1 COMMENT '床位',
  `bed_size` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1.5m*1.8m' COMMENT '床位大小',
  `rest` int(11) NULL DEFAULT NULL,
  `windows` int(11) NULL DEFAULT 0 COMMENT '是否有窗：0-无，1-有',
  `create_time` timestamp(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`type_id`) USING BTREE,
  UNIQUE INDEX `uqe_room_type`(`room_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房间类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_type
-- ----------------------------
INSERT INTO `room_type` VALUES (1, '单人房', '一张床的房间', 200, 20, 12, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fphoto.tuchong.com%2F10228072%2Ff%2F812782648.jpg&refer=http%3A%2F%2Fphoto.tuchong.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643989163&t=133ceb86ab5f983acbcf1aa0828ea71d', 4, '1.5m*1.8m', 11, 0, '2021-12-19 10:44:44', '2023-02-23 14:34:18');
INSERT INTO `room_type` VALUES (2, '豪华套房', '宽敞', 500, 21, 2, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn1-q.mafengwo.net%2Fs14%2FM00%2F6A%2F1C%2FwKgE2lz8zF2AJREqAB0qRb3k_rs53.jpeg&refer=http%3A%2F%2Fn1-q.mafengwo.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643989163&t=766a5592dcca472fbc0b58d991d9d3be', 2, '12', 0, 0, '2021-12-19 17:53:13', '2022-01-14 16:12:38');
INSERT INTO `room_type` VALUES (3, '总统房', '豪华大房', 1200, 21, 2, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fphoto.tuchong.com%2F10228072%2Ff%2F812782648.jpg&refer=http%3A%2F%2Fphoto.tuchong.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643989163&t=133ceb86ab5f983acbcf1aa0828ea71d', 2, '12', 0, 1, '2021-12-19 17:53:13', '2022-01-13 20:45:21');
INSERT INTO `room_type` VALUES (4, '双人房', '多人共住', 120, 21, 2, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20200115%2F558985fb4cd441df913a69fa7e0451ac.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643989464&t=859d3357a7b1b12d06631f500965ff51', 3, '12', 0, 0, '2021-12-19 17:53:13', '2022-01-13 20:00:31');
INSERT INTO `room_type` VALUES (5, '情侣房', '情人住房', 100, 21, 2, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdingyue.ws.126.net%2F2020%2F0413%2F52d40e48j00q8pt5v000zc000hs00bvm.jpg&refer=http%3A%2F%2Fdingyue.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643989464&t=a0d31c2346e90191e5dad5c5a60b45c9', 5, '12', 1, 0, '2021-12-19 17:53:13', '2022-01-14 16:27:44');
INSERT INTO `room_type` VALUES (6, '商务大床房', '商务大床房', 100, 21, 2, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdingyue.ws.126.net%2F2020%2F0413%2F52d40e48j00q8pt5v000zc000hs00bvm.jpg&refer=http%3A%2F%2Fdingyue.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643989464&t=a0d31c2346e90191e5dad5c5a60b45c9', 5, '12', 0, 1, '2021-12-19 17:53:13', '2022-01-14 16:14:32');
INSERT INTO `room_type` VALUES (7, '豪华大床房', '豪华大床房', 100, 21, 2, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdingyue.ws.126.net%2F2020%2F0413%2F52d40e48j00q8pt5v000zc000hs00bvm.jpg&refer=http%3A%2F%2Fdingyue.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643989464&t=a0d31c2346e90191e5dad5c5a60b45c9', 5, '12', 0, 0, '2021-12-19 17:53:13', '2022-01-14 16:14:47');
INSERT INTO `room_type` VALUES (16, 'zhea', '1231', 100, 12, 1233, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.hx116.com%2Fuserfiles%2F20200327%2F42059.png&refer=http%3A%2F%2Fwww.hx116.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1644740207&t=78dc11c871cc40ac603ccf022bc61762', 1, '123', 0, 1, '2022-01-13 20:15:22', '2022-01-14 16:15:48');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `address` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `idcard` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号码',
  `create_time` timestamp(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `uqe_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '注册用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '刘俊', '男', '15567487644', 'rdong@hotmail.com', '江西省南昌县双滦王路E座 490503', '341502198810196427', '2021-12-18 21:52:26', '2023-02-24 14:44:23');
INSERT INTO `user_info` VALUES (2, 'zhangsan2', 'e10adc3949ba59abbe56e057f20f883e', '刘玉珍', '男', '18762780051', 'dlu@yahoo.com', '江西省太原市翔安刘街J座 815655', '350481197304037905', '2021-12-18 22:00:13', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (3, 'zhangsan3', '4297f44b13955235245b2497399d7a93', '孟秀兰', '男', '18663579680', 'yong72@36.net', '江苏省宁县南溪王路x座 227133', '130224197009132687', '2022-01-03 10:51:28', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (5, 'zhangsan4', '4297f44b13955235245b2497399d7a93', '袁秀英', '男', '13972309788', 'chao45@30.cn', '青海省长沙县山亭廖街v座 439792', '512000196701014288', '2022-01-04 09:38:49', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (6, 'zhangsan5', '4297f44b13955235245b2497399d7a93', '沈璐', '男', '13319975239', 'chaoyuan@yahoo.com', '安徽省帆市东城唐路d座 819867', '130601195204145457', '2022-01-04 09:38:49', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (7, 'zhangsan6', 'e10adc3949ba59abbe56e057f20f883e', '丁艳', '男', '15984781796', 'juan18@hotmail.com', '广东省巢湖县和平王路V座 418151', '110107198510132428', '2022-01-04 09:38:49', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (11, 'zhangsan7', '4297f44b13955235245b2497399d7a93', '张瑞', '男', '14715158775', 'pwei@yuan.cn', '澳门特别行政区东莞市高港关岭街Z座 113957', '520400196705056989', '2022-01-04 09:40:05', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (12, 'zhangsan8', '4297f44b13955235245b2497399d7a93', '黄柳', '男', '18878249984', 'jinggu@yongzeng.net', '吉林省芳县南湖兰路y座 907387', '542100199401152966', '2022-01-04 09:40:05', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (13, 'zhangsan9', 'e10adc3949ba59abbe56e057f20f883e', '王慧', '男', '15510694655', 'nguo@gmail.com', '海南省桂荣县锡山拉萨路m座 889598', '330782198309077942', '2022-01-04 09:40:05', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (14, 'zhangsan10', '4297f44b13955235245b2497399d7a93', '田龙', '男', '14523008198', 'xia53@gangjing.cn', '贵州省玉英市长寿席路j座 607847', '45142219420818691X', '2022-01-05 00:35:04', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (16, 'zhangsan11', '4297f44b13955235245b2497399d7a93', '徐桂香', '男', '18288493616', 'jieqian@yahoo.com', '甘肃省勇县金平合山街V座 343550', '441223196008184592', '2022-01-05 00:35:56', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (18, 'zhangsan12', '4297f44b13955235245b2497399d7a93', '韩桂花', '女', '13130911244', 'qiangfang@yahoo.com', '江西省梧州县西峰林街g座 890108', '621026195512050072', '2022-01-05 10:21:59', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (20, 'wangwu1', '4297f44b13955235245b2497399d7a93', '方勇', '男', '15239681245', 'fangyang@pinggang.cn', '浙江省淮安市西峰周路Q座 231298', '220101195011153893', '2022-01-05 10:40:14', '2022-01-14 14:21:39');
INSERT INTO `user_info` VALUES (21, 'wangwu2', '4297f44b13955235245b2497399d7a93', '徐桂芝', '女', '13091676162', 'xliu@yahoo.com', '河北省荆门县东丽徐路w座 733493', '451200193609248217', '2022-01-05 10:43:06', '2022-01-14 14:21:44');
INSERT INTO `user_info` VALUES (23, 'wangwu3', '4297f44b13955235245b2497399d7a93', '郭玉英', '男', '13599861266', 'nawu@hotmail.com', '江苏省颖县黄浦吴路f座 348086', '50022619560729008X', '2022-01-05 10:43:57', '2022-01-14 14:21:50');
INSERT INTO `user_info` VALUES (24, 'wangwu4', '4297f44b13955235245b2497399d7a93', '张波', '女', '18060545344', 'gaotao@hotmail.com', '宁夏回族自治区帆县山亭黄路Q座 528477', '350627193810292241', '2022-01-05 10:44:38', '2022-01-14 14:21:54');
INSERT INTO `user_info` VALUES (25, 'lisi1', 'e10adc3949ba59abbe56e057f20f883e', '陈桂英', '男', '13498131990', 'yong36@gmail.com', '海南省梧州市滨城李路f座 504377', '532626196803147428', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (26, 'lisi2', 'e10adc3949ba59abbe56e057f20f883e', '郭慧', '男', '13198353039', 'ping21@zengyi.net', '西藏自治区桂珍市友好昆明街Y座 634021', '341523193305302515', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (27, 'lisi3', '4297f44b13955235245b2497399d7a93', '王兰英', '男', '15196790642', 'juanliu@jieming.cn', '广东省莉市朝阳台北街x座 190715', '320300198302021032', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (28, 'lisi4', '4297f44b13955235245b2497399d7a93', '张丽丽', '男', '18748925191', 'xiahu@dengpan.net', '江西省六安县和平永安街r座 137243', '370784196907163913', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (29, 'lisi5', '4297f44b13955235245b2497399d7a93', '陈红', '男', '13697605585', 'epan@hotmail.com', '浙江省丹县黄浦北镇路G座 186275', '13062819460201540X', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (30, 'lisi6', 'e10adc3949ba59abbe56e057f20f883e', '范凤英', '男', '13499132244', 'mingxiong@guiyingna.cn', '山西省瑜县怀柔北京路p座 691913', '44011419750119469X', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (31, 'lisi7', '4297f44b13955235245b2497399d7a93', '张兵', '男', '14504492015', 'vzhao@la.cn', '福建省海口县江北陈路H座 259607', '120101194008275509', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (32, 'lisi8', '4297f44b13955235245b2497399d7a93', '黄宁', '男', '13973512992', 'juan44@hotmail.com', '湖北省太原县魏都安街c座 530374', '510122194703163917', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (33, 'lisi9', 'e10adc3949ba59abbe56e057f20f883e', '黄荣', '男', '15904360492', 'min11@hotmail.com', '重庆市璐县大东孙街P座 155477', '420701196603064012', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (34, 'lisi10', '4297f44b13955235245b2497399d7a93', '周雷', '男', '13377122856', 'taozhang@hotmail.com', '湖南省丽丽县清城李路P座 172795', '510303198712060557', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (35, 'lisi11', '4297f44b13955235245b2497399d7a93', '周静', '男', '14528832529', 'chao28@yahoo.com', '广东省晶县房山郑州路t座 474776', '14060319870325316X', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (36, 'lisi12', '4297f44b13955235245b2497399d7a93', '师婷婷', '女', '14550266014', 'leixiuying@lijun.cn', '澳门特别行政区淑珍县华龙田路s座 526080', '411201197212305874', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (37, 'lisi13', '4297f44b13955235245b2497399d7a93', '马淑珍', '男', '18912358599', 'jingyi@lilong.cn', '河北省昆明市长寿顾街o座 728886', '640105199111105559', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (38, 'lisi14', '4297f44b13955235245b2497399d7a93', '杨秀芳', '女', '14572285539', 'nren@kc.cn', '澳门特别行政区小红市西夏刘路v座 917143', '500241199402197190', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (39, 'lisi15', '4297f44b13955235245b2497399d7a93', '宋阳', '男', '15567487644\r\n', 'vcao@hotmail.com', '内蒙古自治区辽阳市淄川刘路w座 282976', '532626196803147428\r\n', '2022-01-08 00:06:35', '2022-01-13 21:58:46');
INSERT INTO `user_info` VALUES (40, 'lisi16', '4297f44b13955235245b2497399d7a93', '毛玉', '女', '13164981755', 'fgu@hotmail.com', '湖北省西宁县沙湾沈阳街Y座 767974', '130604198910150088', '2022-01-08 00:06:35', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (41, 'lisi17', 'e10adc3949ba59abbe56e057f20f883e', '陈红梅', '男', '13873572680', 'yong19@34.cn', '澳门特别行政区嘉禾市白云周路J座 881702', '130581196312068381', '2022-01-08 00:10:26', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (42, 'lisi18', 'e10adc3949ba59abbe56e057f20f883e', '萧春梅', '男', '18826244663', 'edeng@rd.cn', '新疆维吾尔自治区佳县南溪宜都街R座 771673', '510921199204091277', '2022-01-08 00:10:26', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (43, 'lisi19', '4297f44b13955235245b2497399d7a93', '蔡琳', '男', '13921802030', 'xiuyingpan@gmail.com', '贵州省香港市黄浦佛山街P座 941339', '230901193512038662', '2022-01-08 00:10:26', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (44, 'lisi20', '4297f44b13955235245b2497399d7a93', '谢杰', '男', '15660538227', 'ihao@yahoo.com', '山西省桂荣县海陵洪街u座 729157', '36078120010301542X', '2022-01-08 00:10:26', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (45, 'lisi21', '4297f44b13955235245b2497399d7a93', '都利', '男', '15280462787', 'ping89@wg.cn', '宁夏回族自治区娟县合川辛集街l座 407633', '130225193503290451', '2022-01-08 00:10:26', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (46, 'lisi22', 'e10adc3949ba59abbe56e057f20f883e', '刘颖', '男', '13658227544', 'xiajing@yahoo.com', '香港特别行政区合肥县翔安陈街s座 253286', '230801197307256970', '2022-01-08 00:10:26', '2022-01-13 21:58:35');
INSERT INTO `user_info` VALUES (75, 'zhaoliu1', 'e10adc3949ba59abbe56e057f20f883e', '刘俊', '男', '15567487644', 'rdong@hotmail.com', '江西省南昌县双滦王路E座 490503', '341502198810196427', '2022-01-14 14:40:50', '2022-01-14 14:40:50');
INSERT INTO `user_info` VALUES (76, 'suibian', 'e10adc3949ba59abbe56e057f20f883e', 'huangsrong', '男', '135560123', '892183913', 'wuyidau', '4399234', '2022-01-14 16:07:32', '2022-01-14 16:07:32');
INSERT INTO `user_info` VALUES (78, 'hengsen', '4297f44b13955235245b2497399d7a93', '恒森', '男', '13555600848', '2902243707@qq.com', '东城村五邑大学', '13123********', '2022-01-14 16:09:24', '2022-01-14 16:10:59');
INSERT INTO `user_info` VALUES (79, 'kk', 'e10adc3949ba59abbe56e057f20f883e', 'kesib', '男', '12344', 'kk@qq.com', '东城村五邑大学', '13243********', '2022-01-14 16:24:48', '2022-01-14 16:25:13');
INSERT INTO `user_info` VALUES (80, 'shaorong', '4297f44b13955235245b2497399d7a93', '黄绍荣13123', '男', '13555600848', '892754472@qq.com', '东城村五邑大学', '44092********060272', '2022-01-14 16:36:30', '2022-01-14 16:38:45');

-- ----------------------------
-- Table structure for worker_info
-- ----------------------------
DROP TABLE IF EXISTS `worker_info`;
CREATE TABLE `worker_info`  (
  `worker_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作员id',
  `role` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'worker' COMMENT '角色:worker/admin',
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `department` int(11) NULL DEFAULT NULL COMMENT '部门',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `address` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`worker_id`) USING BTREE,
  UNIQUE INDEX `uqe_username`(`username`) USING BTREE,
  INDEX `department`(`department`) USING BTREE,
  CONSTRAINT `worker_info_ibfk_1` FOREIGN KEY (`department`) REFERENCES `department_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作人员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of worker_info
-- ----------------------------
INSERT INTO `worker_info` VALUES (1, 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '袁秀英', '男', '13164981755', 1, 'juan18@hotmail.com', '贵州省洁市清城汕尾街d座 502246', '2021-12-07 12:40:05', '2023-02-24 14:49:17');
INSERT INTO `worker_info` VALUES (2, 'operator', 'work1', 'e10adc3949ba59abbe56e057f20f883e', '沈璐', '男', '13873572680', 3, 'pwei@yuan.cn', '山西省合肥县西峰香港街C座 302114', '2021-12-19 12:55:13', '2023-02-24 14:49:17');
INSERT INTO `worker_info` VALUES (3, 'operator', 'work6', 'e10adc3949ba59abbe56e057f20f883e', '丁艳', '男', '18826244663', 4, 'jinggu@yongzeng.net', '西藏自治区秀荣市海陵张家港街m座 576579', '2021-12-19 12:58:09', '2023-02-24 14:49:17');
INSERT INTO `worker_info` VALUES (32, 'admin', 'work8', 'e10adc3949ba59abbe56e057f20f883e', '黄柳', '男', '15660538227', 1, 'xia53@gangjing.cn', '天津市辽阳市金平傅街j座 850761', '2022-01-04 11:53:30', '2023-02-24 14:49:17');
INSERT INTO `worker_info` VALUES (33, 'operator', 'work2', 'e10adc3949ba59abbe56e057f20f883e', '王慧', '男', '15280462787', 1, 'jieqian@yahoo.com', '重庆市兰英市高明沈阳街d座 430329', '2022-01-04 11:53:30', '2022-01-13 21:56:12');
INSERT INTO `worker_info` VALUES (34, 'operator', 'work3', 'e10adc3949ba59abbe56e057f20f883e', '田龙', '女', '13658227544', 4, 'qiangfang@yahoo.com', '浙江省坤县西峰余街C座 221697', '2022-01-04 11:53:30', '2023-02-24 14:49:17');
INSERT INTO `worker_info` VALUES (35, 'operator', 'work4', 'e10adc3949ba59abbe56e057f20f883e', '徐桂香', '男', '13637320900', 2, 'fangyang@pinggang.cn', '江西省南昌县双滦王路E座 490503', '2022-01-04 11:53:30', '2023-02-24 14:49:17');
INSERT INTO `worker_info` VALUES (40, 'admin', 'work7', 'e10adc3949ba59abbe56e057f20f883e', '韩桂花', '男', '13388584730', 1, 'xliu@yahoo.com', '江西省太原市翔安刘街J座 815655', '2022-01-04 11:57:56', '2023-02-24 14:49:17');
INSERT INTO `worker_info` VALUES (45, 'admin', 'work10', 'e10adc3949ba59abbe56e057f20f883e', '方勇', '男', '15110335073', 1, 'nawu@hotmail.com', '江苏省宁县南溪王路x座 227133', '2022-01-07 17:14:24', '2023-02-24 14:49:17');
INSERT INTO `worker_info` VALUES (46, 'operator', 'work11', 'e10adc3949ba59abbe56e057f20f883e', '徐桂芝', '女', '15357876400', 3, 'gaotao@hotmail.com', '青海省长沙县山亭廖街v座 439792', '2022-01-07 17:14:24', '2023-02-24 14:49:17');
INSERT INTO `worker_info` VALUES (47, 'operator', 'work12', 'e10adc3949ba59abbe56e057f20f883e', '郭玉英', '男', '15131877702', 4, 'yong36@gmail.com', '安徽省帆市东城唐路d座 819867', '2022-01-07 17:14:24', '2023-02-24 14:49:17');
INSERT INTO `worker_info` VALUES (48, 'operator', 'work13', 'e10adc3949ba59abbe56e057f20f883e', '张波', '女', '13034769245', 1, 'ping21@zengyi.net', '广东省巢湖县和平王路V座 418151', '2022-01-07 17:14:24', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (49, 'admin', 'work14', 'e10adc3949ba59abbe56e057f20f883e', '陈桂英', '男', '15278236594', 1, 'juanliu@jieming.cn', '澳门特别行政区东莞市高港关岭街Z座 113957', '2022-01-07 17:14:24', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (50, 'operator', 'work15', 'e10adc3949ba59abbe56e057f20f883e', '郭慧', '男', '18975736884', 1, 'xiahu@dengpan.net', '吉林省芳县南湖兰路y座 907387', '2022-01-07 17:14:24', '2022-01-13 21:56:12');
INSERT INTO `worker_info` VALUES (51, 'operator', 'work16', 'e10adc3949ba59abbe56e057f20f883e', '王兰英', '女', '15328888611', 4, 'epan@hotmail.com', '海南省桂荣县锡山拉萨路m座 889598', '2022-01-07 17:14:24', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (52, 'operator', 'work17', 'e10adc3949ba59abbe56e057f20f883e', '张丽丽', '男', '13716052290', 2, 'mingxiong@guiyingna.cn', '贵州省玉英市长寿席路j座 607847', '2022-01-07 17:14:24', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (53, 'admin', 'work18', 'e10adc3949ba59abbe56e057f20f883e', '陈红', '男', '13342125691', 1, 'vzhao@la.cn', '甘肃省勇县金平合山街V座 343550', '2022-01-07 17:14:24', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (54, 'admin', 'work20', 'e10adc3949ba59abbe56e057f20f883e', '范凤英', '男', '14747652210', 1, 'juan44@hotmail.com', '江西省梧州县西峰林街g座 890108', '2022-01-07 23:54:38', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (55, 'operator', 'work21', 'e10adc3949ba59abbe56e057f20f883e', '张兵', '女', '15567487644', 3, 'min11@hotmail.com', '浙江省淮安市西峰周路Q座 231298', '2022-01-07 23:54:38', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (56, 'operator', 'work22', 'e10adc3949ba59abbe56e057f20f883e', '黄宁', '男', '18762780051', 4, 'taozhang@hotmail.com', '河北省荆门县东丽徐路w座 733493', '2022-01-07 23:54:38', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (57, 'operator', 'work23', 'e10adc3949ba59abbe56e057f20f883e', '黄荣', '女', '18663579680', 1, 'chao28@yahoo.com', '江苏省颖县黄浦吴路f座 348086', '2022-01-07 23:54:38', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (58, 'admin', 'work24', 'e10adc3949ba59abbe56e057f20f883e', '周雷', '男', '13972309788', 1, 'leixiuying@lijun.cn', '宁夏回族自治区帆县山亭黄路Q座 528477', '2022-01-07 23:54:38', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (59, 'operator', 'work25', 'e10adc3949ba59abbe56e057f20f883e', '周静', '男', '13319975239', 1, 'jingyi@lilong.cn', '海南省梧州市滨城李路f座 504377', '2022-01-07 23:54:38', '2022-01-13 21:56:12');
INSERT INTO `worker_info` VALUES (60, 'operator', 'work26', 'e10adc3949ba59abbe56e057f20f883e', '师婷婷', '女', '15984781796', 4, 'nren@kc.cn', '西藏自治区桂珍市友好昆明街Y座 634021', '2022-01-07 23:54:38', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (61, 'operator', 'work27', 'e10adc3949ba59abbe56e057f20f883e', '何燕', '男', '14715158775', 2, 'vcao@hotmail.com', '广东省莉市朝阳台北街x座 190715', '2022-01-07 23:54:38', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (62, 'admin', 'work28', 'e10adc3949ba59abbe56e057f20f883e', '马淑珍', '男', '18878249984', 1, 'fgu@hotmail.com', '江西省六安县和平永安街r座 137243', '2022-01-07 23:54:38', '2023-02-24 14:49:18');
INSERT INTO `worker_info` VALUES (63, 'operator', 'work41', 'e10adc3949ba59abbe56e057f20f883e', '周静', '男', '13319975239', 1, 'jingyi@lilong.cn', '海南省梧州市滨城李路f座 504377', '2022-01-14 14:30:37', '2022-01-14 14:30:37');

SET FOREIGN_KEY_CHECKS = 1;
