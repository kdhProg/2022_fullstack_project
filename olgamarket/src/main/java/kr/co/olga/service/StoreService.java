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

}
