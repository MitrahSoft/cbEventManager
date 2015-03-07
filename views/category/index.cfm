<cfoutput>
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="row">
			#renderView("nav/index")#
		</div>
		<div class="box">
			<div class="header">
				<i class="icon-sitemap icon-large"></i>
				Categories
			</div>
			<div class="body">
				
				#html.startForm(action="cbadmin.module.Calendar.category.index",name="searchPage",id="searchPage",method="post")#
					<div class="well well-small" id="contentBar">
						
						#getPlugin("MessageBox").renderit()#
						
						<div class="buttonBar">
							<a class="btn btn-danger" href="#event.buildLink(prc.xehmodule)#/category/addEdit">Create Category</a>
						</div>
						
						<div class="filterBar">
							<div>
							 	#html.label(field="pageSearch",content="Quick Filter:",class="inline")#
							  	#html.textField(name="pageSearch",size="30",class="textfield")#
							</div>
						</div>
					</div>
				#html.endForm()#
				
				<table class="table tablesorter table-hover" name="categoryForm" id="categoryForm">
					<thead>
						<tr>
							<th>Name</th>
							<th>Background color</th>
							<th>Slug</th>
							<th class="action nosort">Actions</th>
						</tr>
					</thead>
					<tbody>
						<cfloop query="prc.qData">
							<tr>
								<td>#term_name#</td>
								<td>#term_bg_color#</td>
								<td>#term_slug#</td>
								<td>
									<div class="btn-group">
										<a title="" href="##" data-toggle="dropdown" class="btn dropdown-toggle" data-original-title="Page Actions">
											<i class="icon-cogs icon-large"></i>
										</a>
										<ul class="dropdown-menu text-left pull-right">
											<li><a href="#event.buildLink(prc.xehmodule)#/category/addEdit?term_id=#term_id#"><i class="icon-edit icon-large"></i> Edit</a></li>
											<li><a href="javascript:void(0);" onclick="javascript:confirmDelete(#term_id#)"><i class="icon-trash icon-large"></i> Delete</a></li>
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
		<div class="small_box" id="help_tips">
			<div class="header">
				<i class="icon-question-sign"></i> Help Tips
			</div>
			<div class="body">
				<ul class="tipList unstyled">
					<li><i class="icon-lightbulb icon-larg"></i> Event colors based on Category</li>
					<li><i class="icon-lightbulb icon-larg"></i> Sorting is only done within your paging window</li>
					<li><i class="icon-lightbulb icon-larg"></i> Quick Filtering is only for viewed results</li>
					<li><i class="icon-lightbulb icon-larg"></i> Create Category is Only used for add new Category</li>
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
			$.uiTableFilter( $("#categoryForm"), this.value);
			
		})
	});
</script>