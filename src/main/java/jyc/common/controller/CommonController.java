package jyc.common.controller;


import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jyc.common.domain.AuthVO;
import jyc.common.domain.MemberVO;
import jyc.common.service.MemberService;
import lombok.AllArgsConstructor;
// import lombok.extern.log4j.Log4j;

@Controller
// @Log4j
@AllArgsConstructor
public class CommonController {
	
	private MemberService service;
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		model.addAttribute("msg", "Access Denied");	
		
	}
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public void login() { }
	
	@GetMapping("/joinType")
	public void joinType() { }
	
	@GetMapping("/joinUser")
	public void joinUser() { }
	
	@PostMapping("/joinUser")
	public String joinUser(MemberVO member, AuthVO auth, RedirectAttributes rttr, Model model) {		
		
		service.joinUser(member, auth);		
		rttr.addFlashAttribute("loginAlert", "joinUser");		
		
		return "redirect:/login";
		
	}
	
	@GetMapping("/joinManager")
	public void joinManager() { }
	
	@PostMapping("/joinManager")
	public String joinManager(MemberVO member, AuthVO auth, RedirectAttributes rttr, Model model) {

		service.joinManager(member, auth);		
		rttr.addFlashAttribute("loginAlert", "joinManager");
		
		return "redirect:/login";
		
	}
	
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.GET)
	@ResponseBody
	public String memberIdChk(String memberId) throws Exception {
				
		int result = service.idCheck(memberId);
				
		if(result != 0) return "fail";
		else return "success";
		
	}
		
}
