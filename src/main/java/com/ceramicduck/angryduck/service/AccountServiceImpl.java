package com.ceramicduck.angryduck.service;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import com.ceramicduck.angryduck.dao.AccountDAO;
import com.ceramicduck.angryduck.dao.PhotoBoardDAO;
import com.ceramicduck.angryduck.dto.AccountDTO;
import com.ceramicduck.angryduck.dto.InstrumentDTO;
import com.ceramicduck.angryduck.dto.TagDTO;

@Service
public class AccountServiceImpl implements AccountService {
	@Inject
	AccountDAO accountDao;
	
	@Inject
	PhotoBoardDAO photoBoardDao;
	
	@Override
	public void insertAccount(AccountDTO dto) {
		accountDao.insertAccount(dto);
	}
	
	@Override
	public String emailDoubleCheck(String email) {
		String checkEmail =  accountDao.emailDoubleCheck(email);
		if(checkEmail != null) //아이디가 중복일 경우
			return "emailFail";
		else //중복이 아닌경우
			return "emailSuccess";
	}
	
	@Override
	public int getId(String email) {
		return accountDao.getId(email);
	}

	@Override
	public void insertAccountInstrument(int accountId, String[] instrument) {
		accountDao.insertAccountInstrument(accountId, instrument);
	}

	@Override
	public void insertAccountTag(int accountId, String[] tag) {
		accountDao.insertAccountTag(accountId, tag);
	}

	@Override
	public String loginCheck(AccountDTO dto, HttpSession session) {
		AccountDTO tempdto = accountDao.loginCheck(dto);
		String message;
		if(tempdto !=null) { //로그인 성공
			session.setAttribute("name",tempdto.getName());
			session.setAttribute("id",tempdto.getId());
			session.setAttribute("role",tempdto.getRole());
			message = "loginSuccess";
		}
		else { // 로그인 실패
			message = "loginFail";
		}
		return message;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void deleteAccount(int accountId) {
		accountDao.deleteAccount(accountId);
	}
	
	@Override
	public void deleteAccountInstrument(int accountId) {
		accountDao.deleteAccountInstrument(accountId);
	}
	
	@Override
	public void deleteAccountTag(int accountId) {
		accountDao.deleteAccountTag(accountId);
	}
	
	@Override
	public AccountDTO getDto(int accountId) {
		AccountDTO dto = accountDao.getAccount(accountId);
		dto.setInstruments((ArrayList<InstrumentDTO>) accountDao.getAccountInstrument(accountId));
		dto.setTags((ArrayList<TagDTO>) accountDao.getAccountTag(accountId));
		return dto;
	}
	
	@Override
	public void updateAccount(AccountDTO dto) {
		accountDao.updateAccount(dto);
	}

	@Override
	public void deleteAll(int accountId) {
		ArrayList<Integer> concerts = (ArrayList<Integer>)photoBoardDao.getAllId(accountId); 
		int length = concerts.size();
		for(int i=0; i<length; i++) {
			photoBoardDao.deleteConcert(concerts.get(i));
		}
		accountDao.deleteAll(accountId);
	}
	
}
