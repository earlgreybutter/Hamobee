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
import com.ceramicduck.angryduck.dto.TagDTO;

@Repository
public class AccountDAOImpl implements AccountDAO {
	@Inject
	SqlSession sqlSession;
	
	final Logger logger = LoggerFactory.getLogger(AccountDAOImpl.class);
	
	@Override
	public int getId(String email) {
		return sqlSession.selectOne("account.get_id",email);
	}
	
	@Override 
	public void insertAccount(AccountDTO dto) {
		sqlSession.insert("account.insert_account",dto);
	}
	
	@Override
	public String emailDoubleCheck(String email) {
		
		return sqlSession.selectOne("account.email_double_check",email);
	}
	
	@Override
	public void insertAccountInstrument(int accountId, String[] instrument) {
		for(int i=0; i<instrument.length; i++) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("accountId",accountId);
			String inst = instrument[i];
			int instrumentId = sqlSession.selectOne("account.instrument",inst);
			map.put("instrumentId",instrumentId);
			sqlSession.insert("account.insert_account_instrument",map);
		}
	}
	
	@Override
	public void insertAccountTag(int accountId, String[] tag) {
		for(int i=0; i<tag.length; i++) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("accountId",accountId);
			String t = tag[i];
			int tagId = sqlSession.selectOne("account.tag", t);
			map.put("tagId", tagId);
			sqlSession.insert("account.insert_account_tag",map);
		}
	}
	
	@Override
	public AccountDTO loginCheck(AccountDTO dto) {
		return sqlSession.selectOne("account.login_check",dto);
	}
	
	@Override
	public void deleteAccountInstrument(int accountId) {
		sqlSession.delete("account.delete_account_instrument",accountId);
	}
	
	@Override
	public void deleteAccountTag(int accountId) {
		sqlSession.delete("account.delete_account_tag",accountId);
	}
	
	@Override 
	public void deleteAccount(int accountId) {
		sqlSession.delete("account.delete_account",accountId); 
	}
	
	@Override
	public AccountDTO getAccount(int accountId) {
		return sqlSession.selectOne("account.get_account",accountId);
	}
	
	@Override
	public List<InstrumentDTO> getAccountInstrument(int accountId) {
		List<InstrumentDTO> list = new ArrayList<InstrumentDTO>();
		
		list = sqlSession.selectList("account.get_account_instrument", accountId);
		return list;
	}
	
	@Override
	public List<TagDTO> getAccountTag(int accountId) {
		List<TagDTO> list = new ArrayList<TagDTO>();
		list = sqlSession.selectList("account.get_account_tag", accountId);
		return list;
	}
	
	@Override
	public void updateAccount(AccountDTO dto) {
		sqlSession.update("account.update_account",dto);
	}
	
	@Override
	public void deleteAll(int accountId) {
		sqlSession.delete("account.delete_community_comment",accountId);
		sqlSession.delete("account.delete_community",accountId);
		sqlSession.delete("account.delete_concert_performer",accountId);
	}
	
	@Override
	public List<AccountDTO> getApplicants(int concertId){
		return sqlSession.selectList("account.getApplicants",concertId);
	}
	
}
