package com.kh.seulcam.product.store.logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.product.domain.Brand;
import com.kh.seulcam.product.domain.Product;
import com.kh.seulcam.product.store.ProductStore;

@Repository
public class ProductStoreLogic implements ProductStore {

	@Override
	public int insertBrand(SqlSession session, Brand brand) {
		int result = session.insert("ProductMapper.insertBrand",brand);
		return result;
	}

	@Override
	public List<HashMap> selectAllStoreName(SqlSession session) {
		List<HashMap> sNameList = session.selectList("ProductMapper.selectAllStoreName");
		return sNameList;
	}

	@Override
	public int insertProduct(SqlSession session, Product product) {
		int result = session.insert("ProductMapper.insertProduct",product);
		return result;
	}

}
