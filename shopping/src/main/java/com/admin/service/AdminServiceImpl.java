package com.admin.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.admin.dao.AdminDAO;
import com.user.dto.UserVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO dao;

	@Override
	public String adminLoginCheck(UserVO vo) {
		return dao.adminLoginCheck(vo);
	}

}
