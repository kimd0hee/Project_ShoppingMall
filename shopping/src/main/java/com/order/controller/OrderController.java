package com.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.product.dto.ProductVO;
import com.product.service.ProductService;
import com.user.dto.UserVO;
import com.user.service.UserService;

@Controller
public class OrderController {
	@RequestMapping(value = "/insert", method= RequestMethod.POST)
	public String orderInsert(ProductVO productVO, HttpSession session, Model model,
			@ModelAttribute("selected_opt") String selected_opt, @ModelAttribute("order_con")String order_con) {
		
		UserVO vo = (UserVO) session.getAttribute("login");
		vo = UserService.read(vo.getUser_id());
		productVO = ProductService.read(productVO.getProduct_id());
		
		model.addAttribute("userInfo", vo);
		model.addAttribute("productInfo", productVO);
		model.addAttribute("order_con", order_con);
		model.addAttribute("selected_opt", selected_opt);
		
		return "order/orderconfirm";
		
	}
}
