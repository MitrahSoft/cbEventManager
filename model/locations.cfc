component persistent="true" table="mitrah_em_locations"{
	property name="location_id" fieldtype="id" column="location_id" generator="identity" setter="false";
	property name="location_name"  column="location_name" size="100";
	property name="location_address"  column="location_address" size="500";
	property name="location_city"  column="location_city" size="100";
	property name="location_state"  column="location_state" size="100";
	property name="location_country"  column="location_country" size="100";
	property name="location_postal_code"  column="location_postal_code" size="10";
	property name="location_lat"  column="location_lat" size="20";
	property name="location_lng"  column="location_lng" size="20";
	
}
