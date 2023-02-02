package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.PurchaseVO;

public interface PurchaseService {

// 관리자 페이징	
	PagingVO getMemPurchaseAdminPageInfo(int currPage, int sortType);

	List<MemberVO> getMemPurchaseAdminPageList(PagingVO vo);

// 마이페이지 주문 내역 페이징	
	PagingVO getMemPurchasePageInfo(int currPage, String plmemId);

	List<PurchaseVO> getMemPurchasePageList(PagingVO vo);

	// 단순 인서트
	int insertPurchase(PurchaseVO vo);
	
	// vo에 들어있는 pdId,memId에 해당하는 레코드 개수 조회
	int countCaseByMemIdNPdId(PurchaseVO vo);

// 관리자 통계 - 매출(당일, 1일전, 2일전, 3일전)	
	Long dayPriceTotalSelect();

	String daySelect();

	Long dayPriceTotalSelect2();

	Long dayPriceTotalSelect3();

	Long dayPriceTotalSelect4();

// 관리자 통계 - 매출(당월, 전월, 두 달전, 세 달전)
	Long monthPriceTotalSelect1();

	Long monthPriceTotalSelect2();

	Long monthPriceTotalSelect3();

	Long monthPriceTotalSelect4();

// 관리자 통계 - 매출(올해, 1년전, 2년전, 3년전)
	Long yearPriceTotalSelect1();

	Long yearPriceTotalSelect2();

	Long yearPriceTotalSelect3();

	Long yearPriceTotalSelect4();
	
	Long yearPriceTotalSelect5();

	Long yearPriceTotalSelect6();

	Long yearPriceTotalSelect7();

	Long yearPriceTotalSelect8();

	Long yearPriceTotalSelect9();

	Long yearPriceTotalSelect10();

	Long yearPriceTotalSelect11();

// 관리자 통계 - 매출(누적)	
	Long allPriceTotalSelect();

	//memId에 해당하는 적립금 전부 더하기
	Long sumSavedMoneyByMemId(MemberVO vo);
	

	

}
