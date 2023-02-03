package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.SelAnswerVO;

public interface SelAnswerDAO {

// 답변 가져 오기	
	List<SelAnswerVO> selAnswerList(Long sqNo);

	long selAnswerInsert(SelAnswerVO vo);

	long selAnswerUpdate(SelAnswerVO vo);

	int chkSaAnswerExists(SelAnswerVO vo);


}
