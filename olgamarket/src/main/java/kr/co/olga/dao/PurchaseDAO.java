package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.PurchaseVO;

public interface PurchaseDAO {
	
// 관리자 페이징
	int getMemPurchaseAdminCount(int sortType);

	List<MemberVO> getMemPurchaseAdminPageList(PagingVO vo);

// 마이페이지 주문 내역 페이징
	int getMemPurchaseCount(String plmemId);

	List<PurchaseVO> getMemPurchasePageList(PagingVO vo);

	int insertPurchase(PurchaseVO vo);

	int countCaseByMemIdNPdId(PurchaseVO vo);

// 관리자 통계 - 매출(일일)
	long daySalesVolumeSelect();

	String daySelect();

}
