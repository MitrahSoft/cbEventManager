
<cfoutput>
	<cfset vCal = "">
	<cfset CRLF = "#chr(13)#">
	<cfset vCal = "BEGIN:VCALENDAR" & CRLF>
	<cfset vCal = vCal & "PRODID:-//Microsoft Corporation//Outlook 10.0 MIMEDIR//EN" & CRLF>
	<cfset vCal = vCal & "VERSION:2.0" & CRLF>
	<cfset vCal = vCal & "METHOD:PUBLISH" & CRLF>
</cfoutput>

<cfoutput>	
	<cfloop index="count" from="1" to="#arraylen(rc.qData)#">
		<cfset  vCal = vCal & "BEGIN:VEVENT" & CRLF>
		<cfset vCal = vCal & "ORGANIZER:MAILTO:#rc.qData[count].getorganizers().getorganizer_email#" & CRLF>
		<cfset vCal = vCal & "DTSTART:" & DateFormat(rc.qData[count].getevent_startDate(),"yyyymmdd") & "T" & TimeFormat(rc.qData[count].getevent_startTime(), "HHmmss") & "Z" & CRLF>
		<cfset vCal = vCal & "DTEND:" & DateFormat(rc.qData[count].getevent_endDate(),"yyyymmdd") & "T" & TimeFormat(rc.qData[count].getevent_endTime(), "HHmmss") & "Z" & CRLF>
		<cfset vCal = vCal & "LOCATION:" & "#rc.qData[count].getlocations().getlocation_name()# #rc.qData[count].getlocations().getlocation_address()# #rc.qData[count].getlocations().getlocation_city()# #rc.qData[count].getlocations().getlocation_state()# #rc.qData[count].getlocations().getlocation_country()#" & CRLF>
		<cfset vCal = vCal & "TRANSP:OPAQUE"  & CRLF>
		<cfset vCal = vCal & "SEQUENCE:0"  & CRLF>
		<cfset vCal = vCal & "DESCRIPTION:">
		<!---Convert CF_CRLF (13_10) into =0D=0A with CR/LF and indent sequences--->
		<cfif len('rc.qData[count].getcontent()')>
			<cfset description = REReplace(rc.qData[count].getcontent(),"[#Chr(13)##Chr(10)#]", "=0D=0A=#Chr(13)##Chr(10)#     ", "ALL")>
		<cfelse>
			<cfset description = "Autobot VCalendar Generated">
		</cfif>
		<cfset vCal = vCal & description & CRLF>
		<cfset vCal = vCal & "SUMMARY:" & rc.qData[count].getevent_name() & CRLF>
		<cfset vCal = vCal & "PRIORITY:" & 1 & CRLF>
		<cfset vCal = vCal & "CLASS:PUBLIC" & CRLF>
		<cfset vCal = vCal & "END:VEVENT" & CRLF>
	</cfloop>
	<cfset vCal = vCal & "END:VCALENDAR">   
	<cfsetting enablecfoutputonly="no" />	
	<cfsetting showdebugoutput="false" />
	<cfcontent type="text/calendar" >
	<cfsilent>
	<cfheader name="Content-Disposition" value="attachment; filename=myiCal.ics">


 
	<cfcontent
type="text/plain"
variable="#ToBinary( ToBase64(vCal))#"
/>
 
</cfsilent>
</cfoutput>