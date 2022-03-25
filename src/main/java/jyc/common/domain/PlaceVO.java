package jyc.common.domain;

import lombok.Data;

@Data
public class PlaceVO {

	private String pid;
	private String name;
	private String nickName;
	private String mid;
	private int reRegCycle;
	private int regCycleHour;
	private int regCycleMinute;
	private int team;
	private String address;
	private String notice;
	
}
