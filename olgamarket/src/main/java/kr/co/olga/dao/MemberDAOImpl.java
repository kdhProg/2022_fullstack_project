package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession session;

	@Override
	public long memberJoin(MemberVO vo) {
		return session.insert("memberMapper.memberJoin", vo);
	}
	
	@Override
	public long idCheck(String memId) {
		return session.selectOne("memberMapper.idCheck", memId);
	}
/*	
 	// String memId, memPwd 값으로 로그인 구현
	@Override
	public MemberVO memberLogin(String memId) {
		return session.selectOne("memberMapper.selectMemId", memId);
	}
*/	
	// 로그인
	@Override
	public MemberVO memberLogin(MemberVO vo) {
		return session.selectOne("memberMapper.memberLogin", vo);
	}

	@Override
	public long memberUpdate(MemberVO vo) {
		return session.update("memberMapper.memberUpdate", vo);
	}

	@Override
	public long memberDeleteOne(String memId) {
		return session.delete("memberMapper.memberDeleteOne", memId);
	}

	@Override
	public List<MemberVO> memberList(String memId) {
		return session.selectList("memberMapper.memberList", memId);
	}

	@Override
	public MemberVO memIdFindSelect(MemberVO vo) {
		return session.selectOne("memberMapper.memIdFindSelect", vo);
	}

	@Override
	public MemberVO memPwdFindSelect(MemberVO vo) {
		return session.selectOne("memberMapper.memPwdFindSelect", vo);
	}

	@Override
	public long memPwdUpdate(MemberVO vo) {
		return session.update("memberMapper.memPwdUpdate", vo);
	}

// 관리자 회원관리 + 페이징	
	@Override
	public int getMemberCount() {
		return session.selectOne("memberMapper.getMemberCount");
	}

	@Override
	public List<NoticeVO> getMemberPageList(PagingVO vo) {
		return session.selectList("memberMapper.getMemberPageList", vo);
	}

	// 회원 정지
	@Override
	public long memRepot(MemberVO vo) {
		return session.update("memberMapper.memRepot", vo);
	}

	

	
	
}
