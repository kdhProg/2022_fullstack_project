package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.SelAnswerVO;

@Repository
public class SelAnswerDAOImpl implements SelAnswerDAO {

	@Autowired
	private SqlSession session;

// 답변 가져 오기
	@Override
	public List<SelAnswerVO> selAnswerList(Long sqNo) {
		return session.selectList("selAnswerMapper.selAnswerList", sqNo);
	}

	@Override
	public long selAnswerInsert(SelAnswerVO vo) {
		return session.insert("selAnswerMapper.selAnswerInsert", vo);
	}

	@Override
	public long selAnswerUpdate(SelAnswerVO vo) {
		return session.update("selAnswerMapper.selAnswerUpdate", vo);
	}
	
	@Override
	public int chkSaAnswerExists(SelAnswerVO vo) {
		return session.selectOne("selAnswerMapper.chkSaAnswerExists", vo);
	}


}
