component persistent="true" table="mitrah_em_settings"{
	property name="setting_id" fieldtype="id" column="setting_id" generator="identity" setter="false";
	property name="setting_name" notnull="nO" column="setting_name" size="100";
	property name="setting_value" notnull="no" column="setting_value" size="100";
//property name="setting" notnull="NO" column="setting" size="10";
	
}
