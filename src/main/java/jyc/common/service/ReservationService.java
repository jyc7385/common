package jyc.common.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jyc.common.domain.ReservationVO;

public interface ReservationService {

	// For manager
	
	public void registerReservation(HashMap<String , Object> map);
	
	public List<ReservationVO> readManagerRes(String mid, String pid, @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate resDate);
	
	public ReservationVO managerGetRes(int rid, String mid);
	
	public boolean managerCancelRes(int rid, String mid, String userId, String regDateTime);
	
	public boolean managerRemoveRes(int rid, String mid);
	
	public int managerCheckRes(String startDate, String finishDate, String pid);
	
	// For user
	
	public List<ReservationVO> readUserRes(String pid, @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate resDate);
	
	public boolean userApplyRes(int rid, String userId, String regDateTime);
	
	public List<ReservationVO> userResList(String userId);
	
	public ReservationVO userGetRes(int rid, String userId);
	
	public boolean userCancelRes(int rid, String userId, String regDateTime);
	
	public int userCheckRes(String startDate, String finishDate, String userId, String pid);
	
}
