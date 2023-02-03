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

	// vo에 들어있는 iaiqNO에 해당하는 답변개수 반환 => 있으면 1 없다면 0
	int chkAnswerExists(AnswerVO vo);



}
