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
			) {
		System.out.println(detail.getdList().toString());
		
				//폴더에 파일 일단 삭제 + 수정전 객체 파일 리셋
				if(product.getMainFileName()!=null) {
					File delFile = new File(product.getMainFilePath());
					delFile.delete();
					product.setMainFileName(null);
					product.setMainFilePath(null);
					product.setMainFileRename(null);
				}
				if(detail.getdList().get(0).getDetailFileName()!=null) {
					File delFile = new File(detail.getdList().get(0).getDetailFileRename());
					delFile.delete();
					detail.getdList().get(0).setDetailFileName(null);
					detail.getdList().get(0).setDetailFilePath(null);
					detail.getdList().get(0).setDetailFileRename(null);
					
				}
				if(detail.getdList().get(1).getDetailFileName()!=null) {
					File delFile = new File(detail.getdList().get(1).getDetailFileRename());
					delFile.delete();
					detail.getdList().get(1).setDetailFileName(null);
					detail.getdList().get(1).setDetailFilePath(null);
					detail.getdList().get(1).setDetailFileRename(null);
					
				}
				System.out.println(product);
				System.out.println(detail.getdList().toString());
//				//수정파일 다시 업로드
//				try {
//					for(int i=0; i<mfList.size(); i++) {			
//						String root=request.getSession().getServletContext().getRealPath("resources");
//						String savePath = root+"\\puploadFiles";
//						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//						
//						String reviewFileName=mfList.get(i).getOriginalFilename();
//						String reviewFileRename =sdf.format(new Date(System.currentTimeMillis()))+"review"+i+"."
//								+reviewFileName.substring(reviewFileName.lastIndexOf(".")+1);
//						if(!reviewFileName.equals("")) {
//							File file = new File(savePath);
//								if(!file.exists()) {
//									file.mkdir();
//								}
//								mfList.get(i).transferTo(new File(savePath+"\\"+reviewFileRename));
//								String reviewFilePath=savePath+"\\"+reviewFileRename;
//								switch (i) {
//								case 0:
//									review.setReviewFileName1(reviewFileName);
//									review.setReviewFilePath1(reviewFilePath);
//									review.setReviewFileRename1(reviewFileRename);
//									break;
//								case 1:
//									review.setReviewFileName2(reviewFileName);
//									review.setReviewFilePath2(reviewFilePath);
//									review.setReviewFileRename2(reviewFileRename);
//									break;
//								case 2:
//									review.setReviewFileName3(reviewFileName);
//									review.setReviewFilePath3(reviewFilePath);
//									review.setReviewFileRename3(reviewFileRename);
//									break;
//								}
//							}else {
//								switch (i) {
//								case 0:
//									review.setReviewFileName1(befReview.getReviewFileName1());
//									review.setReviewFilePath1(befReview.getReviewFilePath1());
//									review.setReviewFileRename1(befReview.getReviewFileRename1());
//									break;
//								case 1:
//									review.setReviewFileName2(befReview.getReviewFileName2());
//									review.setReviewFilePath2(befReview.getReviewFilePath2());
//									review.setReviewFileRename2(befReview.getReviewFileRename2());
//									break;
//								case 2:
//									review.setReviewFileName3(befReview.getReviewFileName3());
//									review.setReviewFilePath3(befReview.getReviewFilePath3());
//									review.setReviewFileRename3(befReview.getReviewFileRename3());
//									break;
//								}
//								
//							}
//						} 
//						}catch (IllegalStateException e) {
//							// TODO Auto-generated catch block
//							e.printStackTrace();
//						} catch (IOException e) {
//							// TODO Auto-generated catch block
//							e.printStackTrace();
//						}
//				System.out.println(review.toString());
//				int result = pService.modifyProductReview(review);
//				if (result>0) {
//					mv.setViewName("redirect:/product/productDetail?productNo="+productNo);
//				}else {
//					mv.setViewName("errorPage");
//				}
		mv.setViewName("redirect:/admin/productList");
		
		
		return mv;
		
	}
}
