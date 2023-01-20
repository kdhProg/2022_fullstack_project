package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.NewPdQuiryDAO;
import kr.co.olga.vo.NewPdQuiryVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SelQuiryVO;

@Service
public class NewPdQuiryServiceImpl implements NewPdQuiryService {

	@Autowired
	private NewPdQuiryDAO dao;

// 신상품 등록 문의 페이징	
	@Override
	public PagingVO getNewPdQuiryPageInfo(int currPage, int sortType, String npqselId) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getNewPdQuiryCount();
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getNewPdQuiryCount() * 1.0) / 20));
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
		vo.setSort(sortType);
		vo.setNpqselId(npqselId);
		
		return vo;
	}

	@Override
	public List<SelQuiryVO> getNewPdQuiryPageList(PagingVO vo) {
		return dao.getNewPdQuiryPageList(vo);
	}

// 조회 	
	@Override
	public NewPdQuiryVO newPdQuirySelectOne(Long npqNo) {
		return dao.newPdQuirySelectOne(npqNo);
	}

// 글 등록
	@Override
	public long newPdQuiryInsert(NewPdQuiryVO vo) {
		return dao.newPdQuiryInsert(vo);
	}

// 글 수정	
	@Override
	public long newPdQuiryUpdate(NewPdQuiryVO vo) {
		return dao.newPdQuiryUpdate(vo);
	}

// 글 삭제	
	@Override
	public long newPdQuiryDelete(Long npqNo) {
		return dao.newPdQuiryDelete(npqNo);
	}

// 답글 입력 시 답변 상태 업데이트	
	@Override
	public long newPdQuiryStateUpdate(NewPdQuiryVO npqVo) {
		return dao.newPdQuiryStateUpdate(npqVo);
	}

// 신상품 등록 문의 페이징 (관리자)	
	@Override
	public PagingVO getNewPdQuiryAdminPageInfo(int currPage, int sortType) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getNewPdQuiryAdminCount();
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getNewPdQuiryAdminCount() * 1.0) / 20));
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
		vo.setSort(sortType);
		
		return vo;
	}

	@Override
	public List<SelQuiryVO> getNewPdQuiryAdminPageList(PagingVO vo) {
		return dao.getNewPdQuiryAdminPageList(vo);
	}
}
