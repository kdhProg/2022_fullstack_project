package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.PurchaseVO;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO {

	@Autowired
	private SqlSession session;

// 관리자 페이징	
	@Override
	public int getMemPurchaseAdminCount(int sortType) {
		return session.selectOne("PurchaseMapper.getMemPurchaseAdminCount", sortType);
	}

	@Override
	public List<MemberVO> getMemPurchaseAdminPageList(PagingVO vo) {
		return session.selectList("PurchaseMapper.getMemPurchaseAdminPageList", vo);
	}

// 마이페이지 주문 내역 페이징	
	@Override
	public int getMemPurchaseCount(String plmemId) {
		return session.selectOne("PurchaseMapper.getMemPurchaseCount", plmemId);
	}

	@Override
	public List<PurchaseVO> getMemPurchasePageList(PagingVO vo) {
		return session.selectList("PurchaseMapper.getMemPurchasePageList", vo);
	}
	
	@Override
	public int insertPurchase(PurchaseVO vo) {
		return session.insert("PurchaseMapper.insertPurchase", vo);
	}
	
	@Override
	public int countCaseByMemIdNPdId(PurchaseVO vo) {
		return session.selectOne("PurchaseMapper.countCaseByMemIdNPdId", vo);
	}
}
