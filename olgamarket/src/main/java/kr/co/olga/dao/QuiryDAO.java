package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.QuiryVO;

public interface QuiryDAO {

	long quiryInsert(QuiryVO vo);

	long quiryDelOne(long iqNo);

	long quiryUpd(QuiryVO vo);

	QuiryVO quirySelOne(long iqNo);

	int getQrCount(int getPdId);

	List<QuiryVO> getRvPageList(PagingVO vo);

}
