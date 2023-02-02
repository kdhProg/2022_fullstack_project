package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.QnVO;

@Repository
public class QnDAOImpl implements QnDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public long qnInsert(QnVO vo) {
		return session.insert("qnMapper.qnInsert", vo);
	}

	@Override
	public long qnUpdate(QnVO vo) {
		return session.update("qnMapper.qnUpdate", vo);
	}

	@Override
	public long qnDelete(Long otqNo) {
		return session.delete("qnMapper.qnDelete", otqNo);
	}

	@Override
	public QnVO qnSelOne(Long otqNo) {
		return session.selectOne("qnMapper.qnSelOne", otqNo);
	}

	@Override
	public int getQnCount() {
		return session.selectOne("qnMapper.getQnCount");
	}

	@Override
	public List<QnVO> getQnPageList(PagingVO vo) {
		return session.selectList("qnMapper.getQnPageList", vo);
	}

	@Override
	public List<QnVO> getQnAdminPageList(PagingVO vo) {
		return session.selectList("qnMapper.getQnAdminPageList", vo);
	}

// 관리자 전용(답변 상태 업데이트)	
	@Override
	public long qnStateUpdate(QnVO qnVo) {
		return session.update("qnMapper.qnStateUpdate", qnVo);
	}

	@Override
	public int getQnAdminCount(PagingVO sortVo) {
		return session.selectOne("qnMapper.getQnAdminCount",sortVo);
	}

	
}
