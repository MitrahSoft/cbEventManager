Component extends="base"{
			
	function index(prc,event,rc){
		
		prc.qData = TermService.executeQuery("from term where term_type = :tag",{tag="tag"});
		
		event.setView(view="Tag/index");
	}
	
	function addEdit(prc,event,rc){
		
		param name="rc.term_id" default="";
		rc.qData = TermService.get(id=rc.term_id,entity = "Tag");
		event.setView(view="Tag/addEdit");
	}
	
       function Save(prc,rc,event){
	      param name="rc.term_id" default="";
	     
			for(var count = 1; count <= listLen(rc.fieldnames); count++) {
			       rc.properties[listGetAt(rc.fieldnames, count)] = rc[listGetAt(rc.fieldnames, count)];
			}
			Var Tag="";
			if(rc.term_id neq ""){
			       Tag = TermService.get(id=rc.term_id,entity = "Tag",asQuery=false);
			}else{
			       Tag = TermService.new();
			}
			Tag=  TermService.populate(target=Tag,memento=rc.properties);
			rc.save = TermService.save(entity = Tag);
			getPlugin("MessageBox").info( messageArray=[ "Tag Is Successfully Saved!" ]);
			cb.setNextModuleEvent("Calendar","Tag");
			
      }
       
	function Delete(prc,rc,event){
		
		param name="rc.id" default="";
		
		rc.removeData = TermService.deleteByID(entity = "Tag",id=rc.id);
		getPlugin("MessageBox").error( messageArray=[ "Tag Is Deleted!" ]);
		cb.setNextModuleEvent("Calendar","Tag");
		
	}
} 
