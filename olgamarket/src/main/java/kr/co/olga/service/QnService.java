package kr.co.olga.service;

import kr.co.olga.vo.QnVO;

public interface QnService {

	long qninsert(QnVO vo);

	long qnUpdate(QnVO vo);

	long qnDelete(long otqNo);

	QnVO qnSelOne(long otqNo);
	
}
