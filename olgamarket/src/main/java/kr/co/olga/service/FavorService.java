package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.FavorVO;
import kr.co.olga.vo.ShipVO;

public interface FavorService {

	long favorInsert(FavorVO vo);

	long favorDelOne(long fvNo);

	FavorVO favorSelectOne(long fvNo);

	List<FavorVO> favorSelectList();
	
	// memId에 해당하는 모든 레코드 가져오기
	List<FavorVO> favorGetListByMemId(String memId);
	
	// memId와 pdId 정보가 들어있는 vo로 레코드 지우기
	int favorDeleteByMemIdNPdId(FavorVO vo);



	

}