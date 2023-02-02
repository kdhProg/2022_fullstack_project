package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.NewPdQuiryVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SelQuiryVO;

@Repository
public class NewPdQuiryDAOImpl implements NewPdQuiryDAO {

	@Autowired
	private SqlSession session;


// 신상품 등록 문의 페이징
	@Override
	public int getNewPdQuiryCount() {
		return session.selectOne("newPdQuiryMapper.getNewPdQuiryCount");
	}

	@Override
	public List<SelQuiryVO> getNewPdQuiryPageList(PagingVO vo) {
		return session.selectList("newPdQuiryMapper.getNewPdQuiryPageList", vo);
	}

// 조회
	@Override
	public NewPdQuiryVO newPdQuirySelectOne(Long npqNo) {
		return session.selectOne("newPdQuiryMapper.newPdQuirySelectOne", npqNo);
	}

// 글 등록
	@Override
	public long newPdQuiryInsert(NewPdQuiryVO vo) {
		return session.insert("newPdQuiryMapper.newPdQuiryInsert", vo);
	}

// 글 수정	
	@Override
	public long newPdQuiryUpdate(NewPdQuiryVO vo) {
		return session.update("newPdQuiryMapper.newPdQuiryUpdate", vo);
	}

// 글 삭제	
	@Override
	public long newPdQuiryDelete(Long npqNo) {
		return session.delete("newPdQuiryMapper.newPdQuiryDelete", npqNo);
	}

// 답글 입력 시 답변 상태 업데이트		
	@Override
	public long newPdQuiryStateUpdate(NewPdQuiryVO npqVo) {
		return session.update("newPdQuiryMapper.newPdQuiryStateUpdate", npqVo);
	}

// 신상품 등록 문의 페이징 (관리자)		
	@Override
	public int getNewPdQuiryAdminCount(PagingVO sortVo) {
		return session.selectOne("newPdQuiryMapper.getNewPdQuiryAdminCount", sortVo);
	}
	
	@Override
	public List<SelQuiryVO> getNewPdQuiryAdminPageList(PagingVO vo) {
		return session.selectList("newPdQuiryMapper.getNewPdQuiryAdminPageList", vo);
	}

	
}
