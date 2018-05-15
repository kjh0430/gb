package com.crm.gb.product.model.service;

import org.springframework.stereotype.Service;

import com.crm.gb.product.model.vo.Product;

@Service
public interface ProductService {
	
	int insertProduct(Product product);

}
