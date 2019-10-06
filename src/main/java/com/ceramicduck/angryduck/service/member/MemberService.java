package com.ceramicduck.angryduck.service.member;

import javax.servlet.http.HttpSession;

import com.ceramicduck.angryduck.model.dto.MemberDTO;

public interface MemberService {

	public String id_doublecheck(String userid);
	public void insert(MemberDTO dto);
	public String login_check(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);
	public void delete(HttpSession session);
	public MemberDTO getMemberDTO(HttpSession session);
	public void update(MemberDTO dto, HttpSession session);
}
