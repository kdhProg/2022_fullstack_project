package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.AnDAO;
import kr.co.olga.vo.AnVO;



@Service
public class AnServiceImpl implements AnService {
	
	@Autowired
	private AnDAO dao;

	@Override
	public long anInsert(AnVO vo) {
		return dao.anInsert(vo);
	}

	@Override
	public long anUpdate(AnVO vo) {
		return dao.anUpdate(vo);
	}

	@Override
	public long anDelete(long otaotqNo) {
		return dao.anDelete(otaotqNo);
	}

	@Override
	public AnVO anSelOne(Long otaotqNo) {
		return dao.anSelOne(otaotqNo);
	}

	@Override
	public List<AnVO> anList(Long otqNo) {
		return dao.anList(otqNo);
	}

}
