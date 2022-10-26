package com.kh.seulcam.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.seulcam.product.domain.Brand;
import com.kh.seulcam.product.domain.Detail;
import com.kh.seulcam.product.domain.Product;
import com.kh.seulcam.product.domain.Review;

@Service
public interface ProductService {

	public int registerbrand(Brand brand);

	public List<HashMap> getTotalStoreName();

	public int registerProduct(Product product);

	public List<Product> getTotalProduct();

	public int registerProductDetail(Detail detail);

	public List<Product> getNewArrivalList();

	public Product getProductByNo(Integer productNo);

	public List<Detail> printAllDetailInfo(Integer productNo);

	public int registerProductReview(Review review);

	public List<Review> getReviewByProductNo(Integer productNo);

	public List<Brand> getbrandStore(String brandName);

	public Review getOneReview(Integer reviewNo);

	public String findProductName(int productNo);

}
