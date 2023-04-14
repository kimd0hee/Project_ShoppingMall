package com.order.service;

import com.order.dao.OrderDAO;
import com.order.dto.OrderVO;

public class OrderServiceImpl {
	public void insert(OrderVO orderVO){
		OrderDAO.insert(orderVO);
	}
}
