package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.StoreVO;

public interface StoreDAO {

	long storeInsert(StoreVO vo);

	long storeUpdate(StoreVO vo);

	long storeDeleteOne(String stlBrandName);

	StoreVO storeSelectOne(String stlBrandName);

	int getStoreCount();

	List<StoreVO> getStorePageList(PagingVO vo);

}
