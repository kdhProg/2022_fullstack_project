package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.VisitorsVO;

public interface VisitorsDAO {

	int visitorsInsert(VisitorsVO vo);

	List<Long> countGroupByDate();

	List<String> showDateGroupByDate();

	long todayVisit();

	long accumulateVisit();

}
