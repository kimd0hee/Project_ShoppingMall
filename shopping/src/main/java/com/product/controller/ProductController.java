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
   
   
   @RequestMapping("productlist.do")
   public ModelAndView list(ModelAndView mav) {
      mav.setViewName("/product/productList");
      mav.addObject("list", service.productList());
      return mav;
   }
   
   @RequestMapping("/detail/{product_id}")
   public ModelAndView detail(@PathVariable("product_id") int product_id, ModelAndView mav) {
      mav.setViewName("/product/productDetail");
      mav.addObject("vo", service.detailProduct(product_id));
      return mav;
   }
   
   @RequestMapping("write.do")
   public String write() {
      return "productWrite";
   }
   
   @RequestMapping("insert.do")
   public String insert(ProductVO vo, MultipartFile productPhotos) {
      String filename = "";
      
      if(!productPhotos.isEmpty()) {
         filename = productPhotos.getOriginalFilename();
         System.out.print(productPhotos.getOriginalFilename());
         
         String path = "C:\\Users\\woori\\Documents\\workspace-sts-3.9.18.RELEASE" +
          ".metadata\\.plugins\\org.eclipse.wst.server.core\\" +
                "tmp2\\wtpwebapps\\spring\\resources\\images\\";
         
         try {
            new File(path).mkdirs();
            productPhotos.transferTo(new File(path+filename));
         }catch(Exception e) {
            e.printStackTrace();
         }
         vo.setProduct_img(filename);
      }
      
      service.insertProduct(vo);
      
      return "redirect:/productList.do";
   }
   
   @RequestMapping("edit/{product_id}")
   public ModelAndView edit(@PathVariable("product_id") int product_id, ModelAndView mav) {
      mav.setViewName("/product/productEdit");
      mav.addObject("vo", service.detailProduct(product_id));
      return mav;
   }
   
   @RequestMapping("update.do")
   public String update(ProductVO vo, MultipartFile productPhotos) {
      String filename = "";
      
      
      if(!productPhotos.isEmpty()) {
         filename = productPhotos.getOriginalFilename();
         
         String path = "C:\\Users\\woori\\Documents\\workspace-sts-3.9.18.RELEASE" +
                ".metadata\\.plugins\\org.eclipse.wst.server.core\\" +
                      "tmp2\\wtpwebapps\\spring\\resources\\images\\";
         
         try {
            new File(path).mkdirs();
         }catch(Exception e) {
            e.printStackTrace();
         }
         vo.setProduct_img(filename);
      }else {
         ProductVO vo2 = service.detailProduct(vo.getProduct_id());
         vo.setProduct_img(vo2.getProduct_img());
      }
      service.updateProduct(vo);
      return "redirect:/productList.do";
   }
   
   @RequestMapping("delete.do")
   public String delete(@RequestParam int product_id) {
      String filename = service.fileInfo(product_id);
      String path = "C:\\Users\\woori\\Documents\\workspace-sts-3.9.18.RELEASE" +
             ".metadata\\.plugins\\org.eclipse.wst.server.core\\" +
                   "tmp2\\wtpwebapps\\spring\\resources\\images\\";
      
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
