package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.ReviewDAO;
import kr.co.olga.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO dao;
	
	@Override
	public long reviewInsert(ReviewVO vo) {
		return dao.reviewInsert(vo);
	}
	
	@Override
	public long reviewDelOne(long rvNo) {
		return dao.reviewDelOne(rvNo);
	}
	
	@Override
	public long reviewUpd(ReviewVO vo) {
		return dao.reviewUpd(vo);
	}
	
	@Override
	public long reviewNiceUp(long rvNo) {
		return dao.reviewNiceUp(rvNo);
	}
	
	@Override
	public long reviewRptUp(long rvNo) {
		return dao.reviewRptUp(rvNo);
	}
	
	@Override
	public ReviewVO reviewSelOne(long rvNo) {
		return dao.reviewSelOne(rvNo);
	}
	
}
