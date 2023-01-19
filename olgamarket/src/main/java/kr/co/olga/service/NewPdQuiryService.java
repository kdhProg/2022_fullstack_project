package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SelQuiryVO;

public interface NewPdQuiryService {
	
// 신상품 등록 문의 페이징
	PagingVO getNewPdQuiryPageInfo(int currPage, int sortType);

	List<SelQuiryVO> getNewPdQuiryPageList(PagingVO vo);

}
