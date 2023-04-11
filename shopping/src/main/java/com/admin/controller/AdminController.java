package com.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.service.AdminService;
import com.user.dto.UserVO;


@Controller
public class AdminController {

   @Inject
   AdminService service;

   @RequestMapping("adminLogin.do")
   public String login() {
      return "adminLogin";
   }

   @RequestMapping("adminLoginCheck.do")
   public ModelAndView loginCheck(HttpSession session, UserVO vo , ModelAndView mav) {
      String name = service.adminLoginCheck(vo);

      if(name != null) {
         session.setAttribute("admin_id", vo.getUser_id());
         //session.setAttribute("user_id", vo.getUser_id()); , admin VO 새로 생성
         session.setAttribute("admin_name", name);
         //session.setAttribute("user_name", name);
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