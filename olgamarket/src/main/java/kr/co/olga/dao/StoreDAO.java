package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.StoreVO;

public interface StoreDAO {

	long storeInsert(StoreVO vo);

	long storeUpdate(StoreVO vo);

	long storeDeleteOne(Long stlNo);

	StoreVO storeSelectOne(Long stlNo);

	int getStoreCount();

	List<StoreVO> getStorePageList(PagingVO vo);
	
	StoreVO storeSelectByMarketUniqueNo(String stlMarketUniqueNo);

}
