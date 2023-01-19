package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SelQuiryVO;

public interface NewPdQuiryDAO {

// 신상품 등록 문의 페이징
	int getNewPdQuiryCount();

	List<SelQuiryVO> getNewPdQuiryPageList(PagingVO vo);

}
