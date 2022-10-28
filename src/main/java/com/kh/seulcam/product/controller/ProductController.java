package com.kh.seulcam.product.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.product.domain.Brand;
import com.kh.seulcam.product.domain.Detail;
import com.kh.seulcam.product.domain.Product;
import com.kh.seulcam.product.domain.Review;
import com.kh.seulcam.product.service.ProductService;

@Controller
public class ProductController {
	
	private static final HttpsURLConnection HttpsURLConnection = null;
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
	
		Product product = pService.getProductByNo(productNo);
		Member member=null;
		if(session.getAttribute("loginUser") != null) {
			member =(Member)session.getAttribute("loginUser");
			System.out.println(member.toString());
			mv.addObject("loginUser",member);
		}
		if(product!=null) {
			mv.addObject("product", product);
		}
		return mv;
	}
	//상품상세 ->상품상세ajax
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
	
	
	
	//리뷰등록화면
	@RequestMapping(value="/product/reviewRegist", method=RequestMethod.GET)
	public ModelAndView reviewRegistView(ModelAndView mv
			,@RequestParam ("productNo")Integer productNo
			, HttpSession session) {
		Product product = pService.getProductByNo(productNo);
		Member member =(Member) session.getAttribute("loginUser");
		String memberId = member.getMemberId();
		System.out.println(memberId);
		mv.addObject("productName", product.getProductName());
		mv.addObject("memberId", memberId);
		return mv;
	}
	//리뷰등록
	@RequestMapping(value="/product/reviewRegister", method=RequestMethod.POST)
	public ModelAndView reviewRegister(ModelAndView mv
			,@ModelAttribute Review review
			, HttpSession session
			,@RequestParam(value="myFile", required=false) List<MultipartFile> mfList
			,HttpServletRequest request
			) {
		System.out.println((Integer)session.getAttribute("productNo"));
		int productNo=(Integer)session.getAttribute("productNo");
		review.setProductNo(productNo);
		try {
			for(int i=0; i<mfList.size(); i++) {
				
				String reviewFileName=mfList.get(i).getOriginalFilename();
				if(!reviewFileName.equals("")) {
					String root=request.getSession().getServletContext().getRealPath("resources");
					String savePath = root+"\\puploadFiles";
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String reviewFileRename =sdf.format(new Date(System.currentTimeMillis()))+"review"+i+"."
						+reviewFileName.substring(reviewFileName.lastIndexOf(".")+1);
					File file = new File(savePath);
						if(!file.exists()) {
							file.mkdir();
						}
						mfList.get(i).transferTo(new File(savePath+"\\"+reviewFileRename));
						String reviewFilePath=savePath+"\\"+reviewFileRename;
						switch (i) {
						case 0:
							review.setReviewFileName1(reviewFileName);
							review.setReviewFilePath1(reviewFilePath);
							review.setReviewFileRename1(reviewFileRename);
							break;
						case 1:
							review.setReviewFileName2(reviewFileName);
							review.setReviewFilePath2(reviewFilePath);
							review.setReviewFileRename2(reviewFileRename);
							break;
						case 2:
							review.setReviewFileName3(reviewFileName);
							review.setReviewFilePath3(reviewFilePath);
							review.setReviewFileRename3(reviewFileRename);
							break;
						}
					}
				} 
				}catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		System.out.println(review.toString());
		int result = pService.registerProductReview(review);
		if(result>0) {
			
			mv.setViewName("redirect:/product/productDetail?productNo="+productNo);
		}else {
			mv.setViewName("errorPage");
		}
		return mv;
	
	}
	//리뷰수정 화면
	@RequestMapping(value="/product/reviewModify", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public ModelAndView reviewModifyForm(ModelAndView mv
			,@RequestParam("reviewNo") Integer reviewNo
			
			) {
		Review review = pService.getOneReview(reviewNo);
		System.out.println(review.getProductNo());
		String productName = pService.findProductName(review.getProductNo());
		System.out.println(review);
		mv.addObject("review", review);
		mv.addObject("productName", productName);
		return mv;
		
	}
	//리뷰수정하기
	@RequestMapping(value="/product/reviewModify", produces="application/json;charset=utf-8", method=RequestMethod.POST)
	public ModelAndView reviewModify(ModelAndView mv
			,@RequestParam("reviewNo") Integer reviewNo
			,@RequestParam(value="myFile", required=false) List<MultipartFile> mfList
			,@ModelAttribute Review review
			,HttpServletRequest request
			,@RequestParam ("productNo")Integer productNo
			) {
		
		//수정전 리뷰 꺼내오기
		Review befReview = pService.getOneReview(reviewNo);
		//폴더에 파일 일단 삭제 + 수정전 객체 파일 리셋
		if(review.getReviewFileName1()!=null) {
			File delFile = new File(befReview.getReviewFilePath1());
			delFile.delete();
			befReview.setReviewFileName1(null);
			befReview.setReviewFilePath1(null);
			befReview.setReviewFileRename1(null);
		}
		if(review.getReviewFileName2()!=null) {
			File delFile = new File(befReview.getReviewFilePath2());
			delFile.delete();
			befReview.setReviewFileName2(null);
			befReview.setReviewFilePath2(null);
			befReview.setReviewFileRename2(null);
		}
		if(review.getReviewFileName3()!=null) {
			File delFile = new File(befReview.getReviewFilePath3());
			delFile.delete();
			befReview.setReviewFileName3(null);
			befReview.setReviewFilePath3(null);
			befReview.setReviewFileRename3(null);
		}
		//수정파일 다시 업로드
		try {
			for(int i=0; i<mfList.size(); i++) {			
				String root=request.getSession().getServletContext().getRealPath("resources");
				String savePath = root+"\\puploadFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				
				String reviewFileName=mfList.get(i).getOriginalFilename();
				String reviewFileRename =sdf.format(new Date(System.currentTimeMillis()))+"review"+i+"."
						+reviewFileName.substring(reviewFileName.lastIndexOf(".")+1);
				if(!reviewFileName.equals("")) {
					File file = new File(savePath);
						if(!file.exists()) {
							file.mkdir();
						}
						mfList.get(i).transferTo(new File(savePath+"\\"+reviewFileRename));
						String reviewFilePath=savePath+"\\"+reviewFileRename;
						switch (i) {
						case 0:
							review.setReviewFileName1(reviewFileName);
							review.setReviewFilePath1(reviewFilePath);
							review.setReviewFileRename1(reviewFileRename);
							break;
						case 1:
							review.setReviewFileName2(reviewFileName);
							review.setReviewFilePath2(reviewFilePath);
							review.setReviewFileRename2(reviewFileRename);
							break;
						case 2:
							review.setReviewFileName3(reviewFileName);
							review.setReviewFilePath3(reviewFilePath);
							review.setReviewFileRename3(reviewFileRename);
							break;
						}
					}else {
						switch (i) {
						case 0:
							review.setReviewFileName1(befReview.getReviewFileName1());
							review.setReviewFilePath1(befReview.getReviewFilePath1());
							review.setReviewFileRename1(befReview.getReviewFileRename1());
							break;
						case 1:
							review.setReviewFileName2(befReview.getReviewFileName2());
							review.setReviewFilePath2(befReview.getReviewFilePath2());
							review.setReviewFileRename2(befReview.getReviewFileRename2());
							break;
						case 2:
							review.setReviewFileName3(befReview.getReviewFileName3());
							review.setReviewFilePath3(befReview.getReviewFilePath3());
							review.setReviewFileRename3(befReview.getReviewFileRename3());
							break;
						}
						
					}
				} 
				}catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		System.out.println(review.toString());
		int result = pService.modifyProductReview(review);
		if (result>0) {
			mv.setViewName("redirect:/product/productDetail?productNo="+productNo);
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
		
	}
	//리뷰리스트출력
	@ResponseBody
	@RequestMapping(value="/product/reviewList", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String reviewListView(
			@RequestParam("productNo") Integer productNo
			,HttpServletRequest request
			) {
		List<Review> rList = pService.getReviewByProductNo(productNo);

		if(!rList.isEmpty()) {
			Gson gson = new GsonBuilder().create();
			return gson.toJson(rList);
		}
		return null;
		
	}
	//리뷰삭제
	@ResponseBody
	@RequestMapping(value="/product/reviewDelete", method=RequestMethod.GET)
	public String reviewDelete(
			@RequestParam("reviewNo") Integer reviewNo
			) {
		int result = pService.removeReview(reviewNo);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	//브랜드별 매장정보 가져오기
	@ResponseBody
	@RequestMapping(value="/product/brandStore", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String storeMapView(
			@RequestParam("brandName") String brandName
			,HttpServletRequest req, HttpServletResponse response) throws IOException {
		List<Brand> bsList = pService.getbrandStore(brandName);
//		for(int i=0; i<bsList.size();i++) {
//			
//			
//			try {
//				String addr=URLEncoder.encode(bsList.get(i).getStoreAddr(),"utf-8");
//				String api ="https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+addr;
//				
//				StringBuffer sb = new StringBuffer();
//				URL url = new URL(api);
//				HttpsURLConnection http=(HttpsURLConnection) url.openConnection();
//				http.setRequestProperty("Content-Type", "application/json");
//				http.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "zj6zbz23cl");
//				http.setRequestProperty("X-NCP-APIGW-API-KEY", "8M3TIgsO5a64vd8zz6otkUJ7ieZSipBkdD0mNcSh");
//				http.setRequestMethod("GET");
//				http.connect();
//				
//				InputStreamReader in = new InputStreamReader(http.getInputStream(),"utf-8");
//				BufferedReader br = new BufferedReader(in);
//				String line;
//				while((line=br.readLine())!=null) {
//					sb.append(line).append("\n");
//					
//				}
//				JSONParser parser = new JSONParser();
//				JSONObject jsonObject;
//				JSONObject jsonObject2;
//				JSONArray jsonArray;
//				String x="";
//				String y="";
//				
//				jsonObject = (JSONObject) parser.parse(sb.toString());
//				jsonArray = (JSONArray) jsonObject.get(bsList.get(i).getStoreAddr());
//				
//					jsonObject2=(JSONObject) jsonArray.get(i);
//					if(null!=jsonObject2.get("x")) {
//						x=jsonObject2.get("x").toString();
//					
//					if(null!=jsonObject2.get("y")) {
//						y=jsonObject2.get("y").toString();
//					}
//					
//				}
//				br.close();
//				in.close();
//				http.disconnect();
//				System.out.println(x+":"+y);
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
			
			
			
			
			
			
		

	            
		return null;
		
	            
	}
	

	
}
