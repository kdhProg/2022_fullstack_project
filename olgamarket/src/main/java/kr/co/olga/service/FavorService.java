package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.FavorVO;
import kr.co.olga.vo.ShipVO;

public interface FavorService {

	long favorInsert(FavorVO vo);

	long favorDelOne(long fvNo);

	FavorVO favorSelectOne(long fvNo);

	List<FavorVO> favorSelectList();



	

}