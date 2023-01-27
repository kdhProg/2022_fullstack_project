package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.CartVO;

public interface CartDAO {

	int insertCart(CartVO vo);

	List<CartVO> selectByMemID(CartVO vo);

	int deleteByCano(CartVO vo);

	int updateQuantityByCano(CartVO vo);

	int existChkByMemIdNPdId(CartVO vo);

	CartVO getOneByMemIdNPdId(CartVO vo);

	CartVO getOneByCaNo(CartVO vo);

	int countByMemId(CartVO vo);

	int deleteByMemId(CartVO vo);

}
