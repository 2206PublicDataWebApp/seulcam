package com.kh.seulcam.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
		/* 로그인 관련 */
	// 비로그인 상태일 때 로그인 창으로 이동
	@RequestMapping(value="/member/loginView", method=RequestMethod.GET)
	public String memberJoinView(Model model) {
		return "member/login";
	}
	
	// 아이디 찾기 창으로 이동
	@RequestMapping(value="/member/findIdView", method=RequestMethod.GET)
	public String findIdView(Model model) {
		return "member/findId";
	}
	
	// 아이디 찾기 결과 창으로 이동
	@RequestMapping(value="/member/idResultView", method=RequestMethod.GET)
	public String idResultView(Model model) {
		return "member/idResult";
	}
	
	// 비밀번호 찾기 창으로 이동
	@RequestMapping(value="/member/findPwView", method=RequestMethod.GET)
	public String findPwView(Model model) {
		return "member/findPw";
	}
	
	// 비밀번호 찾기 결과 창으로 이동
	@RequestMapping(value="/member/pwResultView", method=RequestMethod.GET)
	public String pwResultView(Model model) {
		return "member/pwResult";
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
	public String memberMyPageView(Model model) {
		return "member/mypage";
	}
	
	// 닉네임 변경 창으로 이동
	@RequestMapping(value="/member/nicknameChangeView", method=RequestMethod.GET)
	public String nicknameChangeView(Model model) {
		return "member/nicknameChange";
	}
	
	// 마이페이지 회원정보 관리 창으로 이동
	@RequestMapping(value="/member/mypageMemberView", method=RequestMethod.GET)
	public String mypageMemberView(Model model) {
		return "member/mypageMember";
	}
	
	// 마이페이지 회원정보 비밀번호 변경 창으로 이동
	@RequestMapping(value="/member/passwordChangeView", method=RequestMethod.GET)
	public String passwordChangeView(Model model) {
		return "member/passwordChange";
	}
	
	// 마이페이지 회원정보 환불 계좌 변경 창으로 이동
	@RequestMapping(value="/member/accountChangeView", method=RequestMethod.GET)
	public String accountChangeView(Model model) {
		return "member/accountChange";
	}
	
	// 마이페이지 회원정보 배송지 관리 창으로 이동
	@RequestMapping(value="/member/addressChangeView", method=RequestMethod.GET)
	public String addressChangeView(Model model) {
		return "member/addressChange";
	}
	

	

}
