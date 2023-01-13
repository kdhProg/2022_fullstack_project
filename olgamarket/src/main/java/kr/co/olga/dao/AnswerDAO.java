package kr.co.olga.dao;

import kr.co.olga.vo.AnswerVO;

public interface AnswerDAO {

	long Answer(AnswerVO vo);

	long answerDelete(long iaiqNo);

	long answerUpdate(AnswerVO vo);

	AnswerVO answerSelOne(long iaiqNo);

}
