package com.cart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cart.dao.CartDAO;
import com.cart.dto.CartVO;

@Service
public class CartServiceImpl implements CartService {
<<<<<<< HEAD
	
	@Inject
	CartDAO cartDao;
	
	//1. 장바구니 추가
	@Override
	public void insertCart(CartVO vo) {
		cartDao.insertCart(vo);
	}
	
	//2. 장바구니 목록
	@Override
	public List<CartVO> cartList(String user_id){
		System.out.println(user_id);
		return cartDao.cartList(user_id);
	}
	//3. 장바구니 삭제
	@Override
	public void deleteCart(int cart_id) {
		cartDao.deleteCart(cart_id);
	}
	//4. 장바구니 수정
	@Override
	public void modifyCart(CartVO vo) {
		cartDao.modifyCart(vo);
	}
	//5. 자아바구니 금액 합계
	@Override
	public int sumMoneyCart(String user_id) {
		return cartDao.sumMoneyCart(user_id);
	}
	//6. 장바구니 상품 확인
	@Override
	public int countCart(int product_id, String user_id)                                                                               {
		return cartDao.countCart(product_id, user_id);
	}
	// 7. 장바구니 상품 수량 변경
	@Override
	public void updateCart(CartVO vo) {
		cartDao.updateCart(vo);
	}
=======
   
   @Inject
   CartDAO cartDao;
   
   //1. 장바구니 추가
   @Override
   public void insertCart(CartVO vo) {
      cartDao.insertCart(vo);
   }
   
   //2. 장바구니 목록
   @Override
   public List<CartVO> cartList(String user_id){
      System.out.println(user_id);
      return cartDao.cartList(user_id);
   }
   //3. 장바구니 삭제
   @Override
   public void deleteCart(int cart_id) {
      cartDao.deleteCart(cart_id);
   }
   //4. 장바구니 수정
   @Override
   public void modifyCart(CartVO vo) {
      cartDao.modifyCart(vo);
   }
   //5. 자아바구니 금액 합계
   @Override
   public int sumMoneyCart(String userId) {
      return cartDao.sumMoneyCart(userId);
   }
   //6. 장바구니 상품 확인
   @Override
   public int countCart(int product_id, String user_id)                                                                               {
      return cartDao.countCart(product_id, user_id);
   }
   // 7. 장바구니 상품 수량 변경
   @Override
   public void updateCart(CartVO vo) {
      cartDao.updateCart(vo);
   }
>>>>>>> branch 'S.S.M' of https://github.com/kimd0hee/Project_ShoppingMall.git

}