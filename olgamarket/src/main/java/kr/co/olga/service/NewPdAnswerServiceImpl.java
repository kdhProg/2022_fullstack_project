package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.NewPdAnswerDAO;
import kr.co.olga.vo.NewPdAnswerVO;

@Service
public class NewPdAnswerServiceImpl implements NewPdAnswerService {

	@Autowired
	private NewPdAnswerDAO dao;

// 조회	
	@Override
	public List<NewPdAnswerVO> newPdAnswerSelectOne(Long npqNo) {
		return dao.newPdAnswerSelectOne(npqNo);
	}

// 답변 등록
	@Override
	public long newPdAnswerInsert(NewPdAnswerVO vo) {
		return dao.newPdAnswerInsert(vo);
	}

// 답변 수정	
	@Override
	public long newPdAnswerUpdate(NewPdAnswerVO vo) {
		return dao.newPdAnswerUpdate(vo);
	}
	
	@Override
	public int chkNpAnswerExists(NewPdAnswerVO vo) {
		return dao.chkNpAnswerExists(vo);
	}
}
