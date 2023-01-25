package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.InquiryRecoReportVO;

public interface InquiryRecoReportService {
	
	// 새 컬럼 만들기 => 아무것도 없을때 만들기, 이후에는 추천0 비추천0으로 업데이트 하는 방식으로 하기
	int insertIrr(InquiryRecoReportVO vo);
	
	// memId와 Bno의 행이 존재하는지 확인용
	int existCheckMemIdBno(InquiryRecoReportVO vo);
	
	// 추천 +1 - 필요: memId, Bno
	int irrUpdate(InquiryRecoReportVO vo);

	List<InquiryRecoReportVO> irrGetAllByMemId(InquiryRecoReportVO vo);

}
