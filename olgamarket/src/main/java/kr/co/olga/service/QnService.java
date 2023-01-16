package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.QnVO;

public interface QnService {

	long qnInsert(QnVO vo);

	long qnUpdate(QnVO vo);

	long qnDelete(long otqNo);

	QnVO qnSelOne(long otqNo);

	PagingVO getQnPageInfo(int currPage);

	List<QnVO> getQnPageList(PagingVO vo);
	
}
