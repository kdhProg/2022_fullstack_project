package kr.co.olga.service;

import kr.co.olga.vo.AnVO;

public interface AnService {

	long anInsert(AnVO vo);

	long anUpdate(AnVO vo);

	long anDelete(long otaotqNo);

	AnVO anSelOne(long otaotqNo);
	
}
