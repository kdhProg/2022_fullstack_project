package kr.co.olga.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.VisitorsDAO;
import kr.co.olga.vo.VisitorsVO;

@Service
public class VisitorsServiceImpl implements VisitorsService {

	@Autowired
	private VisitorsDAO dao;
	
	@Override
	public String CalculationDate(String sttDate, int year, int month , int day) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		Calendar cal = Calendar.getInstance();
		
		Date date = sdf.parse(sttDate);
		
		cal.setTime(date);
		
		cal.add(Calendar.YEAR, year);
		cal.add(Calendar.MONTH, month);
		cal.add(Calendar.DATE, day);
		
		return sdf.format(cal.getTime());
	}
	
	@Override
	public int visitorsInsert(VisitorsVO vo) {
		return dao.visitorsInsert(vo);
	}
	
	@Override
	public List<Long> countGroupByDate() {
		return dao.countGroupByDate();
	}
	
	@Override
	public List<String> showDateGroupByDate() {
		return dao.showDateGroupByDate();
	}
	
	@Override
	public long todayVisit() {
		return dao.todayVisit();
	}
	
	@Override
	public long accumulateVisit() {
		return dao.accumulateVisit();
	}

}
