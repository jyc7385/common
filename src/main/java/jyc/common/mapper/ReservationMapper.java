package jyc.common.mapper;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import jyc.common.domain.ReservationVO;

public interface ReservationMapper {
		
	// For manager
	
	public void registerReservation(HashMap<String , Object> map);
	
	public List<ReservationVO> readManagerRes(@Param("mid") String mid, @Param("pid") String pid, @Param("resDate") LocalDate resDate);
	
	public ReservationVO managerGetRes(@Param("rid") int rid, @Param("mid") String mid);
	
	public int managerCancelRes(@Param("rid") int rid, @Param("mid") String mid, @Param("userId") String userId, @Param("regDateTime") String regDateTime);
	
	public int managerRemoveRes(@Param("rid") int rid, @Param("mid") String mid);
	
	public int managerCheckRes(@Param("startDate") String startDate, @Param("finishDate") String finishDate, @Param("pid") String pid);
	
	// For user
	
	public List<ReservationVO> readUserRes(@Param("pid") String pid, @Param("resDate") LocalDate resDate);
	
	public int userApplyRes(@Param("rid") int rid, @Param("userId") String userId, @Param("regDateTime") String regDateTime);
	
	public List<ReservationVO> userResList(@Param("userId") String userId);
	
	public ReservationVO userGetRes(@Param("rid") int rid, @Param("userId") String userId);
	
	public int userCancelRes(@Param("rid") int rid, @Param("userId") String userId, @Param("regDateTime") String regDateTime);
	
	public int userCheckRes(@Param("startDate") String startDate, @Param("finishDate") String finishDate, @Param("userId") String userId, @Param("pid") String pid);
	
}
