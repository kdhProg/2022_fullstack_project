package kr.co.olga.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.AdminDAO;
import kr.co.olga.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;

	@Override
	public AdminVO adminLogin(AdminVO vo) {
		return dao.adminLogin(vo);
	}
}
