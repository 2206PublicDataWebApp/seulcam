package com.kh.seulcam.product.service.logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.seulcam.product.domain.Brand;
import com.kh.seulcam.product.domain.Detail;
import com.kh.seulcam.product.domain.Product;
import com.kh.seulcam.product.domain.Review;
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
		pStore.insertProduct(session, product);
		int productNo = product.getProductNo();
		return productNo;
	}

	@Override
	public List<Product> getTotalProduct() {
		List<Product> pList = pStore.selectAllProduct(session);
		return pList;
	}

	@Override
	public int registerProductDetail(Detail detail) {
		int result = pStore.insertProductDetail(session, detail);
		return result;
	}

	@Override
	public List<Product> getNewArrivalList() {
		List<Product> pList = pStore.selectNewArrivalList(session);
		return pList;
	}

	@Override
	public Product getProductByNo(Integer productNo) {
		Product product = pStore.selectProductByNo(session, productNo);
		return product;
	}

	@Override
	public List<Detail> printAllDetailInfo(Integer productNo) {
		List<Detail> dList = pStore.selectAllDetailInfo(session, productNo);
		return dList;
	}

	@Override
	public int registerProductReview(Review review) {
		int result = pStore.insertProductReview(session, review);
		return result;
	}

	@Override
	public List<Review> getReviewByProductNo(Integer productNo) {
		List<Review> rList=pStore.selectReviewByProductNo(session, productNo);
		return rList;
	}

	@Override
	public List<Brand> getbrandStore(String brandName) {
		List<Brand> bsList = pStore.selectOneBrand(session, brandName);
		return bsList;
	}

	@Override
	public Review getOneReview(Integer reviewNo) {
		Review review = pStore.selectOneReview(session, reviewNo);
		return review;
	}

	@Override
	public String findProductName(int productNo) {
		String productName = pStore.selectProductName(session, productNo);
		return productName;
	}

}
