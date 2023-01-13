package kr.co.olga.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.olga.service.MemberService;
import kr.co.olga.vo.MemberVO;
import lombok.Setter;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	private MemberService memberservice;

/*	
	// 비밀번호 암호화
	@Autowired
	@Setter
	@Qualifier(value = "BCryptPasswordEncoder")
	private BCryptPasswordEncoder pwdEncoder;
*/

	// 회원가입 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String loginGET() {

		return "/member/join";
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO vo) throws Exception {
/*
		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		rawPw = vo.getMemPwd(); // 비밀번호 데이터 얻음
		encodePw = pwdEncoder.encode(rawPw); // 비밀번호 인코딩
		vo.setMemPwd(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장
*/
		memberservice.memberJoin(vo);

		return "redirect:/";

	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memId) throws Exception {

		long result = memberservice.idCheck(memId);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}

	} // memberIdChkPOST() 종료

	// 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String joinGET() {

		return "/member/login";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO vo, RedirectAttributes rttr) throws Exception {
	
	/*	
		HttpSession session = request.getSession();
		String rawPwd = "";
		String encodePwd = "";
	*/
		// vo로 로그인 구현
		HttpSession session = request.getSession();
		MemberVO login = memberservice.memberLogin(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", login);
		}
	/*	
	 	// String memId, memPwd 값으로 로그인 구현
		MemberVO vo = memberservice.memberLogin(memId); // 제출한아이디와 일치하는 아이디 있는지
	
		if(vo != null) {
			vo.getMemPwd().equals(memPwd);
		
			if(vo.getMemPwd().equals(memPwd)) {
				session.setAttribute("member", vo); // session에 사용자의 정보 저장
				return "redirect:/"; // 메인페이지 이동
			}else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login"; // 로그인 페이지로 이동
			}
		}else {
			rttr.addFlashAttribute("result", 0);
			return "redirect:/"; // 메인 페이지로 이동
		}
	*/
/*
		if (vo != null) { // 일치하는 아이디 존재시
			rawPwd = memPwd; // 사용자가 제출한 비밀번호
			encodePwd = vo.getMemPwd(); // 데이터베이스에 저장한 인코딩된 비밀번호
			if (true == pwdEncoder.matches(rawPwd, encodePwd)) { // 비밀번호 일치여부 판단
				vo.setMemPwd(""); // 인코딩된 비밀번호 정보 지움
				session.setAttribute("member", vo); // session에 사용자의 정보 저장
				return "redirect:/"; // 메인페이지 이동
			} else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login"; // 로그인 페이지로 이동
			}
		} else { // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
			rttr.addFlashAttribute("result", 0);
			return "redirect:/"; // 메인 페이지로 이동
		}
*/		
		return "redirect:/";
	}

	// 메인페이지 로그아웃
	@RequestMapping(value = "/logout")
	public String memberLogout(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/";
	}
/*
	// 비동기방식 로그아웃 메서드
	@RequestMapping(value = "logout.do", method = RequestMethod.POST)
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) throws Exception {

		logger.info("비동기 로그아웃 메서드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

	}
*/
	// 아이디 찾기
	@RequestMapping(value = "/findId")
	public String findIdView() {
		
		return "member/findId";
	}
	
    // 아이디 찾기 실행
	@RequestMapping(value="findIdView")
	public String findIdAction(MemberVO vo, Model model) {
		MemberVO memVo = memberservice.memIdFindSelect(vo);
		
		if(memVo == null) { 
			model.addAttribute("memIdCheck", 1);
		} else { 
			model.addAttribute("memIdCheck", 0);
			model.addAttribute("memName", memVo.getMemName());
		}
		
		return "/member/findId";
	}
	
    // 비밀번호 찾기 페이지로 이동
	@RequestMapping(value="findPwd")
	public String findPasswordView() {
		return "/member/findPwd";
	}
	
    // 비밀번호 찾기 실행
	@RequestMapping(value="findPwdView")
	public String findPasswordAction(MemberVO vo, Model model) {
		MemberVO memVo = memberservice.memPwdFindSelect(vo);
		
		if(memVo == null) { 
			model.addAttribute("memPwdCheck", 1);
		} else { 
			model.addAttribute("memPwdCheck", 0);
			model.addAttribute("updateMemId", memVo.getMemId());
		}
		
		return "/member/findPwdView";
	}
	
	
    // 비밀번호 바꾸기 실행
	@RequestMapping(value="pwdUpdatePage" )
	public String updatePasswordAction(@RequestParam(value="updateMemId", defaultValue="", required=false) String memId, MemberVO vo) {
		vo.setMemId(memId);
		System.out.println(vo);
		memberservice.memPwdUpdate(vo);
		return "redirect:/member/login";
	}	
	
	
}
