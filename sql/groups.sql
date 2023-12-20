-- MySQL dump 10.15  Distrib 10.0.21-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: moodle_db
-- ------------------------------------------------------
-- Server version	10.0.21-MariaDB-log

--
-- Table structure for table `group_active`
--

CREATE TABLE `group_active` (
  `agentid`       varchar(64) NOT NULL DEFAULT '',
  `activegroupid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `group_invite`
--

CREATE TABLE `group_invite` (
  `inviteid` varchar(64) NOT NULL DEFAULT '',
  `groupid`  varchar(64) NOT NULL DEFAULT '',
  `roleid`   varchar(64)          DEFAULT NULL,
  `agentid`  varchar(64) NOT NULL DEFAULT '',
  `tmstamp`  bigint(11)  NOT NULL,
  PRIMARY KEY (`inviteid`),
  UNIQUE KEY `groupid` (`groupid`,`roleid`,`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `group_list`
--

CREATE TABLE `group_list` (
  `groupid`        varchar(64)  NOT NULL DEFAULT '',
  `name`           varchar(255) NOT NULL DEFAULT '',
  `charter`        longtext     NOT NULL,
  `insigniaid`     varchar(64)  NOT NULL DEFAULT '',
  `founderid`      varchar(64)  NOT NULL DEFAULT '',
  `membershipfee`  bigint(11)   NOT NULL DEFAULT '0',
  `openenrollment` varchar(255) NOT NULL DEFAULT '',
  `showinlist`     tinyint(1)   NOT NULL DEFAULT '0',
  `allowpublish`   tinyint(1)   NOT NULL DEFAULT '0',
  `maturepublish`  tinyint(1)   NOT NULL DEFAULT '0',
  `ownerroleid`    varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `group_membership`
--

CREATE TABLE `group_membership` (
  `groupid`        varchar(64) NOT NULL DEFAULT '',
  `agentid`        varchar(64) NOT NULL DEFAULT '',
  `selectedroleid` varchar(64) NOT NULL DEFAULT '',
  `contribution`   bigint(11)  NOT NULL DEFAULT '0',
  `listinprofile`  bigint(11)  NOT NULL DEFAULT '1',
  `acceptnotices`  bigint(11)  NOT NULL DEFAULT '1',
  PRIMARY KEY (`groupid`,`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `group_notice`
--

CREATE TABLE `group_notice` (
  `groupid`   varchar(64)  NOT NULL DEFAULT '',
  `noticeid`  varchar(64)  NOT NULL DEFAULT '',
  `timestamp` bigint(11)   NOT NULL DEFAULT '0',
  `fromname`  varchar(255) NOT NULL DEFAULT '',
  `subject`   varchar(255) NOT NULL DEFAULT '',
  `message`   longtext     NOT NULL,
  `binarybucket` longblob NOT NULL,
  PRIMARY KEY (`groupid`,`noticeid`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `group_role`
--

CREATE TABLE `group_role` (
  `groupid`     varchar(64)  NOT NULL DEFAULT '',
  `roleid`      varchar(64)  NOT NULL DEFAULT '',
  `name`        varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `title`       varchar(255) NOT NULL DEFAULT '',
  `powers`      bigint(20)   NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `group_rolemembership`
--

CREATE TABLE `group_rolemembership` (
  `groupid` varchar(64) NOT NULL DEFAULT '',
  `roleid`  varchar(64) NOT NULL DEFAULT '',
  `agentid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupid`,`roleid`,`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump completed on 2016-07-17 17:08:27
