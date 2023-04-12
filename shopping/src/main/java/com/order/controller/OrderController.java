package com.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.order.dto.OrderVO;
import com.order.service.OrderService;
import com.product.dto.ProductVO;
import com.product.service.ProductService;
import com.user.dto.UserVO;
import com.user.service.UserService;

@Controller
public class OrderController {
	@RequestMapping(value = "/insert", method= RequestMethod.POST)
	public String orderInsert(ProductVO productVO, HttpSession session, Model model,
			@ModelAttribute("product_opt") String product_opt, @ModelAttribute("order_con")String order_con) {
		
		UserVO vo = (UserVO) session.getAttribute("login");
		vo = UserService.read(vo.getUser_id());
		productVO = ProductService.read(productVO.getProduct_id());
		
		model.addAttribute("userInfo", vo);
		model.addAttribute("productInfo", productVO);
		model.addAttribute("order_con", order_con); //배송상태
		model.addAttribute("product_opt", product_opt); //제품 옵션 
		
		return "order/orderconfirm";
		
	}
	
	@RequestMapping(value = "/orderResult", method = RequestMethod.POST)
	public String order(ProductVO productVO, UserVO vo, Model model,
			@ModelAttribute("product_opt") String product_opt, 
			@ModelAttribute("order_con") String order_con,
			@ModelAttribute("order_message") String order_message,
			@ModelAttribute("total_amount") String totalamount,
			@ModelAttribute("detailAddress") String detailAddress) {
		
		OrderVO orderVO = new OrderVO();
	
		productVO = ProductService.read(productVO.getProduct_id());
		
		orderVO.setUser_idx(vo.getUser_idx());
		orderVO.setUser_id(vo.getUser_id());
		orderVO.setUser_address1(vo.getUser_address1() + " " + detailAddress);
		orderVO.setUser_address2(vo.getUser_address2() + " " + detailAddress);
		orderVO.setUser_address3(vo.getUser_address3() + " " + detailAddress);
		orderVO.setEmail(vo.getUser_email());
		orderVO.setUser_phone(vo.getUser_phone());
		orderVO.setPostcode(vo.getPostcode());
		
		
		orderVO.setProduct_id(productVO.getProduct_id());
		orderVO.setProduct_name(productVO.getProduct_name());
		orderVO.setProduct_price(productVO.getProduct_price());
		orderVO.setProduct_desc(productVO.getProduct_desc());
		orderVO.setProduct_info(productVO.getProduct_info());
		
		orderVO.setProduct_opt(product_opt);
		orderVO.setOrder_con(order_con);
		orderVO.setOrder_message(order_message);
		
		int total_amount = Integer.parseInt(totalamount);
		orderVO.setTotal_amount(total_amount);

		
		OrderService.insert(orderVO);
		model.addAttribute("order", orderVO);
	
		return "order/orderResult";

	}

}
