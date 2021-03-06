<cfoutput>
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="row">
			#renderView("nav/index")#
		</div>
		<div class="box">
			<div class="header">
				<i class="icon-edit icon-large"></i>
				<cfif val(rc.term_id)>
					Edit Category
				<cfelse>
					Add Category
				</cfif>
				<div style="margin-top:5px" class="btn-group pull-right">
					<a href="#event.buildLink(prc.xehmodule)#/category" class="btn btn-inverse"  rel="bootTip"><i class="icon-reply"></i> Back</a>
			    </div>
			</div>
			<div class="body">
				#html.startForm(action="cbadmin.module.Calendar.category.save",name="CategoryForm",id="CategoryForm",class="CategoryForm",method="post")#
				
					<cfif rc.term_id neq "">
						#html.hiddenField(name="term_id",id="term_id",value="#rc.qData.getterm_id()#")#
					</cfif>
					
					#html.hiddenField(name="term_type",id="term_type",value="category")#
					
					#html.textField(name="term_name",id="term_name", label="Name",value="#rc.qData.getterm_name()#", title="Category Name",class="textfield width98",required="required" ,maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
							
					#html.textField(name="term_bg_color",id="bscp", label="Background Color",value="#rc.qData.getterm_bg_color()#", title="Category BG Color",class="textfield width98",required="required" ,maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
							
					#html.textField(name="term_slug",id="term_slug",label="Slug",class="textfield width98",title="Category Slug",wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group",required="required",value="#rc.qData.getterm_slug()#" )#
							
					
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
					<li><i class="icon-lightbulb icon-larg"></i> Help the user by dropping some details about the category, So that the user can filter the events accordingly.</li>
				</ul>
			</div>
		</div>	
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
 	$(".CategoryForm").validate({});
});
</script>
</cfoutput>
