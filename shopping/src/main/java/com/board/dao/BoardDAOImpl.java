package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.dto.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlSession;
	
	String nameSpace = "board";
	
	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		sqlSession.insert(nameSpace+".boardInsert", vo);
	}

	@Override
	public BoardVO viewBoard(int board_id) throws Exception {
		return sqlSession.selectOne(nameSpace+".boardView", board_id);
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		sqlSession.update(nameSpace+".boardUpdate", vo);
	}

	@Override
	public void deleteBoard(int board_id) throws Exception {
		sqlSession.delete(nameSpace+".boardDelete", board_id);
	}

	@Override
	public List<BoardVO> boardList() throws Exception {
		return sqlSession.selectList(nameSpace+".boardList");
	}

}
