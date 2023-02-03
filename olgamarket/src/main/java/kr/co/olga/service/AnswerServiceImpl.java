package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.AnswerDAO;
import kr.co.olga.vo.AnswerVO;
import lombok.NonNull;



@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Autowired
	private AnswerDAO dao;
	

	@Override
	public long answerInsert(AnswerVO vo) {
		return dao.Answer(vo);
	}
	
	@Override
	public long answerUpdate(AnswerVO vo) {
		return dao.answerUpdate(vo);
	}


	@Override
	public long answerDelete(long iaiqNo) {
		return dao.answerDelete(iaiqNo);
	}

	@Override
	public AnswerVO answerSelOne(long iaiqNo) {
		return dao.answerSelOne(iaiqNo);
	}

	@Override
	public List<AnswerVO> answerList(@NonNull Long iqNo) {
		return dao.answerList(iqNo);
	}
	
	@Override
	public int chkAnswerExists(AnswerVO vo) {
		return dao.chkAnswerExists(vo);
	}


}
