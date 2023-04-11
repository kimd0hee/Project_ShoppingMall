package com.admin.dao;

import com.user.dto.UserVO;

public interface AdminDAO {
	//1. 관리자 체크
	public String adminLoginCheck(UserVO vo);
}
