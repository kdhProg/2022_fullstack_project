package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
