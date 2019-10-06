package com.ceramicduck.angryduck.dao;

import java.util.List;

import com.ceramicduck.angryduck.dto.AccountDTO;
import com.ceramicduck.angryduck.dto.InstrumentDTO;
import com.ceramicduck.angryduck.dto.PhotoBoardDTO;
import com.ceramicduck.angryduck.dto.TagDTO;

public interface PhotoBoardDAO {
	public List<PhotoBoardDTO> listAll(int start, int end, String searchOption, String keyword);
	public void insert(PhotoBoardDTO dto);
	public PhotoBoardDTO getView(int id);
	public void increaseViewcnt(int id);
	public int countArticle(String searchOption, String keyword);
	public int getId(int writerId);
	public void insertConcertInstrument(int concertId, String[] instrument);
	public void insertConcertTag(int concertId, String[] tag);
	public List<InstrumentDTO> getConcertInstrument(int id);
	public List<TagDTO> getConcertTag(int id);
	public PhotoBoardDTO getNotice(int id);
	public List<Integer> getAllId(int writerId);
	public void insertApply(int accountId, int concertId);
	void deleteConcert(int concertId);
}
