package com.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.user.dto.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	SqlSession sqlSession;
	
	String nameSpace = "user";
	
	@Override
	public List<UserVO> userList() {
		
		return sqlSession.selectList(nameSpace+".userList");
	}

	@Override
	public void userInsert(UserVO vo) {
		
		sqlSession.insert(nameSpace+".insertUser", vo);
	}

	@Override
	public UserVO viewUser(String user_id) {

		return sqlSession.selectOne(nameSpace+".viewUser", user_id);
		
	}

	@Override
	public void updateUser(UserVO vo) {

		sqlSession.update(nameSpace+".updateUser", vo);

	}

	@Override
	public void deleteUser(String user_id) {
		
		sqlSession.delete(nameSpace+".deleteUser", user_id);

	}

	@Override
	public boolean checkPw(String user_id, String user_pw) {
		
		boolean result = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id",user_id);
		map.put("user_pw",user_pw);
		
		int count = sqlSession.selectOne(nameSpace+".checkPw", map);
		
		if(count==1) result=true;
		
		return result;
	}

}
