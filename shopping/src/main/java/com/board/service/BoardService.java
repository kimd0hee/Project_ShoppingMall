package com.board.service;

import java.util.List;

import com.board.dto.BoardVO;

public interface BoardService {
	
	public void insertBoard(BoardVO vo) throws Exception;
	
<<<<<<< HEAD
	public BoardVO viewBoard(int cs_id) throws Exception;
=======
	public BoardVO viewBoard(int board_id) throws Exception;
>>>>>>> branch 'K.D.H' of https://github.com/kimd0hee/Project_ShoppingMall.git
	
	public void updateBoard(BoardVO vo) throws Exception;
	
<<<<<<< HEAD
	public void deleteBoard(int cs_id) throws Exception;
=======
	public void deleteBoard(int board_id) throws Exception;
>>>>>>> branch 'K.D.H' of https://github.com/kimd0hee/Project_ShoppingMall.git
	
	public List<BoardVO> boardList() throws Exception;
}
