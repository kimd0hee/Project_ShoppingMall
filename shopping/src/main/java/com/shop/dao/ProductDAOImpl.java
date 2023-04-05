package com.shop.dao;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.product.dto.ProductVO;

public class ProductDAOImpl implements ProductDAO{
	@Inject
	SqlSession sqlSession;
	
	//01. 상품목록
	@Override
	public productList<ProductVO> listProduct() {
		return sqlSession.selectList("product.productList");
	}
	//02. 상품상세
	@Override
	public ProductVO detailProduct(int product_id) {
		return sqlSession.selectOne("product.insertProduct", vo);
	}
	//03. 상품추가
	@Override
	public void insertProduct(ProductVO vo) {
		sqlSession.insert("product.insertProduct", vo);
	}
	//04. 상품수정
	@Override
	public void updateProduct(ProductVO vo) {
		sqlSession.update("product.updateProduct", vo);
	}
	//05. 상품삭제
	public void deleteProduct(int product_id) {
		sqlSession.delete("product.deleteProduct", product_id);
	}
	// 06. 상품이미지 삭제를 위한 이미지파읿정보
	public String fileInfo(int product_id) {
		return sqlSession.selectOne("product.fileInfo",product_id);
		
	}
}