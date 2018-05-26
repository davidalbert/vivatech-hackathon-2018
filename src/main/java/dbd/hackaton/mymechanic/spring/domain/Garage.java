package dbd.hackaton.mymechanic.spring.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
//@Table(
//		indexes = {
//		@Index(columnList = "event_time"),
//		@Index(columnList = "average_age"),
//		@Index(columnList = "woman_ratio"),
//		@Index(columnList = "average_woman_age"),
//		@Index(columnList = "interesting_woman_count")
//	}
//		)
public class Garage {
	
	public static final int ATTENDING_COUNT_MINIMUM=3;
	public static final int CAPACITY_MINIMUM=6;
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;
	
}
