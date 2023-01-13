package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession session;

	@Override
	public long noticeInsert(NoticeVO vo) {
		return session.insert("noticeMapper.noticeInsert", vo);
	}

	@Override
	public long noticeUpdate(NoticeVO vo) {
		return session.update("noticeMapper.noticeUpdate", vo);
	}
	
	@Override
	public long noticeDeleteOne(long ntNo) {
		return session.delete("noticeMapper.noticeDeleteOne", ntNo);
	}
	
	@Override
	public NoticeVO noticeSelectOne(long ntNo) {
		return session.selectOne("noticeMapper.noticeSelectOne", ntNo);
	}

	@Override
	public List<NoticeVO> noticeSelectList(PagingVO paging) {
		return session.selectList("noticeMapper.noticeSelectList", paging);
	}

// 공지사항 페이징	
	@Override
	public int getNoticeCount() {
		return session.selectOne("noticeMapper.getNoticeCount");
	}

	@Override
	public List<NoticeVO> getNoticePageList(PagingVO vo) {
		return session.selectList("noticeMapper.noticeSelectList", vo);
	}

	

	
	
	
}
