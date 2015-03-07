<cfoutput>
<link href="#event.getModuleRoot('contentbox-admin')#/includes/css/bootstrap-datepicker.css" type="text/css" rel="stylesheet" />
<link href="#event.getModuleRoot('contentbox-admin')#/includes/css/bootstrap.css" type="text/css" rel="stylesheet" />

<script src="#event.getModuleRoot('contentbox-admin')#/includes/js/jquery.min.js" type="text/javascript"></script>
<script src="#event.getModuleRoot('contentbox-admin')#/includes/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="#event.getModuleRoot('contentbox-admin')#/includes/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<style>
	.logo{
		float:left !important;
	}
	body{
		background:url("/modules/contentbox/layouts/default/includes/images/main_bg.gif") repeat-x scroll center top ##9ED0E8 !important;
	}
	div.navbar{
		display:none;
	}
	[class^="icon-"], [class*=" icon-"] {
		background-image:url("#event.getModuleRoot('Calendar')#/includes/assets/images/glyphicons-halflings.png") !important;
		background-color:##FFFFFF;
	}
	.fc-header .fc-state-active, .fc-header .ui-state-active{
		z-index: 2 !important;
	}
</style>
<div class="row">
	#renderView(view="nav/index", module="Calendar")#
</div>

	#renderView(view="main/index",module="Calendar")#
</cfoutput>
