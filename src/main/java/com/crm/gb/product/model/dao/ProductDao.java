package com.crm.gb.product.model.dao;

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

}
