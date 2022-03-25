package jyc.common.service;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import jyc.common.domain.ReservationVO;
import jyc.common.mapper.ReservationMapper;
import lombok.AllArgsConstructor;
// import lombok.extern.log4j.Log4j;

// @Log4j
@Service
@AllArgsConstructor
public class ReservationServiceImpl implements ReservationService {

	private ReservationMapper mapper;
	
	// For manager
	
	@Override
	public void registerReservation(HashMap<String , Object> map) {	
			
		mapper.registerReservation(map);
		
	}
	
	@Override
	public List<ReservationVO> readManagerRes(String mid, String pid, @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate resDate) {
		
		return mapper.readManagerRes(mid, pid, resDate);
		
	}
	
	@Override
	public ReservationVO managerGetRes(int rid, String mid) {
		
		return mapper.managerGetRes(rid, mid);
		
	}
	
	@Override
	public boolean managerCancelRes(int rid, String mid, String userId, String regDateTime) {
		
		return mapper.managerCancelRes(rid, mid, userId, regDateTime) == 1;
		
	}	

	@Override
	public boolean managerRemoveRes(int rid, String mid) {
		
		return mapper.managerRemoveRes(rid, mid) == 1;
		
	}
	
	@Override
	public int managerCheckRes(String startDate, String finishDate, String pid) { 	
		
		return mapper.managerCheckRes(startDate, finishDate, pid);	
		
	}
	
	// For user
	
	@Override
	public List<ReservationVO> readUserRes(String pid, @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate resDate) {
		
		return mapper.readUserRes(pid, resDate);
		
	}
	
	@Override
	public boolean userApplyRes(int rid, String userId, String regDateTime) {
		
		return mapper.userApplyRes(rid, userId, regDateTime) == 1;
		
	}
	
	@Override
	public List<ReservationVO> userResList(String userId) {
		
		return mapper.userResList(userId);
		
	}
	
	@Override
	public ReservationVO userGetRes(int rid, String userId) {
		
		return mapper.userGetRes(rid, userId);
		
	}
	
	@Override
	public boolean userCancelRes(int rid, String userId, String regDateTime) {
		
		return mapper.userCancelRes(rid, userId, regDateTime) == 1;
		
	}
	
	@Override
	public int userCheckRes(String startDate, String finishDate, String userId, String pid) { 
		
		return mapper.userCheckRes(startDate, finishDate, userId, pid);	
		
	}
			
}
