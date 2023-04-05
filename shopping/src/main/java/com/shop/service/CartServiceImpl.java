package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.dao.ProductDAO;
import com.shop.dto.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductDAO dao;
	
	@Override
	public List<ProductVO> productList(){
		return dao.productList();
	}
	
	@Override
	public ProductVO detailProduct(int productId) {
		return dao.detailProduct(productId);
	}
	
	@Override
	public void insertProduct(ProductVO vo) {
		dao.insertProduct(vo);
	}
	
	@Override
	public void updateProduct(ProducyVO vo) {
		dao.updateProduct(vo);
	}

	@Override
	public void deleteProduct(int productId) {
		dao.deleteProduct(productId);
	}

	@Override
	public String fileInfo(int productId) {
		return dao.fileInfo(productId);
	}

}