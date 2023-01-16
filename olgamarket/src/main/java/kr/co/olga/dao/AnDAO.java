package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.AnVO;

public interface AnDAO {

	long An(AnVO vo);

	long anUpdate(AnVO vo);

	long anDelete(long otaotqNo);

	AnVO anSelOne(Long otaotqNo);

	List<AnVO> anList(Long otqNo);


}
