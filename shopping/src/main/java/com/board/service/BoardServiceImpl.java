package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.board.dao.BoardDAO;
import com.board.dto.BoardVO;

@Repository
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;
	
	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		String cs_title = vo.getCs_title();
		String cs_context = vo.getCs_context();
		String cs_writer = vo.getCs_writer();
		
		cs_title = cs_title.replace("<", "&lt;");
		cs_title = cs_title.replace("<", "&gt;");
		cs_writer = cs_writer.replace("<", "&lt");
		cs_writer = cs_writer.replace("<", "&gt");
		
		cs_title = cs_title.replace(" ", "&nbsp;&nbsp;");
		cs_writer = cs_writer.replace(" ", "&nbsp;&nbsp;");
		
		cs_context = cs_context.replace("\n", "<br>");
		vo.setCs_title(cs_title);
		vo.setCs_context(cs_context);
		vo.setCs_writer(cs_writer);
		dao.insertBoard(vo);
	}

	@Override
	public BoardVO viewBoard(int cs_id) throws Exception {
		return dao.viewBoard(cs_id);
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		dao.updateBoard(vo);
	}

	@Override
	public void deleteBoard(int cs_id) throws Exception {
		dao.deleteBoard(cs_id);
	}

	@Override
	public List<BoardVO> boardList() throws Exception {
		return dao.boardList();
		
	}


}
