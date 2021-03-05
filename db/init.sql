/*
 Navicat MySQL Data Transfer

 Source Server         : FORIF LOCAL DOCKER
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : db

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 05/03/2021 11:06:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40)  NULL DEFAULT NULL,
  `lastname` varchar(40)  NULL DEFAULT NULL,
  `phone` varchar(40)  NULL DEFAULT NULL,
  `email` varchar(60)  NULL DEFAULT NULL,
  `age` int(3) NULL DEFAULT NULL,
  `registration_date` datetime(0) NULL DEFAULT NULL,
  `id_gender` int(1) NULL DEFAULT NULL,
  `id_status` int(2) NULL DEFAULT NULL,
  `street` varchar(40)  NULL DEFAULT NULL,
  `city` varchar(40)  NULL DEFAULT NULL,
  `state` varchar(40)  NULL DEFAULT NULL,
  `code` varchar(20)  NULL DEFAULT NULL,
  `country` varchar(40)  NULL DEFAULT NULL,
  `additional` varchar(100)  NULL DEFAULT NULL,
  PRIMARY KEY (`id_customer`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------

-- ----------------------------
-- Table structure for genders
-- ----------------------------
DROP TABLE IF EXISTS `genders`;
CREATE TABLE `genders`  (
  `id_gender` int(1) NOT NULL,
  `gender` varchar(20)  NULL DEFAULT NULL,
  PRIMARY KEY (`id_gender`) USING BTREE
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of genders
-- ----------------------------
INSERT INTO `genders` VALUES (1, 'Hombre');
INSERT INTO `genders` VALUES (2, 'Mujer');
INSERT INTO `genders` VALUES (3, 'Otro');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `id_status` int(2) NOT NULL AUTO_INCREMENT,
  `status` varchar(40)  NULL DEFAULT NULL,
  PRIMARY KEY (`id_status`) USING BTREE
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 'Nuevo');
INSERT INTO `status` VALUES (2, 'No interesado');
INSERT INTO `status` VALUES (3, 'Número equivocado');
INSERT INTO `status` VALUES (4, 'Información equivocada');
INSERT INTO `status` VALUES (5, 'Alto potencial');
INSERT INTO `status` VALUES (6, 'Bajo potencial');

SET FOREIGN_KEY_CHECKS = 1;
