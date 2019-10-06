package com.ceramicduck.angryduck.dao;

import java.util.ArrayList;
import java.util.List;

import com.ceramicduck.angryduck.dto.AccountDTO;
import com.ceramicduck.angryduck.dto.InstrumentDTO;
import com.ceramicduck.angryduck.dto.TagDTO;

public interface AccountDAO {
	public String emailDoubleCheck(String email);
	public void insertAccount(AccountDTO dto);
	public int getId(String email);
	public void insertAccountInstrument(int accountId, String[] instrument);
	public void insertAccountTag(int accountId, String[] tag);
	public AccountDTO loginCheck(AccountDTO dto);
	public void deleteAccountInstrument(int accountId);
	public void deleteAccountTag(int accountId);
	public void deleteAccount(int accountId);
	public void updateAccount(AccountDTO dto);
	public AccountDTO getAccount(int accountId);
	public List<InstrumentDTO> getAccountInstrument(int accountId);
	public List<TagDTO> getAccountTag(int accountId);
	public void deleteAll(int accountId);
	public List<AccountDTO> getApplicants(int concertId);
	
}
