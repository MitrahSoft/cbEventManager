component persistent="true" table="mitrah_em_events"{
	property name="event_id" fieldtype="id" column="event_id" generator="identity" setter="false";
	property name="event_name"  	column="event_name" 	size="100";
	property name="content"  		column="event_desc" 	size="65535";
	property name="excerpt"  		column="event_excerpt" 	size="65535";
	property name="event_startDate" column="event_startDate"size="10";
	property name="event_endDate"  	column="event_endDate" 	size="10";
	property name="event_startTime" column="event_startTime"size="8";
	property name="event_endTime"  	column="event_endTime" 	size="8";
	property name="event_website"  	column="event_website" 	size="100";
	property name="event_allday"  	column="event_allday" 	size="100";
	property name="organizer_id" column="organizer_id" type="numeric" ormtype="int" insert="false" update="false";
	property name="location_id" column="location_id" type="numeric" ormtype="int" insert="false" update="false";
	/* One to One */
	property name="organizers"	fieldtype="one-to-one"	cfc="organizers"	fetch="join"	fkcolumn="organizer_id"	lazy="true";
	property name="locations"	fieldtype="one-to-one"	cfc="locations"		fetch="join"	fkcolumn="location_id"	lazy="true";
	property name="category"	fieldtype="one-to-one"	cfc="term"			fetch="join"	fkcolumn="event_category" Unique="false" lazy="true";
}
