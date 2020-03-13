CREATE DATABASE  IF NOT EXISTS `ry` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ry`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ry
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `equ_card`
--

DROP TABLE IF EXISTS `equ_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equ_card` (
  `equ_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID 主键',
  `equ_guid` varchar(32) NOT NULL COMMENT 'Guid',
  `equ_serial` varchar(32) DEFAULT NULL COMMENT '设备流水号',
  `equ_code` varchar(32) DEFAULT NULL COMMENT '设备编号',
  `equ_name` varchar(128) DEFAULT NULL COMMENT '设备名称',
  `class_id` bigint DEFAULT NULL COMMENT '设备类别 设备分类表主键',
  `equ_count` decimal(32,2) DEFAULT NULL COMMENT '数量',
  `equ_sprice` decimal(32,2) DEFAULT NULL COMMENT '单价 元',
  `equ_price` decimal(32,2) DEFAULT NULL COMMENT '总价 元',
  `supplier_id` bigint DEFAULT NULL COMMENT '供应商 设备供应商表主键',
  `equ_brand` varchar(128) DEFAULT NULL COMMENT '品牌',
  `equ_param` varchar(1024) DEFAULT NULL COMMENT '规格型号',
  `dept_id` bigint DEFAULT NULL COMMENT '所属部门 部门表主键',
  `equ_admin` varchar(32) DEFAULT NULL COMMENT '设备管理员 用户表主键',
  `equ_time` date DEFAULT NULL COMMENT '设备采购时间',
  `equ_year` int DEFAULT NULL COMMENT '设备使用年限',
  `equ_status` char(1) DEFAULT '0' COMMENT '设备使用状态 （0-闲置 1-正常使用 2-故障 3-报废报损）',
  `equ_area` varchar(1024) DEFAULT NULL COMMENT '所在区域',
  `equ_attribute` varchar(32) DEFAULT NULL COMMENT '特种属性 字典选取',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除状态 （0代表存在 2代表删除）',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`equ_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='设备档案表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equ_card`
--

LOCK TABLES `equ_card` WRITE;
/*!40000 ALTER TABLE `equ_card` DISABLE KEYS */;
INSERT INTO `equ_card` VALUES (1,'b7414dc99e6a4a9ea823ec0b43ebbe7f','euq-202002140001','','空调',9,2.00,3000.00,6000.00,NULL,NULL,NULL,101,NULL,'2020-02-14',NULL,'0',NULL,'0',NULL,'0','admin','2020-02-14 13:41:18','admin','2020-02-14 17:21:29'),(2,'4fcf2fb56bf843f89006b9e010364916','euq-202002140002','','中央空调',9,1.00,10000.00,10000.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'0','admin','2020-02-14 14:46:50','admin','2020-02-14 16:20:42'),(3,'f169f070c40a4669b1d220f2b50090b3','euq-202002140003',NULL,'电梯空调',9,1.00,1000.00,1000.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'0','admin','2020-02-14 15:02:32','admin','2020-02-14 16:28:23');
/*!40000 ALTER TABLE `equ_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equ_class`
--

DROP TABLE IF EXISTS `equ_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equ_class` (
  `class_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID 主键',
  `class_guid` varchar(32) DEFAULT NULL COMMENT 'Guid',
  `parent_id` bigint DEFAULT '0' COMMENT '父级ID',
  `ancestors` varchar(128) DEFAULT NULL COMMENT '祖级列表',
  `class_name` varchar(128) DEFAULT NULL COMMENT '设备分类名称',
  `order_num` int DEFAULT NULL COMMENT '显示顺序',
  `status` char(1) DEFAULT '0' COMMENT '状态 （0正常 1停用）',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除状态 （0代表存在 2代表删除）',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='设备分类表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equ_class`
--

LOCK TABLES `equ_class` WRITE;
/*!40000 ALTER TABLE `equ_class` DISABLE KEYS */;
INSERT INTO `equ_class` VALUES (1,'b019d72c41854a0abb1b90d4c0e6bd8p',0,'0','设备分类',0,'0','','0','admin','2018-03-16 11:33:00','admin','2018-03-16 11:33:00'),(4,'38428cc2cf944acbb692e32876f4fc6d',1,'0,1','机电运行设备',1,'0',NULL,'2','admin','2020-02-12 16:45:49','admin','2020-02-12 16:46:10'),(5,'707bdcfbf7cf4481b87a87188aaff41b',1,'0,1','机电运行设备',1,'0',NULL,'0','admin','2020-02-12 16:46:50','admin','2020-02-12 17:10:40'),(6,'e4e1778202b8446080a070c558d0e18c',1,'0,1','行政资产设备',2,'0',NULL,'0','admin','2020-02-12 17:24:17',NULL,NULL),(7,'b9cdfd2cb1594637a3609d1777eebb13',1,'0,1','其他',3,'0',NULL,'2','admin','2020-02-13 10:56:31',NULL,NULL),(8,'8af8af6924bd4902818db4912cbbac5b',1,'0,1','其他分类',3,'0',NULL,'0','admin','2020-02-13 10:59:58',NULL,NULL),(9,'7e70902ac7384a4290280b981cecffa7',5,'0,1,5','空调',0,'0',NULL,'0','admin','2020-02-14 13:40:50',NULL,NULL);
/*!40000 ALTER TABLE `equ_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (4,'equ_class','设备分类表','EquClass','tree','com.ruoyi.system','system','class','设备分类','ruoyi','{\"treeName\":\"class_name\",\"treeParentCode\":\"parent_id\",\"treeCode\":\"class_id\"}','admin','2020-02-12 14:21:40','','2020-02-12 14:22:18',''),(5,'equ_card','设备档案表','EquCard','crud','com.ruoyi.system','system','euqcard','设备档案','ruoyi','{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}','admin','2020-02-14 09:55:37','','2020-02-14 10:30:51','');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (39,'4','class_id','ID 主键','bigint','Long','classId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(40,'4','class_guid','Guid','varchar(32)','String','classGuid','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(41,'4','parent_id','父级ID','bigint','Long','parentId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(42,'4','ancestors','祖级列表','varchar(128)','String','ancestors','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(43,'4','class_name','设备分类名称','varchar(128)','String','className','0','0',NULL,'1','1','1','1','LIKE','input','',5,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(44,'4','order_num','显示顺序','int','Long','orderNum','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(45,'4','status','状态 （0正常 1停用）','char(1)','String','status','0','0',NULL,'1','1','1','1','EQ','radio','',7,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(46,'4','remark','备注','varchar(512)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',8,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(47,'4','del_flag','删除状态 （0代表存在 2代表删除）','char(1)','String','delFlag','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',9,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(48,'4','create_by','创建者','varchar(32)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',10,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(49,'4','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',11,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(50,'4','update_by','更新者','varchar(32)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',12,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(51,'4','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',13,'admin','2020-02-12 14:21:40',NULL,'2020-02-12 14:22:18'),(52,'5','equ_id','ID 主键','bigint','Long','equId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(53,'5','equ_guid','Guid','varchar(32)','String','equGuid','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',2,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(54,'5','equ_code','设备编号','varchar(32)','String','equCode','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(55,'5','equ_name','设备名称','varchar(128)','String','equName','0','0',NULL,'1','1','1','1','LIKE','input','',4,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(56,'5','class_id','设备类别 设备分类表主键','bigint','Long','classId','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',5,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(57,'5','equ_count','数量','int','Long','equCount','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',6,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(58,'5','equ_sprice','单价 元','decimal(32,2)','Double','equSprice','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',7,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(59,'5','equ_price','总价 元','decimal(32,2)','Double','equPrice','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',8,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(60,'5','supplier_id','供应商 设备供应商表主键','bigint','Long','supplierId','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',9,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(61,'5','equ_brand','品牌','varchar(128)','String','equBrand','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',10,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(62,'5','equ_param','规格型号','varchar(1024)','String','equParam','0','0',NULL,'1','1',NULL,NULL,'EQ','textarea','',11,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(63,'5','dept_id','所属部门 部门表主键','bigint','Long','deptId','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',12,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(64,'5','equ_admin','设备管理员 用户表主键','varchar(32)','String','equAdmin','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',13,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(65,'5','equ_time','设备采购时间','date','Date','equTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',14,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(66,'5','equ_year','设备使用年限','int','Long','equYear','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',15,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(67,'5','equ_status','设备使用状态 （0-闲置 1-正常使用 2-故障 3-报废报损）','char(1)','String','equStatus','0','0',NULL,'1','1','1','1','EQ','radio','equ_status_type',16,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(68,'5','equ_area','所在区域','varchar(1024)','String','equArea','0','0',NULL,'1','1',NULL,NULL,'EQ','textarea','',17,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(69,'5','equ_attribute','特种属性 字典选取','varchar(32)','String','equAttribute','0','0',NULL,'1','1',NULL,NULL,'EQ','input','equ_attribute_type',18,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(70,'5','remark','备注','varchar(512)','String','remark','0','0',NULL,'1','1',NULL,NULL,'EQ','textarea','',19,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(71,'5','del_flag','删除状态 （0代表存在 2代表删除）','char(1)','String','delFlag','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',20,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(72,'5','create_by','创建人','varchar(32)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',21,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(73,'5','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,'1','1','EQ','datetime','',22,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(74,'5','update_by','更新人','varchar(32)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',23,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51'),(75,'5','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',24,'admin','2020-02-14 09:55:37',NULL,'2020-02-14 10:30:51');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.ruoyi.quartz.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0\'com.ruoyi.common.core.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,\�)\�xpt\0\0pppt\01t\00/10 * * * * ?t\0ryTask.ryNoParamst\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（无参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.ruoyi.quartz.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0\'com.ruoyi.common.core.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,\�)\�xpt\0\0pppt\01t\00/15 * * * * ?t\0ryTask.ryParams(\'ry\')t\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（有参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.ruoyi.quartz.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0\'com.ruoyi.common.core.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,\�)\�xpt\0\0pppt\01t\00/20 * * * * ?t\08ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)t\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（多参）t\03t\01x\0');
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler','STATE_ACCESS'),('RuoyiScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler','ITPC-20131207RQ1581672835976',1581673260331,15000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int DEFAULT NULL,
  `int_prop_2` int DEFAULT NULL,
  `long_prop_1` bigint DEFAULT NULL,
  `long_prop_2` bigint DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint DEFAULT NULL,
  `prev_fire_time` bigint DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',NULL,1581672840000,-1,5,'PAUSED','CRON',1581672837000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',NULL,1581672855000,-1,5,'PAUSED','CRON',1581672841000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',NULL,1581672860000,-1,5,'PAUSED','CRON',1581672844000,0,NULL,2,'');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','部门列表',0,'','','','0','0','admin','2018-03-16 11:33:00','admin','2020-02-11 09:04:18'),(101,100,'0,100','设备管理部门',1,'','','','0','0','admin','2018-03-16 11:33:00','admin','2020-02-11 09:03:04'),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(200,100,'0,100','合同管理部门',2,NULL,NULL,NULL,'0','0','admin','2020-02-12 15:33:14','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','关闭状态'),(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','新增操作'),(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','修改操作'),(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','删除操作'),(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','授权操作'),(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导出操作'),(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导入操作'),(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','强退操作'),(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','生成操作'),(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','清空操作'),(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),(100,0,'无','0','equ_attribute_type','','','Y','0','admin','2020-02-14 10:10:49','admin','2020-02-14 17:20:01',''),(101,1,'锅炉','1','equ_attribute_type','','','N','0','admin','2020-02-14 10:11:24','admin','2020-02-14 17:21:07',''),(102,2,'压力容器','2','equ_attribute_type','','','N','0','admin','2020-02-14 10:11:46','admin','2020-02-14 17:20:56',''),(103,3,'压力管道','3','equ_attribute_type','','','N','0','admin','2020-02-14 10:12:06','admin','2020-02-14 17:20:51',''),(104,4,'电梯','4','equ_attribute_type','','','N','0','admin','2020-02-14 10:12:17','admin','2020-02-14 17:20:46',''),(105,5,'起重机械','5','equ_attribute_type','','','N','0','admin','2020-02-14 10:12:29','admin','2020-02-14 17:20:41',''),(106,6,'客运索道','6','equ_attribute_type','','','N','0','admin','2020-02-14 10:12:44','admin','2020-02-14 17:20:36',''),(107,7,'大型游乐设施','7','equ_attribute_type','','','N','0','admin','2020-02-14 10:12:56','admin','2020-02-14 17:20:30',''),(108,0,'闲置','0','equ_status_type',NULL,NULL,'Y','0','admin','2020-02-14 10:14:23','',NULL,NULL),(109,1,'正常使用','1','equ_status_type','','','N','0','admin','2020-02-14 10:14:33','admin','2020-02-14 11:25:50',''),(110,2,'故障','2','equ_status_type','','','N','0','admin','2020-02-14 10:14:40','admin','2020-02-14 11:25:44',''),(111,3,'报损报废','3','equ_status_type','','','N','0','admin','2020-02-14 10:15:08','admin','2020-02-14 11:25:40',''),(112,8,'场（厂）内专用机动车辆','8','equ_attribute_type','','','N','0','admin','2020-02-14 17:20:16','admin','2020-02-14 17:20:24','');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','登录状态列表'),(100,'设备特种属性','equ_attribute_type','0','admin','2020-02-14 10:00:58','admin','2020-02-14 10:06:46','设备特种列表'),(101,'设备状态','equ_status_type','0','admin','2020-02-14 10:13:55','admin','2020-02-14 10:14:08','设备状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-10 19:18:19'),(101,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2020-02-10 19:33:58'),(102,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 08:49:08'),(103,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 09:57:38'),(104,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 14:04:01'),(105,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 14:55:53'),(106,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2020-02-11 15:13:43'),(107,'sbglya','127.0.0.1','内网IP','Chrome','Windows 10','1','密码输入错误1次','2020-02-11 15:14:12'),(108,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 15:14:35'),(109,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2020-02-11 15:16:36'),(110,'sbglya','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 15:16:47'),(111,'sbglya','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2020-02-11 15:17:05'),(112,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 15:17:09'),(113,'shgyla','127.0.0.1','内网IP','Chrome','Windows 10','1','用户不存在/密码错误','2020-02-11 15:35:17'),(114,'sbglya','127.0.0.1','内网IP','Chrome','Windows 10','1','密码输入错误1次','2020-02-11 15:35:32'),(115,'sbglya','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 15:35:41'),(116,'sbglya','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2020-02-11 15:35:59'),(117,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 15:36:02'),(118,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 16:14:14'),(119,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 16:44:55'),(120,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2020-02-11 16:45:43'),(121,'sbglya','127.0.0.1','内网IP','Chrome','Windows 10','1','用户不存在/密码错误','2020-02-11 16:46:02'),(122,'sbglya','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 16:46:11'),(123,'sbglya','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2020-02-11 16:46:48'),(124,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2020-02-11 16:46:53'),(125,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 16:46:57'),(126,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-11 19:15:55'),(127,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-12 13:47:59'),(128,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-12 14:19:49'),(129,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-12 14:25:49'),(130,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-12 14:31:53'),(131,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2020-02-12 14:40:12'),(132,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-12 14:40:17'),(133,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-12 15:24:59'),(134,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-12 16:59:44'),(135,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-12 17:15:56'),(136,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-12 19:08:29'),(137,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-13 10:56:07'),(138,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-13 13:38:44'),(139,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-13 15:34:12'),(140,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2020-02-13 19:22:18'),(141,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-13 19:22:23'),(142,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2020-02-13 19:23:13'),(143,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-13 19:42:27'),(144,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-14 09:55:20'),(145,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-14 10:43:23'),(146,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2020-02-14 14:41:18'),(147,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-14 14:41:27'),(148,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-14 15:33:38'),(149,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-14 15:36:01'),(150,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-14 16:04:29'),(151,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-02-14 17:34:41');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2013 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'#','','M','0','','fa fa-gear','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统管理目录'),(2,'系统监控',0,2,'#','','M','0','','fa fa-video-camera','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统监控目录'),(3,'系统工具',0,3,'#','','M','0','','fa fa-bars','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统工具目录'),(100,'用户管理',1,1,'/system/user','','C','0','system:user:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','用户管理菜单'),(101,'角色管理',1,2,'/system/role','','C','0','system:role:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','角色管理菜单'),(102,'菜单管理',1,3,'/system/menu','','C','0','system:menu:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单管理菜单'),(103,'部门管理',1,4,'/system/dept','','C','0','system:dept:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','部门管理菜单'),(104,'岗位管理',1,5,'/system/post','','C','0','system:post:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','岗位管理菜单'),(105,'字典管理',1,6,'/system/dict','','C','0','system:dict:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','字典管理菜单'),(106,'参数设置',1,7,'/system/config','','C','0','system:config:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','参数设置菜单'),(107,'通知公告',1,8,'/system/notice','','C','0','system:notice:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知公告菜单'),(108,'日志管理',1,9,'#','','M','0','','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','日志管理菜单'),(109,'在线用户',2,1,'/monitor/online','','C','0','monitor:online:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','在线用户菜单'),(110,'定时任务',2,2,'/monitor/job','','C','0','monitor:job:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','定时任务菜单'),(111,'数据监控',2,3,'/monitor/data','','C','0','monitor:data:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','数据监控菜单'),(112,'服务监控',2,3,'/monitor/server','','C','0','monitor:server:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','服务监控菜单'),(113,'表单构建',3,1,'/tool/build','','C','0','tool:build:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','表单构建菜单'),(114,'代码生成',3,2,'/tool/gen','','C','0','tool:gen:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','代码生成菜单'),(115,'系统接口',3,3,'/tool/swagger','','C','0','tool:swagger:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统接口菜单'),(500,'操作日志',108,1,'/monitor/operlog','','C','0','monitor:operlog:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','操作日志菜单'),(501,'登录日志',108,2,'/monitor/logininfor','','C','0','monitor:logininfor:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','登录日志菜单'),(1000,'用户查询',100,1,'#','','F','0','system:user:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1001,'用户新增',100,2,'#','','F','0','system:user:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1002,'用户修改',100,3,'#','','F','0','system:user:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1003,'用户删除',100,4,'#','','F','0','system:user:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1004,'用户导出',100,5,'#','','F','0','system:user:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1005,'用户导入',100,6,'#','','F','0','system:user:import','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1006,'重置密码',100,7,'#','','F','0','system:user:resetPwd','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1007,'角色查询',101,1,'#','','F','0','system:role:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1008,'角色新增',101,2,'#','','F','0','system:role:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1009,'角色修改',101,3,'#','','F','0','system:role:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1010,'角色删除',101,4,'#','','F','0','system:role:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1011,'角色导出',101,5,'#','','F','0','system:role:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1012,'菜单查询',102,1,'#','','F','0','system:menu:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1013,'菜单新增',102,2,'#','','F','0','system:menu:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1014,'菜单修改',102,3,'#','','F','0','system:menu:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1015,'菜单删除',102,4,'#','','F','0','system:menu:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1016,'部门查询',103,1,'#','','F','0','system:dept:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1017,'部门新增',103,2,'#','','F','0','system:dept:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1018,'部门修改',103,3,'#','','F','0','system:dept:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1019,'部门删除',103,4,'#','','F','0','system:dept:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1020,'岗位查询',104,1,'#','','F','0','system:post:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1021,'岗位新增',104,2,'#','','F','0','system:post:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1022,'岗位修改',104,3,'#','','F','0','system:post:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1023,'岗位删除',104,4,'#','','F','0','system:post:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1024,'岗位导出',104,5,'#','','F','0','system:post:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1025,'字典查询',105,1,'#','','F','0','system:dict:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1026,'字典新增',105,2,'#','','F','0','system:dict:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1027,'字典修改',105,3,'#','','F','0','system:dict:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1028,'字典删除',105,4,'#','','F','0','system:dict:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1029,'字典导出',105,5,'#','','F','0','system:dict:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1030,'参数查询',106,1,'#','','F','0','system:config:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1031,'参数新增',106,2,'#','','F','0','system:config:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1032,'参数修改',106,3,'#','','F','0','system:config:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1033,'参数删除',106,4,'#','','F','0','system:config:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1034,'参数导出',106,5,'#','','F','0','system:config:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1035,'公告查询',107,1,'#','','F','0','system:notice:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1036,'公告新增',107,2,'#','','F','0','system:notice:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1037,'公告修改',107,3,'#','','F','0','system:notice:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1038,'公告删除',107,4,'#','','F','0','system:notice:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1039,'操作查询',500,1,'#','','F','0','monitor:operlog:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1040,'操作删除',500,2,'#','','F','0','monitor:operlog:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1041,'详细信息',500,3,'#','','F','0','monitor:operlog:detail','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1042,'日志导出',500,4,'#','','F','0','monitor:operlog:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1043,'登录查询',501,1,'#','','F','0','monitor:logininfor:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1044,'登录删除',501,2,'#','','F','0','monitor:logininfor:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1045,'日志导出',501,3,'#','','F','0','monitor:logininfor:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1046,'账户解锁',501,4,'#','','F','0','monitor:logininfor:unlock','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1047,'在线查询',109,1,'#','','F','0','monitor:online:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1048,'批量强退',109,2,'#','','F','0','monitor:online:batchForceLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1049,'单条强退',109,3,'#','','F','0','monitor:online:forceLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1050,'任务查询',110,1,'#','','F','0','monitor:job:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1051,'任务新增',110,2,'#','','F','0','monitor:job:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1052,'任务修改',110,3,'#','','F','0','monitor:job:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1053,'任务删除',110,4,'#','','F','0','monitor:job:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1054,'状态修改',110,5,'#','','F','0','monitor:job:changeStatus','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1055,'任务详细',110,6,'#','','F','0','monitor:job:detail','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1056,'任务导出',110,7,'#','','F','0','monitor:job:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1057,'生成查询',114,1,'#','','F','0','tool:gen:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1058,'生成修改',114,2,'#','','F','0','tool:gen:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1059,'生成删除',114,3,'#','','F','0','tool:gen:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1060,'预览代码',114,4,'#','','F','0','tool:gen:preview','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1061,'生成代码',114,5,'#','','F','0','tool:gen:code','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(2000,'设备分类',2006,1,'/system/equclass','','C','0','system:equclass:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','设备分类菜单'),(2001,'设备分类查询',2000,1,'#','','F','0','system:equclass:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2002,'设备分类新增',2000,2,'#','','F','0','system:equclass:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2003,'设备分类修改',2000,3,'#','','F','0','system:equclass:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2004,'设备分类删除',2000,4,'#','','F','0','system:equclass:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2006,'设备管理',0,4,'#','menuItem','M','0','','fa fa-window-maximize','admin','2020-02-11 15:04:02','admin','2020-02-11 15:06:10',''),(2007,'设备档案',2006,2,'/system/euqcard','menuItem','C','0','system:euqcard:view','#','admin','2018-03-01 00:00:00','admin','2020-02-14 10:35:50','设备档案菜单'),(2008,'设备档案查询',2007,1,'#','menuItem','F','0','system:euqcard:list','#','admin','2018-03-01 00:00:00','admin','2020-02-14 10:36:20',''),(2009,'设备档案新增',2007,2,'#','','F','0','system:euqcard:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2010,'设备档案修改',2007,3,'#','','F','0','system:euqcard:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2011,'设备档案删除',2007,4,'#','','F','0','system:euqcard:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.editSave()','POST',1,'admin','研发部门','/system/dept/edit','127.0.0.1','内网IP','{\r\n  \"deptId\" : [ \"100\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"parentName\" : [ \"无\" ],\r\n  \"deptName\" : [ \"部门\" ],\r\n  \"orderNum\" : [ \"0\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 08:57:44'),(101,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','GET',1,'admin','研发部门','/system/dept/remove/102','127.0.0.1','内网IP','{ }','{\r\n  \"msg\" : \"存在下级部门,不允许删除\",\r\n  \"code\" : 301\r\n}',0,NULL,'2020-02-11 08:58:10'),(102,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','GET',1,'admin','研发部门','/system/dept/remove/109','127.0.0.1','内网IP','{ }','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 08:58:20'),(103,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','GET',1,'admin','研发部门','/system/dept/remove/108','127.0.0.1','内网IP','{ }','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 08:58:24'),(104,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','GET',1,'admin','研发部门','/system/dept/remove/102','127.0.0.1','内网IP','{ }','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 08:58:29'),(105,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.editSave()','POST',1,'admin','研发部门','/system/dept/edit','127.0.0.1','内网IP','{\r\n  \"deptId\" : [ \"101\" ],\r\n  \"parentId\" : [ \"100\" ],\r\n  \"parentName\" : [ \"部门\" ],\r\n  \"deptName\" : [ \"设备管理部门\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 09:03:04'),(106,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.editSave()','POST',1,'admin','研发部门','/system/dept/edit','127.0.0.1','内网IP','{\r\n  \"deptId\" : [ \"100\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"parentName\" : [ \"无\" ],\r\n  \"deptName\" : [ \"部门列表\" ],\r\n  \"orderNum\" : [ \"0\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 09:04:18'),(107,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.editSave()','POST',1,'admin','研发部门','/system/user/edit','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"1\" ],\r\n  \"deptId\" : [ \"101\" ],\r\n  \"userName\" : [ \"超级管理员\" ],\r\n  \"dept.deptName\" : [ \"设备管理部门\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"admin@163.com\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"sex\" : [ \"2\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"系统超级管理员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}','null',1,'不允许操作超级管理员用户','2020-02-11 09:09:05'),(108,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.editSave()','POST',1,'admin','研发部门','/system/user/edit','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 09:09:38'),(109,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\r\n  \"tables\" : [ \"equ_class\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 14:05:48'),(110,'代码生成',8,'com.ruoyi.generator.controller.GenController.genCode()','GET',1,'admin','研发部门','/tool/gen/genCode/equ_class','127.0.0.1','内网IP','{ }','null',0,NULL,'2020-02-11 14:06:32'),(111,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\r\n  \"tableId\" : [ \"1\" ],\r\n  \"tableName\" : [ \"equ_class\" ],\r\n  \"tableComment\" : [ \"设备分类表\" ],\r\n  \"className\" : [ \"EquClass\" ],\r\n  \"functionAuthor\" : [ \"liugang\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"1\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"ID 主键\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"classId\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"2\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"Guid guid\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"guid\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"3\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"父级ID 父级ID\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"parentId\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"4\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"祖级列表 祖级列表\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"ancestors\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 14:14:18'),(112,'代码生成',8,'com.ruoyi.generator.controller.GenController.genCode()','GET',1,'admin','研发部门','/tool/gen/genCode/equ_class','127.0.0.1','内网IP','{ }','null',0,NULL,'2020-02-11 14:14:47'),(113,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\r\n  \"tableId\" : [ \"1\" ],\r\n  \"tableName\" : [ \"equ_class\" ],\r\n  \"tableComment\" : [ \"设备分类表\" ],\r\n  \"className\" : [ \"EquClass\" ],\r\n  \"functionAuthor\" : [ \"liugang\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"1\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"ID 主键\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"classId\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"2\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"Guid guid\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"guid\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"3\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"父级ID 父级ID\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"parentId\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"4\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"祖级列表 祖级列表\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"ancestors\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 14:20:04'),(114,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\r\n  \"tableId\" : [ \"1\" ],\r\n  \"tableName\" : [ \"equ_class\" ],\r\n  \"tableComment\" : [ \"设备分类表\" ],\r\n  \"className\" : [ \"EquClass\" ],\r\n  \"functionAuthor\" : [ \"liugang\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"1\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"ID 主键\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"classId\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"2\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"Guid guid\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"guid\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"3\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"父级ID 父级ID\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"parentId\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"4\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"祖级列表 祖级列表\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"ancestors\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 14:20:24'),(115,'代码生成',8,'com.ruoyi.generator.controller.GenController.genCode()','GET',1,'admin','研发部门','/tool/gen/genCode/equ_class','127.0.0.1','内网IP','{ }','null',0,NULL,'2020-02-11 14:20:27'),(116,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\r\n  \"tableId\" : [ \"1\" ],\r\n  \"tableName\" : [ \"equ_class\" ],\r\n  \"tableComment\" : [ \"设备分类表\" ],\r\n  \"className\" : [ \"EquClass\" ],\r\n  \"functionAuthor\" : [ \"liugang\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"1\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"ID 主键\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"classId\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"2\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"Guid guid\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"guid\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"3\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"父级ID 父级ID\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"parentId\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"4\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"祖级列表 祖级列表\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"ancestors\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 14:39:25'),(117,'代码生成',8,'com.ruoyi.generator.controller.GenController.genCode()','GET',1,'admin','研发部门','/tool/gen/genCode/equ_class','127.0.0.1','内网IP','{ }','null',0,NULL,'2020-02-11 14:39:28'),(118,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"业务系统\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-building\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 15:04:03'),(119,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\r\n  \"menuId\" : [ \"2006\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"设备管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-building\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 15:05:35'),(120,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\r\n  \"menuId\" : [ \"2006\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"设备管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-window-maximize\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 15:06:10'),(121,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.editSave()','POST',1,'admin','研发部门','/system/user/edit','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"101\" ],\r\n  \"userName\" : [ \"设备管理员A\" ],\r\n  \"dept.deptName\" : [ \"设备管理部门\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"shglyya@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"设备管理员A\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 15:08:48'),(122,'角色管理',4,'com.ruoyi.web.controller.system.SysRoleController.cancelAuthUser()','POST',1,'admin','研发部门','/system/role/authUser/cancel','127.0.0.1','内网IP','{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"userId\" : [ \"2\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 15:10:46'),(123,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.addSave()','POST',1,'admin','研发部门','/system/role/add','127.0.0.1','内网IP','{\r\n  \"roleName\" : [ \"设备管理员\" ],\r\n  \"roleKey\" : [ \"euqadmin\" ],\r\n  \"roleSort\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"menuIds\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 15:12:26'),(124,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/2005','127.0.0.1','内网IP','{ }','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 15:12:42'),(125,'角色管理',4,'com.ruoyi.web.controller.system.SysRoleController.selectAuthUserAll()','POST',1,'admin','研发部门','/system/role/authUser/selectAll','127.0.0.1','内网IP','{\r\n  \"roleId\" : [ \"100\" ],\r\n  \"userIds\" : [ \"2\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 15:12:54'),(126,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.editSave()','POST',1,'admin','研发部门','/system/role/edit','127.0.0.1','内网IP','{\r\n  \"roleId\" : [ \"100\" ],\r\n  \"roleName\" : [ \"设备管理员\" ],\r\n  \"roleKey\" : [ \"euqadmin\" ],\r\n  \"roleSort\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"menuIds\" : [ \"2006,2000,2001,2002,2003,2004\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 15:13:22'),(127,'重置密码',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','GET',1,'admin','设备管理部门','/system/user/resetPwd/2','127.0.0.1','内网IP','{ }','\"system/user/resetPwd\"',0,NULL,'2020-02-11 15:16:18'),(128,'重置密码',2,'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()','POST',1,'admin','设备管理部门','/system/user/resetPwd','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"2\" ],\r\n  \"loginName\" : [ \"sbglya\" ],\r\n  \"password\" : [ \"sbglya\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 15:16:28'),(129,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','POST',1,'admin','设备管理部门','/tool/gen/remove','127.0.0.1','内网IP','{\r\n  \"ids\" : [ \"1\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 16:02:08'),(130,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','设备管理部门','/tool/gen/importTable','127.0.0.1','内网IP','{\r\n  \"tables\" : [ \"equ_class\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 16:02:18'),(131,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','设备管理部门','/tool/gen/edit','127.0.0.1','内网IP','{\r\n  \"tableId\" : [ \"2\" ],\r\n  \"tableName\" : [ \"equ_class\" ],\r\n  \"tableComment\" : [ \"设备分类表 \" ],\r\n  \"className\" : [ \"EquClass\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"13\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"ID 主键\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"classId\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"14\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"Guid\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"classGuid\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].isRequired\" : [ \"1\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"15\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"父级ID\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"parentId\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].isRequired\" : [ \"1\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"16\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"祖级列表\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"ancestors\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].isRequired\" : [ \"1\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"col','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-11 16:03:38'),(132,'代码生成',8,'com.ruoyi.generator.controller.GenController.genCode()','GET',1,'admin','设备管理部门','/tool/gen/genCode/equ_class','127.0.0.1','内网IP','{ }','null',0,NULL,'2020-02-11 16:04:27'),(133,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','null',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'class_guid\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.system.mapper.EquClassMapper.insertEquClass-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into equ_class          ( parent_id,                          class_name,             order_num,                                                    create_time )           values ( ?,                          ?,             ?,                                                    ? )\r\n### Cause: java.sql.SQLException: Field \'class_guid\' doesn\'t have a default value\n; Field \'class_guid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'class_guid\' doesn\'t have a default value','2020-02-11 19:16:23'),(134,'设备分类管理',2,'com.ruoyi.web.controller.system.EquClassController.changeStatus()','POST',1,'admin','设备管理部门','/system/equclass/changeStatus','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 13:48:15'),(135,'设备分类管理',2,'com.ruoyi.web.controller.system.EquClassController.changeStatus()','POST',1,'admin','设备管理部门','/system/equclass/changeStatus','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 13:48:28'),(136,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','POST',1,'admin','设备管理部门','/tool/gen/remove','127.0.0.1','内网IP','{\r\n  \"ids\" : [ \"2\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 14:20:09'),(137,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','设备管理部门','/tool/gen/importTable','127.0.0.1','内网IP','{\r\n  \"tables\" : [ \"equ_class\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 14:20:25'),(138,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','POST',1,'admin','设备管理部门','/tool/gen/remove','127.0.0.1','内网IP','{\r\n  \"ids\" : [ \"3\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 14:20:59'),(139,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','设备管理部门','/tool/gen/importTable','127.0.0.1','内网IP','{\r\n  \"tables\" : [ \"equ_class\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 14:21:40'),(140,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','设备管理部门','/tool/gen/edit','127.0.0.1','内网IP','{\r\n  \"tableId\" : [ \"4\" ],\r\n  \"tableName\" : [ \"equ_class\" ],\r\n  \"tableComment\" : [ \"设备分类表 \" ],\r\n  \"className\" : [ \"EquClass\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"39\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"ID 主键\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"classId\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"40\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"Guid\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"classGuid\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].isEdit\" : [ \"1\" ],\r\n  \"columns[1].isList\" : [ \"1\" ],\r\n  \"columns[1].isQuery\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"41\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"父级ID\" ],\r\n  \"columns[2].javaType\" : [ \"Long\" ],\r\n  \"columns[2].javaField\" : [ \"parentId\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"42\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"祖级列表\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"ancestors\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"EQ\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" : [ \"43\" ],\r\n  \"columns[4].sort\" : [ \"5\" ],\r\n  \"columns[4].columnComment\" : [ \"设备分类名称\" ],\r\n  \"co','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 14:22:18'),(141,'代码生成',8,'com.ruoyi.generator.controller.GenController.genCode()','GET',1,'admin','设备管理部门','/tool/gen/genCode/equ_class','127.0.0.1','内网IP','{ }','null',0,NULL,'2020-02-12 14:22:22'),(142,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','null',1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'class_guid\' at row 1\r\n### The error may involve com.ruoyi.system.mapper.EquClassMapper.insertEquClass-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into equ_class          ( class_guid,             parent_id,                          class_name,             order_num,                                                                 create_time )           values ( ?,             ?,                          ?,             ?,                                                                 ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'class_guid\' at row 1\n; Data truncation: Data too long for column \'class_guid\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'class_guid\' at row 1','2020-02-12 14:27:21'),(143,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','null',1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'class_guid\' at row 1\r\n### The error may involve com.ruoyi.system.mapper.EquClassMapper.insertEquClass-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into equ_class          ( class_guid,             parent_id,                          class_name,             order_num,                                                                 create_time )           values ( ?,             ?,                          ?,             ?,                                                                 ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'class_guid\' at row 1\n; Data truncation: Data too long for column \'class_guid\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'class_guid\' at row 1','2020-02-12 14:35:02'),(144,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 14:42:23'),(145,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"行政资产设备\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','null',1,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'== \'0\'\' at line 3\r\n### The error may exist in file [D:\\Program Files (x86)\\Project\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\EquClassMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select class_id, class_guid, parent_id, ancestors, class_name, order_num, status, remark, del_flag, create_by, create_time, update_by, update_time from equ_class         where class_name=? and parent_id = ? and del_flag == \'0\'\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'== \'0\'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'== \'0\'\' at line 3','2020-02-12 15:27:12'),(146,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"行政资产设备\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 15:29:51'),(147,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.addSave()','POST',1,'admin','设备管理部门','/system/dept/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"100\" ],\r\n  \"deptName\" : [ \"合同管理部门\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 15:33:14'),(148,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"新增设备分类\'机电运行设备\'失败，名称已存在\",\r\n  \"code\" : 500\r\n}',0,NULL,'2020-02-12 15:55:12'),(149,'设备分类',2,'com.ruoyi.web.controller.system.EquClassController.editSave()','POST',1,'admin','设备管理部门','/system/equclass/edit','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"2\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"parentName\" : [ \"设备分类\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 15:57:52'),(150,'设备分类',2,'com.ruoyi.web.controller.system.EquClassController.editSave()','POST',1,'admin','设备管理部门','/system/equclass/edit','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"3\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"parentName\" : [ \"设备分类\" ],\r\n  \"className\" : [ \"行政资产设备\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 15:57:58'),(151,'设备分类',2,'com.ruoyi.web.controller.system.EquClassController.editSave()','POST',1,'admin','设备管理部门','/system/equclass/edit','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"2\" ],\r\n  \"parentId\" : [ \"2\" ],\r\n  \"parentName\" : [ \"机电运行设备\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"修改设备分类\'机电运行设备\'失败，名称已存在\",\r\n  \"code\" : 500\r\n}',0,NULL,'2020-02-12 16:06:52'),(152,'设备分类',2,'com.ruoyi.web.controller.system.EquClassController.editSave()','POST',1,'admin','设备管理部门','/system/equclass/edit','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"2\" ],\r\n  \"parentId\" : [ \"2\" ],\r\n  \"parentName\" : [ \"机电运行设备\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"修改部门\'机电运行设备\'失败，上级分类不能是自己\",\r\n  \"code\" : 500\r\n}',0,NULL,'2020-02-12 16:11:32'),(153,'设备分类',2,'com.ruoyi.web.controller.system.EquClassController.editSave()','POST',1,'admin','设备管理部门','/system/equclass/edit','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"2\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"parentName\" : [ \"设备分类\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 16:12:01'),(154,'设备分类',3,'com.ruoyi.web.controller.system.EquClassController.remove()','GET',1,'admin','设备管理部门','/system/equclass/remove/3','127.0.0.1','内网IP','{ }','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 16:28:03'),(155,'设备分类',3,'com.ruoyi.web.controller.system.EquClassController.remove()','GET',1,'admin','设备管理部门','/system/equclass/remove/2','127.0.0.1','内网IP','{ }','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 16:28:07'),(156,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 16:45:50'),(157,'设备分类',2,'com.ruoyi.web.controller.system.EquClassController.editSave()','POST',1,'admin','设备管理部门','/system/equclass/edit','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"4\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"parentName\" : [ \"设备分类\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 16:46:10'),(158,'设备分类',3,'com.ruoyi.web.controller.system.EquClassController.remove()','GET',1,'admin','设备管理部门','/system/equclass/remove/4','127.0.0.1','内网IP','{ }','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 16:46:25'),(159,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 16:46:51'),(160,'设备分类',2,'com.ruoyi.web.controller.system.EquClassController.editSave()','POST',1,'admin','设备管理部门','/system/equclass/edit','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"5\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"parentName\" : [ \"设备分类\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 17:04:25'),(161,'设备分类',2,'com.ruoyi.web.controller.system.EquClassController.editSave()','POST',1,'admin','设备管理部门','/system/equclass/edit','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"5\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"parentName\" : [ \"设备分类\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"1\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 17:10:40'),(162,'设备分类管理',2,'com.ruoyi.web.controller.system.EquClassController.changeStatus()','POST',1,'admin','设备管理部门','/system/equclass/changeStatus','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"5\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 17:10:43'),(163,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"行政资产设备\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 17:24:16'),(164,'设备分类管理',2,'com.ruoyi.web.controller.system.EquClassController.changeStatus()','POST',1,'admin','设备管理部门','/system/equclass/changeStatus','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 19:08:43'),(165,'设备分类管理',2,'com.ruoyi.web.controller.system.EquClassController.changeStatus()','POST',1,'admin','设备管理部门','/system/equclass/changeStatus','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 19:08:46'),(166,'设备分类管理',2,'com.ruoyi.web.controller.system.EquClassController.changeStatus()','POST',1,'admin','设备管理部门','/system/equclass/changeStatus','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"5\" ],\r\n  \"status\" : [ \"1\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 19:31:29'),(167,'设备分类管理',2,'com.ruoyi.web.controller.system.EquClassController.changeStatus()','POST',1,'admin','设备管理部门','/system/equclass/changeStatus','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"5\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 19:31:32'),(168,'设备分类管理',2,'com.ruoyi.web.controller.system.EquClassController.changeStatus()','POST',1,'admin','设备管理部门','/system/equclass/changeStatus','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"5\" ],\r\n  \"status\" : [ \"1\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 19:31:36'),(169,'设备分类管理',2,'com.ruoyi.web.controller.system.EquClassController.changeStatus()','POST',1,'admin','设备管理部门','/system/equclass/changeStatus','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"5\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 19:32:03'),(170,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.changeStatus()','POST',1,'admin','设备管理部门','/system/user/changeStatus','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"2\" ],\r\n  \"status\" : [ \"1\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 19:32:09'),(171,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.editSave()','POST',1,'admin','设备管理部门','/system/user/edit','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"101\" ],\r\n  \"userName\" : [ \"设备管理员A\" ],\r\n  \"dept.deptName\" : [ \"设备管理部门\" ],\r\n  \"phonenumber\" : [ \"15222222222\" ],\r\n  \"email\" : [ \"sbglya@qq.com\" ],\r\n  \"loginName\" : [ \"sbglya\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"100\" ],\r\n  \"remark\" : [ \"设备管理员A\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"100\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 19:32:15'),(172,'设备分类管理',2,'com.ruoyi.web.controller.system.EquClassController.changeStatus()','POST',1,'admin','设备管理部门','/system/equclass/changeStatus','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"5\" ],\r\n  \"status\" : [ \"1\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 19:33:18'),(173,'设备分类管理',2,'com.ruoyi.web.controller.system.EquClassController.changeStatus()','POST',1,'admin','设备管理部门','/system/equclass/changeStatus','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"5\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-12 19:35:16'),(174,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"其他\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-13 10:56:31'),(175,'设备分类',3,'com.ruoyi.web.controller.system.EquClassController.remove()','GET',1,'admin','设备管理部门','/system/equclass/remove/7','127.0.0.1','内网IP','{ }','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-13 10:59:46'),(176,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"className\" : [ \"其他分类\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-13 10:59:58'),(177,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','设备管理部门','/tool/gen/importTable','127.0.0.1','内网IP','{\r\n  \"tables\" : [ \"equ_card\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 09:55:38'),(178,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','设备管理部门','/tool/gen/edit','127.0.0.1','内网IP','{\r\n  \"tableId\" : [ \"5\" ],\r\n  \"tableName\" : [ \"equ_card\" ],\r\n  \"tableComment\" : [ \"设备档案表\" ],\r\n  \"className\" : [ \"EquCard\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"52\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"ID 主键\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"equId\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"53\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"Guid\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"equGuid\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"54\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"设备编号\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"equCode\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"55\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"设备名称\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"equName\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"LIKE\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" : [ \"56\" ],\r\n  \"columns[4].sort\" : [ \"5\" ],\r\n  \"columns[4].columnComment\" : [ \"设备类别 设备分类表主键\" ],\r\n  \"columns[4].javaType\" : [ \"Long\" ],\r\n  \"columns[4].javaField\" : [ \"classId\" ],\r\n  \"columns[4].isInsert\" : [ \"1\" ],\r\n  \"columns[4].isEdit\" : [ \"1\" ],\r\n  \"columns[4].queryType\" :','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 09:59:39'),(179,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.addSave()','POST',1,'admin','设备管理部门','/system/dict/add','127.0.0.1','内网IP','{\r\n  \"dictName\" : [ \"设备特种属性\" ],\r\n  \"dictType\" : [ \"equ_attribute_ytpe\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:00:59'),(180,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.editSave()','POST',1,'admin','设备管理部门','/system/dict/edit','127.0.0.1','内网IP','{\r\n  \"dictId\" : [ \"100\" ],\r\n  \"dictName\" : [ \"设备特种属性\" ],\r\n  \"dictType\" : [ \"equ_attribute_ytpe\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"设备特种属性\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:02:39'),(181,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.editSave()','POST',1,'admin','设备管理部门','/system/dict/edit','127.0.0.1','内网IP','{\r\n  \"dictId\" : [ \"100\" ],\r\n  \"dictName\" : [ \"设备特种属性\" ],\r\n  \"dictType\" : [ \"equ_attribute_ytpe\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"设备特种列表\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:02:49'),(182,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.editSave()','POST',1,'admin','设备管理部门','/system/dict/edit','127.0.0.1','内网IP','{\r\n  \"dictId\" : [ \"100\" ],\r\n  \"dictName\" : [ \"设备特种属性\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"设备特种列表\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:06:46'),(183,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"锅炉\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"0\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:10:49'),(184,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"压力容器\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:11:24'),(185,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"压力管道\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:11:46'),(186,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"电梯\" ],\r\n  \"dictValue\" : [ \"3\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:12:06'),(187,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"起重机械\" ],\r\n  \"dictValue\" : [ \"4\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"4\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:12:18'),(188,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"客运索道\" ],\r\n  \"dictValue\" : [ \"5\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"5\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:12:29'),(189,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"大型游乐设施\" ],\r\n  \"dictValue\" : [ \"6\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"6\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:12:46'),(190,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"场（厂）内专用机动车辆\" ],\r\n  \"dictValue\" : [ \"7\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"7\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:12:57'),(191,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.addSave()','POST',1,'admin','设备管理部门','/system/dict/add','127.0.0.1','内网IP','{\r\n  \"dictName\" : [ \"设备状态\" ],\r\n  \"dictType\" : [ \"equ_status_type\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:13:55'),(192,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.editSave()','POST',1,'admin','设备管理部门','/system/dict/edit','127.0.0.1','内网IP','{\r\n  \"dictId\" : [ \"101\" ],\r\n  \"dictName\" : [ \"设备状态\" ],\r\n  \"dictType\" : [ \"equ_status_type\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"设备状态列表\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:14:09'),(193,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"闲置\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"equ_status_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"0\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:14:23'),(194,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"正常使用\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"equ_status_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:14:33'),(195,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"故障\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"equ_status_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:14:41'),(196,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"报损报废\" ],\r\n  \"dictValue\" : [ \"3\" ],\r\n  \"dictType\" : [ \"equ_status_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:15:08'),(197,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','设备管理部门','/tool/gen/edit','127.0.0.1','内网IP','{\r\n  \"tableId\" : [ \"5\" ],\r\n  \"tableName\" : [ \"equ_card\" ],\r\n  \"tableComment\" : [ \"设备档案表\" ],\r\n  \"className\" : [ \"EquCard\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"52\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"ID 主键\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"equId\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"53\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"Guid\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"equGuid\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"54\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"设备编号\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"equCode\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"55\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"设备名称\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"equName\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"LIKE\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" : [ \"56\" ],\r\n  \"columns[4].sort\" : [ \"5\" ],\r\n  \"columns[4].columnComment\" : [ \"设备类别 设备分类表主键\" ],\r\n  \"columns[4].javaType\" : [ \"Long\" ],\r\n  \"columns[4].javaField\" : [ \"classId\" ],\r\n  \"columns[4].isInsert\" : [ \"1\" ],\r\n  \"columns[4].isEdit\" : [ \"1\" ],\r\n  \"columns[4].queryType\" :','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:16:59'),(198,'代码生成',8,'com.ruoyi.generator.controller.GenController.genCode()','GET',1,'admin','设备管理部门','/tool/gen/genCode/equ_card','127.0.0.1','内网IP','{ }','null',0,NULL,'2020-02-14 10:17:03'),(199,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','设备管理部门','/system/menu/remove/2012','127.0.0.1','内网IP','{ }','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:21:11'),(200,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','设备管理部门','/tool/gen/edit','127.0.0.1','内网IP','{\r\n  \"tableId\" : [ \"5\" ],\r\n  \"tableName\" : [ \"equ_card\" ],\r\n  \"tableComment\" : [ \"设备档案表\" ],\r\n  \"className\" : [ \"EquCard\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"52\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"ID 主键\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"equId\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"53\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"Guid\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"equGuid\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"54\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"设备编号\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"equCode\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"55\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"设备名称\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"equName\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"LIKE\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" : [ \"56\" ],\r\n  \"columns[4].sort\" : [ \"5\" ],\r\n  \"columns[4].columnComment\" : [ \"设备类别 设备分类表主键\" ],\r\n  \"columns[4].javaType\" : [ \"Long\" ],\r\n  \"columns[4].javaField\" : [ \"classId\" ],\r\n  \"columns[4].isInsert\" : ','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:28:59'),(201,'代码生成',8,'com.ruoyi.generator.controller.GenController.genCode()','GET',1,'admin','设备管理部门','/tool/gen/genCode/equ_card','127.0.0.1','内网IP','{ }','null',0,NULL,'2020-02-14 10:29:05'),(202,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','设备管理部门','/tool/gen/edit','127.0.0.1','内网IP','{\r\n  \"tableId\" : [ \"5\" ],\r\n  \"tableName\" : [ \"equ_card\" ],\r\n  \"tableComment\" : [ \"设备档案表\" ],\r\n  \"className\" : [ \"EquCard\" ],\r\n  \"functionAuthor\" : [ \"ruoyi\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"columns[0].columnId\" : [ \"52\" ],\r\n  \"columns[0].sort\" : [ \"1\" ],\r\n  \"columns[0].columnComment\" : [ \"ID 主键\" ],\r\n  \"columns[0].javaType\" : [ \"Long\" ],\r\n  \"columns[0].javaField\" : [ \"equId\" ],\r\n  \"columns[0].isInsert\" : [ \"1\" ],\r\n  \"columns[0].queryType\" : [ \"EQ\" ],\r\n  \"columns[0].htmlType\" : [ \"input\" ],\r\n  \"columns[0].dictType\" : [ \"\" ],\r\n  \"columns[1].columnId\" : [ \"53\" ],\r\n  \"columns[1].sort\" : [ \"2\" ],\r\n  \"columns[1].columnComment\" : [ \"Guid\" ],\r\n  \"columns[1].javaType\" : [ \"String\" ],\r\n  \"columns[1].javaField\" : [ \"equGuid\" ],\r\n  \"columns[1].isInsert\" : [ \"1\" ],\r\n  \"columns[1].queryType\" : [ \"EQ\" ],\r\n  \"columns[1].htmlType\" : [ \"input\" ],\r\n  \"columns[1].dictType\" : [ \"\" ],\r\n  \"columns[2].columnId\" : [ \"54\" ],\r\n  \"columns[2].sort\" : [ \"3\" ],\r\n  \"columns[2].columnComment\" : [ \"设备编号\" ],\r\n  \"columns[2].javaType\" : [ \"String\" ],\r\n  \"columns[2].javaField\" : [ \"equCode\" ],\r\n  \"columns[2].isInsert\" : [ \"1\" ],\r\n  \"columns[2].isEdit\" : [ \"1\" ],\r\n  \"columns[2].isList\" : [ \"1\" ],\r\n  \"columns[2].isQuery\" : [ \"1\" ],\r\n  \"columns[2].queryType\" : [ \"EQ\" ],\r\n  \"columns[2].htmlType\" : [ \"input\" ],\r\n  \"columns[2].dictType\" : [ \"\" ],\r\n  \"columns[3].columnId\" : [ \"55\" ],\r\n  \"columns[3].sort\" : [ \"4\" ],\r\n  \"columns[3].columnComment\" : [ \"设备名称\" ],\r\n  \"columns[3].javaType\" : [ \"String\" ],\r\n  \"columns[3].javaField\" : [ \"equName\" ],\r\n  \"columns[3].isInsert\" : [ \"1\" ],\r\n  \"columns[3].isEdit\" : [ \"1\" ],\r\n  \"columns[3].isList\" : [ \"1\" ],\r\n  \"columns[3].isQuery\" : [ \"1\" ],\r\n  \"columns[3].queryType\" : [ \"LIKE\" ],\r\n  \"columns[3].htmlType\" : [ \"input\" ],\r\n  \"columns[3].dictType\" : [ \"\" ],\r\n  \"columns[4].columnId\" : [ \"56\" ],\r\n  \"columns[4].sort\" : [ \"5\" ],\r\n  \"columns[4].columnComment\" : [ \"设备类别 设备分类表主键\" ],\r\n  \"columns[4].javaType\" : [ \"Long\" ],\r\n  \"columns[4].javaField\" : [ \"classId\" ],\r\n  \"columns[4].isInsert\" : ','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:30:52'),(203,'代码生成',8,'com.ruoyi.generator.controller.GenController.genCode()','GET',1,'admin','设备管理部门','/tool/gen/genCode/equ_card','127.0.0.1','内网IP','{ }','null',0,NULL,'2020-02-14 10:30:55'),(204,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','设备管理部门','/system/menu/edit','127.0.0.1','内网IP','{\r\n  \"menuId\" : [ \"2007\" ],\r\n  \"parentId\" : [ \"2006\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"设备档案\" ],\r\n  \"url\" : [ \"/system/euqcard\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:euqCard:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:35:36'),(205,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','设备管理部门','/system/menu/edit','127.0.0.1','内网IP','{\r\n  \"menuId\" : [ \"2007\" ],\r\n  \"parentId\" : [ \"2006\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"设备档案\" ],\r\n  \"url\" : [ \"/system/euqcard\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:euqcard:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:35:50'),(206,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','设备管理部门','/system/menu/edit','127.0.0.1','内网IP','{\r\n  \"menuId\" : [ \"2008\" ],\r\n  \"parentId\" : [ \"2007\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"设备档案查询\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:euqcard:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 10:36:21'),(207,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"111\" ],\r\n  \"dictLabel\" : [ \"报损报废\" ],\r\n  \"dictValue\" : [ \"3\" ],\r\n  \"dictType\" : [ \"equ_status_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 11:25:40'),(208,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"110\" ],\r\n  \"dictLabel\" : [ \"故障\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"equ_status_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 11:25:45'),(209,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"109\" ],\r\n  \"dictLabel\" : [ \"正常使用\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"equ_status_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 11:25:50'),(210,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"101\" ],\r\n  \"dictLabel\" : [ \"压力容器\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 11:43:10'),(211,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"102\" ],\r\n  \"dictLabel\" : [ \"压力管道\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 11:43:13'),(212,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"103\" ],\r\n  \"dictLabel\" : [ \"电梯\" ],\r\n  \"dictValue\" : [ \"3\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 11:43:20'),(213,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"104\" ],\r\n  \"dictLabel\" : [ \"起重机械\" ],\r\n  \"dictValue\" : [ \"4\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"4\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 11:43:25'),(214,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"105\" ],\r\n  \"dictLabel\" : [ \"客运索道\" ],\r\n  \"dictValue\" : [ \"5\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"5\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 11:43:28'),(215,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"106\" ],\r\n  \"dictLabel\" : [ \"大型游乐设施\" ],\r\n  \"dictValue\" : [ \"6\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"6\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 11:43:31'),(216,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"107\" ],\r\n  \"dictLabel\" : [ \"场（厂）内专用机动车辆\" ],\r\n  \"dictValue\" : [ \"7\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"7\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 11:43:35'),(217,'设备档案',1,'com.ruoyi.web.controller.system.EquCardController.addSave()','POST',1,'admin','设备管理部门','/system/euqcard/add','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"5\" ],\r\n  \"equCode\" : [ \"\" ],\r\n  \"equName\" : [ \"\" ],\r\n  \"className\" : [ \"机电运行设备\" ],\r\n  \"equCount\" : [ \"\" ],\r\n  \"equSprice\" : [ \"\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','null',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'equ_guid\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.system.mapper.EquCardMapper.insertEquCard-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into equ_card          ( class_id,                                                                                                                                               equ_status,                                                                              create_time )           values ( ?,                                                                                                                                               ?,                                                                              ? )\r\n### Cause: java.sql.SQLException: Field \'equ_guid\' doesn\'t have a default value\n; Field \'equ_guid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'equ_guid\' doesn\'t have a default value','2020-02-14 12:53:42'),(218,'设备分类',1,'com.ruoyi.web.controller.system.EquClassController.addSave()','POST',1,'admin','设备管理部门','/system/equclass/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"5\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"orderNum\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 13:40:50'),(219,'设备档案',1,'com.ruoyi.web.controller.system.EquCardController.addSave()','POST',1,'admin','设备管理部门','/system/euqcard/add','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"1\" ],\r\n  \"equSprice\" : [ \"3000\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 13:41:17'),(220,'设备档案',1,'com.ruoyi.web.controller.system.EquCardController.addSave()','POST',1,'admin','设备管理部门','/system/euqcard/add','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"中央空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"1\" ],\r\n  \"equSprice\" : [ \"4000\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','null',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Parameter number 1 is not an OUT parameter\r\n### SQL: CALL GetSerialNo(?)\r\n### Cause: java.sql.SQLException: Parameter number 1 is not an OUT parameter\n; Parameter number 1 is not an OUT parameter; nested exception is java.sql.SQLException: Parameter number 1 is not an OUT parameter','2020-02-14 14:43:08'),(221,'设备档案',1,'com.ruoyi.web.controller.system.EquCardController.addSave()','POST',1,'admin','设备管理部门','/system/euqcard/add','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"中央空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"1\" ],\r\n  \"equSprice\" : [ \"4000\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','null',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Parameter number 1 is not an OUT parameter\r\n### SQL: CALL GetSerialNo(?)\r\n### Cause: java.sql.SQLException: Parameter number 1 is not an OUT parameter\n; Parameter number 1 is not an OUT parameter; nested exception is java.sql.SQLException: Parameter number 1 is not an OUT parameter','2020-02-14 14:44:31'),(222,'设备档案',1,'com.ruoyi.web.controller.system.EquCardController.addSave()','POST',1,'admin','设备管理部门','/system/euqcard/add','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"中央空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"1\" ],\r\n  \"equSprice\" : [ \"10000\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 14:46:50'),(223,'设备档案',1,'com.ruoyi.web.controller.system.EquCardController.addSave()','POST',1,'admin','设备管理部门','/system/euqcard/add','127.0.0.1','内网IP','{\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"电梯空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"1\" ],\r\n  \"equSprice\" : [ \"1000\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 15:02:32'),(224,'设备档案',5,'com.ruoyi.web.controller.system.EquCardController.export()','POST',1,'admin','设备管理部门','/system/euqcard/export','127.0.0.1','内网IP','{\r\n  \"equSerial\" : [ \"\" ],\r\n  \"equName\" : [ \"\" ],\r\n  \"equStatus\" : [ \"\" ],\r\n  \"params[beginCreateTime]\" : [ \"\" ],\r\n  \"params[endCreateTime]\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"570de7a8-1eeb-4de6-8fb6-5f75cbda03a5_euqcard.xlsx\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 15:06:00'),(225,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equAttribute\" : [ \"\" ]\r\n}','null',1,'','2020-02-14 15:59:09'),(226,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equAttribute\" : [ \"\" ]\r\n}','null',1,'','2020-02-14 16:07:41'),(227,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equAttribute\" : [ \"\" ]\r\n}','null',1,'','2020-02-14 16:08:10'),(228,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equAttribute\" : [ \"\" ]\r\n}','null',1,'','2020-02-14 16:13:23'),(229,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equAttribute\" : [ \"\" ]\r\n}','null',1,'','2020-02-14 16:14:51'),(230,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equAttribute\" : [ \"\" ]\r\n}','null',1,'','2020-02-14 16:16:52'),(231,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"1\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"1.0\" ],\r\n  \"equSprice\" : [ \"3000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 16:17:09'),(232,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"1\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"2.0\" ],\r\n  \"equSprice\" : [ \"3000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 16:18:19'),(233,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"2\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"中央空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"1.0\" ],\r\n  \"equSprice\" : [ \"10000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 16:20:42'),(234,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"3\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"电梯空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"1.0\" ],\r\n  \"equSprice\" : [ \"1000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 16:20:49'),(235,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"1\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"2.0\" ],\r\n  \"equSprice\" : [ \"3000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 16:25:33'),(236,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"3\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"电梯空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"1.0\" ],\r\n  \"equSprice\" : [ \"1000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 16:28:16'),(237,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"3\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"电梯空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"1.0\" ],\r\n  \"equSprice\" : [ \"1000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 16:28:23'),(238,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"1\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"equName\" : [ \"空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"2.0\" ],\r\n  \"equSprice\" : [ \"3000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 16:28:28'),(239,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"1\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"deptId\" : [ \"101\" ],\r\n  \"equName\" : [ \"空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"2.0\" ],\r\n  \"equSprice\" : [ \"3000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptName\" : [ \"设备管理部门\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 16:48:17'),(240,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"1\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"deptId\" : [ \"101\" ],\r\n  \"equName\" : [ \"空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"2.0\" ],\r\n  \"equSprice\" : [ \"3000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptName\" : [ \"设备管理部门\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 16:48:42'),(241,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"1\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"deptId\" : [ \"101\" ],\r\n  \"equName\" : [ \"空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"2.0\" ],\r\n  \"equSprice\" : [ \"3000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptName\" : [ \"设备管理部门\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"0\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 16:51:10'),(242,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"1\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"deptId\" : [ \"101\" ],\r\n  \"equName\" : [ \"空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"2.0\" ],\r\n  \"equSprice\" : [ \"3000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptName\" : [ \"设备管理部门\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"1\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:19:04'),(243,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"1\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"deptId\" : [ \"101\" ],\r\n  \"equName\" : [ \"空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"2.0\" ],\r\n  \"equSprice\" : [ \"3000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptName\" : [ \"设备管理部门\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"0\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:19:10'),(244,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"100\" ],\r\n  \"dictLabel\" : [ \"无\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"0\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:20:01'),(245,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','设备管理部门','/system/dict/data/add','127.0.0.1','内网IP','{\r\n  \"dictLabel\" : [ \"1\" ],\r\n  \"dictValue\" : [ \"8\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"8\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:20:17'),(246,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"112\" ],\r\n  \"dictLabel\" : [ \"场（厂）内专用机动车辆\" ],\r\n  \"dictValue\" : [ \"8\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"8\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:20:25'),(247,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"107\" ],\r\n  \"dictLabel\" : [ \"大型游乐设施\" ],\r\n  \"dictValue\" : [ \"7\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"7\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:20:31'),(248,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"106\" ],\r\n  \"dictLabel\" : [ \"客运索道\" ],\r\n  \"dictValue\" : [ \"6\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"6\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:20:36'),(249,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"105\" ],\r\n  \"dictLabel\" : [ \"起重机械\" ],\r\n  \"dictValue\" : [ \"5\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"5\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:20:41'),(250,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"104\" ],\r\n  \"dictLabel\" : [ \"电梯\" ],\r\n  \"dictValue\" : [ \"4\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"4\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:20:46'),(251,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"103\" ],\r\n  \"dictLabel\" : [ \"压力管道\" ],\r\n  \"dictValue\" : [ \"3\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:20:52'),(252,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"102\" ],\r\n  \"dictLabel\" : [ \"压力容器\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:20:57'),(253,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','设备管理部门','/system/dict/data/edit','127.0.0.1','内网IP','{\r\n  \"dictCode\" : [ \"101\" ],\r\n  \"dictLabel\" : [ \"锅炉\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"equ_attribute_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"N\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:21:07'),(254,'设备档案',2,'com.ruoyi.web.controller.system.EquCardController.editSave()','POST',1,'admin','设备管理部门','/system/euqcard/edit','127.0.0.1','内网IP','{\r\n  \"equId\" : [ \"1\" ],\r\n  \"classId\" : [ \"9\" ],\r\n  \"deptId\" : [ \"101\" ],\r\n  \"equName\" : [ \"空调\" ],\r\n  \"className\" : [ \"空调\" ],\r\n  \"equCount\" : [ \"2.0\" ],\r\n  \"equSprice\" : [ \"3000.0\" ],\r\n  \"supplierId\" : [ \"\" ],\r\n  \"equBrand\" : [ \"\" ],\r\n  \"equParam\" : [ \"\" ],\r\n  \"deptName\" : [ \"设备管理部门\" ],\r\n  \"equAdmin\" : [ \"\" ],\r\n  \"equTime\" : [ \"2020-02-14\" ],\r\n  \"equYear\" : [ \"\" ],\r\n  \"equArea\" : [ \"\" ],\r\n  \"equAttribute\" : [ \"0\" ],\r\n  \"equStatus\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}','{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}',0,NULL,'2020-02-14 17:21:28');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(2,'se','项目经理',2,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(3,'hr','人力资源',3,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(4,'user','普通员工',4,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'管理员','admin',1,'1','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员'),(2,'普通角色','common',2,'2','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','普通角色'),(100,'设备管理员','euqadmin',3,'1','0','0','admin','2020-02-11 15:12:25','admin','2020-02-11 15:13:21','');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,1061),(100,2000),(100,2001),(100,2002),(100,2003),(100,2004),(100,2006);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,101,'admin','超级管理员','00','admin@163.com','15111111111','2','','29c67a30398638269fe600f73a054934','111111','0','0','127.0.0.1','2020-02-14 17:34:41','admin','2018-03-16 11:33:00','admin','2020-02-14 17:34:41','管理员'),(2,101,'sbglya','设备管理员A','00','sbglya@qq.com','15222222222','0','','f9c8d757a1bc787372d34cb0309266bf','2854dd','0','0','127.0.0.1','2020-02-11 16:46:11','admin','2018-03-16 11:33:00','admin','2020-02-12 19:32:15','设备管理员A');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
INSERT INTO `sys_user_online` VALUES ('cbf4c698-6a94-408d-ba86-b1e4182ee9f0','admin','设备管理部门','127.0.0.1','内网IP','Chrome','Windows 10','on_line','2020-02-14 16:02:50','2020-02-14 17:40:53',1800000);
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,100);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-14 17:42:00
