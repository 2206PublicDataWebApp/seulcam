package com.kh.seulcam.camp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;
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
		public String campDetail(
				@RequestParam(value="contentId", required = false) String contentId
				) {
			System.out.println(contentId);
			return "camp/campDetail";
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
	
	
	
	@ResponseBody
	@RequestMapping(value = "/campLike.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campLike() {
		
		
		return null;
	}
}
