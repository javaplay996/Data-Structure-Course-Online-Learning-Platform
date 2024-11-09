/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - ssm64g10
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm64g10` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm64g10`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssm64g10/upload/picture1.jpg');
insert  into `config`(`id`,`name`,`value`) values (2,'picture2','http://localhost:8080/ssm64g10/upload/picture2.jpg');
insert  into `config`(`id`,`name`,`value`) values (3,'picture3','http://localhost:8080/ssm64g10/upload/picture3.jpg');
insert  into `config`(`id`,`name`,`value`) values (6,'homepage',NULL);

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

/*Table structure for table `jiaoshi` */

DROP TABLE IF EXISTS `jiaoshi`;

CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gonghao` varchar(200) NOT NULL COMMENT '工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) NOT NULL COMMENT '教师姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `zhicheng` varchar(200) DEFAULT NULL COMMENT '职称',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gonghao` (`gonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='教师';

/*Data for the table `jiaoshi` */

insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`) values (21,'2021-04-29 17:56:38','教师1','123456','教师姓名1','男','职称1','13823888881','773890001@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`) values (22,'2021-04-29 17:56:38','教师2','123456','教师姓名2','男','职称2','13823888882','773890002@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`) values (23,'2021-04-29 17:56:38','教师3','123456','教师姓名3','男','职称3','13823888883','773890003@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`) values (24,'2021-04-29 17:56:38','教师4','123456','教师姓名4','男','职称4','13823888884','773890004@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`) values (25,'2021-04-29 17:56:38','教师5','123456','教师姓名5','男','职称5','13823888885','773890005@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`gonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhicheng`,`shouji`,`youxiang`) values (26,'2021-04-29 17:56:38','教师6','123456','教师姓名6','男','职称6','13823888886','773890006@qq.com');

/*Table structure for table `kechengdayi` */

DROP TABLE IF EXISTS `kechengdayi`;

CREATE TABLE `kechengdayi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `kechengbianhao` varchar(200) DEFAULT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kechengleixing` varchar(200) DEFAULT NULL COMMENT '课程类型',
  `yiwenjieda` longtext COMMENT '疑问解答',
  `fabushijian` date DEFAULT NULL COMMENT '发布时间',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='课程答疑';

/*Data for the table `kechengdayi` */

insert  into `kechengdayi`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenjieda`,`fabushijian`,`gonghao`,`jiaoshixingming`) values (91,'2021-04-29 17:56:38','账号1','姓名1','课程编号1','课程名称1','课程类型1','疑问解答1','2021-04-29','工号1','教师姓名1');
insert  into `kechengdayi`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenjieda`,`fabushijian`,`gonghao`,`jiaoshixingming`) values (92,'2021-04-29 17:56:38','账号2','姓名2','课程编号2','课程名称2','课程类型2','疑问解答2','2021-04-29','工号2','教师姓名2');
insert  into `kechengdayi`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenjieda`,`fabushijian`,`gonghao`,`jiaoshixingming`) values (93,'2021-04-29 17:56:38','账号3','姓名3','课程编号3','课程名称3','课程类型3','疑问解答3','2021-04-29','工号3','教师姓名3');
insert  into `kechengdayi`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenjieda`,`fabushijian`,`gonghao`,`jiaoshixingming`) values (94,'2021-04-29 17:56:38','账号4','姓名4','课程编号4','课程名称4','课程类型4','疑问解答4','2021-04-29','工号4','教师姓名4');
insert  into `kechengdayi`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenjieda`,`fabushijian`,`gonghao`,`jiaoshixingming`) values (95,'2021-04-29 17:56:38','账号5','姓名5','课程编号5','课程名称5','课程类型5','疑问解答5','2021-04-29','工号5','教师姓名5');
insert  into `kechengdayi`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenjieda`,`fabushijian`,`gonghao`,`jiaoshixingming`) values (96,'2021-04-29 17:56:38','账号6','姓名6','课程编号6','课程名称6','课程类型6','疑问解答6','2021-04-29','工号6','教师姓名6');

/*Table structure for table `kechengleixing` */

DROP TABLE IF EXISTS `kechengleixing`;

CREATE TABLE `kechengleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='课程类型';

/*Data for the table `kechengleixing` */

insert  into `kechengleixing`(`id`,`addtime`,`leixing`) values (41,'2021-04-29 17:56:38','类型1');
insert  into `kechengleixing`(`id`,`addtime`,`leixing`) values (42,'2021-04-29 17:56:38','类型2');
insert  into `kechengleixing`(`id`,`addtime`,`leixing`) values (43,'2021-04-29 17:56:38','类型3');
insert  into `kechengleixing`(`id`,`addtime`,`leixing`) values (44,'2021-04-29 17:56:38','类型4');
insert  into `kechengleixing`(`id`,`addtime`,`leixing`) values (45,'2021-04-29 17:56:38','类型5');
insert  into `kechengleixing`(`id`,`addtime`,`leixing`) values (46,'2021-04-29 17:56:38','类型6');

/*Table structure for table `kechengyiwen` */

DROP TABLE IF EXISTS `kechengyiwen`;

CREATE TABLE `kechengyiwen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `kechengbianhao` varchar(200) DEFAULT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kechengleixing` varchar(200) DEFAULT NULL COMMENT '课程类型',
  `yiwenneirong` longtext COMMENT '疑问内容',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='课程疑问';

/*Data for the table `kechengyiwen` */

insert  into `kechengyiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenneirong`,`faburiqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (81,'2021-04-29 17:56:38','工号1','教师姓名1','课程编号1','课程名称1','课程类型1','疑问内容1','2021-04-29','账号1','姓名1','是','');
insert  into `kechengyiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenneirong`,`faburiqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (82,'2021-04-29 17:56:38','工号2','教师姓名2','课程编号2','课程名称2','课程类型2','疑问内容2','2021-04-29','账号2','姓名2','是','');
insert  into `kechengyiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenneirong`,`faburiqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (83,'2021-04-29 17:56:38','工号3','教师姓名3','课程编号3','课程名称3','课程类型3','疑问内容3','2021-04-29','账号3','姓名3','是','');
insert  into `kechengyiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenneirong`,`faburiqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (84,'2021-04-29 17:56:38','工号4','教师姓名4','课程编号4','课程名称4','课程类型4','疑问内容4','2021-04-29','账号4','姓名4','是','');
insert  into `kechengyiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenneirong`,`faburiqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (85,'2021-04-29 17:56:38','工号5','教师姓名5','课程编号5','课程名称5','课程类型5','疑问内容5','2021-04-29','账号5','姓名5','是','');
insert  into `kechengyiwen`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`yiwenneirong`,`faburiqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (86,'2021-04-29 17:56:38','工号6','教师姓名6','课程编号6','课程名称6','课程类型6','疑问内容6','2021-04-29','账号6','姓名6','是','');

/*Table structure for table `kechengziliaoku` */

DROP TABLE IF EXISTS `kechengziliaoku`;

CREATE TABLE `kechengziliaoku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengbianhao` varchar(200) DEFAULT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kechengleixing` varchar(200) DEFAULT NULL COMMENT '课程类型',
  `kechengjianshu` longtext COMMENT '课程简述',
  `kechengwenjian` varchar(200) DEFAULT NULL COMMENT '课程文件',
  `keshi` varchar(200) DEFAULT NULL COMMENT '课时',
  `xuefen` varchar(200) DEFAULT NULL COMMENT '学分',
  `xiangqing` longtext COMMENT '详情',
  `faburiqi` datetime DEFAULT NULL COMMENT '发布日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='课程资料库';

/*Data for the table `kechengziliaoku` */

insert  into `kechengziliaoku`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`kechengjianshu`,`kechengwenjian`,`keshi`,`xuefen`,`xiangqing`,`faburiqi`) values (31,'2021-04-29 17:56:38','课程编号1','课程名称1','课程类型1','课程简述1','','课时1','学分1','详情1','2021-04-29 17:56:38');
insert  into `kechengziliaoku`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`kechengjianshu`,`kechengwenjian`,`keshi`,`xuefen`,`xiangqing`,`faburiqi`) values (32,'2021-04-29 17:56:38','课程编号2','课程名称2','课程类型2','课程简述2','','课时2','学分2','详情2','2021-04-29 17:56:38');
insert  into `kechengziliaoku`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`kechengjianshu`,`kechengwenjian`,`keshi`,`xuefen`,`xiangqing`,`faburiqi`) values (33,'2021-04-29 17:56:38','课程编号3','课程名称3','课程类型3','课程简述3','','课时3','学分3','详情3','2021-04-29 17:56:38');
insert  into `kechengziliaoku`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`kechengjianshu`,`kechengwenjian`,`keshi`,`xuefen`,`xiangqing`,`faburiqi`) values (34,'2021-04-29 17:56:38','课程编号4','课程名称4','课程类型4','课程简述4','','课时4','学分4','详情4','2021-04-29 17:56:38');
insert  into `kechengziliaoku`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`kechengjianshu`,`kechengwenjian`,`keshi`,`xuefen`,`xiangqing`,`faburiqi`) values (35,'2021-04-29 17:56:38','课程编号5','课程名称5','课程类型5','课程简述5','','课时5','学分5','详情5','2021-04-29 17:56:38');
insert  into `kechengziliaoku`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`kechengjianshu`,`kechengwenjian`,`keshi`,`xuefen`,`xiangqing`,`faburiqi`) values (36,'2021-04-29 17:56:38','课程编号6','课程名称6','课程类型6','课程简述6','','课时6','学分6','详情6','2021-04-29 17:56:38');

/*Table structure for table `kechengzuoye` */

DROP TABLE IF EXISTS `kechengzuoye`;

CREATE TABLE `kechengzuoye` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengbianhao` varchar(200) DEFAULT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kechengleixing` varchar(200) DEFAULT NULL COMMENT '课程类型',
  `zuoyemingcheng` varchar(200) DEFAULT NULL COMMENT '作业名称',
  `zuoyejianshu` longtext COMMENT '作业简述',
  `zuoyeneirong` varchar(200) DEFAULT NULL COMMENT '作业内容',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='课程作业';

/*Data for the table `kechengzuoye` */

insert  into `kechengzuoye`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`zuoyemingcheng`,`zuoyejianshu`,`zuoyeneirong`,`faburiqi`,`gonghao`,`jiaoshixingming`) values (51,'2021-04-29 17:56:38','课程编号1','课程名称1','课程类型1','作业名称1','作业简述1','','2021-04-29','工号1','教师姓名1');
insert  into `kechengzuoye`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`zuoyemingcheng`,`zuoyejianshu`,`zuoyeneirong`,`faburiqi`,`gonghao`,`jiaoshixingming`) values (52,'2021-04-29 17:56:38','课程编号2','课程名称2','课程类型2','作业名称2','作业简述2','','2021-04-29','工号2','教师姓名2');
insert  into `kechengzuoye`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`zuoyemingcheng`,`zuoyejianshu`,`zuoyeneirong`,`faburiqi`,`gonghao`,`jiaoshixingming`) values (53,'2021-04-29 17:56:38','课程编号3','课程名称3','课程类型3','作业名称3','作业简述3','','2021-04-29','工号3','教师姓名3');
insert  into `kechengzuoye`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`zuoyemingcheng`,`zuoyejianshu`,`zuoyeneirong`,`faburiqi`,`gonghao`,`jiaoshixingming`) values (54,'2021-04-29 17:56:38','课程编号4','课程名称4','课程类型4','作业名称4','作业简述4','','2021-04-29','工号4','教师姓名4');
insert  into `kechengzuoye`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`zuoyemingcheng`,`zuoyejianshu`,`zuoyeneirong`,`faburiqi`,`gonghao`,`jiaoshixingming`) values (55,'2021-04-29 17:56:38','课程编号5','课程名称5','课程类型5','作业名称5','作业简述5','','2021-04-29','工号5','教师姓名5');
insert  into `kechengzuoye`(`id`,`addtime`,`kechengbianhao`,`kechengmingcheng`,`kechengleixing`,`zuoyemingcheng`,`zuoyejianshu`,`zuoyeneirong`,`faburiqi`,`gonghao`,`jiaoshixingming`) values (56,'2021-04-29 17:56:38','课程编号6','课程名称6','课程类型6','作业名称6','作业简述6','','2021-04-29','工号6','教师姓名6');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'abo','abo','管理员','2021-04-29 17:56:38');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `zhuanye` varchar(200) DEFAULT NULL COMMENT '专业',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`xingbie`,`zhuanye`,`shouji`,`youxiang`,`shenfenzheng`) values (11,'2021-04-29 17:56:38','用户1','123456','姓名1','男','专业1','13823888881','773890001@qq.com','440300199101010001');
insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`xingbie`,`zhuanye`,`shouji`,`youxiang`,`shenfenzheng`) values (12,'2021-04-29 17:56:38','用户2','123456','姓名2','男','专业2','13823888882','773890002@qq.com','440300199202020002');
insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`xingbie`,`zhuanye`,`shouji`,`youxiang`,`shenfenzheng`) values (13,'2021-04-29 17:56:38','用户3','123456','姓名3','男','专业3','13823888883','773890003@qq.com','440300199303030003');
insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`xingbie`,`zhuanye`,`shouji`,`youxiang`,`shenfenzheng`) values (14,'2021-04-29 17:56:38','用户4','123456','姓名4','男','专业4','13823888884','773890004@qq.com','440300199404040004');
insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`xingbie`,`zhuanye`,`shouji`,`youxiang`,`shenfenzheng`) values (15,'2021-04-29 17:56:38','用户5','123456','姓名5','男','专业5','13823888885','773890005@qq.com','440300199505050005');
insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`xingbie`,`zhuanye`,`shouji`,`youxiang`,`shenfenzheng`) values (16,'2021-04-29 17:56:38','用户6','123456','姓名6','男','专业6','13823888886','773890006@qq.com','440300199606060006');

/*Table structure for table `zuoyedianping` */

DROP TABLE IF EXISTS `zuoyedianping`;

CREATE TABLE `zuoyedianping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kechengbianhao` varchar(200) DEFAULT NULL COMMENT '课程编号',
  `zuoyemingcheng` varchar(200) DEFAULT NULL COMMENT '作业名称',
  `pigaiwenjian` varchar(200) DEFAULT NULL COMMENT '批改文件',
  `chengji` int(11) DEFAULT NULL COMMENT '成绩',
  `pingyu` longtext COMMENT '评语',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='作业点评';

/*Data for the table `zuoyedianping` */

insert  into `zuoyedianping`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengmingcheng`,`kechengbianhao`,`zuoyemingcheng`,`pigaiwenjian`,`chengji`,`pingyu`,`gonghao`,`jiaoshixingming`) values (71,'2021-04-29 17:56:38','账号1','姓名1','课程名称1','课程编号1','作业名称1','',1,'评语1','工号1','教师姓名1');
insert  into `zuoyedianping`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengmingcheng`,`kechengbianhao`,`zuoyemingcheng`,`pigaiwenjian`,`chengji`,`pingyu`,`gonghao`,`jiaoshixingming`) values (72,'2021-04-29 17:56:38','账号2','姓名2','课程名称2','课程编号2','作业名称2','',2,'评语2','工号2','教师姓名2');
insert  into `zuoyedianping`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengmingcheng`,`kechengbianhao`,`zuoyemingcheng`,`pigaiwenjian`,`chengji`,`pingyu`,`gonghao`,`jiaoshixingming`) values (73,'2021-04-29 17:56:38','账号3','姓名3','课程名称3','课程编号3','作业名称3','',3,'评语3','工号3','教师姓名3');
insert  into `zuoyedianping`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengmingcheng`,`kechengbianhao`,`zuoyemingcheng`,`pigaiwenjian`,`chengji`,`pingyu`,`gonghao`,`jiaoshixingming`) values (74,'2021-04-29 17:56:38','账号4','姓名4','课程名称4','课程编号4','作业名称4','',4,'评语4','工号4','教师姓名4');
insert  into `zuoyedianping`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengmingcheng`,`kechengbianhao`,`zuoyemingcheng`,`pigaiwenjian`,`chengji`,`pingyu`,`gonghao`,`jiaoshixingming`) values (75,'2021-04-29 17:56:38','账号5','姓名5','课程名称5','课程编号5','作业名称5','',5,'评语5','工号5','教师姓名5');
insert  into `zuoyedianping`(`id`,`addtime`,`zhanghao`,`xingming`,`kechengmingcheng`,`kechengbianhao`,`zuoyemingcheng`,`pigaiwenjian`,`chengji`,`pingyu`,`gonghao`,`jiaoshixingming`) values (76,'2021-04-29 17:56:38','账号6','姓名6','课程名称6','课程编号6','作业名称6','',6,'评语6','工号6','教师姓名6');

/*Table structure for table `zuoyetijiao` */

DROP TABLE IF EXISTS `zuoyetijiao`;

CREATE TABLE `zuoyetijiao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `kechengbianhao` varchar(200) DEFAULT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `zuoyemingcheng` varchar(200) DEFAULT NULL COMMENT '作业名称',
  `tijiaowenjian` varchar(200) DEFAULT NULL COMMENT '提交文件',
  `beizhu` longtext COMMENT '备注',
  `tijiaoriqi` date DEFAULT NULL COMMENT '提交日期',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='作业提交';

/*Data for the table `zuoyetijiao` */

insert  into `zuoyetijiao`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`zuoyemingcheng`,`tijiaowenjian`,`beizhu`,`tijiaoriqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (61,'2021-04-29 17:56:38','工号1','教师姓名1','课程编号1','课程名称1','作业名称1','','备注1','2021-04-29','账号1','姓名1','是','');
insert  into `zuoyetijiao`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`zuoyemingcheng`,`tijiaowenjian`,`beizhu`,`tijiaoriqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (62,'2021-04-29 17:56:38','工号2','教师姓名2','课程编号2','课程名称2','作业名称2','','备注2','2021-04-29','账号2','姓名2','是','');
insert  into `zuoyetijiao`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`zuoyemingcheng`,`tijiaowenjian`,`beizhu`,`tijiaoriqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (63,'2021-04-29 17:56:38','工号3','教师姓名3','课程编号3','课程名称3','作业名称3','','备注3','2021-04-29','账号3','姓名3','是','');
insert  into `zuoyetijiao`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`zuoyemingcheng`,`tijiaowenjian`,`beizhu`,`tijiaoriqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (64,'2021-04-29 17:56:38','工号4','教师姓名4','课程编号4','课程名称4','作业名称4','','备注4','2021-04-29','账号4','姓名4','是','');
insert  into `zuoyetijiao`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`zuoyemingcheng`,`tijiaowenjian`,`beizhu`,`tijiaoriqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (65,'2021-04-29 17:56:38','工号5','教师姓名5','课程编号5','课程名称5','作业名称5','','备注5','2021-04-29','账号5','姓名5','是','');
insert  into `zuoyetijiao`(`id`,`addtime`,`gonghao`,`jiaoshixingming`,`kechengbianhao`,`kechengmingcheng`,`zuoyemingcheng`,`tijiaowenjian`,`beizhu`,`tijiaoriqi`,`zhanghao`,`xingming`,`sfsh`,`shhf`) values (66,'2021-04-29 17:56:38','工号6','教师姓名6','课程编号6','课程名称6','作业名称6','','备注6','2021-04-29','账号6','姓名6','是','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
