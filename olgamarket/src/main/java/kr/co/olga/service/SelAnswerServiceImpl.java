package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.SelAnswerDAO;
import kr.co.olga.vo.SelAnswerVO;

@Service
public class SelAnswerServiceImpl implements SelAnswerService {

	@Autowired
	private SelAnswerDAO dao;
	
// 답변 가져 오기
	@Override
	public List<SelAnswerVO> selAnswerList(Long sqNo) {
		return dao.selAnswerList(sqNo);
	}

	@Override
	public long selAnswerInsert(SelAnswerVO vo) {
		return dao.selAnswerInsert(vo);
	}

	@Override
	public long selAnswerUpdate(SelAnswerVO vo) {
		return dao.selAnswerUpdate(vo);
	}

}
