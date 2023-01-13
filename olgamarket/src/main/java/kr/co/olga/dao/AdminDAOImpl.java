package kr.co.olga.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession session;

	@Override
	public AdminVO adminLogin(AdminVO vo) {
		return session.selectOne("adminMapper.adminLogin", vo);
	}
	
	
}
