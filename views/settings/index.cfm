<cfoutput>
	
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="row">
			#renderView("nav/index")#
		</div>
		<div class="box">
			<div class="header">
				<i class="icon-cogs icon-large"></i> Settings
			</div>
			<div class="body">
				#getPlugin("MessageBox").renderit()#
				
				<form class="form-horizontal settingsForm" id="settingsForm" name="settingsForm" action="#event.buildLink(prc.xehmodule)#/Settings/save" method="post">
					<div class="control-group">
						<label class="control-label" for="setting_value">Events Per Page</label>
						<div class="controls">
							#html.textField(name="eventsperpage",id="setting_value", value="#rc.eventsperpage#", title="Events Per Page",class="textfield width98",required="required")#
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="enableGoogleMaps">Enable Google Maps</label>
						<div class="controls">
							#html.checkbox(name="enableGoogleMaps",id="setting_enableGoogleMaps",checked=rc.enableGoogleMaps,value=true)# 
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="enableSearchBar">Enable Search Bar</label>
						<div class="controls">
							#html.checkbox(name="enableSearchBar",id="setting_enableSearchBar",checked=rc.enableSearchBar,value=true)# 
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="setting__showlove">Show Some Love</label>
						<div class="controls">
							#html.checkbox(name="showsomelove",id="setting_showlove",checked=rc.showsomelove,value=true)# 
						</div>
					</div>
					
					<div class="center">
						#html.submitButton(value="Save",class="btn btn-danger")#
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<div class="span3" id="main-sidebar">
		<div class="small_box" id="help_tips">
			<div class="header">
				<i class="icon-question-sign"></i> Help Tips
			</div>
			<div class="body">
				<ul class="tipList unstyled">
					<li><i class="icon-lightbulb icon-larg"></i> You can set events per page to restrict the events Display!</li>
					<li><i class="icon-lightbulb icon-larg"></i> Enabling maps in google will make the user to locate the venue easily</li>
					<li><i class="icon-lightbulb icon-larg"></i> Enabling Search bar will display search bar with several options on the Calendar.</li>
					<li><i class="icon-lightbulb icon-larg"></i> Show Some Love will display the info of the author</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".settingsForm").validate({});
	});
</script>
</cfoutput>
