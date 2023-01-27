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
	
	// vo에 들어있는 slmemId에 해당하는 리스트 반환
	List<ShipVO> getShipListByMemId(ShipVO vo);
	

}
