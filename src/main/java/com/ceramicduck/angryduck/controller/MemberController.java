package com.ceramicduck.angryduck.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ceramicduck.angryduck.model.dto.MemberDTO;
import com.ceramicduck.angryduck.service.member.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
	
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("join.do")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping("id_doublecheck.do")
	public ModelAndView id_doublecheck(@ModelAttribute MemberDTO dto, ModelAndView mav) {
		
		Map<String,Object> map = new HashMap<>();	
		
		String message = memberService.id_doublecheck(dto.getUserid());
		//아이디 중복시 "id_error" 반환 아닐시 "id_success" 반환
		
		map.put("message",message);
		map.put("dto",dto);
		mav.addObject("map",map);
		mav.setViewName("member/join");
		return mav; 
		/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		 url이 member.join.do에서 member/id_doublecheck.do로 바뀌는 문제점이 있어  
		 */
	}
	
	@RequestMapping("insert.do")
	public ModelAndView join_check(@ModelAttribute MemberDTO dto, ModelAndView mav) {
		memberService.insert(dto);
		mav.setViewName("member/login");
		mav.addObject("message","join_success");
		return mav;
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(@ModelAttribute MemberDTO dto, 
			HttpSession session, ModelAndView mav) {
			
		String message=memberService.login_check(dto,session);
		//로그인 성공시 "login_success"
		//로그인 실패시 "login_fail"
		
		if(message=="login_success") {
			mav.setViewName("main");
		}else if(message=="login_fail"){
			Map<String,Object> map= new HashMap<>();
			map.put("message",message);
			map.put("dto",dto);
			
			mav.addObject("map",map);
			mav.setViewName("member/login");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		
		memberService.logout(session);
		
		mav.addObject("message","member_logout");
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("delete.do")
	public ModelAndView delete(ModelAndView mav, HttpSession session) {
		
		
		memberService.delete(session);
		
		mav.addObject("message","member_delete");
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("edit.do")
	public ModelAndView edit(ModelAndView mav, HttpSession session) {
		
		MemberDTO dto = memberService.getMemberDTO(session);
		
		mav.addObject("dto",dto);
		mav.setViewName("member/edit");
		return mav;
	}
	
	@RequestMapping("update.do")
	public ModelAndView update(@ModelAttribute MemberDTO dto,ModelAndView mav,HttpSession session) {
		memberService.update(dto,session);
		
		mav.addObject("message","member_update");
		mav.setViewName("main");
		return mav;
	}
}
