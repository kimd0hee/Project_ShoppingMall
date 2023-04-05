package com.shop.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertCart(CartVO vo) {
		sqlSession.insertCart("cart.insertCart",vo);
	}
	
	@Override
	public List<CartVO> cartList(String userId){
		return sqlSession.selectList("cart.cartList",userId);
	}
	
	@Override
	public void deleteCart(int cartId) {
		sqlSession.deleteCart("cart.deleteCart",cartId);
	}
	
	@Override
	public void modifyCart(CartVO vo) {
		sqlSession.updateCart("cart.modifyCart",vo);
	}
	
	@Override
	public int sumMoneyCart(String userId) {
		sqlSession.selectOne("cart.sumMoneyCart",userId);
		return sqlSession.selectOne("cart.sumMoneyCart",userId);
	}
	
	@Override
	public int countCart(int productId, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productId", productId);
		map.put("userId", userId);
		return sqlSession.selectOne("cart.countCart", map);
	}
	
	@Override
	public void updateCart(CartVO vo) {
		 //sqlSession.update("cart.sumCart",vo);
	}
}