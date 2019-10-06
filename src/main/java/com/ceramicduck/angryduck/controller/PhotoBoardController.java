package com.ceramicduck.angryduck.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

import com.ceramicduck.angryduck.dto.AccountDTO;
import com.ceramicduck.angryduck.dto.PhotoBoardDTO;
import com.ceramicduck.angryduck.service.PhotoBoardService;

@Controller
@RequestMapping("/photo_board/*")
public class PhotoBoardController {

	@Inject
	PhotoBoardService photoBoardService;
	
	@RequestMapping("write")
	public String write() {	
		return "photo_board/write";
	}
	
	private static final Logger logger = LoggerFactory.getLogger(PhotoBoardController.class);
	
	@RequestMapping("insert")
	public String insert(
			@ModelAttribute PhotoBoardDTO dto,
			@RequestParam("tag") String[] tag,
			@RequestParam("instrument") String[] instrument, HttpSession session) throws IOException{
		String filename="-";
		if(!dto.getFile1().isEmpty()) {
			filename = System.currentTimeMillis()+dto.getFile1().getOriginalFilename();
			//배포 경로
			String path1 = "C:\\Users\\a\\Desktop\\project\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\hamobee\\resources\\images\\";
			
			//개발 경로
			String path2 = "C:\\Users\\a\\Desktop\\project\\workspace\\hamobee\\src\\main\\webapp\\resources\\images\\";
			
			// 이미지를 배포경로로 옮기고 개발 경로로 복사한다.
			File file = new File(path1+filename);
			File mfile = new File(path2+filename);
			
			InputStream inStream= null;
			OutputStream outStream = null;
			try {
				dto.getFile1().transferTo(file);
				inStream = new FileInputStream(file);
				outStream = new FileOutputStream(mfile);
				
				byte[] buffer = new byte[1024]; 
			    int length;
			    while ((length = inStream.read(buffer)) > 0){
			    	 outStream.write(buffer, 0, length);
			    }
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally{
				inStream.close();
				outStream.close();
			}
		}
		dto.setImage(filename);
		int writerId = (int)session.getAttribute("id");
		dto.setWriterId(writerId);
		photoBoardService.insert(dto);
		
		int concertId = photoBoardService.getId(writerId);
		photoBoardService.insertConcertInstrument(concertId, instrument);
		photoBoardService.insertConcertTag(concertId,tag);
		return "redirect:/photoboard";
	}
	
	@RequestMapping("view")
	public ModelAndView view(
			@RequestParam int id,
			@RequestParam int curPage,
			@RequestParam String searchOption,
			@RequestParam String keyword, HttpSession session, ModelAndView mav) {
		photoBoardService.increaseViewcnt(id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		mav.setViewName("photo_board/content");
		map.put("dto",photoBoardService.getView(id));
		map.put("curPage",curPage);
		map.put("search_option", searchOption);
		map.put("keyword", keyword);
		mav.addObject("map",map);
		return mav;
	}
	
	@RequestMapping("insertApply")
	@ResponseBody
	public void insertApply(
			@RequestParam("concert_id") int concertId,
			HttpSession session) {
		int account_id = (int)session.getAttribute("id");
		photoBoardService.insertApply(account_id,concertId);
	}
	
	@RequestMapping("viewApplicants")
	public ModelAndView viewApplicants(@RequestParam("id") int concert_id, HttpSession session, ModelAndView mav) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<AccountDTO> applicants = photoBoardService.getApplicants(concert_id);
		map.put("applicants",applicants);
		mav.addObject("map",map);
		mav.setViewName("photo_board/applicants");
		return mav;
	}
	
	@RequestMapping("deleteConcert")
	public String deleteConcert(@RequestParam("id") int concert_id) {
		photoBoardService.deleteConcert(concert_id);
		return "redirect:/photoboard";
	}
}
