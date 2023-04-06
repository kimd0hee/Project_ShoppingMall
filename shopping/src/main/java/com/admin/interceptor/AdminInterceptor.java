package com.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
   // 요청 전 처리
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
         Object handler) throws Exception {
      HttpSession session= request.getSession();
      
      if(session.getAttribute("admin_id") == null) {
         response.sendRedirect(request.getContextPath()+"login.do? msg=nologin");
         return false;
      }else {
         return true;
      }
   }
   //요청 처리 후
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
          ModelAndView modelAndView) throws Exception {
      super.postHandle(request, response, handler, modelAndView);
   }
}