package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.StoreVO;

public interface StoreService {

	long storeInsert(StoreVO vo);

	long storeUpdate(StoreVO vo);

	long storeDeleteOne(Long stlNo);

	StoreVO storeSelectOne(Long stlNo);

	PagingVO getStorePageInfo(int currPage);

	List<StoreVO> getStorePageList(PagingVO vo);

	//2023 01 18 김동훈 추가
	StoreVO storeSelectByMarketUniqueNo(String stlMarketUniqueNo);

}
