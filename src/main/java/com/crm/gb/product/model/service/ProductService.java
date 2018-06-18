package com.crm.gb.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.crm.gb.order.model.vo.Order;
import com.crm.gb.product.model.vo.Product;
import com.crm.gb.product.model.vo.ProductFile;

@Service
public interface ProductService {
	
	public abstract int insertProduct(Product product);
	public abstract int insertProductFile(ProductFile pf);
	public abstract List<Product> selectAllList();
	public abstract ArrayList<Product> selectSearchProduct(String product_name); //상품검색 
	public abstract Product selectProductDetail(String product_no);
	public abstract int updateProductAmount(Order orderlist); // 주문후 재고 수량 업데이트 
	public abstract int updateProduct(Product product);
	public abstract int deleteProduct(int product_no);
	public abstract ArrayList<ProductFile> selectProductFile(Product pd);
	public abstract int deleteFile(String product_rename_file);
}
