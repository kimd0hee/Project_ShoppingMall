package com.user.service;

import java.util.List;


import com.user.dto.UserVO;

public interface UserService {
	//회원 리스트
	public List<UserVO> userList();
	//회원가입, 등록
	public void userInsert(UserVO vo);
	//회원정보 상세
	public UserVO viewUser(String user_id);
	//회원정보 수정
	public void updateUser(UserVO vo);
	//회원 삭제
	public void deleteUser(String user_id);
	//삭제 및 수정 시 비밀번호 체크
	public boolean checkPw(String user_id, String user_pw);
	//어드민 관리자 체크
<<<<<<< HEAD
	public String loginCheck(UserVO vo);
=======
	public String loginCheck(UserVO vo);	
>>>>>>> branch 'S.S.M' of https://github.com/kimd0hee/Project_ShoppingMall.git
}
