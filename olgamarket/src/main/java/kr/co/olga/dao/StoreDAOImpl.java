package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.StoreVO;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	private SqlSession session;

	@Override
	public long storeInsert(StoreVO vo) {
		return session.insert("storeMapper.storeInsert", vo);
	}

	@Override
	public long storeUpdate(StoreVO vo) {
		return session.update("storeMapper.storeUpdate", vo);
	}

	@Override
	public long storeDeleteOne(String stlBrandName) {
		return session.delete("storeMapper.storeDeleteOne", stlBrandName);
	}

	@Override
	public StoreVO storeSelectOne(String stlBrandName) {
		return session.selectOne("storeMapper.storeSelectOne", stlBrandName);
	}

	@Override
	public int getStoreCount() {
		return session.selectOne("storeMapper.getStoreCount");
	}

	@Override
	public List<StoreVO> getStorePageList(PagingVO vo) {
		return session.selectList("storeMapper.getStorePageList",vo);
	}
	
	
}
