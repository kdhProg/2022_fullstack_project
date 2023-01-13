package kr.co.olga.service;

import kr.co.olga.vo.QuiryVO;

public interface QuiryService {

	// 넘겨준 VO객체 추가
	long quiryInsert(QuiryVO vo);
	
	// iqNO에 해당하는 레코드 삭제
	long quiryDelOne(long iqNo);

	// 넘겨준 VO의 iqNo에 해당하는 레코드 수정
	long quiryUpd(QuiryVO vo);

	// iqNo에 해당하는 레코드 가져옴
	QuiryVO quirySelOne(long iqNo);

}
