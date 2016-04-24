CREATE TABLE `topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blockid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `creatime` datetime DEFAULT NULL,
  `topiclimit` int(4) DEFAULT '10',
  `headpath` varchar(255) DEFAULT NULL,
  `topicdisable` int(2) DEFAULT '1',
  `conter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT

CREATE TABLE `replay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `content` longtext,
  `replaytime` datetime DEFAULT NULL,
  `disable` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT

CREATE TABLE `usertable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(16) NOT NULL,
  `topiclimit` int(4) DEFAULT '10',
  `creatime` datetime NOT NULL,
  `userdisable` int(4) DEFAULT '1',
  `headpath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT

CREATE TABLE `manage`(
	`id` INT(11) unsigned NOT NULL auto_increment,
	`managename` VARCHAR(50) NOT NULL,
	`password` VARCHAR(16) NOT NULL,
	PRIMARY KEY(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;