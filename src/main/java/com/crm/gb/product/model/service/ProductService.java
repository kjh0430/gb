package com.crm.gb.product.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.crm.gb.product.model.vo.Product;
import com.crm.gb.product.model.vo.ProductFile;

@Service
public interface ProductService {
	
	int insertProduct(Product product);
	int insertProductFile(ProductFile pf);
	List<Product> selectAllList();
}
