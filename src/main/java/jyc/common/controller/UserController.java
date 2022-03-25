package jyc.common.controller;

import java.time.LocalDate;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jyc.common.domain.Criteria;
import jyc.common.domain.PageDTO;
import jyc.common.service.PlaceService;
import jyc.common.service.ReservationService;
import lombok.AllArgsConstructor;
// import lombok.extern.log4j.Log4j;

@Controller
// @Log4j
@RequestMapping("/common/*")
@AllArgsConstructor
public class UserController {

	private PlaceService service;
	private ReservationService rservice;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
				
		model.addAttribute("place", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("pid") String pid, @ModelAttribute("cri") Criteria cri, Model model) {
					
		model.addAttribute("place", service.get(pid));
		
	}
	
	// Reservation
	
	@GetMapping("/resList")
	public void resList(String pid, @RequestParam(value = "resDate", defaultValue="") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate resDate, Model model) {
		
		model.addAttribute("resDate", resDate);	
		model.addAttribute("place", service.get(pid));
		model.addAttribute("res", rservice.readUserRes(pid, resDate));
				
	}
	
	@PostMapping("/applyRes")
	public String modify(String pid, @RequestParam(value = "resDate", defaultValue="") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate resDate, int rid, String userId, String regDateTime) {
		
		rservice.userApplyRes(rid, userId, regDateTime);
		
		return "redirect:/common/resList?pid=" + pid + "&resDate=" + resDate;
		
	}
	
	@GetMapping("/info")
	public void info() { }
	
	@GetMapping("/personalResList")
	public void personalResList(Authentication authentication, Model model) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		
		model.addAttribute("res", rservice.userResList(username));
				
	}
	
	@GetMapping("/getRes")
	public void getRes(int rid, Authentication authentication, Model model) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		
		model.addAttribute("res", rservice.userGetRes(rid, username));
				
	}
	
	@PostMapping("/cancelRes")
	public String cancleRes(int rid, String userId, String regDateTime) {
				
		rservice.userCancelRes(rid, "", "");
		
		return "redirect:/common/personalResList";
		
	}
	
	@PostMapping("/checkRes")
	@ResponseBody
	public String userCheckRes(@RequestBody Map<String, Object> paramData) {
		
		String startDate = (String) paramData.get("startDate");
		String finishDate = (String) paramData.get("finishDate");
		String userId = (String) paramData.get("userId");
		String pid = (String) paramData.get("pid");
		
		int result = rservice.userCheckRes(startDate, finishDate, userId, pid);
		
		if(result != 0) return "fail";
		else return "success";
		
	}
						
}