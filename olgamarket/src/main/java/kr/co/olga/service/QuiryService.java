package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.QuiryVO;

public interface QuiryService {

	// 넘겨준 VO객체 추가
	long quiryInsert(QuiryVO vo);
	
	// iqNO에 해당하는 레코드 삭제
	long quiryDelOne(long iqNo);

	// 넘겨준 VO의 iqNo에 해당하는 레코드 수정
	long quiryUpd(QuiryVO vo);

	// iqNo에 해당하는 레코드 가져옴
	QuiryVO quirySelOne(Long iqNo);

	PagingVO getRvPageInfo(int currPage, int getPdId);

	List<QuiryVO> getRvPageList(PagingVO vo);

	PagingVO getQuiryAdminPageInfo(int currPage, int sortType);

	List<QuiryVO> getQuiryAdminPageList(PagingVO vo);

// 관리자 전용(답변 상태 업데이트)	
	long quiryStateUpdate(QuiryVO quVo);

// 마이페이지 상품문의 목록 페이징	
	PagingVO getMemQuiryPageInfo(int currPage, String iqmemId);

	List<QuiryVO> getMemQuiryPageList(PagingVO vo);


}
