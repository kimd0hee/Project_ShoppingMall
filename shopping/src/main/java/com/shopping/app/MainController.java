package com.shopping.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	//메인 page 연결
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		return "main";
	}

	//로그인 page 연결
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout() {
		return "logout";
	}

	//회원관리 page 연결
	@RequestMapping(value = "userList", method = RequestMethod.GET)
	public String userList(Model model) {
		return "userList";
	}
	@RequestMapping(value = "userView", method = RequestMethod.GET)
	public String userView(Model model) {
		return "userView";
	}
	@RequestMapping(value = "userInsert", method = RequestMethod.GET)
	public String userInsert(Model model) {
		return "userWrite";
	}

	//cs page 연결
	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(Model model) {
		return "boardList";
	}
	@RequestMapping(value = "boardView", method = RequestMethod.GET)
	public String boardView(Model model) {
		return "boardView";
	}
	@RequestMapping(value = "boardInsert", method = RequestMethod.GET)
	public String boardInsert(Model model) {
		return "boardWrite";
	}

	//product page 연결
	@RequestMapping(value = "productList", method = RequestMethod.GET)
	public String productList(Model model) {
		return "productList";
	}

	//cart page 연결
	@RequestMapping(value = "cartList", method = RequestMethod.GET)
	public String cartList(Model model) {
		return "cartList";
	}
	
	//orderList
		@RequestMapping(value = "orderList", method = RequestMethod.GET)
		public String orderList(Model model) {
			return "orderList";
		}
		
	//orderWrite
		@RequestMapping(value = "orderWrite", method = RequestMethod.GET)
		public String orderWrite(Model model) {
			return "orderWrite";
		}	
		
	//orderDetail
		@RequestMapping(value = "orderDetail", method = RequestMethod.GET)
		public String orderDetail(Model model) {
			return "orderDetail";
		}

}
