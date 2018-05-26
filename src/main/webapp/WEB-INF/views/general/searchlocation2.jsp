<%@page import="dbd.hackaton.mymechanic.spring.controller.SearchController"%>
<%@page contentType="text/html;charset=UTF-8"%>

<style>

</style>

<script type="text/javascript" src="/assets/js/typeahead.bundle.js"></script>
<script type="text/javascript" src='http://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyBZNk9FYULb3_uIWztkeIA91LwpgNhLUL4'></script>
<script type="text/javascript" src="/assets/js/jquery-locationpicker.min.js"></script>



Location: <input type="text" id="us2-address" style="width: 200px"/>

<div id="us2" style="width: 500px; height: 400px;"></div>				
<input type="hidden" id="us2-lat"/>
<input type="hidden" id="us2-lon"/>


<div class="form-group">
	<form class="form-signin" 
		method="POST" action="<%=SearchController.PROCESS_SEARCH_LOCATION%>">
	
		<input type="hidden" name="searchString" value="toto">
	</form>
</div>


<script>
$('#us2').locationpicker({
	enableAutocomplete: true,
	    enableReverseGeocode: true,
	  radius: 0,
	  inputBinding: {
	    latitudeInput: $('#us2-lat'),
	    longitudeInput: $('#us2-lon'),
	    radiusInput: $('#us2-radius'),
	    locationNameInput: $('#us2-address')
	  },
	  onchanged: function (currentLocation, radius, isMarkerDropped) {
	        var addressComponents = $(this).locationpicker('map').location.addressComponents;
	    console.log(currentLocation);  //latlon  
	    updateControls(addressComponents); //Data
	    }
	});

	function updateControls(addressComponents) {
	  console.log(addressComponents);
	}
</script>