package com.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.dto.AdminVO;
import com.admin.service.AdminService;


@Controller
@RequestMapping("/*")
public class AdminController {

   @Inject
   AdminService service;

   @RequestMapping("adminLogin.do")
   public String login() {
	   
      return "adminLogin";
   }

   @RequestMapping("adminLoginCheck.do")
   public ModelAndView loginCheck(HttpSession session, AdminVO vo , ModelAndView mav) {
	   
      String name = service.adminLoginCheck(vo);

      if(name != null) {
<<<<<<< HEAD
         session.setAttribute("admin_id", vo.getUser_id());
         //session.setAttribute("user_id", vo.getUser_id()); , admin VO 새로 생성
=======
         session.setAttribute("admin_id", vo.getAdmin_id());
>>>>>>> branch 'K.D.H' of https://github.com/kimd0hee/Project_ShoppingMall.git
         session.setAttribute("admin_name", name);
<<<<<<< HEAD
         //session.setAttribute("user_name", name);
=======
>>>>>>> branch 'K.D.H' of https://github.com/kimd0hee/Project_ShoppingMall.git
         mav.setViewName("adminHome");
         mav.addObject("msg", "success");
         
      }else {
         mav.setViewName("adminLogin");
         mav.addObject("msg", "failure");
      }
      return mav;
   }

   @RequestMapping("adminLogout.do")
   public ModelAndView logout(HttpSession session) {
      session.invalidate();
      ModelAndView mav = new ModelAndView();
      mav.setViewName("adminLogin");
      mav.addObject("msg", "logout");
      return mav;
   }
}