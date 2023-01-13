package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.NoticeDAO;
import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO dao;

	@Override
	public long noticeInsert(NoticeVO vo) {
		return dao.noticeInsert(vo);
	}
	
	@Override
	public long noticeUpdate(NoticeVO vo) {
		return dao.noticeUpdate(vo);
	}

	@Override
	public long noticeDeleteOne(long ntNo) {
		return dao.noticeDeleteOne(ntNo);
	}
	
	@Override
	public NoticeVO noticeSelectOne(long ntNo) {
		return dao.noticeSelectOne(ntNo);
	}

	@Override
	public List<NoticeVO> noticeSelectList(PagingVO paging) {
		return dao.noticeSelectList(paging);
	}

// 공지사항 목록 페이징	
	@Override
	public PagingVO getNoticePageInfo(int currPage) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getNoticeCount();
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getNoticeCount() * 1.0) / 20));
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
	public List<NoticeVO> getNoticePageList(PagingVO vo) {
		return dao.getNoticePageList(vo);
	}

	

	
	
	
}
