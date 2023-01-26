package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ShipVO;

@Repository
public class ShipDAOImpl implements ShipDAO {

	@Autowired
	private SqlSession session;

	@Override
	public long shipInsert(ShipVO vo) {
		return session.insert("shipMapper.shipInsert", vo);
	}

	@Override
	public long shipDelOne(long slNo) {
		return session.delete("shipMapper.shipDelOne", slNo);
	}

	@Override
	public long shipUpdate(ShipVO vo) {
		return session.update("shipMapper.shipUpdate", vo);
	}

	@Override
	public ShipVO shipSelectOne(long slNo) {
		return session.selectOne("shipMapper.shipSelectOne", slNo);
	}

	@Override
	public List<ShipVO> shipSelectList() {
		return session.selectList("shipMapper.shipSelectList");
	}

// 마이 페이지 배송지 페이징
	@Override
	public int getMemShipCount(String slmemId) {
		return session.selectOne("shipMapper.getMemShipCount", slmemId);
	}

	@Override
	public List<ShipVO> getMemShipPageList(PagingVO vo) {
		return session.selectList("shipMapper.getMemShipPageList", vo);
	}


}
