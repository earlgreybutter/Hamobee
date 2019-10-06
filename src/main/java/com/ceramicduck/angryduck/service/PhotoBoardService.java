package com.ceramicduck.angryduck.service;

import java.util.List;

import com.ceramicduck.angryduck.dto.AccountDTO;
import com.ceramicduck.angryduck.dto.PhotoBoardDTO;

public interface PhotoBoardService {
	public List<PhotoBoardDTO> listAll(int start, int end, String searchOption, String keyword);
	public void insert(PhotoBoardDTO dto);
	public void increaseViewcnt(int id);
	public PhotoBoardDTO getView(int id);
	public int countArticle(String searchOption, String keyword);
	
	public int getId(int writerId);
	public void insertConcertInstrument(int concert_id, String[] instrument);
	public void insertConcertTag(int concertId, String[] tag);
	public PhotoBoardDTO getNotice(int id);
	public void insertApply(int accountId, int concertId);
	public List<AccountDTO> getApplicants(int concertId);
	public void deleteConcert(int concertId);
}
