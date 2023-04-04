package com.product.service;

import java.util.List;

import com.product.dto.ProductVO;

public interface ProductService {

	public List<ProductVO> ProductList();

	public void insertProduct(ProductVO vo);

	public ProductVO viewProduct(String product_id);

	public void updateProduct(ProductVO vo);

	public void deleteProduct(String product_id);
}
