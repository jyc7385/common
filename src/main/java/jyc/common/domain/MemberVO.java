package jyc.common.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat; // For @DateTimeFormat

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String phoneNumber;
	private String address;
	private String email;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birthDate;
	private char gender;

	private List<AuthVO> authList;
	
}
