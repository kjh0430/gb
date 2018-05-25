package com.crm.gb.product.model.service;

import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import com.crm.gb.product.model.vo.Product;
import com.crm.gb.product.model.vo.ProductFile;

@Service
public interface ProductService {
	
	int insertProduct(Product product);
	int insertProductFile(ProductFile pf);
	List<Product> selectAllList();
	
	ArrayList<Product> selectSearchProduct(String product_name); //상품검색 

}
