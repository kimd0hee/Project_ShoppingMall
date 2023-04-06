package com.cart.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cart.dto.CartVO;
import com.cart.service.CartService;

@Controller
@RequestMapping("/cart/*")
public class CartController {

   @Inject
   CartService cartService;
   
   // 1. 장바구니 추가
   @RequestMapping("insert.do")
   public String insert(@ModelAttribute CartVO vo, HttpSession session) throws Exception {
      String user_id = (String) session.getAttribute("user_id");
      vo.setUser_id(user_id);
      
      //장바구네이 기존 상품이 있는지 검사
      int count = cartService.countCart(vo.getProduct_id(),user_id);
      if(count == 0) {
    	  // 없으면 insert
         cartService.insertCart(vo);
      }else {
    	  //있으면 update
         cartService.updateCart(vo);
      }
      return "redirect:/product/list.do";
   }
   //ModelAndView mav = new ModelAndView();
   //mav.setViewName("board/list); // 뷰를 list.jsp로 설정
   //mav.addObject("list", list); // 데이터를 저장
   //return mav; //list.jsp로 List가 전달된다.
   
   //2. 장바구니 목록
   @RequestMapping("list.do")
   public ModelAndView list(HttpSession session, ModelAndView mav) throws Exception {
      String user_id = (String) session.getAttribute("user_id"); //session에 저장된 userid
      
      Map<String, Object> map = new HashMap<String, Object>();
      List<CartVO> list = cartService.cartList(user_id); //장박누니 정보
      int sumMoney = cartService.sumMoneyCart(user_id); //장바구니 전체 금액 호출
      
      //장바구니 전체 금액에 따라 배송비 구분
      // 배송료(10만원이상 ==> 무료, 미만=> 2500원)
      int fee = sumMoney >= 100000 ? 0 : 2500;
      System.out.println(list.size());
      
      map.put("list", list); //장바구니 정보를 map에 저장
      map.put("count", list.size()); //장바구니 상품의 유무
      map.put("sumMoney", sumMoney); //장바구니 전체 금액
      map.put("fee", fee); //배송금액
      map.put("allSum", sumMoney+fee); //주문 상품 전체 금액
      
      mav.setViewName("product/cartList"); //view(jsp)의 이름 저장
      mav.addObject("map" , map); //map 변수 저장
      
      return mav;
   }
   
   // 3. 장바구니 삭제
   @RequestMapping("delete.do")
   public String delete(@RequestParam int cart_id) throws Exception {
      cartService.deleteCart(cart_id);
      return "redirect:/product/list.do";
   }
   //4. 장바구니 수정
   @RequestMapping("update.do")
   public String update(@RequestParam int[] cart_quantity, @RequestParam int[] product_id, HttpSession session) throws Exception {
      //session의 id
	   String user_id = (String) session.getAttribute("user_id");
      //레코드의 갯수만큼 반복문 실행
      
      for(int i=0; i<product_id.length; i++) {
         CartVO vo = new CartVO();
         vo.setUser_id(user_id);
         vo.setCart_quantity(cart_quantity[i]);
         vo.setProduct_id(product_id[i]);
         cartService.modifyCart(vo);
      }
      return "redirect:/product/list.do";
   }
}