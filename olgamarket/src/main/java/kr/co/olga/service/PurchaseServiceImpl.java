package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.PurchaseDAO;
import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.PurchaseVO;

@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	private PurchaseDAO dao;

// 관리자 페이징		
	@Override
	public PagingVO getMemPurchaseAdminPageInfo(int currPage, int sortType) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getMemPurchaseAdminCount(sortType);
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getMemPurchaseAdminCount(sortType) * 1.0) / 20));
		if(realEnd < lastPageNoOnPageList) {
			lastPageNoOnPageList = realEnd;
		}
		
		int firstRecordIndex = (currPage - 1) * recordCountPerPage;
		boolean xprev= firstPageNoOnPageList > 1;
		boolean xnext = lastPageNoOnPageList < realEnd;
		
		int contEnd = currPage*20;
		int contStart = contEnd-19;
		if(contEnd > setTotalRecordCount) {
			contEnd = setTotalRecordCount;
		}
		
		vo.setCurrentpageno(currPage);
		vo.setFirstPageNoOnPageList(firstPageNoOnPageList);
		vo.setFirstRecordIndex(firstRecordIndex);
		vo.setLastPageNoOnPageList(lastPageNoOnPageList);
		vo.setRealEnd(realEnd);
		vo.setRecordCountPerPage(recordCountPerPage);
		vo.setTotalRecordCount(setTotalRecordCount);
		vo.setXnext(xnext);
		vo.setXprev(xprev);
		vo.setContEnd(contEnd);
		vo.setContStart(contStart);
		vo.setSort(sortType);
		
		return vo;
	}

	@Override
	public List<MemberVO> getMemPurchaseAdminPageList(PagingVO vo) {
		return dao.getMemPurchaseAdminPageList(vo);
	}

// 마이페이지 주문 내역 페이징		
	@Override
	public PagingVO getMemPurchasePageInfo(int currPage, String plmemId) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getMemPurchaseCount(plmemId);
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getMemPurchaseCount(plmemId) * 1.0) / 20));
		if(realEnd < lastPageNoOnPageList) {
			lastPageNoOnPageList = realEnd;
		}
		
		int firstRecordIndex = (currPage - 1) * recordCountPerPage;
		boolean xprev= firstPageNoOnPageList > 1;
		boolean xnext = lastPageNoOnPageList < realEnd;
		
		int contEnd = currPage*20;
		int contStart = contEnd-19;
		if(contEnd > setTotalRecordCount) {
			contEnd = setTotalRecordCount;
		}
		
		vo.setCurrentpageno(currPage);
		vo.setFirstPageNoOnPageList(firstPageNoOnPageList);
		vo.setFirstRecordIndex(firstRecordIndex);
		vo.setLastPageNoOnPageList(lastPageNoOnPageList);
		vo.setRealEnd(realEnd);
		vo.setRecordCountPerPage(recordCountPerPage);
		vo.setTotalRecordCount(setTotalRecordCount);
		vo.setXnext(xnext);
		vo.setXprev(xprev);
		vo.setContEnd(contEnd);
		vo.setContStart(contStart);
		vo.setPlmemId(plmemId);
		
		return vo;
	}

	@Override
	public List<PurchaseVO> getMemPurchasePageList(PagingVO vo) {
		return dao.getMemPurchasePageList(vo);
	}
	
	@Override
	public int insertPurchase(PurchaseVO vo) {
		return dao.insertPurchase(vo);
	}
	
	@Override
	public int countCaseByMemIdNPdId(PurchaseVO vo) {
		return dao.countCaseByMemIdNPdId(vo);
	}

// 관리자 통계 - 매출(일일)	
	@Override
	public Long dayPriceTotalSelect() {
		return dao.dayPriceTotalSelect();
	}

	@Override
	public String daySelect() {
		return dao.daySelect();
	}

	@Override
	public Long dayPriceTotalSelect2() {
		return dao.dayPriceTotalSelect2();
	}

	@Override
	public Long dayPriceTotalSelect3() {
		return dao.dayPriceTotalSelect3();
	}

	@Override
	public Long dayPriceTotalSelect4() {
		return dao.dayPriceTotalSelect4();
	}

// 관리자 통계 - 매출(당월, 전월, 두 달전, 세 달전)	
	@Override
	public Long monthPriceTotalSelect1() {
		return dao.monthPriceTotalSelect1();
	}

	@Override
	public Long monthPriceTotalSelect2() {
		return dao.monthPriceTotalSelect2();
	}

	@Override
	public Long monthPriceTotalSelect3() {
		return dao.monthPriceTotalSelect3();
	}

	@Override
	public Long monthPriceTotalSelect4() {
		return dao.monthPriceTotalSelect4();
	}

// 관리자 통계 - 매출(올해, 1년전, 2년전, 3년전)	
	@Override
	public Long yearPriceTotalSelect1() {
		return dao.yearPriceTotalSelect1();
	}

	@Override
	public Long yearPriceTotalSelect2() {
		return dao.yearPriceTotalSelect2();
	}

	@Override
	public Long yearPriceTotalSelect3() {
		return dao.yearPriceTotalSelect3();
	}

	@Override
	public Long yearPriceTotalSelect4() {
		return dao.yearPriceTotalSelect4();
	}
	
	@Override
	public Long yearPriceTotalSelect5() {
		return dao.yearPriceTotalSelect5();
	}

	@Override
	public Long yearPriceTotalSelect6() {
		return dao.yearPriceTotalSelect6();
	}

	@Override
	public Long yearPriceTotalSelect7() {
		return dao.yearPriceTotalSelect7();
	}

	@Override
	public Long yearPriceTotalSelect8() {
		return dao.yearPriceTotalSelect8();
	}

	@Override
	public Long yearPriceTotalSelect9() {
		return dao.yearPriceTotalSelect9();
	}

	@Override
	public Long yearPriceTotalSelect10() {
		return dao.yearPriceTotalSelect10();
	}

	@Override
	public Long yearPriceTotalSelect11() {
		return dao.yearPriceTotalSelect11();
	}

// 관리자 통계 - 매출(누적)
	@Override
	public Long allPriceTotalSelect() {
		return dao.allPriceTotalSelect();
	}
	
	@Override
	public Long sumSavedMoneyByMemId(MemberVO vo) {
		return dao.sumSavedMoneyByMemId(vo);
	}

	
}
