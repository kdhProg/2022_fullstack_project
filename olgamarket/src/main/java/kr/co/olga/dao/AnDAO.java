package kr.co.olga.dao;

import kr.co.olga.vo.AnVO;

public interface AnDAO {

	long An(AnVO vo);

	long anUpdate(AnVO vo);

	long anDelete(long otaotqNo);

	AnVO anSelOne(long otaotqNo);

}
