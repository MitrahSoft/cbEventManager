DROP TABLE IF EXISTS mitrah_em_event_term_relationship,mitrah_em_events,mitrah_em_locations,mitrah_em_organizers,mitrah_em_settings,mitrah_em_term;

CREATE SEQUENCE FK_mitrah_em_event_term_relationship_;

CREATE TABLE mitrah_em_event_term_relationship (
  id INT NOT NULL DEFAULT NEXTVAL ('mitrah_em_event_term_relationship_seq'),
  term_id INT DEFAULT NULL,
  event_id INT DEFAULT NULL,
  PRIMARY KEY (id)
)  ;

ALTER SEQUENCE mitrah_em_event_term_relationship_seq RESTART WITH 68;

CREATE INDEX FK_mitrah_em_event_term_relationship_term ON mitrah_em_event_term_relationship (term_id);
CREATE INDEX FK_mitrah_em_event_term_relationship_event ON mitrah_em_event_term_relationship (event_id);
CREATE INDEX FK9849A26DC39BA1F9 ON mitrah_em_event_term_relationship (event_id);
CREATE INDEX FK9849A26D5E2DA6E7 ON mitrah_em_event_term_relationship (term_id);
CREATE INDEX FK9849A26DAB5C0A3A ON mitrah_em_event_term_relationship (term_id);

CREATE SEQUENCE FK91C35492D9901143;

CREATE TABLE mitrah_em_events (
  event_id INT NOT NULL DEFAULT NEXTVAL ('mitrah_em_events_seq'),
  location_id VARCHAR(255) DEFAULT NULL,
  organizer_id VARCHAR(255) DEFAULT NULL,
  event_name VARCHAR(255) DEFAULT NULL,
  event_desc VARCHAR(255) DEFAULT NULL,
  event_excerpt VARCHAR(255) DEFAULT NULL,
  event_startDate VARCHAR(255) DEFAULT NULL,
  event_endDate VARCHAR(255) DEFAULT NULL,
  event_startTime VARCHAR(255) DEFAULT NULL,
  event_endTime VARCHAR(255) DEFAULT NULL,
  event_website VARCHAR(255) DEFAULT NULL,
  event_category VARCHAR(255) DEFAULT NULL,
  event_allday VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (event_id)
)  ;

ALTER SEQUENCE mitrah_em_events_seq RESTART WITH 19;

CREATE INDEX FK91C35492D9901143 ON mitrah_em_events (location_id);
CREATE INDEX FK91C35492D158EF4F ON mitrah_em_events (organizer_id);
CREATE INDEX FK91C35492CA260D6F ON mitrah_em_events (event_category);

CREATE SEQUENCE location_postal_code;

CREATE TABLE mitrah_em_locations (
  location_id INT NOT NULL DEFAULT NEXTVAL ('mitrah_em_locations_seq'),
  location_name VARCHAR(255) DEFAULT NULL,
  location_address VARCHAR(255) DEFAULT NULL,
  location_city VARCHAR(255) DEFAULT NULL,
  location_state VARCHAR(255) DEFAULT NULL,
  location_country VARCHAR(255) DEFAULT NULL,
  location_postal_code VARCHAR(255) DEFAULT NULL,
  location_lat VARCHAR(255) DEFAULT NULL,
  location_lng VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (location_id)
)  ;

ALTER SEQUENCE mitrah_em_locations_seq RESTART WITH 3;

CREATE SEQUENCE mitrah_em_organizers_seq;

CREATE TABLE mitrah_em_organizers (
  organizer_id INT NOT NULL DEFAULT NEXTVAL ('mitrah_em_organizers_seq'),
  organizer_name VARCHAR(255) NOT NULL,
  organizer_phone VARCHAR(255) NOT NULL,
  organizer_email VARCHAR(255) NOT NULL,
  organizer_website VARCHAR(255) NOT NULL,
  PRIMARY KEY (organizer_id)
)  ;

ALTER SEQUENCE mitrah_em_organizers_seq RESTART WITH 3;

CREATE SEQUENCE mitrah_em_settings_seq;

CREATE TABLE mitrah_em_settings (
  setting_id INT NOT NULL DEFAULT NEXTVAL ('mitrah_em_settings_seq'),
  setting_name VARCHAR(255) NOT NULL,
  setting_value VARCHAR(255) NOT NULL,
  PRIMARY KEY (setting_id)
)  ;

ALTER SEQUENCE mitrah_em_settings_seq RESTART WITH 13;

INSERT  INTO mitrah_em_settings(setting_id,setting_name,setting_value) VALUES (1,'enableGoogleMaps','Yes'),(2,'eventsPerPage','5'),(3,'enableSearchBar','Yes'),(4,'ShowSomeLove','Yes');

CREATE SEQUENCE term_bg_color;

CREATE TABLE mitrah_em_term (
  term_id INT NOT NULL DEFAULT NEXTVAL ('mitrah_em_term_seq'),
  term_type VARCHAR(255) DEFAULT NULL,
  term_name VARCHAR(255) DEFAULT NULL,
  term_bg_color VARCHAR(255) DEFAULT NULL,
  term_slug VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (term_id)
)  ;

ALTER SEQUENCE mitrah_em_term_seq RESTART WITH 5;
