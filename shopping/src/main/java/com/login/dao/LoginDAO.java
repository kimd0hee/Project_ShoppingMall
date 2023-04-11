package com.login.dao;

import javax.servlet.http.HttpSession;

import com.user.dto.UserVO;

public interface LoginDAO {

	public boolean loginCheck(UserVO vo);

	public UserVO viewUser(UserVO vo);
<<<<<<< HEAD
	
	public void logoutUser(HttpSession session);
=======

	public void logout(HttpSession session);
>>>>>>> branch 'N.D.O' of https://github.com/kimd0hee/Project_ShoppingMall.git

}
