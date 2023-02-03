package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.AnswerVO;
import lombok.NonNull;

public interface AnswerDAO {

	long Answer(AnswerVO vo);

	long answerDelete(long iaiqNo);

	long answerUpdate(AnswerVO vo);

	AnswerVO answerSelOne(long iaiqNo);

	List<AnswerVO> answerList(@NonNull Long iqNo);

	int chkAnswerExists(AnswerVO vo);

}
