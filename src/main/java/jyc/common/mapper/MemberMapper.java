package jyc.common.mapper;

import jyc.common.domain.AuthVO;
import jyc.common.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userid);
	
	public void joinMember(MemberVO member);
	
	public void joinAuth(AuthVO auth);
	
	public int idCheck(String memberId);
	
	public MemberVO managerGetUserInfo(String id);
		
}
