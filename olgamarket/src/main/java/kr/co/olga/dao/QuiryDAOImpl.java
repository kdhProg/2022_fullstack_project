package kr.co.olga.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.QuiryVO;

@Repository
public class QuiryDAOImpl implements QuiryDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public long quiryInsert(QuiryVO vo) {
		return session.insert("quiryMapper.quiryInsert",vo);
	}
	
	@Override
	public long quiryDelOne(long iqNo) {
		return session.delete("quiryMapper.quiryDelOne",iqNo);
	}
	
	@Override
	public long quiryUpd(QuiryVO vo) {
		return session.update("quiryMapper.quiryUpd",vo);
	}
	
	@Override
	public QuiryVO quirySelOne(long iqNo) {
		return session.selectOne("quiryMapper.quirySelOne",iqNo);
	}
}
