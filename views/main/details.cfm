<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<cfoutput>
	<cfset rc.tags = rc.relations.executeQuery(query="from termrelationship where event_id=:event",params={event=rc.event_id},asQuery=false)>
	
	<div class="box"> 
		
		<div class="offset10">
			<a href="javascript:void(0)" onclick="searchEvents()"><i class="icon-backward"></i> &nbsp;All Events </a>
		</div><br>
		<div style="margin-left:20px;">
			<h3>#rc.qList.getevent_name()#</h3>
			<h5>
				Event Tag(s):
				<cfloop index="count" from="1" to="#arraylen(rc.tags)#">
					<a href="javascript:void(0)" onclick="searchEvents(tag=#rc.tags[count].gettags().getterm_id()#,qString='Tag')">#rc.tags[count].gettags().getterm_name()#</a>
					<cfif count neq #arraylen(rc.tags)#>,</cfif>
				</cfloop>
			</h5>
			<cfif rc.qList.getevent_startDate() eq rc.qList.getevent_endDate()>
				<p class="event_date">#dateFormat(rc.qList.event_startDate,'mmmm d')# <cfif len(rc.qList.event_startTime) or  len(rc.qList.event_endTime)> @ </cfif> #timeFormat(rc.qList.event_startTime,'hh:mm tt')# <cfif len(rc.qList.event_startTime) and  len(rc.qList.event_endTime)> - </cfif>  #timeFormat(rc.qList.event_endTime,'hh:mm tt')# </p>
			<cfelseif len(rc.qList.getevent_startDate()) and len(rc.qList.getevent_endDate())>
				<p class="event_date">#dateFormat(rc.qList.getevent_startDate(),'mmmm d')# - #dateFormat(rc.qList.getevent_endDate(),'d')# </p>
			<cfelse>
				<p class="event_date">#dateFormat(rc.qList.getevent_startDate(),'mmmm d')#</p>
			</cfif>
			<p>Download event <a href="#event.buildLink(prc.xehmodule)#/main/export?event_id=#event_id#">iCal</a></p>
			<p>#rc.qList.getexcerpt()#</p>
			<p>#rc.qList.getcontent()#</p>
		</div>
		<div class="bottom-box">
			
			<div class="details">
				<h4>Details</h4>
				<span class="s_e_date">Start:</span><br />
					#dateFormat(rc.qList.getevent_startDate(),'d')#  <cfif len(rc.qList.getevent_startTime())> @ #timeFormat(rc.qList.getevent_startTime(),'hh:mm tt')# </cfif><br /><br />
				<span class="s_e_date">End</span><br />
					#dateFormat(rc.qList.getevent_endDate(),'d')# <cfif  len(rc.qList.getevent_endTime())> @ #timeFormat(rc.qList.getevent_endTime(),'hh:mm tt')#</cfif><br /><br />
				<span class="s_e_date">Event Category</span>
			</div>
			
			<div class="venue">
				<h4>Venue</h4>
				<p>#rc.qList.getlocations().getlocation_name()#</p>
				<address>#rc.qList.getlocations().getlocation_address()# <cfif len(rc.qList.getlocations().getlocation_postal_code())>-#rc.qList.getlocations().getlocation_postal_code()#</cfif> </address>
				<p>#rc.qList.getlocations().getlocation_city()#</p>
				<p>#rc.qList.getlocations().getlocation_state()#</p>
				<p>#rc.qList.getlocations().getlocation_country()#</p>
			</div>
			
			<cfif rc.qEnableGoogleMaps.setting_value EQ "true">
				<div class="map">
					<h4>Map</h4>
					<div id="map_canvas" class="" style="height:200px;width:200px;"></div>
				</div>
			</cfif>
			
		</div>
		
		<cfif rc.qShowLove.setting_value EQ "true">
			<div style="clear:both;"></div>
			<p class="developer">This event calendar plugin developed by <a href="http://www.mitrahsoft.com">MitrahSoft</a></p>
		</cfif>
	</div>
	
	<cfif rc.qEnableGoogleMaps.setting_value EQ "true">
	<script>
		var geocoder;
		
		var lat="<cfoutput>#rc.qList.getlocations().getlocation_lat()#</cfoutput>";
		var lng="<cfoutput>#rc.qList.getlocations().getlocation_lng()#</cfoutput>";
	    var map;
          function initialize() {
            geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(lat, lng);
            var myOptions = {
              zoom: 8,
              center: latlng,
              mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
			codeAddress()
          }
		function codeAddress() {
			var location = new google.maps.LatLng(lat, lng);
				marker = new google.maps.Marker({
				map: map,
				position: location
			});
			map.setCenter(marker.getPosition());
		}
		initialize();
	</script>
</cfif>
</cfoutput>
