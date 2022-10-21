package com.kh.seulcam.product.controller;

import java.io.File;
import java.util.List;
import java.util.regex.Matcher;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.seulcam.product.domain.Detail;
import com.kh.seulcam.product.domain.Product;
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
			,@RequestParam ("productNo") Integer productNo ) {
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
			@RequestParam("productNo") Integer productNo) {		
		List<Detail> dList = pService.printAllDetailInfo(productNo);
		//System.out.println(dList.toString());
		if(!dList.isEmpty()) {
			Gson gson = new GsonBuilder().create();
			return gson.toJson(dList);
		}
		return null;
	}
	
	
	

	@RequestMapping(value="/product/reviewRegist", method=RequestMethod.GET)
	public String reviewRegister(Model model) {
		return "product/reviewRegist";
	}
	

	
}
