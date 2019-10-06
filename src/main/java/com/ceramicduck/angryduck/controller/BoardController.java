package com.ceramicduck.angryduck.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ceramicduck.angryduck.dto.BoardDTO;
import com.ceramicduck.angryduck.dto.CommentDTO;
import com.ceramicduck.angryduck.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	
	@RequestMapping("write")
	public String write() {	
		return "/board/write";
	}
	
	@RequestMapping("insert")
	public String insert(@ModelAttribute BoardDTO dto, HttpSession session) {
		int writerId = (int)session.getAttribute("id");
		dto.setWriterId(writerId);
		boardService.insert(dto);
		return "redirect:/board";
	}
	
	@RequestMapping("view")
	public ModelAndView view(@RequestParam int id,
			@RequestParam int curPage,
			@RequestParam String searchOption,
			@RequestParam String keyword, HttpSession session, ModelAndView mav) {
		boardService.increaseViewcnt(id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<CommentDTO> comments = boardService.getComments(id);
		mav.setViewName("board/content");
		map.put("comments",comments);
		map.put("dto",boardService.getView(id));
		map.put("curPage",curPage);
		map.put("search_option", searchOption);
		map.put("keyword", keyword);
		mav.addObject("map",map);
		return mav;
	}
	
	@RequestMapping("insertComment")
	@ResponseBody
	public void insertCommnet(CommentDTO dto,HttpSession session) {
		int id = (int)session.getAttribute("id");
		dto.setWriterId(id);
		boardService.insertComment(dto);
	}
	
	@RequestMapping("deleteCommunity")
	public String deleteCommunity(@RequestParam("id") int id) {
		boardService.deleteCommunity(id);
		return "redirect:/board";
	}
	
}
