package com.board.service;

import java.util.List;

import com.board.dto.boardVO;

public interface boardService {
	public void boardInsert(boardVO vo) throws Exception;
	public boardVO boardView(int cs_id) throws Exception;
	public void boardUpdate(boardVO vo) throws Exception;
	public void boardDelete(int cs_id) throws Exception;
	public List<boardVO> boardList() throws Exception;
}
