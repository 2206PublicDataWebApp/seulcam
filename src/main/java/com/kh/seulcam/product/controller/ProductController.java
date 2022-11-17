package com.kh.seulcam.product.controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
	
	@Autowired
	private ProductService pService ;
	
	//top20리스트
	@RequestMapping(value="/product/top20List", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public ModelAndView top20ListView(ModelAndView mv) {
		String arrayCd="topSale";
		List<Product> pList = pService.getProductListByArrayDf(arrayCd);
		List<Integer> resultPrice = pService.discountList(pList);
		mv.addObject("resultPrice",resultPrice);
		mv.addObject("pList", pList);
		return mv;
	}
	
	//newArrival 리스트
	@RequestMapping(value="/product/newArrivalList", produces="application/json;charset=utf-8",method=RequestMethod.GET)
	public ModelAndView newArrivalListView(Model model, ModelAndView mv) {
		String arrayCd="newArrival";
		List<Product> pList = pService.getProductListByArrayDf(arrayCd);
		List<Integer> resultPrice = pService.discountList(pList);
		mv.addObject("resultPrice",resultPrice);
		mv.addObject("pList", pList);
		return mv;
	}
	

	//상품상세페이지
	@RequestMapping(value="/product/productDetail", method=RequestMethod.GET)
	public ModelAndView detailView(Model model
			,ModelAndView mv
			,@RequestParam ("productNo") Integer productNo
			,HttpSession session) {
	
		Product product = pService.getProductByNo(productNo);
		int resultPrice = pService.discountProduct(product);
		int reviewCount = pService.getReviewTotalCount(productNo);
		Member member=null;
		if(session.getAttribute("loginUser") != null) {
			member =(Member)session.getAttribute("loginUser");
			System.out.println(member.toString());
			mv.addObject("loginUser",member);
		}
		if(product!=null) {
			mv.addObject("resultPrice", resultPrice);
			mv.addObject("product", product);
			mv.addObject("reviewCount", reviewCount);
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
			for(int i=0; i>dList.size(); i++) {
				if(dList.get(i).getDetailContents().isEmpty()) {
					dList.get(i).setDetailContents("");
				}
				
			}
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
		mv.addObject("productNo",productNo);
		return mv;
	}
	//리뷰등록
	@RequestMapping(value="/product/reviewRegister", method=RequestMethod.POST)
	public ModelAndView reviewRegister(ModelAndView mv
			,@ModelAttribute Review review
			, HttpSession session
			,@RequestParam(value="myFile", required=false) List<MultipartFile> mfList
			,HttpServletRequest request
			,@RequestParam ("productNo")Integer productNo
			) {
		
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
			
			mv.setViewName("redirect:/product/myReviewList");
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
			mv.setViewName("redirect:/product/myReviewList");
		}else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	//리뷰리스트출력-상품상세페이지
	@ResponseBody
	@RequestMapping(value="/product/reviewList", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public ModelAndView reviewListView(
			@RequestParam("productNo") Integer productNo
			,HttpServletRequest request
			
			,@RequestParam(value="page", required=false) Integer page
			) {
		
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("jsonView"); 
		int currentPage = (page != null) ? page : 1;
		int totalCount = pService.getReviewTotalCount(productNo);
		int boardLimit = 5;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		// 23/5 = 4.8 + 0.9 = 5(.7)
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<Review> rList = pService.getReviewByProductNo(productNo, currentPage, boardLimit);
		System.out.println(rList.toString());
		if(!rList.isEmpty()) {
			/*
			 * Gson gson = new GsonBuilder().create(); return gson.toJson(rList);
	s		 */
			mv.addObject("totalCount", totalCount);
			mv.addObject("maxPage",maxPage);
			mv.addObject("currentPage",currentPage);
			mv.addObject("startNavi",startNavi);
			mv.addObject("endNavi",endNavi);
			mv.addObject("rList",rList);
			return mv;
			
			
		}else {
			
			return mv;
		}
		
	}
	//나의 리뷰리스트 출력-마이페이지
	
	@RequestMapping(value="/product/myReviewList", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public ModelAndView myReviewList(
			ModelAndView mv
			,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String memberId = member.getMemberId();
		
		List<Review> rList = pService.getReviewByMemberId(memberId);
		List<Product> rpList = new ArrayList<Product>();
		for(int i=0; i<rList.size(); i++) {
			System.out.println(rList.get(i).getProductNo());
			Product product = pService.getProductByNo(rList.get(i).getProductNo());
			rpList.add(product);
		}
		mv.addObject("rpList", rpList);
		mv.addObject("rList", rList);
		return mv;
		
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
	public String storeMapView(ModelAndView mv
			,@RequestParam("brandName") String brandName
			,HttpServletRequest req, HttpServletResponse response) {
		List<Brand> bsList = pService.getbrandStore(brandName);
		
		ArrayList<Float[]> coordsList =new ArrayList<Float[]>();
		
			try {
				for(int i = 0; i<bsList.size(); i++) {
					if(!Objects.isNull(bsList.get(i).getStoreAddr())) {
						String address = bsList.get(i).getStoreAddr();
						Float[] coords = new Float[2];
								coords = geoCoder(address);
						coordsList.add(coords);
						coordsList.get(i)[0]=coords[0];
						coordsList.get(i)[1]=coords[1];
						System.out.println(coordsList.get(i)[0].toString());
						System.out.println(coordsList.get(i)[1].toString());
					}else {
						Float[] coords = new Float[2];
						coordsList.add(coords);
					}
				}
					
					Map<String,Object> hMap = new HashMap<String,Object>();
					hMap.put("bsList",bsList);
					hMap.put("coordsList",coordsList);
					Gson gson = new Gson();
					return gson.toJson(hMap);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return null;
		
	            
	}
	//주소 ->위경도변환 
	public Float[] geoCoder(String address)  throws IOException {
		String addr = URLEncoder.encode(address,"utf-8");
		String api = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+addr;
		StringBuffer sb = new StringBuffer();
		
		URL url=new URL(api);
		HttpsURLConnection http = (HttpsURLConnection) url.openConnection();
		http.setRequestProperty("Content-Type", "application/json");
		http.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "zj6zbz23cl");
		http.setRequestProperty("X-NCP-APIGW-API-KEY", "8M3TIgsO5a64vd8zz6otkUJ7ieZSipBkdD0mNcSh");
		http.setRequestMethod("GET");
		http.connect();
		
		InputStreamReader in=new InputStreamReader(http.getInputStream(),"utf-8");
		BufferedReader br = new BufferedReader(in);
		 String line;
         while ((line = br.readLine()) != null) {
             sb.append(line).append("\n");
         }



         JSONParser parser = new JSONParser();
         JSONObject jsonObject;
         JSONObject jsonObject2;
         JSONArray jsonArray;
         String x = "";
         String y = "";


        // System.out.println("결과 >>>>>>>>>> : " + sb.toString());
         try {
			jsonObject = (JSONObject)parser.parse(sb.toString());
			jsonArray = (JSONArray)jsonObject.get("addresses");
			for(int i=0;i<jsonArray.size();i++){
				jsonObject2 = (JSONObject) jsonArray.get(i);
				if(null != jsonObject2.get("x")){
					x = (String) jsonObject2.get("x").toString();
				}
				if(null != jsonObject2.get("y")){
					y = (String) jsonObject2.get("y").toString();
				}
			}
			
			br.close();
			in.close();
			http.disconnect();
			
			//System.out.println("Latitude >> " + y + "Longitude >> " + x);
			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        float fx = Float.parseFloat(x);
        float fy = Float.parseFloat(y);
		Float[] coords = new Float[2];
		coords[0]=fx;
		coords[1]=fy;
       
		return coords;
		
	}

	//상품검색
	@RequestMapping(value="/product/search", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public ModelAndView search(
			ModelAndView mv
			,@RequestParam(value="keyword", required=false) String keyword
			) {
		List<Product> pList = null;
		int searchCt=0;
		if(keyword!=null) {
			System.out.println("============================="+keyword);
			pList = pService.findProductByKeyword(keyword);
			searchCt=pList.size();
			List<Integer> resultPrice = pService.discountList(pList);
			mv.addObject("resultPrice",resultPrice);
		}
		mv.addObject("pList", pList);
		mv.addObject("searchCt", searchCt);
		mv.setViewName("product/search");
		return mv;
	}
	
	
	//브랜드별 상품리스트
	@RequestMapping(value="/product/brandCategory", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public ModelAndView brandCategory(
			ModelAndView mv
			,@RequestParam(value="sortCd", required=false) String sortCdReceive
			,@RequestParam(value="brandName", required=false) String brandNameTemp
			,HttpSession session
			) {

		System.out.println("================"+brandNameTemp);
		String sortCd = (sortCdReceive==null) ? "none" : sortCdReceive;
		List<Product> pList =pService.findProductByBrand(brandNameTemp,sortCd);
		int searchCt=0;
		searchCt=pList.size();
		List<Integer> resultPrice = pService.discountList(pList);
		mv.addObject("resultPrice",resultPrice);
		mv.addObject("brandNameTemp", brandNameTemp);
		mv.addObject("pList", pList);
		mv.addObject("searchCt", searchCt);
//		session.removeAttribute("brandName");
		mv.setViewName("product/brandCategory");
		return mv;
	}
	
	//카테고리별 상품리스트
	@RequestMapping(value="/product/groupCategory", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public ModelAndView groupCategory(
			ModelAndView mv
			,@RequestParam(value="sortCd", required=false) String sortCdReceive
			,@RequestParam(value="cate_no", required=false) String cate_no
			,HttpSession session
			) {
		if(cate_no!=null) {
			session.setAttribute("cate_no", cate_no);
		}else {
			cate_no=(String) session.getAttribute("cate_no");
		}
		String sortCd = (sortCdReceive==null) ? "none" : sortCdReceive;
		List<Product> pList =pService.findProductByCategory(cate_no,sortCd);
		int searchCt=0;
		searchCt=pList.size();
		List<Integer> resultPrice = pService.discountList(pList);
		mv.addObject("resultPrice",resultPrice);
		mv.addObject("pList", pList);
		mv.addObject("searchCt", searchCt);
//		session.removeAttribute("cate_no");
		mv.setViewName("product/groupCategory");
		return mv;
	}
	
	


}
