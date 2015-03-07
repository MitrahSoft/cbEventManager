component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{
  
	public LocationService function init(){
		// init super class
		super.init(entityName="Location");

		// Use Query Caching
		setUseQueryCaching( true );
		// Query Cache Region
		setQueryCacheRegion( 'ORMService.defaultCache' );
		
		// EventHandling
		setEventHandling( true );

		return this;
	}
}
