package com.shop.service;

import java.util.List;

import com.shop.dto.CartVO;

public interface CartService {
	
	public void insertCart(CartVO vo) throws Exception;
	
	public List<CartVO> cartList(String userId) throws Exception;
	
	public void deleteCart(int cartId) throws Exception;
	
	public void modifyCart(CartVO vo) throws Exception;
	
	public int sumMoneyCart(String userId) throws Exception;
	
	public int countCart(int productId, String userId) throws Exception;
	
	public void updateCart(CartVO vo) throws Exception;
}