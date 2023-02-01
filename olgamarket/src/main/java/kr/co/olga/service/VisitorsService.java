package kr.co.olga.service;

import java.text.ParseException;
import java.util.List;

import kr.co.olga.vo.VisitorsVO;

public interface VisitorsService {
	
	// 날짜연산 함수
	String CalculationDate(String sttDate, int year, int month , int day) throws ParseException;
	
	//문자열 ip와 time(yyyymmdd)주면 인서트
	int visitorsInsert(VisitorsVO vo);
	
	// 시간별로 조회수 더해서 리스트로 반환 => 날짜는 오름차순
	List<Long> countGroupByDate();
	
	// 시간별로 날짜 리스트로 반환 => 날짜는 오름차순
	List<String> showDateGroupByDate();
	
	// 오늘 방문수
	long todayVisit();
	
	// 누적 방문수
	long accumulateVisit();

}
