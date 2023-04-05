package com.shop.service;

import java.util.List;

import com.shop.dto.ProductVO;

public interface ProductService {
	
	public List<ProductVO> productList();
	
	public ProductVO detailProduct(int productId);
	
	public void insertProduct(ProductVO vo);
	
	public void updateProduct(ProductVO vo);
	
	public void deleteProduct(int productId);
	
	public String fileInfo(int productId);
}