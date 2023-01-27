package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.CartVO;

public interface CartService {
	
	// 단순 인서트
	int insertCart(CartVO vo);

	// vo에 들어있는 memId에 해당하는 장바구니 리스트
	List<CartVO> selectByMemID(CartVO vo);
	
	// vo에 들어있는 caNo로 레코드 삭제
	int deleteByCano(CartVO vo);
	
	// vo에 들어있는 caNo로 quantity 변경
	int updateQuantityByCano(CartVO vo);
	
	// vo에 들어있는 memId와 PdId에 해당하는 레코드가 존재하는지 체크용(있으면1)
	int existChkByMemIdNPdId(CartVO vo);
	
	// vo의 memId와 pdId로 가져오기
	CartVO getOneByMemIdNPdId(CartVO vo);
	
	// vo의 caNo로 가져오기
	CartVO getOneByCaNo(CartVO vo);
	
	// vo의 memId에 해당하는 컬럼 다 가져옴
	int countByMemId(CartVO vo);
	
	// vo의 memId에 해당하는 컬럼 다 삭제
	int deleteByMemId(CartVO vo);

}
