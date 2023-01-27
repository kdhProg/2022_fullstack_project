package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.CartDAO;
import kr.co.olga.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO dao;
	
	@Override
	public int insertCart(CartVO vo) {
		return dao.insertCart(vo);
	}
	
	@Override
	public List<CartVO> selectByMemID(CartVO vo) {
		return dao.selectByMemID(vo);
	}
	
	@Override
	public int deleteByCano(CartVO vo) {
		return dao.deleteByCano(vo);
	}
	
	@Override
	public int updateQuantityByCano(CartVO vo) {
		return dao.updateQuantityByCano(vo);
	}
	
	@Override
	public int existChkByMemIdNPdId(CartVO vo) {
		return dao.existChkByMemIdNPdId(vo);
	}
	
	@Override
	public CartVO getOneByMemIdNPdId(CartVO vo) {
		return dao.getOneByMemIdNPdId(vo);
	}
	
	@Override
	public CartVO getOneByCaNo(CartVO vo) {
		return dao.getOneByCaNo(vo);
	}
	
	@Override
	public int countByMemId(CartVO vo) {
		return dao.countByMemId(vo);
	}
	
	@Override
	public int deleteByMemId(CartVO vo) {
		return dao.deleteByMemId(vo);
	}
}
