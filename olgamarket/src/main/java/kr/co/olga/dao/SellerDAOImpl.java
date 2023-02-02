package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;
import kr.co.olga.vo.SellerVO;

@Repository
public class SellerDAOImpl implements SellerDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public long selJoin(SellerVO vo) {
		return session.insert("sellerMapper.sellerJoin", vo);
	}
	
	@Override
	public long selDelOne(String selId) {
		return session.delete("sellerMapper.sellerDelOne",selId);
	}
	
	@Override
	public long selUpd(SellerVO vo) {
		return session.update("sellerMapper.sellerUpdateOne",vo);
	}
	
	@Override
	public SellerVO sellerSelOne(String selId) {
		return session.selectOne("sellerMapper.sellerSelOne",selId);
	}
	
	@Override
	public List<SellerVO> sellerSelAll() {
		return session.selectList("sellerMapper.sellerSelAll");
	}
	
	@Override
	public long sellerIdcheck(String selId) {
		return session.selectOne("sellerMapper.sellerIdcheck",selId);
	}
	
	@Override
	public long sellerUpdatePwd(SellerVO vo) {
		return session.update("sellerMapper.sellerUpdatePwd",vo);
	}
	
	@Override
	public SellerVO sellerIdFind(SellerVO vo) {
		return session.selectOne("sellerMapper.sellerIdFind",vo);
	}
	
	@Override
	public SellerVO sellerPwdFind(SellerVO vo) {
		return session.selectOne("sellerMapper.sellerPwdFind",vo);
	}

// 관리자 판매자 관리 + 페이징	
	@Override
	public int getSellerCount(PagingVO sortVo) {
		return session.selectOne("sellerMapper.getSellerCount", sortVo);
	}

	@Override
	public List<SellerVO> getSellerPageList(PagingVO vo) {
		return session.selectList("sellerMapper.getSellerPageList", vo);
	}

// 판매자 권한 회수	
	@Override
	public long sellerGrantUpdate(SellerVO vo) {
		return session.update("sellerMapper.sellerGrantUpdate", vo);
	}
	
	@Override
	public SellerVO sellerLogin(SellerVO vo) {
		return session.selectOne("sellerMapper.sellerLogin", vo);
	}
	
	@Override
	public int sellerEmailCheck(String selEmail) {
		return session.selectOne("sellerMapper.sellerEmailCheck", selEmail);
	}

}
