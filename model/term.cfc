component persistent="true" table="mitrah_em_term"{
	property name="term_id" fieldtype="id" column="term_id" generator="identity" setter="false";
	property name="term_type"  column="term_type" size="100";
	property name="term_name"  column="term_name" size="100";
	property name="term_bg_color" column="term_bg_color" size="100";
	property name="term_slug"  column="term_slug" size="100";
}
