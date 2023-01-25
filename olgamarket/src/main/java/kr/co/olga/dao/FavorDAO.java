package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.FavorVO;

public interface FavorDAO {

	long favorInsert(FavorVO vo);

	long favorDelOne(long fvNo);

	FavorVO favorSelectOne(long fvNo);

	List<FavorVO> favorSelectList();

	List<FavorVO> favorGetListByMemId(String memId);

	int favorDeleteByMemIdNPdId(FavorVO vo);


}