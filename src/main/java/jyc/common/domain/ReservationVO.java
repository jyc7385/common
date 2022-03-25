package jyc.common.domain;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat; // For @DateTimeFormat

import lombok.Data;

@Data
public class ReservationVO {

	// r : reservation, m : member, p : place
	// resdate : reservation + date
	// regdatetime : regist + date + time
	
	private int rid;
	private String mid;
	private String pid;
	private String pname;
	private int team;
	private String userId;
	private String regDateTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate resDate;
	private String startHour;
	private String startMinute;
	private String finishHour;
	private String finishMinute;
		
}
