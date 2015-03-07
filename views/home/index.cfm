<cfoutput>
	<div align="center" class="home-continer">
		<div class="row" style="margin-left:-62px;width:967px;">
			#renderView("nav/index")#
		</div>
		<div class="head">
			<div class="events">
				<div id="logImg">
					<img src="#event.getModuleRoot('Calendar')#/includes/assets/images/MitrahSoft-logo.png" alt="info" />
				</div>
				<div id="tagline">
					The Calendar Module is a carefully crafted, extensible plugin that lets you easily share your events.
				</div>
				<div id="eManager">Calendar Module</div>
			</div>
			<div id="cal">
				<img src="#event.getModuleRoot('Calendar')#/includes/assets/images/calendar-1.png" alt="info" class="imgsize"/>
			</div>
		</div>
	</div>	
	<div id="description">
			<legend>Events Manager</legend>
			<p>Create and manage events with ease.Get professional-level quality and features backed by a team you can trust.</p>
			
			<legend>Developed By</legend>
			<div class="clearfix">
				<div class="logo">
					<a href="http://www.MitrahSoft.com" target="_blank"><img src="#event.getModuleRoot('Calendar')#/includes/assets/images/MitrahSoft-logo.png" alt="info"  width="250" height="24"/></a>
				</div>
				<div id="developerDescription">
					<strong>MitrahSoft</strong> 
					is a team of talented Adobe & Brainbench Certified ColdFusion developers.We provide customized, efficient and affordable IT solutions for your business needs in ColdFusion.The services we provide are competitively priced, and come with the following benefits:   
					<ul>
						<li>World-class and up-to-date CF programming knowledge and experience;</li> 
						<li>Ability to effectively communicate and understand the clients needs in order to produce an effective and concise solution;</li> 
						<li>Consideration of user-friendly interfaces and data entry methods, for those less experienced types of applications.</li>
					</ul>
					<a href="mailto:contactus@mitrahsoft.com">Contact us</a>, we are here to help!
				</div>
			</div>
			<legend>Features</legend>
			<ul>
			   	 <li>Rapidly create events</li>
			     <li>Saved venues & organizers</li>
			     <li>Calendar month view with tooltips</li>
			     <li>List view</li>
			     <li>Event search</li>
			     <li>Google maps</li>
			     <li>Events Taxonomies (Categories & Tags)</li>
			     <li>Completely ajaxified for super smooth browsing</li>
			</ul>
		</div>
</cfoutput>