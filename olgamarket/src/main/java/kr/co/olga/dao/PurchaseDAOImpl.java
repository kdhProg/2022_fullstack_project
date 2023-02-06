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
	
/***************************** 관리자 통계 판매량 *********************************/		

// 관리자 통계 - 판매량(당일, 1일전, 2일전, 3일전)
	@Override
	public Long daySalesVolumeSelect1() {
		return session.selectOne("PurchaseMapper.daySalesVolumeSelect1");
	}

	@Override
	public Long daySalesVolumeSelect2() {
		return session.selectOne("PurchaseMapper.daySalesVolumeSelect2");
	}

	@Override
	public Long daySalesVolumeSelect3() {
		return session.selectOne("PurchaseMapper.daySalesVolumeSelect3");
	}

	@Override
	public Long daySalesVolumeSelect4() {
		return session.selectOne("PurchaseMapper.daySalesVolumeSelect4");
	}

// 관리자 통계 - 판매량(당월, 전월, 두 달전, 세 달전)
	@Override
	public Long monthSalesVolumeSelect1() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect1");
	}

	@Override
	public Long monthSalesVolumeSelect2() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect2");
	}

	@Override
	public Long monthSalesVolumeSelect3() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect3");
	}

	@Override
	public Long monthSalesVolumeSelect4() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect4");
	}
	
	@Override
	public Long monthSalesVolumeSelect5() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect5");
	}
	
	@Override
	public Long monthSalesVolumeSelect6() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect6");
	}
	
	@Override
	public Long monthSalesVolumeSelect7() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect7");
	}
	
	@Override
	public Long monthSalesVolumeSelect8() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect8");
	}
	
	@Override
	public Long monthSalesVolumeSelect9() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect9");
	}
	
	@Override
	public Long monthSalesVolumeSelect10() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect10");
	}
	
	@Override
	public Long monthSalesVolumeSelect11() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect11");
	}
	
	@Override
	public Long monthSalesVolumeSelect12() {
		return session.selectOne("PurchaseMapper.monthSalesVolumeSelect12");
	}

// 관리자 통계 - 판매량(올해, 1년전, 2년전, 3년젼 ... 10년전)
	@Override
	public Long yearSalesVolumeSelect1() {
		return session.selectOne("PurchaseMapper.yearSalesVolumeSelect1");
	}

	@Override
	public Long yearSalesVolumeSelect2() {
		return session.selectOne("PurchaseMapper.yearSalesVolumeSelect2");
	}

	@Override
	public Long yearSalesVolumeSelect3() {
		return session.selectOne("PurchaseMapper.yearSalesVolumeSelect3");
	}

	@Override
	public Long yearSalesVolumeSelect4() {
		return session.selectOne("PurchaseMapper.yearSalesVolumeSelect4");
	}

	@Override
	public Long yearSalesVolumeSelect5() {
		return session.selectOne("PurchaseMapper.yearSalesVolumeSelect5");
	}

	@Override
	public Long yearSalesVolumeSelect6() {
		return session.selectOne("PurchaseMapper.yearSalesVolumeSelect6");
	}

	@Override
	public Long yearSalesVolumeSelect7() {
		return session.selectOne("PurchaseMapper.yearSalesVolumeSelect7");
	}

	@Override
	public Long yearSalesVolumeSelect8() {
		return session.selectOne("PurchaseMapper.yearSalesVolumeSelect8");
	}

	@Override
	public Long yearSalesVolumeSelect9() {
		return session.selectOne("PurchaseMapper.yearSalesVolumeSelect9");
	}

	@Override
	public Long yearSalesVolumeSelect10() {
		return session.selectOne("PurchaseMapper.yearSalesVolumeSelect10");
	}

	@Override
	public Long yearSalesVolumeSelect11() {
		return session.selectOne("PurchaseMapper.yearSalesVolumeSelect11");
	}

// 관리자 통계 - 판매량(누적)
	@Override
	public Long allSalesVolumeSelect() {
		return session.selectOne("PurchaseMapper.allSalesVolumeSelect");
	}	
	
/***************************** 관리자 통계 매출액 *********************************/	
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
	
	@Override
	public Long monthPriceTotalSelect5() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect5");
	}
	
	@Override
	public Long monthPriceTotalSelect6() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect6");
	}
	
	@Override
	public Long monthPriceTotalSelect7() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect7");
	}
	
	@Override
	public Long monthPriceTotalSelect8() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect8");
	}
	
	@Override
	public Long monthPriceTotalSelect9() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect9");
	}
	
	@Override
	public Long monthPriceTotalSelect10() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect10");
	}
	
	@Override
	public Long monthPriceTotalSelect11() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect11");
	}
	
	@Override
	public Long monthPriceTotalSelect12() {
		return session.selectOne("PurchaseMapper.monthPriceTotalSelect12");
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
	
	// memId로 적립금 더하기
	@Override
	public Long sumSavedMoneyByMemId(MemberVO vo) {
		return session.selectOne("PurchaseMapper.sumSavedMoneyByMemId",vo);
	}
	
	@Override
	public Long countTodayPurchase() {
		return session.selectOne("PurchaseMapper.countTodayPurchase");
	}

}
