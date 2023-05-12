package com.product.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

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

   @RequestMapping("productDetail{product_id}")
   public ModelAndView detail(@PathVariable("product_id") int product_id, ModelAndView mav) {
      mav.setViewName("/productDetail");
      mav.addObject("vo", service.detailProduct(product_id));
      return mav;
   }

   @RequestMapping("productWrite.do")
   public String write() {
      return "productWrite";
   }


   @RequestMapping(value="insertProduct.do")
   public String insert(ProductVO vo, List<MultipartFile> product_photo) {

     if(!product_photo.isEmpty()) {
        String currentUrl="";
       for(int i=0;i<product_photo.size();i++) {
         String filename = product_photo.get(i).getOriginalFilename();
         System.out.print(product_photo.get(i).getOriginalFilename());
         
         String path = "C:\\Users\\son94\\Documents\\workspace-sts-3.9.18.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shopping\\resources\\img\\product\\";
         
         try {
           new File(path).mkdirs();
           product_photo.get(i).transferTo(new File(path+filename));
           if(i<product_photo.size()-1) {
           currentUrl += filename+","; // 기존의 값
           } else {
           currentUrl += filename;
           }
           
         } catch(Exception e) {
           e.printStackTrace();
         }
       }
       vo.setProduct_url(currentUrl);
     }

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
   public String update(ProductVO vo,List<MultipartFile> product_photo) {
	     if(!product_photo.isEmpty()) {
	         String currentUrl="";
	        for(int i=0;i<product_photo.size();i++) {
	          String filename = product_photo.get(i).getOriginalFilename();
	          System.out.print(product_photo.get(i).getOriginalFilename());
         String path = "C:\\Users\\son94\\Documents\\workspace-sts-3.9.18.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shopping\\resources\\img\\product\\";

         try {
	            new File(path).mkdirs();
	            product_photo.get(i).transferTo(new File(path+filename));
	            if(i<product_photo.size()-1) {
	            currentUrl += filename+","; // 기존의 값
	            } else {
	            currentUrl += filename;
	            }
	            
	          } catch(Exception e) {
	            e.printStackTrace();
	          }
	        }
	        vo.setProduct_url(currentUrl);
	      }
   service.updateProduct(vo);
   return "redirect:/productList.do";
}

   @RequestMapping("productDelete.do")
   public String delete(@RequestParam int product_id) {
     String filename = service.fileInfo(product_id);
     //System.out.println("상품 삭제 컨트롤러 작동");
     String path = "C:\\Users\\son94\\Documents\\workspace-sts-3.9.18.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shopping\\resources\\img\\product\\";
     
      if(filename != null) {
         File file = new File(path+filename);
         System.out.println(filename);
         if(file.exists()) {
            file.delete();
         }
      }

      service.deleteProduct(product_id);
      return "redirect:/productList.do";
   }

   
}
