package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SelQuiryVO;

@Repository
public class SelQuiryDAOImpl implements SelQuiryDAO {

	@Autowired
	private SqlSession session;
	
// 관리자 판매자 페이징
	@Override
	public int getSelQuiryCount() {
		return session.selectOne("selQuiryMapper.getSelQuiryCount");
	}

	@Override
	public List<SelQuiryVO> getSelQuiryPageList(PagingVO vo) {
		return session.selectList("selQuiryMapper.getSelQuiryPageList", vo);
	}
	
// 조회
	@Override
	public SelQuiryVO getSelectOne(Long sqNo) {
		return session.selectOne("selQuiryMapper.getSelectOne", sqNo);
	}

// 답변 작성 시 답변 상태 업데이트
	@Override
	public long selQuiryStateUpdate(SelQuiryVO sqVo) {
		return session.update("selQuiryMapper.selQuiryStateUpdate", sqVo);
	}
}
