package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.AnVO;

public interface AnService {

	long anInsert(AnVO vo);

	long anUpdate(AnVO vo);

	long anDelete(long otaotqNo);

	AnVO anSelOne(Long otaotqNo);

	List<AnVO> anList(Long otqNo);

	//vo의 otaotqNo로 답변있는지 카운트
	int chkOtaAnswerExists(AnVO vo);
}
