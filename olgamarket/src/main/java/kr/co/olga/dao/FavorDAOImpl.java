package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.FavorVO;

@Repository
public class FavorDAOImpl implements FavorDAO {

	@Autowired
	private SqlSession session;

	@Override
	public long favorInsert(FavorVO vo) {
		return session.insert("favorMapper.favorInsert", vo);
	}

	@Override
	public long favorDelOne(long fvNo) {
		return session.delete("favorMapper.favorDelOne", fvNo);
	}

	@Override
	public FavorVO favorSelectOne(long fvNo) {
		return session.selectOne("favorMapper.favorSelectOne", fvNo);
	}

	@Override
	public List<FavorVO> favorSelectList() {
		return session.selectList("favorMapper.favorSelectList");
	}


	
}
