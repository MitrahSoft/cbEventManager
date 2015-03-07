/**
********************************************************************************
ContentBox - A Modular Content Platform
Copyright 2012 by Luis Majano and Ortus Solutions, Corp
www.gocontentbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
Apache License, Version 2.0

Copyright Since [2012] [Luis Majano and Ortus Solutions,Corp]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
********************************************************************************
*/
component {

/**
Module Directives as public properties
this.title 				= "Title of the module";
this.author 			= "Author of the module";
this.webURL 			= "Web URL for docs purposes";
this.description 		= "Module description";
this.version 			= "Module Version"

Optional Properties
this.viewParentLookup   = (true) [boolean] (Optional) // If true, checks for views in the parent first, then it the module.If false, then modules first, then parent.
this.layoutParentLookup = (true) [boolean] (Optional) // If true, checks for layouts in the parent first, then it the module.If false, then modules first, then parent.
this.entryPoint  		= "" (Optional) // If set, this is the default event (ex:forgebox:manager.index) or default route (/forgebox) the framework
									       will use to create an entry link to the module. Similar to a default event.

structures to create for configuration
- parentSettings : struct (will append and override parent)
- settings : struct
- datasources : struct (will append and override parent)
- webservices : struct (will append and override parent)
- interceptorSettings : struct of the following keys ATM
	- customInterceptionPoints : string list of custom interception points
- interceptors : array
- layoutSettings : struct (will allow to define a defaultLayout for the module)
- routes : array Allowed keys are same as the addRoute() method of the SES interceptor.
- wirebox : The wirebox DSL to load and use

Available objects in variable scope
- controller
- appMapping (application mapping)
- moduleMapping (include,cf path)
- modulePath (absolute path)
- log (A pre-configured logBox logger object for this object)
- binder (The wirebox configuration binder)

Required Methods
- configure() : The method ColdBox calls to configure the module.

Optional Methods
- onLoad() 		: If found, it is fired once the module is fully loaded
- onUnload() 	: If found, it is fired once the module is unloaded

*/
	
	// Module Properties
	this.title 				= "Calendar";
	this.author 			= "Mitrahsoft";
	this.webURL 			= "http://www.mitrahsoft.com";
	this.description 		= "A Calendar Application for contentbox";
	this.version			= "1.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "Calendar";
	// ForgeBox Slug, used for ForgeBox connectivity and auto-update features, leave blank or remove if not used
	this.forgeBoxSlug		= "";
	
	function configure(){
		
		// parent settings
		parentSettings = {
		
		};
	
		// module settings - stored in modules.name.settings
		settings = {
		
		};
		
		// Layout Settings
		layoutSettings = {
			defaultLayout = ""
		};
		
		// datasources
		datasources = {
		
		};
		
		// web services
		webservices = {
		
		};
		
		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler="home",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}		
		];		
		
		// Custom Declared Points
		interceptorSettings = {
			customInterceptionPoints = ""
		};
		
		// Custom Declared Interceptors
		interceptors = [
		];
		
		// Binder Mappings
		// binder.map("Alias").to("#moduleMapping#.model.MyService");
		binder.map("events").to("#moduleMapping#.model.services.events");
		binder.map("locations").to("#moduleMapping#.model.services.locations");
		binder.map("organizers").to("#moduleMapping#.model.services.organizers");
		binder.map("settings").to("#moduleMapping#.model.services.settings");
		binder.map("term").to("#moduleMapping#.model.services.term");
		binder.map("termrelationship").to("#moduleMapping#.model.services.termrelationship");
	}
	
	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		
				// Let's add ourselves to the main menu in the Modules section
				var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
				// Add Menu Contribution
				menuService.addSubMenu(topMenu=menuService.MODULES,
										name="Calendar",
										label="Calendar",
										href="#menuService.buildModuleLink('Calendar','home')#");	
		
	}

	/**
	* Fired when the module is activated by ContentBox
	*/
	function onActivate(){
		
		var orm = new coldbox.system.orm.hibernate.util.ORMUtilFactory().getORMUtil();
		// figure out the default datasource
		var dsn = orm.getDefaultDatasource();
		// use dbinfo to lookup db version
		var db = new dbinfo( datasource=dsn ).version();
		var sql = "";
		
		// switch on db version
		switch( db.DATABASE_PRODUCTNAME ) {
			case "MySQL":
				sql = fileRead( "#controller.getSetting('modules').Calendar.path#/db/install/MySQL.sql");
				break;
			case "Microsoft SQL Server":
				sql = fileRead("#controller.getSetting('modules').Calendar.path#/db/install/SQLSever.sql" );
				break;
			case "Oracle":
				sql = fileRead("#controller.getSetting('modules').Calendar.path#/db/install/Oracle.sql");
				break;
			case "PostgreSQL":
				sql = fileRead("#controller.getSetting('modules').Calendar.path#/db/install/PostgreSQL.sql");
				break;
		}
		
		// run the sql script
		if( sql != "" ) {
			if( db.DATABASE_PRODUCTNAME=="MySQL" ) {
				for( var i=1; i<=listLen( sql, ";" )-1; i++ ) {
					var statement = listGetAt( sql, i, ";" );
						var qs = new query();
    					qs.setDataSource( dsn );
    					qs.setSql( statement );
    					qs.execute();
				}
			}
			else {
				var qs = new query();
				qs.setDataSource( dsn );
				qs.setSql( sql );
				qs.execute();
			}
		}

	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		// Let's remove ourselves to the main menu in the Modules section
		
	}

	/**
	* Fired when the module is deactivated by ContentBox
	*/
	function onDeactivate(){
		var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
		
		var orm = new coldbox.system.orm.hibernate.util.ORMUtilFactory().getORMUtil();
		// figure out the default datasource
		var dsn = orm.getDefaultDatasource();
		// use dbinfo to lookup db version
		var db = new dbinfo( datasource=dsn ).version();
		
		var sql = "";
		
		// switch on db version
		switch( db.DATABASE_PRODUCTNAME ) {
			case "MySQL":
				sql = fileRead("#controller.getSetting('modules').Calendar.path#/db/unInstall/MySQL.sql");
				break;
			case "Microsoft SQL Server":
				sql = fileRead("#controller.getSetting('modules').Calendar.path#/db/unInstall/SQLSever.sql");
				break;
			case "Oracle":
				sql = fileRead("#controller.getSetting('modules').Calendar.path#/db/unInstall/Oracle.sql");
				break;
			case "PostgreSQL":
				sql = fileRead("#controller.getSetting('modules').Calendar.path#/db/unInstall/PostgreSQL.sql");
				break;
		}
		
		// run the sql script
		if( sql != "" ) {
			if( db.DATABASE_PRODUCTNAME=="MySQL" ) {
				for( var i=1; i<=listLen( sql, ";" ); i++ ) {
					var statement = listGetAt( sql, i, ";" );
						var qs = new query();
    					qs.setDataSource( dsn );
    					qs.setSql( statement );
    					qs.execute();
				}
			}
			else {
				var qs = new query();
				qs.setDataSource( dsn );
				qs.setSql( sql );
				qs.execute();
			}
		}
		
		menuService.removeSubMenu(topMenu=menuService.MODULES, name="Calendar");
	}
	
}