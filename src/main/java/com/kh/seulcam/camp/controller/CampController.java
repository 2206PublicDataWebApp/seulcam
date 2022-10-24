package com.kh.seulcam.camp.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.domain.CampReview;
import com.kh.seulcam.camp.service.CampServie;

@Controller
public class CampController {
	
	@Autowired
	private CampServie cService;
	
	// 캠핑장 리스트 메인
	@RequestMapping(value = "/camp/campList.kh", method = RequestMethod.GET)
	public String campList(HttpServletRequest request) {
		//로그인 세션정보 추가해 줘야함 좋아요 유무 확인 -> 안해도되긴함
		return "camp/campList";
	}
	
	// 캠핑장 상세페이지
		@RequestMapping(value = "/camp/campDetail.kh", method = RequestMethod.GET)
		public ModelAndView campDetail(
				@RequestParam(value="contentId", required = false) String contentId,
				ModelAndView mv
				) {
			Camp camp= cService.printCampDetail(contentId);
			try {
				
				String apiURL = "https://dapi.kakao.com/v2/search/blog?sort=accuracy&page=1&size=10&query="+camp.getFacltNm();
				URL url = new URL(apiURL);
				HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization", "KakaoAK 7072f1c5ec76f11a0937d2337e6cad4e");
				con.setRequestProperty("Content-type", "application/json");
				System.out.println("Printing Response Header...\n" + con.getResponseCode());
				
				int responseCode = con.getResponseCode(); //
				BufferedReader br;
				if(responseCode==200) 
				{ // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8")); 
				} 
				else 
				{  // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
				}
				String inputLine;
				StringBuffer sb = new StringBuffer();
				while ((inputLine = br.readLine()) != null) 
				{
					sb.append(inputLine);
				}
				br.close();
				 JSONParser parser = new JSONParser();
			        // json data 최상단
			        JSONObject objmain = (JSONObject) parser.parse(sb.toString());
			     // json.response
			        JSONObject objResponse = (JSONObject) parser.parse(objmain.get("meta").toString());
				System.out.println("sd>>  "+sb.toString());
				System.out.println(objResponse.get("total_count"));
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			mv.addObject("camp",camp);
			mv.setViewName("camp/campDetail");
			return mv;
		}
	
	//캠핑장 리스트 출력
	@ResponseBody
	@RequestMapping(value = "/camp/campListShow.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campListShow(
			@ModelAttribute SearchList sList,
			HttpServletRequest request
			) {
		try {
			System.out.println(sList);
			List<Camp> cList = cService.printCampList(sList);
	        return new Gson().toJson(cList);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "리스트 출력 실패");
			return "common/errorPage";
		}
	}
	
	// 캠핑장 리스트 스크롤시 비동기 다음 페이지 출력
	@ResponseBody
	@RequestMapping(value = "/camp/campListScroll.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campListScroll(
			@ModelAttribute SearchList sList,
			HttpServletRequest request
			) {
		try {
			List<Camp> cList = cService.printCampList(sList);
			
	        return new Gson().toJson(cList);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "리스트 출력 실패");
			return "common/errorPage";
		}
	}
	
	//캠핑장 리스트 검색
	@ResponseBody
	@RequestMapping(value = "/camp/campSearch.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campSearch(
			@ModelAttribute SearchList sList,
			HttpServletRequest request
			) {
		// 도, 카테고리, 검색어, 예약유무
		return null;
	}
	
	// 캠핑장 댓글 등록
	@ResponseBody
	@RequestMapping(value = "/camp/campReviewWrite.kh", method = RequestMethod.POST )
	public String campReviewWrite(
			@ModelAttribute CampReview cReview,
			HttpServletRequest request
			) {
			try {
				int result = cService.campReviewWrite(cReview);
				return "success";
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "댓글 저장 실패");
				return "common/errorPage";
			}
	}
	
	// 캠핑장 댓글 출력
	@ResponseBody
	@RequestMapping(value = "/camp/campReviewList.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campReviewList(
			@RequestParam(value="contentId", required = false) String contentId,
			HttpServletRequest request
			) {
		try {
			List<CampReview> rList = cService.campReviewList(contentId);
			System.out.println(rList);
			return new Gson().toJson(rList);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "댓글 출력 실패");
			return "common/errorPage";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/camp/campLike.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campLike() {
		
		
		return null;
	}
}
