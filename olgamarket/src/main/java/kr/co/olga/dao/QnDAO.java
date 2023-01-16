package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.QnVO;

public interface QnDAO {

	long qnInsert(QnVO vo);

	long qnUpdate(QnVO vo);

	long qnDelete(long otqNo);

	QnVO qnSelOne(long otqNo);

	int getQnCount();

	List<QnVO> getQnPageList(PagingVO vo);

}
