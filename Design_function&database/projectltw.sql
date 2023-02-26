/*
 Navicat Premium Data Transfer

 Source Server         : ltwproject
 Source Server Type    : MySQL
 Source Server Version : 100427 (10.4.27-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : projectltw

 Target Server Type    : MySQL
 Target Server Version : 100427 (10.4.27-MariaDB)
 File Encoding         : 65001

 Date: 26/02/2023 14:54:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `ID_USER` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ID_PR` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `AMOUNT` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER`, `ID_PR`) USING BTREE,
  INDEX `ID_USERSS`(`ID_USER` ASC) USING BTREE,
  INDEX `ID_PRODUCTS`(`ID_PR` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('user1', 'prod3', 10);
INSERT INTO `cart` VALUES ('user1', 'prod34', 1);
INSERT INTO `cart` VALUES ('user1', 'prod4', 2);
INSERT INTO `cart` VALUES ('user1', 'prod5', 7);
INSERT INTO `cart` VALUES ('user2', 'prod1', 1);
INSERT INTO `cart` VALUES ('user2', 'prod46', 2);

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `ID_USER` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DATETIME` datetime NULL DEFAULT NULL,
  INDEX `ID_USERPR`(`ID_USER` ASC) USING BTREE,
  CONSTRAINT `ID_USERPR` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('user1', 'tôi không tìm thấy sản phẩm', '2022-11-27 15:35:29');
INSERT INTO `contact` VALUES ('user4', ' tooi ko thấy gạo đâu cả', '2022-12-18 15:29:43');
INSERT INTO `contact` VALUES ('user5', ' tôi ko tìm thấy đùi gà đâu cả ', '2022-12-18 15:57:05');
INSERT INTO `contact` VALUES ('user2', ' tôi là lê thị quyền nè', '2022-12-19 02:05:42');
INSERT INTO `contact` VALUES ('user2', ' fgshdfkgldkjfgdjglfjfdlkjg', '2023-01-01 13:29:56');
INSERT INTO `contact` VALUES ('user4', 'Thành Dương nè', '2023-01-03 15:38:54');
INSERT INTO `contact` VALUES ('user1', ' dsfsd', '2023-01-03 20:31:42');

-- ----------------------------
-- Table structure for ct_pr
-- ----------------------------
DROP TABLE IF EXISTS `ct_pr`;
CREATE TABLE `ct_pr`  (
  `ID_PR` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NSX` date NOT NULL,
  `HSD` date NULL DEFAULT NULL,
  `BRAND` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIBE` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mô tả',
  `WEIGHT` double NOT NULL,
  `ORIGIN` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'xuất xứ',
  `DATE_IMPORT_PR` date NULL DEFAULT NULL COMMENT 'ngày nhập hàng',
  `INVENTORY` int NULL DEFAULT NULL COMMENT 'số lượng hàng còn lại',
  `CONDITION_PR` tinyint NULL DEFAULT NULL COMMENT '0: đang bán, 1: ngừng bán',
  INDEX `PK_ID_PR`(`ID_PR` ASC) USING BTREE,
  CONSTRAINT `PK_ID_PR` FOREIGN KEY (`ID_PR`) REFERENCES `product` (`ID_PR`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ct_pr
-- ----------------------------
INSERT INTO `ct_pr` VALUES ('prod1', '2021-12-20', '2024-01-10', 'Coop Select', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 0.3, 'Việt Nam', '2022-09-15', 183, 0);
INSERT INTO `ct_pr` VALUES ('prod2', '2022-09-03', '2023-08-21', 'Coop Select', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 5, 'Việt Nam', '2022-12-13', 149, 0);
INSERT INTO `ct_pr` VALUES ('prod3', '2021-08-20', '2024-03-27', 'Coop Select', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 5, 'Việt Nam', '2022-07-20', 136, 0);
INSERT INTO `ct_pr` VALUES ('prod4', '2022-03-06', '2023-01-08', 'Coop Select', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 5, 'Việt Nam', '2023-03-28', 54, 0);
INSERT INTO `ct_pr` VALUES ('prod5', '2022-01-18', '2024-10-07', 'Coop Select', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 5, 'Việt Nam', '2023-10-09', 132, 0);
INSERT INTO `ct_pr` VALUES ('prod6', '2022-07-27', '2023-06-15', 'Coop Select', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 5, 'Việt Nam', '2022-12-04', 109, 0);
INSERT INTO `ct_pr` VALUES ('prod7', '2022-01-15', '2024-07-04', 'Coop Select', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 5, 'Việt Nam', '2023-09-06', 182, 0);
INSERT INTO `ct_pr` VALUES ('prod8', '2022-04-15', '2024-03-19', 'Ecoba', 'Gạo hữu cơ Ecoba không chỉ là loại gạo sạch, an toàn cho sức khoẻ mà còn có giá trị dinh dưỡng cao, thích hợp sử dụng cho người cần bồi bổ cơ thể hoặc dùng làm bột dinh dưỡng cho trẻ nhỏ.Gạo Ecoba đạt chứng nhận hữu cơ từ các tổ chức uy tín trên thế giới như USDA, EU Organic hay JAS của Nhật.', 1, 'Việt Nam', '2023-03-16', 167, 0);
INSERT INTO `ct_pr` VALUES ('prod9', '2022-11-03', '2023-07-25', 'Ecoba', 'Gạo hữu cơ Ecoba không chỉ là loại gạo sạch, an toàn cho sức khoẻ mà còn có giá trị dinh dưỡng cao, thích hợp sử dụng cho người cần bồi bổ cơ thể hoặc dùng làm bột dinh dưỡng cho trẻ nhỏ.Gạo Ecoba đạt chứng nhận hữu cơ từ các tổ chức uy tín trên thế giới như USDA, EU Organic hay JAS của Nhật.', 1, 'Việt Nam', '2023-05-03', 118, 0);
INSERT INTO `ct_pr` VALUES ('prod10', '2022-04-13', '2023-08-17', 'Ecoba', 'Gạo hữu cơ Ecoba không chỉ là loại gạo sạch, an toàn cho sức khoẻ mà còn có giá trị dinh dưỡng cao, thích hợp sử dụng cho người cần bồi bổ cơ thể hoặc dùng làm bột dinh dưỡng cho trẻ nhỏ.Gạo Ecoba đạt chứng nhận hữu cơ từ các tổ chức uy tín trên thế giới như USDA, EU Organic hay JAS của Nhật.', 1, 'Việt Nam', '2023-02-11', 67, 0);
INSERT INTO `ct_pr` VALUES ('prod11', '2022-12-01', '2023-03-23', 'Finest', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 1, 'Việt Nam', '2023-03-04', 105, 0);
INSERT INTO `ct_pr` VALUES ('prod12', '2021-07-12', '2023-07-28', 'Finest', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 1, 'Việt Nam', '2022-11-23', 147, 0);
INSERT INTO `ct_pr` VALUES ('prod13', '2021-09-12', '2023-11-04', 'Finest', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 5, 'Việt Nam', '2022-10-05', 103, 0);
INSERT INTO `ct_pr` VALUES ('prod14', '2021-04-01', '2023-07-28', 'Finest', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 2, 'Việt Nam', '2021-10-26', 151, 0);
INSERT INTO `ct_pr` VALUES ('prod15', '2022-10-03', '2023-07-21', 'Finest', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 7, 'Việt Nam', '2023-06-10', 197, 0);
INSERT INTO `ct_pr` VALUES ('prod16', '2021-06-27', '2023-10-15', 'Finest', 'Gạo có hạt thon dài, màu trắng trong, cơm dẻo vừa, thơm nhẹ.Chất lượng gạo đạt tiêu chuẩn xuất khẩu.Không chất bảo quản, không chất tạo mùi,không dư lượng thuốc trừ sâu.Cơm sau khi nấu có độ dẻo vừa, mềm, ngon và có mùi thơm nhẹ.', 2, 'Việt Nam', '2021-08-09', 194, 0);
INSERT INTO `ct_pr` VALUES ('prod17', '2022-09-12', '2024-10-06', 'Nutrichoice', 'Gạo lứt còn nguyên cám, chứa nhiều chất dinh dưỡng, hạt gạo có màu vàng nâu nhạt, khi nấu cho cơm sần sật, nở vừa, càng nhai càng cảm nhận vị ngọt', 5, 'Việt Nam', '2023-01-22', 161, 0);
INSERT INTO `ct_pr` VALUES ('prod18', '2021-05-15', '2023-10-14', 'Ông Cụ', 'Gạo lứt còn nguyên cám, chứa nhiều chất dinh dưỡng, hạt gạo có màu vàng nâu nhạt, khi nấu cho cơm sần sật, nở vừa, càng nhai càng cảm nhận vị ngọt', 1, 'Việt Nam', '2022-06-01', 157, 0);
INSERT INTO `ct_pr` VALUES ('prod19', '2021-10-05', '2024-02-14', 'Simply', 'Gạo lứt còn nguyên cám, chứa nhiều chất dinh dưỡng, hạt gạo có màu vàng nâu nhạt, khi nấu cho cơm sần sật, nở vừa, càng nhai càng cảm nhận vị ngọt', 1, 'Việt Nam', '2023-08-26', 126, 0);
INSERT INTO `ct_pr` VALUES ('prod20', '2021-11-04', '2023-01-09', 'Home Rice', 'Gạo lứt còn nguyên cám, chứa nhiều chất dinh dưỡng, hạt gạo có màu vàng nâu nhạt, khi nấu cho cơm sần sật, nở vừa, càng nhai càng cảm nhận vị ngọt', 1, 'Việt Nam', '2022-05-20', 102, 0);
INSERT INTO `ct_pr` VALUES ('prod21', '2022-06-24', '2023-08-28', 'Hoa Nắng', 'Gạo lứt còn nguyên cám, chứa nhiều chất dinh dưỡng, hạt gạo có màu vàng nâu nhạt, khi nấu cho cơm sần sật, nở vừa, càng nhai càng cảm nhận vị ngọt', 2, 'Việt Nam', '2023-02-26', 146, 0);
INSERT INTO `ct_pr` VALUES ('prod22', '2021-12-19', '2023-03-20', 'Ita Rice', 'Gạo lứt còn nguyên cám, chứa nhiều chất dinh dưỡng, hạt gạo có màu vàng nâu nhạt, khi nấu cho cơm sần sật, nở vừa, càng nhai càng cảm nhận vị ngọt', 2, 'Việt Nam', '2022-06-03', 167, 0);
INSERT INTO `ct_pr` VALUES ('prod23', '2021-12-24', '2024-07-05', 'Nutrichoice', 'Gạo lứt còn nguyên cám, chứa nhiều chất dinh dưỡng, hạt gạo có màu vàng nâu nhạt, khi nấu cho cơm sần sật, nở vừa, càng nhai càng cảm nhận vị ngọt', 2, 'Việt Nam', '2022-02-08', 71, 0);
INSERT INTO `ct_pr` VALUES ('prod24', '2021-11-15', '2023-03-02', 'Ông Cụ', 'Gạo lứt còn nguyên cám, chứa nhiều chất dinh dưỡng, hạt gạo có màu vàng nâu nhạt, khi nấu cho cơm sần sật, nở vừa, càng nhai càng cảm nhận vị ngọt', 1, 'Việt Nam', '2022-10-18', 59, 0);
INSERT INTO `ct_pr` VALUES ('prod25', '2021-07-06', '2023-11-20', 'Hạt Ngọc Trời', 'Cơm dẻo, thơm, độ nở xốp. Theo quy trình bền vững SRP. Không có hoá chất tẩy trắng, tạo mùi. Chứng nhận Chuẩn an toàn vệ sinh thực phẩm HACCP', 5, 'Việt Nam', '2023-07-11', 128, 0);
INSERT INTO `ct_pr` VALUES ('prod26', '2022-06-12', '2024-03-16', 'Hạt Ngọc Trời', 'Cơm dẻo, thơm, độ nở vừa. Theo quy trình bền vững SRP. Không có hoá chất tẩy trắng, tạo mùi. Chứng nhận Chuẩn an toàn vệ sinh thực phẩm HACCP', 5, 'Việt Nam', '2022-11-16', 152, 0);
INSERT INTO `ct_pr` VALUES ('prod27', '2021-03-28', '2023-02-02', 'Hạt Ngọc Trời', 'Cơm dẻo, thơm, độ nở vừa. Theo quy trình bền vững SRP. Không có hoá chất tẩy trắng, tạo mùi. Chứng nhận Chuẩn an toàn vệ sinh thực phẩm HACCP', 5, 'Việt Nam', '2022-09-23', 86, 0);
INSERT INTO `ct_pr` VALUES ('prod28', '2022-06-17', '2023-05-11', 'Lạc Việt', 'Cơm dẻo, thơm, độ nở xốp.Theo quy trình bền vững SRP. Không có hoá chất tẩy trắng, tạo mùi. Chứng nhận Chuẩn an toàn vệ sinh thực phẩm HACCP', 5, 'Việt Nam', '2022-08-04', 157, 0);
INSERT INTO `ct_pr` VALUES ('prod29', '2022-05-15', '2024-10-24', 'Lạc Việt', 'Cơm dẻo, thơm, độ nở xốp.Theo quy trình bền vững SRP. Không có hoá chất tẩy trắng, tạo mùi. Chứng nhận Chuẩn an toàn vệ sinh thực phẩm HACCP', 5, 'Việt Nam', '2023-03-13', 119, 0);
INSERT INTO `ct_pr` VALUES ('prod30', '2022-12-11', '2023-04-20', 'Lạc Việt', 'Cơm dẻo, thơm, độ nở xốp.Theo quy trình bền vững SRP. Không có hoá chất tẩy trắng, tạo mùi. Chứng nhận Chuẩn an toàn vệ sinh thực phẩm HACCP', 5, 'Việt Nam', '2023-10-24', 75, 0);
INSERT INTO `ct_pr` VALUES ('prod31', '2022-11-19', '2024-03-07', 'Lạc Việt', 'Cơm dẻo, thơm, độ nở xốp.Theo quy trình bền vững SRP. Không có hoá chất tẩy trắng, tạo mùi. Chứng nhận Chuẩn an toàn vệ sinh thực phẩm HACCP', 5, 'Việt Nam', '2023-09-01', 175, 0);
INSERT INTO `ct_pr` VALUES ('prod32', '2021-09-10', '2023-10-02', 'Lạc Việt', 'Cơm dẻo, thơm, độ nở xốp.Theo quy trình bền vững SRP. Không có hoá chất tẩy trắng, tạo mùi. Chứng nhận Chuẩn an toàn vệ sinh thực phẩm HACCP', 5, 'Việt Nam', '2022-01-01', 191, 0);
INSERT INTO `ct_pr` VALUES ('prod33', '2022-09-18', '2023-09-05', 'Meizan', 'Gạo khi nấu có độ mềm dẻo vừa phải cùng hương thơm nhẹ nhàng, kích thích cho bữa ăn thêm phần hấp dẫn. Gạo của hãng gạo Meizan với hạt gạo thon dài, màu trắng ngà tự nhiên, được nuôi trồng canh tác theo tiêu chuẩn nghiêm ngặt đảm bảo an toàn và chất lượng.', 5, 'Việt Nam', '2023-09-20', 128, 0);
INSERT INTO `ct_pr` VALUES ('prod34', '2021-08-15', '2024-11-10', 'Meizan', 'Gạo khi nấu có độ mềm dẻo vừa phải cùng hương thơm nhẹ nhàng, kích thích cho bữa ăn thêm phần hấp dẫn. Gạo của hãng gạo Meizan với hạt gạo thon dài, màu trắng ngà tự nhiên, được nuôi trồng canh tác theo tiêu chuẩn nghiêm ngặt đảm bảo an toàn và chất lượng.', 5, 'Việt Nam', '2021-11-02', 80, 0);
INSERT INTO `ct_pr` VALUES ('prod35', '2021-11-23', '2023-07-20', 'Natita', 'Gạo Natita chứa nhiều chất dinh dưỡng, hạt gạo có màu vàng nâu nhạt, khi nấu nở vừa, càng nhai càng cảm nhận vị ngọt cùng hương thơm nhẹ nhàng', 2, 'Việt Nam', '2023-11-17', 123, 0);
INSERT INTO `ct_pr` VALUES ('prod36', '2021-10-07', '2024-07-08', 'Natita', 'Gạo Natita chứa nhiều chất dinh dưỡng, hạt gạo có màu vàng nâu nhạt, khi nấu nở vừa, càng nhai càng cảm nhận vị ngọt cùng hương thơm nhẹ nhàng', 2, 'Việt Nam', '2023-12-01', 166, 0);
INSERT INTO `ct_pr` VALUES ('prod37', '2022-04-15', '2023-10-18', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2022-06-18', 188, 0);
INSERT INTO `ct_pr` VALUES ('prod38', '2022-10-23', '2023-01-14', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2023-02-26', 179, 0);
INSERT INTO `ct_pr` VALUES ('prod39', '2022-02-04', '2023-08-22', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2022-04-27', 91, 0);
INSERT INTO `ct_pr` VALUES ('prod40', '2022-10-06', '2023-08-18', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2023-02-27', 88, 0);
INSERT INTO `ct_pr` VALUES ('prod41', '2021-09-13', '2024-11-16', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2023-10-12', 53, 0);
INSERT INTO `ct_pr` VALUES ('prod42', '2022-07-19', '2024-08-24', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2023-04-17', 74, 0);
INSERT INTO `ct_pr` VALUES ('prod43', '2022-06-16', '2023-04-04', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2022-11-21', 134, 0);
INSERT INTO `ct_pr` VALUES ('prod44', '2022-11-15', '2023-09-18', 'Coop Select', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-03-13', 73, 0);
INSERT INTO `ct_pr` VALUES ('prod45', '2022-03-14', '2024-02-23', 'Ngọc Hoàng', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-09-02', 162, 0);
INSERT INTO `ct_pr` VALUES ('prod46', '2021-09-20', '2024-12-26', 'Việt San', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-11-26', 92, 0);
INSERT INTO `ct_pr` VALUES ('prod47', '2021-12-05', '2023-05-21', 'Ông Cụ', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-10-21', 147, 0);
INSERT INTO `ct_pr` VALUES ('prod48', '2021-03-14', '2024-05-08', 'PMT', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-10-26', 173, 0);
INSERT INTO `ct_pr` VALUES ('prod49', '2021-10-08', '2024-08-10', 'Vinh Hiển', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-03-06', 194, 0);
INSERT INTO `ct_pr` VALUES ('prod50', '2022-11-06', '2024-11-27', 'Vinh Hiển', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-02-19', 79, 0);
INSERT INTO `ct_pr` VALUES ('prod51', '2021-09-04', '2023-02-28', 'Meizan', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-12-17', 74, 0);
INSERT INTO `ct_pr` VALUES ('prod52', '2022-12-14', '2023-03-09', 'Meizan', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-06-08', 129, 0);
INSERT INTO `ct_pr` VALUES ('prod53', '2022-10-17', '2023-06-01', 'Ông Cụ', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-06-02', 125, 0);
INSERT INTO `ct_pr` VALUES ('prod54', '2022-08-25', '2023-01-17', 'Vinh Hiển', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-08-16', 162, 0);
INSERT INTO `ct_pr` VALUES ('prod55', '2022-08-02', '2024-09-06', 'Coop Select', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-12-21', 147, 0);
INSERT INTO `ct_pr` VALUES ('prod56', '2021-08-26', '2024-09-26', 'Meizan', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-12-17', 122, 0);
INSERT INTO `ct_pr` VALUES ('prod57', '2022-11-14', '2023-08-15', 'SGFood', 'Bắp hạt đông lạnh là sản phẩm rau củ đông tiện lợi, có thể nhanh chóng chế biến thành các món súp, bắp xào... mang hương vị hấp dẫn mà không tốn nhiều thời gian.', 0.5, 'Việt Nam', '2023-03-24', 103, 0);
INSERT INTO `ct_pr` VALUES ('prod58', '2021-02-19', '2023-11-14', 'Việt San', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.15, 'Việt Nam', '2022-07-15', 53, 0);
INSERT INTO `ct_pr` VALUES ('prod59', '2021-06-28', '2023-04-27', 'PMT', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0, 'Việt Nam', '2023-08-26', 96, 0);
INSERT INTO `ct_pr` VALUES ('prod60', '2022-11-03', '2023-11-27', 'Việt San', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.5, 'Việt Nam', '2023-08-23', 191, 0);
INSERT INTO `ct_pr` VALUES ('prod61', '2022-06-10', '2024-11-25', 'SGFood', 'Là loại rau củ đông lạnh chứa nhiều protein tốt, vitamin A B6 C K, chất xơ và các khoáng chất khác, đặc biệt rất ít chất béo bão hòa cholesterol. Đậu Hà Lan được làm sạch và bao gói bảo quản lạnh cẩn thận, là sản phẩm tiện lợi cho mọi gia đình đến từ rau củ đông lạnh ', 0.5, 'Việt Nam', '2022-08-20', 141, 0);
INSERT INTO `ct_pr` VALUES ('prod62', '2021-12-04', '2024-11-09', 'Trần Gia', 'Là loại rau củ đông lạnh chứa nhiều protein tốt, vitamin A B6 C K, chất xơ và các khoáng chất khác, đặc biệt rất ít chất béo bão hòa cholesterol. Đậu Hà Lan được làm sạch và bao gói bảo quản lạnh cẩn thận, là sản phẩm tiện lợi cho mọi gia đình đến từ rau củ đông lạnh.', 0.4, 'Việt Nam', '2022-06-23', 175, 0);
INSERT INTO `ct_pr` VALUES ('prod63', '2021-09-10', '2024-05-06', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.5, 'Việt Nam', '2022-06-10', 167, 0);
INSERT INTO `ct_pr` VALUES ('prod64', '2022-01-14', '2024-07-07', 'Việt San', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.5, 'Việt Nam', '2022-08-17', 128, 0);
INSERT INTO `ct_pr` VALUES ('prod65', '2021-10-25', '2024-06-16', 'Việt San', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.15, 'Việt Nam', '2022-10-02', 65, 0);
INSERT INTO `ct_pr` VALUES ('prod66', '2021-09-02', '2024-02-14', 'Việt San', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.3, 'Việt Nam', '2023-06-20', 132, 0);
INSERT INTO `ct_pr` VALUES ('prod67', '2022-06-03', '2024-04-06', 'MamaFood', 'Bắp hạt đông lạnh là sản phẩm rau củ đông tiện lợi, có thể nhanh chóng chế biến thành các món súp, bắp xào... mang hương vị hấp dẫn mà không tốn nhiều thời gian.', 0.25, 'Việt Nam', '2023-12-05', 159, 0);
INSERT INTO `ct_pr` VALUES ('prod68', '2021-10-13', '2024-01-15', 'Trần Gia', 'Bắp hạt đông lạnh là sản phẩm rau củ đông tiện lợi, có thể nhanh chóng chế biến thành các món súp, bắp xào... mang hương vị hấp dẫn mà không tốn nhiều thời gian.', 0.5, 'Việt Nam', '2021-11-06', 162, 0);
INSERT INTO `ct_pr` VALUES ('prod69', '2022-09-13', '2023-11-13', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.3, 'Việt Nam', '2022-11-06', 198, 0);
INSERT INTO `ct_pr` VALUES ('prod70', '2021-12-03', '2024-04-26', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.5, 'Việt Nam', '2023-08-09', 141, 0);
INSERT INTO `ct_pr` VALUES ('prod71', '2022-12-22', '2023-11-05', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.3, 'Việt Nam', '2023-06-20', 199, 0);
INSERT INTO `ct_pr` VALUES ('prod72', '2021-08-22', '2024-02-05', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.3, 'Việt Nam', '2022-02-08', 177, 0);
INSERT INTO `ct_pr` VALUES ('prod73', '2022-05-20', '2023-12-11', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.5, 'Việt Nam', '2022-11-11', 106, 0);
INSERT INTO `ct_pr` VALUES ('prod74', '2021-02-05', '2024-04-16', 'Markal', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.5, 'Việt Nam', '2021-07-15', 122, 0);
INSERT INTO `ct_pr` VALUES ('prod75', '2021-05-16', '2024-06-09', 'MamaFood', 'Là loại rau củ đông lạnh chứa nhiều protein tốt, vitamin A B6 C K, chất xơ và các khoáng chất khác, đặc biệt rất ít chất béo bão hòa cholesterol. Đậu Hà Lan được làm sạch và bao gói bảo quản lạnh cẩn thận, là sản phẩm tiện lợi cho mọi gia đình đến từ rau củ đông lạnh ', 0.2, 'Việt Nam', '2022-07-23', 67, 0);
INSERT INTO `ct_pr` VALUES ('prod76', '2021-11-20', '2023-05-12', 'Markal', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.5, 'Việt Nam', '2023-09-12', 159, 0);
INSERT INTO `ct_pr` VALUES ('prod77', '2022-05-02', '2023-11-28', 'Markal', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.5, 'Việt Nam', '2022-06-11', 175, 0);
INSERT INTO `ct_pr` VALUES ('prod78', '2022-04-14', '2024-02-09', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.5, 'Việt Nam', '2023-04-18', 102, 0);
INSERT INTO `ct_pr` VALUES ('prod79', '2021-01-23', '2023-01-26', 'PMT', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.25, 'Việt Nam', '2022-04-12', 145, 0);
INSERT INTO `ct_pr` VALUES ('prod80', '2022-09-28', '2023-11-07', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.3, 'Việt Nam', '2022-12-23', 162, 0);
INSERT INTO `ct_pr` VALUES ('prod81', '2021-03-22', '2024-11-08', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 0.3, 'Việt Nam', '2023-05-02', 98, 0);
INSERT INTO `ct_pr` VALUES ('prod82', '2022-06-05', '2024-07-27', 'Meizan', 'Bột bắp chất lượng, được dùng phổ biến trong nhiều loại bánh như bánh bông lan, cookie,.... Bột bắp Meizan gói 150g gói  tiện lợi, sử dụng cho gia đình, tiết kiệm. Bột bắp còn giúp cho cá món phủ bột chiên thêm thơm giòn hơn nữa.', 0.15, 'Việt Nam', '2023-06-21', 121, 0);
INSERT INTO `ct_pr` VALUES ('prod83', '2021-11-23', '2024-02-22', 'Tấn Sang', 'Bột bắp chất lượng, được dùng phổ biến trong nhiều loại bánh như bánh bông lan, cookie,.... Bột bắp Meizan gói 150g gói  tiện lợi, sử dụng cho gia đình, tiết kiệm. Bột bắp còn giúp cho cá món phủ bột chiên thêm thơm giòn hơn nữa.', 0.15, 'Việt Nam', '2022-07-28', 154, 0);
INSERT INTO `ct_pr` VALUES ('prod84', '2021-10-10', '2024-10-17', 'Meizan', 'Bột mì dùng để làm bánh mì, bánh bông lan, bánh ngọt, bánh rán, bánh pizza, mì sợi, bánh bao hoặc dùng làm các món chiên giòn, tẩm bột. Bột mì đa dụng Meizan gói 500g tiện lợi, phù hợp cho gia đình bạn. Bột Meizan được nhiều người chọn lựa và tin dùng', 0.5, 'Việt Nam', '2022-07-24', 154, 0);
INSERT INTO `ct_pr` VALUES ('prod85', '2022-09-16', '2024-05-07', 'Tấn Sang', 'Bột năng Tấn Sang gói 400g với 100% bột năng giúp bạn tạo nên những món ăn ngon. Bột Tấn Sang là thương hiệu nổi tiếng về chất lượng bột.', 0.4, 'Việt Nam', '2023-08-10', 176, 0);
INSERT INTO `ct_pr` VALUES ('prod86', '2022-07-01', '2023-08-25', 'Việt Đại', 'Bột ngũ cốc Việt Đài là sản phẩm bổ sung dinh dưỡng cho cả người già và trẻ nhỏ hơn 3 tuổi. Bột ngũ cốc sở hữu bảng thành phần phong phú, đảm bảo cung cấp nguồn dinh dưỡng tối đa. Bột ngũ cốc ăn kiêng Việt Đài bịch 400g chuyên dành cho người ăn kiêng và người bị bệnh tiểu đường', 0.4, 'Việt Nam', '2023-10-06', 125, 0);
INSERT INTO `ct_pr` VALUES ('prod87', '2021-04-16', '2023-10-26', 'VinaCafe', 'Bột bắp chất lượng, được dùng phổ biến trong nhiều loại bánh như bánh bông lan, cookie,.... Bột bắp Meizan gói 150g gói  tiện lợi, sử dụng cho gia đình, tiết kiệm. Bột bắp còn giúp cho cá món phủ bột chiên thêm thơm giòn hơn nữa.', 0.5, 'Việt Nam', '2022-08-17', 169, 0);
INSERT INTO `ct_pr` VALUES ('prod88', '2022-07-24', '2024-05-25', 'YumFood', 'Thực phẩm bổ sung ngũ cốc dinh dưỡng Yumfood. Với những thành phần lành tính, an toàn cho sức khỏe, sản phẩm không chỉ giúp mang đến cho người dùng nguồn năng lượng hoạt động dồi dào mà còn có cả hương vị thơm ngon, béo ngậy. Cung cấp năng lượng cho cơ thể, bổ sung khoáng chất, hỗ trợ cân bằng đường huyết. ', 0.5, 'Việt Nam', '2023-10-17', 159, 0);
INSERT INTO `ct_pr` VALUES ('prod89', '2023-01-24', '2023-02-05', 'Không có', 'Bắp Mỹ là một loại thực phẩm được trồng rất nhiều ở khắp nơi trên thế giới. Đây là một loại quả vừa ngon, lại có rất nhiều chất khoáng chất và vitamin. Bắp có thể chế biến thành nhiều món ăn ngon như: cơm bắp, chè bắp, sữa bắp,... bất kỳ món gì cũng tạo nên hương vị tuyệt hảo.', 0.6, 'Việt Nam', '2023-07-22', 133, 0);
INSERT INTO `ct_pr` VALUES ('prod90', '2023-01-21', '2023-02-05', 'Không có', 'Bắp nếp là một loại thực phẩm được trồng rất nhiều ở nước ta. Đây là một loại quả vừa ngon, lại có rất nhiều chất khoáng chất và vitamin. Bắp có thể chế biến thành nhiều món ăn ngon như: cơm bắp, chè bắp, sữa bắp,... bất kỳ món gì cũng tạo nên hương vị tuyệt hảo.', 0.5, 'Việt Nam', '2023-04-09', 117, 0);
INSERT INTO `ct_pr` VALUES ('prod91', '2023-01-22', '2023-04-28', 'Không có', 'Khoai lang có vị ngọt ngào như mật, tan tan trên đầu lưỡi, chứa nhiều vitamin A, B, C và nhiều khoáng chất cần thiết.', 1, 'Việt Nam', '2024-01-02', 190, 0);
INSERT INTO `ct_pr` VALUES ('prod92', '2023-01-11', '2023-04-15', 'Không có', 'Khoai lang có vị ngọt ngào như mật, tan tan trên đầu lưỡi, chứa nhiều vitamin A, B, C và nhiều khoáng chất cần thiết.', 1, 'Việt Nam', '2023-08-06', 105, 0);
INSERT INTO `ct_pr` VALUES ('prod93', '2023-01-17', '2023-04-02', 'Không có', 'Khoai lang có vị ngọt ngào như mật, tan tan trên đầu lưỡi, chứa nhiều vitamin A, B, C và nhiều khoáng chất cần thiết.', 1, 'Việt Nam', '2023-08-02', 131, 0);
INSERT INTO `ct_pr` VALUES ('prod94', '2023-01-18', '2023-04-19', 'Không có', 'Khoai lang có vị ngọt ngào như mật, tan tan trên đầu lưỡi, chứa nhiều vitamin A, B, C và nhiều khoáng chất cần thiết.', 1, 'Việt Nam', '2023-10-08', 104, 0);
INSERT INTO `ct_pr` VALUES ('prod95', '2023-01-08', '2023-04-20', 'Không có', 'Khoai lang có vị ngọt ngào như mật, tan tan trên đầu lưỡi, chứa nhiều vitamin A, B, C và nhiều khoáng chất cần thiết.', 1, 'Việt Nam', '2023-09-06', 57, 0);
INSERT INTO `ct_pr` VALUES ('prod96', '2023-01-08', '2023-04-27', 'Không có', 'Khoai mỡ là loại củ khá được ưa chuộng trong những bữa ăn gia đình. Khoai mỡ có hàm lượng khoáng chất và vitamin giúp cải thiện hệ tiêu hoá, giúp nhuận tràng, chữa táo bón rất tốt. Khoai mỡ có thể sử dụng để chế biến thành các món như: canh, bánh khoai mỡ, khoai mỡ chiên giòn.Khoai mỡ to, lớp vỏ sần sùi, có ít rễ nhỏ xung quanh. Bên trong thịt trắng, tím, ngọt, bùi và rất béo.', 1, 'Việt Nam', '2023-08-17', 64, 0);
INSERT INTO `ct_pr` VALUES ('prod97', '2023-01-19', '2023-04-06', 'Không có', 'Củ khoai môn có hàm lượng chất xơ và nhiều loại vitamin, khoáng chất dồi dào rất cần thiết cho sức khỏe con người. Khoai môn có lớp vỏ ngoài màu nâu, phần thịt bên trong màu trắng kết hợp với nhiều đốm màu tím nhạt, có thể chế biến thành nhiều món ăn ngon, hấp dẫn.Khoai môn to, chất lượng, vỏ màu nâu, sần nhẹ, bên trọng thịt khoai môn bùi, béo và ngọt, có màu trắng cùng vài đường vân màu tím.', 0.5, 'Việt Nam', '2023-08-01', 87, 0);
INSERT INTO `ct_pr` VALUES ('prod98', '2023-01-03', '2023-04-01', 'Không có', 'Khoai tây củ to, chất lượng, lớp vỏ màu vàng nhạt, chứa nhiều tinh bột nên khi ăn sẽ cảm nhận được vị bùi, thơm ngon và ngọt của khoai tây. Khoai không bị hư, mọc mầm hay bị sượng.', 0.5, 'Việt Nam', '2023-10-07', 85, 0);
INSERT INTO `ct_pr` VALUES ('prod99', '2023-01-14', '2023-04-07', 'Không có', 'Khoai tây củ to, chất lượng, lớp vỏ màu vàng nhạt, chứa nhiều tinh bột nên khi ăn sẽ cảm nhận được vị bùi, thơm ngon và ngọt của khoai tây. Khoai không bị hư, mọc mầm hay bị sượng.', 0.5, 'Việt Nam', '2023-10-18', 166, 0);
INSERT INTO `ct_pr` VALUES ('prod100', '2023-01-19', '2023-04-05', 'Không có', 'Củ sắn hay còn gọi là củ đậu có kích thước to, tròn và trông khá giống với con quay, thịt chắc và nặng, có lớp vỏ xơ dai màu vàng. Phần thịt của củ sắn khá ngọt, nhiều nước và rất giòn, chấm với muối tôm và ướp lạnh ngon vô cùng.', 1, 'Việt Nam', '2023-06-19', 68, 0);
INSERT INTO `ct_pr` VALUES ('prod39', '2022-02-04', '2023-08-22', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2022-04-27', 91, 0);
INSERT INTO `ct_pr` VALUES ('prod40', '2022-10-06', '2023-08-18', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2023-02-27', 88, 0);
INSERT INTO `ct_pr` VALUES ('prod41', '2021-09-13', '2024-11-16', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2023-10-12', 53, 0);
INSERT INTO `ct_pr` VALUES ('prod42', '2022-07-19', '2024-08-24', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2023-04-17', 74, 0);
INSERT INTO `ct_pr` VALUES ('prod43', '2022-06-16', '2023-04-04', 'Vua Gạo', 'Gạo hạt dài, đều màu. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội. Gạo thơm Vua Gạo Làng Ta túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn. Gạo Vua Gạo có quy trình kiểm soát chất lượng từ khâu nhập lúa tươi đến khi cho ra thành phẩm', 5, 'Việt Nam', '2022-11-21', 134, 0);
INSERT INTO `ct_pr` VALUES ('prod44', '2022-11-15', '2023-09-18', 'Coop Select', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-03-13', 73, 0);
INSERT INTO `ct_pr` VALUES ('prod45', '2022-03-14', '2024-02-23', 'Ngọc Hoàng', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-09-02', 162, 0);
INSERT INTO `ct_pr` VALUES ('prod46', '2021-09-20', '2024-12-26', 'Việt San', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-11-26', 92, 0);
INSERT INTO `ct_pr` VALUES ('prod47', '2021-12-05', '2023-05-21', 'Ông Cụ', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-10-21', 147, 0);
INSERT INTO `ct_pr` VALUES ('prod48', '2021-03-14', '2024-05-08', 'PMT', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-10-26', 173, 0);
INSERT INTO `ct_pr` VALUES ('prod49', '2021-10-08', '2024-08-10', 'Vinh Hiển', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-03-06', 194, 0);
INSERT INTO `ct_pr` VALUES ('prod50', '2022-11-06', '2024-11-27', 'Vinh Hiển', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-02-19', 79, 0);
INSERT INTO `ct_pr` VALUES ('prod51', '2021-09-04', '2023-02-28', 'Meizan', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-12-17', 74, 0);
INSERT INTO `ct_pr` VALUES ('prod52', '2022-12-14', '2023-03-09', 'Meizan', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-06-08', 129, 0);
INSERT INTO `ct_pr` VALUES ('prod53', '2022-10-17', '2023-06-01', 'Ông Cụ', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-06-02', 125, 0);
INSERT INTO `ct_pr` VALUES ('prod54', '2022-08-25', '2023-01-17', 'Vinh Hiển', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-08-16', 162, 0);
INSERT INTO `ct_pr` VALUES ('prod55', '2022-08-02', '2024-09-06', 'Coop Select', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2022-12-21', 147, 0);
INSERT INTO `ct_pr` VALUES ('prod56', '2021-08-26', '2024-09-26', 'Meizan', 'Gạo nếp dẻo, ngọt, thơm. Gạo nếp là một đặc sản của vùng Bắc Bộ, với đặc tính hạt nếp tròn, ngắn, trắng đều và có hương thơm nhẹ. Khi nấu, cơm nếp mềm dẻo, có vị ngọt nhẹ và thơm lừng đặc trưng. Với chất lượng sạch, an toàn và ngon miệng', 1, 'Việt Nam', '2023-12-17', 122, 0);
INSERT INTO `ct_pr` VALUES ('prod57', '2022-11-14', '2023-08-15', 'SGFood', 'Bắp hạt đông lạnh là sản phẩm rau củ đông tiện lợi, có thể nhanh chóng chế biến thành các món súp, bắp xào... mang hương vị hấp dẫn mà không tốn nhiều thời gian.', 500, 'Việt Nam', '2023-03-24', 103, 0);
INSERT INTO `ct_pr` VALUES ('prod58', '2021-02-19', '2023-11-14', 'Việt San', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 150, 'Việt Nam', '2022-07-15', 53, 0);
INSERT INTO `ct_pr` VALUES ('prod59', '2021-06-28', '2023-04-27', 'PMT', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 250, 'Việt Nam', '2023-08-26', 96, 0);
INSERT INTO `ct_pr` VALUES ('prod60', '2022-11-03', '2023-11-27', 'Việt San', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 500, 'Việt Nam', '2023-08-23', 191, 0);
INSERT INTO `ct_pr` VALUES ('prod61', '2022-06-10', '2024-11-25', 'SGFood', 'Là loại rau củ đông lạnh chứa nhiều protein tốt, vitamin A B6 C K, chất xơ và các khoáng chất khác, đặc biệt rất ít chất béo bão hòa cholesterol. Đậu Hà Lan được làm sạch và bao gói bảo quản lạnh cẩn thận, là sản phẩm tiện lợi cho mọi gia đình đến từ rau củ đông lạnh ', 500, 'Việt Nam', '2022-08-20', 141, 0);
INSERT INTO `ct_pr` VALUES ('prod62', '2021-12-04', '2024-11-09', 'Trần Gia', 'Là loại rau củ đông lạnh chứa nhiều protein tốt, vitamin A B6 C K, chất xơ và các khoáng chất khác, đặc biệt rất ít chất béo bão hòa cholesterol. Đậu Hà Lan được làm sạch và bao gói bảo quản lạnh cẩn thận, là sản phẩm tiện lợi cho mọi gia đình đến từ rau củ đông lạnh.', 400, 'Việt Nam', '2022-06-23', 175, 0);
INSERT INTO `ct_pr` VALUES ('prod63', '2021-09-10', '2024-05-06', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 500, 'Việt Nam', '2022-06-10', 167, 0);
INSERT INTO `ct_pr` VALUES ('prod64', '2022-01-14', '2024-07-07', 'Việt San', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 500, 'Việt Nam', '2022-08-17', 128, 0);
INSERT INTO `ct_pr` VALUES ('prod65', '2021-10-25', '2024-06-16', 'Việt San', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 150, 'Việt Nam', '2022-10-02', 65, 0);
INSERT INTO `ct_pr` VALUES ('prod66', '2021-09-02', '2024-02-14', 'Việt San', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 300, 'Việt Nam', '2023-06-20', 132, 0);
INSERT INTO `ct_pr` VALUES ('prod67', '2022-06-03', '2024-04-06', 'MamaFood', 'Bắp hạt đông lạnh là sản phẩm rau củ đông tiện lợi, có thể nhanh chóng chế biến thành các món súp, bắp xào... mang hương vị hấp dẫn mà không tốn nhiều thời gian.', 250, 'Việt Nam', '2023-12-05', 159, 0);
INSERT INTO `ct_pr` VALUES ('prod68', '2021-10-13', '2024-01-15', 'Trần Gia', 'Bắp hạt đông lạnh là sản phẩm rau củ đông tiện lợi, có thể nhanh chóng chế biến thành các món súp, bắp xào... mang hương vị hấp dẫn mà không tốn nhiều thời gian.', 500, 'Việt Nam', '2021-11-06', 162, 0);
INSERT INTO `ct_pr` VALUES ('prod69', '2022-09-13', '2023-11-13', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 300, 'Việt Nam', '2022-11-06', 198, 0);
INSERT INTO `ct_pr` VALUES ('prod70', '2021-12-03', '2024-04-26', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 500, 'Việt Nam', '2023-08-09', 141, 0);
INSERT INTO `ct_pr` VALUES ('prod71', '2022-12-22', '2023-11-05', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 300, 'Việt Nam', '2023-06-20', 199, 0);
INSERT INTO `ct_pr` VALUES ('prod72', '2021-08-22', '2024-02-05', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 300, 'Việt Nam', '2022-02-08', 177, 0);
INSERT INTO `ct_pr` VALUES ('prod73', '2022-05-20', '2023-12-11', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 500, 'Việt Nam', '2022-11-11', 106, 0);
INSERT INTO `ct_pr` VALUES ('prod74', '2021-02-05', '2024-04-16', 'Markal', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 500, 'Việt Nam', '2021-07-15', 122, 0);
INSERT INTO `ct_pr` VALUES ('prod75', '2021-05-16', '2024-06-09', 'MamaFood', 'Là loại rau củ đông lạnh chứa nhiều protein tốt, vitamin A B6 C K, chất xơ và các khoáng chất khác, đặc biệt rất ít chất béo bão hòa cholesterol. Đậu Hà Lan được làm sạch và bao gói bảo quản lạnh cẩn thận, là sản phẩm tiện lợi cho mọi gia đình đến từ rau củ đông lạnh ', 200, 'Việt Nam', '2022-07-23', 67, 0);
INSERT INTO `ct_pr` VALUES ('prod76', '2021-11-20', '2023-05-12', 'Markal', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 500, 'Việt Nam', '2023-09-12', 159, 0);
INSERT INTO `ct_pr` VALUES ('prod77', '2022-05-02', '2023-11-28', 'Markal', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 500, 'Việt Nam', '2022-06-11', 175, 0);
INSERT INTO `ct_pr` VALUES ('prod78', '2022-04-14', '2024-02-09', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 500, 'Việt Nam', '2023-04-18', 102, 0);
INSERT INTO `ct_pr` VALUES ('prod79', '2021-01-23', '2023-01-26', 'PMT', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 250, 'Việt Nam', '2022-04-12', 145, 0);
INSERT INTO `ct_pr` VALUES ('prod80', '2022-09-28', '2023-11-07', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 300, 'Việt Nam', '2022-12-23', 162, 0);
INSERT INTO `ct_pr` VALUES ('prod81', '2021-03-22', '2024-11-08', 'Xuân Hồng', 'Hạt đậu đều, chắc hạt, sạch không có rác. Đậu hạt rất là bùi, không bị lép, dùng để nấu xôi hoặc có thể dùng để nấu chè mát,... và nhiều món khác tùy sở thích của mỗi người. Với chất lượng an toàn, vệ sinh được nhiều người chọn mua.', 300, 'Việt Nam', '2023-05-02', 98, 0);
INSERT INTO `ct_pr` VALUES ('prod82', '2022-06-05', '2024-07-27', 'Meizan', 'Bột bắp chất lượng, được dùng phổ biến trong nhiều loại bánh như bánh bông lan, cookie,.... Bột bắp Meizan gói 150g gói  tiện lợi, sử dụng cho gia đình, tiết kiệm. Bột bắp còn giúp cho cá món phủ bột chiên thêm thơm giòn hơn nữa.', 150, 'Việt Nam', '2023-06-21', 121, 0);
INSERT INTO `ct_pr` VALUES ('prod83', '2021-11-23', '2024-02-22', 'Tấn Sang', 'Bột bắp chất lượng, được dùng phổ biến trong nhiều loại bánh như bánh bông lan, cookie,.... Bột bắp Meizan gói 150g gói  tiện lợi, sử dụng cho gia đình, tiết kiệm. Bột bắp còn giúp cho cá món phủ bột chiên thêm thơm giòn hơn nữa.', 150, 'Việt Nam', '2022-07-28', 154, 0);
INSERT INTO `ct_pr` VALUES ('prod84', '2021-10-10', '2024-10-17', 'Meizan', 'Bột mì dùng để làm bánh mì, bánh bông lan, bánh ngọt, bánh rán, bánh pizza, mì sợi, bánh bao hoặc dùng làm các món chiên giòn, tẩm bột. Bột mì đa dụng Meizan gói 500g tiện lợi, phù hợp cho gia đình bạn. Bột Meizan được nhiều người chọn lựa và tin dùng', 500, 'Việt Nam', '2022-07-24', 154, 0);
INSERT INTO `ct_pr` VALUES ('prod85', '2022-09-16', '2024-05-07', 'Tấn Sang', 'Bột năng Tấn Sang gói 400g với 100% bột năng giúp bạn tạo nên những món ăn ngon. Bột Tấn Sang là thương hiệu nổi tiếng về chất lượng bột.', 400, 'Việt Nam', '2023-08-10', 176, 0);
INSERT INTO `ct_pr` VALUES ('prod86', '2022-07-01', '2023-08-25', 'Việt Đại', 'Bột ngũ cốc Việt Đài là sản phẩm bổ sung dinh dưỡng cho cả người già và trẻ nhỏ hơn 3 tuổi. Bột ngũ cốc sở hữu bảng thành phần phong phú, đảm bảo cung cấp nguồn dinh dưỡng tối đa. Bột ngũ cốc ăn kiêng Việt Đài bịch 400g chuyên dành cho người ăn kiêng và người bị bệnh tiểu đường', 400, 'Việt Nam', '2023-10-06', 125, 0);
INSERT INTO `ct_pr` VALUES ('prod87', '2021-04-16', '2023-10-26', 'VinaCafe', 'Bột bắp chất lượng, được dùng phổ biến trong nhiều loại bánh như bánh bông lan, cookie,.... Bột bắp Meizan gói 150g gói  tiện lợi, sử dụng cho gia đình, tiết kiệm. Bột bắp còn giúp cho cá món phủ bột chiên thêm thơm giòn hơn nữa.', 500, 'Việt Nam', '2022-08-17', 169, 0);
INSERT INTO `ct_pr` VALUES ('prod88', '2022-07-24', '2024-05-25', 'YumFood', 'Thực phẩm bổ sung ngũ cốc dinh dưỡng Yumfood. Với những thành phần lành tính, an toàn cho sức khỏe, sản phẩm không chỉ giúp mang đến cho người dùng nguồn năng lượng hoạt động dồi dào mà còn có cả hương vị thơm ngon, béo ngậy. Cung cấp năng lượng cho cơ thể, bổ sung khoáng chất, hỗ trợ cân bằng đường huyết. ', 500, 'Việt Nam', '2023-10-17', 159, 0);
INSERT INTO `ct_pr` VALUES ('prod89', '2023-01-24', '2023-02-05', 'Không có', 'Bắp Mỹ là một loại thực phẩm được trồng rất nhiều ở khắp nơi trên thế giới. Đây là một loại quả vừa ngon, lại có rất nhiều chất khoáng chất và vitamin. Bắp có thể chế biến thành nhiều món ăn ngon như: cơm bắp, chè bắp, sữa bắp,... bất kỳ món gì cũng tạo nên hương vị tuyệt hảo.', 0.6, 'Việt Nam', '2023-07-22', 133, 0);
INSERT INTO `ct_pr` VALUES ('prod90', '2023-01-21', '2023-02-05', 'Không có', 'Bắp nếp là một loại thực phẩm được trồng rất nhiều ở nước ta. Đây là một loại quả vừa ngon, lại có rất nhiều chất khoáng chất và vitamin. Bắp có thể chế biến thành nhiều món ăn ngon như: cơm bắp, chè bắp, sữa bắp,... bất kỳ món gì cũng tạo nên hương vị tuyệt hảo.', 0.5, 'Việt Nam', '2023-04-09', 117, 0);
INSERT INTO `ct_pr` VALUES ('prod91', '2023-01-22', '2023-04-28', 'Không có', 'Khoai lang có vị ngọt ngào như mật, tan tan trên đầu lưỡi, chứa nhiều vitamin A, B, C và nhiều khoáng chất cần thiết.', 1, 'Việt Nam', '2024-01-02', 190, 0);
INSERT INTO `ct_pr` VALUES ('prod92', '2023-01-11', '2023-04-15', 'Không có', 'Khoai lang có vị ngọt ngào như mật, tan tan trên đầu lưỡi, chứa nhiều vitamin A, B, C và nhiều khoáng chất cần thiết.', 1, 'Việt Nam', '2023-08-06', 105, 0);
INSERT INTO `ct_pr` VALUES ('prod93', '2023-01-17', '2023-04-02', 'Không có', 'Khoai lang có vị ngọt ngào như mật, tan tan trên đầu lưỡi, chứa nhiều vitamin A, B, C và nhiều khoáng chất cần thiết.', 1, 'Việt Nam', '2023-08-02', 131, 0);
INSERT INTO `ct_pr` VALUES ('prod94', '2023-01-18', '2023-04-19', 'Không có', 'Khoai lang có vị ngọt ngào như mật, tan tan trên đầu lưỡi, chứa nhiều vitamin A, B, C và nhiều khoáng chất cần thiết.', 1, 'Việt Nam', '2023-10-08', 104, 0);
INSERT INTO `ct_pr` VALUES ('prod95', '2023-01-08', '2023-04-20', 'Không có', 'Khoai lang có vị ngọt ngào như mật, tan tan trên đầu lưỡi, chứa nhiều vitamin A, B, C và nhiều khoáng chất cần thiết.', 1, 'Việt Nam', '2023-09-06', 57, 0);
INSERT INTO `ct_pr` VALUES ('prod96', '2023-01-08', '2023-04-27', 'Không có', 'Khoai mỡ là loại củ khá được ưa chuộng trong những bữa ăn gia đình. Khoai mỡ có hàm lượng khoáng chất và vitamin giúp cải thiện hệ tiêu hoá, giúp nhuận tràng, chữa táo bón rất tốt. Khoai mỡ có thể sử dụng để chế biến thành các món như: canh, bánh khoai mỡ, khoai mỡ chiên giòn.Khoai mỡ to, lớp vỏ sần sùi, có ít rễ nhỏ xung quanh. Bên trong thịt trắng, tím, ngọt, bùi và rất béo.', 1, 'Việt Nam', '2023-08-17', 64, 0);
INSERT INTO `ct_pr` VALUES ('prod97', '2023-01-19', '2023-04-06', 'Không có', 'Củ khoai môn có hàm lượng chất xơ và nhiều loại vitamin, khoáng chất dồi dào rất cần thiết cho sức khỏe con người. Khoai môn có lớp vỏ ngoài màu nâu, phần thịt bên trong màu trắng kết hợp với nhiều đốm màu tím nhạt, có thể chế biến thành nhiều món ăn ngon, hấp dẫn.Khoai môn to, chất lượng, vỏ màu nâu, sần nhẹ, bên trọng thịt khoai môn bùi, béo và ngọt, có màu trắng cùng vài đường vân màu tím.', 0.5, 'Việt Nam', '2023-08-01', 87, 0);
INSERT INTO `ct_pr` VALUES ('prod98', '2023-01-03', '2023-04-01', 'Không có', 'Khoai tây củ to, chất lượng, lớp vỏ màu vàng nhạt, chứa nhiều tinh bột nên khi ăn sẽ cảm nhận được vị bùi, thơm ngon và ngọt của khoai tây. Khoai không bị hư, mọc mầm hay bị sượng.', 0.5, 'Việt Nam', '2023-10-07', 85, 0);
INSERT INTO `ct_pr` VALUES ('prod99', '2023-01-14', '2023-04-07', 'Không có', 'Khoai tây củ to, chất lượng, lớp vỏ màu vàng nhạt, chứa nhiều tinh bột nên khi ăn sẽ cảm nhận được vị bùi, thơm ngon và ngọt của khoai tây. Khoai không bị hư, mọc mầm hay bị sượng.', 0.5, 'Việt Nam', '2023-10-18', 166, 0);
INSERT INTO `ct_pr` VALUES ('prod100', '2023-01-19', '2023-04-05', 'Không có', 'Củ sắn hay còn gọi là củ đậu có kích thước to, tròn và trông khá giống với con quay, thịt chắc và nặng, có lớp vỏ xơ dai màu vàng. Phần thịt của củ sắn khá ngọt, nhiều nước và rất giòn, chấm với muối tôm và ướp lạnh ngon vô cùng.', 1, 'Việt Nam', '2023-06-19', 68, 0);

-- ----------------------------
-- Table structure for discount
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount`  (
  `ID_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SOLUONG` int NULL DEFAULT NULL,
  `CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `NUMBER` int NULL DEFAULT NULL,
  `TYPE` bit(1) NULL DEFAULT NULL,
  `MINIMUM` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of discount
-- ----------------------------
INSERT INTO `discount` VALUES ('v1', 9, 'GIAMGIA20K', 20000, b'0', 150000);
INSERT INTO `discount` VALUES ('v2', 23, 'GIAMGIA10K', 10000, b'0', 100000);
INSERT INTO `discount` VALUES ('v3', 29, 'GIAMGIA5', 5, b'1', 75000);
INSERT INTO `discount` VALUES ('v4', 4, 'GIAMGIA15K', 15000, b'0', 120000);
INSERT INTO `discount` VALUES ('v5', 5, 'GIAMGIA25K', 25000, b'0', 200000);

-- ----------------------------
-- Table structure for feed_back
-- ----------------------------
DROP TABLE IF EXISTS `feed_back`;
CREATE TABLE `feed_back`  (
  `ID_USER` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ID_PR` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `SCORESTAR` int NULL DEFAULT NULL,
  `TEXT` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DATE` date NULL DEFAULT NULL,
  INDEX `ID_USER`(`ID_USER` ASC) USING BTREE,
  INDEX `ID_PR`(`ID_PR` ASC) USING BTREE,
  CONSTRAINT `ID_PR` FOREIGN KEY (`ID_PR`) REFERENCES `product` (`ID_PR`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ID_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feed_back
-- ----------------------------
INSERT INTO `feed_back` VALUES ('user1', 'prod2', 2, 'Gạo dở, không ngon', '2022-03-12');
INSERT INTO `feed_back` VALUES ('user2', 'prod23', 2, 'Gạo khá dẻo ngon. Mua được giá khuyến mãi giá rẻ.', '2022-03-12');
INSERT INTO `feed_back` VALUES ('user3', 'prod13', 3, 'Gạo ngon thật, hỏng biết mua nhiều BHX có bán không, gạo ngon nên mua để dành.', '2022-03-12');
INSERT INTO `feed_back` VALUES ('user2', 'prod45', 5, 'Ngon, tuyệt dời', '2022-12-12');
INSERT INTO `feed_back` VALUES ('user1', 'prod23', 4, 'Xuất sắc, 10đ', '2022-03-12');
INSERT INTO `feed_back` VALUES ('user3', 'prod1', 5, ' dở, không ngon', '2021-05-12');
INSERT INTO `feed_back` VALUES ('user4', 'prod34', 5, 'Khoai lang mua 2 túi ghi 1ki nhưng một bịch có 900g', '2022-08-12');
INSERT INTO `feed_back` VALUES ('user5', 'prod2', 3, 'Gạo dở, không ngon', '2022-03-12');
INSERT INTO `feed_back` VALUES ('user1', 'prod2', 2, 'Chất lượng khoai kém', '2021-11-02');
INSERT INTO `feed_back` VALUES ('user2', 'prod45', 5, 'Ngon, tuyệt dời', '2022-12-12');
INSERT INTO `feed_back` VALUES ('user1', 'prod89', 4, 'Xuất sắc, 10đ', '2022-03-12');
INSERT INTO `feed_back` VALUES ('user3', 'prod100', 5, ' dở, không ngon', '2021-05-12');
INSERT INTO `feed_back` VALUES ('user4', 'prod57', 5, 'Khoai lang mua 2 túi ghi 1ki', '2022-08-12');
INSERT INTO `feed_back` VALUES ('user5', 'prod28', 3, 'Gạo dở, không ngon', '2022-03-12');
INSERT INTO `feed_back` VALUES ('user1', 'prod33', 2, 'Chất lượng khoai kém', '2021-12-23');
INSERT INTO `feed_back` VALUES ('user2', 'prod2', 4, 'Gạo ăn cũng ổn, sẽ mua thêm', '2022-02-11');
INSERT INTO `feed_back` VALUES ('user1', 'prod35', 5, 'Gạo ngon, sẽ mua thêm', '2022-12-13');
INSERT INTO `feed_back` VALUES ('user1', 'prod55', 4, 'Gạo ngon lại rẻ nhưng mà giao hơi chậm', '2022-12-13');
INSERT INTO `feed_back` VALUES ('user1', 'prod8', 5, 'Gạo ngon mọi người nên mua', '2022-12-13');
INSERT INTO `feed_back` VALUES ('user1', 'prod4', 5, 'Gạo ngon', '2022-12-14');
INSERT INTO `feed_back` VALUES ('user1', 'prod22', 5, 'Gạo ngon mà còn rẻ', '2022-12-14');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `ID_PR` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ID_IMG` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` bit(1) NULL DEFAULT NULL COMMENT '0:ảnh đại diện, 1:',
  PRIMARY KEY (`ID_IMG`) USING BTREE,
  INDEX `id_product`(`ID_PR` ASC) USING BTREE,
  CONSTRAINT `id_product` FOREIGN KEY (`ID_PR`) REFERENCES `product` (`ID_PR`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (NULL, '', '', NULL);
INSERT INTO `image` VALUES ('prod1', 'm1Coop01', 'ImageproductNew/Gao/coop-select/banh-hoi-gao-lut-coop-select-300g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod2', 'm1Coop02', 'ImageproductNew/Gao/coop-select/gao-dai-thom-8-coop-select-5kg-1-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod3', 'm1Coop03', 'ImageproductNew/Gao/coop-select/gao-giong-nhat-coop-select-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod4', 'm1Coop04', 'ImageproductNew/Gao/coop-select/gao-nang-hoa-coop-select-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod5', 'm1Coop05', 'ImageproductNew/Gao/coop-select/gao-om-18-coop-select-5-kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod6', 'm1Coop06', 'ImageproductNew/Gao/coop-select/gao-thom-jasmine-coop-select-5kg1-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod7', 'm1Coop07', 'ImageproductNew/Gao/coop-select/gao-thom-st21-coop-select-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod8', 'm1Ecoba01', 'ImageproductNew/Gao/Ecoba/gao-huu-co-kim-me-gao-lut-ecoba-organic-1kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod9', 'm1Ecoba02', 'ImageproductNew/Gao/Ecoba/gao-huu-co-ngoc-me-ecoba-organic-1kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod10', 'm1Ecoba03', 'ImageproductNew/Gao/Ecoba/gao-huu-co-sakura-ecoba-organic-1kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod11', 'm1Finest01', 'ImageproductNew/Gao/Finest/gao-lut-do-coop-finest-1kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod12', 'm1Finest02', 'ImageproductNew/Gao/Finest/gao-lut-tim-than-coop-finest-1kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod13', 'm1Finest03', 'ImageproductNew/Gao/Finest/gao-thai-hommali-coop-finest-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod14', 'm1Finest04', 'ImageproductNew/Gao/Finest/gao-thom-st24-coop-finest-2kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod15', 'm1Finest05', 'ImageproductNew/Gao/Finest/gao-thom-st25-coop-finest-7-kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod16', 'm1Finest06', 'ImageproductNew/Gao/Finest/gao-thom-st25-thuong-hang-coop-finest-2kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod17', 'm1Gaolut01', 'ImageproductNew/Gao/Gao-lut/gao-huyet-rong-lotus-rice-nutrichoice-hop-0-5kg-202103040832315314_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod18', 'm1Gaolut02', 'ImageproductNew/Gao/Gao-lut/gao-lut-do-ong-cu-tui-1kg-202103040826290886_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod19', 'm1Gaolut03', 'ImageproductNew/Gao/Gao-lut/gao-lut-do-simply-1kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod20', 'm1Gaolut04', 'ImageproductNew/Gao/Gao-lut/gao-lut-home-rice-tui-2kg-202103040827108785_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod21', 'm1Gaolut05', 'ImageproductNew/Gao/Gao-lut/gao-lut-huu-co-hoa-nang-hop-2kg-202103050141386641_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod22', 'm1Gaolut06', 'ImageproductNew/Gao/Gao-lut/gao-lut-ita-rice-2kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod23', 'm1Gaolut07', 'ImageproductNew/Gao/Gao-lut/gao-lut-jasmine-huong-lai-hat-chia-lotus-rice-nutrichoice-hop-0-5kg-202206080908113446_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod24', 'm1Gaolut08', 'ImageproductNew/Gao/Gao-lut/gao-tim-than-ong-tho-tui-1kg-202105201437552781_300x300.jpeg', b'0');
INSERT INTO `image` VALUES ('prod25', 'm1HNT01', 'ImageproductNew/Gao/Hat-ngoc-troi/gao-hat-ngoc-troi-bach-duong-bich-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod26', 'm1HNT02', 'ImageproductNew/Gao/Hat-ngoc-troi/gao-hat-ngoc-troi-thien-long-bich-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod27', 'm1HNT03', 'ImageproductNew/Gao/Hat-ngoc-troi/gao-thom-hat-ngoc-troi-thien-vuong-bich-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod28', 'm1LacViet01', 'ImageproductNew/Gao/Lac-Viet/gao-lac-viet-de-nhat-st25-tui-5kg-202210110941589891_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod29', 'm1LacViet02', 'ImageproductNew/Gao/Lac-Viet/gao-lac-viet-deo-thom-st5-tui-5kg-202210110942352192_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod30', 'm1LacViet03', 'ImageproductNew/Gao/Lac-Viet/gao-lac-viet-hao-hang-st24-tui-5kg-202210110942572190_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod31', 'm1LacViet04', 'ImageproductNew/Gao/Lac-Viet/gao-lac-viet-huong-lua-tui-5kg-202205211715591470_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod32', 'm1LacViet05', 'ImageproductNew/Gao/Lac-Viet/gao-lac-viet-xk51-tui-5kg-202205211713507395_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod33', 'm1Meizan01', 'ImageproductNew/Gao/Meizan/gao-meizan-nang-thom-tui-5kg-202103040818518051_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod34', 'm1Meizan02', 'ImageproductNew/Gao/Meizan/gao-tam-thom-meizan-tui-5kg-202103040825529781_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod35', 'm1Natita01', 'ImageproductNew/Gao/natita/gao-dinh-duong-naita-family-2kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod36', 'm1Natita02', 'ImageproductNew/Gao/natita/gao-dinh-duong-naita-gold-2kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod37', 'm1VuaGao01', 'ImageproductNew/Gao/Vua-gao/gao-tam-song-hong-vua-gao-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod38', 'm1VuaGao02', 'ImageproductNew/Gao/Vua-gao/gao-thom-dam-da-vua-gao-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod39', 'm1VuaGao03', 'ImageproductNew/Gao/Vua-gao/gao-thom-huong-viet-vua-gao-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod40', 'm1VuaGao04', 'ImageproductNew/Gao/Vua-gao/gao-thom-lang-ta-vua-gao-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod41', 'm1VuaGao05', 'ImageproductNew/Gao/Vua-gao/gao-thom-vua-gao-huong-viet-tui-5kg-202105041532553509_300x300.jpeg', b'0');
INSERT INTO `image` VALUES ('prod42', 'm1VuaGao06', 'ImageproductNew/Gao/Vua-gao/gao-thom-vua-gao-lang-ta-tui-5kg-202105050824360176_300x300.jpeg', b'0');
INSERT INTO `image` VALUES ('prod43', 'm1VuaGao07', 'ImageproductNew/Gao/Vua-gao/gao-trang-tu-tam-vua-gao-5kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod44', 'm21', 'ImageproductNew/Nep/gao-nep-cai-hoa-vang-coop-select-1kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod53', 'm210', 'ImageproductNew/Nep/nep-sap-thom-ong-cu-tui-1kg-202103131613052927_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod54', 'm211', 'ImageproductNew/Nep/nep-sap-vinh-hien-tui-1kg-202103040826093614_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod55', 'm212', 'ImageproductNew/Nep/nep-thom-giong-thai-coop-select-1kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod56', 'm213', 'ImageproductNew/Nep/nep-thom-meizan-tui-1kg-202103040801442668_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod45', 'm22', 'ImageproductNew/Nep/gao-nep-cai-hoa-vang-ngoc-hoan-1kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod46', 'm23', 'ImageproductNew/Nep/nep-bac-viet-san-tui-1kg-202103040810147166_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod47', 'm24', 'ImageproductNew/Nep/nep-cai-hoa-vang-ong-cu-tui-1kg-202103131631574575_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod48', 'm25', 'ImageproductNew/Nep/nep-cai-hoa-vang-pmt-tui-1kg-202103040814148193_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod49', 'm26', 'ImageproductNew/Nep/nep-cai-hoa-vang-vinh-hien-tui-1kg-202103040830355507_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod50', 'm27', 'ImageproductNew/Nep/nep-chum-vinh-hien-tui-1kg-202103201002091467_300x300.jpeg', b'0');
INSERT INTO `image` VALUES ('prod51', 'm28', 'ImageproductNew/Nep/nep-sap-meizan-long-an-1kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod52', 'm29', 'ImageproductNew/Nep/nep-sap-meizan-long-an-tui-1kg-202103040831023482_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod67', 'm31', 'ImageproductNew/Dau/bap-hat-dong-lanh-mama-food-goi-250g-202205171021267119_300x300.png', b'0');
INSERT INTO `image` VALUES ('prod76', 'm310', 'ImageproductNew/Dau/dau-ha-lan-xanh-vang-huu-co-markal-500g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod77', 'm311', 'ImageproductNew/Dau/dau-lang-do-cam-san-ho-huu-co-markal-500g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod78', 'm312', 'ImageproductNew/Dau/dau-nanh-xuan-hong-500g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod79', 'm313', 'ImageproductNew/Dau/dau-trang-bi-pmt-250g-202205241033102293_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod80', 'm314', 'ImageproductNew/Dau/dau-xanh-ca-xuan-hong-goi-300g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod81', 'm315', 'ImageproductNew/Dau/dau-xanh-hot-xuan-hong-goi-300g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod68', 'm32', 'ImageproductNew/Dau/bap-hat-dong-lanh-tran-gia-goi-500g-202205171036015761_300x300.png', b'0');
INSERT INTO `image` VALUES ('prod69', 'm33', 'ImageproductNew/Dau/dau-den-xanh-long-xuan-hong-goi-300g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod70', 'm34', 'ImageproductNew/Dau/dau-den-xanh-long-xuan-hong-goi-500g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod71', 'm35', 'ImageproductNew/Dau/dau-den-xuan-hong-goi-300g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod72', 'm36', 'ImageproductNew/Dau/dau-do-xuan-hong-goi-300g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod73', 'm37', 'ImageproductNew/Dau/dau-do-xuan-hong-goi-500g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod74', 'm38', 'ImageproductNew/Dau/dau-ga-huu-co-markal-500g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod75', 'm39', 'ImageproductNew/Dau/dau-ha-lan-dong-lanh-mama-food-goi-200g-202205171021061114_300x300.png', b'0');
INSERT INTO `image` VALUES ('prod57', 'm3BapSG01a', 'ImageproductNew/Dau/bap-hat-sg-food/bap-ngot-dong-lanh-sg-food-goi-500g-202205171020571740_300x300.png', b'0');
INSERT INTO `image` VALUES ('prod57', 'm3BapSG01b', 'ImageproductNew/Dau/bap-hat-sg-food/sellingpoint (6).jpg', b'1');
INSERT INTO `image` VALUES ('prod57', 'm3BapSG01c', 'ImageproductNew/Dau/bap-hat-sg-food/bap-ngot-dong-lanh-sg-food-goi-500g-202107282355270510.jpg', b'1');
INSERT INTO `image` VALUES ('prod58', 'm3DauDenVietSan01a', 'ImageproductNew/Dau/dau-den-viet-san/dau-den-viet-san-150g-202205231452334172_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod58', 'm3DauDenVietSan01b', 'ImageproductNew/Dau/dau-den-viet-san/sellingpoint (4).jpg', b'1');
INSERT INTO `image` VALUES ('prod58', 'm3DauDenVietSan01c', 'ImageproductNew/Dau/dau-den-viet-san/dau-den-viet-san-300g-201812041650361262.jpg', b'1');
INSERT INTO `image` VALUES ('prod59', 'm3DauDoPMT01a', 'ImageproductNew/Dau/dau-do-tay-pmt/dau-do-tay-pmt-250g-202205241030573406_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod59', 'm3DauDoPMT01b', 'ImageproductNew/Dau/dau-do-tay-pmt/sellingpoint (1).jpg', b'1');
INSERT INTO `image` VALUES ('prod59', 'm3DauDoPMT01c', 'ImageproductNew/Dau/dau-do-tay-pmt/dau-do-tay-pmt-goi-250g-201912121542045611.jpg', b'1');
INSERT INTO `image` VALUES ('prod59', 'm3DauDoPMT01d', 'ImageproductNew/Dau/dau-do-tay-pmt/dau-do-tay-pmt-goi-250g-201912121542052295.jpg', b'1');
INSERT INTO `image` VALUES ('prod60', 'm3DauDoVietSan01a', 'ImageproductNew/Dau/dau-do-viet-san/dau-do-viet-san-500g-201812041406447073.jpg', b'0');
INSERT INTO `image` VALUES ('prod60', 'm3DauDoVietSan01b', 'ImageproductNew/Dau/dau-do-viet-san/sellingpoint.jpg', b'1');
INSERT INTO `image` VALUES ('prod60', 'm3DauDoVietSan01c', 'ImageproductNew/Dau/dau-do-viet-san/dau-do-viet-san-500g-201812041406472077.jpg', b'1');
INSERT INTO `image` VALUES ('prod61', 'm3DauHaLanSG01a', 'ImageproductNew/Dau/dau-ha-lan-sg-food/dau-ha-lan-sg-food-goi-500g-202208090905319049_300x300.png', b'0');
INSERT INTO `image` VALUES ('prod61', 'm3DauHaLanSG01b', 'ImageproductNew/Dau/dau-ha-lan-sg-food/sellingpoint (5).jpg', b'1');
INSERT INTO `image` VALUES ('prod61', 'm3DauHaLanSG01c', 'ImageproductNew/Dau/dau-ha-lan-sg-food/dau-ha-lan-sg-food-goi-500g-202108161108273144.jpg', b'1');
INSERT INTO `image` VALUES ('prod62', 'm3DauHaLanTranGia01a', 'ImageproductNew/Dau/dau-ha-lan-tran-gia/dau-ha-lan-tran-gia-goi-400g-202205171021316328_300x300.png', b'0');
INSERT INTO `image` VALUES ('prod62', 'm3DauHaLanTranGia01b', 'ImageproductNew/Dau/dau-ha-lan-tran-gia/dau-ha-lan-tran-gia-goi-400g-202202170857265098.jpg', b'1');
INSERT INTO `image` VALUES ('prod62', 'm3DauHaLanTranGia01c', 'ImageproductNew/Dau/dau-ha-lan-tran-gia/dau-ha-lan-tran-gia-goi-500g-202108161056363034.jpg', b'1');
INSERT INTO `image` VALUES ('prod63', 'm3DauPhong01a', 'ImageproductNew/Dau/dau-phong/dau-phong-xuan-hong-goi-500g-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod63', 'm3DauPhong01b', 'ImageproductNew/Dau/dau-phong/dau-phong-viet-san-150g-201812041440239877.jpg', b'1');
INSERT INTO `image` VALUES ('prod64', 'm3DauTrangVietSan01a', 'ImageproductNew/Dau/dau-trang-viet-san/dau-trang-viet-san-500g-202205231521509286_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod64', 'm3DauTrangVietSan01b', 'ImageproductNew/Dau/dau-trang-viet-san/sellingpoint (1).jpg', b'1');
INSERT INTO `image` VALUES ('prod64', 'm3DauTrangVietSan01c', 'ImageproductNew/Dau/dau-trang-viet-san/dau-trang-viet-san-500g-201812041508342837.jpg', b'1');
INSERT INTO `image` VALUES ('prod66', 'm3DauXanh01a', 'ImageproductNew/Dau/dau-xanh-viet-san/dau-xanh-hat-viet-san-300g-202205231506157365_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod66', 'm3DauXanh01b', 'ImageproductNew/Dau/dau-xanh-viet-san/sellingpoint (2).jpg', b'1');
INSERT INTO `image` VALUES ('prod66', 'm3DauXanh01c', 'ImageproductNew/Dau/dau-xanh-viet-san/dau-xanh-hat-viet-san-300g-201812041531452886.jpg', b'1');
INSERT INTO `image` VALUES ('prod65', 'm3DauXanhKhongVo01a', 'ImageproductNew/Dau/dau-xanh-ko-vo-viet-san/dau-xanh-khong-vo-viet-san-150g-201812041433533926.jpg', b'0');
INSERT INTO `image` VALUES ('prod65', 'm3DauXanhKhongVo01b', 'ImageproductNew/Dau/dau-xanh-ko-vo-viet-san/sellingpoint (3).jpg', b'1');
INSERT INTO `image` VALUES ('prod65', 'm3DauXanhKhongVo01c', 'ImageproductNew/Dau/dau-xanh-ko-vo-viet-san/dau-xanh-khong-vo-viet-san-300g-201812041528035871.jpg', b'1');
INSERT INTO `image` VALUES ('prod82', 'm4BotBapM01a', 'ImageproductNew/Bot/Bot-bap-meizan/bot-bap-meizan1.jpg', b'0');
INSERT INTO `image` VALUES ('prod82', 'm4BotBapM01b', 'ImageproductNew/Bot/Bot-bap-meizan/bot-bap-meizan2.jpg', b'1');
INSERT INTO `image` VALUES ('prod82', 'm4BotBapM01c', 'ImageproductNew/Bot/Bot-bap-meizan/bot-bap-meizan3.jpg', b'1');
INSERT INTO `image` VALUES ('prod82', 'm4BotBapM01d', 'ImageproductNew/Bot/Bot-bap-meizan/bot-bap-meizan4.jpg', b'1');
INSERT INTO `image` VALUES ('prod83', 'm4BotBapT01a', 'ImageproductNew/Bot/Bot-bap-tan-san/bot-bap-tan-sang-goi-150g-202102060024474779.jpg', b'0');
INSERT INTO `image` VALUES ('prod83', 'm4BotBapT01b', 'ImageproductNew/Bot/Bot-bap-tan-san/bot-bap-tan-sang-goi-150g-202102060024480613.jpg', b'1');
INSERT INTO `image` VALUES ('prod83', 'm4BotBapT01c', 'ImageproductNew/Bot/Bot-bap-tan-san/bot-bap-tan-sang-goi-150g-202203211105049926.jpg', b'1');
INSERT INTO `image` VALUES ('prod84', 'm4BotMi01a', 'ImageproductNew/Bot/Bot-mi-dd-meizan/bot-mi-da-dung-meizan-1kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod84', 'm4BotMi01b', 'ImageproductNew/Bot/Bot-mi-dd-meizan/bot-mi-da-dung-meizan-cao-cap-goi-500g-202202121120164880.jpg', b'1');
INSERT INTO `image` VALUES ('prod84', 'm4BotMi01c', 'ImageproductNew/Bot/Bot-mi-dd-meizan/bot-mi-da-dung-meizan-goi-500g-201903221357212164.jpg', b'1');
INSERT INTO `image` VALUES ('prod84', 'm4BotMi01d', 'ImageproductNew/Bot/Bot-mi-dd-meizan/bot-mi-da-dung-meizan-goi-500g-201903221357213355.jpg', b'1');
INSERT INTO `image` VALUES ('prod85', 'm4BotNang01a', 'ImageproductNew/Bot/Bot-nang-tan-san/bot-nang-tan-sang-goi-400g-202102060020004073.jpg', b'0');
INSERT INTO `image` VALUES ('prod85', 'm4BotNang01b', 'ImageproductNew/Bot/Bot-nang-tan-san/bot-nang-tan-sang-goi-400g-202102060020008816.jpg', b'1');
INSERT INTO `image` VALUES ('prod85', 'm4BotNang01c', 'ImageproductNew/Bot/Bot-nang-tan-san/bot-nang-tan-sang-goi-400g-202203211534161306.jpg', b'1');
INSERT INTO `image` VALUES ('prod86', 'm4NguCocVD01a', 'ImageproductNew/Bot/Ngu-coc-viet-dai/bot-ngu-coc-an-kieng-viet-dai-bich-400g-202210201449349516.jpg', b'0');
INSERT INTO `image` VALUES ('prod86', 'm4NguCocVD01b', 'ImageproductNew/Bot/Ngu-coc-viet-dai/bot-ngu-coc-an-kieng-viet-dai-bich-400g-202210201449347237.jpg', b'1');
INSERT INTO `image` VALUES ('prod86', 'm4NguCocVD01c', 'ImageproductNew/Bot/Ngu-coc-viet-dai/bot-ngu-coc-an-kieng-viet-dai-bich-400g-202210201449355467.jpg', b'1');
INSERT INTO `image` VALUES ('prod86', 'm4NguCocVD01d', 'ImageproductNew/Bot/Ngu-coc-viet-dai/bot-ngu-coc-an-kieng-viet-dai-bich-400g-202210201449357388.jpg', b'1');
INSERT INTO `image` VALUES ('prod87', 'm4NguCocVina01a', 'ImageproductNew/Bot/Ngu-coc-vinacafe/ngu-coc-dinh-duong-vinacafe-bfast-bich-500g-202205210942462207_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod87', 'm4NguCocVina01b', 'ImageproductNew/Bot/Ngu-coc-vinacafe/ngu-coc-dinh-duong-vinacafe-bfast-bich-500g-202004241129534802.jpg', b'1');
INSERT INTO `image` VALUES ('prod87', 'm4NguCocVina01c', 'ImageproductNew/Bot/Ngu-coc-vinacafe/sellingpoint.jpg', b'1');
INSERT INTO `image` VALUES ('prod88', 'm4NguCocYum01a', 'ImageproductNew/Bot/Ngu-coc-yumfood/thuc-pham-bo-sung-ngu-coc-dinh-duong-yumfood-goi-500g-202010122202206323.jpg', b'0');
INSERT INTO `image` VALUES ('prod88', 'm4NguCocYum01b', 'ImageproductNew/Bot/Ngu-coc-yumfood/bot-bap-meizan-goi-1kg-202203241615294791.jpg', b'1');
INSERT INTO `image` VALUES ('prod88', 'm4NguCocYum01c', 'ImageproductNew/Bot/Ngu-coc-yumfood/thuc-pham-bo-sung-ngu-coc-dinh-duong-yumfood-goi-500g-202010122202245743.jpg', b'1');
INSERT INTO `image` VALUES ('prod89', 'm5BapMy01a', 'ImageproductNew/Khoai/bap-my/bap-my-sieu-ngot-coop-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod89', 'm5BapMy01b', 'ImageproductNew/Khoai/bap-my/bap-my-2-trai-202012282219112903.jpg', b'1');
INSERT INTO `image` VALUES ('prod89', 'm5BapMy01c', 'ImageproductNew/Khoai/bap-my/bap-my-tui-2-trai-tu-600g-tro-len-202205201551409025.jpg', b'1');
INSERT INTO `image` VALUES ('prod89', 'm5BapMy01d', 'ImageproductNew/Khoai/bap-my/bap-my-tui-2-trai-tu-600g-tro-len-202205201552148121.jpg', b'1');
INSERT INTO `image` VALUES ('prod90', 'm5BapNep01a', 'ImageproductNew/Khoai/bap-nep/bap-nep-cap-coop-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod90', 'm5BapNep01b', 'ImageproductNew/Khoai/bap-nep/bap-nep-cap-202207161545587500.jpg', b'1');
INSERT INTO `image` VALUES ('prod90', 'm5BapNep01c', 'ImageproductNew/Khoai/bap-nep/bap-nep-cap-202207161543300656.jpg', b'1');
INSERT INTO `image` VALUES ('prod90', 'm5BapNep01d', 'ImageproductNew/Khoai/bap-nep/bap-nep-cap-202207161543292519.jpg', b'1');
INSERT INTO `image` VALUES ('prod91', 'm5KhoaiLangMat01a', 'ImageproductNew/Khoai/khoai-lang-mat/khoai-lang-mat-tui-1kg-3-10-cu-202209180802068974_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod91', 'm5KhoaiLangMat01b', 'ImageproductNew/Khoai/khoai-lang-mat/khoai-lang-mat-tui-1kg-3-10-cu-202209180802403359.jpg', b'1');
INSERT INTO `image` VALUES ('prod91', 'm5KhoaiLangMat01c', 'ImageproductNew/Khoai/khoai-lang-mat/khoai-lang-nhat-tui-1kg-4-10-cu-202205201544144843.jpg', b'1');
INSERT INTO `image` VALUES ('prod91', 'm5KhoaiLangMat01d', 'ImageproductNew/Khoai/khoai-lang-mat/khoai-lang-nhat-tui-1kg-4-10-cu-202209060830277612.jpg', b'1');
INSERT INTO `image` VALUES ('prod92', 'm5KhoaiLangNhat01a', 'ImageproductNew/Khoai/khoai-lang-nhat/khoai-lang-nhat-tui-1kg-4-10-cu-202209060831213650_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod92', 'm5KhoaiLangNhat01b', 'ImageproductNew/Khoai/khoai-lang-nhat/khoai-lang-nhat-tui-1kg-4-10-cu-202205201543286468.jpg', b'1');
INSERT INTO `image` VALUES ('prod92', 'm5KhoaiLangNhat01c', 'ImageproductNew/Khoai/khoai-lang-nhat/khoai-lang-nhat-tui-1kg-4-10-cu-202205201544144843.jpg', b'1');
INSERT INTO `image` VALUES ('prod92', 'm5KhoaiLangNhat01d', 'ImageproductNew/Khoai/khoai-lang-nhat/khoai-lang-nhat-tui-1kg-4-10-cu-202209060830277612.jpg', b'1');
INSERT INTO `image` VALUES ('prod93', 'm5KhoaiLangTim01a', 'ImageproductNew/Khoai/khoai-lang-tim/khoai-lang-tim-giong-nhat-kg-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod93', 'm5KhoaiLangTim01b', 'ImageproductNew/Khoai/khoai-lang-tim/khoai-lang-tim-tui-1kg-4-10-cu-202209060830277612.jpg', b'1');
INSERT INTO `image` VALUES ('prod93', 'm5KhoaiLangTim01c', 'ImageproductNew/Khoai/khoai-lang-tim/khoai-lang-tim-tui-500g-202105051946310826.jpg', b'1');
INSERT INTO `image` VALUES ('prod94', 'm5KhoaiLangTrang01a', 'ImageproductNew/Khoai/khoai-lang-trang/khoai-lang-trang-tui-500g-202105061423227274.jpg', b'0');
INSERT INTO `image` VALUES ('prod95', 'm5KhoaiMi01a', 'ImageproductNew/Khoai/khoai-mi/khoai-mi.png', b'0');
INSERT INTO `image` VALUES ('prod96', 'm5KhoaiMo01a', 'ImageproductNew/Khoai/khoai-mo/khoai-mo-tui-1kg-1-2-cu-202209141012253686_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod97', 'm5KhoaiMon01a', 'ImageproductNew/Khoai/khoai-mon/khoai-mon-tui-500g-1-cu-202210211654522303_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod97', 'm5KhoaiMon01b', 'ImageproductNew/Khoai/khoai-mon/khoai-mon-tui-500g-1-cu-202205201542114062.jpg', b'1');
INSERT INTO `image` VALUES ('prod97', 'm5KhoaiMon01c', 'ImageproductNew/Khoai/khoai-mon/khoai-mon-tui-500g-1-cu-202205201538208669.jpg', b'1');
INSERT INTO `image` VALUES ('prod98', 'm5KhoaiTayBi01a', 'ImageproductNew/Khoai/khoai-tay-bi/khoai-tay-bi-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod98', 'm5KhoaiTayBi01b', 'ImageproductNew/Khoai/khoai-tay-bi/khoai-tay-bi-tui-500g-202101071039274313.jpg', b'1');
INSERT INTO `image` VALUES ('prod98', 'm5KhoaiTayBi01c', 'ImageproductNew/Khoai/khoai-tay-bi/khoai-tay-bi-tui-500g-202101071039277764.jpg', b'1');
INSERT INTO `image` VALUES ('prod98', 'm5KhoaiTayBi01d', 'ImageproductNew/Khoai/khoai-tay-bi/khoai-tay-bi-tui-500g-202101071039283648.jpg', b'1');
INSERT INTO `image` VALUES ('prod99', 'm5KhoaiTayDaLat01a', 'ImageproductNew/Khoai/khoai-tay-dalat/khoai-tay-da-lat-300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod99', 'm5KhoaiTayDaLat01b', 'ImageproductNew/Khoai/khoai-tay-dalat/khoai-tay-bi-tui-500g-202101071039283648.jpg', b'1');
INSERT INTO `image` VALUES ('prod99', 'm5KhoaiTayDaLat01c', 'ImageproductNew/Khoai/khoai-tay-dalat/khoai-tay-bi-tui-500g-202101071039277764.jpg', b'1');
INSERT INTO `image` VALUES ('prod100', 'm5San01a', 'ImageproductNew/Khoai/san/cu-san-tui-1kg-3-5-cu-202209060829526388_300x300.jpg', b'0');
INSERT INTO `image` VALUES ('prod100', 'm5San01b', 'ImageproductNew/Khoai/san/cu-san-tui-1kg-3-5-cu-202205201546346566.jpg', b'1');
INSERT INTO `image` VALUES ('prod100', 'm5San01c', 'ImageproductNew/Khoai/san/cu-san-tui-1kg-3-5-cu-202205201547355369.jpg', b'1');
INSERT INTO `image` VALUES ('prod100', 'm5San01d', 'ImageproductNew/Khoai/san/cu-san-tui-1kg-3-5-cu-202209060829022287.jpg', b'1');

-- ----------------------------
-- Table structure for like
-- ----------------------------
DROP TABLE IF EXISTS `like`;
CREATE TABLE `like`  (
  `ID_PR` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ID_USER` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  INDEX `FK_ID_PR`(`ID_PR` ASC) USING BTREE,
  INDEX `FK_ID_USER`(`ID_USER` ASC) USING BTREE,
  CONSTRAINT `FK_ID_PR` FOREIGN KEY (`ID_PR`) REFERENCES `product` (`ID_PR`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ID_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of like
-- ----------------------------
INSERT INTO `like` VALUES ('prod14', 'user2');
INSERT INTO `like` VALUES ('prod63', 'user2');
INSERT INTO `like` VALUES ('prod23', 'user4');
INSERT INTO `like` VALUES ('prod72', 'user4');
INSERT INTO `like` VALUES ('prod88', 'user4');
INSERT INTO `like` VALUES ('prod7', 'user1');
INSERT INTO `like` VALUES ('prod5', 'user1');
INSERT INTO `like` VALUES ('prod77', 'user1');
INSERT INTO `like` VALUES ('prod54', 'user1');
INSERT INTO `like` VALUES ('prod16', 'user1');
INSERT INTO `like` VALUES ('prod4', 'user1');
INSERT INTO `like` VALUES ('prod1', 'user1');
INSERT INTO `like` VALUES ('prod6', 'user1');
INSERT INTO `like` VALUES ('prod2', 'user1');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` tinyint NOT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `createAt` datetime NOT NULL DEFAULT current_timestamp,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 0, NULL, 'Login FALSE', 'user ABC', '2023-02-26 00:14:02', 0);
INSERT INTO `log` VALUES (2, 0, 'user7', 'LOGIN', 'LOGIN SUCCESS', '2023-02-26 00:23:51', 0);
INSERT INTO `log` VALUES (3, 2, NULL, 'LOGIN', 'LOGIN FALSE: baotaolao982023@gmail.com', '2023-02-26 13:35:57', 0);
INSERT INTO `log` VALUES (4, 0, 'user7', 'LOGIN', 'LOGIN SUCCESS', '2023-02-26 13:42:01', 0);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `ID_MENU` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NAME_MENU` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_MENU`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('m1', 'Gạo');
INSERT INTO `menu` VALUES ('m2', 'Nếp');
INSERT INTO `menu` VALUES ('m3', 'Các loại hạt');
INSERT INTO `menu` VALUES ('m4', 'Các loại bột');
INSERT INTO `menu` VALUES ('m5', 'Các loại củ, trái');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `ID_ORDERS` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PHONE` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `TIME_ORDERS` datetime NULL DEFAULT NULL COMMENT 'thời gian đặt hàng',
  `TIME_PICKUP` datetime NULL DEFAULT NULL COMMENT 'thời gian nhận hàng',
  `NOTE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ghi chú',
  `CONDITION` tinyint NULL DEFAULT NULL COMMENT '0: Đang chuẩn bị, 1:Đang giao, 2: Đã giao, 3:Giao không thành công',
  PRIMARY KEY (`ID_ORDERS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('orders1', 'Xuân Hoa', '0384837922', '20/234 Số 3,Linh Trung, Thủ Đức, Hồ Chí Mình', '2022-05-08 10:35:29', '2022-05-08 12:35:29', NULL, 1);
INSERT INTO `orders` VALUES ('orders10', 'Gia Bảo', '0380007922', '234 Số 3,Hoàng Dịu, Thủ Đức, Hồ Chí Mình', '2022-05-08 10:35:29', '2022-05-08 12:35:29', NULL, 0);
INSERT INTO `orders` VALUES ('orders11', 'Bảo Đặng', '0384837922', '20/234 Số 3,Linh Trung, Thủ Đức, Hồ Chí Mình', '2022-05-08 10:35:29', '2022-05-08 12:35:29', NULL, 0);
INSERT INTO `orders` VALUES ('orders12', 'Thanh Phụng', '0378482600', '230 Man Thiện, Tăng Nhơn Phú A, Thủ Đức, Hồ Chí Mình', '2023-01-02 02:35:07', '2023-01-02 08:00:00', ' Giao sớm nha', 4);
INSERT INTO `orders` VALUES ('orders13', 'Phạm Gia Bảo', '0378482600', '230 Man Thiện, Tăng Nhơn Phú A, Thủ Đức, Hồ Chí Mình', '2023-01-02 02:39:04', '2023-01-03 10:00:00', 'Hàng dở là trả lại đó nha má', 0);
INSERT INTO `orders` VALUES ('orders14', 'Hồ Thanh Dương', '0378482600', '230 Man Thiện, Tăng Nhơn Phú A, Thủ Đức, Hồ Chí Mình', '2023-01-02 02:45:45', '2023-01-02 08:00:00', 'hmmm', 4);
INSERT INTO `orders` VALUES ('orders15', 'Hà Anh Tuấn', '0378482600', '230 Man Thiện, Tăng Nhơn Phú A, Thủ Đức, Hồ Chí Mình', '2023-01-02 14:05:03', '2023-01-02 17:00:00', '', 4);
INSERT INTO `orders` VALUES ('orders16', 'Nguyễn Văn Anh', '0378482600', '230 Man Thiện, Tăng Nhơn Phú A, Thủ Đức, Hồ Chí Mình', '2023-01-03 21:48:29', '2023-01-04 19:00:00', 'Gạo thơm có thơm thiệt hông', 4);
INSERT INTO `orders` VALUES ('orders2', 'Hồ Thanh Dương', '0384800238', '1/23 Võ Văn Ngân,Thánh Gióng,Quận 5, Hồ Chí Mình', '2022-05-08 10:35:29', '2022-05-08 12:35:29', 'Đừng có giao lúc ngủ', 2);
INSERT INTO `orders` VALUES ('orders3', 'Hồ Thanh Dương', '0384834392', '230 Man Thiện, Tăng Nhơn Phú A, Thủ Đức, Hồ Chí Mình', '2022-05-08 10:35:29', '2022-05-08 12:35:29', 'Bắp lựa sống 1 tý', 1);
INSERT INTO `orders` VALUES ('orders4', 'Quỳnh Như', '0273467482', '20/234 Số 3,Linh Trung, Thủ Đức, Hồ Chí Mình', '2022-05-08 10:35:29', '2022-05-08 12:35:29', 'Cho xin 3 cái túi nilong', 2);
INSERT INTO `orders` VALUES ('orders5', 'Thanh Phụng', '0244348988', '23 Hiệp Bình, Võ Thị Sáu,Quận 5, Hồ Chí Mình', '2022-05-08 10:35:29', '2022-05-08 12:35:29', NULL, 3);
INSERT INTO `orders` VALUES ('orders6', 'Phạm Gia Bảo', '0777384922', '20/234 Số 3,Linh Trung, Thủ Đức, Hồ Chí Mình', '2022-03-12 10:35:29', '2022-03-12 12:35:29', NULL, 1);
INSERT INTO `orders` VALUES ('orders7', 'Phạm Gia Bảo', '0993420027', '23 Hiệp Bình, Võ Thị Sáu,Quận 5, Hồ Chí Mình', '2022-11-23 10:35:29', '2022-11-23 12:35:29', 'Khoai không hư nhá', 2);
INSERT INTO `orders` VALUES ('orders8', 'Thanh Phụng', '0456837922', '20/234 Số 3,Linh Trung, Thủ Đức, Hồ Chí Mình', '2022-05-08 10:35:29', '2022-05-08 12:35:29', NULL, 0);
INSERT INTO `orders` VALUES ('orders9', 'Hồ An', '0384833332', '234 Số 3,Văn Ngân, Thủ Đức, Hồ Chí Mình', '2022-05-08 10:35:29', '2022-05-08 12:35:29', NULL, 0);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ID_PR` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ID_MENU` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DISCOUNT` smallint NULL DEFAULT NULL,
  `PRICE` int NOT NULL,
  `NAME_PR` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_PR`) USING BTREE,
  INDEX `ID_MENU`(`ID_MENU` ASC) USING BTREE,
  CONSTRAINT `ID_MENU` FOREIGN KEY (`ID_MENU`) REFERENCES `menu` (`ID_MENU`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('prod1', 'm1', 20, 30000, 'Bánh hỏi gạo lứt Coop Select 300g');
INSERT INTO `product` VALUES ('prod10', 'm1', 20, 25000, 'Gạo hữu cơ Sakura Ecoba 1kg');
INSERT INTO `product` VALUES ('prod100', 'm5', 0, 20000, 'Củ sắn 1kg (3-5 củ)');
INSERT INTO `product` VALUES ('prod11', 'm1', 0, 25000, 'Gạo lứt đỏ Finest 1kg');
INSERT INTO `product` VALUES ('prod12', 'm1', 0, 38000, 'Gạo lứt tím than Finest 1kg');
INSERT INTO `product` VALUES ('prod13', 'm1', 0, 120000, 'Gạo Thái Hommali Finest 5kg');
INSERT INTO `product` VALUES ('prod14', 'm1', 0, 45000, 'Gạo thơm ST24 Finest 2kg');
INSERT INTO `product` VALUES ('prod15', 'm1', 0, 32000, 'Gạo thơm ST25 Finest 7kg');
INSERT INTO `product` VALUES ('prod16', 'm1', 20, 21000, 'Gạo thơm ST25 thượng hạng Finest 2kg');
INSERT INTO `product` VALUES ('prod17', 'm1', 0, 25000, 'Gạo lứt huyết Rồng 5kg');
INSERT INTO `product` VALUES ('prod18', 'm1', 0, 20000, 'Gạo lứt đồ Ông Cụ túi 1kg');
INSERT INTO `product` VALUES ('prod19', 'm1', 0, 20000, 'Gạo lứt đỏ Simply 1kg');
INSERT INTO `product` VALUES ('prod2', 'm1', 20, 30000, 'Gạo dài thơm 8 Coop Select 5kg');
INSERT INTO `product` VALUES ('prod20', 'm1', 0, 25000, 'Gạo lứt đỏ Home Rice 1kg');
INSERT INTO `product` VALUES ('prod21', 'm1', 0, 50000, 'Gạo lứt hữu cơ Hoa Nắng 2kg');
INSERT INTO `product` VALUES ('prod22', 'm1', 0, 40000, 'Gạo lứt Ita Rice 2kg');
INSERT INTO `product` VALUES ('prod23', 'm1', 0, 45000, 'Gạo lứt Jasmine hương lài hạt chia 2kg');
INSERT INTO `product` VALUES ('prod24', 'm1', 0, 20000, 'Gạo tím than Ông thọ 1kg');
INSERT INTO `product` VALUES ('prod25', 'm1', 0, 100000, 'Gạo hạt ngọc trời Bạch Dương 5kg');
INSERT INTO `product` VALUES ('prod26', 'm1', 0, 120000, 'Gạo hạt ngọc trời Thiên Long 5kg');
INSERT INTO `product` VALUES ('prod27', 'm1', 0, 80000, 'Gạo thơm hạt ngọc trời Thiên Vương 5kg');
INSERT INTO `product` VALUES ('prod28', 'm1', 0, 100000, 'Gạo Lạc Việt Đệ Nhất ST25 5kg');
INSERT INTO `product` VALUES ('prod29', 'm1', 0, 80000, 'Gạo Lạc Việt dẻo thơm ST5 5kg');
INSERT INTO `product` VALUES ('prod3', 'm1', 0, 100000, 'Gạo giống Nhật Coop Select 5kg');
INSERT INTO `product` VALUES ('prod30', 'm1', 0, 90000, 'Gạo Lạc Việt hảo hạng ST24 5kg');
INSERT INTO `product` VALUES ('prod31', 'm1', 0, 75000, 'Gạo Lạc Việt hương lúa 5kg');
INSERT INTO `product` VALUES ('prod32', 'm1', 0, 80000, 'Gạo Lạc Việt XK51 5kg');
INSERT INTO `product` VALUES ('prod33', 'm1', 0, 90000, 'Gạo Meizan Nàng Thơm 5kg');
INSERT INTO `product` VALUES ('prod34', 'm1', 0, 75000, 'Gạo Gạo Tấm Thơm Meizan 5kg');
INSERT INTO `product` VALUES ('prod35', 'm1', 0, 35000, 'Gạo dinh dưỡng Natita family 2kg');
INSERT INTO `product` VALUES ('prod36', 'm1', 0, 40000, 'Gạo dinh dưỡng Natita gold 2kg');
INSERT INTO `product` VALUES ('prod37', 'm1', 0, 100000, 'Gạo Tám sông Hồng Vua Gạo 5kg');
INSERT INTO `product` VALUES ('prod38', 'm1', 0, 80000, 'Gạo thơm đậm đà Vua Gạo 5kg');
INSERT INTO `product` VALUES ('prod39', 'm1', 0, 70000, 'Gạo thơm hương Việt Vua Gạo 5kg');
INSERT INTO `product` VALUES ('prod4', 'm1', 0, 79000, 'Gạo nàng hoa Coop Select 5kg');
INSERT INTO `product` VALUES ('prod40', 'm1', 0, 75000, 'Gạo thơm làng ta Vua Gạo 5kg');
INSERT INTO `product` VALUES ('prod41', 'm1', 0, 80000, 'Gạo thơm Vua Gạo Hương Việt 5kg');
INSERT INTO `product` VALUES ('prod42', 'm1', 0, 95000, 'Gạo thơm Vua Gạo Làng Ta 5kg');
INSERT INTO `product` VALUES ('prod43', 'm1', 0, 100000, 'Gạo trắng Từ Tâm Vua Gạo 5kg');
INSERT INTO `product` VALUES ('prod44', 'm2', 0, 20000, 'Gạo nếp Cái Hoa Vàng Coop Select 1kg');
INSERT INTO `product` VALUES ('prod45', 'm2', 0, 15000, 'Gạo nếp cái Hoa Vàng Ngọc Hoàng 1kg');
INSERT INTO `product` VALUES ('prod46', 'm2', 0, 20000, 'Gạo nếp Bắc Việt Việt San 1kg');
INSERT INTO `product` VALUES ('prod47', 'm2', 0, 25000, 'Gạo nếp Cái Hoa Vàng Ông Cụ 1kg');
INSERT INTO `product` VALUES ('prod48', 'm2', 0, 20000, 'Gạo nếp Cái Hoa Vàng PMT 1kg');
INSERT INTO `product` VALUES ('prod49', 'm2', 0, 17000, 'Gạo nếp Cái Hoa Vàng Vinh Hiển 1kg');
INSERT INTO `product` VALUES ('prod5', 'm1', 0, 90000, 'Gạo OM 18 Coop Select 5kg');
INSERT INTO `product` VALUES ('prod50', 'm2', 0, 15000, 'Gạo nếp Chùm Vinh Hiển 1kg');
INSERT INTO `product` VALUES ('prod51', 'm2', 0, 20000, 'Gạo nếp Sáp Meizan 1kg');
INSERT INTO `product` VALUES ('prod52', 'm2', 0, 18000, 'Gạo nếp Sáp Meizan Long An 1kg');
INSERT INTO `product` VALUES ('prod53', 'm2', 0, 16000, 'Gạo nếp Sáp thơm Ông Cụ 1kg');
INSERT INTO `product` VALUES ('prod54', 'm2', 10, 15000, 'Gạo nếp Sáp Vinh Hiển 1kg');
INSERT INTO `product` VALUES ('prod55', 'm2', 0, 20000, 'Gạo nếp thơm giống Thái Coop Select 1kg');
INSERT INTO `product` VALUES ('prod56', 'm2', 0, 19000, 'Gạo nếp thơm Meizan 1kg');
INSERT INTO `product` VALUES ('prod57', 'm3', 0, 19000, 'Bắp ngọt đông lạnh SGFood 500g');
INSERT INTO `product` VALUES ('prod58', 'm3', 0, 10000, 'Đậu đen Việt San 150g');
INSERT INTO `product` VALUES ('prod59', 'm3', 0, 17000, 'Đậu đỏ Tây PMT 250g');
INSERT INTO `product` VALUES ('prod6', 'm1', 0, 83000, 'Gạo thơm Jasmine Coop Select 5kg');
INSERT INTO `product` VALUES ('prod60', 'm3', 0, 25000, 'Đậu đỏ Việt San 500g');
INSERT INTO `product` VALUES ('prod61', 'm3', 0, 30000, 'Đậu Hà Lan SGFood 500g');
INSERT INTO `product` VALUES ('prod62', 'm3', 0, 35000, 'Đậu Hà Lan đông lạnh Trần Gia 400g');
INSERT INTO `product` VALUES ('prod63', 'm3', 0, 20000, 'Đậu Phộng Xuân Hồng 500g');
INSERT INTO `product` VALUES ('prod64', 'm3', 0, 35000, 'Đậu Trắng Việt San 500g');
INSERT INTO `product` VALUES ('prod65', 'm3', 0, 20000, 'Đậu Xanh không vỏ Việt San 150g');
INSERT INTO `product` VALUES ('prod66', 'm3', 0, 30000, 'Đậu Xanh Việt San 300g');
INSERT INTO `product` VALUES ('prod67', 'm3', 0, 30000, 'Bắp hạt đông lạnh MamaFood 250g');
INSERT INTO `product` VALUES ('prod68', 'm3', 0, 50000, 'Bắp hạt đông lạnh Trần Gia 500g');
INSERT INTO `product` VALUES ('prod69', 'm3', 0, 30000, 'Đậu đen xanh lòng Xuân Hồng 300g');
INSERT INTO `product` VALUES ('prod7', 'm1', 0, 79000, 'Gạo thơm ST21 Coop Select 5kg');
INSERT INTO `product` VALUES ('prod70', 'm3', 0, 50000, 'Đậu đen xanh lòng Xuân Hồng 500g');
INSERT INTO `product` VALUES ('prod71', 'm3', 0, 35000, 'Đậu đen Xuân Hồng 300g');
INSERT INTO `product` VALUES ('prod72', 'm3', 0, 30000, 'Đậu đỏ Xuân Hồng 300g');
INSERT INTO `product` VALUES ('prod73', 'm3', 0, 55000, 'Đậu đỏ Xuân Hồng 500g');
INSERT INTO `product` VALUES ('prod74', 'm3', 0, 150000, 'Đậu Gà hữu cơ Markal 500g');
INSERT INTO `product` VALUES ('prod75', 'm3', 0, 63000, 'Đậu Hà Lan đông lạnh MamaFood 200g');
INSERT INTO `product` VALUES ('prod76', 'm3', 0, 164000, 'Đậu Hà Lan Xanh Vàng hữu cơ Markal 500g');
INSERT INTO `product` VALUES ('prod77', 'm3', 0, 140000, 'Đậu lăng đỏ cam san hô hữu cơ Markal 500g');
INSERT INTO `product` VALUES ('prod78', 'm3', 0, 40000, 'Đậu nành Xuân Hồng 500g');
INSERT INTO `product` VALUES ('prod79', 'm3', 0, 23000, 'Đậu trắng bi PMT 250g');
INSERT INTO `product` VALUES ('prod8', 'm1', 0, 25000, 'Gạo hữu cơ Kim Mễ gạo lứt Ecoba 1kg');
INSERT INTO `product` VALUES ('prod80', 'm3', 0, 34000, 'Đậu xanh cà Xuân Hồng 300g');
INSERT INTO `product` VALUES ('prod81', 'm3', 0, 27000, 'Đậu xanh hột Xuân Hồng 300g');
INSERT INTO `product` VALUES ('prod82', 'm4', 0, 16000, 'Bột bắp Meizan 150g');
INSERT INTO `product` VALUES ('prod83', 'm4', 0, 18000, 'Bột bắp Tấn Sang 150g');
INSERT INTO `product` VALUES ('prod84', 'm4', 0, 60000, 'Bột mì đa dụng Meizan cao cấp 500g');
INSERT INTO `product` VALUES ('prod85', 'm4', 0, 45000, 'Bột năng Tấn Sang 400g');
INSERT INTO `product` VALUES ('prod86', 'm4', 0, 35000, 'Bột ngũ cốc ăn kiêng Việt Đại 400g');
INSERT INTO `product` VALUES ('prod87', 'm4', 0, 65000, 'Ngũ cốc dinh dưỡng VinaCafe B\'Fast 500g');
INSERT INTO `product` VALUES ('prod88', 'm4', 0, 42000, 'Thực phẩm bổ sung ngũ cốc dinh dưỡng YumFood 500g');
INSERT INTO `product` VALUES ('prod89', 'm5', 0, 27000, '2 trái bắp Mỹ (từ 600g trở lên)');
INSERT INTO `product` VALUES ('prod9', 'm1', 0, 30000, 'Gạo hữu cơ Ngọc Mễ Ecoba 1kg');
INSERT INTO `product` VALUES ('prod90', 'm5', 0, 27000, '2 trái bắp nếp (từ 500g trở lên)');
INSERT INTO `product` VALUES ('prod91', 'm5', 0, 27000, 'Khoai lang mật 1kg (3-5 củ)');
INSERT INTO `product` VALUES ('prod92', 'm5', 0, 35000, 'Khoai lang Nhật 1kg (3-5 củ)');
INSERT INTO `product` VALUES ('prod93', 'm5', 0, 25000, 'Khoai lang tím 1kg (3-5 củ)');
INSERT INTO `product` VALUES ('prod94', 'm5', 0, 28000, 'Khoai lang trắng 1kg (3-5 củ)');
INSERT INTO `product` VALUES ('prod95', 'm5', 0, 20000, 'Khoai mì 1kg (2-3 củ)');
INSERT INTO `product` VALUES ('prod96', 'm5', 0, 23000, 'Khoai mỡ 1kg (1-2 củ)');
INSERT INTO `product` VALUES ('prod97', 'm5', 0, 15000, 'Khoai môn 500g (1 củ)');
INSERT INTO `product` VALUES ('prod98', 'm5', 0, 16000, 'Khoai tây bi 500g');
INSERT INTO `product` VALUES ('prod99', 'm5', 0, 16000, 'Khoai tây Đà Lạt 500g');

-- ----------------------------
-- Table structure for sold_pr
-- ----------------------------
DROP TABLE IF EXISTS `sold_pr`;
CREATE TABLE `sold_pr`  (
  `ID_PR` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ID_USER` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TIME_SOLD` datetime NULL DEFAULT NULL COMMENT 'thời gian bán',
  `AMOUNT` int NULL DEFAULT NULL,
  `ID_ORDERS` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PRICE_HERE` int NOT NULL COMMENT 'giá hiện tại',
  INDEX `ID-PRODUCT`(`ID_PR` ASC) USING BTREE,
  INDEX `USER`(`ID_USER` ASC) USING BTREE,
  INDEX `ID-ORD`(`ID_ORDERS` ASC) USING BTREE,
  CONSTRAINT `ID-ORD` FOREIGN KEY (`ID_ORDERS`) REFERENCES `orders` (`ID_ORDERS`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ID-PRODUCT` FOREIGN KEY (`ID_PR`) REFERENCES `product` (`ID_PR`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sold_pr
-- ----------------------------
INSERT INTO `sold_pr` VALUES ('prod1', 'user1', '2022-11-27 15:35:29', 1, 'orders1', 20000);
INSERT INTO `sold_pr` VALUES ('prod23', 'user1', '2022-11-27 15:35:29', 1, 'orders1', 35000);
INSERT INTO `sold_pr` VALUES ('prod67', 'user1', '2022-11-27 15:35:29', 2, 'orders1', 15000);
INSERT INTO `sold_pr` VALUES ('prod1', 'user2', '2022-09-20 15:35:29', 1, 'orders6', 23000);
INSERT INTO `sold_pr` VALUES ('prod23', 'user2', '2022-09-20 15:35:29', 1, 'orders6', 20000);
INSERT INTO `sold_pr` VALUES ('prod17', 'user3', '2022-11-27 15:35:29', 2, 'orders2', 12000);
INSERT INTO `sold_pr` VALUES ('prod13', 'user3', '2022-11-27 15:35:29', 1, 'orders2', 30000);
INSERT INTO `sold_pr` VALUES ('prod99', 'user3', '2022-11-27 15:35:29', 3, 'orders2', 43000);
INSERT INTO `sold_pr` VALUES ('prod43', 'user4', '2022-11-02 15:35:29', 2, 'orders3', 10000);
INSERT INTO `sold_pr` VALUES ('prod13', 'user4', '2022-11-02 15:35:29', 1, 'orders3', 32000);
INSERT INTO `sold_pr` VALUES ('prod33', 'user4', '2022-11-02 15:35:29', 2, 'orders3', 19000);
INSERT INTO `sold_pr` VALUES ('prod73', 'user2', '2022-10-03 15:35:29', 5, 'orders7', 30000);
INSERT INTO `sold_pr` VALUES ('prod10', 'user2', '2022-10-03 15:35:29', 1, 'orders7', 79000);
INSERT INTO `sold_pr` VALUES ('prod27', 'user2', '2022-10-03 15:35:29', 2, 'orders7', 32000);
INSERT INTO `sold_pr` VALUES ('prod100', 'user5', '2022-10-23 15:35:29', 3, 'orders5', 22000);
INSERT INTO `sold_pr` VALUES ('prod43', 'user5', '2022-10-23 15:35:29', 2, 'orders5', 15000);
INSERT INTO `sold_pr` VALUES ('prod27', 'user5', '2022-10-23 15:35:29', 1, 'orders5', 54000);
INSERT INTO `sold_pr` VALUES ('prod43', 'user5', '2022-10-23 15:35:29', 2, 'orders5', 12000);
INSERT INTO `sold_pr` VALUES ('prod100', 'user5', '2022-10-23 15:35:29', 3, 'orders9', 22000);
INSERT INTO `sold_pr` VALUES ('prod43', 'user5', '2022-10-23 15:35:29', 2, 'orders9', 15000);
INSERT INTO `sold_pr` VALUES ('prod27', 'user5', '2022-10-23 15:35:29', 1, 'orders9', 54000);
INSERT INTO `sold_pr` VALUES ('prod43', 'user5', '2022-10-23 15:35:29', 2, 'orders10', 12000);
INSERT INTO `sold_pr` VALUES ('prod13', 'user4', '2022-11-02 15:35:29', 1, 'orders11', 32000);
INSERT INTO `sold_pr` VALUES ('prod33', 'user4', '2022-11-02 15:35:29', 2, 'orders8', 19000);
INSERT INTO `sold_pr` VALUES ('prod43', 'user3', '2022-09-20 15:35:29', 1, 'orders4', 97000);
INSERT INTO `sold_pr` VALUES ('prod12', 'user3', '2022-09-20 15:35:29', 3, 'orders4', 32000);
INSERT INTO `sold_pr` VALUES ('prod5', 'user1', '2023-01-02 02:35:07', 6, 'orders12', 90000);
INSERT INTO `sold_pr` VALUES ('prod14', 'user1', '2023-01-02 02:39:04', 1, 'orders13', 45000);
INSERT INTO `sold_pr` VALUES ('prod15', 'user1', '2023-01-02 02:39:04', 1, 'orders13', 32000);
INSERT INTO `sold_pr` VALUES ('prod9', 'user1', '2023-01-02 02:45:45', 1, 'orders14', 30000);
INSERT INTO `sold_pr` VALUES ('prod2', 'user1', '2023-01-02 14:05:03', 12, 'orders15', 30000);
INSERT INTO `sold_pr` VALUES ('prod2', 'user1', '2023-01-03 21:48:29', 3, 'orders16', 30000);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `ID_USER` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PASSW` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NAME_USER` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PHONE` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `EMAIL` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `BIRTHDAY` date NULL DEFAULT NULL,
  `DATE_SIGNUP` date NOT NULL,
  `SEX` bit(1) NULL DEFAULT NULL,
  `Decentralization` tinyint NOT NULL COMMENT '1: la admin',
  PRIMARY KEY (`ID_USER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('user1', '230 Man Thiện, Tăng Nhơn Phú A, Thủ Đức, Hồ Chí Mình', 'abc1232002', 'Nguyễn Văn Anh', '0378482600', 'vananh@gmail.com', '1999-05-20', '2021-12-02', b'0', 0);
INSERT INTO `user` VALUES ('user2', '1 Paster, Bạch Đằng,Quận 1, Hồ Chí Mình', 'le0020ab', 'Lê Thị Quyền', '0378271264', 'lethiquyen@gmail.com', '2000-08-20', '2022-03-05', b'1', 0);
INSERT INTO `user` VALUES ('user3', '210 Ngô Quyền, Hiệp Phú, Thủ Đức, Hồ Chí Mình', 'Huong232002', 'Hà Anh Tuấn', '0384782952', 'anhTuan@gmail.com', '1992-02-20', '2022-07-11', b'0', 0);
INSERT INTO `user` VALUES ('user4', '1/23 Võ Văn Ngân,Thánh Gióng,Quận 5, Hồ Chí Mình', 'duong220hee', 'Hồ Thành Dương', '0777271244', 'ThanhDuong04@gmail.com', '1990-02-10', '2022-08-05', b'1', 0);
INSERT INTO `user` VALUES ('user5', '20/234 Số 3,Linh Trung, Thủ Đức, Hồ Chí Mình', 'baotaokao', 'Phạm Gia Bảo', '0794824102', 'GiaBao@gmail.com', '2002-08-10', '2002-07-22', b'0', 0);
INSERT INTO `user` VALUES ('user6', '23 Hiệp Bình, Võ Thị Sáu,Quận 5, Hồ Chí Mình', 'admin23@@', 'Nguyễn Hồ Admin', '0779340238', 'AdminBHNFood04@gmail.com', '1990-01-01', '2022-01-01', b'0', 1);
INSERT INTO `user` VALUES ('user7', NULL, 'ImWU86R5yQyGjKEUEbYPx1BHJHU=', 'Phạm Gia Bảo ', '0357747175', 'baotaolao982023@gmail.com', NULL, '2023-02-24', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
