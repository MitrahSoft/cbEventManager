<cfoutput>

<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="row">
			#renderView("nav/index")#
		</div>
		<div class="box">
			<div class="header">
				<i class="icon-map-marker icon-large"></i>
				Locations
			</div>
			<div class="body">
				#html.startForm(action="cbadmin.module.Calendar.locations.index",name="searchPage",id="searchPage",method="post")#
					<div class="well well-small" id="contentBar">
						
						#getPlugin("MessageBox").renderit()#
	
						<div class="buttonBar">
							<a class="btn btn-danger" href="#event.buildLink(prc.xehmodule)#/locations/addEdit">Create Location</a>	
						</div>
						
						<div class="filterBar">
							<div>
								#html.label(field="pageSearch",content="Quick Filter:",class="inline")#
							  	#html.textField(name="pageSearch",size="30",class="textfield")#
							</div>
						</div>
					</div>
				#html.endForm()#
				<table class="table tablesorter table-hover" name="locationForm" id="locationForm">
					<thead>
						<tr>
							<th>Name</th>
							<th>Address</th>
							<th>City</th>
							<th>State</th>
							<th>Country</th>
							<th>Postal Code</th>
							<th class="nosort">Actions</th>
						</tr>
					</thead>
					<tbody>
						<cfloop query="prc.qData">
							<tr>
								<td>#location_name#</td>
								<td>#location_address#</td>
								<td>#location_city#</td>
								<td>#location_state#</td>
								<td>#location_country#</td>
								<td>#location_postal_code#</td>
								<td>
									<div class="btn-group">
										<a title="" href="##" data-toggle="dropdown" class="btn dropdown-toggle" data-original-title="Page Actions">
											<i class="icon-cogs icon-large"></i>
										</a>
										<ul class="dropdown-menu text-left pull-right">
											<li><a href="#event.buildLink(prc.xehmodule)#/locations/addEdit?location_id=#location_id#"><i class="icon-edit icon-large"></i> Edit</a></li>
											<li><a href="javascript:void(0);" onclick="javascript:confirmDelete(#location_id#)"><i class="icon-trash icon-large"></i> Delete</a></li>
										</ul>
									</div>
								</td>
							</tr>
						</cfloop>
					</tbody>
				</table>
				<span class="label label-info">Total Records: #prc.qData.recordCount#</span>
			</div>
		</div>
	</div>
	<div class="span3" id="main-sidebar">
		<div class="small_box">
			<div class="header">
				<i class="icon-filter"></i> Filters
			</div>
			<div class="body" id="filterBox">
				#html.startForm(name="pageFilterForm", action="cbadmin.module.Calendar.locations.index")#
					<label for="location_country">Country</label>
					<select name="location_country" id="location_country" class="input-block-level">
						<option value="">--Select the Country--</option>
						<cfloop index="i" from="1" to="#arraylen(prc.countries)#">
							<option value="#prc.countries[i]#" <cfif isDefined('rc.location_country') AND rc.location_country NEQ "" AND rc.location_country EQ prc.countries[i] AND not isDefined('rc.reset')>selected = "selected" </cfif>>#prc.countries[i]#</option>
						</cfloop>
					</select>
					#html.submitButton(name="ApllyFilters",class="btn btn-danger",id="ApplyFilters",value="Apply Filters")#
					#html.submitButton(name="Reset",class="btn",value="Reset")#
				#html.endForm()#
			</div>
		</div>
		
		<div class="small_box" id="help_tips">
			<div class="header">
				<i class="icon-question-sign"></i> Help Tips
			</div>
			<div class="body">
				<ul class="tipList unstyled">
					<li><i class="icon-lightbulb icon-larg"></i> Sorting is only done within your paging window</li>
					<li><i class="icon-lightbulb icon-larg"></i> Quick Filtering is only for viewed results</li>
					<li><i class="icon-lightbulb icon-larg"></i> Apply Filters based on Country</li>
				</ul>
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
			$.uiTableFilter( $("#locationForm"), this.value);
		})
	});
</script>