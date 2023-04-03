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
	
}


