package com.user.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.user.dto.UserVO;
import com.user.service.UserService;

@Controller
public class UserController {
	@Inject
	UserService userService;

	@RequestMapping("userList.do")
	public String userList(Model model) {

		List<UserVO> list = userService.userList();
		model.addAttribute("list", list);

		return "userList";
	}
	
	@RequestMapping(value="userWrite.do", produces="text/plain;charset=UTF-8")
	public String writeUser() {

		return "userWrite";
	}


	@RequestMapping(value="updateUser.do", produces="text/plain;charset=UTF-8")
	public String userUpdate(@ModelAttribute UserVO vo, Model model) {

		boolean result = userService.checkPw(vo.getUser_id(), vo.getUser_pw());

		if(result) {
			userService.updateUser(vo);

			return "redirect:/userList.do";

		}else {
			UserVO uVo = userService.viewUser(vo.getUser_id());

			vo.setUser_joindate(uVo.getUser_joindate());
			vo.setUser_update(uVo.getUser_update());

			model.addAttribute("dto", vo);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");

			return "userView";
		}
	}
	
	@RequestMapping("deleteUser.do")
	public String deleteUser(@RequestParam String user_id, @RequestParam String user_pw, Model model) {
		
		boolean result = userService.checkPw(user_id, user_pw);

		if(result) {
			userService.deleteUser(user_id);

			return "redirect:/userList.do";

		}else {
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("dto", userService.viewUser(user_id));

			return "userView";
		}
	}
	
	@RequestMapping("userInsert.do")
	public String insertUser(@ModelAttribute UserVO vo, Model model) {
		

		return "login";

}
}
