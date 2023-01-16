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
	public long qnDelete(long otqNo) {
		return session.delete("qnMapper.qnDelete", otqNo);
	}

	@Override
	public QnVO qnSelOne(long otqNo) {
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
}
