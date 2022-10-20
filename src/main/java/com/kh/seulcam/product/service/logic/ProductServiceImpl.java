package com.kh.seulcam.product.service.logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.product.domain.Brand;
import com.kh.seulcam.product.domain.Product;
import com.kh.seulcam.product.service.ProductService;
import com.kh.seulcam.product.store.ProductStore;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private ProductStore pStore;
	
	@Override
	public int registerbrand(Brand brand) {
		int result = pStore.insertBrand(session, brand);
		return result;
	}

	@Override
	public List<HashMap> getTotalStoreName() {
		List<HashMap> sNameList=pStore.selectAllStoreName(session);
		return sNameList;
	}

	@Override
	public int registerProduct(Product product) {
		int result = pStore.insertProduct(session, product);
		return result;
	}

	@Override
	public List<Product> getTotalProduct() {
		List<Product> pList = pStore.selectAllProduct(session);
		return pList;
	}

}
