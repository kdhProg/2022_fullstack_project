package kr.co.olga.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.AnVO;

@Repository
public class AnDAOImpl implements AnDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public long An(AnVO vo) {
		return session.insert("anMapper.anInsert", vo);
	}

	@Override
	public long anUpdate(AnVO vo) {
		return session.update("anMapper.anUpdate", vo);
	}

	@Override
	public long anDelete(long otaotqNo) {
		return session.delete("anMapper.anDelete", otaotqNo);
	}

	@Override
	public AnVO anSelOne(long otaotqNo) {
		return session.selectOne("anMapper.anSelOne", otaotqNo);
	}
}
