package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.SelAnswerVO;

public interface SelAnswerService {

// 답변 가져오기
	List<SelAnswerVO> selAnswerList(Long sqNo);

	long selAnswerInsert(SelAnswerVO vo);

	long selAnswerUpdate(SelAnswerVO vo);

	//sqsano로 답변있는지 체크
	int chkSaAnswerExists(SelAnswerVO vo);

}
