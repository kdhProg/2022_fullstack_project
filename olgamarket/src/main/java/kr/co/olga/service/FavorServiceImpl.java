package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.FavorDAO;
import kr.co.olga.vo.FavorVO;

@Service
public class FavorServiceImpl implements FavorService {

	@Autowired
	private FavorDAO dao;

	@Override
	public long favorInsert(FavorVO vo) {
		return dao.favorInsert(vo);
	}

	@Override
	public long favorDelOne(long fvNo) {
		return dao.favorDelOne(fvNo);
	}

	@Override
	public FavorVO favorSelectOne(long fvNo) {
		return dao.favorSelectOne(fvNo);
	}

	@Override
	public List<FavorVO> favorSelectList() {
		return dao.favorSelectList();
	}

}