package kr.co.olga.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.MemberService;
import kr.co.olga.service.SellerService;
import kr.co.olga.service.StoreService;
import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.SellerVO;
import kr.co.olga.vo.StoreVO;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private StoreService storeservice;
	
	@Autowired
	private SellerService sellerservice;
	
	/************* 로그인 관련 *************/
	// 로그인 페이지 이동
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String joinGET() {

			return "/member/login";
		}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO vo,String typeSelRadio,HttpServletRequest request,Model model) throws Exception {
		// vo로 로그인 구현
		HttpSession session = request.getSession();
		if(typeSelRadio =="normalMem") {
			//일반회원의 경우
			MemberVO login = memberservice.memberLogin(vo);
			
			if(login == null) {
				model.addAttribute("loginResult", "failed");
				return "member/login";
			}else {
				session.setAttribute("member", login);
				return "redirect:/";
			}
		}else {
			// 판매자 회원의 경우
			MemberVO login = memberservice.memberLogin(vo);
			
			if(login == null) {
				model.addAttribute("loginResult", "failed");
				return "member/login";
			}else {
				session.setAttribute("member", login);
				return "redirect:/";
			}
		}
		
		
	}	
	
	
	/************* 회원가입관련 *************/
	// 회원가입 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String loginGET() {

		return "/member/join";
	}
	

	// 아이디 중복 검사
	@RequestMapping(value = "/memIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memId) throws Exception {

		long result = memberservice.idCheck(memId);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}

	}
	
	// 이메일 중복 검사
		@RequestMapping(value = "/memEmailCheck", method = RequestMethod.POST)
		@ResponseBody
		public String memberEmailChkPOST(String memEmail) throws Exception {

			long result = memberservice.emailCheck(memEmail);

			if (result != 0) {
				return "fail"; // 중복 아이디가 존재
			} else {
				return "success"; // 중복 아이디 x
			}

		}
		
		
		/************* 판매자 고유 번호 체크 *************/
		
		// 판매자 고유번호 체크
		@RequestMapping(value = "/selMarketUniqueNo", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> sellerUniNoCheck(String getUniNo) throws Exception {
			Map<String, Object> result = new HashMap<String, Object>();
			StoreVO vo = storeservice.storeSelectByMarketUniqueNo(getUniNo);
			if (vo == null) {
				result.put("result","fail");
				return result;
			} else {
				result.put("storeVO",vo);  //게시판목록
				result.put("result","success");
				return result;
			}
			

		}
		
		
		
		/************* 회원가입 *************/
		/* 회원가입 버튼 작동 */
		@RequestMapping(value = "/joinAct", method = RequestMethod.GET)
		public String memberJoinAct(String memId,String memPwd,String memName,String memEmail
				,String memPhone,String mainPostcode,String mainAddress,String mainDetailAddress
				,String memBirthYear,String memBirthMonth,String memBirthDate,String memGender
				,String typeSelRadio,String selMarketUniqueNo,String selstlBrandName
				,String selSelRegiNo,Integer choiceSelectBoxOne,Integer choiceSelectBoxTwo,Integer choiceSelectBoxThree
				)//여기까지 메서드 인자
		{
			if(typeSelRadio.equals("normalMem")) {
				// 일반회원 회원가입
				// 20230118   이슈: 생일컬럼이 없으므로 값을 컨트롤러로 넘겨받긴 하지만 사용하지는 않음
				// choice의 경우는 차례대로 가중치가 1 / 10 / 100 임 따라서 111이면 3개체크, 11이면 2개체크임
				String memAddress = mainPostcode + " " + mainAddress + " " + mainDetailAddress;
				String memGrade = "friend"; //기본값은 friend
				Long memChoice;
				//아래IF문 => 리팩토링 예정
				if(choiceSelectBoxOne == null) {
					if(choiceSelectBoxTwo==null) {
						if(choiceSelectBoxThree == null) {
							// 1X 2X 3X
							memChoice = 0L;
						}else {
							// 1X 2X 3O
							memChoice = 1L;
						}
					}else {
						if(choiceSelectBoxThree == null) {
							// 1X 2O 3X
							memChoice = 10L;
						}else {
							// 1X 2O 3O
							memChoice = 11L;
						}
					}
				}else {
					if(choiceSelectBoxTwo==null) {
						if(choiceSelectBoxThree == null) {
							// 1O 2X 3X
							memChoice = 111L;
						}else {
							// 1O 2X 3O
							memChoice = 101L;
						}
					}else {
						if(choiceSelectBoxThree == null) {
							// 1O 2O 3X
							memChoice = 110L;
						}else {
							// 1O 2O 3O
							memChoice = 111L;
						}
					}
				}
				MemberVO vo = new MemberVO(memId, memPwd, memName, memEmail, memPhone, memAddress, memGender, memGrade, null, null, memChoice);
				memberservice.memberJoin(vo);
				return "redirect:/member/login";
			}else {
				// typeSelRadio=="sellerMem" (판매점인 경우)
				String selAddress = mainPostcode + " " + mainAddress + " " + mainDetailAddress;
				String memGrade = "friend"; //기본값은 friend
				Long selTypeGrade = 1L; //기본값은 1
				Long memChoice;
				if(choiceSelectBoxOne == null) {
					if(choiceSelectBoxTwo==null) {
						if(choiceSelectBoxThree == null) {
							// 1X 2X 3X
							memChoice = 0L;
						}else {
							// 1X 2X 3O
							memChoice = 1L;
						}
					}else {
						if(choiceSelectBoxThree == null) {
							// 1X 2O 3X
							memChoice = 10L;
						}else {
							// 1X 2O 3O
							memChoice = 11L;
						}
					}
				}else {
					if(choiceSelectBoxTwo==null) {
						if(choiceSelectBoxThree == null) {
							// 1O 2X 3X
							memChoice = 111L;
						}else {
							// 1O 2X 3O
							memChoice = 101L;
						}
					}else {
						if(choiceSelectBoxThree == null) {
							// 1O 2O 3X
							memChoice = 110L;
						}else {
							// 1O 2O 3O
							memChoice = 111L;
						}
					}
				}
				SellerVO vo = new SellerVO(memId, memPwd, memName, selstlBrandName, memEmail, memPhone, selAddress, memGender,memGrade,selMarketUniqueNo,selSelRegiNo,memChoice,selTypeGrade,null,null);
				sellerservice.selJoin(vo);
				return "redirect:/member/login";
			}
		}
		
		
	
}