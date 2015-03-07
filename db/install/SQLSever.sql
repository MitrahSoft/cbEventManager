IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = object_id(N'mitrah_em_event_term_relationship') AND OBJECTPROPERTY(id,N'IsUserTable') = 1)
   DROP TABLE   mitrah_em_event_term_relationship
IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = object_id(N'mitrah_em_events') AND OBJECTPROPERTY(id,N'IsUserTable') = 1)
   DROP TABLE   mitrah_em_events
IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = object_id(N'mitrah_em_locations') AND OBJECTPROPERTY(id,N'IsUserTable') = 1)
   DROP TABLE   mitrah_em_locations
IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = object_id(N'mitrah_em_organizers') AND OBJECTPROPERTY(id,N'IsUserTable') = 1)
   DROP TABLE   mitrah_em_organizers
IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = object_id(N'mitrah_em_settings') AND OBJECTPROPERTY(id,N'IsUserTable') = 1)
   DROP TABLE   mitrah_em_settings
IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = object_id(N'mitrah_em_term') AND OBJECTPROPERTY(id,N'IsUserTable') = 1)
   DROP TABLE   mitrah_em_term

CREATE TABLE mitrah_em_event_term_relationship (
  [id] INT NOT NULL IDENTITY,
  [term_id] INT DEFAULT NULL,
  [event_id] INT DEFAULT NULL,
  PRIMARY KEY ([id])
)  ;

CREATE INDEX [FK_mitrah_em_event_term_relationship_term] ON mitrah_em_event_term_relationship ([term_id]);
CREATE INDEX [FK_mitrah_em_event_term_relationship_event] ON mitrah_em_event_term_relationship ([event_id]);
CREATE INDEX [FK9849A26DC39BA1F9] ON mitrah_em_event_term_relationship ([event_id]);
CREATE INDEX [FK9849A26D5E2DA6E7] ON mitrah_em_event_term_relationship ([term_id]);
CREATE INDEX [FK9849A26DAB5C0A3A] ON mitrah_em_event_term_relationship ([term_id]);

CREATE TABLE mitrah_em_events (
  [event_id] INT NOT NULL IDENTITY,
  [location_id] INT NULL,
  [organizer_id] INT NULL,
  [event_name] VARCHAR(255) DEFAULT NULL,
  [event_desc] VARCHAR(255) DEFAULT NULL,
  [event_excerpt] VARCHAR(255) DEFAULT NULL,
  [event_startDate] VARCHAR(255) DEFAULT NULL,
  [event_endDate] VARCHAR(255) DEFAULT NULL,
  [event_startTime] VARCHAR(255) DEFAULT NULL,
  [event_endTime] VARCHAR(255) DEFAULT NULL,
  [event_website] VARCHAR(255) DEFAULT NULL,
  [event_category] INT NULL,
  [event_allday] VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY ([event_id])
)  ;

CREATE INDEX [FK91C35492D9901143] ON mitrah_em_events ([location_id]);
CREATE INDEX [FK91C35492D158EF4F] ON mitrah_em_events ([organizer_id]);
CREATE INDEX [FK91C35492CA260D6F] ON mitrah_em_events ([event_category]);

CREATE TABLE mitrah_em_locations (
  [location_id] INT NOT NULL IDENTITY,
  [location_name] VARCHAR(255) DEFAULT NULL,
  [location_address] VARCHAR(255) DEFAULT NULL,
  [location_city] VARCHAR(255) DEFAULT NULL,
  [location_state] VARCHAR(255) DEFAULT NULL,
  [location_country] VARCHAR(255) DEFAULT NULL,
  [location_postal_code] VARCHAR(255) DEFAULT NULL,
  [location_lat] VARCHAR(255) DEFAULT NULL,
  [location_lng] VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY ([location_id])
)  ;

CREATE TABLE mitrah_em_organizers (
  [organizer_id] INT NOT NULL IDENTITY,
  [organizer_name] VARCHAR(255) NOT NULL,
  [organizer_phone] VARCHAR(255) NOT NULL,
  [organizer_email] VARCHAR(255) NOT NULL,
  [organizer_website] VARCHAR(255) NOT NULL,
  PRIMARY KEY ([organizer_id])
)  ;

CREATE TABLE mitrah_em_settings (
  [setting_id] INT NOT NULL IDENTITY,
  [setting_name] VARCHAR(255) NOT NULL,
  [setting_value] VARCHAR(255) NOT NULL,
  PRIMARY KEY ([setting_id])
)  ;

SET IDENTITY_INSERT mitrah_em_settings ON

INSERT  INTO mitrah_em_settings(setting_id,setting_name,setting_value) VALUES(1,'enableGoogleMaps','true'),(2,'eventsPerPage','5'),(3,'enableSearchBar','true'),
(4,'ShowSomeLove','true')

CREATE TABLE mitrah_em_term (
  [term_id] INT NOT NULL IDENTITY,
  [term_type] VARCHAR(255) DEFAULT NULL,
  [term_name] VARCHAR(255) DEFAULT NULL,
  [term_bg_color] VARCHAR(255) DEFAULT NULL,
  [term_slug] VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY ([term_id])
)  ;
