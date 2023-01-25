package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.PurchaseVO;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO {

	@Autowired
	private SqlSession session;

// 관리자 페이징	
	@Override
	public int getMemPurchaseAdminCount() {
		return session.selectOne("PurchaseMapper.getMemPurchaseAdminCount");
	}

	@Override
	public List<PurchaseVO> getMemPurchaseAdminPageList(PagingVO vo) {
		return session.selectList("PurchaseMapper.getMemPurchaseAdminPageList", vo);
	}
}
