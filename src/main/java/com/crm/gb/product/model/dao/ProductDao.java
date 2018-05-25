package com.crm.gb.product.model.dao;

import java.util.List;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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

	//권성훈 : 제품 목록 리스트 호출 파일
	public List<Product> productList(){
		return sqlSession.selectList("productList");
	}
	
}
