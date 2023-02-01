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

// 관리자 통계 - 매출(일일)	
	long daySalesVolumeSelect();

	String daySelect();

}
