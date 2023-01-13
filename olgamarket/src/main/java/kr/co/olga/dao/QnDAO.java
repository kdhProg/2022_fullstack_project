package kr.co.olga.dao;

import kr.co.olga.vo.QnVO;

public interface QnDAO {

	long Qn(QnVO vo);

	long qnUpdate(QnVO vo);

	long qnDelete(long otqNo);

	QnVO qnSelOne(long otqNo);

}
