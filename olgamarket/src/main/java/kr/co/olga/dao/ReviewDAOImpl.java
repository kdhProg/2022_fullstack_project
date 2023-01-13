package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public long reviewInsert(ReviewVO vo) {
		return session.insert("reviewMapper.reviewInsert",vo);
	}
	
	@Override
	public long reviewDelOne(long rvNo) {
		return session.delete("reviewMapper.reviewDelOne",rvNo);
	}

	@Override
	public long reviewUpd(ReviewVO vo) {
		return session.update("reviewMapper.reviewUpd",vo);
	}
	
	@Override
	public long reviewNiceUp(long rvNo) {
		return session.update("reviewMapper.reviewNiceUp",rvNo);
	}
	
	@Override
	public long reviewRptUp(long rvNo) {
		return session.update("reviewMapper.reviewRptUp",rvNo);
	}
	
	@Override
	public ReviewVO reviewSelOne(long rvNo) {
		return session.selectOne("reviewMapper.reviewSelOne",rvNo);
	}
	
}
