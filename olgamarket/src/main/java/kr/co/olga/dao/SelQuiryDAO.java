package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SelQuiryVO;

public interface SelQuiryDAO {

// 관리자 판매자 페이징
	int getSelQuiryCount();

	List<SelQuiryVO> getSelQuiryPageList(PagingVO vo);
// 조회
	SelQuiryVO getSelectOne(Long sqNo);

// 답변 작성 시 답변 상태 업데이트
	long selQuiryStateUpdate(SelQuiryVO sqVo);

}
