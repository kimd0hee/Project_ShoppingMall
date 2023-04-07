package com.admin.productController;

import javax.inject.Inject;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;
import com.product.service.ProductService;


@Controller
@RequestMapping("product/*")
public class ProductController {

   @Inject
   ProductService productService;
   @Resource(name="uploadPath")
   private String uploadPath;
   
   @RequestMapping("/list.do")
   public ModelAndView list(org.springframework.web.servlet.ModelAndView mav) {
      mav.setViewName("/product/productList");
      mav.addObQject("list", productService.listProduct());
      return mav;
   }
   
   @RequestMapping("/detail/{productId}")
   public ModelAndView detail(@PathVariable("productId") int productId, ModelAndView mav) {
      mav.setViewName("/product/productDetail");
      mav.addObject("vo", productService.detailProduct(productId));
      return mav;
   }
   
   @RequestMapping("write.do")
   public String write() {
      return "/product/productWrite";
   }
   
   @RequestMapping("insert.do")
   public String insert(shoppingmallVO vo, MultipartFile productPhotos) {
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
         vo.setProductUrl(filename);
      }
      
      productService.insertProduct(vo);
      
      return "redirect:/product/list.do";
   }
   
   @RequestMapping("edit/{productId}")
   public ModelAndView edit(@PathVariable("productId") int productId, ModelAndView mav) {
      mav.setViewName("/product/productEdit");
      mav.addObject("vo", productService.detailProduct(productId));
      return mav;
   }
   
   @RequestMapping("update.do")
   public String update(shoppingmallVO vo, MultipartFile productPhotos) {
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
         vo.setProductUrl(filename);
      }else {
         shoppingmallVo vo2 = productService.detailProduct(vo.getProductId());
         vo.setProductUrl(vo2.getProductUrl());
      }
      productService.updateProduct(vo);
      return "redirect:/product/list.do";
   }
   
   @RequestMapping("delete.do")
   public String delete(@RequestParam int productId) {
      String filename = productService.fileInfo(productId);
      String path = "C:\\Users\\woori\\Documents\\workspace-sts-3.9.18.RELEASE" +
             ".metadata\\.plugins\\org.eclipse.wst.server.core\\" +
                   "tmp2\\wtpwebapps\\spring\\resources\\images\\";
      
      if(filename != null) {
         File file = new File(path+filename);
         
         if(file.exists()) {
            file.delete();
         }
      }
      
      productService.deleteProduct(ProductId);
      return "redirct:product/list.do";
   }
