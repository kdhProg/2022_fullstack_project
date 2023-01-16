package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.AnswerVO;
import lombok.NonNull;

public interface AnswerService {

	long answerInsert(AnswerVO vo);

	long answerDelete(long iaiqNo);

	long answerUpdate(AnswerVO vo);

	AnswerVO answerSelOne(long iaiqNo);

	List<AnswerVO> answerList(@NonNull Long iqNo);



}
