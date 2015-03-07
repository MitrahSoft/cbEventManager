<cfoutput>
<div class="row-fluid">
	<div class="span12">
		<div class="row">
		#renderView("nav/index")#
	</div>
	<!---<div class="centerNav">--->
		<div class="box" <!---style="margin-left:170px;width:941px;"--->>
			<div class="header">
				<i class="icon-edit icon-large"></i>
				<cfif val(rc.event_id)>
					Edit Event
				<cfelse>
					Add Event 
				</cfif>
				<div style="margin-top:5px" class="btn-group pull-right">
					<a href="#event.buildLink(prc.xehmodule)#/events" class="btn btn-inverse"  rel="bootTip"><i class="icon-reply"></i> Back</a>
			    </div>
			</div>
			<div class="body">
				<div class="tabbable tabs-left">
					
	    			<ul class="nav nav-tabs">
	    				<li class="active"><a href="##Details" data-toggle="tab"><i class="icon-book icon-large"></i>&nbsp;Details</a></li>
	    				<li><a href="##Location" data-toggle="tab"><i class="icon-map-marker icon-large"></i>&nbsp;Location</a></li>
	    				<li><a href="##Organizer" data-toggle="tab"><i class="icon-group icon-large"></i>&nbsp;Organizer</a></li>
	    			</ul>
					
					#html.startForm(action="cbadmin.module.Calendar.events.save",name="entryForm",id="entryForm",class="entryForm",method="post")#
					
						<cfif rc.event_id neq "">
							#html.hiddenField(name="event_id",id="event_id",value="#rc.qData.getevent_id()#")#
							
						</cfif>
						<div class="tab-content">
							
							<div class="tab-pane active" id="Details">
								#html.textField(name="event_name",id="event_name", label="Event Name",value="#rc.qData.getevent_name()#", title="Event Name",class="textfield width98",required="required" ,maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
								
								#html.textarea(name="content",id="content", label="Event Description",value="#rc.qData.getcontent()#", title="Event Description",class="textfield width98",wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group",rows="25")#
								
								#html.textarea(name="excerpt",id="excerpt", label="Event Excerpt",value="#rc.qData.getexcerpt()#", title="Event getexcerpt",class="textfield width98",wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group",rows="10")#
									
								#html.textField(name="event_website",id="event_website", label="Event Website",value="#rc.qData.getevent_website()#", title="Event Website",class="textfield width98",maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
								
								<div class="control-group">
									<label class="control-label" for="event_term">Tag</label>
									<div class="controls">
										<select style="display:none;" id="tags">
											<cfloop index="count" from="1" to="#arraylen(rc.Tag)#">
												<option value="#rc.Tag[count].getterm_id()#"<cfif listcontains(rc.taglist,rc.Tag[count].getterm_id())>selected="selected"</cfif>>#rc.Tag[count].getterm_name()#</option>
											</cfloop>
										</select>
										<select multiple name="event_term" id="event_term" style="width:300px" class="appendTags"></select>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="category">Category</label>
									<div class="controls">
										<select id="event_category" name="category" style="width:300px">
											<option  value="">-- Select category--</option>
											<cfloop query="rc.category">
												<option value="#term_id#"<cfif rc.category.term_id eq rc.catergory_id>selected="selected"</cfif>>#term_name#</option> 
											</cfloop>
										</select>	
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="event_startDate">Start Date</label>
									<div class="controls">
										<input type="text" id="event_startDate" name="event_startDate" class="datepicker valid" required="required" title="" data-original-title="Event Start Date"  value="#rc.qData.getevent_startDate()#">
										<div class="input-append" id='datetimepicker3'>
											<input data-format='hh:mm:ss' type='text' id="event_startTime" name="event_startTime" title="" data-original-title="Event Start Time" value="#rc.qData.getevent_startTime()#"/>
											 <span class='add-on'>
										      <i data-date-icon='icon-calendar' data-time-icon='icon-time'>
										      </i>
										    </span>
										</div>
									</div>
								</div>
									
								<div class="control-group">
									<label class="control-label" for="event_endDate">End Date</label>
									<div class="controls">
										<input type="text" id="event_endDate" name="event_endDate" class="datepicker valid" required="required" title="" data-original-title="Event End Date"  value="#rc.qData.getevent_endDate()#">
										<div class="input-append" id='Enddatetimepicker'>
											<input data-format='hh:mm:ss' type='text' id="event_endTime" name="event_endTime" title="" data-original-title="Event End Time" value="#rc.qData.getevent_endTime()#"/>
											 <span class='add-on'>
										      <i data-date-icon='icon-calendar' data-time-icon='icon-time'>
										      </i>
										    </span>
										</div>
									</div>
								</div>
								<div class="control-group">
	                                <div class="controls">
	                                	<label class="control-label" for="event_allday">
										<input type="checkbox" name="event_allday" id="event_allday" value="1" <cfif rc.qData.getevent_allday() eq "true">checked="checked"</cfif>>All Day</label>
	                                </div>
	                            </div>
							</div>
							
							<div class="tab-pane" id="Location">
								<div class="control-group">
	                                <div class="controls">
	                                    #html.checkbox(name="addNewLocation",id="addNewLocation",value=1)#&nbsp;<b>Add New Location</b>
	                                </div>
	                            </div>
								
								<div class="control-group" id="showLocations">
									<label class="control-label" for="locations">Location</label>
									<div class="controls">
										<select id="location_id" name="locations" required="required" style="width:300px">
											<option  value="">-- Select location --</option>
											<cfloop query="rc.locations">
												<option value="#location_id#"<cfif rc.location_id neq "" and rc.locations.location_id eq rc.location_id>selected="selected"</cfif>>#location_name#</option>
											</cfloop>
										</select>
									</div>
								</div>
								
								<div id="LocationDetails" class="span12" style="display:none;">
								
									#html.hiddenField(name="location_id",id="location_id",value="")#
									#html.hiddenField(name="location_lat",id="location_lat",value="")#
									#html.hiddenField(name="location_lng",id="location_lng",value="")#
									<div class="span6">
										
										#html.textField(name="location_name",id="location_name", label="Name",value="", title="Location Name",class="textfield width84" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
										
										#html.textField(name="location_address",id="location_address", label="Address",value="", title="Location Address",class="textfield width84" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
										
										#html.textField(name="location_city",id="location_city", label="City",value="", title="Location City",class="textfield width84" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
										
										#html.textField(name="location_state",id="location_state", label="State",value="", title="Location State",class="textfield width84" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
												
										<div class="control-group">
											<label class="control-label" for="location_country">Country</label>
											<select name="location_country" id="location_country" style="width:490px">
                                               <option value="">-Select the Country-</option>
                                               <cfloop index="i" from="1" to="#arraylen(prc.countries)#">
                                                    <option value="#prc.countries[i]#">#prc.countries[i]#</option>
                                               </cfloop>
                                           </select>
										</div>
										
										#html.textField(name="location_postal_code",id="location_postal_code", label="Postal Code",value="", title="Location Postal Code",class="textfield width84" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
											
									</div>
									
									<div id="map_holder" style="display:none;margin-top:20px;">
										<div id="map_canvas" class="" style="height:300px;width:300px;"></div>
									</div>
									
								</div>
							</div>
							<div class="tab-pane" id="Organizer">
								<div class="control-group">
	                                <div class="controls">
	                                    #html.checkbox(name="addNewOrganizer",id="addNewOrganizer",value=1)#&nbsp;<b>Add New Organizer</b>
	                                </div>
	                            </div>
								
								<div class="control-group" id="showOrganizers">
									<label class="control-label" for="organizers">Organizer</label>
									<div class="controls">
										<select id="organizer_id" name="organizers" required="required" style="width:300px">
											<option  value="">-- Select organizer--</option>
												<cfloop query="rc.organizer">
													<option value="#organizer_id#"<cfif rc.organizer_id neq "" and rc.organizer.organizer_id eq rc.organizer_id>selected="selected"</cfif>>#organizer_name#</option>
												</cfloop>
										</select>
									</div>
								</div>
								
								<div id="OrganizerDetails" style="display:none;">
						
									#html.textField(name="organizer_name",id="organizer_name", label="Name",value="", title="Organizer Name",class="textfield width98",maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
									
									#html.textField(name="organizer_phone",id="organizer_phone", label="Phone",value="", title="Organizer Phone",class="textfield width98",maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
									
									#html.textField(name="organizer_email",id="organizer_email", label="Email",value="", title="Organizer Email",class="textfield width98",maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
									
									#html.textField(name="organizer_website",id="organizer_website", label="Website",value="", title="Organizer Website",class="textfield width98",maxlength="100" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
											
								</div>
							</div>
							<div class="center">
								#html.submitButton(value="Save",class="btn btn-danger")#
							</div>
						</div>
					
					#html.endForm()#
				</div>
			</div>
		</div>
	</div>
</div>
</cfoutput>
<link href="http://ivaynberg.github.io/select2/select2-3.4.3/select2.css?ts=2013-09-17T19%3A01%3A19-07%3A00" rel="stylesheet"/>
<script src="http://ivaynberg.github.io/select2/select2-3.4.3/select2.js?ts=2013-09-17T19%3A01%3A19-07%3A00"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script type="text/javascript">
// Load Custom Editor Assets, Functions, etc.

			function checkIsDirty(){
				return $content.ckeditorGet().checkDirty();
			}
			function getEditorContent(){
				return $content.ckeditorGet().getData();
			}


function setupEditors($theForm, withExcerpt, saveURL, withChangelogs){
	// Setup global editor elements
	$targetEditorForm   	= $theForm;
	$targetEditorSaveURL 	= saveURL;
	$uploaderBarLoader 		= $targetEditorForm.find("#uploadBarLoader");
	$uploaderBarStatus 		= $targetEditorForm.find("#uploadBarLoaderStatus");
	$excerpt				= $targetEditorForm.find("#excerpt");
	$content 				= $targetEditorForm.find("#content");
	$isPublished 			= $targetEditorForm.find("#isPublished");
	$contentID				= $targetEditorForm.find("#contentID");
	$changelog				= $targetEditorForm.find("#changelog");
	$changelogMandatory		= false;
	
	// with excerpt
	if( withExcerpt == null ){ withExcerpt = true; }
	// with changelogs
	if( withChangelogs == null ){ withChangelogs = true; }
	
	// Startup the choosen editor
	
			// toolbar Configuration
			var ckToolbar = $.parseJSON( '[{"items":["Source","-","Maximize","ShowBlocks"],"name":"document"},{"items":["Cut","Copy","Paste","PasteText","PasteFromWord","-","Undo","Redo"],"name":"clipboard"},{"items":["Find","Replace","SpellChecker"],"name":"editing"},{"items":["Form","Checkbox","Radio","TextField","Textarea","Select","Button","HiddenField"],"name":"forms"},"\/",{"items":["Bold","Italic","Underline","Strike","Subscript","Superscript","-","RemoveFormat"],"name":"basicstyles"},{"items":["NumberedList","BulletedList","-","Outdent","Indent","-","Blockquote","CreateDiv","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock","-","BidiLtr","BidiRtl"],"name":"paragraph"},{"items":["Link","Unlink","Anchor"],"name":"links"},"\/",{"items":["Styles","Format"],"name":"styles"},{"items":["TextColor","BGColor"],"name":"colors"},{"items":["Image","Flash","Table","HorizontalRule","Smiley","SpecialChar","Iframe","InsertPre"],"name":"insert"},{"items":["MediaEmbed","cbIpsumLorem","cbWidgets","cbContentStore","cbLinks","cbEntryLinks"],"name":"contentbox"}]' );
			var ckExcerptToolbar = $.parseJSON( '[{"items":["Source","ShowBlocks"],"name":"document"},{"items":["Bold","Italic","Underline","Strike","Subscript","Superscript"],"name":"basicstyles"},{"items":["NumberedList","BulletedList","-","Outdent","Indent","CreateDiv"],"name":"paragraph"},{"items":["Link","Unlink","Anchor"],"name":"links"},{"items":["Image","Flash","Table","HorizontalRule","Smiley","SpecialChar"],"name":"insert"},{"items":["MediaEmbed","cbIpsumLorem","cbWidgets","cbContentStore","cbLinks","cbEntryLinks"],"name":"contentbox"}]' );
			
			// Activate ckeditor on content object
			$content.ckeditor( function(){}, {
					extraPlugins : 'cbKeyBinding,cbWidgets,cbLinks,cbEntryLinks,cbContentStore,cbIpsumLorem,wsc,mediaembed,insertpre',
					
					toolbar: ckToolbar,
					toolbarCanCollapse: true,
					height:300,
					filebrowserBrowseUrl : 'http://contentbox.local:8080/index.cfm/cbadmin/ckfilebrowser/',
					filebrowserImageBrowseUrl : 'http://contentbox.local:8080/index.cfm/cbadmin/ckfilebrowser/',
					filebrowserFlashBrowseUrl : 'http://contentbox.local:8080/index.cfm/cbadmin/ckfilebrowser/',
					baseHref : 'http://contentbox.local:8080//'
				} );
				
			// Active Excerpts
			if (withExcerpt) {
				$excerpt.ckeditor(function(){}, {
					
					toolbar: ckExcerptToolbar,
					toolbarCanCollapse: true,
					height: 175,
					filebrowserBrowseUrl: 'http://contentbox.local:8080/index.cfm/cbadmin/ckfilebrowser/',
					baseHref: 'http://contentbox.local:8080//'
				});
			}
	// Activate Date fields
	$("[type=date]").datepicker();
	$(".datepicker").datepicker();
	
$(".entryForm").validate({});

}
$('#addNewLocation').click(function() {
	if ($(this).is(':checked')) {
		$("#showLocations").hide();
		$('#LocationDetails').show();
		$("#location_id").removeAttr('required');
		$("#location_name")[0].setAttribute("required", "true");
		$("#location_address")[0].setAttribute("required", "true");
		$("#location_city")[0].setAttribute("required", "true");
		$("#location_state")[0].setAttribute("required", "true");
		$("#location_country")[0].setAttribute("required", "true");
	}
	else {
		$("#showLocations").show();
		$('#LocationDetails').hide();
		$("#location_name,#location_address,#location_city,#location_state,#location_country").removeAttr('required');
		$("#location_id")[0].setAttribute("required", "true");
	}
});
	
$('#addNewOrganizer').click(function() {	
		if ($(this).is(':checked')) {
			$("#showOrganizers").hide();
			$('#OrganizerDetails').show();
			$('#organizer_id').removeAttr('required');
			$("#organizer_name")[0].setAttribute("required", "true");
			$("#organizer_website")[0].setAttribute("required", "true");
		}
		else {
			$("#showOrganizers").show();
			$('#OrganizerDetails').hide();
			$("#organizer_id")[0].setAttribute("required", "true");
			$("#organizer_name").removeAttr('required');
			$("#organizer_website").removeAttr('required');
		}
	});
$(function(){  

	var opts = $("#tags").html(), opts2 = "<option></option>" + opts;
	    $("select.appendTags").each(function(){
	        var e = $(this);
	        e.html(e.hasClass("placeholder") ? opts2 : opts);
	    });
		
	$('#event_category,#organizer_id,#location_country,#event_term').select2();
	$('#location_id').select2();
 	// Editor Pointers
	$entryForm 		= $("#entryForm");
	// setup editors via _tags/editors.cfm by passing the form container
	setupEditors( $entryForm, true);
	
	 $('#datetimepicker3').datetimepicker({
		  pickDate: false
	});
	 $('#Enddatetimepicker').datetimepicker({
		  pickDate: false
	});
});

	var geocoder;
		var map;
		var marker;
		var enablemap = '#val(rc.qGMap.setting_value)#';
	
	function initialize() {
		geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(-34.397, 150.644);
		var mapOptions = {
			zoom: 8,
			center: latlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		}
		map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
		
		if ($('#location_address').val() != "" && $('#location_city').val() != "" && $('#location_country').val() != "" && enablemap) {
			codeAddress();
			$('#map_holder').css('display', 'block');
		}
	}
	
	function toggleBounce() {
		if (marker.getAnimation() != null) {
			marker.setAnimation(null);
		} else {
			marker.setAnimation(google.maps.Animation.BOUNCE);
		}
	}

	function codeAddress() {
		var address="";
		//initialize();
		$.each( $("#location_name, #location_address, #location_city, #location_country"),function(element){
			if($(this).val() !=""){
				if(address != ""){address+=", "}
				address+= $(this).val();
				
			}
		});
		
		geocoder.geocode( { 'address': address}, function(results, status) {//console.log(address);
		
			if (status == google.maps.GeocoderStatus.OK) {
				var location = results[0].geometry.location;
				if(marker){
			        marker.setPosition(location);
				} else {
					marker = new google.maps.Marker({
						map: map,
						draggable:true,
						position: location
					});
				}
				map.setCenter(marker.getPosition());
				document.getElementById("location_lat").value=marker.getPosition().lat();
				document.getElementById("location_lng").value=marker.getPosition().lng();
				google.maps.event.addListener(marker, 'click', toggleBounce);
			
				google.maps.event.addListener(marker, "drag", function(){
					document.getElementById("location_lat").value=marker.getPosition().lat();
					document.getElementById("location_lng").value=marker.getPosition().lng();
			    });
			}
			else if(enablemap){
				userMessage(message="Location Not Found in Map. You can search for a nearest city and drag to the exact location.", type="warning");
			}
		});
	}

	google.maps.event.addDomListener(window, 'load', initialize);
	
	$("#location_name, #location_address, #location_city, #location_country").on('change', function(){
		if ($('#location_address').val() != "" && $('#location_city').val() != "" && $('#location_country').val() != "") {
			codeAddress();
			if(enablemap){
				$('#map_holder').css('display', 'block');
			}
			google.maps.event.trigger(map, 'resize');
		}
		else if(enablemap) {
			$('#map_holder').css('display', 'none');
		}
	});
</script>