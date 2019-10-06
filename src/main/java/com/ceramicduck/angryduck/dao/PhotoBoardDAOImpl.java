package com.ceramicduck.angryduck.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ceramicduck.angryduck.dto.AccountDTO;
import com.ceramicduck.angryduck.dto.InstrumentDTO;
import com.ceramicduck.angryduck.dto.PhotoBoardDTO;
import com.ceramicduck.angryduck.dto.TagDTO;

@Repository
public class PhotoBoardDAOImpl implements PhotoBoardDAO {

final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int countArticle(String searchOption, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search_option",searchOption);
		map.put("keyword",keyword);
		return sqlSession.selectOne("photoBoard.countArticle", map);
	}
	
	@Override
	public List<PhotoBoardDTO> listAll(int start, int end, 
			String searchOption, String keyword){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search_option",searchOption);
		map.put("keyword",keyword);
		map.put("start",start);
		map.put("end",end);
		return sqlSession.selectList("photoBoard.listAll",map);
	}
	
	@Override
	public void insert(PhotoBoardDTO dto) {
		sqlSession.insert("photoBoard.insert", dto);
	}
	
	@Override
	public PhotoBoardDTO getView(int id) {
		return sqlSession.selectOne("photoBoard.getView",id);
	}
	
	@Override
	public int getId(int writerId) {
		return sqlSession.selectOne("photoBoard.getId",writerId);
	}
	
	@Override
	public void insertConcertInstrument(int concertId, String[] instrument) {
		for(int i=0; i<instrument.length; i++) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("concert_id",concertId);
			String inst = instrument[i];
			int instrumentId = sqlSession.selectOne("photoBoard.instrument",inst);
			map.put("instrument_id",instrumentId);
			sqlSession.insert("photoBoard.insert_concert_instrument",map);
		}
	}
	
	@Override
	public void insertConcertTag(int concertId, String[] tag) {
		for(int i=0; i<tag.length; i++) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("concert_id",concertId);
			String t = tag[i];
			int tagId = sqlSession.selectOne("photoBoard.tag",t);
			map.put("tag_id",tagId);
			sqlSession.insert("photoBoard.insert_concert_tag",map);
		}
	}
	
	@Override
	public void increaseViewcnt(int id) {
		sqlSession.update("photoBoard.increaseViewcnt",id);
	}
	
	@Override
	public List<InstrumentDTO> getConcertInstrument(int id) {
		List<InstrumentDTO> list = new ArrayList<InstrumentDTO>();
		list = sqlSession.selectList("photoBoard.get_concert_instrument", id);
		return list;
	}
	
	@Override
	public List<TagDTO> getConcertTag(int id) {
		List<TagDTO> list = new ArrayList<TagDTO>();
		list = sqlSession.selectList("photoBoard.get_concert_tag", id);
		return list;
	}
	
	@Override
	public PhotoBoardDTO getNotice(int id) {
		return sqlSession.selectOne("photoBoard.getNotice",id);
	}
	
	@Override
	public List<Integer> getAllId(int writerId) {
		return sqlSession.selectList("photoBoard.getAllId",writerId);
	}
	
	@Override
	public void insertApply(int accountId, int concertId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("account_id",accountId);
		map.put("concert_id",concertId);
		sqlSession.insert("photoBoard.insertApply",map);
	}
	
	@Override
	public void deleteConcert(int concertId) {
		sqlSession.delete("photoBoard.delete_concert_performer",concertId);
		sqlSession.delete("photoBoard.delete_concert_instrument",concertId);
		sqlSession.delete("photoBoard.delete_concert_tag",concertId);
		sqlSession.delete("photoBoard.delete_concert",concertId);
	}
	
}
