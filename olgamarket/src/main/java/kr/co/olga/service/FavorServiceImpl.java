package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.FavorDAO;
import kr.co.olga.vo.FavorVO;
import kr.co.olga.vo.PagingVO;

@Service
public class FavorServiceImpl implements FavorService {

	@Autowired
	private FavorDAO dao;

	@Override
	public long favorInsert(FavorVO vo) {
		return dao.favorInsert(vo);
	}

	@Override
	public long favorDelOne(long fvNo) {
		return dao.favorDelOne(fvNo);
	}

	@Override
	public FavorVO favorSelectOne(long fvNo) {
		return dao.favorSelectOne(fvNo);
	}

	@Override
	public List<FavorVO> favorSelectList() {
		return dao.favorSelectList();
	}
	
	@Override
	public List<FavorVO> favorGetListByMemId(String memId) {
		return dao.favorGetListByMemId(memId);
	}
	
	@Override
	public int favorDeleteByMemIdNPdId(FavorVO vo) {
		return dao.favorDeleteByMemIdNPdId(vo);
	}

// 마이페이지 찜 목록 페이징	
	@Override
	public PagingVO getMemFavorPageInfo(int currPage, String fvmemId) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getMemFavorCount(fvmemId);
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getMemFavorCount(fvmemId) * 1.0) / 20));
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
		vo.setFvmemId(fvmemId);
		
		return vo;
	}

	@Override
	public List<FavorVO> getMemFavorPageList(PagingVO vo) {
		return dao.getMemFavorPageList(vo);
	}

}