package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.InquiryRecoReportDAO;
import kr.co.olga.vo.InquiryRecoReportVO;

@Service
public class InquiryRecoReportServiceImpl implements InquiryRecoReportService {
	
	@Autowired
	private InquiryRecoReportDAO dao;
	
	@Override
	public int insertIrr(InquiryRecoReportVO vo) {
		return dao.insertIrr(vo);
	}
	
	@Override
	public int existCheckMemIdBno(InquiryRecoReportVO vo) {
		return dao.existCheckMemIdBno(vo);
	}
	
	@Override
	public int irrUpdate(InquiryRecoReportVO vo) {
		return dao.irrUpdate(vo);
	}
	
	@Override
	public List<InquiryRecoReportVO> irrGetAllByMemId(InquiryRecoReportVO vo) {
		return dao.irrGetAllByMemId(vo);
	}

}
