package com.product.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
   @Resource(name="uploadPath")
   private String uploadPath;



   @RequestMapping("productList.do")
   //required = false: 해당 필드가 쿼리스트링에 존재하지 않아도 예외가 발생하지 않음
   public ModelAndView list(@RequestParam(required = false) String category, ModelAndView mav) {
      mav.setViewName("productList");
      List<ProductVO> productList = service.productList();
      //상품목록 필터링, category가 null값이 아니면 if문이 실행(productList는 전체, category는 특정값)
      if (category != null) {
         productList = filterByCategory(productList, category);
         mav.addObject("category", category);
      }
      //필터링된 상품목록을 ModelAndView 객체에 "list"라는 이름으로 추가, 이렇게 추가된 데이터는 뷰에서 사용  
      mav.addObject("list", productList);
      return mav;
   }

   private List<ProductVO> filterByCategory(List<ProductVO> productList, String category) {
      // 카테고리에 따라 productList 필터링하는 로직 구현
      // 예시로 간단히 카테고리가 일치하는 상품만 필터링하도록 구현했습니다.
      List<ProductVO> filteredList = new ArrayList<>();
      for (ProductVO product : productList) { //향상된 for문 형태임, 대입받을 변수정의 : 배열명, productList가 product에 대입되면  if문이 돌고 참이면 if문의 몸통을 실행
         if (product.getCategory().equals(category)) {
            filteredList.add(product);
         }
      }
      return filteredList;
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
         
         String path = "C:\\Users\\newtec\\Documents\\workspace-sts-3.9.18.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shopping\\resources\\img\\product\\";
         
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
             
             String path = "C:\\Users\\newtec\\Documents\\workspace-sts-3.9.18.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shopping\\resources\\img\\product\\";
             
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
     String path = "C:\\Users\\newtec\\Documents\\workspace-sts-3.9.18.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shopping\\resources\\img\\product\\";
     
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