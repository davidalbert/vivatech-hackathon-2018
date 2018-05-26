<%@page import="dbd.hackaton.mymechanic.spring.controller.SearchController"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.scheduleTitle{
		font-weight: bold;
		border: 1px grey solid;
		border-radius: 5px;
	}
	
	.scheduleGroup{
		margin: 10px;
	}
	
	.garageSchedule{
		margin-top:4px;
		/*border: 1px grey solid;*/
		border-radius: 5px;
		width:80%;
		background-color: #ccecfa;
	}
</style>
<div class="row" style="text-align: left;">
	<div class="col actionBack" style="padding-left:10px">
		<a href="#"><img src="/assets/img/backward.svg" class="backChevron">Back</a>
	</div>
</div>

<div class="row">
	<div class="col" style="text-align: left;margin-bottom: 20px;">
		<div class="stepTitle">Available pickup dates</div>
	</div>
</div>

<div class="row">
	<div class="col" style="text-align: left">
		At ${appointmentSessionKey.pickupAddress}
	</div>
</div>

<c:forEach items="${dates}" var="aDate">
<div class="scheduleGroup">
	<div class="row" style="text-align: center">
		<div class="col">
			<div class="scheduleTitle">${aDate}</div>
		</div>
	</div>
	<div class="row d-none">
		<div class="col">
			<div class="garageSchedule">10:00 AM</div>
		</div>
		<div class="col">
		<div class="garageSchedule">11:00 AM</div>	
		</div>
		<div class="col">
			<div class="garageSchedule">12:00 PM</div>
		</div>
	</div>
	<div class="row d-none">
		<div class="col">
			<div class="garageSchedule">2:00 PM</div>
		</div>
		<div class="col">
			<div class="garageSchedule">3:00 PM</div>	
		</div>
		<div class="col">
			<div class="garageSchedule">4:00 PM</div>
		</div>
	</div>
</div>
</c:forEach>

<form method="POST" action="<%=SearchController.PROCESS_SCHEDULE_SELECTION%>" id="scheduleSelectionForm">

	<input type="hidden" name="pickupSchedule" id="pickupSchedule">
	<input type="hidden" name="appointmentDay" id="appointmentDay">
</form>

<script>

$(function() {

	$('.garageSchedule').click(function(event) {
		  $( "#pickupSchedule" ).val($(this).html());
		  $( "#appointmentDay" ).val($(this).closest('.scheduleGroup').find('.scheduleTitle').html());
		  $('#scheduleSelectionForm').submit();
	});
	
	$('.scheduleTitle').click(function(event) {
		  $(this).closest('.scheduleGroup').find('.row').removeClass('d-none');
	});

});
</script>