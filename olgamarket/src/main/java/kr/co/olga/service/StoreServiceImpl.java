package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.StoreDAO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.StoreVO;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDAO dao;

	@Override
	public long storeInsert(StoreVO vo) {
		return dao.storeInsert(vo);
	}

	@Override
	public long storeUpdate(StoreVO vo) {
		return dao.storeUpdate(vo);
	}

	@Override
	public long storeDeleteOne(String stlBrandName) {
		return dao.storeDeleteOne(stlBrandName);
	}

	@Override
	public StoreVO storeSelectOne(String stlBrandName) {
		return dao.storeSelectOne(stlBrandName);
	}

// 관리자 판매점 관리 페이징	
	@Override
	public PagingVO getStorePageInfo(int currPage) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getStoreCount();
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getStoreCount() * 1.0) / 20));
		if(realEnd < lastPageNoOnPageList) {
			lastPageNoOnPageList = realEnd;
		}
		
		int firstRecordIndex = (currPage - 1) * recordCountPerPage;
		boolean xprev= firstPageNoOnPageList > 1;
		boolean xnext = lastPageNoOnPageList < realEnd;
		
		int contEnd = currPage*20;
		int contStart = contEnd-19;
		if(contEnd > setTotalRecordCount) {
			contEnd = setTotalRecordCount;
		}
		
		vo.setCurrentpageno(currPage);
		vo.setFirstPageNoOnPageList(firstPageNoOnPageList);
		vo.setFirstRecordIndex(firstRecordIndex);
		vo.setLastPageNoOnPageList(lastPageNoOnPageList);
		vo.setRealEnd(realEnd);
		vo.setRecordCountPerPage(recordCountPerPage);
		vo.setTotalRecordCount(setTotalRecordCount);
		vo.setXnext(xnext);
		vo.setXprev(xprev);
		vo.setContEnd(contEnd);
		vo.setContStart(contStart);
		
		return vo;
	}

	@Override
	public List<StoreVO> getStorePageList(PagingVO vo) {
		return dao.getStorePageList(vo);
	}
}
