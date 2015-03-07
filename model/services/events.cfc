component extends="coldbox.system.orm.hibernate.VirtualEntityService" 	{
  
	public EventService function init(){
		// init super class
		super.init(entityName="Event");

		// Use Query Caching
		setUseQueryCaching( true );
		// Query Cache Region
		setQueryCacheRegion( 'ORMService.defaultCache' );
		
		// EventHandling
		setEventHandling( true );

		return this;
	}
}
