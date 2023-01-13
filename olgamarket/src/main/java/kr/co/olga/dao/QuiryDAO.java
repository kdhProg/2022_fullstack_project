package kr.co.olga.dao;

import kr.co.olga.vo.QuiryVO;

public interface QuiryDAO {

	long quiryInsert(QuiryVO vo);

	long quiryDelOne(long iqNo);

	long quiryUpd(QuiryVO vo);

	QuiryVO quirySelOne(long iqNo);

}
