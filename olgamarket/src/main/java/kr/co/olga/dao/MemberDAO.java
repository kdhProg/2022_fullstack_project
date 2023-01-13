package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;

public interface MemberDAO {

	long memberJoin(MemberVO vo);

/*	
 	// String memId, memPwd 값으로 로그인 구현
	MemberVO memberLogin(String memId);
*/	
	// 로그인
	MemberVO memberLogin(MemberVO vo);
	
	long idCheck(String memId);

	long memberUpdate(MemberVO vo);

	long memberDeleteOne(String memId);

	List<MemberVO> memberList(String memId);

	MemberVO memIdFindSelect(MemberVO vo);

	MemberVO memPwdFindSelect(MemberVO vo);

	long memPwdUpdate(MemberVO vo);

// 관리자 회원관리 + 페이징
	int getMemberCount();

	List<NoticeVO> getMemberPageList(PagingVO vo);

	// 회원 정지
	long memRepot(MemberVO vo);


}
