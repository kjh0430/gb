package com.crm.gb.product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.product.model.dao.ProductDao;
import com.crm.gb.product.model.vo.Product;
import com.crm.gb.product.model.vo.ProductFile;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Override
	public int insertProduct(Product product) {
		//제품 등록
		return productDao.insertProduct(product);
	}

	@Override
	public int insertProductFile(ProductFile pf) {
		// 제품 첨부파일 등록
		return productDao.insertProductFile(pf);
	}
	
	@Override
	public ArrayList<Product> selectSearchProduct(String product_name){
		//제품 검색 
		return productDao.selectSearchProduct(product_name);
	}
	

}
