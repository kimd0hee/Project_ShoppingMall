package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.dto.boardVO;

@Repository
public class boardDAOImpl implements boardDAO {

	@Inject
	SqlSession SqlSession;
	
	@Override
	public void boardInsert(boardVO vo) throws Exception {
		SqlSession.insert("board.boardInsert",vo);
	}

	@Override
	public boardVO boardView(int cs_id) throws Exception {
		return SqlSession.selectOne("board.boardView",cs_id);
	}

	@Override
	public void boardUpdate(boardVO vo) throws Exception {
		SqlSession.update("board.boardUpdate",vo);
	}

	@Override
	public void boardDelete(int cs_id) throws Exception {
		SqlSession.delete("board.boardDelete",cs_id);
	}

	@Override
	public List<boardVO> boardList() throws Exception {
		return SqlSession.selectList("board.boardList");
	}

}
