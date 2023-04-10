package com.admin.service;

import com.user.dto.UserVO;

public interface AdminService {
	//관리자 체크
	public String adminLoginCheck(UserVO vo);
}
