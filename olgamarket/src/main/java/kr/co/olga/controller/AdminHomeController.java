package kr.co.olga.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHomeController {

	// 로그인 페이지 이동
	@RequestMapping(value = "/master")
	public String adminHome() {
		
		return "/admin/adminLogin";
	}
	
	// 로그아웃 + 로그인 페이지 이동
	@RequestMapping(value = "/adminLogout")
	public String adminHomeLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "/admin/adminLogin";
	}
}
