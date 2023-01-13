package kr.co.olga.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.AnswerVO;

@Repository
public class AnswerDAOImpl implements AnswerDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public long Answer(AnswerVO vo) {
		return session.insert("answerMapper.answerInsert", vo);
	}
	
	@Override
	public long answerDelete(long iaiqNo) {
		return session.delete("answerMapper.answerDelete", iaiqNo);
	}

	@Override
	public long answerUpdate(AnswerVO vo) {
		return session.update("answerMapper.answerUpdate", vo);
	}

	@Override
	public AnswerVO answerSelOne(long iaiqNo) {
		return session.selectOne("answerMapper.answerSelOne",iaiqNo);
	}
	 
	 
}
