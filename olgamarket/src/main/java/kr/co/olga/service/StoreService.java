package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.StoreVO;

public interface StoreService {

	long storeInsert(StoreVO vo);

	long storeUpdate(StoreVO vo);

	long storeDeleteOne(String stlBrandName);

	StoreVO storeSelectOne(String stlBrandName);

	PagingVO getStorePageInfo(int currPage);

	List<StoreVO> getStorePageList(PagingVO vo);

}
