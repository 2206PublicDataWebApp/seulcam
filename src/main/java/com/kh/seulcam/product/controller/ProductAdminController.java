package com.kh.seulcam.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.kh.seulcam.product.domain.Brand;
import com.kh.seulcam.product.domain.Product;
import com.kh.seulcam.product.service.ProductService;

@Controller
public class ProductAdminController {
	@Autowired
	private ProductService pService ;
	
	//브랜드등록 폼
	@RequestMapping(value="/admin/brandRegistView", method=RequestMethod.GET)
	public String brandRegisterView(Model model) {
		return "admin/brandRegist";
	}
	//브랜드 등록
	@RequestMapping(value="/admin/brandRegister", method=RequestMethod.POST)
	public String brandRegister(ModelAndView mv
			,@ModelAttribute Brand brand) {
		System.out.println(brand.toString());
		int result = pService.registerbrand(brand);
		if(result>0) {			
			
			return "redirect:/admin/productList";
			
		}else {
			return "/common/errorPage";
		}
	}
	//상품등록 폼
	@RequestMapping(value="/admin/productRegist", method=RequestMethod.GET)
	public ModelAndView productRegisterView(ModelAndView mv) {
		List<HashMap> sNameList=pService.getTotalStoreName();
//		System.out.println(sNameList.get(2).values());
		if(!sNameList.isEmpty()) {
			mv.addObject("sNameList", sNameList);
		}
		return mv;
	
	}
	//상품등록
	@RequestMapping(value="/admin/productRegister", method=RequestMethod.POST)
	public ModelAndView productRegister(ModelAndView mv
			,@ModelAttribute Product product
			,@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			,HttpServletRequest request) {
		

			
			try {
				String mainFileName = uploadFile.getOriginalFilename();
				if(!mainFileName.equals("")){
					String root=request.getSession().getServletContext().getRealPath("resources");
					String savePath = root+"\\puploadFiles";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String mainFileRename =sdf.format(new Date(System.currentTimeMillis()))+"수정."
						+mainFileName.substring(mainFileName.lastIndexOf(".")+1);
					File file = new File(savePath);
					if(!file.exists()) {
						file.mkdir();
					}
					uploadFile.transferTo(new File(savePath+"\\"+mainFileRename));
					String mainFilePath=savePath+"\\"+mainFileRename;
					product.setMainFileName(mainFileName);
					product.setMainFileRename(mainFileRename);
					product.setMainFilePath(mainFilePath);
				}	
				int result = pService.registerProduct(product);
				mv.setViewName("redirect:/admin/productList");
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			
			
			return mv;
		
		
	}
	
	@RequestMapping(value="/admin/productList", method=RequestMethod.GET)
	public String findAllProduct(Model model) {
		return "admin/productList";
	}
}
