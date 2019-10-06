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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ceramicduck.angryduck.dto.AccountDTO;
import com.ceramicduck.angryduck.service.AccountService;

@Controller
@RequestMapping("/account/*")
public class AccountController {
	@Inject
	AccountService accountService;
	
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@RequestMapping("edit")
	public ModelAndView edit(ModelAndView mav, HttpSession session) {
		int accountId = (int)session.getAttribute("id");
		AccountDTO dto = accountService.getDto(accountId);
		mav.addObject("dto",dto);
		mav.setViewName("account/update");
		return mav;
	}
	
	@RequestMapping("update")
	public ModelAndView update(
			@ModelAttribute AccountDTO dto, 
			@RequestParam("tag") String[] tag, 
			@RequestParam("instrument") String[] instrument, 
			HttpSession session, 
			ModelAndView mav) {
		
		int accountId = (int)session.getAttribute("id");
		accountService.updateAccount(dto);
		session.setAttribute("name",dto.getName());
		if(!instrument[0].equals("none")) {
			accountService.deleteAccountInstrument(accountId);
			accountService.insertAccountInstrument(accountId, instrument);
		}
		if(!tag[0].equals("none")) {
			accountService.deleteAccountTag(accountId);
			accountService.insertAccountTag(accountId,tag);
		}
		mav.addObject("message","updateSuccess");
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("delete")
	public ModelAndView delete(ModelAndView mav, HttpSession session) {
		
		int accountId = (int)session.getAttribute("id");
		accountService.deleteAll(accountId); //community, concert 관련정보 다 지움.
		accountService.deleteAccountInstrument(accountId);
		accountService.deleteAccountTag(accountId);
		accountService.deleteAccount(accountId);
		session.invalidate();
		
		mav.addObject("message","accountDelete");
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		accountService.logout(session);
		mav.addObject("message","accountLogout");
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("login")
	public String login() {
		return "account/login";
	}
	
	@RequestMapping("loginCheck")
	public ModelAndView loginCheck(@ModelAttribute AccountDTO dto, HttpSession session,
			ModelAndView mav) {
		
		String message = accountService.loginCheck(dto,session);
		//로그인 성공시 loginSuccess
		//로그인 실패시 loginFail
		if(message=="loginSuccess") { // 성공시
			mav.setViewName("main");
		}
		else {  // 실패시
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("message",message);
			map.put("email",dto.getEmail());
			
			mav.addObject("map",map);
			mav.setViewName("account/login");
		}
		return mav;
	}
	@RequestMapping("beforeJoin")
	public String beforeJoin(){
		return "account/beforeJoin";
	}
	
	@RequestMapping("join")
	public ModelAndView insertPerformer(@ModelAttribute AccountDTO dto, ModelAndView mav) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dto",dto);
		mav.addObject("map",map);
		mav.setViewName("account/join");
		return mav;
	}
	
	@RequestMapping("insert")
	public ModelAndView insert(@ModelAttribute AccountDTO dto, @RequestParam("tag") String[] tag
			, @RequestParam("instrument") String[] instrument, ModelAndView mav) {
		
		accountService.insertAccount(dto);
		int accountId = accountService.getId(dto.getEmail());
	
		if(!instrument[0].equals("none")) {
			accountService.insertAccountInstrument(accountId, instrument);
		}
		if(!tag[0].equals("none")) {
			accountService.insertAccountTag(accountId, tag);
		}
		mav.addObject("message","joinSuccess");
		mav.setViewName("account/login");
		return mav;
	}
	
	@RequestMapping("emailDoubleCheck")
	public ModelAndView emailDoubleCheck(@ModelAttribute AccountDTO dto, ModelAndView mav) {
		//mav에는 값이 하나 밖에 들어가지 못하므로 map을 사용하여 여러가지를 넣고 map을 mav에 넣어준다.
		Map<String, Object> map = new HashMap<String, Object>();
		
		String message = accountService.emailDoubleCheck(dto.getEmail());
		//email이 중복되는지 확인한다.
		//중복시 emailFail, 중복 아닐시 emailSuccess 
		map.put("message",message);
		map.put("dto",dto);
		mav.addObject("map",map);
		mav.setViewName("account/join");
		
		return mav;
		
	}
	
}
