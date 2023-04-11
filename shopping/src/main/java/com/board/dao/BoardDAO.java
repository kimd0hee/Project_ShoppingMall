package com.board.dao;

import java.util.List;

import com.board.dto.BoardVO;

public interface BoardDAO {
	
	public void insertBoard(BoardVO vo) throws Exception;


	public BoardVO viewBoard(int board_id) throws Exception;

	
	public void updateBoard(BoardVO vo) throws Exception;
	

	public void deleteBoard(int board_id) throws Exception;

	
	public List<BoardVO> boardList() throws Exception;
}
