package com.kh.seulcam.camp.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.Period;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.CampLike;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.domain.CampReview;
import com.kh.seulcam.camp.domain.CampSite;
import com.kh.seulcam.camp.service.CampServie;
import com.kh.seulcam.campBooking.domain.bookingStatusSearch;
import com.kh.seulcam.campBooking.service.CampBookingService;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.member.service.MemberService;

@Controller
public class CampController {
	
	@Autowired
	private CampServie cService;
	@Autowired
    private CampBookingService bService;
	@Autowired
    private MemberService mService;
	
	// 캠핑장 리스트 메인
	@RequestMapping(value = "/camp/campList.kh", method = RequestMethod.GET)
	public String campList(HttpServletRequest request) {
		//로그인 세션정보 추가해 줘야함 좋아요 유무 확인 -> 안해도되긴함
		return "camp/campList";
	}
	
	// 캠핑장 상세페이지
		@RequestMapping(value = "/camp/campDetail.kh", method = RequestMethod.GET)
		public ModelAndView campDetail(
				@RequestParam(value="contentId", required = false) int contentId,
				ModelAndView mv,
				HttpSession session
				) {
			try {
			    Camp camp= cService.printCampDetail(contentId);
			    CampLike campLike = new CampLike();
			    campLike.setCampId(contentId+"");
			    Integer likeCount = cService.campLikeCount(campLike);
			    Member member = (Member)session.getAttribute("loginUser");
			    Integer likeCheck = 0;
			    if(member != null) {
			        String memberId = member.getMemberId();
			        campLike.setMemberId(memberId);
			        likeCheck = cService.campLikeCount(campLike);
			    }
				
			    mv.addObject("likeCheck",likeCheck);
			    mv.addObject("likeCount",likeCount);
		        mv.addObject("camp",camp);
		        mv.setViewName("camp/campDetail");
			} catch (Exception e) {
			    e.printStackTrace();
			    mv.addObject("msg", "상세페이지 조회 실패").setViewName("common/errorPage");
			}
			return mv;
		}
	
	//캠핑장 리스트 출력
	@ResponseBody
	@RequestMapping(value = "/camp/campListShow.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campListShow(
			@ModelAttribute SearchList sList,
			HttpServletRequest request,
			HttpSession session
			) {
		try {
			List<Camp> cList = cService.printCampList(sList);
			int result = cService.printListCount(sList);
			if(!cList.isEmpty()) {
			    cList.get(0).setBlogCount(result);
			}
			for( int i = 0; i<cList.size(); i++) {
			    CampLike campLike = new CampLike();
                campLike.setCampId(cList.get(i).getContentId()+"");
                Integer likeCount = cService.campLikeCount(campLike);
                Member member = (Member)session.getAttribute("loginUser");
                Integer likeCheck = 0;
                if(member != null) {
                    String memberId = member.getMemberId();
                    campLike.setMemberId(memberId);
                    likeCheck = cService.campLikeCount(campLike);
                }
                cList.get(i).setLikeCheck(likeCheck);
                cList.get(i).setLikeCount(likeCount);
			}
			
	        return new Gson().toJson(cList);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "리스트 출력 실패");
			return "common/errorPage";
		}
	}
	
	// 캠핑장 리스트 스크롤시 비동기 다음 페이지 출력
	@ResponseBody
	@RequestMapping(value = "/camp/campListScroll.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campListScroll(
			@ModelAttribute SearchList sList,
			HttpServletRequest request,
			HttpSession session
			) {
		try {
			List<Camp> cList = cService.printCampList(sList);
			for( int i = 0; i<cList.size(); i++) {
                CampLike campLike = new CampLike();
                campLike.setCampId(cList.get(i).getContentId()+"");
                Integer likeCount = cService.campLikeCount(campLike);
                Member member = (Member)session.getAttribute("loginUser");
                Integer likeCheck = 0;
                if(member != null) {
                    String memberId = member.getMemberId();
                    campLike.setMemberId(memberId);
                    likeCheck = cService.campLikeCount(campLike);
                }
                cList.get(i).setLikeCheck(likeCheck);
                cList.get(i).setLikeCount(likeCount);
            }
			
	        return new Gson().toJson(cList);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "리스트 출력 실패");
			return "common/errorPage";
		}
	}
	
	//캠핑장 리스트 검색
	@ResponseBody
	@RequestMapping(value = "/camp/campSearch.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campSearch(
			@ModelAttribute SearchList sList,
			HttpServletRequest request
			) {
		// 도, 카테고리, 검색어, 예약유무
		return null;
	}
	
	// 캠핑장 댓글 등록
	@ResponseBody
	@RequestMapping(value = "/camp/campReviewWrite.kh", method = RequestMethod.POST )
	public String campReviewWrite(
			@ModelAttribute CampReview cReview,
			HttpServletRequest request
			) {
			try {
				int result = cService.campReviewWrite(cReview);
				return "success";
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "댓글 저장 실패");
				return "common/errorPage";
			}
	}
	
	// 캠핑장 댓글 출력
	@ResponseBody
	@RequestMapping(value = "/camp/campReviewList.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campReviewList(
			@RequestParam(value="contentId", required = false) int contentId,
			HttpServletRequest request
			) {
		try {
			List<CampReview> rList = cService.campReviewList(contentId);
			return new Gson().toJson(rList);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "댓글 출력 실패");
			return "common/errorPage";
		}
	}
	
	// 캠핑장 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/camp/campReviewRemove.kh", method = RequestMethod.POST )
	public String campReviewRemove(
			@ModelAttribute CampReview cReview,
			HttpServletRequest request
			) {
		try {
			int result = cService.removeReview(cReview);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "댓글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	// 캠핑장 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/camp/campReviewModify.kh", method = RequestMethod.POST )
	public String campReviewModify(
			@ModelAttribute CampReview cReview,
			HttpServletRequest request
			) {
		try {
			int result = cService.modifyReview(cReview);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "댓글 수정 실패");
			return "common/errorPage";
		}
	}
	// 좋아요 갯수 카운트
	@ResponseBody
    @RequestMapping(value = "/camp/campLikeCount.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
    public String campLikeCount(
            @ModelAttribute CampLike campLike,
            HttpServletRequest request) {
        try {
            Integer result = cService.campLikeCount(campLike);
            return result+"";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "좋아요 카운트 실패");
            return "common/errorPage";
        }
    }
	
	// 좋아요 체크 카운트
    @ResponseBody
    @RequestMapping(value = "/camp/campLikeCheck.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
    public String campLikeCheck(
            @ModelAttribute CampLike campLike,
            HttpServletRequest request) {
        try {
            Integer result = cService.campLikeCount(campLike);
            return result+"";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "좋아요 체크 실패");
            return "common/errorPage";
        }
    }
	
	// 좋아요 등록
	@ResponseBody
	@RequestMapping(value = "/camp/campLike.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campLikeUpdate(
	        @ModelAttribute CampLike campLike,
            HttpServletRequest request,
            HttpSession session) {
		try {
		    if(session.getAttribute("loginUser") == null) {
                return "none";
            }else{
                Member member = (Member)session.getAttribute("loginUser");
                String memberId = member.getMemberId();
                Member mOne = mService.printOneById(memberId);
                if(!memberId.equals(campLike.getMemberId())) {
                    return "abnormal";
                }
            }
		    int result2;
		    Integer result = cService.campLikeCount(campLike);
		    if(result > 0) {
		        result2 = cService.campLikeDelete(campLike);
		        System.out.println(result2);
		    }else {
		        result2 = cService.campLikeUpdate(campLike);
		    }
		    
            return result2+"";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "좋아요 체크 실패");
            return "common/errorPage";
        }
		
	}
	
	// 좋아요 삭제
	@ResponseBody
    @RequestMapping(value = "/camp/campLikeDel.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
    public String campLikeRemove(
            @ModelAttribute CampLike campLike,
            HttpServletRequest request) {
        
        
        return null;
    }
	
	//캠핑장 사이트 상세페이지
	@RequestMapping(value="/camp/campSiteDetail.kh" , method = RequestMethod.GET)
	public ModelAndView campSiteDetail(
	        @RequestParam(value="contentId", required = false) int contentId,
	        ModelAndView mv) {
	    try {
	        Camp camp= cService.printCampDetail(contentId);
	        List<CampSite> stList = cService.printSiteList(contentId);
	        
	        
	        mv.addObject("camp",camp);
	        mv.addObject("stList",stList);
	        mv.setViewName("camp/campSiteDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "상세페이지 조회 실패").setViewName("common/errorPage");
        }
	    
	    return mv;
	}
	
	//캠핑장 사이트 리스트 출력
	@ResponseBody
	@RequestMapping(value="/camp/campSiteListView.kh", produces = "application/json;charset=utf-8",method= RequestMethod.GET)
	public String campSiteListView(
	        @RequestParam(value="contentId", required = false) int contentId,
	        @RequestParam(value="firstDayJs", required = false) String firstDay,
	        @RequestParam(value="lastDayJs", required = false) String lastDay,
            ModelAndView mv) {
	    try {
	        // 날짜 String to sql.Date
//	        Date firstDay = Date.valueOf(firstDayJs);
//	        Date lastDay = Date.valueOf(lastDayJs);
	        // 날짜사이 일수 구하기
//	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//	        String Day = (format.parse(lastDayJs).getTime() - format.parse(firstDayJs).getTime())/(24*60*60)/1000+"";
//	        Period diff = Period.between(format.parse(firstDayJs),format.parse(lastDayJs));
//	        System.out.println(firstDay + " : " + lastDay);
	        //캠핑장 데이터 출력
	        List<CampSite> stList = cService.printSiteList(contentId);
	        
	        // 캠핑장 잔여 갯수 카운트
	        for(int i = 0 ; i<stList.size();i++) {
	            bookingStatusSearch bss = new bookingStatusSearch();
	            bss.setFirstDay(firstDay);
	            bss.setLastDay(lastDay);
	            bss.setSiteNo(stList.get(i).getSiteNo());
	            String result = bService.bookingCount(bss);
	            if(result != null) {
	                stList.get(i).setSiteCount(Integer.parseInt(result));
	            }
	        }
	        return new Gson().toJson(stList);
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "상세페이지 조회 실패").setViewName("common/errorPage");
        }
	    return null;
	}
	
	//캠핑장 사이트 정보 출력
	@ResponseBody
    @RequestMapping(value="/camp/campSiteDetailView.kh", produces = "application/json;charset=utf-8",method= RequestMethod.GET)
    public String campSiteDetailView(
            @RequestParam(value="siteNo", required = false) int siteNo) {
	    try {
	        CampSite campSite = cService.printSite(siteNo);
	        
	        return new Gson().toJson(campSite);
        } catch (Exception e) {
            // TODO: handle exception
        }
	    return null;
	}
}
