BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE mitrah_em_event_term_relationship';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/,mitrah_em_events,mitrah_em_locations,mitrah_em_organizers,mitrah_em_settings,mitrah_em_term;

CREATE TABLE mitrah_em_event_term_relationship (
  id NUMBER(10) NOT NULL,
  term_id NUMBER(10) DEFAULT NULL,
  event_id NUMBER(10) DEFAULT NULL,
  PRIMARY KEY (id)
)  ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE mitrah_em_event_term_relationship_seq START WITH 68 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER mitrah_em_event_term_relationship_seq_tr
 BEFORE INSERT ON mitrah_em_event_term_relationship FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT mitrah_em_event_term_relationship_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE INDEX FK_mitrah_em_event_term_relationship_term ON mitrah_em_event_term_relationship (term_id);
CREATE INDEX FK_mitrah_em_event_term_relationship_event ON mitrah_em_event_term_relationship (event_id);
CREATE INDEX FK9849A26DC39BA1F9 ON mitrah_em_event_term_relationship (event_id);
CREATE INDEX FK9849A26D5E2DA6E7 ON mitrah_em_event_term_relationship (term_id);
CREATE INDEX FK9849A26DAB5C0A3A ON mitrah_em_event_term_relationship (term_id);

CREATE TABLE mitrah_em_events (
  event_id NUMBER(10) NOT NULL,
  location_id VARCHAR2(255) DEFAULT NULL,
  organizer_id VARCHAR2(255) DEFAULT NULL,
  event_name VARCHAR2(255) DEFAULT NULL,
  event_desc VARCHAR2(255) DEFAULT NULL,
  event_excerpt VARCHAR2(255) DEFAULT NULL,
  event_startDate VARCHAR2(255) DEFAULT NULL,
  event_endDate VARCHAR2(255) DEFAULT NULL,
  event_startTime VARCHAR2(255) DEFAULT NULL,
  event_endTime VARCHAR2(255) DEFAULT NULL,
  event_website VARCHAR2(255) DEFAULT NULL,
  event_category VARCHAR2(255) DEFAULT NULL,
  event_allday VARCHAR2(255) DEFAULT NULL,
  PRIMARY KEY (event_id)
)  ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE mitrah_em_events_seq START WITH 19 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER mitrah_em_events_seq_tr
 BEFORE INSERT ON mitrah_em_events FOR EACH ROW
 WHEN (NEW.event_id IS NULL)
BEGIN
 SELECT mitrah_em_events_seq.NEXTVAL INTO :NEW.event_id FROM DUAL;
END;
/

CREATE INDEX FK91C35492D9901143 ON mitrah_em_events (location_id);
CREATE INDEX FK91C35492D158EF4F ON mitrah_em_events (organizer_id);
CREATE INDEX FK91C35492CA260D6F ON mitrah_em_events (event_category);

CREATE TABLE mitrah_em_locations (
  location_id NUMBER(10) NOT NULL,
  location_name VARCHAR2(255) DEFAULT NULL,
  location_address VARCHAR2(255) DEFAULT NULL,
  location_city VARCHAR2(255) DEFAULT NULL,
  location_state VARCHAR2(255) DEFAULT NULL,
  location_country VARCHAR2(255) DEFAULT NULL,
  location_postal_code VARCHAR2(255) DEFAULT NULL,
  location_lat VARCHAR2(255) DEFAULT NULL,
  location_lng VARCHAR2(255) DEFAULT NULL,
  PRIMARY KEY (location_id)
)  ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE mitrah_em_locations_seq START WITH 3 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER mitrah_em_locations_seq_tr
 BEFORE INSERT ON mitrah_em_locations FOR EACH ROW
 WHEN (NEW.location_id IS NULL)
BEGIN
 SELECT mitrah_em_locations_seq.NEXTVAL INTO :NEW.location_id FROM DUAL;
END;
/

CREATE TABLE mitrah_em_organizers (
  organizer_id NUMBER(10) NOT NULL,
  organizer_name VARCHAR2(255) NOT NULL,
  organizer_phone VARCHAR2(255) NOT NULL,
  organizer_email VARCHAR2(255) NOT NULL,
  organizer_website VARCHAR2(255) NOT NULL,
  PRIMARY KEY (organizer_id)
)  ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE mitrah_em_organizers_seq START WITH 3 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER mitrah_em_organizers_seq_tr
 BEFORE INSERT ON mitrah_em_organizers FOR EACH ROW
 WHEN (NEW.organizer_id IS NULL)
BEGIN
 SELECT mitrah_em_organizers_seq.NEXTVAL INTO :NEW.organizer_id FROM DUAL;
END;
/

CREATE TABLE mitrah_em_settings (
  setting_id NUMBER(10) NOT NULL,
  setting_name VARCHAR2(255) NOT NULL,
  setting_value VARCHAR2(255) NOT NULL,
  PRIMARY KEY (setting_id)
)  ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE mitrah_em_settings_seq START WITH 13 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER mitrah_em_settings_seq_tr
 BEFORE INSERT ON mitrah_em_settings FOR EACH ROW
 WHEN (NEW.setting_id IS NULL)
BEGIN
 SELECT mitrah_em_settings_seq.NEXTVAL INTO :NEW.setting_id FROM DUAL;
END;
/

INSERT  INTO mitrah_em_settings(setting_id,setting_name,setting_value)  SELECT 1,'enableGoogleMaps','Yes' FROM DUAL UNION ALL  SELECT 2,'eventsPerPage','5' FROM DUAL UNION ALL  SELECT 3,'enableSearchBar','Yes' FROM DUAL UNION ALL  SELECT 4,'ShowSomeLove','Yes' FROM DUAL;

CREATE TABLE mitrah_em_term (
  term_id NUMBER(10) NOT NULL,
  term_type VARCHAR2(255) DEFAULT NULL,
  term_name VARCHAR2(255) DEFAULT NULL,
  term_bg_color VARCHAR2(255) DEFAULT NULL,
  term_slug VARCHAR2(255) DEFAULT NULL,
  PRIMARY KEY (term_id)
)  ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE mitrah_em_term_seq START WITH 5 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER mitrah_em_term_seq_tr
 BEFORE INSERT ON mitrah_em_term FOR EACH ROW
 WHEN (NEW.term_id IS NULL)
BEGIN
 SELECT mitrah_em_term_seq.NEXTVAL INTO :NEW.term_id FROM DUAL;
END;
/
