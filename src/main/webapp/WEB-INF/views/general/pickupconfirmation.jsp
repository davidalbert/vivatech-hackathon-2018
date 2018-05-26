<%@page import="dbd.hackaton.mymechanic.spring.controller.SearchController"%>
<%@page contentType="text/html;charset=UTF-8"%>

<style>
	.confirmationText{
		font-size: 14px;
	}
	.confirmationText b{
		font-size: 16px;
	}
</style>
<div class="row" style="text-align: left;">
	<div class="col actionBack" style="padding-left:10px">
		<a href="#"><img src="/assets/img/backward.svg" class="backChevron">Back</a>
	</div>
</div>

<div class="row">
	<div class="col" style="text-align: left;margin-bottom: 20px;">
		<div class="stepTitle">Car pickup summary</div>
	</div>
</div>

<div class="row">
	<div class="col confirmationText" style="text-align: left">
		<b>Car identification</b> : ${appointmentSessionKey.carRegistration}
		<br><b>Car location</b> : ${appointmentSessionKey.pickupAddress}
		<br><b>Car pickup time</b> : ${appointmentSessionKey.appointmentDay} at ${appointmentSessionKey.pickupSchedule}
		<br><b>Shop name</b> : ${appointmentSessionKey.garageName}
		<br><b>Shop location</b> : ${appointmentSessionKey.garageAddress}
	</div>
</div>

<div class="form-group">
	<form class="form-signin" 
		method="POST" action="<%=SearchController.PROCESS_PICKUP_CONFIRMATION%>">
		
		<div class="row"  style="margin-top: 10px">
			<div class="col" style="text-align: left">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="1" name="backupCar">
				  <label class="form-check-label" for="inlineCheckbox1">I need a backup car</label>
				</div>
			</div>
		</div>
		
		<button class="btn btn-lg btn-primary btn-block" type="submit" id="btnSubmit"
			style="margin-top: 30px">Confirm schedule</button>
	</form>
</div>