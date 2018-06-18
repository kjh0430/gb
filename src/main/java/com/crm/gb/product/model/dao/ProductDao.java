package com.crm.gb.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.order.model.vo.Order;
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

	//권성훈 : 제품 목록 리스트 호출 파일
	public List<Product> productList(){
		return sqlSession.selectList("productList");
	}

	public Product productDetail(String product_no) {
		return sqlSession.selectOne("productDetail", product_no);
	}

	public int updateProductAmount(Order orderlist) {
		return sqlSession.update("updateProductAmount",orderlist);
	}

	public int updateProduct(Product product) {
		return sqlSession.update("updateProduct",product);
	}

	public int deleteProduct(int product_no) {
		return sqlSession.update("deleteProduct",product_no);
	}

	public ArrayList<ProductFile> selectProductDetailFile(Product pd) {
		return (ArrayList)sqlSession.selectList("productDetailFile",pd);
	}

	public int productListE(Product pro) {
		return sqlSession.selectOne("productListA", pro);
	}

	public ArrayList<Product> productListB(Product pro) {
		return (ArrayList)sqlSession.selectList("productListC", pro);
	}

}
