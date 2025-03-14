package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.FAQVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ReviewVO;

public interface ReviewService {

	// 상품추가
	long reviewInsert(ReviewVO vo);
	
	//rvNo에 해당하는 상품 리뷰
	long reviewDelOne(long rvNo);

	//넘겨준 vo의 rvNo에 해당하는 레코드 수정
	long reviewUpd(ReviewVO vo);
	
	//rvNo에 해당하는 레코드 추천수+1
	long reviewNiceUp(long rvNo);

	//rvNo에 해당하는 레코드 신고수+1
	long reviewRptUp(long rvNo);

	//rvNo에 해당하는 레코드 가져옴
	ReviewVO reviewSelOne(long rvNo);

	PagingVO getRvPageInfo(int currPage, int sortType, int getPdId);

	List<ReviewVO> getRvPageList(PagingVO vo);

	//rvNo에 해당하는 레코드 추천수-1
	long reviewNiceSubtract(long rvNo);
	
	//rvNo에 해당하는 레코드 신고수-1
	long reviewRptSubtract(long rvNo);
	
	// 마이페이지 상품 후기 페이징
	PagingVO getMemReviewPageInfo(int currPage, String rvmemId);

	List<ReviewVO> getMemReviewPageList(PagingVO vo);
	
	// vo에 들어있는 pdId,memId로 개수 조회
	long countByPdIdNMemId(ReviewVO vo);


}
