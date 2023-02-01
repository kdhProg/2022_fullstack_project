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

// 관리자 통계 - 매출(일일)
	@Override
	public Long dayPriceTotalSelect() {
		return session.selectOne("PurchaseMapper.dayPriceTotalSelect");
	}

	@Override
	public String daySelect() {
		return session.selectOne("PurchaseMapper.daySelect");
	}

	@Override
	public Long dayPriceTotalSelect2() {
		return session.selectOne("PurchaseMapper.dayPriceTotalSelect2");
	}

	@Override
	public Long dayPriceTotalSelect3() {
		return session.selectOne("PurchaseMapper.dayPriceTotalSelect3");
	}

	@Override
	public Long dayPriceTotalSelect4() {
		return session.selectOne("PurchaseMapper.dayPriceTotalSelect4");
	}

// 관리자 통계 - 매출(당월, 전월, 두 달전, 세 달전)
	@Override
	public Long monthPriceTotalSelect1() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect1");
	}

	@Override
	public Long monthPriceTotalSelect2() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect2");
	}

	@Override
	public Long monthPriceTotalSelect3() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect3");
	}

	@Override
	public Long monthPriceTotalSelect4() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect4");
	}

// 관리자 통계 - 매출(올해, 1년전, 2년전, 3년전)	
	@Override
	public Long yearPriceTotalSelect1() {
		return session.selectOne("PurchaseMapper.yearPriceTotalSelect1");
	}

	@Override
	public Long yearPriceTotalSelect2() {
		return session.selectOne("PurchaseMapper.yearPriceTotalSelect2");
	}

	@Override
	public Long yearPriceTotalSelect3() {
		return session.selectOne("PurchaseMapper.yearPriceTotalSelect3");
	}

	@Override
	public Long yearPriceTotalSelect4() {
		return session.selectOne("PurchaseMapper.yearPriceTotalSelect4");
	}
	
	@Override
	public Long yearPriceTotalSelect5() {
		return session.selectOne("PurchaseMapper.yearPriceTotalSelect5");
	}

	@Override
	public Long yearPriceTotalSelect6() {
		return session.selectOne("PurchaseMapper.yearPriceTotalSelect6");
	}

	@Override
	public Long yearPriceTotalSelect7() {
		return session.selectOne("PurchaseMapper.yearPriceTotalSelect7");
	}

	@Override
	public Long yearPriceTotalSelect8() {
		return session.selectOne("PurchaseMapper.yearPriceTotalSelect8");
	}

	@Override
	public Long yearPriceTotalSelect9() {
		return session.selectOne("PurchaseMapper.yearPriceTotalSelect9");
	}

	@Override
	public Long yearPriceTotalSelect10() {
		return session.selectOne("PurchaseMapper.yearPriceTotalSelect10");
	}

	@Override
	public Long yearPriceTotalSelect11() {
		return session.selectOne("PurchaseMapper.yearPriceTotalSelect11");
	}

// 관리자 통계 - 매출(누적)
	@Override
	public Long allPriceTotalSelect() {
		return session.selectOne("PurchaseMapper.allPriceTotalSelect");
	}

}
