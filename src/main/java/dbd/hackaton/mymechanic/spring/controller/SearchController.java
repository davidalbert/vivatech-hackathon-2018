package dbd.hackaton.mymechanic.spring.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.DateTimeFormatterBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dbd.hackaton.mymechanic.bean.AppointmentBean;

@Controller
public class SearchController {
	
	private static final DateTimeFormatter DATE_FROMATTER=
			new DateTimeFormatterBuilder()
			.appendDayOfWeekText()
			.appendLiteral(" ")
			.appendMonthOfYearText()
			.appendLiteral(" ")
			.appendDayOfMonth(2)
			.toFormatter().withLocale(Locale.US);


	private static final String appointmentSessionKey="appointmentSessionKey";
	
	public static final String HOME_PREFIX = "/";
	public static final String PROCESS_SEARCH = "/processsearch";
	public static final String SEARCH_LOCATION = "/searchlocation";
	public static final String PROCESS_SEARCH_LOCATION = "/processsearchlocation";
	public static final String SHOW_RESULT_MAP = "/resultmap";
	public static final String PROCESS_GARAGE_SELECTION = "/processgarageselection";
	public static final String PROCESS_SCHEDULE_SELECTION = "/processscheduleselection";
	public static final String PROCESS_PICKUP_CONFIRMATION = "/processpickupconfirmation";
	
	@ModelAttribute
	public void setHeaders(HttpServletResponse response) {
	    response.setHeader("Access-Control-Allow-Origin", "*");
	}
	

	@RequestMapping(value = HOME_PREFIX)
	public String showSearchForm(HttpServletRequest request, Model model) {
		
		request.getSession().removeAttribute(appointmentSessionKey);
		
		return "general/search";
	}
	
//	@RequestMapping(value = SEARCH_LOCATION)
//	public String showSearchLocationForm(HttpServletRequest request, Model model) {
//		
//		return "general/searchlocation";
//	}
//	
	
	private AppointmentBean getAppointment(HttpServletRequest request) {
		AppointmentBean bean= (AppointmentBean)request.getSession().getAttribute(appointmentSessionKey);
		if(bean==null) {
			bean=new AppointmentBean();
			request.getSession().setAttribute(appointmentSessionKey, bean);
		}
		
		return bean;
	}
	
	@RequestMapping(value = PROCESS_SEARCH
			//, method=RequestMethod.POST
			)
	public String processSearch(
			HttpServletRequest request, Model model,
			@RequestParam(required=false) String searchString,
			@RequestParam(required=false) String searchString2,
			@RequestParam(required=false) String carRegistration
			) {
		
		AppointmentBean bean=getAppointment(request);
		bean.setSearchString(searchString);
		if(StringUtils.isBlank(bean.getSearchString())) {
			bean.setSearchString(searchString2);
		}
		
		bean.setCarRegistration(carRegistration);
		
		return "general/searchlocation";
	}
	
	@RequestMapping(value = PROCESS_SEARCH_LOCATION
			//, method=RequestMethod.POST
			)
	public String processSearchLocation(
			HttpServletRequest request,
			HttpServletResponse response,
			Model model,
			@RequestParam(required=false) String pickupAddress,
			@RequestParam(required=false) String latitude,
			@RequestParam(required=false) String longitude
			) {
		
		AppointmentBean bean=getAppointment(request);
		bean.setPickupAddress(pickupAddress);
		bean.setPickupLatitude(latitude);
		bean.setPickupLongitude(longitude);
		
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		return "general/resultmap";
	}
	
	@RequestMapping(value = PROCESS_GARAGE_SELECTION
			//, method=RequestMethod.POST
			)
	public String processGarageSelection(
			HttpServletRequest request, Model model,
			@RequestParam(required=false) String garageName,
			@RequestParam(required=false) String garageAddress
			) {
		
		AppointmentBean bean=getAppointment(request);
		bean.setGarageName(garageName);
		bean.setGarageAddress(garageAddress);
		
		DateTime dateTime=new DateTime();
		List<String> dates=new ArrayList<String>();
		for(int i=0; i<6; i++) {
			dates.add(DATE_FROMATTER.print(dateTime.plusDays(i)));
		}
		
		model.addAttribute("dates", dates);
		
		return "general/appointment";
	}
	
	@RequestMapping(value = PROCESS_SCHEDULE_SELECTION
	//, method=RequestMethod.POST
	)
	public String processScheduleSelection(
		HttpServletRequest request, Model model,
		@RequestParam(required=false) String pickupSchedule,
		@RequestParam(required=false) String appointmentDay
		) {
	
		AppointmentBean bean=getAppointment(request);
		bean.setPickupSchedule(pickupSchedule);
		bean.setAppointmentDay(appointmentDay);
		
		return "general/pickupconfirmation";
	}

	@RequestMapping(value = PROCESS_PICKUP_CONFIRMATION
			//, method=RequestMethod.POST
			)
	public String processPickupConfirmation(
			HttpServletRequest request, Model model,
			@RequestParam(required=false, defaultValue="false") boolean backupCar
			) {
		
		AppointmentBean bean=getAppointment(request);
		bean.setBackupCar(backupCar);
		
		
		return "general/allrecap";
	}
	
}
