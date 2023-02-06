package kr.co.olga.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import kr.co.olga.vo.AdminVO;

public interface AdminService {

	AdminVO adminLogin(AdminVO vo);

	void mkStatisticsExcel(HttpServletResponse response) throws IOException;

}
