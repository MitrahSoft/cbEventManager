<cfoutput>
<div class="box">
	<div class="event_box">
		<div class="up_coming"><h3>Upcomming Events</h3></div>
		<div class="month"><h3>#dateFormat(now(),'mmmm yyyy')#</h3></div>
		<cfloop query="rc.qList">
			<div style="height:auto;">
				
				<span style="vertical-align:top;"><input type="checkbox" name="event_name_check" value="#event_id#" class="event_name_check"></span><a href="javascript:void(0)" onclick="getDetails(#event_id#)"> <strong style="font-size:17px;">#event_name#</strong></a></span>
				<cfif event_startDate eq event_endDate>
					<p class="event_date">#dateFormat(event_startDate,'mmmm d')# <cfif len(event_startTime) or  len(event_endTime)> @ </cfif> #timeFormat(event_startTime,'hh:mm tt')# <cfif len(event_startTime) and  len(event_endTime)> - </cfif>  #timeFormat(event_endTime,'hh:mm tt')# </p>
				<cfelseif len(event_startDate) and len(event_endDate)>
					<p class="event_date">#dateFormat(event_startDate,'mmmm d')# - #dateFormat(event_endDate,'d')# </p>
				<cfelse>
					<p class="event_date">#dateFormat(event_startDate,'mmmm d')#</p>
				</cfif>
				
				<div class="event_desc">
					#excerpt#
				</div>
				
				<a href="javascript:void(0)" onclick="getDetails(#event_id#)">Find out more>></a>
			</div>
			<div style="clear:both;">&nbsp;</div>
		</cfloop>
	</div>
	
	<div id="pagenation">
		<cfset search_string = "">
		
		<cfif len(rc.searchterm) OR len(rc.searchdate)>
			<cfset search_string = "&searchterm=#rc.searchterm#&searchdate=#rc.searchdate#">
		</cfif>
		<cfif val(rc.tag)>
			<cfset search_string = search_string & "&tag=#rc.tag#">
		</cfif>
		<cfif ceiling(val(rc.qCount.recordcount)/#rc.eventsPerPage#) gt 1>     
			<cfif rc.pageNo neq 1>
				<cfset prev=rc.pageNo-1>
				<span id="list_previous"><a href="javascript:void(0)" onclick="searchEvents(tag=#prev#,qString='pagenation')"><i class="icon-backward">&nbsp;&nbsp;&nbsp;&nbsp;PreviousEvents</i></a></span>
			</cfif>
			<cfif rc.pageNo neq #ceiling(val(rc.qCount.recordcount)/rc.eventsPerPage)# >
				<cfset next=rc.pageNo+1>
				<span id="list_next" class="offset10"><a href="javascript:void(0)" onclick="searchEvents(tag=#next#,qString='pagenation')"><li class="icon-forward">&nbsp;&nbsp;&nbsp;NextEvents</li></a></span>
			</cfif>
		</cfif>
	</div>
	
	<cfif rc.qShowLove.recordcount AND rc.qShowLove.setting_value EQ "true">
		<div style="clear:both;"></div>
		<p class="developer">This event calendar plugin developed by <a href="http://www.mitrahsoft.com">MitrahSoft</a></p>
	</cfif>
	</div>
</div>
</cfoutput>