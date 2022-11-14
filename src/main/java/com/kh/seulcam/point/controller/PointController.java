package com.kh.seulcam.point.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.point.domain.Point;
import com.kh.seulcam.point.service.PointService;

@Controller
public class PointController {

	@Autowired
	private PointService pService;
	
	//포인트 내역 조회
	@RequestMapping(value="/point/list.kh",method=RequestMethod.GET)
	public ModelAndView printAllPointList(
			ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page,
			HttpSession session
			) {
		
		
		Member member=(Member) session.getAttribute("loginUser");
		String memberId=member.getMemberId();
		System.out.println(member);
		Member totalPoint=pService.printTotalPoint(memberId);
		//페이징
				int currentPage=(page !=null) ? page : 1;
				int totalCount = pService.getTotalCount(memberId);//현재 페이지 값과 전체 게시물 갯수 가져옴
				int boardLimit=9;
				int naviLimit=5;
				int maxPage;
				int startNavi;
				int endNavi;
				
				maxPage = (int)((double)totalCount/boardLimit +0.9);
				startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
				endNavi = startNavi+naviLimit -1;//for문 돌리면 중간값 나옴
				if(maxPage < endNavi) {
					endNavi=maxPage;
				}
				
		
		
		
		List<Point>pList=pService.printAllPointList(memberId,currentPage,boardLimit);
		
		
		
		mv.addObject("page",page);
		mv.addObject("urlVal","list");
		mv.addObject("maxPage",maxPage);
		mv.addObject("currentPage",currentPage);// boardlistview에 값을 보내줘야한다
		mv.addObject("startNavi",startNavi);
		mv.addObject("endNavi",endNavi);
		
		mv.addObject("totalPoint",totalPoint);
		mv.addObject("member",member);
		mv.addObject("pList",pList);
		mv.setViewName("point/pointList");
		
		
		
		return mv;
		
		
	}
	
}
