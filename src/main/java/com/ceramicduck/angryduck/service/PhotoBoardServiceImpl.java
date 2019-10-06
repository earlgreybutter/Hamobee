package com.ceramicduck.angryduck.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ceramicduck.angryduck.dao.AccountDAO;
import com.ceramicduck.angryduck.dao.AccountDAOImpl;
import com.ceramicduck.angryduck.dao.PhotoBoardDAO;
import com.ceramicduck.angryduck.dto.AccountDTO;
import com.ceramicduck.angryduck.dto.InstrumentDTO;
import com.ceramicduck.angryduck.dto.PhotoBoardDTO;
import com.ceramicduck.angryduck.dto.TagDTO;

@Service
public class PhotoBoardServiceImpl implements PhotoBoardService {
	@Inject
	PhotoBoardDAO photoBoardDao;
	
	@Inject
	AccountDAO accountDao;
	
	final Logger logger = LoggerFactory.getLogger(PhotoBoardServiceImpl.class);
	
	@Override
	public List<PhotoBoardDTO> listAll(int start, int end, String searchOption, String keyword){
		return photoBoardDao.listAll(start, end, searchOption, keyword);
	}
	
	@Override
	public void insert(PhotoBoardDTO dto) {
		photoBoardDao.insert(dto);
	}
	
	@Override
	public PhotoBoardDTO getView(int id) {
		PhotoBoardDTO dto = photoBoardDao.getView(id);
		dto.setInstruments((ArrayList<InstrumentDTO>) photoBoardDao.getConcertInstrument(id));
		dto.setTags((ArrayList<TagDTO>) photoBoardDao.getConcertTag(id));
		return dto;
	}
	
	@Override
	public int countArticle(String searchOption, String keyword) {
		return photoBoardDao.countArticle(searchOption,keyword);
	}
	
	@Override
	public int getId(int writerId) {
		return photoBoardDao.getId(writerId);
	}
	
	@Override
	public void insertConcertInstrument(int concertId, String[] instrument) {
		photoBoardDao.insertConcertInstrument(concertId, instrument);
		
	}
	
	@Override
	public void insertConcertTag(int concertId, String[] tag) {
		photoBoardDao.insertConcertTag(concertId, tag);
	}
	
	@Override
	public void increaseViewcnt(int id) {
		photoBoardDao.increaseViewcnt(id);
	}
	
	@Override
	public PhotoBoardDTO getNotice(int id) {
		return photoBoardDao.getNotice(id);
	}
	
	@Override
	public void insertApply(int accountId, int concertId) {
		photoBoardDao.insertApply(accountId,concertId);
	}
	
	@Override
	public List<AccountDTO> getApplicants(int concertId) {
		List<AccountDTO> applicants = accountDao.getApplicants(concertId);
		for(int i=0; i<applicants.size(); i++) {
			AccountDTO dto = applicants.get(i);
			int accountId = dto.getId();
			dto.setInstruments((ArrayList<InstrumentDTO>) accountDao.getAccountInstrument(accountId));
			dto.setTags((ArrayList<TagDTO>) accountDao.getAccountTag(accountId));
		}
		return applicants;
	}
	
	@Override
	public void deleteConcert(int concertId) {
		photoBoardDao.deleteConcert(concertId);
	}
	
}
