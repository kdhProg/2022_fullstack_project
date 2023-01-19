package kr.co.olga.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.NewPdAnswerDAO;

@Service
public class NewPdAnswerServiceImpl implements NewPdAnswerService {

	@Autowired
	private NewPdAnswerDAO dao;
}
