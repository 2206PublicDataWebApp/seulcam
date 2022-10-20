package com.kh.seulcam.product.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.product.domain.Brand;
import com.kh.seulcam.product.domain.Product;

@Repository
public interface ProductStore {

	public int insertBrand(SqlSession session, Brand brand);

	public List<HashMap> selectAllStoreName(SqlSession session);

	public int insertProduct(SqlSession session, Product product);

	public List<Product> selectAllProduct(SqlSession session);

}
