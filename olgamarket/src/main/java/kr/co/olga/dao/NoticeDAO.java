package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;

public interface NoticeDAO {

	long noticeInsert(NoticeVO vo);

	long noticeUpdate(NoticeVO vo);
	
	long noticeDeleteOne(long ntNo);
	
	NoticeVO noticeSelectOne(long ntNo);

	List<NoticeVO> noticeSelectList(PagingVO paging);

	int getNoticeCount();

	List<NoticeVO> getNoticePageList(PagingVO vo);

	

	

}
