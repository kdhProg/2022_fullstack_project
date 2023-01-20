package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SelQuiryVO;
import lombok.NonNull;

public interface SelQuiryService {

// 관리자 판매자 페이징 	
	PagingVO getSelQuiryPageInfo(int currPage, int sortType);

	List<SelQuiryVO> getSelQuiryPageList(PagingVO vo);

// 조회
	SelQuiryVO getSelectOne(Long sqNo);

// 답변 작성 시 답변 상태 업데이트	
	long selQuiryStateUpdate(SelQuiryVO sqVo);

// 문의글 작성	
	long selQuiryInsert(SelQuiryVO vo);

// 판매자 페이지	
	List<SelQuiryVO> getSelectList(@NonNull Long pdId);

// 수정	
	long selQuiryUpdate(SelQuiryVO vo);

// 삭제	
	long selQuiryDelete(Long sqNo);


}
