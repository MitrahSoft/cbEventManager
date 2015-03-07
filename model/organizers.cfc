component persistent="true" table="mitrah_em_organizers" {
	property name="organizer_id" fieldtype="id" column="organizer_id" generator="identity" setter="false";
	property name="organizer_name" notnull="YES" column="organizer_name" size="100";
	property name="organizer_phone" notnull="YES" column="organizer_phone" size="100";
	property name="organizer_email" notnull="YES" column="organizer_email" size="100";
	property name="organizer_website" notnull="YES" column="organizer_website" size="100";
	
}
