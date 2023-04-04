package com.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.product.dao.ProductDAO;
import com.product.dto.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductDAO dao;
	
	@Override
	public List<ProductVO> ProductList() {
		return dao.ProductList();
	}

	@Override
	public void insertProduct(ProductVO vo) {
		dao.insertProduct(vo);
	}

	@Override
	public ProductVO viewProduct(String product_id) {
		return dao.viewProduct(product_id);
	}

	@Override
	public void updateProduct(ProductVO vo) {
		dao.updateProduct(vo);
	}

	@Override
	public void deleteProduct(String product_id) {
		dao.deleteProduct(product_id);

	}

}
