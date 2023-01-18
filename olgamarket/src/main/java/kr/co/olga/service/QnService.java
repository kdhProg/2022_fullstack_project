package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.QnVO;

public interface QnService {

	long qnInsert(QnVO vo);

	long qnUpdate(QnVO vo);

	long qnDelete(Long otqNo);

	QnVO qnSelOne(Long otqNo);

	PagingVO getQnPageInfo(int currPage);

	List<QnVO> getQnPageList(PagingVO vo);

	PagingVO getQnAdminPageList(int currPage);

	List<QnVO> getQnAdminPageList(PagingVO vo);

// 관리자 전용(답변 상태 업데이트)	
	long qnStateUpdate(QnVO qnVo);
	
}
