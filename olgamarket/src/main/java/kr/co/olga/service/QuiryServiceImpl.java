package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.QuiryDAO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.QuiryVO;

@Service
public class QuiryServiceImpl implements QuiryService {

	@Autowired
	private QuiryDAO dao;
	
	@Override
	public long quiryInsert(QuiryVO vo) {
		return dao.quiryInsert(vo);
	}
	
	@Override
	public long quiryDelOne(long iqNo) {
		return dao.quiryDelOne(iqNo);
	}
	
	@Override
	public long quiryUpd(QuiryVO vo) {
		return dao.quiryUpd(vo);
	}
	
	@Override
	public QuiryVO quirySelOne(Long iqNo) {
		return dao.quirySelOne(iqNo);
	}
	
	@Override
	public PagingVO getRvPageInfo(int currPage, int getPdId) {
		int setTotalRecordCount = dao.getQrCount(getPdId);
		int recordCountPerPage = 10;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getQrCount(getPdId) * 1.0) / 10));
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
		vo.setPdId(getPdId);
		
		return vo;
	}
	
	@Override
	public List<QuiryVO> getRvPageList(PagingVO vo) {
		return dao.getRvPageList(vo);
	}

	@Override
	public PagingVO getQuiryAdminPageInfo(int currPage) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getQuiryAdminCount();
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getQuiryAdminCount() * 1.0) / 20));
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
	public List<QuiryVO> getQuiryAdminPageList(PagingVO vo) {
		return dao.getQuiryAdminPageList(vo);
	}

// 관리자 전용(답변 상태 업데이트)		
	@Override
	public long quiryStateUpdate(QuiryVO quVo) {
		return dao.quiryStateUpdate(quVo);
	}
}
