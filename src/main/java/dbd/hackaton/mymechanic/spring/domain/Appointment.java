package dbd.hackaton.mymechanic.spring.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Size;

@Entity
public class Appointment {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	private Long carId;
	
	private Long garageId;
	
	private Date appointmentDate;
	
	@Size(max=500)
	private String pickupAddress;
	
	
}
