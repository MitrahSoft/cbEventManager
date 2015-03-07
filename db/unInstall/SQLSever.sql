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