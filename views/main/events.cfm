<cfoutput>
<cfset request.layout = false>[<cfloop index="count" from="1" to="#arraylen(rc.qEvents)#"><cfsilent>
	
	<cfset dateDiff_value="#dateDiff('d' ,dateAdd('d',-1,rc.qEvents[count].getevent_startdate()),rc.qEvents[count].getevent_enddate())#">
	<cfset days_value=''>
	
	<cfif variables.dateDiff_value gt 1><cfset days_value="(#dateDiff_value# days from #dateFormat(rc.qEvents[count].getevent_startdate() ,'dd')#-#dateFormat(rc.qEvents[count].getevent_enddate() ,'dd mmm yyyy')#)"></cfif>
	
	<cfset description="<span style='color:##C83A28;font:bold 9pt arial'>#rc.qEvents[count].getevent_name()#" & days_value &" </span> <br> #dateFormat(rc.qEvents[count].getevent_startdate() ,'dd mmmm yyyy')# <br> #rc.qEvents[count].getlocations().getlocation_state()#,#rc.qEvents[count].getlocations().getlocation_country()# <br><span><a href='javascript:void(0)' onclick='getDetails(#rc.qEvents[count].getevent_id()#)'>More Details</a></span> | <span><a href='#event.buildLink(prc.xehexport)#?event_id=#rc.qEvents[count].getevent_id()#'><img src='#event.getModuleRoot('Calendar')#/includes/assets/images/calendar_butt_icon.gif'></a></span> <br> <span style='color:##888989'>organized by #rc.qEvents[count].getorganizers().getorganizer_name()#</span> ">
	
	
</cfsilent>{"id":#rc.qEvents[count].getevent_id()#,"title":"#rc.qEvents[count].getevent_name()#","start":"#dateFormat(rc.qEvents[count].getevent_startdate() ,'yyyy-mm-dd')# #timeFormat(rc.qEvents[count].getevent_startTime(),'HH:mm')#","end":"#dateFormat(rc.qEvents[count].getevent_enddate() ,'yyyy-mm-dd')# #timeFormat(rc.qEvents[count].getevent_endTime(),'HH:mm')#","backgroundColor" :"#rc.qEvents[count].getcategory().getterm_bg_color()#","borderColor":"#rc.qEvents[count].getcategory().getterm_bg_color()#","textColor" : "##FFF","description":"#description#","allDay":#rc.qEvents[count].getevent_allDay()#}<cfif count neq #arraylen(rc.qEvents)#>,</cfif>
</cfloop>]
</cfoutput> 
