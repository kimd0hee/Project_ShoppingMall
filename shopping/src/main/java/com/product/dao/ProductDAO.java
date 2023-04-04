package com.product.dao;

import java.util.List;

import com.product.dto.ProductVO;

public interface ProductDAO {
	// 목록
	public List<ProductVO> ProductList();
	// 등록
	public void insertProduct(ProductVO vo);
	// 보기
	public ProductVO viewProduct(String product_id);
	// 수정
	public void updateProduct(ProductVO vo);
	// 삭제
	public void deleteProduct(String product_id);
}
