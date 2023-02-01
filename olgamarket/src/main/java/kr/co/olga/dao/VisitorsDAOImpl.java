package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.VisitorsVO;

@Repository
public class VisitorsDAOImpl implements VisitorsDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int visitorsInsert(VisitorsVO vo) {
		return session.insert("visitorsMapper.visitorsInsert",vo);
	}
	
	@Override
	public List<Long> countGroupByDate() {
		return session.selectList("visitorsMapper.countGroupByDate");
	}
	
	@Override
	public List<String> showDateGroupByDate() {
		return session.selectList("visitorsMapper.showDateGroupByDate");
	}
	
	@Override
	public long todayVisit() {
		return session.selectOne("visitorsMapper.todayVisit");
	}
	
	@Override
	public long accumulateVisit() {
		return session.selectOne("visitorsMapper.accumulateVisit");
	}
}
