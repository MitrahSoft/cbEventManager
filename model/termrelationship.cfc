component persistent="true" table="mitrah_em_event_term_relationship"  output="false"
{
	/* properties */
	
	property name="id" column="id" type="numeric" ormtype="int" fieldtype="id" generator="identity"; 
	property name="event_id" column="event_id" type="numeric" ormtype="int" insert="false" update="false";
	property name="term_id" column="term_id" type="numeric" ormtype="int" insert="false" update="false";
	property name="tags"  fieldtype="many-to-one" cfc="term"  fkcolumn="term_id" update="true" insert="true";
	property name="events"  fieldtype="many-to-one" cfc="events"  fkcolumn="event_id" update="true" insert="true"; 
		
} 
