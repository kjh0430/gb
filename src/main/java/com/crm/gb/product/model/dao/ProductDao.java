package com.crm.gb.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.crm.gb.product.model.vo.Product;

@Repository("ProductDao")
public class ProductDao {

	private SqlSessionTemplate sqlSession;
	
	public int insertProduct(Product product) {
		// 제품등록
		return sqlSession.insert("insertProduct",product);
	}

}
