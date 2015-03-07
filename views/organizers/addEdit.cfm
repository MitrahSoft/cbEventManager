<cfoutput>
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="row">
			#renderView("nav/index")#
		</div>
		<div class="box">
			<div class="header">
				<i class="icon-edit icon-large"></i>
				<cfif val(rc.organizer_id)>
					Edit Organizer
				<cfelse>
					Add Organizer
				</cfif>
				<div style="margin-top:5px" class="btn-group pull-right">
					<a href="#event.buildLink(prc.xehmodule)#/organizers" class="btn btn-inverse"  rel="bootTip"><i class="icon-reply"></i> Back</a>
			    </div>
			</div>
			<div class="body">
					#html.startForm(action="cbadmin.module.Calendar.organizers.save",name="organizerForm",id="organizerForm",class="organizerForm",method="post")#
				
						<cfif rc.organizer_id neq "">
							#html.hiddenField(name="organizer_id",id="organizer_id",value="#rc.qData.getorganizer_id()#")#
						</cfif>
				
						#html.textField(name="organizer_name",id="organizer_name", label="Name",value="#rc.qData.getorganizer_name()#", title="Organizer Name",class="textfield width98",required="required" ,maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
							
						#html.textField(name="organizer_phone",id="organizer_phone", label="Phone",value="#rc.qData.getorganizer_phone()#", title="Organizer Phone",class="textfield width98",required="required" ,maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
						
						#html.textField(name="organizer_email",id="organizer_email", label="Email",value="#rc.qData.getorganizer_email()#", title="Organizer Email",class="textfield width98",required="required" ,maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
							
						#html.textField(name="organizer_website",id="organizer_website", label="Website",value="#rc.qData.getorganizer_website()#", title="Organizer Website",class="textfield width98",required="required" ,maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
							
					
					<div class="center">
						#html.submitButton(value="Save",class="btn btn-danger")#
					</div>
				
				#html.endForm()#
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
					<li><i class="icon-lightbulb icon-larg"></i> Help the user by dropping some details about the event organizers, So that the user can filter the events accordingly.</li>
				</ul>
			</div>
		</div>	
	</div>
</div>
</cfoutput>

<script type="text/javascript">

$(document).ready(function() {
	$(".organizerForm").validate({
  rules: {
    organizer_email: {
      email: true
    },
	 organizer_website: {
      url: true
    }
  }
});
});
</script>