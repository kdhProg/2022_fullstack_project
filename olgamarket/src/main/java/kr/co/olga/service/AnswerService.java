package kr.co.olga.service;

import kr.co.olga.vo.AnswerVO;

public interface AnswerService {

	long answerInsert(AnswerVO vo);

	long answerDelete(long iaiqNo);

	long answerUpdate(AnswerVO vo);

	AnswerVO answerSelOne(long iaiqNo);



}
