package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;
import com.board.dto.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;

	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		
		String board_title = vo.getBoard_title();
		String board_content = vo.getBoard_content();
		String board_writer = vo.getBoard_writer();
		
		board_title = board_title.replace("<", "&lt;");
		board_title = board_title.replace("<", "&gt;");
		board_writer = board_writer.replace("<", "&lt");
		board_writer = board_writer.replace("<", "&gt");
		
		board_title = board_title.replace(" ", "&nbsp;&nbsp;");
		board_writer = board_writer.replace(" ", "&nbsp;&nbsp;");
		
		board_content = board_content.replace("\n", "<br>");
		
		vo.setBoard_title(board_title);
		vo.setBoard_content(board_content);
		vo.setBoard_writer(board_writer);
		
		dao.insertBoard(vo);
	}

	@Override
	public BoardVO viewBoard(int board_id) throws Exception {
		return dao.viewBoard(board_id);
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		dao.updateBoard(vo);
	}

	@Override
	public void deleteBoard(int board_id) throws Exception {
		dao.deleteBoard(board_id);
	}

	@Override
	public List<BoardVO> boardList() throws Exception {
		return dao.boardList();

	}


}
