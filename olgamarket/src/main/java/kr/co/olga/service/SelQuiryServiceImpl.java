package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.SelQuiryDAO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SelQuiryVO;
import lombok.NonNull;

@Service
public class SelQuiryServiceImpl implements SelQuiryService {

	@Autowired
	private SelQuiryDAO dao;
	
// 관리자 판매자 페이징 	
	@Override
	public PagingVO getSelQuiryPageInfo(int currPage, int sortType) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getSelQuiryCount();
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getSelQuiryCount() * 1.0) / 20));
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
	public List<SelQuiryVO> getSelQuiryPageList(PagingVO vo) {
		return dao.getSelQuiryPageList(vo);
	}
// 조회
	@Override
	public SelQuiryVO getSelectOne(Long sqNo) {
		return dao.getSelectOne(sqNo);
	}
	
// 답변 작성 시 답변 상태 업데이트	
	@Override
	public long selQuiryStateUpdate(SelQuiryVO sqVo) {
		return dao.selQuiryStateUpdate(sqVo);
	}

// 문의글 작성	
	@Override
	public long selQuiryInsert(SelQuiryVO vo) {
		return dao.selQuiryInsert(vo);
	}

// 판매자 페이지
	@Override
	public List<SelQuiryVO> getSelectList(@NonNull Long pdId) {
		return dao.getSelectList(pdId);
	}

// 수정	
	@Override
	public long selQuiryUpdate(SelQuiryVO vo) {
		return dao.selQuiryUpdate(vo);
	}

// 삭제	
	@Override
	public long selQuiryDelete(Long sqNo) {
		return dao.selQuiryDelete(sqNo);
	}
}
