package com.kh.seulcam.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

	@RequestMapping(value="/product/top20List", method=RequestMethod.GET)
	public String top20ListView(Model model) {
		return "product/top20List";
	}
	
	@RequestMapping(value="/product/productDetail", method=RequestMethod.GET)
	public String detailView(Model model) {
		return "product/productDetail";
	}

	@RequestMapping(value="/product/reviewRegist", method=RequestMethod.GET)
	public String reviewRegister(Model model) {
		return "product/reviewRegist";
	}
	

	
}
