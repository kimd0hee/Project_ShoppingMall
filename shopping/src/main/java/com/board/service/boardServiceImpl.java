package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.board.dao.boardDAO;
import com.board.dto.boardVO;

@Repository
public class boardServiceImpl implements boardService {

	@Inject
	boardDAO boardDao;
	
	@Override
	public void boardInsert(boardVO vo) throws Exception {
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
		boardDao.boardInsert(vo);
	}

	@Override
	public boardVO boardView(int cs_id) throws Exception {
		return boardDao.boardView(cs_id);
	}

	@Override
	public void boardUpdate(boardVO vo) throws Exception {
		boardDao.boardUpdate(vo);
	}

	@Override
	public void boardDelete(int cs_id) throws Exception {
		boardDao.boardDelete(cs_id);
	}

	@Override
	public List<boardVO> boardList() throws Exception {
		return boardDao.boardList();
		
	}


}
