package com.ceramicduck.angryduck.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ceramicduck.angryduck.model.dto.PhotoBoardDTO;
import com.ceramicduck.angryduck.service.photo_board.Pager;
import com.ceramicduck.angryduck.service.photo_board.PhotoBoardService;

@Controller
@RequestMapping("/photo_board/*")
public class PhotoBoardController {

	@Inject
	PhotoBoardService photoBoardService;
	
	@RequestMapping("write")
	public String write() {	
		return "photo_board/write";
	}
	
	@RequestMapping("insert")
	public String insert(@RequestParam(defaultValue="1")int curPage,
			@RequestParam(defaultValue="all")String search_option,
			@RequestParam(defaultValue="")String keyword,
			@ModelAttribute PhotoBoardDTO dto,Model model,HttpSession session) {
		
		int count=1000;
		Pager pager = new Pager(count,curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<PhotoBoardDTO> list = photoBoardService.listAll(start,end,search_option,keyword);
		model.addAttribute("list",list);
		return "photo_board/list";
	}
	
	@RequestMapping("content/{id}")
	public String content(@PathVariable("id") String id) {
		
		return "photo_board/content";
	}
}
