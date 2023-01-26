package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.ReviewDAO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO dao;
	
	@Override
	public long reviewInsert(ReviewVO vo) {
		return dao.reviewInsert(vo);
	}
	
	@Override
	public long reviewDelOne(long rvNo) {
		return dao.reviewDelOne(rvNo);
	}
	
	@Override
	public long reviewUpd(ReviewVO vo) {
		return dao.reviewUpd(vo);
	}
	
	@Override
	public long reviewNiceUp(long rvNo) {
		return dao.reviewNiceUp(rvNo);
	}
	
	@Override
	public long reviewRptUp(long rvNo) {
		return dao.reviewRptUp(rvNo);
	}
	
	@Override
	public ReviewVO reviewSelOne(long rvNo) {
		return dao.reviewSelOne(rvNo);
	}
	
	@Override
	public PagingVO getRvPageInfo(int currPage, int sortType,int getPdId) {
		
		int setTotalRecordCount = dao.getRvCount(getPdId);
		int recordCountPerPage = 10;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getRvCount(getPdId) * 1.0) / 10));
		if(realEnd < lastPageNoOnPageList) {
			lastPageNoOnPageList = realEnd;
		}
		
		int firstRecordIndex = (currPage - 1) * recordCountPerPage;
		boolean xprev= firstPageNoOnPageList > 1;
		boolean xnext = lastPageNoOnPageList < realEnd;
		
		int contEnd = currPage*10;
		int contStart = contEnd-9;
		if(contEnd > setTotalRecordCount) {
			contEnd = setTotalRecordCount;
		}
		PagingVO vo = new PagingVO();
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
		vo.setSort(sortType);
		vo.setPdId(getPdId);
		
		return vo;
	}
	
	@Override
	public List<ReviewVO> getRvPageList(PagingVO vo) {
		return dao.getRvPageList(vo);
	}
	
	@Override
	public long reviewNiceSubtract(long rvNo) {
		return dao.reviewNiceSubtract(rvNo);
	}
	
	@Override
	public long reviewRptSubtract(long rvNo) {
		return dao.reviewRptSubtract(rvNo);
	}
	
}
