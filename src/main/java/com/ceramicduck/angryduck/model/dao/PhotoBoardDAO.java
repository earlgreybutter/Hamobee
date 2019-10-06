package com.ceramicduck.angryduck.model.dao;

import java.util.List;

import com.ceramicduck.angryduck.model.dto.PhotoBoardDTO;

public interface PhotoBoardDAO {
	public List<PhotoBoardDTO> listAll(int start, int end,
			String search_option, String keyword);
			
}
