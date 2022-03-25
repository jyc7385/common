package jyc.common.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jyc.common.domain.Criteria;
import jyc.common.domain.PageDTO;
import jyc.common.domain.PlaceVO;
import jyc.common.service.MemberService;
import jyc.common.service.PlaceService;
import jyc.common.service.ReservationService;
import lombok.AllArgsConstructor;
// import lombok.extern.log4j.Log4j;

@Controller
// @Log4j
@RequestMapping("/manager/*")
@AllArgsConstructor
public class ManagerController {

	private MemberService mservice;
	private PlaceService service;
	private ReservationService rservice;
			
	@GetMapping("/register")
	public void register(Authentication authentication, Model model) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		
		model.addAttribute("member", mservice.get(username));
		
	}
	
	@PostMapping("/register")
	public String joinUser(PlaceVO place, RedirectAttributes rttr, Model model) {
		
		service.registerPlace(place);
		
		return "redirect:/manager/list";
		
	}
	
	@GetMapping("/checkPlaceName")
	@ResponseBody
	public String checkPlaceName(String name) throws Exception {
				
		int result = service.checkPlaceName(name);
				
		if(result != 0) return "fail";
		else return "success";
		
	}
	
	@GetMapping("/list")
	public void list(Authentication authentication, Criteria cri, Model model) {
				
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();

		model.addAttribute("place", service.getList(username, cri));
		
		int total = service.getTotal(username, cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@GetMapping("/get")
	public void get(Authentication authentication, @RequestParam("pid") String pid, @ModelAttribute("cri") Criteria cri, Model model) {
				
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		
		model.addAttribute("place", service.get(username, pid));
		
	}
	
	@PostMapping("/modify")
	public String modify(PlaceVO place, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		service.modify(place);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/manager/list";
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("mid") String mid, @RequestParam("pid") String pid, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		service.remove(mid, pid);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/manager/list";
		
	}
	
	// Reservation
	
	@GetMapping("/resList")
	public void resList(Authentication authentication, String pid, @RequestParam(value = "resDate", defaultValue="") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate resDate, Model model) {
				
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		
		model.addAttribute("resDate", resDate);	
		model.addAttribute("place", service.get(username, pid));
		model.addAttribute("res", rservice.readManagerRes(username, pid, resDate));
				
	}
	
	@GetMapping("/resRegister")
	public void resRegister(Authentication authentication, String pid, Model model) {
				
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();

		model.addAttribute("place", service.get(username, pid));
				
	}
	
	@PostMapping("/resRegister")
	@ResponseBody
	public String resRegister(@RequestBody HashMap<String, Object> res, RedirectAttributes rttr, Model model) {
				
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("mid", res.get("mid"));
		map.put("pid", res.get("pid"));
		map.put("pname", res.get("pname"));
		map.put("userId", res.get("userId"));
		map.put("regDateTime", res.get("regDateTime"));
		List<Map<String,Object>> list = (List<Map<String, Object>>) res.get("resArr");
		map.put("resList" , list);
		
		rservice.registerReservation(map);
				
		return "true";
		
	}
	
	@GetMapping("/info")
	public void info() { }
	
	@GetMapping("/getRes")
	public void managerGetRes(int rid, Authentication authentication, Model model) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		
		model.addAttribute("res", rservice.managerGetRes(rid, username));
				
	}
	
	@PostMapping("/cancelRes")
	public String managerCancleRes(int rid, String mid, String userId, String regDateTime, String pid, String resDate) {
				
		rservice.managerCancelRes(rid, mid, "", "");
		
		return "redirect:/manager/resList?pid=" + pid + "&resDate=" + resDate;
		
	}
	
	@PostMapping("/removeRes")
	public String managerRemoveRes(int rid, String mid, String pid, String resDate) {
		
		rservice.managerRemoveRes(rid, mid);
		
		return "redirect:/manager/resList?pid=" + pid + "&resDate=" + resDate;
		
	}
	
	@PostMapping("/checkRes")
	@ResponseBody
	public String managerCheckRes(@RequestBody Map<String, Object> paramData) {
		
		String startDate = (String) paramData.get("startDate");
		String finishDate = (String) paramData.get("finishDate");
		String pid = (String) paramData.get("pid");
		
		int result = rservice.managerCheckRes(startDate, finishDate, pid);
		
		if(result != 0) return "fail";
		else return "success";
		
	}
	
	// reservation -> get user info
	
	@GetMapping("/getUserInfo")
	public void get(@RequestParam("id") String id, Model model) {
		
		model.addAttribute("mem", mservice.managerGetUserInfo(id));	
		
	}
				
}