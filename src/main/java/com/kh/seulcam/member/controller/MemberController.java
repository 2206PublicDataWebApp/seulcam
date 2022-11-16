package com.kh.seulcam.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.kh.seulcam.member.service.MemberService;
import com.kh.seulcam.order.domain.Order;
import com.kh.seulcam.order.service.OrderService;
import com.kh.seulcam.member.domain.Member;


@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private OrderService oService;
	
		/* 로그인 관련 */
	// 비로그인 상태일 때 로그인 창으로 이동
	@RequestMapping(value="/member/loginView", method=RequestMethod.GET)
	public ModelAndView memberJoinView(ModelAndView mv,HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("redirectURI", referer);
		mv.addObject("referer", referer);
		mv.setViewName("member/login");	
		return mv;
	}
	
	// 아이디 찾기 창으로 이동
	@RequestMapping(value="/member/findIdView", method=RequestMethod.GET)
	public String findIdView(Model model) {
		return "member/findId";
	}
	
	// 비밀번호 찾기 창으로 이동
	@RequestMapping(value="/member/findPwView", method=RequestMethod.GET)
	public String findPwView(Model model) {
		return "member/findPw";
	}
	
	// 아이디 찾기 결과 창으로 이동
	@RequestMapping(value="/member/idResultView", method=RequestMethod.POST)
	public ModelAndView idResult(
			@RequestParam("memberEmail") String memberEmail
			, ModelAndView mv) {
	try {
		List<Member> mList = mService.listIdByEmail(memberEmail);
		mv.addObject("mList", mList);
		mv.setViewName("/member/idResult");
	} catch (Exception e) {
		mv.addObject("msg", e.getMessage());
		mv.setViewName("common/errorPage");
	}
	return mv;
	}
	
	// 비밀번호 찾기 결과 창으로 이동
	@RequestMapping(value="/member/pwResultView", method=RequestMethod.POST)
	public ModelAndView pwResultView(
			@RequestParam("memberId") String memberId
			, ModelAndView mv) {
		try {
			mv.addObject("memberId", memberId);
			mv.setViewName("/member/pwResult");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 회원가입 창으로 이동
	@RequestMapping(value="/member/registerView", method=RequestMethod.GET)
	public String registerView(Model model) {
		return "member/register";
	}
	
	// 회원가입 축하 창으로 이동
	@RequestMapping(value="/member/congView", method=RequestMethod.GET)
	public String congView(Model model) {
		return "member/cong";
	}
	
	
		/* 마이페이지 관련 */
	// 로그인 상태일 때 마이페이지 창으로 이동
	@RequestMapping(value="/member/myPageView", method=RequestMethod.GET)
	public ModelAndView memberMyPageView(
			HttpServletRequest request
			, HttpServletResponse response
			, ModelAndView mv) throws Exception {
		try {
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			String memberId = member.getMemberId();
			Member mOne = mService.printOneById(memberId);
			mv.addObject("member", mOne);
			mv.setViewName("member/mypage");
			
			//주문내역 갯수 구하기
			List<Order> oList = oService.printCompleteList(memberId);
			int count1=0; 
			int count2=0;
			int count3=0; 
			if(!oList.isEmpty()) {
				
				for (int i = 0; i < oList.size(); i++) { 
					String dStatus =oList.get(i).getDirivaryStatus(); 
					System.out.println(dStatus);
				if(dStatus!=null) {
					if(dStatus.equals("입금확인")) {
						count1++;
					}else if(dStatus.equals("배송중")) { 
						count2++; 
					}else if(dStatus.equals("배송완료")) { 
						count3++; 
					}
				}
				}
			}
				mv.addObject("count1",count1);
				mv.addObject("count2",count2);
				mv.addObject("count3",count3);
			
		} catch (Exception e) {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
	        out.flush(); 
		}
		return mv;
	}
	
	// 닉네임 변경 창으로 이동
	@RequestMapping(value="/member/nicknameChangeView", method=RequestMethod.GET)
	public ModelAndView nicknameChangeView(HttpServletRequest request
			, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			String memberId = member.getMemberId();
			Member mOne = mService.printOneById(memberId);
			mv.addObject("member", mOne);
			mv.setViewName("member/nicknameChange");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}	
	
	// 마이페이지 회원정보 관리 창으로 이동
	@RequestMapping(value="/member/mypageMemberView", method=RequestMethod.GET)
	public ModelAndView mypageMemberView(HttpServletRequest request
			, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			String memberId = member.getMemberId();
			Member mOne = mService.printOneById(memberId);
			mv.addObject("member", mOne);
			mv.setViewName("member/mypageMember");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 마이페이지 회원정보 비밀번호 변경 창으로 이동
	@RequestMapping(value="/member/passwordChangeView", method=RequestMethod.GET)
	public String passwordChangeView(Model model) {
		return "member/passwordChange";
	}
	
	// 마이페이지 회원정보 환불 계좌 변경 창으로 이동
	@RequestMapping(value="/member/accountChangeView", method=RequestMethod.GET)
	public ModelAndView accountChangeView(HttpServletRequest request
			, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			String memberId = member.getMemberId();
			Member mOne = mService.printOneById(memberId);
			mv.addObject("member", mOne);
			mv.setViewName("member/accountChange");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 마이페이지 회원정보 배송지 관리 창으로 이동
	@RequestMapping(value="/member/addressChangeView", method=RequestMethod.GET)
	public ModelAndView addressChangeView(HttpServletRequest request
			, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			String memberId = member.getMemberId();
			Member mOne = mService.printOneById(memberId);
			mv.addObject("member", mOne);
			mv.setViewName("member/addressChange");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 아이디 DB에 존재하는 지 검사하는 기능
	@ResponseBody
	@RequestMapping(value= "/member/memberIdCheck", method = RequestMethod.GET)
	public String IdCheck(@RequestParam("memberId") String memberId) {
		int result = mService.checkOneId(memberId);
		return result+"";
	}
	
	// 이메일 DB에 존재하는 지 검사하는 기능
	@ResponseBody
	@RequestMapping(value= "/member/memberEmailCheck", method = RequestMethod.GET)
	public String emailCheck(@RequestParam("memberEmail") String memberEmail) {
		int result = mService.checkOneEmail(memberEmail);
		return result+"";
	}
	
	// 닉네임 DB에 존재하는 지 검사하는 기능
	@ResponseBody
	@RequestMapping(value= "/member/memberNicknameCheck", method = RequestMethod.GET)
	public String nicknameCheck(@RequestParam("memberNickname") String memberNickname) {
		int result = mService.checkOneNickname(memberNickname);
		return result+"";
	}
	
	// 비밀번호가 DB와 일치하는지 검사하는 기능
	@ResponseBody
	@RequestMapping(value= "/member/memberPwCheck", method = RequestMethod.POST)
	public String memberPwCheck(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		int result = mService.checkOnePw(member);
		return result+"";
	}
	
	// 아이디와 이메일이 DB와 일치하는지 검사하는 기능
	@ResponseBody
	@RequestMapping(value= "/member/memberIdEmailCheck", method = RequestMethod.GET)
	public String memberIdEmailCheck(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberEmail") String memberEmail) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberEmail(memberEmail);
		int result = mService.checkIdEmail(member);
		return result+"";
	}
	
	// 이메일 인증 기능
	@ResponseBody
	@RequestMapping(value = "emailAuth", method = RequestMethod.POST)
	public String emailAuth(String email) {		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		/* 이메일 보내기 */
        String setFrom = "cji961336@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        return Integer.toString(checkNum);
	}
	
	// 로그인 기능
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public ModelAndView memberLogin(
			@ModelAttribute Member member
			, ModelAndView mv
			, Boolean rememberMe
			, HttpServletRequest request
			, HttpServletResponse response
			,@RequestParam("redirectURI") String redirectURI) throws Exception {
		try {
			Member loginUser = mService.loginMember(member);
			String memberId = loginUser.getMemberId();
			HttpSession session = request.getSession();
			if (redirectURI=="") {
				redirectURI = "http://127.0.0.1:9999/";
			}
		
			if(rememberMe == null) { 
			} else {
				// 로그인 유지에 체크 했을 때
				//쿠키 등록하기
				Cookie cookie = new Cookie("memberId", memberId);
				cookie.setMaxAge(60*60*24*7); // 쿠키 수명 설정
				cookie.setPath("/"); // 모든 경로에 적용
				response.addCookie(cookie);
			}
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:" + redirectURI );
		} catch (Exception e) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
            out.flush(); 
		}
		return mv;
	}
	
	// 로그아웃
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public ModelAndView memberLogout(
			HttpServletRequest request
			, ModelAndView mv) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg", "로그아웃 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 회원가입 기능
	@RequestMapping(value="/member/register", method=RequestMethod.POST)
	public ModelAndView memberRegister(
			@ModelAttribute Member member
			, ModelAndView mv) {
		try {
			int result = mService.registerMember(member);
			// 회원가입에 성공하면,
			if(result > 0) {
				mv.setViewName("redirect:/member/congView"); 
			}
			// 회원가입에 실패하면,
			else {
				mv.addObject("msg", "회원가입을 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 닉네임 수정
	@RequestMapping(value="/member/changeNickname", method=RequestMethod.POST)
	public ModelAndView changeNickname(
			@ModelAttribute Member member
			, ModelAndView mv) {
		try {
			int result = mService.modifyMemberNickname(member);
			if(result > 0) {
				mv.setViewName("redirect:/member/myPageView");
			}else {
				mv.addObject("msg", "회원 정보 수정 실패!");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 환불 계좌 수정
	@RequestMapping(value="/member/changeAccount", method=RequestMethod.POST)
	public ModelAndView changeAccount(
			@ModelAttribute Member member
			, ModelAndView mv) {
		try {
			int result = mService.modifyMemberAccount(member);
			if(result > 0) {
				mv.setViewName("redirect:/member/mypageMemberView");
			}else {
				mv.addObject("msg", "회원 정보 수정 실패!");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 배송지 수정
	@RequestMapping(value="/member/changeAddress", method=RequestMethod.POST)
	public ModelAndView changeAddress(
			@ModelAttribute Member member
			, ModelAndView mv) {
		try {
			int result = mService.modifyMemberAddress(member);
			if(result > 0) {
				mv.setViewName("redirect:/member/mypageMemberView");
			}else {
				mv.addObject("msg", "회원 정보 수정 실패!");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 비밀번호 수정
	@RequestMapping(value="/member/changePw", method=RequestMethod.POST)
	public ModelAndView changePw(
			@ModelAttribute Member member
			, ModelAndView mv) {
		try {
			int result = mService.modifyMemberPw(member);
			if(result > 0) {
				mv.setViewName("redirect:/member/loginView");
			}else {
				mv.addObject("msg", "회원 정보 수정 실패!");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}

	// 카카오 로그인
	@RequestMapping(value="/member/kakaoLogin", method=RequestMethod.POST)
	public ModelAndView kakaoLogin(
			@ModelAttribute Member member,
			@RequestParam("memberEmail") String memberEmail
			, ModelAndView mv
			, HttpServletRequest request
			,@RequestParam("redirectURI") String redirectURI) {
		int result = mService.checkOneEmail(memberEmail);
		if(result == 0) {
				mv.addObject("memberEmail", memberEmail);
				mv.setViewName("member/kakaoEnroll");
		} else {
			Member loginUser = mService.kakaologinMember(memberEmail);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:" + redirectURI );
		}

		return mv;
	}
	
	// 멤버 관리자 페이지 열기
	@RequestMapping(value="/admin/member/ListView",method = RequestMethod.GET)
	public ModelAndView memberList(HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelAndView mv) throws Exception  {
		try {
			HttpSession receive = request.getSession();
			List<Member> mList = mService.printAllMember();
			Member member = (Member)receive.getAttribute("loginUser");
			String memberId = member.getMemberId();
			Member mOne = mService.printOneById(memberId);
			Boolean adminCheck = member.getAdminCheck();
			if(adminCheck==false) {
				response.setContentType("text/html; charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
		        out.flush(); 
		        mv.setViewName("redirect:/");
			} else {
				mv.addObject("member", mOne);
				mv.addObject("mList",mList);
				mv.setViewName("admin/memberList");
			}

		}catch (Exception e) {            
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
        out.flush(); 
		}
		
		return mv;
	}
	
	// 프로필 사진 등록
	@RequestMapping(value="/member/profileImage", method=RequestMethod.POST)
	public ModelAndView profileImage(
			ModelAndView mv
			, @ModelAttribute Member member
			, @RequestParam(value="profileImage", required=false) MultipartFile uploadFile
			,HttpServletRequest request) {
		
		try {
			String memberFilename = uploadFile.getOriginalFilename();
			if(!memberFilename.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\profileImageFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String memberFilername 
				= sdf.format(new Date(System.currentTimeMillis()))+"."
						+memberFilename.substring(memberFilename.lastIndexOf(".")+1);
				File file = new File(savePath);
				if(!file.exists()) {
					file.mkdir();
				}
				uploadFile.transferTo(new File(savePath+"\\"+memberFilername));
				String memberImage = savePath+"\\"+memberFilername;
				member.setMemberFilename(memberFilename);
				member.setMemberFilername(memberFilername);
				member.setMemberImage(memberImage);
			}
			int result = mService.registerProfile(member);
			mv.setViewName("redirect:/member/myPageView");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

}
