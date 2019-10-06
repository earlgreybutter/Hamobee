package com.ceramicduck.angryduck.service.photo_board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ceramicduck.angryduck.model.dao.PhotoBoardDAO;
import com.ceramicduck.angryduck.model.dto.PhotoBoardDTO;

@Service
public class PhotoBoardServiceImpl implements PhotoBoardService {
	
	@Inject
	PhotoBoardDAO photoBoardDao;

	@Override
	public List<PhotoBoardDTO> listAll(int start, int end, String search_option, String keyword) {
		// TODO Auto-generated method stub
		return photoBoardDao.listAll(start,end,search_option,keyword);
	}
}
