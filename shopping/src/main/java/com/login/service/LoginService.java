package com.login.service;

import javax.servlet.http.HttpSession;

import com.user.dto.UserVO;

public interface LoginService {

	public boolean loginCheck(UserVO vo, HttpSession session);

	public UserVO viewUser(UserVO vo);
<<<<<<< HEAD
	
	public void logoutUser(HttpSession session);
=======

	public void logout(HttpSession session);
>>>>>>> branch 'N.D.O' of https://github.com/kimd0hee/Project_ShoppingMall.git
}
