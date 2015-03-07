Component extends="base" {
	
	
	function index(prc,event,rc){
	
		rc.qData = OrganizerService.list(entityName = "Organizer",asQuery=true);
		
		event.setView(view="Organizers/index");
	}
	function addEdit(prc,event,rc){
		
		param name="rc.organizer_id" default="";
		rc.qData = OrganizerService.get(id=rc.organizer_id,entity = "Organizer",asQuery=true);
		event.setView(view="Organizers/addEdit");
		
	}
	
	function Save(prc,rc,event){
	      param name="rc.organizer_id" default="";
	     
			for(var count = 1; count <= listLen(rc.fieldnames); count++) {
			       rc.properties[listGetAt(rc.fieldnames, count)] = rc[listGetAt(rc.fieldnames, count)];
			}
			Var organizer="";
			if(rc.organizer_id neq ""){
			       organizer = OrganizerService.get(id=rc.organizer_id,entity = "Organizer",asQuery=false);
			}else{
			       organizer = OrganizerService.new();
			}
			organizer=  OrganizerService.populate(target=organizer,memento=rc.properties);
			getPlugin("MessageBox").info( messageArray=[ "Organizer Is Successfully Saved!" ]);
			rc.save = OrganizerService.save(entity = organizer);
			cb.setNextModuleEvent("Calendar","Organizers");
      }
      
	function Delete(prc,rc,event){
		 param name="rc.id" default="";
		 if(rc.id neq ""){
		 	rc.qEvents=EventService.executeQuery(query="from events where organizer_id = :OrganizerID",params={OrganizerID=#rc.id#},asQuery=false);
		 	
		 	if(ArrayLen(rc.qEvents)){
				getPlugin("MessageBox").warn( messageArray=[ "There is some events scheduled for this Organizer. Delete the events before deleting the Organizer" ]);
			}else{
				getPlugin("MessageBox").error( messageArray=[ "Organizer Is Deleted!" ]);
				rc.removeData = OrganizerService.deleteByID(entity = "Organizer",id=rc.id);
			}
		 }
		cb.setNextModuleEvent("Calendar","Organizers");
	}
} 
