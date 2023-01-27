package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertCart(CartVO vo) {
		return session.insert("cartMapper.insertCart",vo);
	}
	
	@Override
	public List<CartVO> selectByMemID(CartVO vo) {
		return session.selectList("cartMapper.selectByMemID",vo);
	}
	
	@Override
	public int deleteByCano(CartVO vo) {
		return session.delete("cartMapper.deleteByCano",vo);
	}
	
	@Override
	public int updateQuantityByCano(CartVO vo) {
		return session.delete("cartMapper.updateQuantityByCano",vo);
	}
	
	@Override
	public int existChkByMemIdNPdId(CartVO vo) {
		return session.selectOne("cartMapper.existChkByMemIdNPdId",vo);
	}
	
	@Override
	public CartVO getOneByMemIdNPdId(CartVO vo) {
		return session.selectOne("cartMapper.getOneByMemIdNPdId",vo);
	}
	
	@Override
	public CartVO getOneByCaNo(CartVO vo) {
		return session.selectOne("cartMapper.getOneByCaNo",vo);
	}
}
