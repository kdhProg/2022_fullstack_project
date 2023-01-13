package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.FAQVO;
import kr.co.olga.vo.PagingVO;

public interface FAQDAO {

	long faqInsert(FAQVO vo);

	long faqUpdate(FAQVO vo);

	long faqDeleteOne(long faqNo);

	FAQVO faqSelectOne(long faqNo);

	List<FAQVO> faqSelectList(long faqNo);

	int getFaqCount(String category);

	List<FAQVO> getFaqPageList(PagingVO vo);

}
