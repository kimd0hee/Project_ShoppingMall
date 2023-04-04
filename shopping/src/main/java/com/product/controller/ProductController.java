package com.product.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.product.dto.ProductVO;
import com.product.service.ProductService;


@Controller
public class ProductController {
	
	@Inject
	ProductService service;

	// 목록
	@RequestMapping("productList.do")
	public String ProductList(Model model) {
		
		List<ProductVO> list = service.ProductList();
		model.addAttribute("list", list);
		return "productList";
	}
	
	// 입력
	@RequestMapping("productWrite.do")
	public String writeProduct() {
		return "productWrite";
	}
	
	// 수정
	@RequestMapping("insertProduct.do")
	public String insertProduct(@ModelAttribute ProductVO vo) {
		service.insertProduct(vo);
		return "redirect:/main"; 
	}
	
	// 보기
	@RequestMapping("viewProduct.do")
	public String viewProduct(String product_id, Model model) {
		model.addAttribute("dto", service.viewProduct(product_id));
		return "productView";
	}
	
	//삭제
	@RequestMapping("deleteProduct.do")
	public String deleteProduct(@RequestParam int product_id) {
		return "redirect:/productList.do";
	}

}
