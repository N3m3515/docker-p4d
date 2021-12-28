CREATE TABLE IF NOT EXISTS `config` (
  `owner` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `inssp` int(11) DEFAULT NULL,
  `updsp` int(11) DEFAULT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `config` WRITE;


INSERT INTO `config` VALUES ('p4d','mqttHassUrl',1638020857,1640593443,'tcp://p4d-mqtt-broker:1883'),
                            ('p4d','mqttNodeRedUrl',1639489484,1640593443,'tcp://p4d-mqtt-broker:1883'),
                            ('p4d','mqttUrl',1587801810,1640593443,'tcp://p4d-mqtt-broker:1883');
   WHERE NOT EXISTS (SELECT count(') FROM config);

UNLOCK TABLES;
