<cfoutput>

<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="row">
			#renderView("nav/index")#
		</div>
		<div class="box">
			<div class="header">
				<i class="icon-group icon-large"></i>
				Organizers
			</div>
			<div class="body">
				#html.startForm(action="cbadmin.module.Calendar.Organizers.index",name="searchPage",id="searchPage",method="post")#
					<div class="well well-small" id="contentBar">
						
						#getPlugin("MessageBox").renderit()#
						
						<div class="buttonBar">
							<a class="btn btn-danger" href="#event.buildLink(prc.xehmodule)#/organizers/addEdit">Create Organizer</a>
						</div>
						
						<div class="filterBar">
							<div>
								#html.label(field="pageSearch",content="Quick Filter:",class="inline")#
							  	#html.textField(name="pageSearch",size="30",class="textfield")#
							</div>
						</div>
					</div>
				#html.endForm()#
				<table class="table tablesorter table-hover" name="organizerForm" id="organizerForm">
					<thead>
						<tr>
							<th>Name</th>
							<th>Phone</th>
							<th>Email</th>
							<th>Website</th>
				
							<th class="nosort">Actions</th>
						</tr>
					</thead>
					<tbody>
						<cfloop query="rc.qData">
							<tr>
								<td>#organizer_name#</td>
								<td>#organizer_phone#</td>
								<td>#organizer_email#</td>
								<td>#organizer_website#</td>
								<td>
									<div class="btn-group">
										<a title="" href="##" data-toggle="dropdown" class="btn dropdown-toggle" data-original-title="Page Actions">
											<i class="icon-cogs icon-large"></i>
										</a>
										<ul class="dropdown-menu text-left pull-right">
											<li><a href="#event.buildLink(prc.xehmodule)#/organizers/addEdit?organizer_id=#organizer_id#"><i class="icon-edit icon-large"></i> Edit</a></li>
											<li><a href="javascript:void(0);" onclick="javascript:confirmDelete(#organizer_id#)"><i class="icon-trash icon-large"></i> Delete</a></li>
										</ul>
									</div>
								</td>
							</tr>
						</cfloop>
					</tbody>
				</table>
				<span class="label label-info">Total Records: #rc.qData.recordCount#</span>
			</div>
		</div>
	</div>
	<div class="span3" id="main-sidebar">
		<div class="small_box">
			<div class="header">
				<i class="icon-medkit"></i> Need Help?
			</div>
			<div class="body">
				<a href="http://www.MitrahSoft.com" target="_blank"><img src="#event.getModuleRoot('Calendar')#/includes/assets/images/MitrahSoft-logo.png" alt="info"  width="250" height="24"/></a>
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
			$.uiTableFilter( $("#organizerForm"), this.value);
		})
	});
</script>