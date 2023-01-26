package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ShipVO;

public interface ShipService {

	long shipInsert(ShipVO vo);

	long shipDelOne(long slNo);

	long shipUpdate(ShipVO vo);

	ShipVO shipSelectOne(long slNo);

	List<ShipVO> shipSelectList();

// 마이 페이지 배송지 페이징	
	PagingVO getMemShipPageInfo(int currPage, String slmemId);

	List<ShipVO> getMemShipPageList(PagingVO vo);
	

}
