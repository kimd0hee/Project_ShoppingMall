package com.shop.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.dao.AdminDAO;
import com.shop.dto.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAO dao;
	
	@Override
	public String loginCheck(MemberVO vo) {
		return dao.loginCheck(vo);
	}
}