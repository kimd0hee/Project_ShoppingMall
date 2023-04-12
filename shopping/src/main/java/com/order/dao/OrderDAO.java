package com.order.dao;

import java.util.List;

import com.order.dto.OrderVO;

public interface OrderDAO {
	
	public List<OrderVO> OrderList() throws Exception;

	public static void insert(OrderVO orderVO) {
		// TODO Auto-generated method stub
		
	}
}