package com.kh.seulcam.product.store.logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.product.domain.Brand;
import com.kh.seulcam.product.domain.Detail;
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
		int productNo = session.insert("ProductMapper.insertProduct",product);
		return productNo;
	}

	@Override
	public List<Product> selectAllProduct(SqlSession session) {
		List<Product> pList=session.selectList("ProductMapper.selectAllProduct");
		return pList;
	}

	@Override
	public int insertProductDetail(SqlSession session, Detail detail) {
		int result = session.insert("ProductMapper.insertProductDetail", detail);
		return result;
	}

	@Override
	public List<Product> selectNewArrivalList(SqlSession session) {
		List<Product> pList = session.selectList("ProductMapper.selectNewArrivalList");
		return pList;
	}

	@Override
	public Product selectProductByNo(SqlSession session, Integer productNo) {
		Product product = session.selectOne("ProductMapper.selectProductByNo", productNo);
		return product;
	}

	@Override
	public List<Detail> selectAllDetailInfo(SqlSession session, Integer productNo) {
		List<Detail> dList=session.selectList("ProductMapper.selectAllDetailInfo", productNo);
		return dList;
	}

}
