package com.crm.gb.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.product.model.vo.Product;
import com.crm.gb.product.model.vo.ProductFile;

@Repository("productDao")
public class ProductDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertProduct(Product product) {
		// 제품등록
		return sqlSession.insert("insertProduct",product);
		
	}

	public int insertProductFile(ProductFile pf) {
		// 제품 첨부파일
		return sqlSession.insert("insertProductFile",pf);
	}
	
	public ArrayList<Product> selectSearchProduct(String product_name){
		//제품 검색 
		return (ArrayList)sqlSession.selectList("selectSearchProduct", product_name);
	}

}
