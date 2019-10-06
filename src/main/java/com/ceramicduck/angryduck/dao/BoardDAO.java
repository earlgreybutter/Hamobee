package com.ceramicduck.angryduck.dao;

import java.util.List;

import com.ceramicduck.angryduck.dto.BoardDTO;
import com.ceramicduck.angryduck.dto.CommentDTO;

public interface BoardDAO {
	public List<BoardDTO> listAll(int start, int end, String searchOption, String keyword);
	public void insert(BoardDTO dto);
	public BoardDTO getView(int id);
	public int countArticle(String searchOption, String keyword);
	public void increaseViewcnt(int id);
	public void insertComment(CommentDTO dto);
	public List<CommentDTO> getComments(int communityId);
	public BoardDTO getNotice(int id);
	public void deleteCommunity(int id);
}
