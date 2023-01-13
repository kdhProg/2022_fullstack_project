package kr.co.olga.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.QnDAO;
import kr.co.olga.vo.QnVO;



@Service
public class QnServiceImpl implements QnService {
	
	@Autowired
	private QnDAO dao;

	@Override
	public long qninsert(QnVO vo) {
		return dao.Qn(vo);
	}

	@Override
	public long qnUpdate(QnVO vo) {
		return dao.qnUpdate(vo);
	}

	@Override
	public long qnDelete(long otqNo) {
		return dao.qnDelete(otqNo);
	}

	@Override
	public QnVO qnSelOne(long otqNo) {
		return dao.qnSelOne(otqNo);
	}
	
}
