<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<cfoutput>
	<style>
		.row-fluid [class*="span"]{
			margin-left:0.1% !important;
		}
	</style>
<div class="row-fluid">
	<div class="span9" id="main-content">
		<div class="row">
			#renderView("nav/index")#
		</div>
		<div class="box span12">
			<div class="header">
				<i class="icon-edit icon-large"></i>
				<cfif val(rc.location_id)>
					Edit Location
				<cfelse>
					Add Location
				</cfif>
				<div style="margin-top:5px" class="btn-group pull-right">
					<a href="#event.buildLink(prc.xehmodule)#/locations" class="btn btn-inverse"  rel="bootTip"><i class="icon-reply"></i> Back</a>
			    </div>
			</div>
			<div class="body span7" style="width:65%;">
				
				#html.startForm(action="cbadmin.module.Calendar.locations.save",name="locationForm",id="locationForm",class="locationForm",method="post")#
				
					#html.hiddenField(name="location_id",id="location_id",value="#rc.qData.getlocation_id()#")#
					#html.hiddenField(name="location_lat",id="location_lat",value="#rc.qData.getlocation_lat()#")#
					#html.hiddenField(name="location_lng",id="location_lng",value="#rc.qData.getlocation_lng()#")#
				
					#html.textField(name="location_name",id="location_name", label="Name",value="#rc.qData.getlocation_name()#", title="Location Name",class="textfield width98",required="required" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
						
					#html.textField(name="location_address",id="location_address", label="Address",value="#rc.qData.getlocation_address()#", title="Location Address",class="textfield width98",required="required" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
						
					#html.textField(name="location_city",id="location_city", label="City",value="#rc.qData.getlocation_city()#", title="Location City",class="textfield width98",required="required" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
					
					#html.textField(name="location_state",id="location_state", label="State",value="#rc.qData.getlocation_state()#", title="Location State",class="textfield width98",required="required" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
					
					<div class="control-group">
						<label class="control-label" for="location_country">Country</label>
						<div class="controls">
							<select name="location_country" id="location_country" required="required" maxlength="100" class="textfield width98">
								<option value="">--Select the Country--</option>
								<cfloop index="i" from="1" to="#arraylen(prc.countries)#">
									<option value="#prc.countries[i]#" <cfif rc.qData.getlocation_country() eq prc.countries[i]>selected="selected"</cfif>>#prc.countries[i]#</option>
								</cfloop>
							</select>
						</div>
					</div>
				
					#html.textField(name="location_postal_code",id="location_postal_code", label="Postal Code",value="#rc.qData.getlocation_postal_code()#", title="Location Postal Code",class="textfield width98",required="required" ,wrapper="div class=controls",labelClass="control-label",groupWrapper="div class=control-group")#
						
					<div class="offset7">
						#html.submitButton(value="Save",class="btn btn-danger")#
					</div>
			
				#html.endForm()#
			</div>
			<div id="map_holder" style="display:none;margin-top:20px;">
				<div id="map_canvas" class="" style="height:300px;width:300px;"></div>
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
					<li><i class="icon-lightbulb icon-larg"></i>Help the user by dropping some details about the locations, So that the user can filter the events accordingly.</li>
				</ul>
			</div>
		</div>	
	</div>
</div>
<link href="http://ivaynberg.github.io/select2/select2-3.4.3/select2.css?ts=2013-09-17T19%3A01%3A19-07%3A00" rel="stylesheet"/>
<script src="http://ivaynberg.github.io/select2/select2-3.4.3/select2.js?ts=2013-09-17T19%3A01%3A19-07%3A00"></script>
<script>
	$(document).ready(function() {
		$(".locationForm").validate({});
		
		$('##location_country').select2();
		
	});
	var geocoder;
	var map;
	var marker;
	var isEditpage = #val(rc.location_id)#;
	var enablemap = '#val(rc.Setting.setting_value)#';
	
	function initialize() {
		geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(-34.397, 150.644);
		var mapOptions = {
			zoom: 8,
			center: latlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		}
		map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
		
		if ($('##location_address').val() != "" && $('##location_city').val() != "" && $('##location_country').val() != "" && enablemap) {
			codeAddress();
			$('##map_holder').css('display', 'block');
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
		$.each( $("##location_name, ##location_address, ##location_city, ##location_country"),function(element){
			if($(this).val() !=""){
				if(address != ""){address+=", "}
				address+= $(this).val();
				
			}
		});
		
		geocoder.geocode( { 'address': address}, function(results, status) {//console.log(address);
		
			if (status == google.maps.GeocoderStatus.OK || isEditpage) {
				if(isEditpage){
					var location = new google.maps.LatLng($('##location_lat').val(), $('##location_lng').val());
					isEditpage = 0;
				}
				else{
					var location = results[0].geometry.location;
				}
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

	$("##location_name, ##location_address, ##location_city, ##location_country").on('change', function(){
		if ($('##location_address').val() != "" && $('##location_city').val() != "" && $('##location_country').val() != "") {
			codeAddress();
			if(enablemap){
				$('##map_holder').css('display', 'block');
			}
			google.maps.event.trigger(map, 'resize');
		}
		else if(enablemap) {
			$('##map_holder').css('display', 'none');
		}
	});
</script>
</cfoutput>