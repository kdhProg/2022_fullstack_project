package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.InquiryRecoReportVO;

@Repository
public class InquiryRecoReportDAOImpl implements InquiryRecoReportDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertIrr(InquiryRecoReportVO vo) {
		return session.insert("inquiryRecoReportMapper.insertIrr",vo);
	}
	
	@Override
	public int existCheckMemIdBno(InquiryRecoReportVO vo) {
		return session.selectOne("inquiryRecoReportMapper.existCheckMemIdBno",vo);
	}
	
	@Override
	public int irrUpdate(InquiryRecoReportVO vo) {
		return session.update("inquiryRecoReportMapper.irrUpdate",vo);
	}
	
	@Override
	public List<InquiryRecoReportVO> irrGetAllByMemId(InquiryRecoReportVO vo) {
		return session.selectList("inquiryRecoReportMapper.irrGetAllByMemId",vo);
	}

}
