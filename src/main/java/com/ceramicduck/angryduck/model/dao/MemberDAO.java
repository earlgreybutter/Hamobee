package com.ceramicduck.angryduck.model.dao;

import com.ceramicduck.angryduck.model.dto.MemberDTO;

public interface MemberDAO {
	public String id_doublecheck(String userid);
	public void insert(MemberDTO dto);
	public String login_check(MemberDTO dto);
	public void delete(String userid);
	public MemberDTO getMemberDTO(String userid);
	public void update(MemberDTO dto);
}
