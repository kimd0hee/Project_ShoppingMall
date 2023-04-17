package com.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cart.dto.CartVO;
import com.product.dto.ProductVO;
import com.cart.service.CartService;
import com.order.dto.OrderVO;
import com.order.service.OrderService;
import com.user.dto.UserVO;

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
    
	
	@RequestMapping("orderDetail{order_id}")
	public ModelAndView detail(@PathVariable("order_id") int order_id, ModelAndView mav) throws Exception {
	   mav.setViewName("/orderDetail");
	   mav.addObject("vo", orderService.orderDetail(order_id));
	   return mav;
	}

    // 주문 처리
    @RequestMapping(value = "orderInsert.do", method = RequestMethod.POST)
    public String orderInsert(@ModelAttribute OrderVO vo, HttpSession session) throws Exception {

    	String user_id = (String) session.getAttribute("user_id");
    	vo.setUser_id(user_id);
    	
    	orderService.insertOrder(vo);
    	System.out.println(vo);
		return null;

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