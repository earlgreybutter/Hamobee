package com.ceramicduck.angryduck.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ceramicduck.angryduck.model.dto.MemberDTO;



@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public String id_doublecheck(String userid) {
		return sqlSession.selectOne("member.id_doublecheck",userid);
	}
	
	@Override
	public void insert(MemberDTO dto) {
		sqlSession.insert("member.insert",dto);
	}
	
	@Override
	public String login_check(MemberDTO dto) {
		return sqlSession.selectOne("member.login_check",dto);
	}
	
	@Override
	public void delete(String userid) {
		sqlSession.delete("member.delete",userid);
	}
	
	@Override
	public MemberDTO getMemberDTO(String userid) {
		return sqlSession.selectOne("member.getMemberDTO",userid);
	}
	
	@Override
	public void update(MemberDTO dto) {
		sqlSession.update("member.update",dto);
	}
}
