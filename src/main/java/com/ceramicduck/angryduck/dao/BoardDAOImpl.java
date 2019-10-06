package com.ceramicduck.angryduck.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ceramicduck.angryduck.dto.BoardDTO;
import com.ceramicduck.angryduck.dto.CommentDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int countArticle(String searchOption, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search_option",searchOption);
		map.put("keyword",keyword);
		return sqlSession.selectOne("board.countArticle", map);
	}
	
	@Override
	public List<BoardDTO> listAll(int start, int end, String searchOption, String keyword){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search_option",searchOption);
		map.put("keyword",keyword);
		map.put("start",start);
		map.put("end",end);
		return sqlSession.selectList("board.listAll",map);
	}
	
	@Override
	public void insert(BoardDTO dto) {
		sqlSession.insert("board.insert", dto);
		
	}
	
	@Override
	public BoardDTO getView(int id) {
		return sqlSession.selectOne("board.getView",id);
	}
	
	@Override
	public void increaseViewcnt(int id) {
		sqlSession.update("board.increaseViewcnt",id);
	}
	
	@Override
	public void insertComment(CommentDTO dto) {
		sqlSession.insert("board.insertComment",dto);
	}
	
	@Override
	public List<CommentDTO> getComments(int communityId){
		return sqlSession.selectList("board.getComments",communityId);
	
	}
	
	@Override
	public BoardDTO getNotice(int id) {
		return sqlSession.selectOne("board.getNotice",id);
	}
	
	@Override
	public void deleteCommunity(int id) {
		sqlSession.delete("board.delete_community_comment",id);
		sqlSession.delete("board.delete_community",id);
	}
	
}
