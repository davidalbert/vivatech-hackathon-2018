<%@page import="dbd.hackaton.mymechanic.spring.controller.SearchController"%>
<%@page contentType="text/html;charset=UTF-8"%>

<style>

.btn-grey{
    background-color:#D8D8D8;
	color:#FFF;
}
.rating-block{
	background-color:#FAFAFA;
	border:1px solid #EFEFEF;
	padding:15px 15px 20px 15px;
	border-radius:3px;
}
.bold{
	font-weight:700;
}
.padding-bottom-7{
	padding-bottom:7px;
}

.review-block{
	background-color:#FAFAFA;
	border:1px solid #EFEFEF;
	padding:15px;
	border-radius:3px;
	margin-bottom:15px;
}
.review-block-name{
	font-size:12px;
	margin:10px 0;
}
.review-block-date{
	font-size:12px;
}
.review-block-rate{
	font-size:13px;
	margin-bottom:15px;
	text-align: left;
}

.review-block-rate .btn{
	font-size:12px;
}
.review-block-title{
	font-size:15px;
	font-weight:700;
	margin-bottom:10px;
	text-align: left;
}
.review-block-description{
	font-size:13px;
	text-align: left;
}

</style>

<script type="text/javascript" src='http://maps.google.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyBZNk9FYULb3_uIWztkeIA91LwpgNhLUL4&libraries=places'></script>

<div class="row" style="text-align: left;">
	<div class="col actionBack" style="padding-left:10px">
		<a href="#"><img src="/assets/img/backward.svg" class="backChevron">Back</a>
	</div>
</div>
<div class="row">
	<div class="col">
		<div class="stepTitle">Mechanic selection</div>
		<ul class="nav nav-tabs" id="myTab" role="tablist">
  			<li class="nav-item">
			    <a class="nav-link active" id="garage-map-tab" data-toggle="tab" href="#garage-map" role="tab" aria-controls="garage-map" aria-selected="true">Map</a>
		  	</li>
			<li class="nav-item">
    			<a class="nav-link" id="garage-list-tab" data-toggle="tab" href="#garage-list" role="tab" aria-controls="garage-list" aria-selected="false">List</a>
  			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
		  <div class="tab-pane fade" id=garage-list role="tabpanel" aria-labelledby="garage-list-tab">
			  <div id="reviewZone">
			</div>
		  </div>
		  <div class="tab-pane fade show active" id="garage-map" role="tabpanel" aria-labelledby="garage-map-tab" style="width:100%;height:400px"></div>
		</div>
	</div>

</div>
<div id="templateZone" class="d-none">
<div class="row garageResultItem" id="reviewTemplate">
		<div class="col">
			<div class="review-block">
				<div class="row">
					<div class="col-3">
						<img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image"
							class="img-rounded">
						<div class="review-block-name">
							<a href="#">nktailor</a>
						</div>
						<div class="review-block-date d-none">
							January 29, 2016<br />1 day ago
						</div>
					</div>
					<div class="col-9">
						<div class="review-block-rate">
							<button type="button" class="btn btn-warning btn-xs noteLevel1"
								aria-label="Left Align">
								<i class="fas fa-star"></i>
							</button>
							<button type="button" class="btn btn-warning btn-xs noteLevel2"
								aria-label="Left Align">
								<i class="fas fa-star"></i>
							</button>
							<button type="button" class="btn btn-warning btn-xs noteLevel3"
								aria-label="Left Align">
								<i class="fas fa-star"></i>
							</button>
							<button type="button" class="btn btn-warning btn-xs noteLevel4"
								aria-label="Left Align">
								<i class="fas fa-star"></i>
							</button>
							<button type="button" class="btn btn-warning btn-xs noteLevel5"
								aria-label="Left Align">
								<i class="fas fa-star"></i>
							</button>
						</div>
						<div class="review-block-title">this was nice in buy</div>
						<div class="review-block-description">this was nice in buy.
							this was nice in buy. this was nice in buy. this was nice in buy
							this was nice in buy this was nice in buy this was nice in buy
							this was nice in buy</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<form method="POST" action="<%=SearchController.PROCESS_GARAGE_SELECTION %>" id="garageSelectionForm">

	<input type="hidden" name="garageName" id="garageName">
	<input type="hidden" name="garageAddress" id="garageAddress">
</form>

<script>

function entierAleatoire(min, max)
{
 return Math.floor(Math.random() * (max - min + 1)) + min;
}

//var repairShops=[{"lat":48.829956199999991,"lon":2.2961905,"name":"Renault Paris Lefebvre","rating":3.1,"address":"97 Boulevard Lefebvre, Paris","icon":"https://maps.gstatic.com/mapfiles/place_api/icons/shopping-71.png"},{"lat":48.8337685,"lon":2.2892288,"name":"SGGD","rating":3.9,"address":"374 Rue de Vaugirard, Paris","icon":"https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png"},{"lat":48.8300521,"lon":2.2925198,"name":"Grand Prix Racewear France","rating":4.7,"address":"7 Avenue de la Porte de la Plaine, Paris","icon":"https://maps.gstatic.com/mapfiles/place_api/icons/shopping-71.png"},{"lat":48.8302424,"lon":2.2930744,"name":"Cartau","rating":0.0,"address":"7 Avenue de la Porte de la Plaine, Paris","icon":"https://maps.gstatic.com/mapfiles/place_api/icons/shopping-71.png"},{"lat":48.8327698,"lon":2.2927057,"name":"Eurorepar Garage Pierre Mille","rating":0.0,"address":"1 Rue Pierre Mille, Paris","icon":"https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png"},{"lat":48.832513299999988,"lon":2.2946983,"name":"Khatir Mohammed","rating":5.0,"address":"6 Rue de la Saïda, Paris","icon":"https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png"},{"lat":48.8327478,"lon":2.2926845,"name":"Carnouri","rating":0.0,"address":"1 Rue Pierre Mille, Paris","icon":"https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png"},{"lat":48.8264861,"lon":2.2940321,"name":"CARDY VANVES","rating":2.8,"address":"126 Avenue Victor Hugo, Vanves","icon":"https://maps.gstatic.com/mapfiles/place_api/icons/shopping-71.png"}];

$(function() {
	
/* 	repairShops.forEach(function(element) {
		var newZone=$('#reviewTemplate').clone();
		newZone.find('.review-block-title').html(element.name);
		newZone.find('.review-block-description').html(element.address);
		newZone.attr('id','shopresult-'+entierAleatoire(1,1000));
		
	  	$('#reviewZone').append(newZone);
	}); */
	
	
	
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
	
	var mapLocation=new google.maps.LatLng(${appointmentSessionKey.pickupLatitude}, ${appointmentSessionKey.pickupLongitude});
	
	var mapOptions = {
		    zoom: 14,
		    center: mapLocation,
		    mapTypeId: google.maps.MapTypeId.ROADMAP,
		    disableDefaultUI: true,
		    styles: mapStyles
		  };
	  map = new google.maps.Map(document.getElementById('garage-map'),
	    mapOptions);
	  
	 var infowindow=new google.maps.InfoWindow();
	  
	  //searching
	  
	  var request = {
	    location: mapLocation,
	    //radius: '20000',
	    rankBy: google.maps.places.RankBy.DISTANCE,
	    type: ['car_repair']
	  };
	  
	  service = new google.maps.places.PlacesService(map);
	  service.nearbySearch(request, mapSearchCallback);

	  /* var jqxhr = $.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=garage&type=car_repair&language=fr&rankby=distance&location=${appointmentSessionKey.pickupLatitude},${appointmentSessionKey.pickupLongitude}&key=AIzaSyBZNk9FYULb3_uIWztkeIA91LwpgNhLUL4')
	 	  .done(function(data) {
	 		  debugger;
	 		 if(typeof data.results!='undefined'){
	 			 for(var i=0; i<data.results.length; i++){
	 				 var uneLoc=data.results[i];
	 				var latLng = new google.maps.LatLng(uneLoc.geometry.location.lat, uneLoc.geometry.location.lng);
	 		 		 var marker = new google.maps.Marker({
	 		 		    position: latLng,
	 		 		    map: map
	 		 		 });
	 			 }
	 		 }
	 		 
	 	  }); */
});

function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location
    });
    
    var newZone=$('#reviewTemplate').clone();
	newZone.find('.review-block-title').html(place.name);
	newZone.find('.review-block-description').html(place.vicinity);
	newZone.attr('id','shopresult-'+entierAleatoire(1,1000));
	
	var note=entierAleatoire(1,5);
	for(var i=1; i<=5; i++){
		if(i>note){
			newZone.find('.noteLevel'+i).removeClass('btn-warning');
			newZone.find('.noteLevel'+i).addClass('btn-default');
			newZone.find('.noteLevel'+i).addClass('btn-grey');
		}
	}
	
  	$('#reviewZone').append(newZone);

    /* google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent(place.name);
      infowindow.open(map, this);
    }); */
  }
  
function mapSearchCallback(results, status) {
  if (status == google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      var place = results[i];
      createMarker(results[i]);
    }
    
    $('.garageResultItem').click(function(event) {
		  $( "#garageName" ).val($(this).find('.review-block-title').html());
		  $( "#garageAddress" ).val($(this).find('.review-block-description').html());
		  
		  $('#garageSelectionForm').submit();
	});
  }
}
</script>