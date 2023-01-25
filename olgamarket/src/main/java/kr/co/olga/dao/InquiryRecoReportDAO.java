package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.InquiryRecoReportVO;

public interface InquiryRecoReportDAO {

	int insertIrr(InquiryRecoReportVO vo);

	int existCheckMemIdBno(InquiryRecoReportVO vo);

	int irrUpdate(InquiryRecoReportVO vo);

	List<InquiryRecoReportVO> irrGetAllByMemId(InquiryRecoReportVO vo);

}
