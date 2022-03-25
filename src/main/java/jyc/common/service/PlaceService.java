package jyc.common.service;

import java.util.List;

import jyc.common.domain.Criteria;
import jyc.common.domain.PlaceVO;

public interface PlaceService {

	// For manager
	
	public void registerPlace(PlaceVO place);
	
	public int checkPlaceName(String name) throws Exception;
	
	public List<PlaceVO> getList(String mid, Criteria cri);
	
	public int getTotal(String mid, Criteria cri);
	
	public PlaceVO get(String mid, String pid);
	
	public boolean modify(PlaceVO place);
	
	public boolean remove(String mid, String pid);
	
	// For user
	
	public List<PlaceVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public PlaceVO get(String pid);
	
}
