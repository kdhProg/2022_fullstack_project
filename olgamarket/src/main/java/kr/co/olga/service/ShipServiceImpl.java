package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.FavorDAO;
import kr.co.olga.dao.ShipDAO;
import kr.co.olga.vo.FavorVO;
import kr.co.olga.vo.ShipVO;

@Service
public class ShipServiceImpl implements ShipService {

	@Autowired
	private ShipDAO dao;

	@Override
	public long shipInsert(ShipVO vo) {
		return dao.shipInsert(vo);
	}

	@Override
	public long shipDelOne(long slNo) {
		return dao.shipDelOne(slNo);
	}

	@Override
	public long shipUpdate(ShipVO vo) {
		return dao.shipUpdate(vo);
	}

	@Override
	public ShipVO shipSelectOne(long slNo) {
		return dao.shipSelectOne(slNo);
	}

	@Override
	public List<ShipVO> shipSelectList() {
		return dao.shipSelectList();
	}

}