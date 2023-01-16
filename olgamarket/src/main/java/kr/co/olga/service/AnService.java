package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.AnVO;

public interface AnService {

	long anInsert(AnVO vo);

	long anUpdate(AnVO vo);

	long anDelete(long otaotqNo);

	AnVO anSelOne(Long otaotqNo);

	List<AnVO> anList(Long otqNo);

	
}
