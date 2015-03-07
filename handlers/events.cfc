Component extends="base"{

	function index(prc,event,rc){
		param name="rc.status" default="";
		
		if(rc.status eq "Completed" AND isDefined("rc.ApllyFilters")){
			prc.qData=ormExecuteQuery("FROM events WHERE event_startDate <= :today", {today = DateFormat(Now(), 'mm/dd/yyyy')});
		}else if(rc.status eq "Upcoming" AND isDefined("rc.ApllyFilters")){
			prc.qData=ormExecuteQuery("FROM events WHERE event_startDate >= :today", {today = DateFormat(Now(), 'mm/dd/yyyy')});
		}else{
			prc.qData = EventService.list(entityName = "Event",asQuery=false);
		}
		event.setView(view="events/index");
	}
	function addEdit(prc,event,rc){
		
		param name="rc.event_id" default="";
		param name="rc.taglist" default="";
		rc.locations = LocationService.list(entityName="Location",asQuery=true);
		
		rc.organizer = OrganizerService.list(entityName="Organizer",asQuery=true);
		
		rc.tag = TermService.executeQuery(query="from term where term_type = :tag",params={tag="tag"},asQuery=false);
		rc.category = TermService.executeQuery("from term where term_type = :category",{category="category"});
		rc.qData = EventService.get(id=rc.event_id,entity = "Event",asQuery=true);
		if(rc.qData.HASLOCATIONS())
			rc.location_id = rc.qData.getlocations().getlocation_id();
		else
			rc.location_id = "";
		
		if(rc.qData.HASORGANIZERS())
			rc.organizer_id = rc.qData.getorganizers().getorganizer_id();
		else
			rc.organizer_id = "";
		
		if(rc.qData.HASCATEGORY())
			rc.catergory_id = rc.qData.getcategory().getterm_id();
		else
			rc.catergory_id = "";
			
		if(rc.event_id neq ""){	
			rc.event_tags = RelationService.executeQuery("select tags from termrelationship");
			if(rc.event_tags.recordcount){
				rc.taglist = valuelist(rc.event_tags.term_id); 	
			}
		}
		event.setView(view="events/addEdit");
		
	}
	
     function Save(prc,rc,event){
       		
	      param name="rc.event_id" default="";
	      param name="rc.properties.event_allday" default="false";
	      param name="rc.event_term" default="";
			for(var count = 1; count <= listLen(rc.fieldnames); count++) {
				rc.properties[listGetAt(rc.fieldnames, count)] = rc[listGetAt(rc.fieldnames, count)];
			}
			var events="";
			var termrelationship="";
			var organizer="";
			var location="";
			
			if(isDefined('rc.addNewOrganizer') and rc.addNewOrganizer EQ 1){
				organizers = OrganizerService.new();
				organizers=  OrganizerService.populate(target=organizers,memento=rc.properties,transactional=true);
				rc.save = OrganizerService.save(entity = organizers);
				rc.lastOrganizer = OrganizerService.executeQuery(query="select max(id) as organizer_id from organizers",asQuery="false");
				rc.properties.organizers=rc.lastOrganizer[1];
			}
			
			if(isDefined('rc.addNewLocation') and rc.addNewLocation EQ 1){
				location = LocationService.new();
				location=  LocationService.populate(target=location,memento=rc.properties,transactional=true);
				rc.save = LocationService.save(entity = location);
				rc.lastLocation = LocationService.executeQuery(query="select max(id) as location_id from locations",asQuery="false");
				rc.properties.locations=rc.lastLocation[1];
			}
			
			if(rc.event_id neq ""){
				
				termrelationship=RelationService.executeQuery(query="from termrelationship where event_id=:id",params={id=rc.event_id},asQuery=false);
				termrelationship = RelationService.delete(entity=termrelationship);
				events = EventService.get(id=rc.event_id,entity = "Event",asQuery=false);
			}else{
				events = EventService.new();
			}
			if(structKeyExists(rc.properties,"location_id")){
				structDelete(rc.properties,"location_id");
			}
			
			if(isDefined("rc.event_allday")){
				rc.properties.event_allday="true";
			}
			events=  EventService.populate(target=events,memento=rc.properties,transactional=true);
			rc.save = EventService.save(entity = events);
			if(rc.event_id eq ""){
				rc.lastevent = EventService.executeQuery(query="select max(id) as event_id from events",asQuery="false");
				rc.event_id=rc.lastevent[1];
			}
		
			for(var iteration = 1;iteration<=listlen(rc.event_term);iteration++){
				termrelationship = RelationService.new();
				rc.args.tags =listGetAt(rc.event_term, iteration);
				rc.args.events= rc.event_id;
				termrelationship = RelationService.populate(target=termrelationship,memento=rc.args);
				rc.saveTerms = RelationService.save(entity = termrelationship);				
			}
			getPlugin("MessageBox").info( messageArray=[ "Event Is Successfully Saved!" ]);
			cb.setNextModuleEvent("Calendar","Events");
			
	}
	function Delete(prc,rc,event){
		param name="rc.id" default="";
		rc.removeData = EventService.deleteByID(entity = "Event",id=rc.id);
		rc.removemapping = RelationService.deletebyQuery("from termrelationship where event_id=:param",{param=rc.id});
		getPlugin("MessageBox").error( messageArray=[ "Event Is Deleted!" ]);
		cb.setNextModuleEvent("Calendar","Events");
		 
	}
	
} 
