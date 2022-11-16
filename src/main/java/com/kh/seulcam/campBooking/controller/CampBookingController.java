package com.kh.seulcam.campBooking.controller;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.CampSite;
import com.kh.seulcam.camp.service.CampServie;
import com.kh.seulcam.campBooking.domain.BookingStatus;
import com.kh.seulcam.campBooking.domain.CampBooking;
import com.kh.seulcam.campBooking.domain.bookingStatusSearch;
import com.kh.seulcam.campBooking.service.CampBookingService;
import com.kh.seulcam.member.domain.Member;
import com.kh.seulcam.member.service.MemberService;
import com.kh.seulcam.order.domain.OrderPay;
import com.kh.seulcam.order.service.OrderService;
import com.kh.seulcam.point.domain.Point;

@Controller
public class CampBookingController {
    @Autowired
    private CampBookingService bService;

    @Autowired
    private CampServie cService;

    @Autowired
    private MemberService mService;

    @Autowired
    private OrderService oService;

    // 캠핑장 예약 페이지
    @RequestMapping(value = "/campBooking/campBookingView.kh", method = RequestMethod.GET)
    public ModelAndView campList(
            @RequestParam(value = "memberId", required = false) String memberCheck,
            @RequestParam(value = "contentId", required = false) int contentId,
            @RequestParam(value = "firstDayJs", required = false) String firstDayJs,
            @RequestParam(value = "lastDayJs", required = false) String lastDayJs,
            @RequestParam(value = "siteNo", required = false) int siteNo,
            HttpServletRequest request,
            ModelAndView mv,
            HttpSession session) {
        try {
            // 데이트 포멧
            String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date firstDay = Date.valueOf(firstDayJs);
            Date lastDay = Date.valueOf(lastDayJs);
            if (format.parse(firstDayJs).getTime() < format.parse(todayfm).getTime()) {
                request.setAttribute("msg", "잘못된 접근 입니다.");
                request.setAttribute("url", "/camp/campSiteDetail.kh?contentId=" + contentId);
                mv.setViewName("common/alert");
                return mv;
            }
            if (format.parse(firstDayJs).getTime() > format.parse(lastDayJs).getTime()) {
                request.setAttribute("msg", "잘못된 접근 입니다.");
                request.setAttribute("url", "/camp/campSiteDetail.kh?contentId=" + contentId);
                mv.setViewName("common/alert");
                return mv;
            }
            bookingStatusSearch bss = new bookingStatusSearch();
            bss.setFirstDay(firstDayJs);
            bss.setLastDay(lastDayJs);
            bss.setSiteNo(siteNo);
            String resultbss = bService.bookingCount(bss);
            if (resultbss != null) {
                if (Integer.parseInt(resultbss) < 1) {
                    request.setAttribute("msg", "예약가능갯수가 없습니다.");
                    request.setAttribute("url", "/camp/campSiteDetail.kh?contentId=" + contentId);
                    mv.setViewName("common/alert");
                    return mv;
                }
            }
            // 로그인세션 아이디 없으면 로그인화면으로 보낸다
            if (session.getAttribute("loginUser") == null) {
                request.setAttribute("msg", "로그인이 필요한 서비스 입니다.");
                request.setAttribute("url", "/camp/campSiteDetail.kh?contentId=" + contentId);
                mv.setViewName("common/alert");
                return mv;
            } else {
                Member member = (Member) session.getAttribute("loginUser");
                String memberId = member.getMemberId();
                Member mOne = mService.printOneById(memberId);
                if (!memberId.equals(memberCheck)) {
                    System.out.println("수정창 로그인없이 접근");
                    request.setAttribute("msg", "정상적인 접근이 아닙니다.");
                    request.setAttribute("url", "/camp/campSiteDetail.kh?contentId=" + contentId);
                    mv.setViewName("common/alert");
                    return mv;
                }
                CampSite campSite = cService.printSite(siteNo);
                // 날짜사이 일수 구하기
                String countDay = (format.parse(lastDayJs).getTime() - format.parse(firstDayJs).getTime())
                        / (24 * 60 * 60) / 1000 + "";

                mv.addObject("firstDay", firstDay);
                mv.addObject("lastDay", lastDay);
                mv.addObject("countDay", countDay);
                mv.addObject("campSite", campSite);
                mv.addObject("mOne", mOne);
                mv.setViewName("campBooking/campBooking");
            }
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "예약페이지 조회 실패").setViewName("common/errorPage");
        }

        return mv;
    }

    // 캠핑장 결제 전 정상여부 확인
    @ResponseBody
    @RequestMapping(value = "/campBooking/bookingPayCheck.kh", method = RequestMethod.GET)
    public String bookingPayCheck(HttpServletRequest request,
            @ModelAttribute CampBooking cBooking,
            HttpSession session) {
        try {
            String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            if (session.getAttribute("loginUser") == null) {
                return "noneId";
            }
            if (format.parse(cBooking.getFirstDay()).getTime() < format.parse(todayfm).getTime()) {
                return "wrongApproach";
            }
            if (format.parse(cBooking.getFirstDay()).getTime() > format.parse(cBooking.getLastDay()).getTime()) {
                return "wrongApproach";
            }
            bookingStatusSearch bss = new bookingStatusSearch();
            bss.setFirstDay(cBooking.getFirstDay());
            bss.setLastDay(cBooking.getLastDay());
            bss.setSiteNo(cBooking.getSiteNo());
            String resultbss = bService.bookingCount(bss);
            if (resultbss != null) {
                if (Integer.parseInt(resultbss) < 1) {
                    return "wrongDate";
                }
            }
            
            return "success";

        } catch (ParseException e) {
            return "fail";
        }

    }

    // 캠핑장 예약
    @ResponseBody
    @RequestMapping(value = "/campBooking/campBooking.kh", method = RequestMethod.POST)
    public String campBookingRegist(
            HttpServletRequest request,
            @ModelAttribute OrderPay orderPay,
            @ModelAttribute CampBooking cBooking) {
        try {
            System.out.println(cBooking);
            // 잔여좌석 없으면 예약안되도록 -> 분해해야함 안그러면 결제 후 이쪽으로 넘어옴
            bookingStatusSearch bss = new bookingStatusSearch();
            bss.setFirstDay(cBooking.getFirstDay());
            bss.setLastDay(cBooking.getLastDay());
            bss.setSiteNo(cBooking.getSiteNo());
            String resultbss = bService.bookingCount(bss);
            if (resultbss != null) {
                if (Integer.parseInt(resultbss) < 1) {
                    return "fail";
                }
            }

            // 예약저장
            int result = bService.campBookingRegist(cBooking);
            int bookingNo = cBooking.getBookingNo();
            // 결제테이블에 정보 넣기
            orderPay.setOrderNo(bookingNo);
            int result4 = oService.registOrderPrice(orderPay);
            // 포인트 차감
            Point pointUse = new Point();
            pointUse.setMemberId(cBooking.getMemberId());
            pointUse.setPoint(cBooking.getBookUsePoint() + "");
            int result2 = oService.registUsePoint(pointUse);
            // 포인트 적립
            Point pointAdd = new Point();
            pointAdd.setMemberId(cBooking.getMemberId());
            pointAdd.setPoint(cBooking.getBookGetPoint() + "");
            int result3 = oService.registGetPoint(pointAdd.getPoint(), pointAdd.getMemberId());

            // 예약 현황 저장
            int bsInsert = 0;
            BookingStatus bs = new BookingStatus();
            bs.setMemberId(cBooking.getMemberId());
            bs.setsBookDate(cBooking.getFirstDay());
            bs.setSiteNo(cBooking.getSiteNo());
            bs.setTotalDay(cBooking.getTotalDay() - 1);
            if (result == 1) {
                bsInsert = bService.bookingStatus(bs);
            }
//            if(result ==1 && bsInsert == -1) {
//                return "success";
//            }else {
//                return "fail";
//            }
            return bookingNo + "";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";

    }

    // 캠핑장 예약 조회
    @ResponseBody
    @RequestMapping(value = "/campBooking/campBookingCheck.kh", method = RequestMethod.POST)
    public String campBookingCheck() {
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // 캠핑장 예약 완료창
    @ResponseBody
    @RequestMapping(value = "/campBooking/campBookingComplete.kh", method = RequestMethod.GET)
    public ModelAndView campBookingComplete(
            @RequestParam(value = "bookingNo", required = false) String bookingNo,
            HttpServletRequest request,
            ModelAndView mv,
            HttpSession session) {
        try {
            CampBooking campBooking = bService.printBookingInfo(bookingNo);
            CampSite campSite = cService.printSite(campBooking.getSiteNo());
            String firstDay = campBooking.getFirstDay().substring(0, 10);
            String lastDay = campBooking.getLastDay().substring(0, 10);
            campBooking.setFirstDay(firstDay);
            campBooking.setLastDay(lastDay);
            if (session.getAttribute("loginUser") == null) {
                request.setAttribute("msg", "정상적인 접근이 아닙니다.");
                request.setAttribute("url", "/");
                mv.setViewName("common/alert");
                return mv;
            } else {
                Member member = (Member) session.getAttribute("loginUser");
                String memberId = member.getMemberId();
                if (!memberId.equals(campBooking.getMemberId())) {
                    System.out.println("로그인정보와 다른 데이터 접근");
                    request.setAttribute("msg", "정상적인 접근이 아닙니다.");
                    request.setAttribute("url", "/");
                    mv.setViewName("common/alert");
                    return mv;
                }
            }
            mv.addObject("campBooking", campBooking);
            mv.addObject("campSite", campSite);
            mv.setViewName("campBooking/campBookingComplete");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }

    // 캠핑장 예약확인 디테일
    @ResponseBody
    @RequestMapping(value = "/campBooking/campBookingDetail.kh", method = RequestMethod.GET)
    public ModelAndView campBookingDetail(
            @RequestParam(value = "bookingNo", required = false) String bookingNo,
            HttpServletRequest request,
            ModelAndView mv,
            HttpSession session) {
        try {
            CampBooking campBooking = bService.printBookingInfo(bookingNo);
            CampSite campSite = cService.printSite(campBooking.getSiteNo());
            if (session.getAttribute("loginUser") == null) {
                request.setAttribute("msg", "정상적인 접근이 아닙니다.");
                request.setAttribute("url", "/");
                mv.setViewName("common/alert");
                return mv;
            } else {
                Member member = (Member) session.getAttribute("loginUser");
                String memberId = member.getMemberId();
                if (!memberId.equals(campBooking.getMemberId())) {
                    System.out.println("로그인정보와 다른 데이터 접근");
                    request.setAttribute("msg", "정상적인 접근이 아닙니다.");
                    request.setAttribute("url", "/");
                    mv.setViewName("common/alert");
                    return mv;
                }
            }
            String firstDay = campBooking.getFirstDay().substring(0, 10);
            String lastDay = campBooking.getLastDay().substring(0, 10);
            campBooking.setFirstDay(firstDay);
            campBooking.setLastDay(lastDay);

            List<OrderPay> opList = cService.printAllPayInfo(Integer.parseInt(bookingNo));
            mv.addObject("pay", opList);
            mv.addObject("campBooking", campBooking);
            mv.addObject("campSite", campSite);
            mv.setViewName("campBooking/campBookingDetail");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }

    // 캠핑장 예약리스트
    @ResponseBody
    @RequestMapping(value = "/campBooking/campBookingList.kh", method = RequestMethod.GET)
    public ModelAndView campBookingList(
            @RequestParam(value = "bookingNo", required = false) String bookingNo,
            HttpServletRequest request,
            ModelAndView mv,
            HttpSession session) {
        NumberFormat numberFormat = NumberFormat.getInstance();
        try {
            Member member = (Member) session.getAttribute("loginUser");
            System.out.println(member);
            String memberId = member.getMemberId();
            System.out.println(memberId);
            List<CampBooking> cbList = bService.BooingListView(memberId);
            System.out.println(4);
            for (int i = 0; i < cbList.size(); i++) {
                String firstDay = cbList.get(i).getFirstDay().substring(0, 10);
                String lastDay = cbList.get(i).getLastDay().substring(0, 10);
                cbList.get(i).setFirstDay(firstDay);
                cbList.get(i).setLastDay(lastDay);

            }
            mv.addObject("cbList", cbList);
            mv.setViewName("/campBooking/campBookingList");
        } catch (Exception e) {
            // TODO: handle exception
        }

        return mv;
    }

    // 캠핑장 예약 취소
    @ResponseBody
    @RequestMapping(value = "/campBooking/campBookingCancle.kh", method = RequestMethod.GET)
    public ModelAndView campBookingCancle(
            ModelAndView mv) {

        return mv;
    }
}
