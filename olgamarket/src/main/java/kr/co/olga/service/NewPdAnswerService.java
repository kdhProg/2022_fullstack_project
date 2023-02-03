package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.NewPdAnswerVO;

public interface NewPdAnswerService {

// 조회
	List<NewPdAnswerVO> newPdAnswerSelectOne(Long npqNo);

// 답변 등록	
	long newPdAnswerInsert(NewPdAnswerVO vo);

// 답변 수정	
	long newPdAnswerUpdate(NewPdAnswerVO vo);
	
	//vo에 있는 NPANPQNO에 해당하는 레코드 개수
	int chkNpAnswerExists(NewPdAnswerVO vo);

}
