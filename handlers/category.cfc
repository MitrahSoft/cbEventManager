Component extends="base"{
			
	function index(prc,event,rc){
		
		prc.qData = TermService.executeQuery("from term where term_type = :category",{category="category"});
		
		event.setView(view="category/index");
	}
	
	function addEdit(prc,event,rc){
		
		param name="rc.term_id" default="";
		rc.qData = TermService.get(id=rc.term_id,entity = "category");
		event.setView(view="category/addEdit");
	}
	
	
	function Save(prc,rc,event){
	      param name="rc.term_id" default="";
	     
			for(var count = 1; count <= listLen(rc.fieldnames); count++) {
			       rc.properties[listGetAt(rc.fieldnames, count)] = rc[listGetAt(rc.fieldnames, count)];
			}
			Var category="";
			if(rc.term_id neq ""){
			       category = TermService.get(id=rc.term_id,entity = "Tag",asQuery=false);
			}else{
			       category = TermService.new();
			}
			category=  TermService.populate(target=category,memento=rc.properties);
			rc.save = TermService.save(entity = category);
			getPlugin("MessageBox").info( messageArray=[ "Category Is Successfully Saved!" ]);
			cb.setNextModuleEvent("Calendar","category");
			
      }
	function Delete(prc,rc,event){
		param name="rc.id" default="";
		rc.removeData = TermService.deleteByID(entity = "category",id=rc.id);
		getPlugin("MessageBox").error( messageArray=[ "Category Is Deleted!" ]);
		cb.setNextModuleEvent("Calendar","category");
		
	}
} 
