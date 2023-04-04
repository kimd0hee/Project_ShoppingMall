package com.product.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.product.dto.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession sqlsession;
	String nameSpace = "product";
	
	// 목록
	@Override
	public List<ProductVO> ProductList() {
		return sqlsession.selectList(nameSpace+".productList");
		
	}
	
	// 등록
	@Override
	public void insertProduct(ProductVO vo) {
		sqlsession.insert(nameSpace+".insertProduct", vo);
	}
	
	// 자세히 보기
	@Override
	public ProductVO viewProduct(String product_id) {
		return sqlsession.selectOne(nameSpace+".insertProduct", product_id);
	}
	
	// 수정
	@Override
	public void updateProduct(ProductVO vo) {
		sqlsession.update(nameSpace+".updateProduct", vo);

	}
	
	// 삭제
	@Override
	public void deleteProduct(String product_id) {
		sqlsession.delete(nameSpace+".deleteProduct", product_id);

	}

}
