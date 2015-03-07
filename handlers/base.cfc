/**
* A ContentBox Module Handler
*/
component{
	
	property name="EventService" inject="entityService:events";
	property name="LocationService" inject="entityService:locations";
	property name="OrganizerService" inject="entityService:organizers";
	property name="SettingService" inject="entityService:settings";
	property name="TermService" inject="entityService:term";
	property name="RelationService" inject="entityService:termrelationship";
	
	property name="cb" 	inject="cbHelper@cb";
	
	function preHandler(event,action,eventArguments){ 
		param name="rc.setting.setting_value" default="false;";
		var rc 	= event.getCollection();
		var prc = event.getCollection(private=true);
		prc.xehmodule = "cbadmin.module.Calendar";
		prc.basePath = expandpath(".");
		prc.xehexport = "Calendar.main.export";
		prc.xeheventslist = "Calendar.main.list";
		prc.xehdetails = "Calendar.main.details";
		prc.xehCalendar = "Calendar.home.render";
		prc.xehevents = "Calendar.main.events";
		rc.setting= SettingService.executeQuery("from settings where setting_name=:param",{param="enableSearchBar"});
		prc.countries = ["Afghanistan","Albania","Algeria","Andorra","Angola","Antigua & Barbuda","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia & Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Central African Republic","Chad","Chile","China","Colombia","Comoros","Congo","Congo Democratic Republic of","Costa Rica","Cote d'Ivoire","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","East Timor","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Grenada","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea North","Korea South","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar (Burma)","Namibia","Nauru","Nepal","The Netherlands","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palau","Palestinian State","Panama","Papua New Guinea","Paraguay","Peru","The Philippines","Poland","Portugal","Qatar","Romania","Russia","Rwanda","St. Kitts & Nevis","St. Lucia","St. Vincent & The Grenadines","Samoa","San Marino","Sao Tome & Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States of America","Uruguay","Uzbekistan","Vanuatu","Vatican City (Holy See)","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"];
	}

}
