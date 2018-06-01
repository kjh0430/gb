package com.crm.gb.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.crm.gb.order.model.vo.Order;
import com.crm.gb.product.model.vo.Product;
import com.crm.gb.product.model.vo.ProductFile;

@Service
public interface ProductService {
	
	int insertProduct(Product product);
	int insertProductFile(ProductFile pf);
	List<Product> selectAllList();
	ArrayList<Product> selectSearchProduct(String product_name); //상품검색 
	Product selectProductDetail(String product_no);
	int updateProductAmount(Order orderlist); // 주문후 재고 수량 업데이트 
}
