package com.cart.Controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cart/*")
public class CartController {

   @Inject
   CartService cartServive;
   
   @RequestMapping("insert.do")
   public String insert(@ModelAttribute CartVO vo, HttpSession session) throws Exception {
      String userId = (String) session.getAttribute("userId");
      vo.setUserId(userId);
      
      int(count == 0) {
         cartService.insert(vo);
      }else {
         cartService.updateCart(vo);
      }
      return "redirect:/product/list.do";
   }
   
   @RequestMapping("list.do")
   public ModelAndView list(HttpSession session, ModelAndView mav) throws Exception {
      String userId = (String) session.getAttribute("userId");
      
      Map<String, Object> map = new HaspMap<String, Object>();
      List<CartVO> list = cartService.listCart(userId);
      int sumMoney = cartService.sumMoney(userId);
      int fee = sumMoney >= 100000 ? 0 : 2500;
      System.out.println(list.size());
      
      map.put("list", list);
      map.put("count", list.size());
      map.put("sumMoney", sumMoney);
      map.put("fee", fee);
      map.put("allSum", sumMoney+fee);
      
      mav.setViewName("product/cartList");
      mav.addObject("map" , map);
      
      return mav;
   }
   
   @RequestMapping("delete.do")
   public String delete(@RequestParam int cartId) throws Exception {
      cartService.delete(cartId);
      return "redirect:/product/list.do";
   }
   
   @RequestMapping("update.do")
   public String update(@RequestParam int[] amount, @RequestParam int[] productId, HttpSession session) throws Exception {
      String userId = (String) session.getAttribute("userId");
      
      for(int i=0; i<productId.length; i++) {
         CartVO vo = new CartVO();
         vo.setUserId(userId);
         vo.setAmount(amount[i]);
         vo.setProductId(productId[i]);
         cartService.modifyCart(vo);
      }
      return "redirect:/product/list.do";
   }
}