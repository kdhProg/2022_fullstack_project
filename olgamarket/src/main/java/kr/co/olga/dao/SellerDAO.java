package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SellerVO;

public interface SellerDAO {

	long selJoin(SellerVO vo);

	long selDelOne(String selId);

	long selUpd(SellerVO vo);

	SellerVO sellerSelOne(String selId);

	List<SellerVO> sellerSelAll();

	long sellerIdcheck(String selId);

	long sellerUpdatePwd(SellerVO vo);

	SellerVO sellerIdFind(SellerVO vo);

	SellerVO sellerPwdFind(SellerVO vo);

// 관리자 판매자 관리 + 페이징	
	int getSellerCount();

	List<NoticeVO> getSellerPageList(PagingVO vo);
	
	

}
