package com.shop.dao;

public interface ProductDAO {
	// 상품목록
	public productList<ProductVO> listProduct();
	// 상품상세
	public ProductVO detailProduct(int product_id);
	// 상품추가
	public void insertProduct(ProductVO vo);
	// 상품수정
	public void updateProduct(ProductVO vo);
	// 상품삭제
	public void deleteProduct(int product_id);
	// 상품이미지 삭제를 위한 이미지파일 정보
	public String fileInfo(int product_id);
	
}
