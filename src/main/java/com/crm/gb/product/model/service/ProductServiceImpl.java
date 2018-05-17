package com.crm.gb.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	

}
