package com.ceramicduck.angryduck.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.ceramicduck.angryduck.model.dao.MemberDAO;
import com.ceramicduck.angryduck.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	
	@Override
	public String id_doublecheck(String userid) {
		
		//아이디가 중복되는것이 있는지 확인 , 중복되면 중복된 userid반환 아닐시 null
		String checkid = memberDao.id_doublecheck(userid);
			
		if(checkid !=null) { //아이디가 중복될 경우
			return "id_error";
		}else { //아이디 중복이 아닌경우
			return "id_success";
		}
	}
	
	@Override
	public void insert(MemberDTO dto) {
		memberDao.insert(dto);
	}
	
	@Override
	public String login_check(MemberDTO dto, HttpSession session) {
		
		String name=memberDao.login_check(dto);
		String result;
		if(name!=null) {
			session.setAttribute("userid",dto.getUserid());
			session.setAttribute("name",name);
			
			result="login_success";
		}else {
			result="login_fail";
		}
		
		return result;
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	@Override
	public void delete(HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		
		memberDao.delete(userid);
		session.invalidate();
	}
	
	@Override
	public MemberDTO getMemberDTO(HttpSession session) {
		return memberDao.getMemberDTO((String)session.getAttribute("userid"));
	}
	
	@Override
	public void update(MemberDTO dto, HttpSession session) {
		memberDao.update(dto);
		session.setAttribute("name",dto.getName());
	}
}
