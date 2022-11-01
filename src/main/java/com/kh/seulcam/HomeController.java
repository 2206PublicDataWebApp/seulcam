package com.kh.seulcam;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.HomeController;
import com.kh.seulcam.product.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService pService ;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session) {
		List<HashMap> sNameList=pService.getTotalStoreName();
		session.setAttribute("sNameList", sNameList);
		if(!sNameList.isEmpty()) {
			model.addAttribute("sNameList", sNameList);
		}
		return "index";
	}
}