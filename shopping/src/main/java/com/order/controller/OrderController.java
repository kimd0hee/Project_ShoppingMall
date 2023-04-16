package com.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
import com.order.dto.OrderVO;
import com.order.service.OrderService;

@Controller
@RequestMapping("/")
public class OrderController {
    
    @Inject
    private OrderService orderService;
    
    @RequestMapping("orderList.do")
    public ModelAndView orderList() throws Exception {
        List<OrderVO> orderList = orderService.orderList();
        ModelAndView mav = new ModelAndView("orderList");
        mav.addObject("orderList", orderList);
        return mav;
    }
    
	@RequestMapping(value="orderWrite.do",method=RequestMethod.GET)
	public String orderWrite() {
		return "orderWrite";
	}
    
	@RequestMapping(value = "orderInsert.do", method = RequestMethod.POST)
    public String orderInsert(@ModelAttribute("order") OrderVO orderVO, HttpServletRequest request) throws Exception {
		System.out.println("실행");
        // 세션에서 장바구니 정보 가져오기
        HttpSession session = request.getSession();
        List<CartVO> cartList = (List<CartVO>) session.getAttribute("cartList");
        Map<String, Object> cartMap = new HashMap<String, Object>();
        cartMap.put("cartList", cartList);

        // 주문자 정보 저장
        orderVO.setOrder_id((int) session.getAttribute("userId")); // 세션에서 아이디 가져오기
        orderService.insertOrder(orderVO, cartMap);

        // 세션에서 장바구니 정보 제거
        session.removeAttribute("cartList");

        return "redirect:/orderDetail.do";
    }
	
	@RequestMapping("orderDetail{order_id}")
	public ModelAndView detail(@PathVariable("order_id") int order_id, ModelAndView mav) throws Exception {
	   mav.setViewName("/orderDetail");
	   mav.addObject("vo", orderService.orderDetail(order_id));
	   return mav;
	}

    
    @PostMapping("orderUpdate/{order_id}")
    public String orderUpdate(OrderVO vo) throws Exception {
        orderService.updateOrder(vo);
        return "redirect:/orderList";
    }
    
    @PostMapping("orderDelete/{order_id}")
    public String orderDelete(@PathVariable int order_id) throws Exception {
        orderService.deleteOrder(order_id);
        return "redirect:/orderList";
    }
}