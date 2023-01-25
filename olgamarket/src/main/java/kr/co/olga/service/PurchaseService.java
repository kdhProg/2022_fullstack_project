package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.PurchaseVO;

public interface PurchaseService {

// 관리자 페이징	
	PagingVO getMemPurchaseAdminPageInfo(int currPage, int sortType);

	List<PurchaseVO> getMemPurchaseAdminPageList(PagingVO vo);

}
