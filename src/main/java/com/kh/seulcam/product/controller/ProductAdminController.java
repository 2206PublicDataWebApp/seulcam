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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.product.domain.Brand;
import com.kh.seulcam.product.domain.Detail;
import com.kh.seulcam.product.domain.Product;
import com.kh.seulcam.product.domain.Review;
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
				String mainFileRename =sdf.format(new Date(System.currentTimeMillis()))+product.getProductNo()+"main."
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
							product.getProductNo()+"detail"+(i+1)+"."
							+detailFileName.substring(detailFileName.lastIndexOf(".")+1);
					File file = new File(savePath);
					if(!file.exists()) {
						file.mkdir();
					}
					dt.getDetailFileNameMPF().transferTo(new File(savePath+"\\"+detailFileRename));
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
		String sortCd = "";
		List<Product> pList = pService.getTotalProduct(sortCd);
		if(!pList.isEmpty()) {
			mv.addObject("pList", pList);
		}
		return mv;
	}
	//상품상세 + 수정화면
	@RequestMapping(value="/admin/productDetail", method=RequestMethod.GET)
	public ModelAndView productDetailAdmin(ModelAndView mv
			,@RequestParam("productNo") Integer productNo

			) {
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

	@RequestMapping(value="/admin/productModify", method=RequestMethod.POST)
	public ModelAndView productModify(ModelAndView mv
			,@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			,@ModelAttribute Product product
			,@ModelAttribute Detail detail
			,HttpServletRequest request
			,HttpServletResponse response
			) {
		System.out.println(detail.getdList().toString());
		Product befProduct = pService.getProductByNo(product.getProductNo());
		List<Detail> befDList = pService.printAllDetailInfo(product.getProductNo());
		//폴더에 파일 일단 삭제 + 수정전 객체 파일 리셋
		if(product.getMainFileName()!=null) {
			File delFile = new File(befProduct.getMainFilePath());
			delFile.delete();
			befProduct.setMainFileName(null);
			befProduct.setMainFilePath(null);
			befProduct.setMainFileRename(null);
		}
		if(detail.getdList().get(0).getDetailFileName()!=null) {
			File delFile = new File(befDList.get(0).getDetailFileRename());
			delFile.delete();
			pService.removeDetail(befDList.get(0));
			befDList.get(0).setDetailFileName(null);
			befDList.get(0).setDetailFilePath(null);
			befDList.get(0).setDetailFileRename(null);

		}
		if(detail.getdList().get(1).getDetailFileName()!=null) {
			File delFile = new File(befDList.get(1).getDetailFileRename());
			delFile.delete();
			pService.removeDetail(befDList.get(0));
			befDList.get(1).setDetailFileName(null);
			befDList.get(1).setDetailFilePath(null);
			befDList.get(1).setDetailFileRename(null);

		}
		
		//수정파일 다시 업로드
		try {
		
				String mainFileName=uploadFile.getOriginalFilename();
				if(!mainFileName.equals("")){	
					String root=request.getSession().getServletContext().getRealPath("resources");
					String savePath = root+"\\puploadFiles";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	
					String mainFileRename =sdf.format(new Date(System.currentTimeMillis()))
							+product.getProductNo()+"mainUpdate."+mainFileName.substring(mainFileName.lastIndexOf(".")+1);
	
					File file = new File(savePath);
					if(!file.exists()) {
						file.mkdir();
					}
					uploadFile.transferTo(new File(savePath+"\\"+mainFileRename));
					String mainFilePath=savePath+"\\"+mainFileRename;
					product.setMainFileName(mainFileName);
					product.setMainFilePath(mainFilePath);
					product.setMainFileRename(mainFileRename);
				}
				
				else {
					product.setMainFileName(befProduct.getMainFileName());
					product.setMainFilePath(befProduct.getMainFilePath());
					product.setMainFileRename(befProduct.getMainFileRename());
			}
			int result = pService.modifyProduct(product);
			for(int i=0; i<detail.getdList().size(); i++) {
				Detail dt =detail.getdList().get(i);
				String detailFileName = dt.getDetailFileNameMPF().getOriginalFilename();
				System.out.println("=========================="+detailFileName);
				if(!detailFileName.equals("")){
					String root=request.getSession().getServletContext().getRealPath("resources");
					String savePath = root+"\\puploadFiles";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String detailFileRename =sdf.format(new Date(System.currentTimeMillis()))+
							product.getProductNo()+"detailUpdate"+(i+1)+"."
							+detailFileName.substring(detailFileName.lastIndexOf(".")+1);
					
					File file = new File(savePath);
					if(!file.exists()) {
						file.mkdir();
					}
					dt.getDetailFileNameMPF().transferTo(new File(savePath+"\\"+detailFileRename));
					String detailFilePath=savePath+"\\"+detailFileRename;
					dt.setProductNo(product.getProductNo());
					dt.setDetailFileName(detailFileName);
					dt.setDetailFilePath(detailFilePath);
					dt.setDetailFileRename(detailFileRename);
				}
					else {
						if(!befDList.isEmpty()) {
							dt.setProductNo(product.getProductNo());
							dt.setDetailFileName(befDList.get(i).getDetailFileName());
							dt.setDetailFilePath(befDList.get(i).getDetailFilePath());
							dt.setDetailFileRename(befDList.get(i).getDetailFileRename());
						}
						
					}
				
				int result2 =pService.registerProductDetail(dt);
			
			} 
			if(result >0 ) {
				mv.setViewName("redirect:/admin/productList");
			}else {
				mv.setViewName("errorPage");
			}
		}catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		


		return mv;

	}
	@RequestMapping(value="/admin/productDelete", method=RequestMethod.GET)
	public String productDelete(
			@RequestParam("productNo") Integer productNo) {
		int result = pService.removeProduct(productNo);
		if(result > 0) {
			return "redirect:/admin/productList";
		}else {
			return "common/errorPage";
		}
		
	}


	//전체리뷰리스트

	@RequestMapping(value="/admin/reviewList", method=RequestMethod.GET)
	public ModelAndView allReviewList(ModelAndView mv) {
		List<Review> rList = pService.getAllReview();
		if(!rList.isEmpty()) {
			mv.addObject("rList",rList);

		}else {
			mv.setViewName("common/errorPage");
		}
		return mv;

	}
	//리뷰선택삭제
	@ResponseBody
	@RequestMapping(value="/admin/reviewCheckDelete", produces="application/json;charset=utf-8", method=RequestMethod.POST)
	public String reviewDeleteCheck(
			@RequestParam(value="rNo[]") List<Integer>rNo
			) {
		System.out.println(rNo.toString());
		int result=0;
		for (int i = 0; i < rNo.size(); i++) {
			int reviewNo = rNo.get(i);
			result=pService.removeReview(reviewNo);

		}
		System.out.println("======================="+result);
		if(result>0) {
			return "success" ;
		}else {
			return"error";
		}

	}

	//브랜드 스토어 리스트
	@RequestMapping(value="/admin/brandList", method=RequestMethod.GET)
	public ModelAndView allBrandList(ModelAndView mv) {
		List<Brand> bList = pService.getAllBrand();
		if(!bList.isEmpty()) {
			mv.addObject("bList",bList);

		}else {
			mv.setViewName("common/errorPage");
		}
		return mv;

	}
	//스토어선택삭제
	@ResponseBody
	@RequestMapping(value="/admin/brandCheckDelete", produces="application/json;charset=utf-8", method=RequestMethod.POST)
	public String brandDeleteCheck(
			@RequestParam(value="snList[]") List<Integer>snList
			) {
		System.out.println(snList.toString());
		int result=0;
		for (int i = 0; i < snList.size(); i++) {
			int storeNo = snList.get(i);
			result = pService.removeStore(storeNo);

		}
		if(result>0) {
			return "success" ;
		}else {
			return"error";
		}

	}

}
