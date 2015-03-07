
component  extends="base" output="false" {

	function index(prc,event,rc){
		//Default Index
		prc.settings = SettingService.list(entityName = "Setting",asQuery=true);
		rc.qEvents = EventService.list(entityName ="Event",asQuery=true);
		event.setView(view="main/index",nolayout=true,module="Calendar");
	}
	
	function list(prc,event,rc){
		param name="rc.pageNo" default="1";
		param name="rc.searchTerm" default="";
		param name="rc.searchDate" default="";
		param name="rc.eventsInpage.SETTING_VALUE" default="";
		param name="rc.tag" default="";
		rc.eventsInpage = SettingService.executeQuery("from settings where setting_name=:param",{param="eventsperpage"});
	
		if(structKeyExists(rc,"eventsInpage") AND rc.eventsInpage.SETTING_VALUE eq "")
		{
			rc.eventsperpage = 5;
		}else{
			rc.eventsperpage=rc.eventsInpage.setting_value;
		}
			
		rc.range_from=(rc.pageNo-1)*rc.eventsPerPage;
	
		rc.qShowLove = SettingService.executeQuery("from settings where setting_name=:param",{param="ShowSomeLove"});
			
		if(rc.searchTerm neq "" or rc.searchDate neq ""){
		 
			rc.restrictions = EventService.getRestrictions();
			rc.criteria = ArrayNew(1);
			if(rc.searchDate neq ""){
				ArrayAppend(rc.criteria, rc.restrictions.eq("event_startDate","#rc.searchDate#"));
				
			}
			if(len(rc.searchTerm)){
				ArrayAppend(rc.criteria, rc.restrictions.like("event_name","%#rc.searchTerm#%"));
			}
			rc.qList = EventService.criteriaQuery(entity="Event",criteria=rc.criteria,asQuery=true,offset=rc.range_from,max=rc.eventsperpage);
			rc.qCount= EventService.criteriaQuery(entity="Event",criteria=rc.criteria,asQuery=true);
			
		}else{
			rc.qList = EventService.list(entityName = "Event",asQuery=true,offset=rc.range_from,max=rc.eventsperpage,offset=rc.range_from,max=rc.eventsperpage);
			rc.qCount = EventService.list(entityName = "Event",asQuery=true);
		}
		if(rc.tag neq ""){
			rc.getevents_by_Tag = RelationService.executeQuery(query="from termrelationship where term_id=:term",params={term=rc.tag});
			rc.eventid=listtoarray(valuelist(rc.getevents_by_Tag.event_id));
			var restrictions = EventService.getRestrictions();
			var criteria = ArrayNew(1);
			ArrayAppend(criteria, restrictions.In("event_id",JavaCast("java.lang.Integer[]",rc.eventid)));
			rc.qList = EventService.criteriaQuery(entity="Event",criteria=criteria,asQuery=true,offset=rc.range_from,max=rc.eventsperpage);
			rc.qCount = EventService.criteriaQuery(entity="Event",criteria=criteria,asQuery=true);		
		}
		event.setView(view="main/list",module="Calendar",nolayout="true"); 	
	}
	function details(){
		param name="rc.event_id" default=""; 
		rc.qList = EventService.get(id=rc.event_id,entityName = "Event");
		rc.relations =RelationService;
		rc.qShowLove = SettingService.executeQuery("from settings where setting_name=:param",{param="ShowSomeLove"});
		rc.qEnableGoogleMaps = SettingService.executeQuery("from settings where setting_name=:param",{param="enableGoogleMaps"});
		
		event.setView(view="main/details",nolayout="true",module="Calendar");
	}
	function events(rc,prc,event){
		rc.qEvents = EventService.list(entityName="Event",asQuery=false);
		event.setview(view="main/events",nolayout="true");
	}
	function export(rc){
		param name="rc.event_id" default="" ;
		if(rc.event_id neq ""){
			rc.qData = EventService.getAll(entity="Event",id=rc.event_id,asQuery=false);
		}
		else{
			rc.qData = EventService.list(entity="Event",asQuery=false);
		}
		event.setview(view="main/export",nolayout="true", module="Calendar");
	}
}

