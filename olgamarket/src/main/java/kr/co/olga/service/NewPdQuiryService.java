package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.NewPdQuiryVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SelQuiryVO;

public interface NewPdQuiryService {
	
// 신상품 등록 문의 페이징
	PagingVO getNewPdQuiryPageInfo(int currPage, int sortType, String npqselId);

	List<SelQuiryVO> getNewPdQuiryPageList(PagingVO vo);

// 조회	
	NewPdQuiryVO newPdQuirySelectOne(Long npqNo);

// 글 등록 	
	long newPdQuiryInsert(NewPdQuiryVO vo);

// 글 수정	
	long newPdQuiryUpdate(NewPdQuiryVO vo);

// 글 삭제	
	long newPdQuiryDelete(Long npqNo);

// 답글 입력 시 답변 상태 업데이트	
	long newPdQuiryStateUpdate(NewPdQuiryVO npqVo);


}
