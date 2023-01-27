package kr.co.olga.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.FavorService;
import kr.co.olga.service.InquiryRecoReportService;
import kr.co.olga.service.MemberService;
import kr.co.olga.service.SellerService;
import kr.co.olga.service.ShipService;
import kr.co.olga.service.StoreService;
import kr.co.olga.vo.FavorVO;
import kr.co.olga.vo.InquiryRecoReportVO;
import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.SellerVO;
import kr.co.olga.vo.ShipVO;
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
	
	@Autowired
	private FavorService favorservice;
	
	@Autowired
	private InquiryRecoReportService irrService;
	
	@Autowired
	private ShipService shpService;
	
	/************* 로그인 관련 *************/
	// 로그인 페이지 이동
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String joinGET() {

			return "/member/login";
		}

	// 로그인 => 성공시 일반회원/판매자회원 모두 session에 member라는 이름으로 VO객체 저장
	// 로그인 성공 => 메인화면으로 리다이렉트    실패 => 로그인창으로 복귀 ( 확인하라는 모달 창 뜰거임 )
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(String memId,String memPwd,String typeSelRadio,HttpServletRequest request,Model model) throws Exception {
		// vo로 로그인 구현
		HttpSession session = request.getSession();
		if(typeSelRadio.equals("normalMem")) {
			//일반회원의 경우
			MemberVO memvo = new MemberVO();
			memvo.setMemId(memId);
			memvo.setMemPwd(memPwd);
			MemberVO memlogin = memberservice.memberLogin(memvo);
			if(memlogin == null) {
				//일반 로그인 실패
				model.addAttribute("loginResult", "failed");
				return "member/login";
			}else {
				//일반 로그인 성공
				// 찜목록 세션에 담기
				List<FavorVO> list = favorservice.favorGetListByMemId(memId);
				String favorList = ""; //리스트에서 pdid만 담을 문자열, 구분자는 /로 한다
				for(int i=0;i<list.size();i++) {
					favorList += list.get(i).getFvpdId();
					if(i < (list.size()-1)) {favorList += "/";}
				}
				//상품리뷰 추천/비추천 세션에 담기
				InquiryRecoReportVO vo = new InquiryRecoReportVO();
				vo.setIrrmemId(memId);
				List<InquiryRecoReportVO> irrlist = irrService.irrGetAllByMemId(vo);
				String irrBnoString = "";
				String irrGoodString = "";
				String irrBadString ="";
				for(int i=0;i<irrlist.size();i++) {
					irrBnoString+=irrlist.get(i).getIrrBno();
					irrGoodString+=irrlist.get(i).getIrrGood();
					irrBadString+=irrlist.get(i).getIrrBad();
					if(i < (irrlist.size()-1)) {irrBnoString += "/";irrGoodString += "/";irrBadString += "/";}
				}
				session.setAttribute("irrBnoString",irrBnoString);
				session.setAttribute("irrGoodString",irrGoodString);
				session.setAttribute("irrBadString",irrBadString);
				
				session.setAttribute("favor",favorList);
				session.setAttribute("member", memlogin);
				return "redirect:/";
			}
		}else {
			// 판매자 회원의 경우
			SellerVO selvo = new SellerVO();
			selvo.setSelId(memId);
			selvo.setSelPwd(memPwd);
			SellerVO sellogin = sellerservice.sellerLogin(selvo);
			if(sellogin == null) {
				//판매자 로그인 실패
				model.addAttribute("loginResult", "failed");
				return "member/login";
			}else {
				//판매자 로그인 성공
				// 찜목록 세션에 담기
				List<FavorVO> list = favorservice.favorGetListByMemId(memId);
				String favorList = ""; //리스트에서 pdid만 담을 문자열, 구분자는 /로 한다
				for(int i=0;i<list.size();i++) {
					favorList += list.get(i).getFvpdId();
					if(i < (list.size()-1)) {favorList += "/";}
				}
				//상품리뷰 추천/비추천 세션에 담기
				InquiryRecoReportVO vo = new InquiryRecoReportVO();
				vo.setIrrmemId(memId);
				List<InquiryRecoReportVO> irrlist = irrService.irrGetAllByMemId(vo);
				String irrBnoString = "";
				String irrGoodString = "";
				String irrBadString ="";
				for(int i=0;i<irrlist.size();i++) {
					irrBnoString+=irrlist.get(i).getIrrBno();
					irrGoodString+=irrlist.get(i).getIrrGood();
					irrBadString+=irrlist.get(i).getIrrBad();
					if(i < (irrlist.size()-1)) {irrBnoString += "/";irrGoodString += "/";irrBadString += "/";}
				}
				session.setAttribute("irrBnoString",irrBnoString);
				session.setAttribute("irrGoodString",irrGoodString);
				session.setAttribute("irrBadString",irrBadString);
				
				session.setAttribute("favor",favorList);
				session.setAttribute("seller", sellogin);
				return "redirect:/";
			}
		}
		
		
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String memNSelLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	/************* 회원가입관련 *************/
	// 회원가입 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String loginGET() {

		return "/member/join";
	}
	

	// 아이디 중복 검사 - 입력받은 아이디를 일반회원 / 판매자회원 2개의 테이블에서 중복여부 검사
	@RequestMapping(value = "/memIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memId) throws Exception {

		long memResult = memberservice.idCheck(memId);
		long selResult = sellerservice.sellerIdcheck(memId);

		if (memResult != 0 || selResult != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}

	}
	
	// 이메일 중복 검사 - 입력받은 이메일을 일반회원 / 판매자회원 2개의 테이블에서 중복여부 검사
		@RequestMapping(value = "/memEmailCheck", method = RequestMethod.POST)
		@ResponseBody
		public String memberEmailChkPOST(String memEmail) throws Exception {

			long memResult = memberservice.emailCheck(memEmail);
			long selResult = sellerservice.sellerEmailCheck(memEmail);

			if (memResult != 0 || selResult != 0) {
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
				String memGrade = "Friend"; //기본값은 friend
				Long memChoice = 0L;
				//아래IF문 => 리팩토링 예정
				if(choiceSelectBoxOne != null) {memChoice += 1L;}
				if(choiceSelectBoxTwo != null) {memChoice += 10L;}
				if(choiceSelectBoxThree != null) {memChoice += 100L;}
				MemberVO vo = new MemberVO(memId, memPwd, memName, memEmail, memPhone, memAddress, memGender, memGrade, null, null, memChoice);
				memberservice.memberJoin(vo); //회원테이블 추가
				
				ShipVO shpVo = new ShipVO(); //기본배송지 추가
				shpVo.setSlmemId(memId);
				shpVo.setSlAddress(memAddress);
				shpService.shipInsert(shpVo);
				
				return "redirect:/member/login";
			}else {
				// typeSelRadio=="sellerMem" (판매점인 경우)
				String selAddress = mainPostcode + " " + mainAddress + " " + mainDetailAddress;
				String memGrade = "Friend"; //기본값은 friend
				Long selTypeGrade = 1L; //기본값은 1
				Long memChoice = 0L;
				if(choiceSelectBoxOne != null) {memChoice += 1L;}
				if(choiceSelectBoxTwo != null) {memChoice += 10L;}
				if(choiceSelectBoxThree != null) {memChoice += 100L;}
				SellerVO vo = new SellerVO(memId, memPwd, memName, selstlBrandName, memEmail, memPhone, selAddress, memGender,memGrade,selMarketUniqueNo,selSelRegiNo,memChoice,selTypeGrade,null,null);
				sellerservice.selJoin(vo);
				
				ShipVO shpVo = new ShipVO(); //기본배송지 추가
				shpVo.setSlmemId(memId);
				shpVo.setSlAddress(selAddress);
				shpService.shipInsert(shpVo);
				return "redirect:/member/login";
			}
		}
		
		
		/* 아이디 찾기 이동*/
		@RequestMapping(value = "/findId", method = RequestMethod.GET)
		public String memberFindId() {
			return "/member/findId";
		}
		
		/* 아이디 찾기 AJAX*/
		@RequestMapping(value = "/findIdAct", method = RequestMethod.GET)
		@ResponseBody
		public String memberFindIdAct(String memName,String memPhone,String selSelRegiNo) {
			if(selSelRegiNo.equals("defaultMember")) {
				//일반회원의 경우
				MemberVO vo = new MemberVO();
				vo.setMemName(memName);
				vo.setMemPhone(memPhone);
				MemberVO result = memberservice.memIdFindSelect(vo);
				if(result != null) {
					// 이름과 전화번호에 해당하는 아이디 찾음
					return result.getMemId();
				}else {
					// 해당하는 아이디 없음
					return "failed";
				}
			}else {
				//판매자회원의 경우
				SellerVO vo =new SellerVO();
				vo.setSelName(memName);
				vo.setSelPhone(memPhone);
				vo.setSelSelRegiNo(selSelRegiNo);
				SellerVO result = sellerservice.sellerIdFind(vo);
				if(result!=null) {
					return result.getSelId();
				}else {
					return "failed";
				}
			}
			
		}
		
		/* 비밀번호 찾기 이동 */
		@RequestMapping(value = "/findPwd", method = RequestMethod.GET)
		public String memberFindPwd() {
			return "/member/findPwd";
		}
		
		/* 비밀번호 찾기 AJAX*/
		@RequestMapping(value = "/findPwdAct", method = RequestMethod.GET)
		@ResponseBody
		public String memberFindIdAct(String memId, String memName,String memPhone,String selSelRegiNo) {
			if(selSelRegiNo.equals("defaultMember")) {
				//일반회원의 경우
				MemberVO vo = new MemberVO();
				vo.setMemId(memId);
				vo.setMemName(memName);
				vo.setMemPhone(memPhone);
				MemberVO result = memberservice.memPwdFindSelect(vo);
				if(result != null) {
					// 이름과 전화번호에 해당하는 아이디 찾음
					return result.getMemId();
				}else {
					// 해당하는 아이디 없음
					return "failed";
				}
			}else {
				//판매자회원의 경우
				SellerVO vo =new SellerVO();
				vo.setSelId(memId);
				vo.setSelName(memName);
				vo.setSelPhone(memPhone);
				vo.setSelSelRegiNo(selSelRegiNo);
				SellerVO result = sellerservice.sellerPwdFind(vo);
				if(result!=null) {
					return result.getSelId();
				}else {
					return "failed";
				}
			}
		}
		
		/* 비밀번호 수정폼 진입 */
		@RequestMapping(value = "/updatePwdForm", method = RequestMethod.POST)
		public String memberPwdUpdateEnter(String memId,String typeSelRadio,Model model) {
			model.addAttribute("memId",memId);
			model.addAttribute("typeSelRadio",typeSelRadio);
			return "/member/pwdUpdateForm";
		}
		
		
		/* 비밀번호 수정 */
		@RequestMapping(value = "/updatePwdAct", method = RequestMethod.GET)
		public String memberPwdUpdateAct(String memId,String memPwd,String typeSelRadio) {
			if(typeSelRadio.equals("normalMem")) {
				//일반회원의 경우
				MemberVO vo = new MemberVO();
				vo.setMemId(memId);
				vo.setMemPwd(memPwd);
				memberservice.memPwdUpdate(vo);
				return "redirect:/member/login";
			}else {
				//판매자회원의 경우
				SellerVO vo = new SellerVO();
				vo.setSelId(memId);
				vo.setSelPwd(memPwd);
				sellerservice.sellerUpdatePwd(vo);
				return "redirect:/member/login";
			}
		}
		
	
}