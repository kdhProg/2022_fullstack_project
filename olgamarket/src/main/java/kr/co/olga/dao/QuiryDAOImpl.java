package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.PagingVO;
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
	public QuiryVO quirySelOne(Long iqNo) {
		return session.selectOne("quiryMapper.quirySelOne",iqNo);
	}
	
	@Override
	public int getQrCount(int getPdId) {
		return session.selectOne("quiryMapper.quiryCountPdId",getPdId);
	}
	
	@Override
	public List<QuiryVO> getRvPageList(PagingVO vo) {
		return session.selectList("quiryMapper.quiryGetPdList",vo);
	}

	@Override
	public int getQuiryAdminCount() {
		return session.selectOne("quiryMapper.getQuiryAdminCount");
	}

	@Override
	public List<QuiryVO> getQuiryAdminPageList(PagingVO vo) {
		return session.selectList("quiryMapper.getQuiryAdminPageList", vo);
	}

// 관리자 전용(답변 상태 업데이트)	
	@Override
	public long quiryStateUpdate(QuiryVO quVo) {
		return session.update("quiryMapper.quiryStateUpdate", quVo);
	}
}
