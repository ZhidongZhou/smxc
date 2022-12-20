use shopapp;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `goods_cart_item`;
CREATE TABLE `goods_cart_item`  (
  `Id` int(20) NOT NULL AUTO_INCREMENT,
  `GoodsId` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '商品id',
  `Quantity` int(11) DEFAULT NULL COMMENT '数量',
  `ShopId` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '店铺id',
  `SpecId` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `UserId` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '用户id',
  `CreateDate` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `DataStatus` int(11) DEFAULT NULL COMMENT '1有效2上架3下架4删除',
  `UpdateDate` datetime(6) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1438 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `GoodsId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品编号',
  `GoodsName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `Num` int(11) NOT NULL COMMENT '购买数量',
  `GoodsImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品图片',
  `SaleAmount` decimal(18, 2) NOT NULL COMMENT '售卖价',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `UserId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '用户Id',
  `BuyUser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单人',
  `BuyPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单人电话',
  `BuyAddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单人地址',
  `GoodsId` int(11) NOT NULL DEFAULT 1 COMMENT '物品Id',
  `GoodsNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `GoodsName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称（组合名称）',
  `Num` int(11) NOT NULL DEFAULT 1 COMMENT '购买个数',
  `AmountTotal` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
  `Discount` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '折扣',
  `RealAmountTotal` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '实际总付款',
  `ShopId` int(11) NOT NULL DEFAULT 1 COMMENT '商家Id',
  `ShopName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商家名称',
  `ShopPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商家电话',
  `ShopAddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商家地址',
  `DataStatus` int(11) NOT NULL DEFAULT 1 COMMENT '1有效2无效',
  `CreateDate` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `OrderStatus` int(11) NOT NULL DEFAULT 0 COMMENT '1已完成2待支付3待取货',
  `GoodsSpecId` int(11) NOT NULL DEFAULT 0 COMMENT '商品规格Id',
  `GoodsSpecName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品规格名称',
  `Price` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '单个售卖价',
  `CostPrice` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '单个成本价',
  `DeliverType` int(11) DEFAULT 0 COMMENT '取货方式（0到店自提1邮寄）',
  `PayType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FlowNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '订单流水号',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `i_orderinfo_orderno`(`OrderNo`) USING BTREE,
  INDEX `i_orderinfo_userid`(`UserId`) USING BTREE,
  INDEX `i_orderinfo_shopid`(`ShopId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1500 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for petgoods
-- ----------------------------
DROP TABLE IF EXISTS `petgoods`;
CREATE TABLE `petgoods`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '商户Id',
  `GoodsNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `DataStatus` int(11) NOT NULL DEFAULT 1 COMMENT '1有效2上架3下架4删除',
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `Classify` int(11) NOT NULL DEFAULT 0 COMMENT '分类Id',
  `ClassifyName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `GoodsImage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品图片',
  `Stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `SaleAmount` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '售卖价',
  `CreateDate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `Brand` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品牌',
  `OrderNum` int(11) NOT NULL DEFAULT 0 COMMENT '优先顺序',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `i_petgoods_si`(`ShopId`) USING BTREE,
  INDEX `i_petgoods_t`(`Title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 308 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of petgoods
-- ----------------------------
INSERT INTO `petgoods` VALUES (1, 1, '201808271', 3, '猫玩具鱼猫薄荷鱼逗猫棒磨牙玩具宠物毛绒仿真', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20180827012208524179.jpg', -1, 1.00, '2018-08-27 01:23:40', '2019-01-01 11:14:17', '皇家', 0);
INSERT INTO `petgoods` VALUES (2, 1, '201808272', 3, '猫咪冻干猫零食肉干三文鱼牛肉干成猫幼猫6包装', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20180827012953524311.jpg', 63, 0.05, '2018-08-27 01:27:22', '2019-01-01 11:14:35', '皇家', 0);
INSERT INTO `petgoods` VALUES (3, 1, '201808273', 3, '狗狗笼子大中小型犬围栏栅栏泰迪猫笼子兔子', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20180827012937306698.jpg', 91, 2.00, '2018-08-27 01:27:23', '2019-01-01 11:15:20', '狗狗笼', 0);
INSERT INTO `petgoods` VALUES (4, 1, '201808274', 3, '猫咪用品猫头形猫抓板大型瓦楞纸大号猫抓板磨爪', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20180827013023852183.jpg', 97, 2.00, '2018-08-27 01:27:24', '2019-01-01 11:15:15', NULL, 0);
INSERT INTO `petgoods` VALUES (5, 1, '201808275', 3, '瓶装猫薄荷粉叶猫草猫咪兴奋零食天然博荷', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20180827013036227875.jpg', 100, 2.00, '2018-08-27 01:27:25', '2019-01-01 11:15:09', NULL, 0);
INSERT INTO `petgoods` VALUES (6, 1, '201808276', 3, '大号宠物猫抓板碗形大瓦楞纸猫窝', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20180827013047899116.jpg', 100, 7.00, '2018-08-27 01:27:26', '2019-01-01 11:15:04', NULL, 0);
INSERT INTO `petgoods` VALUES (7, 1, '201808277', 3, '味它宠物瓦楞纸猫抓板猫玩具猫咪磨爪猫抓板', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20180827013059993291.jpg', 99, 13.00, '2018-08-27 01:27:27', '2019-01-01 11:14:59', NULL, 0);
INSERT INTO `petgoods` VALUES (8, 1, '201808278', 3, '猫粮 幼猫 成猫天然粮3斤纽萃派海洋鱼肉', 500, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20180827013123524434.jpg', 99, 20.00, '2018-08-27 01:27:28', '2019-01-01 11:14:54', '休普', 0);
INSERT INTO `petgoods` VALUES (9, 1, '201808279', 3, '幼猫猫粮 1-4个月 离乳期奶糕 2-12个月天然粮', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20180827013138759199.jpg', 100, 15.00, '2018-08-27 01:27:29', '2019-01-01 11:14:48', '11', 0);
INSERT INTO `petgoods` VALUES (10, 1, '2018082710', 3, '美国妙多乐幼猫粮1.5kg孕猫奶糕离乳期', 101, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20180827013205696194.jpg', 2, 0.01, '2018-08-27 01:27:31', '2019-01-01 11:14:44', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (12, 2, '1718800', 3, '进口|StellaChewy| 生肉冻干', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027172153444460.jpg', 10, 428.00, '2018-10-27 17:17:55', '2018-11-19 15:56:27', 'StellaChewy', 0);
INSERT INTO `petgoods` VALUES (13, 2, '7886622', 3, '进口|纽翠斯 | 通用型生肉狗粮', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027174451170318.jpg', 10, 240.00, '2018-10-27 17:44:27', '2018-12-18 19:53:10', '纽翠斯', 0);
INSERT INTO `petgoods` VALUES (14, 2, '1785628', 3, '进口|纽翠斯 | 通用型鸡肉猫粮5kg', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027175150571199.jpg', 10, 465.00, '2018-10-27 17:51:20', '2018-11-19 16:00:00', '纽翠斯', 0);
INSERT INTO `petgoods` VALUES (16, 2, '7020417', 3, '进口|皇家|小型犬幼犬狗粮2kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027185355508176.jpg', 10, 138.00, '2018-10-27 18:53:36', '2018-11-19 16:01:02', '皇家', 0);
INSERT INTO `petgoods` VALUES (17, 2, '8348623', 3, '进口|皇家|小型犬成犬狗粮2kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027185654542130.jpg', 10, 130.00, '2018-10-27 18:56:38', '2018-11-19 16:01:41', '皇家', 0);
INSERT INTO `petgoods` VALUES (18, 2, '2068881', 3, '进口|皇家|贵宾幼犬狗粮/斗牛幼犬2.6kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027185944310199.jpg', 10, 236.00, '2018-10-27 18:59:27', '2018-11-19 16:03:18', '皇家', 0);
INSERT INTO `petgoods` VALUES (19, 2, '5141668', 3, '进口|皇家|通用型成猫粮2kg', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027190411593924.jpg', 10, 125.00, '2018-10-27 19:03:50', '2018-11-19 16:04:04', '皇家', 0);
INSERT INTO `petgoods` VALUES (20, 2, '1333813', 3, '进口|皇家|A3狗粮11kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027225737266626.jpg', 10, 330.00, '2018-10-27 19:12:22', '2018-11-19 16:06:14', '皇家', 0);
INSERT INTO `petgoods` VALUES (21, 2, '8320508', 3, '进口|皇家|CC狗粮10kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027230328958277.jpg', 10, 300.00, '2018-10-27 19:12:38', '2018-11-19 16:06:48', '皇家', 0);
INSERT INTO `petgoods` VALUES (22, 2, '6137337', 3, '进口|皇家|通用型小型犬幼犬粮8kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027232329598317.jpg', 10, 530.00, '2018-10-27 19:12:52', '2018-11-19 16:07:22', '皇家', 0);
INSERT INTO `petgoods` VALUES (23, 2, '3044701', 3, '进口|皇家|拉布拉多专用成犬粮15kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027232546397154.jpg', 10, 650.00, '2018-10-27 19:12:54', '2018-11-19 16:07:46', '皇家', 0);
INSERT INTO `petgoods` VALUES (26, 2, '1333814', 3, '进口|皇家|幼猫奶糕2kg', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181027224201254695.jpg', 10, 330.00, '2018-10-27 19:12:22', '2018-11-19 16:05:40', '皇家', 0);
INSERT INTO `petgoods` VALUES (27, 1, '201808279', 3, '幼猫猫粮 1-4个月 离乳期奶糕 2-12个月天然粮', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20180827013138759199.jpg', 99, 15.00, '2018-11-03 15:52:55', '2019-01-01 11:14:40', '让人', 0);
INSERT INTO `petgoods` VALUES (34, 2, '2562744', 3, '进口|K9|鸡肉狗粮500g', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105021326661117.jpg', 10, 280.00, '2018-11-05 02:13:40', '2018-11-19 16:10:36', 'K9', 0);
INSERT INTO `petgoods` VALUES (35, 2, '2815035', 3, '进口|渴望|鸡肉猫粮1kg', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105021357192133.jpg', 10, 155.00, '2018-11-05 02:14:00', '2018-11-19 16:11:27', '渴望', 0);
INSERT INTO `petgoods` VALUES (36, 2, '2446581', 2, '进口|渴望|六种鱼猫粮1.8kg', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105021407380102.jpg', 10, 330.00, '2018-11-05 02:14:18', '2018-11-19 16:12:13', '渴望', 0);
INSERT INTO `petgoods` VALUES (37, 2, '6527488', 3, '进口|渴望|鸡肉成犬狗粮2kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105021438521126.jpg', 10, 240.00, '2018-11-05 02:14:42', '2018-11-19 16:13:07', '渴望', 0);
INSERT INTO `petgoods` VALUES (38, 2, '3067621', 3, '进口|渴望|六种鱼全犬狗粮2kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105021443584407.jpg', 10, 675.00, '2018-11-05 02:14:48', '2018-11-19 16:13:40', '渴望', 0);
INSERT INTO `petgoods` VALUES (39, 2, '5678518', 2, '进口|巅峰|牛肉狗粮454g', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105021506740139.jpg', 10, 195.00, '2018-11-05 02:15:20', '2018-11-19 16:16:58', '巅峰', 0);
INSERT INTO `petgoods` VALUES (40, 2, '8642154', 2, '进口|巅峰|羊肉鸡肉牛肉猫粮400g', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105022855295162.jpg', 10, 170.00, '2018-11-05 02:29:27', '2018-11-19 16:18:01', '巅峰', 0);
INSERT INTO `petgoods` VALUES (41, 2, '5623852', 2, '进口|爱肯拿|狗粮海洋口味1kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105022937827986.jpg', 10, 120.00, '2018-11-05 02:29:49', '2018-11-19 16:18:28', '爱肯拿', 0);
INSERT INTO `petgoods` VALUES (42, 2, '2342033', 3, '进口|拉夫威尔|出行用品胸背', 102, '出行', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105022950592384.jpg', 10, 349.00, '2018-11-05 02:29:58', '2018-11-21 00:12:17', '拉夫威尔', 0);
INSERT INTO `petgoods` VALUES (43, 2, '3165660', 3, '进口|提拉米苏|幼犬狗粮10kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105022959139882.jpg', 10, 297.00, '2018-11-05 02:30:05', '2018-11-19 16:20:14', '提拉米苏', 0);
INSERT INTO `petgoods` VALUES (44, 2, '8872123', 2, '进口|日本michinoku|北海道红鲑鱼干80g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023005889114.jpg', 10, 88.00, '2018-11-05 02:30:07', '2018-11-19 16:21:01', '日本michinoku', 0);
INSERT INTO `petgoods` VALUES (45, 2, '8516002', 2, '进口|日本michinoku|火鸡筋60g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023008264736.jpg', 10, 88.00, '2018-11-05 02:30:09', '2018-11-19 16:23:07', 'michinoku', 0);
INSERT INTO `petgoods` VALUES (46, 2, '1150871', 3, '进口|盛来知|极美鲜金枪鱼30g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023010155185.jpg', 10, 25.00, '2018-11-05 02:30:11', '2018-11-19 16:23:40', '盛来知', 0);
INSERT INTO `petgoods` VALUES (47, 2, '1604740', 2, '进口|盛来知|五彩蔬菜粒80g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023012264980.jpg', 10, 25.00, '2018-11-05 02:30:14', '2018-11-19 16:24:10', '盛来知', 0);
INSERT INTO `petgoods` VALUES (48, 2, '1338628', 2, '进口|盛来知|鸡肉奶油夹心块12枚', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023014811166.jpg', 10, 20.00, '2018-11-05 02:30:16', '2018-11-19 16:25:09', '盛来知', 0);
INSERT INTO `petgoods` VALUES (49, 2, '6780851', 2, '进口|盛来知|低脂肪高钙牛皮绕鸡胸肉32个', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023016889243.jpg', 10, 35.00, '2018-11-05 02:30:21', '2018-11-19 16:25:32', '盛来知', 0);
INSERT INTO `petgoods` VALUES (50, 2, '8225315', 2, '进口|DARFORD达福德|零G致纯烤三文鱼烘焙零食340g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023023342121.jpg', 10, 99.00, '2018-11-05 02:30:32', '2018-11-19 16:26:51', 'DARFORD达福德', 0);
INSERT INTO `petgoods` VALUES (51, 2, '5131668', 2, '进口|新西兰真挚Zeal|鳕鱼粒宠物零食125g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023033233211.jpg', 10, 65.00, '2018-11-05 02:30:36', '2018-11-19 16:27:31', '真挚Zeal', 0);
INSERT INTO `petgoods` VALUES (52, 2, '1047032', 2, '进口|新西兰真挚Zeal牛小腿110g零食', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023036920117.jpg', 10, 75.00, '2018-11-05 02:30:38', '2018-11-20 18:21:37', '真挚Zeal', 0);
INSERT INTO `petgoods` VALUES (53, 2, '2226870', 2, '进口|顽皮|猫用鸡肉软丝80g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023039186192.jpg', 10, 30.00, '2018-11-05 02:30:42', NULL, NULL, 0);
INSERT INTO `petgoods` VALUES (54, 2, '3048516', 2, '国产|猫太郎|扇贝咖啡条50g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023042983177.jpg', 10, 15.00, '2018-11-05 02:30:48', '2018-11-20 12:58:08', '猫太郎', 0);
INSERT INTO `petgoods` VALUES (55, 2, '4752333', 2, '进口|MARUKAN|浓厚奶油补钙牛奶酥200g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023049358473.jpg', 10, 38.00, '2018-11-05 02:30:55', '2018-11-19 16:36:39', 'MARUKAN', 0);
INSERT INTO `petgoods` VALUES (56, 2, '6653708', 2, '国产|吉辛|鸭肉南瓜香肠80g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023055811146.jpg', 10, 56.00, '2018-11-05 02:31:04', '2018-11-19 16:37:07', '吉辛', 0);
INSERT INTO `petgoods` VALUES (57, 2, '8021404', 2, '国产|吉辛|鲨鱼软骨零食65g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023105374136.jpg', 10, 32.00, '2018-11-05 02:31:13', '2018-11-19 16:37:39', '吉辛', 0);
INSERT INTO `petgoods` VALUES (58, 2, '8817565', 2, '国产|吉辛|狗狗零食肉霸汉堡80g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023113905960.jpg', 10, 32.00, '2018-11-05 02:31:39', '2018-11-21 00:14:09', '吉辛', 0);
INSERT INTO `petgoods` VALUES (59, 2, '6346058', 2, '国产|吉辛|鸭肉冻干零食35g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023142280143.jpg', 10, 36.00, '2018-11-05 02:32:12', '2018-11-19 16:38:39', '吉辛', 0);
INSERT INTO `petgoods` VALUES (60, 2, '3331270', 2, '国产|吉辛|冻干辅粮45g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023212858737.jpg', 10, 39.00, '2018-11-05 02:32:18', '2018-11-19 16:39:48', '吉辛', 0);
INSERT INTO `petgoods` VALUES (61, 2, '4510027', 2, '国产|句句兽|羊奶布丁草莓口味12个', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023219358129.jpg', 10, 36.00, '2018-11-05 02:32:22', '2018-11-19 16:41:31', '句句兽', 0);
INSERT INTO `petgoods` VALUES (62, 2, '5788765', 2, '国产|句句兽|弹球零食100g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023223561612.jpg', 10, 25.00, '2018-11-05 02:32:27', '2018-11-19 16:42:26', '句句兽', 0);
INSERT INTO `petgoods` VALUES (63, 2, '6866624', 2, '国产|句句兽|缤纷冻干果蔬鸡肉脆片400g', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023227686142.jpg', 10, 159.00, '2018-11-05 02:32:30', '2018-11-19 16:43:23', '句句兽', 0);
INSERT INTO `petgoods` VALUES (64, 2, '6155462', 2, '国产|句句兽|纯肉松', 500, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023231202101.jpg', 10, 79.00, '2018-11-05 02:32:34', '2018-11-19 16:43:49', '句句兽', 0);
INSERT INTO `petgoods` VALUES (65, 2, '7768108', 2, '国产|贵为|狗玩具拉伸鸭子松鼠', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023235186145.jpg', 10, 56.00, '2018-11-05 02:32:41', '2018-11-21 00:34:46', '贵为', 0);
INSERT INTO `petgoods` VALUES (66, 2, '8046846', 3, '国产|贵为|狗玩具G-Ball球', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023241608210.jpg', 10, 18.00, '2018-11-05 02:32:45', '2018-11-21 00:34:23', '贵为', 0);
INSERT INTO `petgoods` VALUES (67, 2, '1235784', 2, '贵为|狗玩具拉手毛绒狮子', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023245936133.jpg', 10, 49.00, '2018-11-05 02:32:48', '2018-11-21 00:32:52', '贵为', 0);
INSERT INTO `petgoods` VALUES (68, 2, '6676036', 3, '贵为|狗玩具超强浣熊金花鼠', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023249639516.jpg', 10, 48.00, '2018-11-05 02:32:54', '2018-11-21 00:32:37', '贵为', 0);
INSERT INTO `petgoods` VALUES (69, 2, '2582380', 2, '贵为|狗玩具仿真臭鼬狐狸浣熊', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023254592166.jpg', 10, 22.00, '2018-11-05 02:32:56', '2018-11-21 00:32:21', '贵为', 0);
INSERT INTO `petgoods` VALUES (70, 2, '7577502', 3, '贵为|狗玩具浣熊叫叫棒', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023257295136.jpg', 10, 35.00, '2018-11-05 02:33:04', '2018-11-21 00:32:05', '贵为', 0);
INSERT INTO `petgoods` VALUES (71, 2, '4027744', 3, '贵为|狗玩具授勋叫叫驴 ', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023304670183.jpg', 10, 33.00, '2018-11-05 02:33:08', '2018-11-21 00:31:49', '贵为', 0);
INSERT INTO `petgoods` VALUES (72, 2, '1300238', 2, '贵为|狗玩具超强迷彩河马', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023308983335.jpg', 10, 55.00, '2018-11-05 02:33:10', '2018-11-21 00:31:35', '贵为', 0);
INSERT INTO `petgoods` VALUES (73, 2, '5216582', 2, '贵为|狗玩具呆萌狮子', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023310624202.jpg', 10, 36.00, '2018-11-05 02:33:12', '2018-11-21 00:31:19', '贵为', 0);
INSERT INTO `petgoods` VALUES (74, 2, '5741461', 3, '贵为|狗玩具大眼仔-狐狸', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023313124110.jpg', 10, 39.00, '2018-11-05 02:33:15', '2018-11-21 00:31:04', '贵为', 0);
INSERT INTO `petgoods` VALUES (75, 2, '6485440', 2, '贵为|狗玩具河马磨牙饼-紫L', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023315608185.jpg', 10, 72.00, '2018-11-05 02:33:16', '2019-01-13 18:03:58', '贵为', 0);
INSERT INTO `petgoods` VALUES (76, 2, '7117166', 2, '贵为|狗玩具杜拉兽浣熊-黄', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023317577558.jpg', 10, 88.00, '2018-11-05 02:33:22', '2018-11-21 00:30:32', '贵为', 0);
INSERT INTO `petgoods` VALUES (77, 2, '3014420', 2, '贵为|狗玩具咔趣狐狸S', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023323405587.jpg', 10, 58.00, '2018-11-05 02:33:26', '2018-11-21 00:30:17', '贵为', 0);
INSERT INTO `petgoods` VALUES (78, 2, '2822368', 2, '贵为|狗玩具酋长部落--狮子', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023326999554.jpg', 10, 49.00, '2018-11-05 02:33:39', '2018-11-21 00:29:59', '贵为', 0);
INSERT INTO `petgoods` VALUES (79, 2, '8274175', 2, '贵为|猫玩具猫草兔子（可添加猫草袋）', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023340889111.jpg', 10, 29.00, '2018-11-05 02:33:53', '2018-11-21 00:29:42', '贵为', 0);
INSERT INTO `petgoods` VALUES (80, 2, '1818044', 2, '贵为|猫玩具魔力逗猫棒-亮EVA', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023354499182.jpg', 10, 30.00, '2018-11-05 02:33:56', '2018-11-21 00:29:24', '贵为', 0);
INSERT INTO `petgoods` VALUES (81, 2, '3710520', 2, '贵为|猫玩具|炫律猎物-老鼠', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023356983121.jpg', 10, 32.00, '2018-11-05 02:34:05', '2018-11-21 00:29:01', '贵为', 0);
INSERT INTO `petgoods` VALUES (82, 2, '7626883', 3, '贵为|猫玩具韵律密道-狐狸', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023406608199.jpg', 10, 49.00, '2018-11-05 02:34:08', '2018-11-21 00:28:37', '贵为', 0);
INSERT INTO `petgoods` VALUES (83, 2, '4532246', 2, '国产|贵为|狗狗玩具Q仔-萌小猫', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023409311160.jpg', 10, 35.00, '2018-11-05 02:34:11', '2018-11-21 00:28:11', '贵为', 0);
INSERT INTO `petgoods` VALUES (84, 2, '8704631', 2, '贵为|狗狗玩具杜拉兽恐龙-红色', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023412311142.jpg', 10, 89.00, '2018-11-05 02:34:13', '2018-11-21 00:27:55', '贵为', 0);
INSERT INTO `petgoods` VALUES (85, 2, '4611004', 2, '贵为|狗狗玩具拉环系列-鳄鱼', 102, '玩具', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023413561147.jpg', 10, 89.00, '2018-11-05 02:34:15', '2018-11-21 00:27:33', '贵为', 0);
INSERT INTO `petgoods` VALUES (86, 2, '6612568', 2, '进口|福莱希|出行用品外星人牵引XS', 102, '出行', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023416186205.jpg', 10, 140.00, '2018-11-05 02:34:26', '2018-11-21 00:11:57', '福莱希', 0);
INSERT INTO `petgoods` VALUES (87, 2, '3607670', 2, '进口|福莱希|出行用品火星人波点XS', 102, '出行', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023426905129.jpg', 10, 90.00, '2018-11-05 02:34:33', '2018-11-21 00:11:39', '福莱希', 0);
INSERT INTO `petgoods` VALUES (88, 2, '4875538', 2, '进口|福莱希|出行牵引草莓XS', 102, '出行', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023433952933.jpg', 10, 129.00, '2018-11-05 02:34:36', '2018-11-21 00:11:22', '福莱希', 0);
INSERT INTO `petgoods` VALUES (89, 2, '5608255', 2, '进口|福莱希|德版牵引出行用品S', 102, '出行', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023437577126.jpg', 10, 70.00, '2018-11-05 02:34:43', '2018-11-21 00:11:06', '福莱希', 0);
INSERT INTO `petgoods` VALUES (90, 2, '2683366', 2, '进口|福莱希|出行用品珍藏版牵引S', 102, '出行', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023443889161.jpg', 10, 180.00, '2018-11-05 02:34:49', '2018-11-21 00:10:41', '福莱希', 0);
INSERT INTO `petgoods` VALUES (91, 2, '3862224', 2, '进口|福莱希|出行用品led灯发光牵引', 102, '出行', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023449967155.jpg', 10, 155.00, '2018-11-05 02:34:54', '2018-11-21 00:10:21', '福莱希', 0);
INSERT INTO `petgoods` VALUES (92, 2, '8778577', 2, '进口|福莱希|出行双头牵引', 102, '出行', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023455092114.jpg', 10, 78.00, '2018-11-05 02:34:57', '2018-11-21 00:10:07', '福莱希', 0);
INSERT INTO `petgoods` VALUES (93, 2, '1135174', 3, '进口|福莱希|多功能盒', 102, '出行', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023457858196.jpg', 10, 76.00, '2018-11-05 02:35:05', '2018-11-21 00:09:51', '福莱希', 0);
INSERT INTO `petgoods` VALUES (94, 2, '3403770', 2, '国产|台湾h258|水壶240cc', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023505577614.jpg', 10, 48.00, '2018-11-05 02:35:13', '2018-11-21 00:20:53', '台湾h258', 0);
INSERT INTO `petgoods` VALUES (95, 2, '8843012', 2, '国产|安立消|宠物消毒液500ml', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023514030207.jpg', 10, 35.00, '2018-11-05 02:35:17', '2018-11-21 00:20:46', '安立消', 0);
INSERT INTO `petgoods` VALUES (96, 2, '1666748', 2, '国产|乐宠乐喷|宠物室内喷雾300ml', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023518452522.jpg', 10, 65.00, '2018-11-05 02:35:24', '2018-11-21 00:20:39', '乐宠乐喷', 0);
INSERT INTO `petgoods` VALUES (97, 2, '2567213', 2, '国产|海洋之星|猫罐头70g', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023524920166.jpg', 10, 12.00, '2018-11-05 02:35:33', '2018-11-19 17:26:10', '海洋之星', 0);
INSERT INTO `petgoods` VALUES (98, 2, '4824810', 2, '国产|雪诗雅|猫罐头85g', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023534280943.jpg', 10, 14.00, '2018-11-05 02:35:41', '2018-11-19 17:26:53', '雪诗雅', 0);
INSERT INTO `petgoods` VALUES (99, 2, '5372415', 2, '国产|希宝|甄选肉块软包35g', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023542608648.jpg', 10, 8.00, '2018-11-05 02:35:50', '2018-11-19 17:28:29', '希宝', 0);
INSERT INTO `petgoods` VALUES (100, 2, '3545474', 2, '进口|k9|甄选猫罐头85g', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023550655111.jpg', 10, 25.00, '2018-11-05 02:36:00', '2018-11-19 17:29:29', 'k9', 0);
INSERT INTO `petgoods` VALUES (101, 2, '4267102', 2, '进口|k9|狗罐头170g', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023601295175.jpg', 10, 33.00, '2018-11-05 02:36:06', '2018-11-19 17:32:00', 'k9', 0);
INSERT INTO `petgoods` VALUES (102, 2, '5446040', 2, '进口|雪诗雅|狗罐头170g', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023607452238.jpg', 10, 18.00, '2018-11-05 02:36:10', '2018-11-19 17:31:14', '雪诗雅', 0);
INSERT INTO `petgoods` VALUES (103, 2, '3254777', 2, '进口|巅峰|猫罐头85g', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023611311629.jpg', 10, 28.00, '2018-11-05 02:36:23', '2018-11-19 17:35:37', '巅峰', 0);
INSERT INTO `petgoods` VALUES (104, 2, '1348008', 2, '进口|巅峰|狗罐头390g', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023624061372.jpg', 10, 47.00, '2018-11-05 02:36:30', '2018-11-19 17:36:19', '巅峰', 0);
INSERT INTO `petgoods` VALUES (105, 2, '1427746', 2, '国产|perfect|鳖蛋粉100g', 401, '猫粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023630999281.jpg', 10, 145.00, '2018-11-05 02:36:34', '2018-11-19 17:36:52', 'perfect', 0);
INSERT INTO `petgoods` VALUES (106, 2, '3884443', 2, '钢骨|狗狗磨牙棒洁齿除口臭L号鸡肉', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023635030899.jpg', 10, 30.00, '2018-11-05 02:36:42', '2018-11-21 00:27:06', '钢骨', 0);
INSERT INTO `petgoods` VALUES (107, 2, '3063281', 2, '进口|先牧仕|山羊奶粉340g', 101, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023643124116.jpg', 10, 156.00, '2018-11-05 02:36:46', '2018-11-21 00:13:41', '先牧仕', 0);
INSERT INTO `petgoods` VALUES (108, 2, '4242048', 2, '进口|谷登|卵磷脂美毛亮毛350g', 101, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023647170170.jpg', 10, 79.00, '2018-11-05 02:36:51', '2018-11-21 00:13:25', '谷登', 0);
INSERT INTO `petgoods` VALUES (109, 2, '2415007', 2, '进口|N1|猫砂17.5L', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023651905700.jpg', 10, 95.00, '2018-11-05 02:37:02', '2018-11-21 00:20:18', 'N1', 0);
INSERT INTO `petgoods` VALUES (110, 2, '7866240', 2, '国产|嘘嘘大师|宠物尿片m号', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023703014150.jpg', 10, 70.00, '2018-11-05 02:37:06', '2019-01-13 18:44:45', '嘘嘘大师', 0);
INSERT INTO `petgoods` VALUES (111, 2, '4316473', 3, '进口|世嘉|猫砂3.18kg', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023707467250.jpg', 10, 210.00, '2018-11-05 02:37:12', '2018-11-21 14:11:01', '世嘉', 0);
INSERT INTO `petgoods` VALUES (112, 2, '5664178', 2, '进口|海洋之星|臻越系列狗粮1.5kg', 402, '狗粮', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023712999849.jpg', 10, 210.00, '2018-11-05 02:37:20', '2018-11-21 22:57:34', '海洋之星', 0);
INSERT INTO `petgoods` VALUES (113, 2, '3758280', 2, '进口|皇家|宝石香波400ml', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023720592111.jpg', 10, 210.00, '2018-11-05 02:37:26', '2018-11-21 00:19:54', '皇家', 0);
INSERT INTO `petgoods` VALUES (114, 2, '5204634', 2, '进口|碧艾欧|双层毛专用香波355ml', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023727436151.jpg', 10, 108.00, '2018-11-05 02:37:38', '2018-11-21 00:19:47', '碧艾欧', 0);
INSERT INTO `petgoods` VALUES (115, 2, '6473482', 2, '进口|宝贝计划|宠物香波600ml', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023739452142.jpg', 10, 100.00, '2018-11-05 02:37:43', '2018-11-21 00:19:35', '宝贝计划', 0);
INSERT INTO `petgoods` VALUES (116, 2, '2388845', 2, '进口|那非普|全效洗液200ml', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023744014303.jpg', 10, 98.00, '2018-11-05 02:37:46', '2018-11-21 00:19:28', '那非普', 0);
INSERT INTO `petgoods` VALUES (117, 2, '3112572', 2, '进口|雪貂留香|宠物香波500ml', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023746624191.jpg', 10, 58.00, '2018-11-05 02:37:51', '2018-11-21 00:19:20', '雪貂留香', 0);
INSERT INTO `petgoods` VALUES (118, 2, '1731652', 2, '国产|台湾yu|宠物香波400ml', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023752233285.jpg', 10, 135.00, '2018-11-05 02:38:01', '2018-11-21 00:19:11', '台湾yu', 0);
INSERT INTO `petgoods` VALUES (119, 2, '2454388', 2, '国产|雪貂留香|新款宠物香波500ml', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023801920132.jpg', 10, 78.00, '2018-11-05 02:38:06', '2018-11-21 00:19:02', '雪貂留香', 0);
INSERT INTO `petgoods` VALUES (120, 2, '3276016', 2, '国产|神宝|宠物吸水毛巾', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023806952512.jpg', 10, 36.00, '2018-11-05 02:38:12', '2018-11-21 00:18:50', '神宝', 0);
INSERT INTO `petgoods` VALUES (121, 2, '4000733', 2, '进口|尼可信|体外驱虫药2-4公斤用', 101, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023813577345.jpg', 10, 80.00, '2018-11-05 02:38:19', '2018-11-21 00:18:40', '尼可信', 0);
INSERT INTO `petgoods` VALUES (122, 2, '4534612', 2, '可鲁|狗猫手术伤口细菌阴囊趾间炎消毒剂50ml', 101, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023819686709.jpg', 10, 100.00, '2018-11-05 02:38:20', '2018-11-21 00:18:30', '可鲁', 0);
INSERT INTO `petgoods` VALUES (123, 2, '6170155', 2, '国产|肤利真|皮肤护理喷剂125ml', 101, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023821374906.jpg', 10, 68.00, '2018-11-05 02:38:32', '2018-11-21 00:18:12', '肤利真', 0);
INSERT INTO `petgoods` VALUES (124, 2, '3086428', 2, '国产|派豆|宠物感冒感参素30ml', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023833014105.jpg', 10, 70.00, '2018-11-05 02:38:35', '2018-11-21 00:17:16', '派豆', 0);
INSERT INTO `petgoods` VALUES (125, 2, '4264267', 2, '进口|耳肤灵耳朵清净洗滴耳液10g', 101, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023836374569.jpg', 10, 120.00, '2018-11-05 02:38:40', '2018-11-21 00:16:50', '耳肤灵', 0);
INSERT INTO `petgoods` VALUES (126, 2, '8071531', 2, '进口|Terramycin|辉瑞眼膏3.5g', 101, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023840749175.jpg', 10, 75.00, '2018-11-05 02:38:42', '2018-11-21 00:16:39', 'Terramycin', 0);
INSERT INTO `petgoods` VALUES (127, 2, '5877884', 2, '国产|tomcat|犬猫清洁去污湿巾100片', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023843561158.jpg', 10, 20.00, '2018-11-05 02:38:46', '2018-11-21 00:16:29', 'tomcat', 0);
INSERT INTO `petgoods` VALUES (128, 2, '3151853', 2, '进口|jin|益生菌30支', 101, '零食', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023846842205.jpg', 10, 150.00, '2018-11-05 02:38:57', '2018-11-21 00:13:11', 'jin', 0);
INSERT INTO `petgoods` VALUES (129, 2, '8245064', 2, '国产|麦德豪|宠物项圈舔不着头', 102, '护理', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181105023858264170.jpg', 10, 15.00, '2018-11-05 02:39:04', '2018-11-21 00:16:15', '麦德豪', 0);
INSERT INTO `petgoods` VALUES (130, 1, '473291359', 3, '经典款牵引绳所中型犬专用', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181113222150294236.jpg', 0, 0.00, '2018-11-13 22:18:14', '2019-01-01 11:14:20', '  弗莱瑟', 0);
INSERT INTO `petgoods` VALUES (131, 2, '250159095', 2, '进口|皇家|幼猫粮2kg/10kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181114114149185306.jpg', 0, 0.00, '2018-11-14 11:43:25', '2018-11-19 16:04:47', '皇家', 0);
INSERT INTO `petgoods` VALUES (132, 2, '407747844', 2, '进口|日本michinoku|马小腿肉条140g', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181114120611800195.jpg', 0, 0.00, '2018-11-14 12:09:14', '2018-12-02 16:54:15', 'michinoku', 0);
INSERT INTO `petgoods` VALUES (133, 2, '500741217', 2, '狗狗洗澡和修毛具体可见价目表', 900, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181115140954495198.jpg', 0, 0.00, '2018-11-15 13:17:44', '2018-12-02 16:56:37', '忠犬', 0);
INSERT INTO `petgoods` VALUES (134, 2, '588912506', 2, '猫咪洗澡和修毛详情见价目表', 900, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181115144434622108.jpg', 0, 0.00, '2018-11-15 14:47:38', '2018-11-19 15:38:25', '忠犬公馆', 0);
INSERT INTO `petgoods` VALUES (135, 2, '920830964', 2, '剪指甲/清耳道/梳理打结毛发/刷牙/局部染色', 900, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181115152958667693.jpg', 0, 0.00, '2018-11-15 15:33:51', '2018-11-19 15:38:12', '忠犬公馆', 0);
INSERT INTO `petgoods` VALUES (136, 1, '269698949', 3, '洗澡修毛护理套餐', 900, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181116120159606145.jpg', 0, 0.00, '2018-11-16 12:03:00', '2019-01-01 11:14:26', '忠犬公馆', 0);
INSERT INTO `petgoods` VALUES (137, 3, '184387950', 2, '国产|伯纳天纯无谷低敏系列小型犬幼犬粮1.5kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117114422820178.jpg', 0, 0.00, '2018-11-17 11:47:34', '2018-11-23 12:48:04', '伯纳天纯', 0);
INSERT INTO `petgoods` VALUES (138, 3, '132393360', 2, '国产伯纳天纯无谷低敏系列大型犬幼犬/成犬粮15kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117120734154193.jpg', 0, 0.00, '2018-11-17 12:11:04', '2018-11-23 12:47:46', '伯纳天纯', 0);
INSERT INTO `petgoods` VALUES (139, 3, '073464419', 2, '国产伯纳天纯simple系列全犬期狗粮15kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117121644229172.jpg', 0, 0.00, '2018-11-17 12:18:42', '2018-11-23 12:47:01', '伯纳天纯', 0);
INSERT INTO `petgoods` VALUES (140, 3, '142990472', 2, '进口皇家狗粮小型犬幼犬粮2kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117122949224262.jpg', 0, 0.00, '2018-11-17 12:31:59', '2018-11-17 12:31:59', '皇家', 0);
INSERT INTO `petgoods` VALUES (141, 3, '584303773', 2, '进口皇家狗粮小型犬成犬粮', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117123508316485.jpg', 0, 0.00, '2018-11-17 12:36:52', '2018-11-23 12:46:40', '皇家', 0);
INSERT INTO `petgoods` VALUES (142, 3, '315700460', 2, '皇家A3狗粮11kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117124045095518.jpg', 0, 0.00, '2018-11-17 12:43:10', '2018-11-23 12:46:25', '皇家', 0);
INSERT INTO `petgoods` VALUES (143, 3, '341966292', 2, '进口|皇家室内成猫粮2kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117143031527115.jpg', 0, 0.00, '2018-11-17 14:32:34', '2018-11-23 12:46:03', '皇家', 0);
INSERT INTO `petgoods` VALUES (144, 3, '475635952', 2, '皇家幼猫粮2kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117143825620191.jpg', 0, 0.00, '2018-11-17 14:46:04', '2018-11-23 12:45:39', '皇家', 0);
INSERT INTO `petgoods` VALUES (145, 3, '507701453', 2, '国产|比瑞吉生鲜系列狗粮2kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117145622729846.jpg', 0, 0.00, '2018-11-17 14:58:37', '2018-11-17 14:58:37', '比瑞吉', 0);
INSERT INTO `petgoods` VALUES (146, 3, '269239388', 2, '国产比瑞吉益生菌系列狗粮小型犬全期1.5kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117150436257101.jpg', 0, 0.00, '2018-11-17 15:07:22', '2018-11-17 15:07:22', '比瑞吉', 0);
INSERT INTO `petgoods` VALUES (147, 3, '677716857', 2, '国产|比瑞吉|靓毛狗粮1.5kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117151140723135.jpg', 0, 0.00, '2018-11-17 15:15:02', '2018-11-17 15:15:02', '比瑞吉', 0);
INSERT INTO `petgoods` VALUES (148, 3, '933638381', 2, '国产|比瑞吉|俱乐部狗粮1.6kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117152008563967.jpg', 0, 0.00, '2018-11-17 15:21:51', '2018-11-23 12:45:17', '比瑞吉', 0);
INSERT INTO `petgoods` VALUES (149, 3, '156863854', 2, '国产|比瑞吉|三文鱼海藻全价猫粮2kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117152745451105.jpg', 0, 0.00, '2018-11-17 15:29:59', '2018-11-23 12:44:58', '比瑞吉', 0);
INSERT INTO `petgoods` VALUES (150, 3, '553123468', 2, '国产|比瑞吉|益生菌系列猫粮1.5kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117154343226163.jpg', 0, 0.00, '2018-11-17 15:45:53', '2018-11-23 12:44:45', '比瑞吉', 0);
INSERT INTO `petgoods` VALUES (151, 3, '555172205', 2, 'DORORHY德洛氏|全价狗粮5磅', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117155645924160.jpg', 0, 0.00, '2018-11-17 15:58:52', '2018-11-23 12:44:18', '德洛氏DORORHY', 0);
INSERT INTO `petgoods` VALUES (152, 3, '602785196', 2, 'DORORHY德洛氏|三文鱼猫粮5磅', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117160102219671.jpg', 0, 0.00, '2018-11-17 16:03:23', '2018-11-23 12:44:02', 'DORORHY', 0);
INSERT INTO `petgoods` VALUES (153, 3, '403618844', 2, '国产|开饭乐|挑嘴小型犬狗粮1.6kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117165411902915.jpg', 0, 0.00, '2018-11-17 16:58:55', '2018-11-23 12:43:47', '开饭乐', 0);
INSERT INTO `petgoods` VALUES (154, 3, '601563518', 2, '全价全期诺瑞牛油果猫粮1.4kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117171059396347.jpg', 0, 0.00, '2018-11-17 17:12:24', '2018-11-23 12:43:23', '诺瑞', 0);
INSERT INTO `petgoods` VALUES (155, 3, '389594823', 2, '国产皓宠牛肉冻干零食（瓶装）', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117173836367187.jpg', 0, 0.00, '2018-11-17 17:44:13', '2018-11-23 12:43:10', '皓宠', 0);
INSERT INTO `petgoods` VALUES (156, 3, '189208030', 2, '国产皓宠冻干零食150g（袋装）', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117175349129133.jpg', 0, 0.00, '2018-11-17 17:57:07', '2018-11-23 12:42:44', '皓宠', 0);
INSERT INTO `petgoods` VALUES (157, 3, '649723533', 2, '国产皓宠纯肉零食250g（袋装）', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117180207542139.jpg', 0, 0.00, '2018-11-17 18:03:36', '2018-11-23 12:41:41', '皓宠', 0);
INSERT INTO `petgoods` VALUES (158, 3, '128940999', 2, '国产|顽皮|妙鲜包零食80g', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117181715944187.jpg', 0, 0.00, '2018-11-17 18:21:40', '2018-11-23 12:41:23', '顽皮', 0);
INSERT INTO `petgoods` VALUES (159, 3, '168535269', 2, '国产|顽皮|酥骨鸡腿零食1只', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117182702592102.jpg', 0, 0.00, '2018-11-17 18:28:54', '2018-11-23 12:40:53', '顽皮', 0);
INSERT INTO `petgoods` VALUES (160, 3, '630342991', 2, '进口|vitakraft卫塔卡夫|猫零食50g', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117183516076152.jpg', 0, 0.00, '2018-11-17 18:37:23', '2018-11-23 12:40:32', 'vitakraft卫塔卡夫', 0);
INSERT INTO `petgoods` VALUES (161, 3, '085251739', 2, '进口|vitakraft卫塔卡夫|金枪鱼猫罐头70g', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117184500608107.jpg', 0, 0.00, '2018-11-17 18:49:14', '2018-11-23 12:40:17', 'vitakraft卫塔卡夫', 0);
INSERT INTO `petgoods` VALUES (162, 3, '919335919', 2, '国产|汪行天下|磨牙棒骨零食', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117193637436169.jpg', 0, 0.00, '2018-11-17 19:34:55', '2018-11-17 19:36:42', '汪行天下', 0);
INSERT INTO `petgoods` VALUES (163, 3, '157466186', 2, '国产|晋宠|纯肉狗零食', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117194744264181.jpg', 0, 0.00, '2018-11-17 19:50:21', '2018-11-23 12:39:42', '晋宠', 0);
INSERT INTO `petgoods` VALUES (164, 3, '941932222', 2, '国产|好贝|纯肉狗零食500g', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117195304092507.jpg', 0, 0.00, '2018-11-17 19:54:29', '2018-11-23 12:39:09', '好贝', 0);
INSERT INTO `petgoods` VALUES (165, 3, '063949299', 2, '国产|钢骨|磨牙棒好多口味', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117195837436775.jpg', 0, 0.00, '2018-11-17 20:06:09', '2018-11-23 12:38:54', '钢骨', 0);
INSERT INTO `petgoods` VALUES (166, 3, '265871996', 2, '国产|昵趣|磨牙洁齿零食20g', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117201140795198.jpg', 0, 0.00, '2018-11-17 20:14:40', '2018-11-23 12:38:10', '昵趣', 0);
INSERT INTO `petgoods` VALUES (167, 3, '029507878', 2, '国产|开饭乐|火腿肠零食200g', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117202134608158.jpg', 0, 0.00, '2018-11-17 20:23:46', '2018-11-23 12:37:46', '开饭乐', 0);
INSERT INTO `petgoods` VALUES (168, 3, '618715850', 2, '国产|开饭乐|狗狗零食雪花壮丁120g', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117202945560144.jpg', 0, 0.00, '2018-11-17 20:31:45', '2018-11-23 12:37:27', '开饭乐', 0);
INSERT INTO `petgoods` VALUES (169, 3, '702295400', 2, '进口|菲速达|犬猫用营养膏120g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117203832103949.jpg', 0, 0.00, '2018-11-17 20:42:25', '2018-11-21 00:49:43', '菲速达', 0);
INSERT INTO `petgoods` VALUES (170, 3, '353405254', 2, '国产|御猫|调理营养膏中药配方120g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117205723033204.jpg', 0, 0.00, '2018-11-17 20:59:11', '2018-11-23 09:52:42', '御猫', 0);
INSERT INTO `petgoods` VALUES (171, 3, '092253158', 2, '国产|发育宝|狗用基础营养膏125g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181117234547024214.jpg', 0, 0.00, '2018-11-17 23:48:46', '2018-11-23 09:52:25', '信元发育宝', 0);
INSERT INTO `petgoods` VALUES (172, 3, '246685345', 2, '国产|发育宝|保健品羊乳钙片160粒', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118000145117193.jpg', 0, 0.00, '2018-11-18 00:04:05', '2018-11-21 00:48:53', '发育宝', 0);
INSERT INTO `petgoods` VALUES (173, 3, '201207934', 2, '发育宝|保健品微量元素片160粒', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118000427866161.jpg', 0, 0.00, '2018-11-18 00:05:53', '2018-11-23 09:52:09', '发育宝', 0);
INSERT INTO `petgoods` VALUES (174, 3, '081198262', 2, '发育宝|保健品整肠配方350g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118000933130945.jpg', 0, 0.00, '2018-11-18 00:11:45', '2018-11-23 09:51:47', '发育宝', 0);
INSERT INTO `petgoods` VALUES (175, 3, '373700953', 2, '发育宝|保健品钙胃能补钙配方450g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118001631377153.jpg', 0, 0.00, '2018-11-18 00:18:07', '2018-11-23 09:51:29', '发育宝', 0);
INSERT INTO `petgoods` VALUES (176, 3, '182755864', 2, '国产|发育宝|猫用微量元素片160粒', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118002100157199.jpg', 0, 0.00, '2018-11-18 00:23:37', '2018-11-23 09:50:43', '发育宝', 0);
INSERT INTO `petgoods` VALUES (177, 3, '993669599', 2, '国产|红狗|综合营养膏120g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118003310214161.jpg', 0, 0.00, '2018-11-18 00:43:19', '2018-11-23 09:50:14', '红狗', 0);
INSERT INTO `petgoods` VALUES (178, 3, '033387296', 2, '国产|先牧仕|山羊奶粉340g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118005206973156.jpg', 0, 0.00, '2018-11-18 00:54:40', '2018-11-23 09:49:47', '先牧仕', 0);
INSERT INTO `petgoods` VALUES (179, 3, '865355136', 2, '进口|天使之眼|除泪痕颗粒150g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118010253156118.jpg', 0, 0.00, '2018-11-18 01:04:58', '2018-11-23 09:49:34', '天使之眼', 0);
INSERT INTO `petgoods` VALUES (180, 3, '034708343', 2, '国产|美宠氏|猫砂除臭粉200g', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118011318683410.jpg', 0, 0.00, '2018-11-18 01:15:41', '2018-11-23 09:49:17', '美宠氏', 0);
INSERT INTO `petgoods` VALUES (181, 3, '948591170', 2, '国产|雅各仕|洁足泡沫300ml', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118011945447119.jpg', 0, 0.00, '2018-11-18 01:21:38', '2018-11-23 09:49:01', '雅各仕', 0);
INSERT INTO `petgoods` VALUES (182, 3, '272226626', 2, '台湾旺芙|犬猫用香波500ml', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118012722584102.jpg', 0, 0.00, '2018-11-18 01:29:46', '2018-11-23 09:48:28', '旺芙', 0);
INSERT INTO `petgoods` VALUES (183, 3, '892635077', 2, '国产|雪貂留香|犬猫用香波500ml', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118013244457840.jpg', 0, 0.00, '2018-11-18 01:37:01', '2018-11-23 09:48:00', '雪貂留香', 0);
INSERT INTO `petgoods` VALUES (184, 3, '369162856', 2, '国产|威宠卫|环境杀虫剂400ml', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118014113438214.jpg', 0, 0.00, '2018-11-18 01:42:19', '2018-11-23 09:47:32', '威宠卫', 0);
INSERT INTO `petgoods` VALUES (185, 3, '154104899', 2, '国产|艾力舒|外寄生虫滴剂', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118014754170120.jpg', 0, 0.00, '2018-11-18 01:50:17', '2018-11-23 09:47:13', '艾力舒', 0);
INSERT INTO `petgoods` VALUES (186, 3, '838658192', 2, '进口|德国拜尔爱沃克|体外驱虫犬用/猫用滴剂', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118015435714327.jpg', 0, 0.00, '2018-11-18 01:58:06', '2018-11-23 09:46:34', '爱沃克', 0);
INSERT INTO `petgoods` VALUES (187, 3, '373770925', 2, '国产|至虫清|狗用体内驱虫（5公斤）', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118020902178596.jpg', 0, 0.00, '2018-11-18 02:11:12', '2018-11-23 09:45:41', '至虫清', 0);
INSERT INTO `petgoods` VALUES (188, 3, '071519958', 2, '美艾斯|出行牵引绳可伸缩（5米）', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118021620816185.jpg', 0, 0.00, '2018-11-18 02:18:00', '2018-11-23 09:45:31', '美艾斯', 0);
INSERT INTO `petgoods` VALUES (189, 3, '194021441', 2, '国产|猫宠|天然植物弹性豆腐猫砂8L', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181118023708339198.jpg', 0, 0.00, '2018-11-18 02:39:05', '2018-11-23 09:45:20', '猫宠', 0);
INSERT INTO `petgoods` VALUES (190, 2, '151130839', 2, '猫咪/狗狗寄养', 900, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181119154228750150.jpg', 0, 0.00, '2018-11-19 15:45:55', '2018-11-19 15:45:55', '忠犬公馆', 0);
INSERT INTO `petgoods` VALUES (191, 2, '425820028', 2, '进口|StellaChewy| 22磅狗粮', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181119155426071211.jpg', 0, 0.00, '2018-11-19 15:56:05', '2018-12-02 16:53:54', 'StellaChewy', 0);
INSERT INTO `petgoods` VALUES (192, 2, '472038738', 2, '海洋之星猫粮1.5kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120110747817166.jpg', 0, 0.00, '2018-11-20 11:12:42', '2018-11-20 11:13:13', '海洋之星', 0);
INSERT INTO `petgoods` VALUES (193, 2, '874549544', 2, '雅各仕(Jacobs) |宠物洁足泡沫洗脚液', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120115925929179.jpg', 0, 0.00, '2018-11-20 12:00:14', '2018-11-21 00:16:04', '雅各仕', 0);
INSERT INTO `petgoods` VALUES (194, 2, '679318120', 2, '贵为|猫咪玩具|电动老鼠猫咪', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120120401880163.jpg', 0, 0.00, '2018-11-20 12:05:08', '2018-11-21 00:26:46', '贵为', 0);
INSERT INTO `petgoods` VALUES (195, 2, '148824582', 2, '小佩PETKIT|宠物猫智能自动饮水机2代可加热', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120115419993552.jpg', 0, 0.00, '2018-11-20 12:09:37', '2018-11-21 00:15:50', '小佩', 0);
INSERT INTO `petgoods` VALUES (196, 2, '636657850', 2, '猫砂盆', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121120900829453.jpg', 0, 0.00, '2018-11-20 12:43:11', '2018-11-21 12:09:14', '猫砂盆', 0);
INSERT INTO `petgoods` VALUES (197, 2, '791488418', 2, '小佩PETKIT|出行宠物饮水杯随行杯', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120121919609207.jpg', 0, 0.00, '2018-11-20 12:46:30', '2018-11-21 00:15:16', '小佩', 0);
INSERT INTO `petgoods` VALUES (198, 2, '868611204', 2, 'pidan皮蛋猫抓板', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120130017986946.jpg', 0, 0.00, '2018-11-20 13:02:31', '2018-11-21 00:26:06', 'pidan', 0);
INSERT INTO `petgoods` VALUES (199, 2, '155370960', 2, 'pidan蛋挞猫窝四季通用室内可拆洗', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120130744152955.jpg', 0, 0.00, '2018-11-20 13:09:54', '2018-11-21 00:25:50', 'pidan', 0);
INSERT INTO `petgoods` VALUES (200, 2, '305793648', 2, '猫老板|半球宠物窝 360度旋转猫窝', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120131316632128.jpg', 0, 0.00, '2018-11-20 13:16:31', '2018-11-21 00:25:41', '猫老板', 0);
INSERT INTO `petgoods` VALUES (201, 2, '096818654', 2, '阿莫西林克拉维酸钾片速诺', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120134447889167.jpg', 0, 0.00, '2018-11-20 13:45:42', '2018-11-21 00:14:56', '阿莫西林', 0);
INSERT INTO `petgoods` VALUES (202, 2, '206739614', 2, '海洋之星狗罐头100g', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120154727549534.jpg', 0, 0.00, '2018-11-20 15:51:05', '2018-11-20 15:51:05', '海洋之星', 0);
INSERT INTO `petgoods` VALUES (203, 2, '910476186', 2, '发育宝|狗狗钙胃能补充钙磷健骨补钙450g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120155850908766.jpg', 0, 0.00, '2018-11-20 16:00:59', '2018-11-21 00:40:09', '发育宝', 0);
INSERT INTO `petgoods` VALUES (204, 2, '828221909', 2, '发育宝|猫用钙胃能猫整肠粉猫咪用200g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120161359159752.jpg', 0, 0.00, '2018-11-20 16:15:30', '2018-11-21 00:38:30', '发育宝', 0);
INSERT INTO `petgoods` VALUES (205, 2, '023863588', 2, '卫仕狗用健骨补钙|乳钙400片', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120162233944135.jpg', 0, 0.00, '2018-11-20 16:28:18', '2018-11-21 00:39:12', '卫仕', 0);
INSERT INTO `petgoods` VALUES (206, 2, '262260189', 2, '进口|卫仕|微量元素片400片', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120163201057841.jpg', 0, 0.00, '2018-11-20 16:32:51', '2018-11-21 00:39:21', '卫仕', 0);
INSERT INTO `petgoods` VALUES (207, 2, '273032122', 2, '倍美特BeMate|猫咪化毛膏猫用营养膏去除毛球120g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120163716528390.jpg', 0, 0.00, '2018-11-20 16:39:48', '2018-11-21 00:38:01', 'bemate', 0);
INSERT INTO `petgoods` VALUES (208, 2, '723922421', 2, '倍美特( BeMate) |猫咪营养膏恢复体能怀孕哺乳期120g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120165604785161.jpg', 0, 0.00, '2018-11-20 16:59:10', '2018-11-21 00:12:53', 'BeMate', 0);
INSERT INTO `petgoods` VALUES (209, 2, '738272117', 2, 'RedDingo瑞鼎狗|净色马具型工字型胸背', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120172200962704.jpg', 0, 0.00, '2018-11-20 17:29:41', '2018-11-21 00:09:42', '瑞鼎狗', 0);
INSERT INTO `petgoods` VALUES (210, 2, '373473258', 2, '瑞鼎狗RedDingo猫用胸背套装', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120173202584111.jpg', 0, 0.00, '2018-11-20 17:33:23', '2018-11-21 00:09:34', '瑞鼎狗', 0);
INSERT INTO `petgoods` VALUES (211, 2, '187560362', 2, 'RedDingo瑞鼎狗|狗项圈猫项圈脖带', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120174535719127.jpg', 0, 0.00, '2018-11-20 18:01:27', '2018-11-21 00:09:26', '瑞鼎狗', 0);
INSERT INTO `petgoods` VALUES (212, 2, '974838493', 2, '瑞鼎狗RedDingo|猫项圈猫咪项圈脖圈', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120180437540435.jpg', 0, 0.00, '2018-11-20 18:06:38', '2018-11-21 00:09:03', '瑞鼎狗', 0);
INSERT INTO `petgoods` VALUES (213, 2, '174815701', 2, '网红猫糖', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120192301593112.jpg', 0, 0.00, '2018-11-20 19:23:50', '2018-11-20 19:37:41', '忠犬', 0);
INSERT INTO `petgoods` VALUES (214, 2, '259844233', 2, '补差价10元', 999, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120192607890121.jpg', 0, 0.00, '2018-11-20 19:26:43', '2019-05-09 20:47:31', '忠犬公馆', 0);
INSERT INTO `petgoods` VALUES (215, 2, '578662811', 2, '小佩PETKIT|宠物智能喂食器mini自动投食', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120194519805196.jpg', 0, 0.00, '2018-11-20 19:52:25', '2018-11-21 00:08:42', '小佩', 0);
INSERT INTO `petgoods` VALUES (216, 2, '890068098', 2, '德国拜耳|拜宠清狗狗体内驱虫药', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120195603191209.jpg', 0, 0.00, '2018-11-20 19:57:57', '2018-11-21 00:06:39', '拜耳', 0);
INSERT INTO `petgoods` VALUES (217, 2, '282620079', 2, '休普|止食盆防噎护胃慢食盆狗碗狗盆防打翻', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120200638671142.jpg', 0, 0.00, '2018-11-20 20:12:30', '2018-11-21 00:06:25', '休普', 0);
INSERT INTO `petgoods` VALUES (218, 2, '273400997', 2, '猫太郎|鸡肉咘噜咘噜包湿粮85g', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120202322790114.jpg', 0, 0.00, '2018-11-20 20:30:40', '2018-11-21 00:02:23', '猫太郎', 0);
INSERT INTO `petgoods` VALUES (219, 2, '838377413', 2, '爱普士Applaws|猫用鸡肉包湿粮 70g', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120203348595382.jpg', 0, 0.00, '2018-11-20 20:37:04', '2018-11-21 00:01:58', '爱普士', 0);
INSERT INTO `petgoods` VALUES (220, 2, '655621438', 2, 'tikicat|猫罐头湿粮80g', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181120203947169178.jpg', 0, 0.00, '2018-11-20 20:42:22', '2018-11-21 00:01:03', 'tikicat', 0);
INSERT INTO `petgoods` VALUES (221, 2, '836417938', 2, '多美洁|狗猫天然清新口气洁齿水473ml', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121105328856287.jpg', 0, 0.00, '2018-11-21 10:55:47', '2018-11-21 13:17:50', '多美洁', 0);
INSERT INTO `petgoods` VALUES (222, 2, '563260742', 2, '耳特丽|耳道清洁剂85ml', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121110014429987.jpg', 0, 0.00, '2018-11-21 11:02:30', '2018-11-21 13:19:18', '耳特丽', 0);
INSERT INTO `petgoods` VALUES (223, 2, '192152123', 2, '多美洁|天然清新口气洁齿凝露', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121110809985155.jpg', 0, 0.00, '2018-11-21 11:11:42', '2018-11-21 13:23:17', '多美洁', 0);
INSERT INTO `petgoods` VALUES (224, 2, '113856141', 2, '多美洁|清新口气洁齿凝露3D亮白配方118ml', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121111901008144.jpg', 0, 0.00, '2018-11-21 11:24:29', '2018-11-21 13:23:38', '多美洁', 0);
INSERT INTO `petgoods` VALUES (225, 2, '031633549', 2, '多美洁|狗用口气清新洁齿精华65ml', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121113009078625.jpg', 0, 0.00, '2018-11-21 11:32:12', '2018-11-21 13:48:27', '多美洁', 0);
INSERT INTO `petgoods` VALUES (226, 2, '349313229', 2, '多美洁|猫用口气清新洁齿精华65ml', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121113503324644.jpg', 0, 0.00, '2018-11-21 11:36:53', '2018-11-21 13:48:15', '多美洁', 0);
INSERT INTO `petgoods` VALUES (227, 2, '328851055', 2, '多美洁|牙膏牙刷凝露护齿套装', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121114015976206.jpg', 0, 0.00, '2018-11-21 11:41:58', '2018-11-21 13:25:41', '多美洁', 0);
INSERT INTO `petgoods` VALUES (228, 2, '685927054', 2, '麦恩达普mindsup| 软毛犬用牙刷 ', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121114609534726.jpg', 0, 0.00, '2018-11-21 11:48:02', '2018-11-21 13:26:40', '麦恩达普', 0);
INSERT INTO `petgoods` VALUES (229, 2, '234345624', 2, '休普|圆碗猫碗狗碗喂食饮水两用', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121115810088190.jpg', 0, 0.00, '2018-11-21 12:03:08', '2018-11-21 13:35:44', '休普', 0);
INSERT INTO `petgoods` VALUES (230, 2, '563405199', 2, '口袋厨房|狗狗的冻干辅粮45g', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121121056234147.jpg', 0, 0.00, '2018-11-21 12:13:43', '2018-11-21 13:36:09', '口袋厨房', 0);
INSERT INTO `petgoods` VALUES (231, 2, '476255682', 2, 'KUDI酷迪|三件套宠物牙刷 ', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121122039461106.jpg', 0, 0.00, '2018-11-21 12:22:07', '2018-11-21 13:36:34', '酷迪', 0);
INSERT INTO `petgoods` VALUES (232, 2, '805497010', 2, '胶囊垃圾袋外出遛狗捡屎袋', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121122500786173.jpg', 0, 0.00, '2018-11-21 12:26:48', '2018-11-21 13:37:18', '忠犬', 0);
INSERT INTO `petgoods` VALUES (233, 2, '359503229', 2, '狗狗嘴套防咬口罩', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121123101656176.jpg', 0, 0.00, '2018-11-21 12:36:55', '2018-11-21 13:38:02', '忠犬公馆', 0);
INSERT INTO `petgoods` VALUES (234, 2, '212439938', 2, '猫咪玩具小铃铛', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121125806184130.jpg', 0, 0.00, '2018-11-21 12:59:27', '2018-11-21 13:38:21', '忠犬公馆', 0);
INSERT INTO `petgoods` VALUES (235, 2, '821762782', 2, '宠物用小鞋子小袜子（4只）', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121130531399173.jpg', 0, 0.00, '2018-11-21 13:08:03', '2018-11-21 13:08:03', '忠犬公馆', 0);
INSERT INTO `petgoods` VALUES (236, 2, '073311297', 2, 'lexi福莱希|FUN系列狗狗自动伸缩牵引绳', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121133119563134.jpg', 0, 0.00, '2018-11-21 13:33:37', '2018-11-21 13:33:37', '福莱希', 0);
INSERT INTO `petgoods` VALUES (237, 2, '226283857', 2, '世嘉|猫砂结团除臭', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181121140431489309.jpg', 0, 0.00, '2018-11-21 14:09:58', '2018-11-21 14:09:58', '世嘉', 0);
INSERT INTO `petgoods` VALUES (238, 2, '454545398', 2, '海洋之星|通用型无谷天然粮成犬1.5kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181122110323361136.jpg', 0, 0.00, '2018-11-22 11:19:07', '2018-11-22 11:23:07', '海洋之星', 0);
INSERT INTO `petgoods` VALUES (239, 3, '494606448', 2, '狗狗洗澡', 900, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181123115603658419.jpg', 0, 0.00, '2018-11-23 12:01:07', '2018-11-24 11:00:51', 'bingo', 0);
INSERT INTO `petgoods` VALUES (240, 3, '362122359', 2, '猫洗澡', 900, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181123120124067197.jpg', 0, 0.00, '2018-11-23 12:02:52', '2018-11-23 12:02:52', 'bingo', 0);
INSERT INTO `petgoods` VALUES (241, 3, '629479788', 2, '修造型/剃毛', 900, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181123120418630172.jpg', 0, 0.00, '2018-11-23 12:09:32', '2018-11-23 12:09:32', 'bingo', 0);
INSERT INTO `petgoods` VALUES (242, 3, '894816139', 2, '宠物寄养', 900, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181123121201821188.jpg', 0, 0.00, '2018-11-23 12:14:11', '2018-11-23 12:14:11', 'bingo', 0);
INSERT INTO `petgoods` VALUES (243, 3, '038613693', 2, '单项美容', 900, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181123121640401440.jpg', 0, 0.00, '2018-11-23 12:20:55', '2018-11-23 12:20:55', 'bingo', 0);
INSERT INTO `petgoods` VALUES (244, 3, '331792573', 2, '补差价', 900, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181123122243700152.jpg', 0, 0.00, '2018-11-23 12:23:24', '2018-11-23 12:23:24', 'bingo', 0);
INSERT INTO `petgoods` VALUES (245, 3, '788127479', 2, '伊丽莎白圈舔不着头', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181124120911954195.jpg', 0, 0.00, '2018-11-24 12:14:22', '2018-11-24 12:14:22', '伊丽莎白', 0);
INSERT INTO `petgoods` VALUES (246, 2, '018110280', 2, '希尔斯ad处方狗罐', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181128125829169436.jpg', 0, 0.00, '2018-11-28 13:07:20', '2018-11-28 13:07:20', '希尔斯', 0);
INSERT INTO `petgoods` VALUES (247, 2, '766341201', 2, 'mind up 原装进口牛奶味液体牙膏', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181128131228523478.jpg', 0, 0.00, '2018-11-28 13:14:27', '2018-11-28 13:14:27', 'mind up', 0);
INSERT INTO `petgoods` VALUES (248, 2, '673212857', 2, 'mind up宠物用软毛牙刷大型', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181128132134582179.jpg', 0, 0.00, '2018-11-28 13:23:40', '2018-11-28 13:23:40', 'mind up', 0);
INSERT INTO `petgoods` VALUES (249, 2, '225365984', 2, 'mind up幼犬口腔护理套装', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181128133744889133.jpg', 0, 0.00, '2018-11-28 13:39:51', '2018-11-28 13:39:51', 'mind up', 0);
INSERT INTO `petgoods` VALUES (250, 2, '604413474', 2, 'mind up幼猫口腔护理套装', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181128134159965112.jpg', 0, 0.00, '2018-11-28 13:44:29', '2018-11-28 13:44:29', 'mind up', 0);
INSERT INTO `petgoods` VALUES (251, 2, '356359729', 2, '网红窝具深度睡眠窝', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181128134635166159.jpg', 0, 0.00, '2018-11-28 13:48:13', '2018-11-28 13:48:13', '网红窝', 0);
INSERT INTO `petgoods` VALUES (252, 2, '078241129', 2, '网红窝具小泰迪猫咪', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181128135614288246.jpg', 0, 0.00, '2018-11-28 13:58:11', '2018-11-28 13:58:11', '网红窝', 0);
INSERT INTO `petgoods` VALUES (254, 2, '385519427', 2, '欢动鳄鱼肉', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222131455220205.jpg', 0, 0.00, '2018-12-22 13:20:26', '2018-12-22 13:20:26', '欢动', 0);
INSERT INTO `petgoods` VALUES (255, 2, '671625578', 2, '谷登羊奶粉犬用', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222132603093171.jpg', 0, 0.00, '2018-12-22 13:27:06', '2018-12-22 13:27:51', '谷登', 0);
INSERT INTO `petgoods` VALUES (256, 2, '362804124', 2, 'petio鲜厨房零食', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222133140926203.jpg', 0, 0.00, '2018-12-22 13:32:59', '2018-12-22 13:32:59', '派地奥', 0);
INSERT INTO `petgoods` VALUES (257, 2, '693689271', 2, '派地奥鸭肉绕小鱼', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222134734953903.jpg', 0, 0.00, '2018-12-22 13:49:09', '2018-12-22 13:49:09', '派地奥', 0);
INSERT INTO `petgoods` VALUES (258, 2, '673239319', 2, '日本去毛贝壳梳', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222135400005253.jpg', 0, 0.00, '2018-12-22 13:55:05', '2018-12-22 13:55:05', 'goldpets', 0);
INSERT INTO `petgoods` VALUES (259, 2, '946411837', 2, '金派滋排梳', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222140014526142.jpg', 0, 0.00, '2018-12-22 14:04:38', '2018-12-22 14:04:38', 'goldpets', 0);
INSERT INTO `petgoods` VALUES (260, 2, '327174411', 2, '乐比指甲刀', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222140851126188.jpg', 0, 0.00, '2018-12-22 14:09:33', '2018-12-22 14:09:33', '乐比', 0);
INSERT INTO `petgoods` VALUES (261, 2, '792399847', 2, '派地奥美味牛肉条', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222141324801143.jpg', 0, 0.00, '2018-12-22 14:14:27', '2018-12-22 14:14:27', '派地奥', 0);
INSERT INTO `petgoods` VALUES (262, 2, '948141949', 2, '派地奥鸡小胸蹄筋卷', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222141606272449.jpg', 0, 0.00, '2018-12-22 14:17:15', '2018-12-22 14:17:15', '派地奥', 0);
INSERT INTO `petgoods` VALUES (263, 2, '000035028', 2, '鸡小胸软咬胶', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222141848462574.jpg', 0, 0.00, '2018-12-22 14:19:50', '2018-12-22 14:19:50', '派地奥', 0);
INSERT INTO `petgoods` VALUES (264, 2, '485104698', 2, '帕诺卡尔蛋黄冻干', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222144602613201.jpg', 0, 0.00, '2018-12-22 14:57:03', '2018-12-22 14:57:03', '帕诺卡尔', 0);
INSERT INTO `petgoods` VALUES (265, 2, '593939048', 2, '喵洁客膨润土猫砂', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181222145900483380.jpg', 0, 0.00, '2018-12-22 15:00:25', '2018-12-22 15:00:25', '喵洁客', 0);
INSERT INTO `petgoods` VALUES (266, 2, '208808592', 2, '查尔斯幼猫粮（两包送猫包一个）', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181223205304526180.jpg', 0, 0.00, '2018-12-22 15:05:24', '2018-12-23 20:53:21', '查尔斯', 0);
INSERT INTO `petgoods` VALUES (267, 2, '889804072', 2, '查尔斯成猫粮（两包送一个猫包）', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190304230653922444.jpg', 0, 0.00, '2018-12-22 15:10:05', '2019-03-04 23:06:55', '查尔斯', 0);
INSERT INTO `petgoods` VALUES (268, 2, '558598719', 2, '查尔斯猫奶糕（两包送一个猫包）', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181223204721450145.jpg', 0, 0.00, '2018-12-22 15:12:18', '2018-12-23 20:49:29', '查尔斯', 0);
INSERT INTO `petgoods` VALUES (269, 2, '639861847', 2, '宠物圣诞饼干，给宠物的圣诞礼物', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20181225122425814873.jpg', 0, 0.00, '2018-12-25 12:26:15', '2018-12-25 12:26:15', '忠犬公馆', 0);
INSERT INTO `petgoods` VALUES (270, 1, '549456288', 2, '抽拉式南瓜窝猫窝狗窝适合7-10斤的毛孩子', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190101114557094207.jpg', 0, 0.00, '2019-01-01 11:47:25', '2019-01-01 11:49:10', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (271, 1, '682994576', 2, '宠物外出便携透气斜跨手提宠物包', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190101120900056866.jpg', 0, 0.00, '2019-01-01 12:09:49', '2019-01-01 12:09:49', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (272, 1, '540626573', 2, '洁齿磨牙猫薄荷球棒棒糖', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190101121711981853.jpg', 0, 0.00, '2019-01-01 12:18:53', '2019-01-01 12:18:53', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (273, 1, '166342927', 2, '猫咪/狗狗衣服兔子装两只耳朵超可爱', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190101122350765104.jpg', 0, 0.00, '2019-01-01 12:26:20', '2019-01-01 12:26:20', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (274, 1, '338495342', 2, '泰国宠物猫罐头猫咪湿粮80g/罐', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190101123443720144.jpg', 0, 0.00, '2019-01-01 12:36:51', '2019-01-01 12:36:51', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (275, 1, '785405302', 2, '天然木质逗猫棒木棍麻布艺小鸡玩具', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190101124252389200.jpg', 0, 0.00, '2019-01-01 12:44:32', '2019-01-01 12:44:32', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (276, 1, '947215873', 2, '不锈钢宠物双碗防溢撒易清洁', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190101125251526921.jpg', 0, 0.00, '2019-01-01 12:53:08', '2019-01-01 12:53:08', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (277, 1, '610326736', 2, '猫饼干猫薄荷猫零食100克装', 500, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190101133235714375.jpg', 0, 0.00, '2019-01-01 13:35:05', '2019-01-01 14:23:41', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (278, 1, '947854756', 2, '热销激光笔LED电子激光逗猫玩具镭射猫玩具', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190101134010279111.jpg', 0, 0.00, '2019-01-01 13:42:45', '2019-01-01 13:42:45', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (279, 1, '231123956', 2, '简装狗尿片除臭尿垫宠物通用尿不湿S号100片猫狗通用优质', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190101140205491155.jpg', 0, 0.00, '2019-01-01 14:03:39', '2019-01-01 14:25:06', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (280, 1, '138752015', 2, '好主人猫粮包邮去毛球通用型天然宠物猫食2.5kg/10kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190102165856346527.jpg', 0, 0.00, '2019-01-02 17:01:10', '2019-01-02 17:03:32', '好主人', 0);
INSERT INTO `petgoods` VALUES (281, 1, '537517160', 2, '好主人 金毛拉布拉多成犬专用狗粮 强骨骼10kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190102171048163472.jpg', 0, 0.00, '2019-01-02 17:12:38', '2019-01-02 17:12:38', '好主人', 0);
INSERT INTO `petgoods` VALUES (285, 4, '957814721', 2, '进口猫粮非常适口，进口猫粮非常适口进口猫粮非常适口进口猫粮非常适口进口猫粮非常适口', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190116002622733808.jpg', 0, 0.00, '2019-01-04 23:48:15', '2019-05-14 17:26:12', '毛孩子', 0);
INSERT INTO `petgoods` VALUES (286, 1, '273001731', 2, '好主人狗粮全犬种通用5斤', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190112115707353258.jpg', 0, 0.00, '2019-01-12 11:59:48', '2019-01-12 11:59:48', '好主人', 0);
INSERT INTO `petgoods` VALUES (287, 1, '863708372', 2, '疯狂的小狗 狗粮幼犬成犬天然粮美毛祛泪痕10kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190112120931963433.jpg', 0, 0.00, '2019-01-12 12:34:31', '2019-01-12 12:34:31', '疯狂的小狗', 0);
INSERT INTO `petgoods` VALUES (288, 1, '082578635', 2, '大型犬成犬粮10kg/20kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190112124417412330.jpg', 0, 0.00, '2019-01-12 12:50:41', '2019-01-12 12:50:41', '力狼（LILANG）', 0);
INSERT INTO `petgoods` VALUES (289, 1, '429973834', 2, '狗粮全面均衡营养配方幼犬成犬狗粮全犬种通10kg ', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190112131748383853.jpg', 0, 0.00, '2019-01-12 13:21:02', '2019-01-12 13:21:02', '宝路', 0);
INSERT INTO `petgoods` VALUES (290, 1, '310140721', 2, '海洋之星狗粮 三文鱼小型犬通用型狗粮mini颗粒1.5kg', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190112133212628454.jpg', 0, 0.00, '2019-01-12 13:35:49', '2019-01-12 13:35:49', '海洋之星', 0);
INSERT INTO `petgoods` VALUES (291, 1, '969297314', 2, '冠滔（GUANTAO）成猫幼猫全阶段鱼肉味美毛护肤通用型10kg20斤', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190112134626222540.jpg', 0, 0.00, '2019-01-12 13:48:19', '2019-01-12 13:48:19', '冠滔（GUANTAO）', 0);
INSERT INTO `petgoods` VALUES (292, 1, '360235627', 2, '力狼猫粮成猫幼猫通用型猫食e族 2.5kg5斤', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190113154915712141.jpg', 0, 0.00, '2019-01-13 15:51:43', '2019-01-13 15:51:43', '力狼', 0);
INSERT INTO `petgoods` VALUES (293, 1, '736900526', 2, '美滋元成猫猫粮美味三文鱼味2.5kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190113155933880113.jpg', 0, 0.00, '2019-01-13 16:00:44', '2019-01-13 16:00:44', '美滋元', 0);
INSERT INTO `petgoods` VALUES (294, 1, '953107568', 2, '佩玛思特成猫幼猫猫粮奶糕哺乳期怀孕猫粮去毛球10kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190113161027063116.jpg', 0, 0.00, '2019-01-13 16:11:26', '2019-01-13 16:11:26', '佩玛思特', 0);
INSERT INTO `petgoods` VALUES (295, 1, '017880843', 2, '伯纳天纯猫粮宠物成猫猫粮10kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190113161953153187.jpg', 0, 0.00, '2019-01-13 16:21:24', '2019-01-13 16:21:24', '伯纳天纯', 0);
INSERT INTO `petgoods` VALUES (296, 1, '922679819', 2, ' 顺口味天然猫粮 深海鳕鱼味成猫通用型1.5kg', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190113162820244496.jpg', 0, 0.00, '2019-01-13 16:30:14', '2019-01-13 16:30:14', ' 顺口味', 0);
INSERT INTO `petgoods` VALUES (297, 1, '690069164', 2, '怡亲猫砂除臭膨润土猫沙宠物猫砂10kg', 102, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190113163836288120.jpg', 0, 0.00, '2019-01-13 16:42:15', '2019-01-13 16:42:15', '怡亲', 0);
INSERT INTO `petgoods` VALUES (298, 1, '729904970', 2, 'RedDog红狗营养膏宠物犬猫狗狗怀孕狗幼犬猫术后犬猫通用120g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190113165054387154.jpg', 0, 0.00, '2019-01-13 16:53:04', '2019-01-13 16:53:04', 'RedDog红狗', 0);
INSERT INTO `petgoods` VALUES (299, 1, '218727052', 2, '美滋元宠物羊奶粉幼猫狗奶粉补钙益生菌配方猫狗通用配方羊奶粉350g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190113170353220206.jpg', 0, 0.00, '2019-01-13 17:07:19', '2019-01-13 17:07:19', '美滋元', 0);
INSERT INTO `petgoods` VALUES (300, 1, '643378804', 2, '维克加强型狗狗猫咪营养膏发育宝补血补钙补营120.5g', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190113171256442138.jpg', 0, 0.00, '2019-01-13 17:14:34', '2019-01-13 17:14:34', '维克', 0);
INSERT INTO `petgoods` VALUES (301, 1, '686287819', 2, '恩倍多宠物喷剂狗狗真菌皮肤病皮癣除螨虫湿疹止痒猫藓喷剂皮肤病100ml', 101, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190113172255790131.jpg', 0, 0.00, '2019-01-13 17:24:31', '2019-01-13 17:24:31', '恩倍多', 0);
INSERT INTO `petgoods` VALUES (304, 4, '912183523', 2, '促销狗粮2查尔斯狗粮促销价', 402, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190414210749593776.jpg', 0, 0.00, '2019-04-14 21:08:22', '2019-05-24 21:48:22', '狗', 0);
INSERT INTO `petgoods` VALUES (305, 4, '586017228', 2, '促销 猫粮1皇家全价猫粮适应全周期', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190414210929547184.jpg', 0, 0.00, '2019-04-14 21:10:02', '2019-05-14 04:31:56', '猫粮', 0);
INSERT INTO `petgoods` VALUES (306, 4, '352816688', 2, '促销 猫粮2皇家猫奶糕适合幼猫皇家猫奶糕适合幼猫', 401, '', 'https://www.maohz.com/mhzapi/api/Common/ImageFile/goodsimgderek20190414211141517151.jpg', 0, 0.00, '2019-04-14 21:12:21', '2019-05-14 10:20:57', '猫粮', 0);



SET FOREIGN_KEY_CHECKS = 1;
