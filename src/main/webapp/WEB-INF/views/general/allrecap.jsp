<%@page import="dbd.hackaton.mymechanic.spring.controller.SearchController"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.confirmationText{
		font-size: 14px;
	}
	.confirmationText b{
		font-size: 16px;
	}
</style>

<div class="row">
	<div class="col" style="text-align: left;margin-bottom: 20px;">
		<div class="stepTitle">Pickup scheduled!</div>
	</div>
</div>

<div class="row">
	<div class="col confirmationText" style="text-align: left">
		<b>Car identification</b> : ${appointmentSessionKey.carRegistration}
		<br><b>Car location</b> : ${appointmentSessionKey.pickupAddress}
		<br><b>Car pickup time</b> : ${appointmentSessionKey.appointmentDay} at ${appointmentSessionKey.pickupSchedule}
		<br><b>Shop name</b> : ${appointmentSessionKey.garageName}
		<br><b>Shop location</b> : ${appointmentSessionKey.garageAddress}
		<br>
	</div>
</div>
<div class="row">
	<div class="col confirmationText" style="text-align: left; margin-top: 15px;">	
		<c:if test="${appointmentSessionKey.backupCar}">
			<i>(a backup car will be provided)</i>
		</c:if>
		<c:if test="${not appointmentSessionKey.backupCar}">
			<i>(no backup car requested)</i>
		</c:if>
	</div>
</div>
<div class="row"  style="margin-top: 20px">
	<div class="col" style="text-align: left">
		Your pickup number is <span style="font-weight:bold; padding:5px;border:1px black solid">RA 6985</span>
	</div>
</div>