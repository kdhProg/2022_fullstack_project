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

}
