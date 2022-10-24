package com.kh.seulcam.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.seulcam.product.domain.Detail;
import com.kh.seulcam.product.domain.Product;
import com.kh.seulcam.product.domain.Review;
import com.kh.seulcam.product.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService ;

	@RequestMapping(value="/product/top20List", method=RequestMethod.GET)
	public String top20ListView(Model model) {
		return "product/top20List";
	}
	
	
	@RequestMapping(value="/product/newArrivalList", produces="application/json;charset=utf-8",method=RequestMethod.GET)
	public ModelAndView newArrivalListView(Model model, ModelAndView mv) {
		List<Product> pList = pService.getNewArrivalList();
		mv.addObject("pList", pList);
		
		return mv;
	}
	
	
	@RequestMapping(value="/product/productDetail", method=RequestMethod.GET)
	public ModelAndView detailView(Model model
			,ModelAndView mv
			,@RequestParam ("productNo") Integer productNo
			,HttpSession session) {
		//System.out.println(productNo);
		Product product = pService.getProductByNo(productNo);
		
		if(product!=null) {
			mv.addObject("product", product);
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/product/productDetailInfo", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String productDetailInfo(
			@RequestParam("productNo") Integer productNo
			,HttpSession session
			) {		
		List<Detail> dList = pService.printAllDetailInfo(productNo);
		//System.out.println(dList.toString());
		session.setAttribute("productNo", productNo);
		if(!dList.isEmpty()) {
			Gson gson = new GsonBuilder().create();
			return gson.toJson(dList);
		}
		return null;
	}
	
	
	

	@RequestMapping(value="/product/reviewRegist", method=RequestMethod.GET)
	public ModelAndView reviewRegistView(ModelAndView mv
			,@RequestParam ("productNo")Integer productNo) {
		Product product = pService.getProductByNo(productNo);
		String memberId ="user1";  //로그인해서 세션값 가져오기 . 하드
		mv.addObject("productName", product.getProductName());
		mv.addObject("memberId", memberId);
		
		return mv;
	}
	
	@RequestMapping(value="/product/reviewRegister", method=RequestMethod.POST)
	public String reviewRegister(ModelAndView mv
			,@ModelAttribute Review review
			, HttpSession session
			,@RequestParam(value="myFile", required=false) List<MultipartFile> mfList
			,HttpServletRequest request
			) {
		int productNo=(Integer)session.getAttribute("productNo");
		review.setProductNo(productNo);
//		try {
//			for(int i=0; i<mfList.size(); i++) {
//				
//				String reviewFileName=mfList.get(i).getOriginalFilename();
//				if(!reviewFileName.equals("")) {
//					String root=request.getSession().getServletContext().getRealPath("resources");
//					String savePath = root+"\\puploadFiles";
//					System.out.println(savePath);
//					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//					String reviewFileRename =sdf.format(new Date(System.currentTimeMillis()))+"review"+i+"."
//						+reviewFileName.substring(reviewFileName.lastIndexOf(".")+1);
//					File file = new File(savePath);
//						if(!file.exists()) {
//							file.mkdir();
//						}
//						mfList.get(i).transferTo(new File(savePath+"\\"+reviewFileRename));
//						String reviewFilePath=savePath+"\\"+reviewFileRename;
//						switch (i) {
//						case 0:
//							review.setReviewFileName1(reviewFileName);
//							review.setReviewFilePath1(reviewFilePath);
//							review.setReviewFileRename1(reviewFileRename);
//							break;
//						case 1:
//							review.setReviewFileName2(reviewFileName);
//							review.setReviewFilePath2(reviewFilePath);
//							review.setReviewFileRename2(reviewFileRename);
//							break;
//						case 2:
//							review.setReviewFileName3(reviewFileName);
//							review.setReviewFilePath3(reviewFilePath);
//							review.setReviewFileRename3(reviewFileRename);
//							break;
//						}
//					}
//				} 
//				}catch (IllegalStateException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//		int result = pService.registerProductReview(review);
		System.out.println(review.toString());
			
		
		return "index";
	
	}
	

	
}
