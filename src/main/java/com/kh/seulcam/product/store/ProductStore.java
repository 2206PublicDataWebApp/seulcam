package com.kh.seulcam.product.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.product.domain.Brand;
import com.kh.seulcam.product.domain.Detail;
import com.kh.seulcam.product.domain.Product;
import com.kh.seulcam.product.domain.Review;

@Repository
public interface ProductStore {

	public int insertBrand(SqlSession session, Brand brand);

	public List<HashMap> selectAllStoreName(SqlSession session);

	public int insertProduct(SqlSession session, Product product);

	public List<Product> selectAllProduct(SqlSession session,String sortCd);

	public int insertProductDetail(SqlSession session, Detail detail);

	public List<Product> selectAllProductByArrayDf(SqlSession session, String arrayCd);

	public Product selectProductByNo(SqlSession session, Integer productNo);

	public List<Detail> selectAllDetailInfo(SqlSession session, Integer productNo);

	public int insertProductReview(SqlSession session, Review review);

	public List<Review> selectReviewByProductNo(SqlSession session, Integer productNo);

	public List<Brand> selectOneBrand(SqlSession session, String brandName);

	public Review selectOneReview(SqlSession session, Integer reviewNo);

	public String selectProductName(SqlSession session, int productNo);

	public int updateProductReview(SqlSession session, Review newReview);

	public int deleteReview(SqlSession session, Integer reviewNo);

	public List<Product> selectProductByKeyword(SqlSession session, String keyword);

	public List<Product> selectProductByBrand(SqlSession session, String brandName, String sortCd);

	public List<Product> selectProductByCetegory(SqlSession session, String cate_no, String sortCd);

	public List<Review> selectReviewBymemberId(SqlSession session, String memberId);

	public List<Review> selectAllReview(SqlSession session);



}
