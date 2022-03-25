package jyc.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jyc.common.domain.Criteria;
import jyc.common.domain.PlaceVO;

public interface PlaceMapper {
	
	// For manager
	
	public void registerPlace(PlaceVO place);
	
	public int checkPlaceName(String name);
	
	public List<PlaceVO> getListWithPaging(@Param("mid") String mid, @Param("cri") Criteria cri);

	public int getTotalCount(@Param("mid") String mid, @Param("cri") Criteria cri);
	
	public PlaceVO read(@Param("mid") String mid, @Param("pid") String pid);
	
	public int update(PlaceVO place);
	
	public int delete(@Param("mid") String mid, @Param("pid") String pid);
	
	// For user
	
	public List<PlaceVO> getListWithPaging2(@Param("cri") Criteria cri);

	public int getTotalCount2(@Param("cri") Criteria cri);
	
	public PlaceVO read2(@Param("pid") String pid);
	
}
