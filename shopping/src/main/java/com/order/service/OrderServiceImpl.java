package com.order.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.order.dao.OrderDAO;
import com.order.dto.OrderVO;


public class OrderServiceImpl {
	@Autowired
	public void insert(OrderVO orderVO) throws Exception {
		OrderDAO.insert(orderVO);
	}
}
