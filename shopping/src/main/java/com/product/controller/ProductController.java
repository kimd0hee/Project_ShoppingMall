package com.product.controller;


import java.io.File;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.product.dto.ProductVO;
import com.product.service.ProductService;

@Controller
public class ProductController {

   @Inject
   ProductService service;
   @Resource(name="uploadPath")
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

   @RequestMapping("productInsert.do")
   public String insert(ProductVO vo, MultipartFile product_photo) {
      String filename = "";

      if(product_photo != null && !product_photo.isEmpty()) {
         filename = product_photo.getOriginalFilename();
         System.out.print(product_photo.getOriginalFilename());

         //임시 경로
         String path = "C:\\Users\\82107\\Desktop\\";
         //"C:\\Users\\newtec\\git\\Project_ShoppingMall" +".metadata\\.plugins\\org.eclipse.wst.server.core\\" +
         
         try {
            new File(path).mkdirs();
            product_photo.transferTo(new File(path+filename));
         }catch(Exception e) {
            e.printStackTrace();
         }
         vo.setProduct_url(filename);
      }

      service.insertProduct(vo);

      return "redirect:/productList.do";
   }

   @RequestMapping("productEdit/{product_id}")
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

         //임시 경로
         String path = "C:\\Users\\82107\\Desktop\\";
         //"C:\\Users\\newtec\\git\\Project_ShoppingMall" +".metadata\\.plugins\\org.eclipse.wst.server.core\\" +

         try {
            new File(path).mkdirs();
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
      //임시 경로
      String path = "C:\\Users\\82107\\Desktop\\";
      //"C:\\Users\\newtec\\git\\Project_ShoppingMall" +".metadata\\.plugins\\org.eclipse.wst.server.core\\" +

      if(filename != null) {
         File file = new File(path+filename);

         if(file.exists()) {
            file.delete();
         }
      }

      service.deleteProduct(product_id);
      return "redirct:/productList.do";
   }
}
