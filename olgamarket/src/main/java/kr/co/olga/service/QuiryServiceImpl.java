package kr.co.olga.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.QuiryDAO;
import kr.co.olga.vo.QuiryVO;

@Service
public class QuiryServiceImpl implements QuiryService {

	@Autowired
	private QuiryDAO dao;
	
	@Override
	public long quiryInsert(QuiryVO vo) {
		return dao.quiryInsert(vo);
	}
	
	@Override
	public long quiryDelOne(long iqNo) {
		return dao.quiryDelOne(iqNo);
	}
	
	@Override
	public long quiryUpd(QuiryVO vo) {
		return dao.quiryUpd(vo);
	}
	
	@Override
	public QuiryVO quirySelOne(long iqNo) {
		return dao.quirySelOne(iqNo);
	}
}
