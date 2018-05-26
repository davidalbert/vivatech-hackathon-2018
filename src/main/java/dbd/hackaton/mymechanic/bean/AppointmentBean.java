package dbd.hackaton.mymechanic.bean;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

public class AppointmentBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4716101262404387651L;

	private String carRegistration;
	
	private Long garageId;
	
	private Date appointmentDate;
	
	private String appointmentDay;
	
	private String pickupAddress;
	
	private String pickupLongitude;
	
	private String pickupLatitude;
	
	private String searchString;
	
	private String garageName;
	
	private String garageAddress;
	
	private String pickupSchedule;
	
	private boolean backupCar=false;
	
	
	private void checkDefaultCoordinates() {
		if(StringUtils.isBlank(pickupLongitude)
				|| StringUtils.isBlank(pickupLatitude)) {
			
			pickupLongitude="2.343140601088294";
			pickupLatitude="48.86293922597399";
		}
	}

	public String getCarRegistration() {
		return carRegistration;
	}

	public void setCarRegistration(String carRegistration) {
		this.carRegistration = carRegistration;
	}

	public Long getGarageId() {
		return garageId;
	}

	public void setGarageId(Long garageId) {
		this.garageId = garageId;
	}

	public Date getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public String getPickupAddress() {
		return pickupAddress;
	}

	public void setPickupAddress(String pickupAddress) {
		this.pickupAddress = pickupAddress;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public String getPickupLongitude() {
		checkDefaultCoordinates();
		return pickupLongitude;
	}

	public void setPickupLongitude(String pickupLongitude) {
		this.pickupLongitude = pickupLongitude;
	}

	public String getPickupLatitude() {
		checkDefaultCoordinates();
		return pickupLatitude;
	}

	public void setPickupLatitude(String pickupLatitude) {
		this.pickupLatitude = pickupLatitude;
	}

	public String getGarageName() {
		return garageName;
	}

	public void setGarageName(String garageName) {
		this.garageName = garageName;
	}

	public String getGarageAddress() {
		return garageAddress;
	}

	public void setGarageAddress(String garageAddress) {
		this.garageAddress = garageAddress;
	}

	public String getPickupSchedule() {
		return pickupSchedule;
	}

	public void setPickupSchedule(String pickupSchedule) {
		this.pickupSchedule = pickupSchedule;
	}

	public String getAppointmentDay() {
		return appointmentDay;
	}

	public void setAppointmentDay(String appointmentDay) {
		this.appointmentDay = appointmentDay;
	}

	public boolean isBackupCar() {
		return backupCar;
	}

	public void setBackupCar(boolean backupCar) {
		this.backupCar = backupCar;
	}

}
