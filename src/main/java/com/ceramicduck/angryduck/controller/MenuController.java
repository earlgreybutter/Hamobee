package com.ceramicduck.angryduck.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ceramicduck.angryduck.dto.BoardDTO;
import com.ceramicduck.angryduck.dto.MailDTO;
import com.ceramicduck.angryduck.dto.PhotoBoardDTO;
import com.ceramicduck.angryduck.service.BoardService;
import com.ceramicduck.angryduck.service.PhotoBoardService;
import com.ceramicduck.angryduck.util.Pager;

@Controller
public class MenuController {
	public static final int BOARD_NOTICE=1;
	public static final int PHOTOBOARD_NOTICE=1;
	
	@Inject
	PhotoBoardService photoBoardService;
	
	@Inject
	BoardService boardService;
	
	@Autowired 
	private JavaMailSenderImpl mailSender;

	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Locale locale, Model model) {
		return "about/about";
	}
	
	@RequestMapping(value = "/photoboard")
	public ModelAndView photoBoard(@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="all") String searchOption,
			@RequestParam(defaultValue="") String keyword,
			ModelAndView mav) {
		int count = photoBoardService.countArticle(searchOption, keyword);
		Pager pager = new Pager(count, curPage, 8, 10);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<PhotoBoardDTO> list = photoBoardService.listAll(start,end,searchOption,keyword);
		PhotoBoardDTO notice = photoBoardService.getNotice(PHOTOBOARD_NOTICE);
		mav.setViewName("photo_board/list");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("count",count);
		map.put("search_option",searchOption);
		map.put("keyword",keyword);
		map.put("pager",pager);
		map.put("notice",notice);
		mav.addObject("map",map);
		return mav;
	}
	
	@RequestMapping(value = "/board")
	public ModelAndView board(
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="all") String searchOption,
			@RequestParam(defaultValue="") String keyword,ModelAndView mav) {
		int count = boardService.countArticle(searchOption, keyword);
		Pager pager = new Pager(count, curPage, 8, 10);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<BoardDTO> list = boardService.listAll(start,end,searchOption,keyword);
		BoardDTO notice = boardService.getNotice(BOARD_NOTICE);
		mav.setViewName("board/list");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("count",count);
		map.put("search_option",searchOption);
		map.put("keyword",keyword);
		map.put("pager",pager);
		map.put("notice",notice);
		mav.addObject("map",map);
		return mav;
	}
	
	@RequestMapping(value="/contact")
	public String contact() {
		return "contact/writeMail";
	}
	
	@RequestMapping(value="/contact/sendMail")
	public ModelAndView sendMail(MailDTO dto, ModelAndView mav) { 
		final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
			@Override 
			public void prepare(MimeMessage mimeMessage) throws Exception { 
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(dto.getFrom()); 
				helper.setTo(dto.getTo()); 
				helper.setSubject(dto.getSubject()); 
				helper.setText(dto.getContents(), true);
			} 
		}; 
		mav.setViewName("main");
		mav.addObject("message","sendMailSuccess");
		mailSender.send(preparator); 
		return mav;
	}
}
