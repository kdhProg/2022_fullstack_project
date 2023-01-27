package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ShipVO;

public interface ShipDAO {

	long shipInsert(ShipVO vo);

	long shipDelOne(long slNo);

	long shipUpdate(ShipVO vo);

	ShipVO shipSelectOne(long slNo);

	List<ShipVO> shipSelectList();

// 마이 페이지 배송지 페이징
	int getMemShipCount(String slmemId);

	List<ShipVO> getMemShipPageList(PagingVO vo);

	List<ShipVO> getShipListByMemId(ShipVO vo);


}
