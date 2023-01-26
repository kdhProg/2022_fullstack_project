package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.FavorVO;
import kr.co.olga.vo.PagingVO;

public interface FavorDAO {

	long favorInsert(FavorVO vo);

	long favorDelOne(long fvNo);

	FavorVO favorSelectOne(long fvNo);

	List<FavorVO> favorSelectList();

	List<FavorVO> favorGetListByMemId(String memId);

	int favorDeleteByMemIdNPdId(FavorVO vo);

// 마이페이지 찜 목록 페이징
	int getMemFavorCount(String fvmemId);

	List<FavorVO> getMemFavorPageList(PagingVO vo);


}