package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.NewPdAnswerVO;

public interface NewPdAnswerDAO {

// 조회	
	List<NewPdAnswerVO> newPdAnswerSelectOne(Long npqNo);

// 답글 등록	
	long newPdAnswerInsert(NewPdAnswerVO vo);

// 답글 수정	
	long newPdAnswerUpdate(NewPdAnswerVO vo);

	int chkNpAnswerExists(NewPdAnswerVO vo);

}
