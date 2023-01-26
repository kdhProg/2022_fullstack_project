package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.QuiryVO;

public interface QuiryDAO {

	long quiryInsert(QuiryVO vo);

	long quiryDelOne(long iqNo);

	long quiryUpd(QuiryVO vo);

	QuiryVO quirySelOne(Long iqNo);

	int getQrCount(int getPdId);

	List<QuiryVO> getRvPageList(PagingVO vo);

	int getQuiryAdminCount();

	List<QuiryVO> getQuiryAdminPageList(PagingVO vo);

// 관리자 전용(답변 상태 업데이트)	
	long quiryStateUpdate(QuiryVO quVo);

// 마이페이지 상품문의 목록 페이징
	int getMemQuiryCount(String iqmemId);

	List<QuiryVO> getMemQuiryPageList(PagingVO vo);

}
