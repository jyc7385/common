package jyc.common.service;

import java.util.List;

import org.springframework.stereotype.Service;

import jyc.common.domain.Criteria;
import jyc.common.domain.PlaceVO;
import jyc.common.mapper.PlaceMapper;
import jyc.common.service.PlaceService;
import lombok.AllArgsConstructor;
// import lombok.extern.log4j.Log4j;

// @Log4j
@Service
@AllArgsConstructor
public class PlaceServiceImpl implements PlaceService {

	private PlaceMapper mapper;
	
	// For manager
	
	@Override
	public void registerPlace(PlaceVO place) {		
				
		mapper.registerPlace(place);
		
	}
	
	@Override
	public int checkPlaceName(String name) throws Exception { 
		
		return mapper.checkPlaceName(name);
		
	}
	
	@Override
	public List<PlaceVO> getList(String mid, Criteria cri) {
		
		return mapper.getListWithPaging(mid, cri);
		
	}
	
	@Override
	public int getTotal(String mid, Criteria cri) {
		
		return mapper.getTotalCount(mid, cri);
		
	}
	
	@Override
	public PlaceVO get(String mid, String pid) {
		
		return mapper.read(mid, pid);
		
	}
	
	@Override
	public boolean modify(PlaceVO place) {
		
		return mapper.update(place) == 1;
		
	}
	
	@Override
	public boolean remove(String mid, String pid) {
		
		return mapper.delete(mid, pid) == 1;
		
	}
	
	// For user
	
	@Override
	public List<PlaceVO> getList(Criteria cri) {
		
		return mapper.getListWithPaging2(cri);
		
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount2(cri);
		
	}
	
	@Override
	public PlaceVO get(String pid) {
		
		return mapper.read2(pid);
		
	}
			
}
