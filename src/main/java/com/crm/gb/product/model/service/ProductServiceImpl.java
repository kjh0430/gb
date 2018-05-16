package com.crm.gb.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.product.model.dao.ProductDao;
import com.crm.gb.product.model.vo.Product;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Override
	public int insertProduct(Product product) {
		//제품 등록
		return productDao.insertProduct(product);
	}

}
