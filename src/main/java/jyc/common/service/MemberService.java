package jyc.common.service;

import jyc.common.domain.AuthVO;
import jyc.common.domain.MemberVO;

public interface MemberService {

	public void joinUser(MemberVO member, AuthVO auth);
	
	public void joinManager(MemberVO member, AuthVO auth);
	
	public int idCheck(String memberId) throws Exception;
	
	public MemberVO get(String userid);
	
	public MemberVO managerGetUserInfo(String id);
	
}
