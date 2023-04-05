package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.dao.CartDAO;
import com.shop.dto.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Inject
	CartDAO dao;
	
	@Override
	public void insertCart(CartVO vo) {
		dao.insertCart(vo);
	}
	
	@Override
	public List<CartVO> cartList(String userId){
		System.out.println(userId);
		return dao.cartList(userId);
	}

	@Override
	public void deleteCart(int cartId) {
		dao.deleteCart(cartId);
	}
	
	@Override
	public void modifyCart(CartVO vo) {
		dao.modifyCart(vo);
	}

	@Override
	public int sumMoneyCart(String userId) {
		return dao.sumMoneyCart(userId);
	}

	@Override
	public int countCart(int productId, String userId)                                                                               {
		return dao.countCart(productId, userId);
	}
	
	@Override
	public void updateCart(CartVO vo) {
		dao.updateCart(vo);
	}

}