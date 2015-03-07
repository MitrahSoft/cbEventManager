/**
* This is event manager plugin for contentbox

All widgets inherit the following properties available to you:

property name="categoryService"			inject="id:categoryService@cb";
property name="entryService"			inject="id:entryService@cb";
property name="pageService"				inject="id:pageService@cb";
property name="contentService"			inject="id:contentService@cb";
property name="contentVersionService"	inject="id:contentVersionService@cb";
property name="authorService"			inject="id:authorService@cb";
property name="commentService"			inject="id:commentService@cb";
property name="customHTMLService"		inject="id:customHTMLService@cb";
property name="cb"						inject="id:CBHelper@cb";
property name="securityService" 		inject="id:securityService@cb";
property name="html"					inject="coldbox:plugin:HTMLHelper";
*/
component extends="contentbox.model.ui.BaseWidget" singleton{
	
	Calendar function init(controller){
		// Init parent
		super.init( arguments.controller );
		
		// Widget Properties
		setPluginName("Calendar");
		setPluginVersion("1.0");
		setPluginDescription("This is event manager plugin for contentbox");
		setPluginAuthor("Mitrahsoft");
		setPluginAuthorURL("http://www.mitrahsoft.com");
		setForgeBoxSlug("");
		
		return this;
	}

	/**
	* This is the main renderit method you will need to implement in concrete widgets
	*/
	any function renderIt(){
		var content = runEvent(event='Calendar:main.index');
		if( !isNull(content) ){
			return content;
		}
		return 'Problem in rendering';
	}
	
}
