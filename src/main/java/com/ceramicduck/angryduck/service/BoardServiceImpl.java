package com.ceramicduck.angryduck.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ceramicduck.angryduck.dao.BoardDAO;
import com.ceramicduck.angryduck.dto.BoardDTO;
import com.ceramicduck.angryduck.dto.CommentDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardDAO boardDao;
	
	@Override
	public List<BoardDTO> listAll(int start, int end, String searchOption, String keyword){
		return boardDao.listAll(start, end, searchOption, keyword);
	}
	
	@Override
	public void insert(BoardDTO dto) {
		boardDao.insert(dto);
	}
	
	@Override
	public BoardDTO getView(int id) {
		return boardDao.getView(id);
	}
	
	@Override
	public int countArticle(String searchOption, String keyword) {
		return boardDao.countArticle(searchOption,keyword);
	}
	
	@Override
	public void increaseViewcnt(int id) {
		boardDao.increaseViewcnt(id);
	}
	
	@Override
	public void insertComment(CommentDTO dto) {
		boardDao.insertComment(dto);
	}
	
	@Override
	public List<CommentDTO> getComments(int communityId){
		return boardDao.getComments(communityId);
	}
	
	@Override
	public BoardDTO getNotice(int id) {
		return boardDao.getNotice(id);
	}
	
	@Override
	public void deleteCommunity(int id) {
		boardDao.deleteCommunity(id);
	}
	
}
