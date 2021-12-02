/*
 Navicat MySQL Data Transfer

 Source Server         : LEGION
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : meal

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 02/12/2021 23:30:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for diningcar
-- ----------------------------
DROP TABLE IF EXISTS `diningcar`;
CREATE TABLE `diningcar`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `foodid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dingingcar-user`(`userid`) USING BTREE,
  INDEX `diningcar-food`(`foodid`) USING BTREE,
  CONSTRAINT `dingingcar-user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `diningcar-food` FOREIGN KEY (`foodid`) REFERENCES `food` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of diningcar
-- ----------------------------
INSERT INTO `diningcar` VALUES (1, 3, 7);
INSERT INTO `diningcar` VALUES (2, 4, 1);
INSERT INTO `diningcar` VALUES (3, 4, 2);
INSERT INTO `diningcar` VALUES (4, 4, 3);
INSERT INTO `diningcar` VALUES (5, 3, 38);
INSERT INTO `diningcar` VALUES (6, 3, 40);
INSERT INTO `diningcar` VALUES (7, 3, 10);
INSERT INTO `diningcar` VALUES (8, 3, 11);
INSERT INTO `diningcar` VALUES (9, 2, 2);
INSERT INTO `diningcar` VALUES (10, 2, 11);
INSERT INTO `diningcar` VALUES (11, 2, 21);
INSERT INTO `diningcar` VALUES (96, 17, 33);

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `foodname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `feature` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '暂无',
  `material` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '暂无',
  `price` int NOT NULL,
  `type` int NOT NULL,
  `picture` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hits` int UNSIGNED NOT NULL DEFAULT 0,
  `comment` int NOT NULL DEFAULT -1 COMMENT '整数代表特价菜的价格，0代表厨师推荐，-1表示为正常菜品。',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique-foodname`(`foodname`) USING BTREE,
  INDEX `food-foodtype`(`type`) USING BTREE,
  CONSTRAINT `food-foodtype` FOREIGN KEY (`type`) REFERENCES `foodtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, '国际共产主义发展报告', '国际共运黄皮书', '介绍了中国共产党的发展历程', 49, 3, 'images/jiachang/01.jpg', 1, 0);
INSERT INTO `food` VALUES (2, '革命', '精装版', '近现代革命经典著作', 48, 3, 'images/jiachang/02.jpg', 0, -1);
INSERT INTO `food` VALUES (3, '陈独秀传', '三十年磨一剑', '珍贵秘密档案还原历史上真实的陈独秀', 46, 1, 'images/jiachang/03.jpg', 1, -1);
INSERT INTO `food` VALUES (4, '中国历代政治得失', '精装版', '总括中国历史政治精妙大意', 42, 1, 'images/jiachang/04.jpg', 1, -1);
INSERT INTO `food` VALUES (5, '近代中国社会新陈代谢', '陈旭麓', '近代中国社会新陈代谢精装', 46, 1, 'images/jiachang/05.jpg', 0, 0);
INSERT INTO `food` VALUES (6, '大国宪制', '近代中国制度', '近代中国制度的优劣', 45, 1, 'images/jiachang/06.jpg', 0, -1);
INSERT INTO `food` VALUES (7, '毛泽东传', '精装版', '历史人物传记，毛泽东传', 54, 1, 'images/jiachang/07.jpg', 0, -1);
INSERT INTO `food` VALUES (8, '江泽民传', '他改变了中国', '历史人物传记，学校图书馆没有哦', 44, 1, 'images/jiachang/08.jpg', 0, -1);
INSERT INTO `food` VALUES (9, '中华人民共和国简史', '暂无', '中华人民共和国70年历史发展进程', 58, 1, 'images/jiachang/09.jpg', 0, -1);
INSERT INTO `food` VALUES (10, '中国共产党历史', '暂无', '中国共产党发展历程', 47, 1, 'images/jiachang/10.jpg', 0, -1);
INSERT INTO `food` VALUES (11, '道德与法治', '课本', '人教版九年级上册', 8, 2, 'images/liangcai/1.jpg', 0, 18);
INSERT INTO `food` VALUES (12, '化学', '课本', '人教版九年级下册', 9, 2, 'images/liangcai/2.jpg', 0, -1);
INSERT INTO `food` VALUES (13, '数学', '课本', '人教版九年级下册', 5, 2, 'images/liangcai/3.jpg', 0, -1);
INSERT INTO `food` VALUES (14, '高级计量经济学', '课本', '经济学管理学研究生教学用书', 188, 2, 'images/liangcai/4.jpg', 0, -1);
INSERT INTO `food` VALUES (15, '地理', '课本', '地理八年级上册', 4, 2, 'images/liangcai/5.jpg', 0, 0);
INSERT INTO `food` VALUES (16, '苏教版数学', '课本', '苏教版一年级上册', 6, 2, 'images/liangcai/6.jpg', 0, -1);
INSERT INTO `food` VALUES (17, '法医学+尸体变化图鉴', '学术教材', '两本套装', 99, 2, 'images/liangcai/7.jpg', 0, -1);
INSERT INTO `food` VALUES (18, '岛上书店', '这是来凑数的', '哈哈哈哈', 9999, 2, 'images/liangcai/8.jpg', 0, -1);
INSERT INTO `food` VALUES (19, '高中化学', '课本', '高中化学奥赛教材', 166, 2, 'images/liangcai/9.jpg', 0, -1);
INSERT INTO `food` VALUES (20, '建设工程技术与计量', '课本', '建筑类研究生教学用书', 188, 2, 'images/liangcai/10.jpg', 2, 15);
INSERT INTO `food` VALUES (21, '苏菲的世界', '歪国小说', '暂无（没读肯定不知道）', 45, 3, 'images/zhushi/1.jpg', 0, -1);
INSERT INTO `food` VALUES (22, '哈利波特', '哈利波特', '哈利波特', 654, 3, 'images/zhushi/2.jpg', 0, -1);
INSERT INTO `food` VALUES (23, '基督山伯爵', '歪果经典小说', '咯咯哒', 123, 3, 'images/zhushi/3.jpg', 0, -1);
INSERT INTO `food` VALUES (24, '我是猫', '歪果大师著作', '喵~', 55, 3, 'images/zhushi/4.jpg', 1, -1);
INSERT INTO `food` VALUES (25, '狂人日记', '鲁大师', '鲁大师著作', 55, 3, 'images/zhushi/5.jpg', 0, 0);
INSERT INTO `food` VALUES (26, '海底两万里', '你不知啊？', '你真的不知道？不会吧不会吧，真的不知道啊？', 47, 3, 'images/zhushi/6.jpg', 0, -1);
INSERT INTO `food` VALUES (27, '追风筝的人', '高圆圆倾情推荐', '畅销三十三个国家的心灵至于制作', 12, 3, 'images/zhushi/7.jpg', 0, -1);
INSERT INTO `food` VALUES (28, '杀死一条知更鸟', '鸟:mmp', '下单送笔记本', 43, 3, 'images/zhushi/8.jpg', 0, -1);
INSERT INTO `food` VALUES (29, '追人的风筝', '最恐怖的风筝', '哼，啊啊啊啊啊啊啊啊啊啊！！！！', 33, 3, 'images/zhushi/9.jpg', 0, -1);
INSERT INTO `food` VALUES (30, '百度人', '1+2+3', '谁会是班里的百度人', 35, 3, 'images/zhushi/10.jpg', 0, 10);
INSERT INTO `food` VALUES (31, '原著', '无删减版', '酱‘哎', 36, 4, 'images/yinpin/01.jpg', 1, -1);
INSERT INTO `food` VALUES (32, '四大名著', '无删减版', '原著神魔细节都有，没删减嗷', 12, 4, 'images/yinpin/02.jpg', 0, -1);
INSERT INTO `food` VALUES (33, '小网址', '纯洁之书', '不朽经典', 11, 4, 'images/yinpin/03.jpg', 8, -1);
INSERT INTO `food` VALUES (34, '西游记', '西游记', '还是挺美的西游记', 11, 4, 'images/yinpin/04.jpg', 0, 9);
INSERT INTO `food` VALUES (35, '儒林外史', '九年级下推荐', '教材配套阅读', 12, 4, 'images/yinpin/05.jpg', 0, -1);
INSERT INTO `food` VALUES (36, '红楼梦', '哈哈哈哈哈', '嘿嘿嘿嘿嘿嘿', 22, 4, 'images/yinpin/06.jpg', 0, -1);
INSERT INTO `food` VALUES (37, '海底两万里1', '无删减版', '七年级下', 23, 4, 'images/yinpin/07.jpg', 0, -1);
INSERT INTO `food` VALUES (38, '悲惨世界', '歌唱人性和正义', '人性！！！！！！！正义！！！！！！！！！', 25, 4, 'images/yinpin/08.jpg', 0, 0);
INSERT INTO `food` VALUES (39, '老人于海', '好大的鱼', '虎纹鲨鱼！！！', 28, 4, 'images/yinpin/09.jpg', 0, -1);
INSERT INTO `food` VALUES (40, '哈姆雷特', '著毫升经典译本', '莎士比亚经典悲喜剧', 45, 4, 'images/yinpin/10.jpg', 0, -1);

-- ----------------------------
-- Table structure for foodtype
-- ----------------------------
DROP TABLE IF EXISTS `foodtype`;
CREATE TABLE `foodtype`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `typename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique-typename`(`typename`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of foodtype
-- ----------------------------
INSERT INTO `foodtype` VALUES (4, '名著');
INSERT INTO `foodtype` VALUES (3, '小说');
INSERT INTO `foodtype` VALUES (1, '红薯');
INSERT INTO `foodtype` VALUES (2, '课本');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ident` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0普通用户\r\n1管理员',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique-username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', '1', '0', '0');
INSERT INTO `user` VALUES (2, 'user1', '123', '0', '041184835202', '大连东软信息学院A3座117室');
INSERT INTO `user` VALUES (3, 'user2', '123', '0', '041184835207', '大连理工大学计算机系');
INSERT INTO `user` VALUES (4, 'user3', '123', '0', '041184832264', '新新园100号2门103');
INSERT INTO `user` VALUES (17, '0', '0', '0', '0', '0');

SET FOREIGN_KEY_CHECKS = 1;
