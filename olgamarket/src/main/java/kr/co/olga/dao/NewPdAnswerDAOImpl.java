package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.NewPdAnswerVO;

@Repository
public class NewPdAnswerDAOImpl implements NewPdAnswerDAO {

	@Autowired
	private SqlSession session;

// 조회	
	@Override
	public List<NewPdAnswerVO> newPdAnswerSelectOne(Long npqNo) {
		return session.selectList("newPdAnswerMapper.newPdAnswerSelectOne", npqNo);
	}

// 답글 등록	
	@Override
	public long newPdAnswerInsert(NewPdAnswerVO vo) {
		return session.insert("newPdAnswerMapper.newPdAnswerInsert", vo);
	}

// 답글 수정	
	@Override
	public long newPdAnswerUpdate(NewPdAnswerVO vo) {
		return session.update("newPdAnswerMapper.newPdAnswerUpdate", vo);
	}
}
