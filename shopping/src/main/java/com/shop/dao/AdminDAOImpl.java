package com.shop.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject
	SqlSession sqlSession;
	
	//관리자 로그인체크
	@Override
	public String loginCheck(UserVO vo) {
		return sqlSession.selectOne("admin.loginCheck", vo);
	}
}
