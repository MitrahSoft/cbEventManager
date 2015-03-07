component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{
  
	public RelationService function init(){
		// init super class
		super.init(entityName="termrelationshisp");

		// Use Query Caching
		setUseQueryCaching( true );
		// Query Cache Region
		setQueryCacheRegion( 'ORMService.defaultCache' );
		
		// EventHandling
		setEventHandling( true );

		return this;
	}
}
