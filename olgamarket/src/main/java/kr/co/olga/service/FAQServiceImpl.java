package kr.co.olga.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.FAQDAO;
import kr.co.olga.vo.FAQVO;
import kr.co.olga.vo.PagingVO;

@Service
public class FAQServiceImpl implements FAQService {

	@Autowired
	private FAQDAO dao;
	//주ㅅ서

	@Override
	public long faqInsert(FAQVO vo) {
		return dao.faqInsert(vo);
	}

	@Override
	public long faqUpdate(FAQVO vo) {
		return dao.faqUpdate(vo);
	}

	@Override
	public long faqDeleteOne(long faqNo) {
		return dao.faqDeleteOne(faqNo);
	}

	@Override
	public FAQVO faqSelectOne(long faqNo) {
		return dao.faqSelectOne(faqNo);
	}

	@Override
	public List<FAQVO> faqSelectList(long faqNo) {
		return dao.faqSelectList(faqNo);
	}
	
	@Override
	public PagingVO getFaqPageInfo(int currPage, String category) {
		PagingVO vo = new PagingVO();
		if(category == "") {
			category = "defaultCate";
		}
		int setTotalRecordCount = dao.getFaqCount(category);
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getFaqCount(category) * 1.0) / 20));
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
		
		ArrayList<String> cateList = new ArrayList<String>();
		
		if(category != null) {
			cateList.add(category);
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
		vo.setCategories(cateList);
		
		return vo;
	}
	
	@Override
	public List<FAQVO> getFaqPageList(PagingVO vo) {
		return dao.getFaqPageList(vo);
	}
}
