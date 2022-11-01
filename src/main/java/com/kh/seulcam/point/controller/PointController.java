package com.kh.seulcam.point.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
			HttpSession session
			) {
		Member member=(Member) session.getAttribute("loginUser");
		String memberId=member.getMemberId();
		System.out.println(member);
		Member totalPoint=pService.printTotalPoint(memberId);
		List<Point>pList=pService.printAllPointList(memberId);
		
		mv.addObject("totalPoint",totalPoint);
		mv.addObject("member",member);
		mv.addObject("pList",pList);
		mv.setViewName("point/pointList");
		
		
		
		return mv;
		
		
	}
	
}
