package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.FavorDAO;
import kr.co.olga.dao.ShipDAO;
import kr.co.olga.vo.FavorVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ShipVO;

@Service
public class ShipServiceImpl implements ShipService {

	@Autowired
	private ShipDAO dao;

	@Override
	public long shipInsert(ShipVO vo) {
		return dao.shipInsert(vo);
	}

	@Override
	public long shipDelOne(long slNo) {
		return dao.shipDelOne(slNo);
	}

	@Override
	public long shipUpdate(ShipVO vo) {
		return dao.shipUpdate(vo);
	}

	@Override
	public ShipVO shipSelectOne(long slNo) {
		return dao.shipSelectOne(slNo);
	}

	@Override
	public List<ShipVO> shipSelectList() {
		return dao.shipSelectList();
	}

// 마이 페이지 배송지 페이징	
	@Override
	public PagingVO getMemShipPageInfo(int currPage, String slmemId) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getMemShipCount(slmemId);
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getMemShipCount(slmemId) * 1.0) / 20));
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
		vo.setSlmemId(slmemId);
		
		return vo;
	}

	@Override
	public List<ShipVO> getMemShipPageList(PagingVO vo) {
		return dao.getMemShipPageList(vo);
	}
	
	@Override
	public List<ShipVO> getShipListByMemId(ShipVO vo) {
		return dao.getShipListByMemId(vo);
	}

}