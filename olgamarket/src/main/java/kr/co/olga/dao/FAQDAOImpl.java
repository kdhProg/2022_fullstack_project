package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.FAQVO;
import kr.co.olga.vo.PagingVO;

@Repository
public class FAQDAOImpl implements FAQDAO {

	@Autowired
	private SqlSession session;

	@Override
	public long faqInsert(FAQVO vo) {
		return session.insert("faqMapper.faqInsert", vo);
	}

	@Override
	public long faqUpdate(FAQVO vo) {
		return session.update("faqMapper.faqUpdate", vo);
	}

	@Override
	public long faqDeleteOne(long faqNo) {
		return session.delete("faqMapper.faqDeleteOne", faqNo);
	}

	@Override
	public FAQVO faqSelectOne(long faqNo) {
		return session.selectOne("faqMapper.faqSelectOne", faqNo);
	}

	@Override
	public List<FAQVO> faqSelectList(long faqNo) {
		return session.selectList("faqMapper.faqSelectList", faqNo);
	}
	
	// 2023-01-12 페이징 김동훈
	
	@Override
	public int getFaqCount(String category) {
		System.out.println(category);
		return session.selectOne("faqMapper.getFaqCount",category);
	}
	
	@Override
	public List<FAQVO> getFaqPageList(PagingVO vo) {
		return session.selectList("faqMapper.getFaqPageList",vo);
	}
}
