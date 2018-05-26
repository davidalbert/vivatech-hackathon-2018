<%@page import="dbd.hackaton.mymechanic.spring.controller.SearchController"%>
<%@page contentType="text/html;charset=UTF-8"%>

<style>

</style>

<script type="text/javascript" src="/assets/js/typeahead.bundle.js"></script>
<script type="text/javascript" src='http://maps.google.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyBZNk9FYULb3_uIWztkeIA91LwpgNhLUL4&libraries=places'></script>

<style>

#map_canvas {
  height: 100%;
  margin: 0;
}

#map_canvas .centerMarker {
  position: absolute;
  /*url of the marker*/
  background: url(http://maps.gstatic.com/mapfiles/markers2/marker.png) no-repeat;
  /*center the marker*/
  top: 50%;
  left: 50%;
  z-index: 1;
  /*fix offset when needed*/
  margin-left: -10px;
  margin-top: -34px;
  /*size of the image*/
  height: 34px;
  width: 20px;
  cursor: pointer;
}
</style>

<div class="row" style="text-align: left;">
	<div class="col actionBack" style="padding-left:10px">
		<a href="#"><img src="/assets/img/backward.svg" class="backChevron">Back</a>
	</div>
</div>

<div class="row">
	<div class="col" style="text-align: left">
		<div class="stepTitle" style="margin-bottom: 10px">Car pickup address</div>
	</div>
</div>


<div class="form-group">
	<form class="form-signin" 
		method="POST" action="<%=SearchController.PROCESS_SEARCH_LOCATION%>">
	
<div class="row">
	<div class="col">
		<input type="text" id="us2-address" name="pickupAddress" style="width: 100%"/>
	</div>
</div>		


<input type="hidden" id="default_latitude" placeholder="latitude" name="latitude"/>
<input type="hidden" id="default_longitude" placeholder="longitude" name="longitude"/>

<div class="row" style="padding-top: 3px;">
	<div class="col">
		<div id="map_canvas" style="width:100%;height:400px"></div>
	</div>
</div>
		
		<button class="btn btn-lg btn-primary btn-block" type="submit" id="btnSubmit"
			style="margin-top: 20px">Validate car location</button>
	</form>
</div>

<script>

function getAddressFromCoordinates(){
	var jqxhr = $.get('https://maps.googleapis.com/maps/api/geocode/json?latlng='+$('#default_latitude').val()+','+$('#default_longitude').val()+'&sensor=true_or_false&key=AIzaSyBZNk9FYULb3_uIWztkeIA91LwpgNhLUL4')
 	  .done(function(data) {
 		  $('#us2-address').val(data.results[0].formatted_address);
 	  });
}

var lazyAddress = _.debounce(getAddressFromCoordinates, 300);

function initialize() {
	
	var mapStyles =[
		  {
			    "featureType": "administrative",
			    "elementType": "geometry",
			    "stylers": [
			      {
			        "visibility": "off"
			      }
			    ]
			  },
			  {
			    "featureType": "poi",
			    "stylers": [
			      {
			        "visibility": "off"
			      }
			    ]
			  },
			  {
			    "featureType": "road",
			    "elementType": "labels.icon",
			    "stylers": [
			      {
			        "visibility": "off"
			      }
			    ]
			  },
			  {
			    "featureType": "transit",
			    "stylers": [
			      {
			        "visibility": "off"
			      }
			    ]
			  }
			];
	
  var mapOptions = {
    zoom: 14,
    center: new google.maps.LatLng(${appointmentSessionKey.pickupLatitude}, ${appointmentSessionKey.pickupLongitude}),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    disableDefaultUI: true,
    styles: mapStyles
  };
  map = new google.maps.Map(document.getElementById('map_canvas'),
    mapOptions);
  google.maps.event.addListener(map,'center_changed', function() {
    document.getElementById('default_latitude').value = map.getCenter().lat();
    document.getElementById('default_longitude').value = map.getCenter().lng();

    lazyAddress();
  });
  
  $('<div/>').addClass('centerMarker').appendTo(map.getDiv())
    //do something onclick
    .click(function() {
      var that = $(this);
      if (!that.data('win')) {
        that.data('win', new google.maps.InfoWindow({
          content: 'this is the center'
        }));
        that.data('win').bindTo('position', map, 'center');
      }
      that.data('win').open(map);
    });
}

google.maps.event.addDomListener(window, 'load', initialize);


// address lookup
$(function() {
	var input = document.getElementById('us2-address');

	autocomplete = new google.maps.places.Autocomplete(input);
	autocomplete.addListener('place_changed', function() {
		var place = autocomplete.getPlace();
        if (place.geometry) {
        	if (place.geometry.viewport) {
                map.fitBounds(place.geometry.viewport);
              } else {
                map.setCenter(place.geometry.location);
                map.setZoom(17);  // Why 17? Because it looks good.
              }
        }
	});
	
});

</script>