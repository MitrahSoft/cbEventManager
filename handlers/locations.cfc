Component extends="base" {
	
	function index(prc,event,rc){
		param name="rc.location_country" default="";
		
		if(len(rc.location_country) AND isDefined("rc.ApllyFilters")){
			var restrictions = LocationService.getRestrictions();
			var criteria = ArrayNew(1);
			ArrayAppend(criteria, restrictions.like("location_country","%#rc.location_country#%"));
			prc.qData = LocationService.criteriaQuery(entity="Location",criteria=criteria);
		}
		else{
			prc.qData = LocationService.list(entityName = "Location",asQuery=true);
		}
		
		event.setView(view="locations/index");
	}
	function addEdit(prc,event,rc){
		
		param name="rc.location_id" default="";
		rc.Setting = SettingService.executeQuery("from settings where setting_name=:param",{param="enableGoogleMaps"});
		rc.qData = LocationService.get(id=rc.location_id,entity = "Location");
		
		event.setView(view="locations/addEdit");
		
	}
	
	function Save(prc,rc,event){
	      param name="rc.location_id" default="";
	    
			for(var count = 1; count <= listLen(rc.fieldnames); count++) {
			       rc.properties[listGetAt(rc.fieldnames, count)] = rc[listGetAt(rc.fieldnames, count)];
			}
			Var locations="";
			if(rc.location_id neq ""){
			       locations = LocationService.get(id=rc.location_id,entity = "Location",asQuery=false);
			}else{
			       locations = LocationService.new();
			}
			locations=  LocationService.populate(target=locations,memento=rc.properties);
			rc.save = LocationService.save(entity=locations);
			
			getPlugin("MessageBox").info( messageArray=[ "Location Is Successfully Saved!" ]);
			
			cb.setNextModuleEvent("Calendar","locations");
      }
      
	function Delete(prc,rc,event){
		 param name="rc.id" default="";
		 if(rc.id neq ""){
		 	rc.qLocation=LocationService.executeQuery(query="from events where location_id = :LocationID",params={LocationID=#rc.id#},asQuery=false);
		 	
		 	if(ArrayLen(rc.qLocation)){
				getPlugin("MessageBox").warn( messageArray=[ "There is some events scheduled for this location. Delete the events before deleting the Location." ]);
			}else{
				getPlugin("MessageBox").error( messageArray=[ "Location Is Deleted!" ]);
				rc.removeData = LocationService.deleteByID(entity = "Location",id=rc.id);
			}
		 }
		cb.setNextModuleEvent("Calendar","locations");
		
	}
	
	
} 
