package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.PurchaseVO;

public interface PurchaseDAO {
	
// 관리자 페이징
	int getMemPurchaseAdminCount();

	List<PurchaseVO> getMemPurchaseAdminPageList(PagingVO vo);

}
