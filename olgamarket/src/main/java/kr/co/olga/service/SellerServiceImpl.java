package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.SellerDAO;
import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SellerVO;

@Service
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SellerDAO dao;
	
	@Override
	public long selJoin(SellerVO vo) {
		return dao.selJoin(vo);
	}
	
	@Override
	public long selDelOne(String selId) {
		return dao.selDelOne(selId);
	}
	
	@Override
	public long selUpd(SellerVO vo) {
		return dao.selUpd(vo);
	}
	
	@Override
	public SellerVO sellerSelOne(String selId) {
		return dao.sellerSelOne(selId);
	}
	
	@Override
	public List<SellerVO> sellerSelAll() {
		return dao.sellerSelAll();
	}
	
	@Override
	public long sellerIdcheck(String selId) {
		return dao.sellerIdcheck(selId);
	}
	
	@Override
	public long sellerUpdatePwd(SellerVO vo) {
		return dao.sellerUpdatePwd(vo);
	}
	
	@Override
	public SellerVO sellerIdFind(SellerVO vo) {
		return dao.sellerIdFind(vo);
	}
	
	@Override
	public SellerVO sellerPwdFind(SellerVO vo) {
		return dao.sellerPwdFind(vo);
	}

// 관리자 판매자 관리 + 페이징	
	@Override
	public PagingVO getSellerPageInfo(int currPage, int sortType) {
		PagingVO vo = new PagingVO();
		PagingVO sortVo = new PagingVO();
		sortVo.setSort(sortType);
		int setTotalRecordCount = dao.getSellerCount(sortVo);
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getSellerCount(sortVo) * 1.0) / 20));
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
	public List<SellerVO> getSellerPageList(PagingVO vo) {
		return dao.getSellerPageList(vo);
	}

// 판매자 권한 회수	
	@Override
	public long sellerGrantUpdate(SellerVO vo) {
		return dao.sellerGrantUpdate(vo);
	}
	
	@Override
	public SellerVO sellerLogin(SellerVO vo) {
		return dao.sellerLogin(vo);
	}
	
	@Override
	public int sellerEmailCheck(String selEmail) {
		return dao.sellerEmailCheck(selEmail);
	}
	
	@Override
	public int sellerReGrantUpdate(SellerVO vo) {
		return dao.sellerReGrantUpdate(vo);
	}
}
