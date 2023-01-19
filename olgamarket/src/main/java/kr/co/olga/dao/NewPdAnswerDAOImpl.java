package kr.co.olga.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NewPdAnswerDAOImpl implements NewPdAnswerDAO {

	@Autowired
	private SqlSession session;
}
