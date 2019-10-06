package com.ceramicduck.angryduck.service;

import javax.servlet.http.HttpSession;

import com.ceramicduck.angryduck.dto.AccountDTO;

public interface AccountService {
	//회원가입 부분
	public String emailDoubleCheck(String email);
	public void insertAccount(AccountDTO dto);
	public void insertAccountInstrument(int accountId, String[] instrument);
	public void insertAccountTag(int accountId, String[] tag);
	
	//로그인 부분
	public String loginCheck(AccountDTO dto, HttpSession session);
	
	//로그아웃 부분
	public void logout(HttpSession session);
	
	//회원탈퇴 부분
	public void deleteAccount(int accountId);
	public void deleteAccountInstrument(int accountId);
	public void deleteAccountTag(int accountId);
	
	//정보수정 부분
	public void updateAccount(AccountDTO dto);
	
	public int getId(String email);
	public AccountDTO getDto(int accountId);
	
	public void deleteAll(int accountId);
}
