package com.board.dao;

import java.util.List;

import com.board.dto.boardVO;

public interface boardDAO {
	public void boardInsert(boardVO vo) throws Exception;
	public boardVO boardView(int cs_id) throws Exception;
	public void boardUpdate(boardVO vo) throws Exception;
	public void boardDelete(int cs_id) throws Exception;
	public List<boardVO> boardList() throws Exception;
}
