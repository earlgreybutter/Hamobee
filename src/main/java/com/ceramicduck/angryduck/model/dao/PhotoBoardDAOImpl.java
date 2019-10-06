package com.ceramicduck.angryduck.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ceramicduck.angryduck.model.dto.PhotoBoardDTO;

@Repository
public class PhotoBoardDAOImpl implements PhotoBoardDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public List<PhotoBoardDTO> listAll(int start, int end, String search_option, String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("photo_board.listAll");
	}
	
	
}
