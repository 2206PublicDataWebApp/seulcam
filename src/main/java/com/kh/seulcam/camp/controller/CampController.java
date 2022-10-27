package com.kh.seulcam.camp.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
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
import org.springframework.ui.Model;
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
import com.kh.seulcam.camp.domain.CampSite;
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
				@RequestParam(value="contentId", required = false) int contentId,
				ModelAndView mv
				) {
			Camp camp= cService.printCampDetail(contentId);
			try {
				StringBuilder urlBuilder = new StringBuilder("https://dapi.kakao.com/v2/search/blog");
	            urlBuilder.append("?" + URLEncoder.encode("sort","UTF-8") + "=" + URLEncoder.encode("accuracy", "UTF-8")); /*페이지 번호*/
	            urlBuilder.append("&" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*한 페이지 결과 수*/
	            urlBuilder.append("&" + URLEncoder.encode("size","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*OS*/
	            urlBuilder.append("&" + URLEncoder.encode("query","UTF-8") + "=" + URLEncoder.encode(camp.getFacltNm(), "UTF-8")); /*OS*/
	            URL url = new URL(urlBuilder.toString());
	            HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization", "KakaoAK 7072f1c5ec76f11a0937d2337e6cad4e");
				con.setRequestProperty("Content-type", "application/json");
				System.out.println("Printing Response Header...\n" + "responseCode : " +con.getResponseCode());
				
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
//				System.out.println("sd>>  "+sb.toString());
//				System.out.println(objResponse.get("total_count"));
			        mv.addObject("camp",camp);
			        mv.setViewName("camp/campDetail");
			} catch (Exception e) {
			    e.printStackTrace();
			    mv.addObject("msg", "레시피조회 실패").setViewName("common/errorPage");
			}
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
			List<Camp> cList = cService.printCampList(sList);
			int result = cService.printListCount(sList);
			if(!cList.isEmpty()) {
			    cList.get(0).setBlogCount(result);
			}
           
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
			@RequestParam(value="contentId", required = false) int contentId,
			HttpServletRequest request
			) {
		try {
			List<CampReview> rList = cService.campReviewList(contentId);
			return new Gson().toJson(rList);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "댓글 출력 실패");
			return "common/errorPage";
		}
	}
	
	// 캠핑장 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/camp/campReviewRemove.kh", method = RequestMethod.POST )
	public String campReviewRemove(
			@ModelAttribute CampReview cReview,
			HttpServletRequest request
			) {
		try {
			int result = cService.removeReview(cReview);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "댓글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	// 캠핑장 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/camp/campReviewModify.kh", method = RequestMethod.POST )
	public String campReviewModify(
			@ModelAttribute CampReview cReview,
			HttpServletRequest request
			) {
		try {
			int result = cService.modifyReview(cReview);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "댓글 수정 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/camp/campLike.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campLike() {
		
		
		return null;
	}
	
	//캠핑장 사이트 상세페이지
	@RequestMapping(value="/camp/campSiteDetail.kh" , method = RequestMethod.GET)
	public ModelAndView campSiteDetail(
	        @RequestParam(value="contentId", required = false) int contentId,
	        ModelAndView mv) {
	    try {
	        Camp camp= cService.printCampDetail(contentId);
	        List<CampSite> stList = cService.printSiteList(contentId);
	        
	        
	        mv.addObject("camp",camp);
	        mv.addObject("stList",stList);
	        mv.setViewName("camp/campSiteDetail");
        } catch (Exception e) {
            // TODO: handle exception
        }
	    
	    return mv;
	}
}
