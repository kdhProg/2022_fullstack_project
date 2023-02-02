package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.QnVO;

public interface QnDAO {

	long qnInsert(QnVO vo);

	long qnUpdate(QnVO vo);

	long qnDelete(Long otqNo);

	QnVO qnSelOne(Long otqNo);

	int getQnCount();
	
	int getQnAdminCount(PagingVO sortVo);

	List<QnVO> getQnPageList(PagingVO vo);

	List<QnVO> getQnAdminPageList(PagingVO vo);
	
// 관리자 전용(답변 상태 업데이트)	
	long qnStateUpdate(QnVO qnVo);

	
	

}
