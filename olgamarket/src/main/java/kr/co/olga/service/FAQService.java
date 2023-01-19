package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.FAQVO;
import kr.co.olga.vo.PagingVO;

public interface FAQService {

	long faqInsert(FAQVO vo);

	long faqUpdate(FAQVO vo);

	long faqDeleteOne(long faqNo);

	FAQVO faqSelectOne(long faqNo);

	List<FAQVO> faqSelectList(long faqNo);

	PagingVO getFaqPageInfo(int currPage,String category);

	List<FAQVO> getFaqPageList(PagingVO vo);

	PagingVO getFaqAdminPageInfo(int currPage);

	List<FAQVO> getFaqAdminPageList(PagingVO vo);
	

}
