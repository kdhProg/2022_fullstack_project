package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;

public interface NoticeService {

	long noticeInsert(NoticeVO vo);
	
	long noticeUpdate(NoticeVO vo);

	long noticeDeleteOne(long ntNo);

	NoticeVO noticeSelectOne(long ntNo);
	
	List<NoticeVO> noticeSelectList(PagingVO paging);

	PagingVO getNoticePageInfo(int currPage);

	List<NoticeVO> getNoticePageList(PagingVO vo);


	

	

	

}
