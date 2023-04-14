package com.order.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.order.dto.OrderVO;

public class OrderDAOImpl {
	
	private static final String NS = null;
	
	@Inject
	SqlSession sqlsession;
	
	String nameSpace = "order";
	
	@Autowired
	public void insert(OrderVO orderVO) {
		
		int order_num = sqlsession.selectOne(NS+".countOrderId");
		orderVO.setOrder_num(order_num);
		
		sqlsession.insert(NS+".insert", orderVO);
	}

}
