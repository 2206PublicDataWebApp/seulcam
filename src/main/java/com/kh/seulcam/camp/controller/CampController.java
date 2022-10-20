package com.kh.seulcam.camp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.service.CampServie;

@Controller
public class CampController {
	
	@Autowired
	private CampServie cService;
	
	@RequestMapping(value = "/camp/campList.kh", method = RequestMethod.GET)
	public String campList() {
		return "camp/campList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/camp/campListShow.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campListShow() {
		try {
			int page = 0;
			List<Camp> cList = cService.printCampList(page);
			System.out.println(cList);
	        return new Gson().toJson(cList);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/camp/campListScroll.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campListScroll() {
		try {
			int page = 0;
			List<Camp> cList = cService.printCampList(page);
			System.out.println(cList);
	        return new Gson().toJson(cList);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/campLike.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campLike() {
		
		
		return null;
	}
}
