package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.ShipVO;

public interface ShipDAO {

	long shipInsert(ShipVO vo);

	long shipDelOne(long slNo);

	long shipUpdate(ShipVO vo);

	ShipVO shipSelectOne(long slNo);

	List<ShipVO> shipSelectList();


}
