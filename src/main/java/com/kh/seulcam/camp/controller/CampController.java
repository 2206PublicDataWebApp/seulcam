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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    private static final Logger logger = LoggerFactory.getLogger(CampController.class);

    // ????????? ????????? ??????
    @RequestMapping(value = "/camp/campList.kh", method = RequestMethod.GET)
    public String campList(HttpServletRequest request) {
        // ????????? ???????????? ????????? ????????? ????????? ?????? ?????? -> ??????????????????
        return "camp/campList";
    }

    // ????????? ???????????????
    @RequestMapping(value = "/camp/campDetail.kh", method = RequestMethod.GET)
    public ModelAndView campDetail(
            @RequestParam(value = "contentId", required = false) int contentId,
            ModelAndView mv,
            HttpSession session) {
        try {
            // ?????? ?????????
            Camp camp = cService.printCampDetail(contentId);
            // ?????? ??????
            String starAvg = cService.printStarAvg(contentId);
            if (starAvg == null) {
                starAvg = "0.0";
            }
            // ????????? ??????
            CampLike campLike = new CampLike();
            campLike.setCampId(contentId + "");
            // ????????? ????????????
            Integer likeCount = cService.campLikeCount(campLike);
            Member member = (Member) session.getAttribute("loginUser");
            Integer likeCheck = 0;
            int walking =0;
            // ?????? ?????? ??????

            Integer minPrice;
            if (camp.getRegistAvi() == "Y") {
                minPrice = cService.campMinPrice(contentId);
                camp.setMinPrice(minPrice);
            }

            // ?????? ?????? ??? ????????? ??????
            if (member != null) {
                String memberId = member.getMemberId();
                campLike.setMemberId(memberId);
                walking = cService.countWalking(contentId,memberId);
            }
            mv.addObject("walking", walking);
            mv.addObject("starAvg", starAvg);
            mv.addObject("likeCheck", likeCheck);
            mv.addObject("likeCount", likeCount);
            mv.addObject("camp", camp);
            mv.setViewName("camp/campDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "??????????????? ?????? ??????").setViewName("common/errorPage");
        }
        return mv;
    }

    // ????????? ????????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/campListShow.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    public String campListShow(
            @ModelAttribute SearchList sList,
            HttpServletRequest request,
            HttpSession session) {
        try {
            List<Camp> cList = cService.printCampList(sList);
            int result = cService.printListCount(sList);
            if (!cList.isEmpty()) {
                cList.get(0).setBlogCount(result);
            }
            Member member = (Member) session.getAttribute("loginUser");
            for (int i = 0; i < cList.size(); i++) {
                // ????????? ?????????
                CampLike campLike = new CampLike();
                campLike.setCampId(cList.get(i).getContentId() + "");
                // ????????? ??????
                Integer likeCount = cService.campLikeCount(campLike);
                Integer likeCheck = 0;
                int walking =0;
                if (member != null) {
                    String memberId = member.getMemberId();
                    campLike.setMemberId(memberId);
                    likeCheck = cService.campLikeCount(campLike);
                    walking = cService.countWalking(cList.get(i).getContentId(),memberId);
                }
                Integer minPrice = cService.campMinPrice(cList.get(i).getContentId());
                ;
                if (minPrice == null) {
                    minPrice = 0;
                }
                // ????????????
                String starAvg = cService.printStarAvg(cList.get(i).getContentId());
                if (starAvg == null) {
                    starAvg = "0";
                }
                cList.get(i).setWalking(walking);
                cList.get(i).setMinPrice(minPrice);
                cList.get(i).setStarAvg(starAvg);
                cList.get(i).setLikeCheck(likeCheck);
                cList.get(i).setLikeCount(likeCount);
            }

            return new Gson().toJson(cList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "????????? ?????? ??????");
            return "common/errorPage";
        }
    }

    // ????????? ????????? ???????????? ????????? ?????? ????????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/campListScroll.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    public String campListScroll(
            @ModelAttribute SearchList sList,
            HttpServletRequest request,
            HttpSession session) {
        try {
            List<Camp> cList = cService.printCampList(sList);
            Member member = (Member) session.getAttribute("loginUser");
            for (int i = 0; i < cList.size(); i++) {
                CampLike campLike = new CampLike();
                campLike.setCampId(cList.get(i).getContentId() + "");
                Integer likeCount = cService.campLikeCount(campLike);
                Integer likeCheck = 0;
                int walking =0;
                if (member != null) {
                    String memberId = member.getMemberId();
                    campLike.setMemberId(memberId);
                    likeCheck = cService.campLikeCount(campLike);
                    walking = cService.countWalking(cList.get(i).getContentId(),memberId);
                }
                Integer minPrice = cService.campMinPrice(cList.get(i).getContentId());
                if (minPrice == null) {
                    minPrice = 0;
                }
                String starAvg = cService.printStarAvg(cList.get(i).getContentId());
                if (starAvg == null) {
                    starAvg = "0";
                }
                cList.get(i).setWalking(walking);
                cList.get(i).setMinPrice(minPrice);
                cList.get(i).setStarAvg(starAvg);
                cList.get(i).setLikeCheck(likeCheck);
                cList.get(i).setLikeCount(likeCount);
            }

            return new Gson().toJson(cList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "????????? ?????? ??????");
            return "common/errorPage";
        }
    }

    // ????????? ????????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/campSearch.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    public String campSearch(
            @ModelAttribute SearchList sList,
            HttpServletRequest request) {
        // ???, ????????????, ?????????, ????????????
        return null;
    }

    // ????????? ?????? ?????? ?????????
    @ResponseBody
    @RequestMapping(value = "/camp/campStarAvg.kh", method = RequestMethod.GET)
    public String campStarAvg(
            @RequestParam(value = "contentId", required = false) int contentId,
            HttpServletRequest request) {
        try {
            String starAvg = cService.printStarAvg(contentId);
            if (starAvg == null) {
                starAvg = "0.0";
            }

            return starAvg;
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "?????? ?????? ??????");
            return "common/errorPage";
        }
    }

    // ????????? ?????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/campReviewWrite.kh", method = RequestMethod.POST)
    public String campReviewWrite(
            @ModelAttribute CampReview cReview,
            HttpServletRequest request) {
        try {
            int result = cService.campReviewWrite(cReview);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "?????? ?????? ??????");
            return "common/errorPage";
        }
    }

    // ????????? ?????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/campReviewList.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    public String campReviewList(
            @RequestParam(value = "contentId", required = false) int contentId,
            HttpServletRequest request) {
        try {
            List<CampReview> rList = cService.campReviewList(contentId);
            return new Gson().toJson(rList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "?????? ?????? ??????");
            return "common/errorPage";
        }
    }

    // ????????? ?????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/campReviewRemove.kh", method = RequestMethod.POST)
    public String campReviewRemove(
            @ModelAttribute CampReview cReview,
            HttpServletRequest request) {
        try {
            int result = cService.removeReview(cReview);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "?????? ?????? ??????");
            return "common/errorPage";
        }
    }

    // ????????? ?????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/campReviewModify.kh", method = RequestMethod.POST)
    public String campReviewModify(
            @ModelAttribute CampReview cReview,
            HttpServletRequest request) {
        try {
            int result = cService.modifyReview(cReview);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "?????? ?????? ??????");
            return "common/errorPage";
        }
    }

    // ????????? ?????? ?????????
    @ResponseBody
    @RequestMapping(value = "/camp/campLikeCount.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    public String campLikeCount(
            @ModelAttribute CampLike campLike,
            HttpServletRequest request) {
        try {
            Integer result = cService.campLikeCount(campLike);
            return result + "";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "????????? ????????? ??????");
            return "common/errorPage";
        }
    }

    // ????????? ?????? ?????????
    @ResponseBody
    @RequestMapping(value = "/camp/campLikeCheck.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    public String campLikeCheck(
            @ModelAttribute CampLike campLike,
            HttpServletRequest request) {
        try {
            Integer result = cService.campLikeCount(campLike);
            return result + "";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "????????? ?????? ??????");
            return "common/errorPage";
        }
    }

    // ????????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/campLike.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    public String campLikeUpdate(
            @ModelAttribute CampLike campLike,
            HttpServletRequest request,
            HttpSession session) {
        try {
            if (session.getAttribute("loginUser") == null) {
                return "none";
            } else {
                Member member = (Member) session.getAttribute("loginUser");
                String memberId = member.getMemberId();
                Member mOne = mService.printOneById(memberId);
                if (!memberId.equals(campLike.getMemberId())) {
                    return "abnormal";
                }
            }
            int result2;
            Integer result = cService.campLikeCount(campLike);
            if (result > 0) {
                result2 = cService.campLikeDelete(campLike);
                System.out.println(result2);
            } else {
                result2 = cService.campLikeUpdate(campLike);
            }

            return result2 + "";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "????????? ?????? ??????");
            return "common/errorPage";
        }

    }

    // ????????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/campLikeDel.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    public String campLikeRemove(
            @ModelAttribute CampLike campLike,
            HttpServletRequest request) {

        return null;
    }

    // ????????? ????????? ???????????????
    @RequestMapping(value = "/camp/campSiteDetail.kh", method = RequestMethod.GET)
    public ModelAndView campSiteDetail(
            @RequestParam(value = "contentId", required = false) int contentId,
            ModelAndView mv) {
        try {
            Camp camp = cService.printCampDetail(contentId);
            List<CampSite> stList = cService.printSiteList(contentId);

            mv.addObject("camp", camp);
            mv.addObject("stList", stList);
            mv.setViewName("camp/campSiteDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "??????????????? ?????? ??????").setViewName("common/errorPage");
        }

        return mv;
    }

    // ????????? ????????? ????????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/campSiteListView.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    public String campSiteListView(
            @RequestParam(value = "contentId", required = false) int contentId,
            @RequestParam(value = "firstDayJs", required = false) String firstDay,
            @RequestParam(value = "lastDayJs", required = false) String lastDay,
            ModelAndView mv) {
        try {
            // ?????? String to sql.Date
//	        Date firstDay = Date.valueOf(firstDayJs);
//	        Date lastDay = Date.valueOf(lastDayJs);
            // ???????????? ?????? ?????????
//	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//	        String Day = (format.parse(lastDayJs).getTime() - format.parse(firstDayJs).getTime())/(24*60*60)/1000+"";
//	        Period diff = Period.between(format.parse(firstDayJs),format.parse(lastDayJs));
//	        System.out.println(firstDay + " : " + lastDay);
            // ????????? ????????? ??????
            List<CampSite> stList = cService.printSiteList(contentId);

            // ????????? ?????? ?????? ?????????
            for (int i = 0; i < stList.size(); i++) {
                bookingStatusSearch bss = new bookingStatusSearch();
                bss.setFirstDay(firstDay);
                bss.setLastDay(lastDay);
                bss.setSiteNo(stList.get(i).getSiteNo());
                String result = bService.bookingCount(bss);
                if (result != null) {
                    stList.get(i).setSiteCount(Integer.parseInt(result));
                }
            }
            return new Gson().toJson(stList);
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "??????????????? ?????? ??????").setViewName("common/errorPage");
        }
        return null;
    }

    // ????????? ????????? ?????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/campSiteDetailView.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    public String campSiteDetailView(
            @RequestParam(value = "siteNo", required = false) int siteNo) {

        CampSite campSite = cService.printSite(siteNo);

        return new Gson().toJson(campSite);
    }

    // ????????? ????????? ?????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/myLikeList.kh", method = RequestMethod.GET)
    public ModelAndView myLikeList(ModelAndView mv,
            HttpServletRequest request,
            HttpSession session) {
        if (session.getAttribute("loginUser") == null) {
            request.setAttribute("msg", "???????????? ????????? ????????? ?????????.");
            request.setAttribute("url", "/member/loginView");
            mv.setViewName("common/alert");
            return mv;
        }
        Member member = (Member) session.getAttribute("loginUser");
        String memberId = member.getMemberId();
        CampLike campLike = new CampLike();
        campLike.setMemberId(memberId);
        Integer myLikeCount = cService.campLikeCount(campLike);
        List<CampLike> lList = cService.likeListView(memberId);
        for (int i = 0; i < lList.size(); i++) {
            Camp camp = cService.printCampDetail(Integer.parseInt(lList.get(i).getCampId()));
            lList.get(i).setImgUrl(camp.getFirstImageUrl());
            lList.get(i).setCampName(camp.getFacltNm());
            lList.get(i).setCampAddr(camp.getAddr1());
        }
        mv.addObject("lList",lList);
        mv.addObject("myLikeCount",myLikeCount);
        mv.setViewName("camp/myLikeList");

        return mv;
    }

    // ????????? ????????? ?????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/myLikeView.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET)
    public String myLikeListView(HttpSession session) {
        Member member = (Member) session.getAttribute("loginUser");
        System.out.println(member);
        String memberId = member.getMemberId();
        List<CampLike> lList = cService.likeListView(memberId);
        for (int i = 0; i < lList.size(); i++) {
            Camp camp = cService.printCampDetail(Integer.parseInt(lList.get(i).getCampId()));
            lList.get(i).setImgUrl(camp.getFirstImageUrl());
            lList.get(i).setCampName(camp.getFacltNm());
            lList.get(i).setCampAddr(camp.getAddr1());
        }
        System.out.println(lList);

        return new Gson().toJson(lList);
    }

    // ?????? ????????? ?????? ??????
    @ResponseBody
    @RequestMapping(value = "/camp/myCampReview.kh", method = RequestMethod.GET)
    public ModelAndView myCampReview(
            HttpServletRequest request,
            HttpSession session,
            ModelAndView mv) {
        try {
            if (session.getAttribute("loginUser") == null) {
                request.setAttribute("msg", "???????????? ????????? ????????? ?????????.");
                request.setAttribute("url", "/member/loginView");
                mv.setViewName("common/alert");
                return mv;
            }
            Member member = (Member) session.getAttribute("loginUser");
            String memberId = member.getMemberId();

            List<CampReview> rList = cService.myCampReviewView(memberId);
            Integer rCount = cService.myCampReviewCount(memberId);
            for (int i = 0; i < rList.size(); i++) {
                Camp camp = cService.printCampDetail(Integer.parseInt(rList.get(i).getCampId()));
                rList.get(i).setImgUrl(camp.getFirstImageUrl());
            }
            
            mv.addObject("rCount",rCount);
            mv.addObject("rList",rList);
            mv.setViewName("camp/myCampReviewList");
        } catch (Exception e) {

        }
        return mv;
    }
}
