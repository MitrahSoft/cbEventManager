DROP TABLE IF EXISTS `mitrah_em_event_term_relationship`,`mitrah_em_events`,`mitrah_em_locations`,`mitrah_em_organizers`,`mitrah_em_settings`,`mitrah_em_term`;
CREATE TABLE `mitrah_em_event_term_relationship` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `term_id` INT(11) DEFAULT NULL,
  `event_id` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mitrah_em_event_term_relationship_term` (`term_id`),
  KEY `FK_mitrah_em_event_term_relationship_event` (`event_id`),
  KEY `FK9849A26DC39BA1F9` (`event_id`),
  KEY `FK9849A26D5E2DA6E7` (`term_id`),
  KEY `FK9849A26DAB5C0A3A` (`term_id`)
) ENGINE=MYISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
CREATE TABLE `mitrah_em_events` (
  `event_id` INT(11) NOT NULL AUTO_INCREMENT,
  `location_id` VARCHAR(255) DEFAULT NULL,
  `organizer_id` VARCHAR(255) DEFAULT NULL,
  `event_name` VARCHAR(255) DEFAULT NULL,
  `event_desc` VARCHAR(255) DEFAULT NULL,
  `event_excerpt` VARCHAR(255) DEFAULT NULL,
  `event_startDate` VARCHAR(255) DEFAULT NULL,
  `event_endDate` VARCHAR(255) DEFAULT NULL,
  `event_startTime` VARCHAR(255) DEFAULT NULL,
  `event_endTime` VARCHAR(255) DEFAULT NULL,
  `event_website` VARCHAR(255) DEFAULT NULL,
  `event_category` VARCHAR(255) DEFAULT NULL,
  `event_allday` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `FK91C35492D9901143` (`location_id`),
  KEY `FK91C35492D158EF4F` (`organizer_id`),
  KEY `FK91C35492CA260D6F` (`event_category`)
) ENGINE=MYISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
CREATE TABLE `mitrah_em_locations` (
  `location_id` INT(11) NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(255) DEFAULT NULL,
  `location_address` VARCHAR(255) DEFAULT NULL,
  `location_city` VARCHAR(255) DEFAULT NULL,
  `location_state` VARCHAR(255) DEFAULT NULL,
  `location_country` VARCHAR(255) DEFAULT NULL,
  `location_postal_code` VARCHAR(255) DEFAULT NULL,
  `location_lat` VARCHAR(255) DEFAULT NULL,
  `location_lng` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=MYISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `mitrah_em_organizers` (
  `organizer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `organizer_name` VARCHAR(255) NOT NULL,
  `organizer_phone` VARCHAR(255) NOT NULL,
  `organizer_email` VARCHAR(255) NOT NULL,
  `organizer_website` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`organizer_id`)
) ENGINE=MYISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
CREATE TABLE `mitrah_em_settings` (
  `setting_id` INT(11) NOT NULL AUTO_INCREMENT,
  `setting_name` VARCHAR(255) NOT NULL,
  `setting_value` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MYISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
INSERT  INTO `mitrah_em_settings`(`setting_id`,`setting_name`,`setting_value`) VALUES (1,'enableGoogleMaps','true'),(2,'eventsPerPage','5'),(3,'enableSearchBar','true'),(4,'ShowSomeLove','true');

CREATE TABLE `mitrah_em_term` (
  `term_id` INT(11) NOT NULL AUTO_INCREMENT,
  `term_type` VARCHAR(255) DEFAULT NULL,
  `term_name` VARCHAR(255) DEFAULT NULL,
  `term_bg_color` VARCHAR(255) DEFAULT NULL,
  `term_slug` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`term_id`)
) ENGINE=MYISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
