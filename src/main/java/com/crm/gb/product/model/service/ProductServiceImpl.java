package com.crm.gb.product.model.service;

import java.util.List;
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
	

	//권성훈 전체 제품 리스트 목록
	@Override
	public List<Product> selectAllList() {
		return productDao.productList();
}
	//권성훈 제품 상세보기가서 제품 상세 뿌리기
	@Override
	public Product selectProductDetail(String product_no) {
		return productDao.productDetail(product_no);
	}
	@Override
	public ArrayList<Product> selectSearchProduct(String product_name){
		//제품 검색 
		return productDao.selectSearchProduct(product_name);
	}
	

}
