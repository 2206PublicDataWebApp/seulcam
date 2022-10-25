package com.kh.seulcam.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.kh.seulcam.product.domain.Brand;
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
			
			return "redirect:/product/productDetail?productNo="+productNo;
		}else {
			return "errorPage";
		}
			
		
	
	}
	//리뷰리스트출력
	@ResponseBody
	@RequestMapping(value="/product/reviewList", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String reviewListView(
			@RequestParam("productNo") Integer productNo) {
		List<Review> rList = pService.getReviewByProductNo(productNo);
		System.out.println(rList);
		if(!rList.isEmpty()) {
			Gson gson = new GsonBuilder().create();
			return gson.toJson(rList);
		}
		return null;
		
	}
	
	//브랜드별 매장정보 가져오기
	@ResponseBody
	@RequestMapping(value="/product/brandStore", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String storeMapView(
			@RequestParam("brandName") String brandName
			,HttpServletRequest req, HttpServletResponse response) throws IOException {
		Brand brand = pService.getbrandStore(brandName);
		
		
		String location = req.getParameter("addr");
        
	      Geocoder geocoder = new Geocoder();
	      // setAddress : 변환하려는 주소 (경기도 성남시 분당구 등)
	      // setLanguate : 인코딩 설정
	      GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("ko").getGeocoderRequest();
	      GeocodeResponse geocoderResponse;
	      geocoderResponse = geocoder.geocode(geocoderRequest);
	            if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {
	                  GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
	                  LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();
	                                           
	                  Float[] coords = new Float[2];
	                  coords[0] = latitudeLongitude.getLat().floatValue();
	                  coords[1] = latitudeLongitude.getLng().floatValue();
	                  String coordStr = Float.toString(coords[0])+"&"+Float.toString(coords[1]);
	                  
	                  response.setCharacterEncoding("UTF-8");
	              response.setContentType("text/xml");
	              response.getWriter().write(coordStr); // 응답결과반환
	            }
		return null;
		
	            
	}
	

	
}
