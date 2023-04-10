package com.admin.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.user.dto.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public String adminLoginCheck(UserVO vo) {
		return sqlSession.selectOne("admin.LoginCheck", vo);
	}

}
