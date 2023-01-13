package kr.co.olga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.MemberDAO;
import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Override
	public long memberJoin(MemberVO vo) {
		return dao.memberJoin(vo);
	}
/*	
 	// String memId, memPwd 값으로 로그인 구현
	@Override
	public MemberVO memberLogin(String memId) {
		return dao.memberLogin(memId);
	}
*/
	// 로그인
	@Override
	public MemberVO memberLogin(MemberVO vo) {
		return dao.memberLogin(vo);
	}
	
	@Override
	public long idCheck(String memId) {
		return dao.idCheck(memId);
	}

	@Override
	public long memberUpdate(MemberVO vo) {
		return dao.memberUpdate(vo);
	}

	@Override
	public long memberDeleteOne(String memId) {
		return dao.memberDeleteOne(memId);
	}

	@Override
	public List<MemberVO> memberList(String memId) {
		return dao.memberList(memId);
	}

	@Override
	public MemberVO memIdFindSelect(MemberVO vo) {
		return dao.memIdFindSelect(vo);
	}

	@Override
	public MemberVO memPwdFindSelect(MemberVO vo) {
		return dao.memPwdFindSelect(vo);
	}

	@Override
	public long memPwdUpdate(MemberVO vo) {
		return dao.memPwdUpdate(vo);
	}
	
// 관리자 회원관리 + 페이징	
	@Override
	public PagingVO getMemberPageInfo(int currPage) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getMemberCount();
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getMemberCount() * 1.0) / 20));
		if(realEnd < lastPageNoOnPageList) {
			lastPageNoOnPageList = realEnd;
		}
		
		int firstRecordIndex = (currPage - 1) * recordCountPerPage;
		boolean xprev= firstPageNoOnPageList > 1;
		boolean xnext = lastPageNoOnPageList < realEnd;
		
		int contEnd = currPage*20;
		int contStart = contEnd-19;
		if(contEnd > setTotalRecordCount) {
			contEnd = setTotalRecordCount;
		}
		
		vo.setCurrentpageno(currPage);
		vo.setFirstPageNoOnPageList(firstPageNoOnPageList);
		vo.setFirstRecordIndex(firstRecordIndex);
		vo.setLastPageNoOnPageList(lastPageNoOnPageList);
		vo.setRealEnd(realEnd);
		vo.setRecordCountPerPage(recordCountPerPage);
		vo.setTotalRecordCount(setTotalRecordCount);
		vo.setXnext(xnext);
		vo.setXprev(xprev);
		vo.setContEnd(contEnd);
		vo.setContStart(contStart);
		
		return vo;
	}
	
	@Override
	public List<NoticeVO> getMemberPageList(PagingVO vo) {
		return dao.getMemberPageList(vo);
	}
	
	// 회원 정지
	@Override
	public long memRepot(MemberVO vo) {
		return dao.memRepot(vo);
	}
	

	
}
