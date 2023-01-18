package kr.co.olga.service;

import java.util.List;

import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.SellerVO;

public interface SellerService {
	
	// 넘겨준 VO객체 삽입
	public long selJoin(SellerVO vo);

	// selId에 해당하는 레코드 삭제
	public long selDelOne(String selId);

	// 넘겨준 VO객체의 selId에 해당하는 레코드 수정 
	public long selUpd(SellerVO vo);

	// selId에 해당하는 VO객체 반환
	public SellerVO sellerSelOne(String selId);

	// 모든 레코드 반환
	public List<SellerVO> sellerSelAll();

	// 아이디 DB에 존재하면 (= 중복되면 ) 1 없다면 0
	public long sellerIdcheck(String selId);

	// 비밀번호만 바꾸는 쿼리문
	public long sellerUpdatePwd(SellerVO vo);

	// 이름/전화번호/사업자등록번호로 만들어진 VO객체 넘겨주면 이에 해당하는 VO객체 반환함
	public SellerVO sellerIdFind(SellerVO vo);

	public SellerVO sellerPwdFind(SellerVO vo);
	
// 관리자 판매자 관리 + 페이징
	public PagingVO getSellerPageInfo(int currPage);

	public List<SellerVO> getSellerPageList(PagingVO vo);

// 판매자 권한 회수	
	public long sellerGrantUpdate(SellerVO vo);
	
}
