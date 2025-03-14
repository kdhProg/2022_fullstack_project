package kr.co.olga.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.AnswerService;
import kr.co.olga.service.FavorService;
import kr.co.olga.service.InquiryRecoReportService;
import kr.co.olga.service.ProductService;
import kr.co.olga.service.PurchaseService;
import kr.co.olga.service.QuiryService;
import kr.co.olga.service.ReviewService;
import kr.co.olga.vo.AnswerVO;
import kr.co.olga.vo.FavorVO;
import kr.co.olga.vo.InquiryRecoReportVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;
import kr.co.olga.vo.PurchaseVO;
import kr.co.olga.vo.QuiryVO;
import kr.co.olga.vo.ReviewVO;

@Controller
@RequestMapping(value = "/goods/")
public class GoodsController {
	
	@Autowired
	private ProductService pdService;
	
	@Autowired
	private ReviewService rvService;
	
	@Autowired
	private QuiryService qrService;
	
	@Autowired
	private AnswerService asService;
	
	@Autowired
	private FavorService fvService;
	
	@Autowired
	private InquiryRecoReportService irrService;
	
	@Autowired
	private PurchaseService pcService;
	
	//문자열 상품ID를 줘야함
	@RequestMapping(value="/detailView")
	public String enterDetailView(long pdId,Model model) {
		ProductVO vo = pdService.productSelectOne(pdId);
		model.addAttribute("productDetail", vo);
		return "goods/detailView";
	}
	
	/* 상품후기 컨트롤러 */
	
	@RequestMapping(value = "reviewPageInitInfos")
	@ResponseBody
	public Map<String, Object> getReviewPagingDatas(String showPage,String sort,String pdId) {
		Map<String, Object> result = new HashMap<String, Object>();


		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = Integer.parseInt(showPage);
		}
		int sortType;
		if(sort == null) {
			sortType = 1;
		}else {
			sortType = Integer.parseInt(sort);
		}
		int getPdId = Integer.parseInt(pdId);
		
		PagingVO vo = rvService.getRvPageInfo(currPage,sortType,getPdId);
		List<ReviewVO> rvPageList =  rvService.getRvPageList(vo);
		
		result.put("rvPageList",rvPageList);  //게시판목록
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지
		
		return result;
	}
	
	
	/* 상품후기 버튼 유효성 검사 */
	@PostMapping(value = "rvBtnValidationChk")
	@ResponseBody
	public String rvBtnValidationChk(String memId,String pdId) {
		long pdIdValue = Long.parseLong(pdId);
		//1단계: 해당상품 구매내역이 1건이라도 있는지 검사
		PurchaseVO testPcVO = new PurchaseVO();
		testPcVO.setPlmemId(memId);
		testPcVO.setPlpdId(pdIdValue);
		if(pcService.countCaseByMemIdNPdId(testPcVO) >= 1) {
			//해당상품의 구매내역이 1건 이상 존재
			//2단계: 해당상품에 작성한 리뷰의 개수가 0인가
			ReviewVO testRvVO = new ReviewVO();
			testRvVO.setRvmemId(memId);
			testRvVO.setRvpdId(pdIdValue);
			if(rvService.countByPdIdNMemId(testRvVO) == 0) {
				//리뷰를 작성하지않음 - 작성가능
				return "btnON";
			}else {
				//리뷰를 작성한 내역이 있음 - 작성불가능
				return "btnOFF";
			}
		}else {
			// 구매내역이 없음 - 작성불가능
			return "btnOFF";
		}
	}
	
	/* 상품문의 등록하기 */
	@RequestMapping(value = "/reviewRegist",method = RequestMethod.POST)
	@ResponseBody
	public String rvRegist(ReviewVO vo) {
		vo.setRvImg("/sample/reviewSample.jpg"); //이미지는 임의로 설정
		long insertResult = rvService.reviewInsert(vo);
		if(insertResult != 0) {
			// 성공시 1
			return "success";
		}else {
			// 실패시 0
			return "failed";
		}
	}
	
	/* 상품문의 컨트롤러 */
	@RequestMapping(value = "quiryPageInitInfos")
	@ResponseBody
	public Map<String, Object> getQuiryPagingDatas(String showPage,String pdId) {
		Map<String, Object> result = new HashMap<String, Object>();

		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = Integer.parseInt(showPage);
		}

		int getPdId = Integer.parseInt(pdId);
		
		PagingVO vo = qrService.getRvPageInfo(currPage,getPdId);
		List<QuiryVO> rvPageList =  qrService.getRvPageList(vo);
		
		result.put("qrPageList",rvPageList);  //게시판목록
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지
		
		return result;
	}
	
	
	/* 상품문의 등록하기 */
	@RequestMapping(value = "/quiryRegist",method = RequestMethod.POST)
	@ResponseBody
	public String quiryRegist(QuiryVO vo) {
		vo.setIqState(0L);  //답변이 아직 등록되지 않았으므로 0 지정
		long insertResult = qrService.quiryInsert(vo);
		if(insertResult != 0) {
			// 성공시 1
			return "success";
		}else {
			// 실패시 0
			return "failed";
		}
	}
	
	
	/* 상품문의 답글 띄워주기 */
	@RequestMapping(value = "/quiryAnswerShow",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> quiryAnswerShow(int iqNo) {
		Map<String, Object> result = new HashMap<String, Object>();
		AnswerVO ansVo = asService.answerSelOne(iqNo);
		QuiryVO qrVo = qrService.quirySelOne((long)iqNo);
		result.put("answer", ansVo);
		result.put("quiry", qrVo);
		return result;
	}
	
	
	/* 찜하기 delete */
	@RequestMapping(value = "/deleteFavors",method = RequestMethod.POST)
	@ResponseBody
	public void favorDelete(String currentSession,long pdId,HttpServletRequest request) {
		HttpSession session = request.getSession();
		FavorVO vo = new FavorVO();
		vo.setFvmemId(currentSession);
		vo.setFvpdId(pdId);
		
		fvService.favorDeleteByMemIdNPdId(vo);
		//세션재설정
		List<FavorVO> list = fvService.favorGetListByMemId(currentSession);
		String favorList = ""; //리스트에서 pdid만 담을 문자열, 구분자는 /로 한다
		for(int i=0;i<list.size();i++) {
			favorList += list.get(i).getFvpdId();
			if(i < (list.size()-1)) {favorList += "/";}
		}
		session.setAttribute("favor",favorList);
	}
	
	/* 찜하기 insert */
	@RequestMapping(value = "/addFavors",method = RequestMethod.POST)
	@ResponseBody
	public void favorInsert(String currentSession,long pdId,HttpServletRequest request) {
		HttpSession session = request.getSession();
		FavorVO vo = new FavorVO();
		vo.setFvmemId(currentSession);
		vo.setFvpdId(pdId);
		fvService.favorInsert(vo);
		//세션재설정
		List<FavorVO> list = fvService.favorGetListByMemId(currentSession);
		String favorList = ""; //리스트에서 pdid만 담을 문자열, 구분자는 /로 한다
		for(int i=0;i<list.size();i++) {
			favorList += list.get(i).getFvpdId();
			if(i < (list.size()-1)) {favorList += "/";}
		}
		session.setAttribute("favor",favorList);
	}
	
	
	/* ==== 추천,비추천 관련 ==== */
	/* 추천버튼눌림 + 비추해제 */
	@RequestMapping(value = "/goodBtnPressed",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> goodBtnPressed(String bno,String currentSession,String good,String bad,String situation,HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		
		String memId = currentSession;
		long goodPoint = Long.parseLong(good);
		long badPoint = Long.parseLong(bad);
		long bnoPoint = Long.parseLong(bno);

		//리뷰테이블 추천수/비추수 조정
		if(situation.equals("nothingToGood")) {
			rvService.reviewNiceUp(bnoPoint);
		}else if(situation.equals("badToGood")){
			rvService.reviewNiceUp(bnoPoint);
			rvService.reviewRptSubtract(bnoPoint);
		}else if(situation.equals("goodToNothing")){
			rvService.reviewNiceSubtract(bnoPoint);
		}else if(situation.equals("goodToBad")){
			rvService.reviewNiceSubtract(bnoPoint);
			rvService.reviewRptUp(bnoPoint);
		}else if(situation.equals("nothingToBad")){
			rvService.reviewRptUp(bnoPoint);
		}else if(situation.equals("badToNothing")){
			rvService.reviewRptSubtract(bnoPoint);
		}
		
		
		InquiryRecoReportVO vo = new InquiryRecoReportVO();
		vo.setIrrmemId(memId);
		vo.setIrrBno(bnoPoint);
		vo.setIrrGood(goodPoint);
		vo.setIrrBad(badPoint);
		
		if(irrService.existCheckMemIdBno(vo) == 1) {
			//이미 행이 존재함
			irrService.irrUpdate(vo);
		}else {
			//행이 존재하지 않음
			irrService.insertIrr(vo);
		}
		
		//VO의 memId에 해당하는 레코드리스트 반환
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
		
		//기존 세션 업데이트
		session.setAttribute("irrBnoString",irrBnoString);
		session.setAttribute("irrGoodString",irrGoodString);
		session.setAttribute("irrBadString",irrBadString);
		
		//배열에 담기
		result.put("irrBnoString",irrBnoString);
		result.put("irrGoodString",irrGoodString);
		result.put("irrBadString",irrBadString);
		
		return result;
	}

}
