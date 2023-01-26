package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ReviewVO;

public interface ReviewDAO {

	long reviewInsert(ReviewVO vo);

	long reviewDelOne(long rvNo);

	long reviewUpd(ReviewVO vo);

	long reviewNiceUp(long rvNo);

	long reviewRptUp(long rvNo);

	ReviewVO reviewSelOne(long rvNo);

	int getRvCount(int getPdId);

	List<ReviewVO> getRvPageList(PagingVO vo);

	long reviewNiceSubtract(long rvNo);

	long reviewRptSubtract(long rvNo);

}
