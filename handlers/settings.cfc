Component extends="base"{

	function index(prc,event,rc){
		param name="rc.eventsperpage" default="";
		param name="rc.enableGoogleMaps" default="false";
		param name="rc.enableSearchBar" default="false";
		param name="rc.showsomelove" default="false";
		
		prc.qData = SettingService.list(entityName = "Setting",asQuery=false);
		
		if(arraylen(prc.qData) neq 0){
			for(var count=1;count <= 4; count++){
					rc[prc.qData[count].getSetting_name()]=prc.qData[count].getSetting_value();
				}
		}
		
		event.setView(view="Settings/index");
	}
	function addEdit(prc,event,rc){
		
		param name="rc.setting_id" default="";
		rc.qData = SettingService.get(id=rc.setting_id,entity = "Setting");
		
		event.setView(view="Settings/addEdit");
		
	}
	
	function Save(prc,rc,event){
		param name="rc.showsomelove" default="false";
		param name="rc.enableGoogleMaps" default="false";
		param name="rc.enableSearchBar" default="false";
		
		rc.fields = "eventsperpage,enableGoogleMaps,enableSearchBar,showsomelove";
		var settings = "";
		for(var count = 1; count <= listLen(rc.fields); count++) {
			rc.properties[listGetAt(rc.fields, count)] = rc[listGetAt(rc.fields, count)];
			settings = SettingService.executeQuery("from settings where setting_name = :param",{param='#listGetAt(rc.fields, count)#'});
			
			if(settings.recordcount eq 0){
				settings = SettingService.new();
				settings.setsetting_name(listGetAt(rc.fields, count));
			}else{
				settings = SettingService.get(id=settings.setting_id,entity="Setting");
			}
			settings.setsetting_value(rc[listGetAt(rc.fields, count)]);
			rc.save = SettingService.save(entity=settings);
		}
		getPlugin("MessageBox").info( messageArray=[ "Settings Is Successfully Saved!" ]);
		
		cb.setNextModuleEvent("Calendar","Settings.index");
		
	}
	
	
} 
