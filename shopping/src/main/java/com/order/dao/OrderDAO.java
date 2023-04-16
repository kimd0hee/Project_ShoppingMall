package com.order.dao;

import java.util.List;
import java.util.Map;

import com.order.dto.OrderVO;

public interface OrderDAO {
    // 주문 정보 저장
	public void insertOrder(OrderVO vo, Map<String, Object> cartMap) throws Exception;
    
    // 회원의 주문 목록 조회
    public List<OrderVO> orderByUserId(String user_id) throws Exception;
    
    // 관리자용 주문 목록 조회
    public List<OrderVO> orderList() throws Exception;
    
    //주문상세조회
    public OrderVO orderDetail(int order_id);
    
    // 주문 정보 수정
    public void updateOrder(OrderVO vo) throws Exception;
    
    // 주문 정보 삭제
    public void deleteOrder(int order_id) throws Exception;
}
