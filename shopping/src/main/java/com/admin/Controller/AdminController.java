package com.admin.Controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shop.dto.shoppingmallVO;


@Controller
@RequestMapping("admin/*")
public class AdminController {
   
   @Inject
   AdminService adminService;
   
   @RequestMapping("login.do")
   public String login() {
      return "admin/adminLogin";
   }
   
   @RequestMapping("loginCheck.do")
   public ModelAndView loginCheck(HttpSession session, shoppingmallVO vo , ModelAndView mav) {
      String name = adminService.loginCheck(vo);
      
      if(name != null) {
         session.setAttribute("adminId", vo.getUserId());
         session.setAttribute("userId", vo.getUserId());
         session.setAttribute("adminName", name);
         session.setAttribute("userName", name);
         mav.setViewName("admin/adminHome");
         mav.addObject("msg", "success");   
      }else {
         mav.setViewName("admin/adminLogin");
         mav.addObject("msg", "failure");
      }
      return mav;
   }
   
   @RequestMapping("logout.do")
   public ModelAndView logout(HttpSession session) {
      session.invalidate();
      ModelAndView mav = new ModelAndView();
      mav.setViewName("admin/adminLogin");
      mav.addObject("msg", "logout");
      return mav;
   }
}
