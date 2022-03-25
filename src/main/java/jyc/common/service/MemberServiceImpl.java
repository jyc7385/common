package jyc.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.stereotype.Service;

import jyc.common.domain.AuthVO;
import jyc.common.domain.MemberVO;
import jyc.common.mapper.MemberMapper;
import jyc.common.service.MemberService;
import lombok.AllArgsConstructor;
// import lombok.extern.log4j.Log4j;

// @Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Override
	public void joinUser(MemberVO member, AuthVO auth) {
		
		member.setPw(pwencoder.encode(member.getPw()));
		
		auth.setId(member.getId());
		auth.setAuth("ROLE_USER");
		
		mapper.joinMember(member);
		mapper.joinAuth(auth);
		
	}
	
	@Override
	public void joinManager(MemberVO member, AuthVO auth) {
		
		member.setPw(pwencoder.encode(member.getPw()));
		
		auth.setId(member.getId());
		auth.setAuth("ROLE_MANAGER");
		
		mapper.joinMember(member);
		mapper.joinAuth(auth);
		
	}
	
	@Override
	public int idCheck(String memberId) throws Exception { 		
		
		return mapper.idCheck(memberId);			
		
	}
	
	@Override
	public MemberVO get(String userid) {
		
		return mapper.read(userid);
		
	}
	
	@Override
	public MemberVO managerGetUserInfo(String id) {
		
		return mapper.managerGetUserInfo(id);
		
	}
	
}
