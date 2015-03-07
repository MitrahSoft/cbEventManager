<cfoutput>
	
	<link href="#event.getModuleRoot('Calendar')#/includes/assets/css/fullcalendar.css" rel="stylesheet" type="text/css" />
	<link href="#event.getModuleRoot('Calendar')#/includes/assets/css/fullcalendar.print.css" rel="stylesheet" type="text/css"  media='print' />
	<link href="#event.getModuleRoot('Calendar')#/includes/assets/css/style.css" rel="stylesheet" type="text/css" />
	<link href="#event.getModuleRoot('Calendar')#/includes/assets/css/bootstrap-colorpicker.css" type="text/css" rel="stylesheet" />
	<link href="#event.getModuleRoot('Calendar')#/includes/assets/css/theme.tablesorter.css" type="text/css" rel="stylesheet" />
	<link href="#event.getModuleRoot('Calendar')#/includes/assets/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
	
	<script src="#event.getModuleRoot('Calendar')#/includes/assets/js/tablesorter.min.js" type="text/javascript"></script>
	<script src="#event.getModuleRoot('Calendar')#/includes/assets/js/fullcalendar.min.js" type="text/javascript"></script>
	<script src="#event.getModuleRoot('Calendar')#/includes/assets/js/bootstrap-colorpicker.min.js" type="text/javascript"></script>
	<script src="#event.getModuleRoot('Calendar')#/includes/assets/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<style>
		.navbar-calendar{
			width:941px;
			height:31px;
		}
		.colorpicker-saturation {
			width: 100px;
			height: 100px;
			background-image: url('#event.getModuleRoot('Calendar')#/includes/assets/images/saturation.png');
			cursor: crosshair;
			float: left;
			}
		.colorpicker-hue { 
			background-image: url('#event.getModuleRoot('Calendar')#/includes/assets/images/hue.png'); 
			}
		.colorpicker-alpha {
			background-image: url('#event.getModuleRoot('Calendar')#/includes/assets/images/alpha.png');
			display: none;
		}
		.colorpicker-color {
			height: 10px;
			margin-top: 5px;
			clear: both;
			background-image: url('#event.getModuleRoot('Calendar')#/includes/assets/images/alpha.png');
			background-position: 0 100%;
			}
	</style>
	<div style="margin-left:30px;">
		<cfif cb.ispageview() eq 'false'>
      
			<div class="navbar">
				<div class="navbar-inner">
				  <ul class="nav myNav">
		               <li <cfif event.getcurrentEvent() contains 'home'>class="active"</cfif>> <a class="plugin-brand" href="#event.buildLink(prc.xehmodule)#/home/">Home</a></li>
					   <li <cfif event.getcurrentEvent() contains 'organizers'>class="active"</cfif>> <a class="plugin-brand" href="#event.buildLink(prc.xehmodule)#/organizers/">Organizers</a></li>
					   <li <cfif event.getcurrentEvent() contains 'Locations'>class="active"</cfif>> <a class="plugin-brand" href="#event.buildLink(prc.xehmodule)#/locations/">Locations</a></li>
					   <li <cfif event.getcurrentEvent() contains 'term'>class="active"</cfif>> <a class="plugin-brand " href="#event.buildLink(prc.xehmodule)#/tag/"><i class="icon"></i>Tags</a></li>
					   <li <cfif event.getcurrentEvent() contains 'Settings'>class="active"</cfif>> <a class="plugin-brand" href="#event.buildLink(prc.xehmodule)#/Settings/">Settings</a></li>
					   <li <cfif event.getcurrentEvent() contains 'term'>class="active"</cfif>> <a class="plugin-brand " href="#event.buildLink(prc.xehmodule)#/category/"><i class="icon"></i>Categories</a></li>
		               <li <cfif event.getcurrentEvent() contains 'events'>class="active"</cfif>> <a class="plugin-brand" href="#event.buildLink(prc.xehmodule)#/events/">Events</a></li>
		           </ul>
				</div>
			</div>
		<div id="modal" class="modal hide fade ">
			<div class="modal-header">
				<h3><strong>Confirmation</strong>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></h3>
			</div>
			<div class="modal-body">
				<p>Are you sure want to delete this data ?</p>
				<input name="deleteId" type="hidden" value="" class="deleteId">
			</div>
			<div class="modal-footer">
				<button class="btn btn-danger" onclick="deleteRecord()" id="deleteButton">Yes</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
			</div>
		</div>
	<cfelse>
    	<div class="calander_Searchbox">
			<div class="cal_menu">	
				<form name="searchForm" class="myForm searchForm" action="" method="post" >
					<cfif rc.setting.setting_value eq "true">
						<div class="Event_top">
							<div class="event_Frm">EVENTS FROM</div>
							<div class="Search_box"><input type="text" name="searchDate" id="searchDate" class="datepicker" placeholder="#dateFormat(now(),'yyyy-mm-dd')#"></div>
						</div>
						
						<div class="Search_top">
							<div class="search_Frm">SEARCH</div>
							<div class="Search_box"><input type="text" name="searchTerm" id="searchTerm" placeholder="Search"></div>
						</div>
						
						<div class="find_events">
							<input type="button" value="FindEvents"  name="searchbtn" class="find_button" onclick="searchEvents('search')">
						</div>
					</cfif>
					<div class="export">
						<a href="#event.buildLink(prc.xehexport)#" class="btn export_button" id="export_button" style="margin-top:7px;"><i class="icon-download-alt"></i>&nbsp;Export Events</a>
					</div>
					<div class="view_box">
						<div class="view_as">VIEW AS</div>
						 &nbsp;&nbsp;<a href="javascript:void(0)" onclick="getCalendar()"><i class="icon-calendar"></i>&nbsp;calendar</a> <br />
						 &nbsp;&nbsp;<a  href="javascript:void(0)" onclick="searchEvents()"><i class="icon-list"></i>&nbsp;List</a><br />
					</div>
				</form>	
			</div>	
		</div>	
	</cfif>
	</div>
	
<script>
	$(function() {
		
				$('table.tablesorter').each(function (i, e) { 
					var myHeaders = {}                        
				 	$(this).find('th.nosort').each(function (i, e) {                            
						 myHeaders[$(this).index()] = { sorter: false };                        
					 });                                        
				 	$(this).tablesorter({ headers: myHeaders });                   
				 });     
		
				$('##export_button').click(function(){
					
					var event_val = [];
			        $(':checkbox:checked').each(function(i){
			          event_val[i] = $(this).val();
			        });
					
					if (event_val.length > 0) {
						
						window.location.href = "#event.buildLink(prc.xehexport)#?event_id=" + event_val
					}
					else{
						window.location.href="#event.buildLink(prc.xehexport)#"	
					}
				});
				
                // pretify code samples
                window.prettyPrint && prettyPrint();

                // Code for those demos
                var _createColorpickers = function() {
                    $('##bscp').colorpicker({
                        format: 'hex'
                    });
                }

                _createColorpickers();

                $('.bscp-destroy').click(function(e) {
                    e.preventDefault();
                    $('.bscp').colorpicker('destroy');
                });

                $('.bscp-create').click(function(e) {
                    e.preventDefault();
                    _createColorpickers();
                });
				
				 $('##calendar').fullCalendar({
			            header: {
			                left: 'prev,next today',
			                center: 'title',
			                right: 'month,agendaWeek,agendaDay'
			            },
						weekMode:"liquid",
			            editable: false,
			            
			            events: "#event.buildLink(prc.xehevents)#",
						eventRender: function (event, element) { 
						 
						 $(element).on('click', function () {
                    		$(this).siblings('.fc-event').popover('hide');
              			  });
					        element.popover({
								 html: true,
					             title: 'Event details<button type="button" class="close" onclick="$(&quot;.fc-event&quot;).popover(&quot;hide&quot;);">&times;</button> ',
					             placement: 'top',
					             content: event.description,
								 container:'body'
					        });
							
					    },
						viewDestroy: function(view,element) {
			    			 $('div.fc-event').popover('hide');
						},
			            loading: function(bool) {
			                if (bool) $('##loading').show();
			                else $('##loading').hide();
			            }
			            
			        });
					
					var custom_buttons = '<span class="fc-button-next ui-corner-left ui-corner-right" style="margin-left:5px;">'+
			                              '<input type="hidden" id="date_picker" value="">'+
										  '<a  data-date="#dateFormat(now(),"yyyy-mm-dd")#" data-date-format="yyyy-mm-dd" id="dp4" class="input-append"  href="##"><img src="#event.getModuleRoot("Calendar")#/includes/assets/css/images/calendar.gif"></a>'+
			                              '</span>';
			        $('td.fc-header-center span.fc-header-title').parent('td').append(custom_buttons);
				 
				   $("##dp4").datepicker().on('changeDate', function(ev) {
						var newDate = new Date(ev.date);
		               	$('##calendar').fullCalendar('gotoDate', newDate);
					});
            });
	function confirmDelete(id){
	   	$('.deleteId').val(id);
		$('##modal').modal('show');
	}
	
	$("[type=date]").datepicker();
	$(".datepicker").datepicker();
			
	function deleteRecord(){
		var id = $('.deleteId').val();
		window.location = '/index.cfm/cbadmin/module/Calendar/#listlast(event.GETCURRENTROUTEDURL(),"/")#/Delete?ID='+id;
	}
	function searchEvents(tag,qString){
		$('.fc-event').popover('hide');
		var search_Date = $('##searchDate').val();
		var search_Term = $('##searchTerm').val();
		var qstr = 'searchDate='+search_Date+'&searchTerm='+search_Term;
		var url_string = '';
		
		if(typeof tag == "undefined"){
			var tag = "";
		}
		
			if ((search_Term != '' || search_Date != '') && tag=="search") {
			url_string = "#event.buildlink(prc.xeheventslist)#?"+qstr;
		}else if(tag!="" && qString=="Tag"){
			url_string = "#event.buildlink(prc.xeheventslist)#?tag="+tag;
			}else if(tag!="" && qString=="pagenation"){
			url_string = "#event.buildlink(prc.xeheventslist)#?pageNo="+tag;
		}else{
			url_string = "#event.buildlink(prc.xeheventslist)#";
		}
			$.get(url_string,function(data){
				$('div.box').html(data);
			});
	}
	function getDetails(id){
		$('.fc-event').popover('hide');
		var qstr = 'event_id='+id;
		$.get("#event.buildlink(prc.xehdetails)#?"+qstr,
			function(data){
				$('div.box').html(data);
				
			});
	}
	function getCalendar(){
		$('.fc-event').popover('hide');
		$.get("#event.buildlink(prc.xehCalendar)#",
			function(data){
			$('div.box').html(data);
			});	
	}
</script>
</cfoutput>
