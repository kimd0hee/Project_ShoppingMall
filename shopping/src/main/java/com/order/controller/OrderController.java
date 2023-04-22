package com.order.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cart.dto.CartVO;
import com.cart.service.CartService;
import com.order.dto.OrderVO;
import com.order.service.OrderService;

@Controller
@RequestMapping("/")
public class OrderController {
    
    @Inject
    private OrderService orderService;
    
    @Inject
    private CartService cartService;

    
    @RequestMapping("orderList.do")
    public ModelAndView orderList() throws Exception {
        List<OrderVO> orderList = orderService.orderList();
        ModelAndView mav = new ModelAndView("orderList");
        mav.addObject("orderList", orderList);
        return mav;
    }
    
	@RequestMapping(value="orderWrite.do",method=RequestMethod.GET)
	public ModelAndView orderWrite(HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
        String user_id = (String) session.getAttribute("user_id");
        
        List<CartVO> cartList = cartService.cartList(user_id);
        
        mav.addObject("cartList", cartList);
        mav.setViewName("orderWrite");
        
        return mav;
	}
    
	
	@RequestMapping("orderDetail.do")
	public ModelAndView detail(@RequestParam("order_id") int order_id, ModelAndView mav) throws Exception {
	   mav.setViewName("orderDetail");
	   mav.addObject("vo", orderService.orderDetail(order_id));
	   return mav;
	}

	// 주문 처리
	@RequestMapping(value = "orderInsert.do", method = RequestMethod.POST)
	public String orderInsert(@ModelAttribute OrderVO vo, HttpSession session) throws Exception {
	    String user_id = (String) session.getAttribute("user_id");
	    vo.setUser_id(user_id);
	    
	    System.out.println(user_id);
	    
	    //int cart_id = (int) session.getAttribute("cart_id");
	    //vo.setCart_id(cart_id);
	    

	    //System.out.println(cart_id);
	    
	    // 장바구니에서 선택한 상품 정보 가져오기
	    List<CartVO> cartList = cartService.cartList(user_id);
	    
	    System.out.println(vo);
	    
	    // 주문 정보 저장
	    orderService.insertOrder(vo);
	    
		// 장바구니에서 주문한 상품들 제거
	    //cartService.deleteCart(cart_id);

	    
	    return "redirect:/orderList.do";
	}
		
	
	@RequestMapping("orderUpdate.do")
	public String orderUpdate(@ModelAttribute OrderVO vo, Model model) throws Exception {
			orderService.updateOrder(vo);
			return "redirect:/orderList.do";
	}
    
    @PostMapping("orderDelete.do")
    public String orderDelete(@PathVariable int order_id) throws Exception {
        orderService.deleteOrder(order_id);
        return "redirect:/orderList.do";
    }
}