<cfoutput>

<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="row">
			#renderView("nav/index")#
		</div>
		<div class="box">
			<div class="header">	
				<i class="icon-calendar icon-large"></i>
				Events
			</div>
			<div class="body">
				#html.startForm(action="cbadmin.module.Calendar.events.index",name="searchPage",id="searchPage",method="post")#
					<div class="well well-small" id="contentBar">
						
						#getPlugin("MessageBox").renderit()#
						
						<div class="buttonBar">
							<a class="btn btn-danger" href="#event.buildLink(prc.xehmodule)#/events/addEdit">Create Event</a>
						</div>
						
						<div class="filterBar">
							<div>
								#html.label(field="pageSearch",content="Quick Filter:",class="inline")#
							  	#html.textField(name="pageSearch",size="30",class="textfield")#
							</div>
						</div>
					</div>
				#html.endForm()#
					
				<table class="table tablesorter table-hover" name="eventForm" id="eventForm">
					<thead>
						<tr>
							<th>Name</th>
							<th>Location</th>
							<th>Organizer</th>
							<th>Start Date</th>
							<th>End Date</th>
							<th class="nosort">Actions</th>
						</tr>
					</thead>
					<tbody>
						<cfloop index="count" from="1" to="#arraylen(prc.qData)#">
							<tr>
								<td>#prc.qData[count].getevent_name()#</td>
								<td>#prc.qData[count].getlocations().getlocation_name()#</td>
								<td>#prc.qData[count].getorganizers().getorganizer_name()#</td>
								<td>#prc.qData[count].getevent_startDate()#&nbsp;#timeFormat(prc.qData[count].getevent_startTime(),"hh:mm tt")#</td>
								<td>#prc.qData[count].getevent_endDate()#&nbsp;#timeFormat(prc.qData[count].getevent_endTime(),"hh:mm tt")#</td>
								<td>
									<div class="btn-group">
										<a title="" href="##" data-toggle="dropdown" class="btn dropdown-toggle" data-original-title="Page Actions">
											<i class="icon-cogs icon-large"></i>
										</a>
										<ul class="dropdown-menu text-left pull-right">
											<li><a href="#event.buildLink(prc.xehmodule)#/events/addEdit?event_id=#prc.qData[count].getevent_id()#"><i class="icon-edit icon-large"></i> Edit</a></li>
											<li><a href="javascript:void(0);" onclick="javascript:confirmDelete(#prc.qData[count].getevent_id()#)"><i class="icon-trash icon-large"></i> Delete</a></li>
										</ul>
									</div>
								</td>
							</tr>
						</cfloop>
					</tbody>
				</table>
				<span class="label label-info">Total Records: #ArrayLen(prc.qData)#</span>
			</div>
		</div>
	</div>
	<div class="span3" id="main-sidebar">
		<div class="small_box">
			<div class="header">
				<i class="icon-filter"></i> Filters
			</div>
			<div class="body" id="filterBox">
				#html.startForm(name="pageFilterForm", action="cbadmin.module.Calendar.events.index")#
					<label for="status">status</label>
					<select id="status" name="status">
						<option  value="All">All</option>
						<option  value="Completed"<cfif isDefined('rc.status') AND rc.status EQ "completed" AND not isDefined('rc.reset')>selected = "selected" </cfif>>Completed</option>
						<option  value="Upcoming"<cfif isDefined('rc.status') AND rc.status EQ "upcoming" AND not isDefined('rc.reset')>selected = "selected" </cfif>>Upcoming</option>
					</select>
					#html.submitButton(name="ApllyFilters",class="btn btn-danger",id="ApplyFilters",value="Apply Filters")#
					#html.submitButton(name="Reset",class="btn",value="Reset")#
				#html.endForm()#
			</div>
		</div>
	</div>
</div>
</cfoutput>	
<script>
	$(document).ready(function() {
		$("#pageSearch").keyup(function(){
			
			if($('.textfield').val().length == 0){
				$('.label-info').show();	
			}else{
				$('.label-info').hide();
			}
			$.uiTableFilter( $("#eventForm"), this.value);
			
		})
	});
</script>