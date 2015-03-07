/**
* This is deafault section
*/
component extends="base" {
	property name="securityService" 	inject="id:securityService@cb";
	property name="authorService"		inject="id:authorService@cb";
	
	function index(event,rc,prc){
		event.setView("home/index");
	}	
	
	function render(){
		param name="rc.target" default="default"; 
		prc.xehexport = "Calendar.main.export";
		prc.xeheventslist = "Calendar.main.list";
		prc.xehdetails = "Calendar.main.details";
		prc.xehCalendar = "Calendar.home.render";
		prc.xehevents = "Calendar.main.events";
		return renderview(view="home/render", module="Calendar");
	}
}
