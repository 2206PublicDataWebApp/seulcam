package com.kh.seulcam.product.store.logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.seulcam.product.domain.Brand;
import com.kh.seulcam.product.domain.Detail;
import com.kh.seulcam.product.domain.Product;
import com.kh.seulcam.product.domain.Review;
import com.kh.seulcam.product.store.ProductStore;

@Repository
public class ProductStoreLogic implements ProductStore {

	@Override
	public int insertBrand(SqlSession session, Brand brand) {
		int result = session.insert("BrandMapper.insertBrand",brand);
		return result;
	}

	@Override
	public List<HashMap> selectAllStoreName(SqlSession session) {
		List<HashMap> sNameList = session.selectList("BrandMapper.selectAllStoreName");
		return sNameList;
	}

	@Override
	public int insertProduct(SqlSession session, Product product) {
		int productNo = session.insert("ProductMapper.insertProduct",product);
		return productNo;
	}

	@Override
	public List<Product> selectAllProduct(SqlSession session, String sortCd) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("sortCd", sortCd);
		List<Product> pList=session.selectList("ProductMapper.selectAllProduct",paramMap);
		return pList;
	}

	@Override
	public int insertProductDetail(SqlSession session, Detail detail) {
		int result = session.insert("ProductMapper.insertProductDetail", detail);
		return result;
	}


	@Override
	public List<Product> selectAllProductByArrayDf(SqlSession session, String arrayCd) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("arrayCd", arrayCd);
		 List<Product> pList = session.selectList("ProductMapper.selectAllProductByArrayDf", paramMap);
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

	@Override
	public int insertProductReview(SqlSession session, Review review) {
		int result = session.insert("ProductReviewMapper.insertProductReview",review);
		return result;
	}

	@Override
	public List<Review> selectReviewByProductNo(SqlSession session, Integer productNo) {
		List<Review> rList=session.selectList("ProductReviewMapper.selectReviewByProductNo", productNo);
		return rList;
	}

	@Override
	public List<Brand> selectOneBrand(SqlSession session, String brandName) {
		List<Brand> bsList=session.selectList("BrandMapper.selectOneBrand", brandName);
		return bsList;
	}

	@Override
	public Review selectOneReview(SqlSession session, Integer reviewNo) {
		Review review = session.selectOne("ProductReviewMapper.selectOneReview", reviewNo);
		return review;
	}

	@Override
	public String selectProductName(SqlSession session, int productNo) {
		String productName = session.selectOne("ProductMapper.selectProductName", productNo);
		return productName;
	}

	@Override
	public int updateProductReview(SqlSession session, Review newReview) {
		int result = session.update("ProductReviewMapper.updateProductReview", newReview);
		return result;
	}

	@Override
	public int deleteReview(SqlSession session, Integer reviewNo) {
		int result = session.delete("ProductReviewMapper.deleteReview",reviewNo);
		return result;
	}

	@Override
	public List<Product> selectProductByKeyword(SqlSession session, String keyword) {
		List<Product> pList = session.selectList("ProductMapper.selectProductByKeyword", keyword);
		return pList;
	}

	@Override
	public List<Product> selectProductByBrand(SqlSession session, String brandName, String sortCd) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("brandName", brandName);
		paramMap.put("sortCd", sortCd);
		
		List<Product> pList = session.selectList("ProductMapper.selectProductByBrand", paramMap);
		
		return pList;
	}

	@Override
	public List<Product> selectProductByCetegory(SqlSession session, String cate_no, String sortCd) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("cate_no", cate_no);
		paramMap.put("sortCd", sortCd);
		List<Product> pList = session.selectList("ProductMapper.selectProductByCategory", paramMap);
		return pList;
	}

	@Override
	public List<Review> selectReviewBymemberId(SqlSession session, String memberId) {
		List<Review> rList = session.selectList("ProductReviewMapper.selectReviewBymemberId", memberId);
		return rList;
	}

	@Override
	public List<Review> selectAllReview(SqlSession session) {
		List<Review> rList = session.selectList("ProductReviewMapper.selectAllReview");
		return rList;
	}

	@Override
	public List<Brand> selectAllBrand(SqlSession session) {
		List<Brand> bList = session.selectList("BrandMapper.selectAllBrand");
		return bList;
	}


	

}
