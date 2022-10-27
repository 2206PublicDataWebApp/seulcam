package com.kh.seulcam.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.kh.seulcam.product.domain.Detail;
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
	@ResponseBody
	@RequestMapping(value="/admin/brandRegister", method=RequestMethod.POST)
	public String brandRegister(ModelAndView mv
			,@ModelAttribute Brand brand
			,HttpServletResponse response) throws IOException {
		//System.out.println(brand.toString());
		int result = pService.registerbrand(brand);
		if(result>0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('브랜드 등록되었습니다.'); location.href='/admin/productList' </script>");
			out.flush();
			return null;			
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
	public String productRegister(ModelAndView mv
			,@ModelAttribute Product product
			,@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			,@ModelAttribute Detail detail
			,HttpServletRequest request
			,HttpServletResponse response
			) {
			//System.out.println(detail.getdList().toString());
			
			try {
				String mainFileName = uploadFile.getOriginalFilename();
				if(!mainFileName.equals("")){
					String root=request.getSession().getServletContext().getRealPath("resources");
					String savePath = root+"\\puploadFiles";
					System.out.println(savePath);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String mainFileRename =sdf.format(new Date(System.currentTimeMillis()))+product.getProductName()+"메인사진."
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
				int productNo = pService.registerProduct(product);
				
				for(int i=0; i<detail.getdList().size(); i++) {
					Detail dt=detail.getdList().get(i);
					dt.setProductNo(productNo);
					String detailFileName = dt.getDetailFileNameMPF().getOriginalFilename();
					if(!detailFileName.equals("")){
						String root=request.getSession().getServletContext().getRealPath("resources");
						String savePath = root+"\\puploadFiles";
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						String detailFileRename =sdf.format(new Date(System.currentTimeMillis()))+
								product.getProductName()+"상세사진("+(i+1)+")."
							+detailFileName.substring(detailFileName.lastIndexOf(".")+1);
						File file = new File(savePath);
						if(!file.exists()) {
							file.mkdir();
						}
						uploadFile.transferTo(new File(savePath+"\\"+detailFileRename));
						String detailFilePath=savePath+"\\"+detailFileRename;
						dt.setDetailFileName(detailFileName);
						dt.setDetailFilePath(detailFilePath);
						dt.setDetailFileRename(detailFileRename);

					}
					int result = pService.registerProductDetail(dt);
				}
				//System.out.println(detail.getdList().toString());
				//System.out.println(product.toString());
				if(productNo>0) {
					
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('상품 등록되었습니다.'); location.href='/admin/productList' </script>");
					out.flush();
		
				}
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			
			
			return null;
		
		
	}
	//전체 상품리스트
	@RequestMapping(value="/admin/productList", method=RequestMethod.GET)
	public ModelAndView findAllProduct(ModelAndView mv) {
		List<Product> pList = pService.getTotalProduct();
		if(!pList.isEmpty()) {
			mv.addObject("pList", pList);
		}
		return mv;
	}
	
	@RequestMapping(value="/admin/productDetail", method=RequestMethod.GET)
	public ModelAndView productDetailAdmin(ModelAndView mv
			,@RequestParam("productNo") Integer productNo) {
		List<HashMap>sNameList = pService.getTotalStoreName();
		Product product =pService.getProductByNo(productNo);
		List<Detail> dList=pService.printAllDetailInfo(productNo);
		mv.addObject("dList", dList);
		if(!sNameList.isEmpty()&&product!=null) {
			mv.addObject("sNameList", sNameList);
			mv.addObject("product", product);
		}else {
			mv.setViewName("common/errorPage");
		}
	
		return mv;
		
	}
}
