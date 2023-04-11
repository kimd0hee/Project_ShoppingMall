package com.product.controller;


import java.io.File;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.product.dto.ProductVO;
import com.product.service.ProductService;

@Controller
public class ProductController {

   @Inject
   ProductService service;
   @Value("#{uploadPath}")
   private String uploadPath;



   @RequestMapping("productList.do")
   public ModelAndView list(ModelAndView mav) {
      mav.setViewName("/productList");
      mav.addObject("list", service.productList());
      return mav;
   }

   @RequestMapping("productDetail/{product_id}")
   public ModelAndView detail(@PathVariable("product_id") int product_id, ModelAndView mav) {
      mav.setViewName("/productDetail");
      mav.addObject("vo", service.detailProduct(product_id));
      return mav;
   }

   @RequestMapping("productWrite.do")
   public String write() {
      return "productWrite";
   }

   
   @RequestMapping(value="productInsert.do", method=RequestMethod.POST)
   public String insert(ProductVO vo , MultipartFile product_photo) {

   
	  System.out.println("a");
      String filename = "";
//
      if(product_photo != null && !product_photo.isEmpty()) {
         filename = product_photo.getOriginalFilename();

         System.out.println("상품 인서트 예외처리 전");
         try {
            new File(uploadPath).mkdirs();
            product_photo.transferTo(new File(uploadPath+filename));
         }catch(Exception e) {
            e.printStackTrace();
         }
         
         vo.setProduct_url(filename);
         System.out.println("상품 인서트 예외처리 후");
      }
      System.out.println(vo);
      service.insertProduct(vo);

      return "redirect:/productList.do";
   }

   @RequestMapping("productEdit{product_id}")
   public ModelAndView edit(@PathVariable("product_id") int product_id, ModelAndView mav) {
      mav.setViewName("/productEdit");
      mav.addObject("vo", service.detailProduct(product_id));
      return mav;
   }

   @RequestMapping("productUpdate.do")
   public String update(ProductVO vo, MultipartFile product_photo) {
      String filename = "";


      if(!product_photo.isEmpty()) {
    	  
         filename = product_photo.getOriginalFilename();

         try {
            new File(uploadPath).mkdirs();
            
         }catch(Exception e) {
            e.printStackTrace();
         }
         
         vo.setProduct_url(filename);
         
      }else {
    	  
         ProductVO vo2 = service.detailProduct(vo.getProduct_id());
         vo.setProduct_url(vo2.getProduct_url());
      }
      service.updateProduct(vo);
      return "redirect:/productList.do";
   }

   @RequestMapping("productDelete.do")
   public String delete(@RequestParam int product_id) {
     String filename = service.fileInfo(product_id);
     System.out.println("상품 삭제 컨트롤러 작동");
      if(filename != null) {
         File file = new File(uploadPath+filename);
         System.out.println(filename);
         if(file.exists()) {
            file.delete();
         }
      }

      service.deleteProduct(product_id);
      return "redirct:/productList.do";
   }
}
