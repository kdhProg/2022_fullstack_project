package kr.co.olga.service;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.AdminDAO;
import kr.co.olga.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;
	
	@Autowired
	private VisitorsService vsService;
	
	@Autowired
	private PurchaseService purchaseService;

	@Override
	public AdminVO adminLogin(AdminVO vo) {
		return dao.adminLogin(vo);
	}
	
	@Override
	public void mkStatisticsExcel(HttpServletResponse response) throws IOException {
		XSSFWorkbook wb=new XSSFWorkbook();
		Sheet sheet=null;
		Row row=null;
		Cell cell=null; 
		sheet = wb.createSheet("admin_statistics");
		
		LocalDate now = LocalDate.now();
		
		// 판매량 평균
		long SalesVolumeRecentFourDaysAvg = 0L;
		if(purchaseService.daySalesVolumeSelect1() != null) {SalesVolumeRecentFourDaysAvg += purchaseService.daySalesVolumeSelect1();}
		if(purchaseService.daySalesVolumeSelect2() != null) {SalesVolumeRecentFourDaysAvg += purchaseService.daySalesVolumeSelect2();}
		if(purchaseService.daySalesVolumeSelect3() != null) {SalesVolumeRecentFourDaysAvg += purchaseService.daySalesVolumeSelect3();}
		if(purchaseService.daySalesVolumeSelect4() != null) {SalesVolumeRecentFourDaysAvg += purchaseService.daySalesVolumeSelect4();}
		SalesVolumeRecentFourDaysAvg = SalesVolumeRecentFourDaysAvg/4;
				
		long SalesVolumeRecent12MonthAvg = 0L;
		if(purchaseService.monthSalesVolumeSelect1() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect1();}
		if(purchaseService.monthSalesVolumeSelect2() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect2();}
		if(purchaseService.monthSalesVolumeSelect3() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect3();}
		if(purchaseService.monthSalesVolumeSelect4() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect4();}
		if(purchaseService.monthSalesVolumeSelect5() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect5();}
		if(purchaseService.monthSalesVolumeSelect6() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect6();}
		if(purchaseService.monthSalesVolumeSelect7() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect7();}
		if(purchaseService.monthSalesVolumeSelect8() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect8();}
		if(purchaseService.monthSalesVolumeSelect9() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect9();}
		if(purchaseService.monthSalesVolumeSelect10() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect10();}
		if(purchaseService.monthSalesVolumeSelect11() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect11();}
		if(purchaseService.monthSalesVolumeSelect12() != null) {SalesVolumeRecent12MonthAvg += purchaseService.monthSalesVolumeSelect12();}
		SalesVolumeRecent12MonthAvg = SalesVolumeRecent12MonthAvg/12;
		
		long SalesVolumeRecent10YearAvg = 0L;
		if(purchaseService.yearSalesVolumeSelect1() != null) {SalesVolumeRecent10YearAvg += purchaseService.yearSalesVolumeSelect1();}
		if(purchaseService.yearSalesVolumeSelect2() != null) {SalesVolumeRecent10YearAvg += purchaseService.yearSalesVolumeSelect2();}
		if(purchaseService.yearSalesVolumeSelect3() != null) {SalesVolumeRecent10YearAvg += purchaseService.yearSalesVolumeSelect3();}
		if(purchaseService.yearSalesVolumeSelect4() != null) {SalesVolumeRecent10YearAvg += purchaseService.yearSalesVolumeSelect4();}
		if(purchaseService.yearSalesVolumeSelect5() != null) {SalesVolumeRecent10YearAvg += purchaseService.yearSalesVolumeSelect5();}
		if(purchaseService.yearSalesVolumeSelect6() != null) {SalesVolumeRecent10YearAvg += purchaseService.yearSalesVolumeSelect6();}
		if(purchaseService.yearSalesVolumeSelect7() != null) {SalesVolumeRecent10YearAvg += purchaseService.yearSalesVolumeSelect7();}
		if(purchaseService.yearSalesVolumeSelect8() != null) {SalesVolumeRecent10YearAvg += purchaseService.yearSalesVolumeSelect8();}
		if(purchaseService.yearSalesVolumeSelect9() != null) {SalesVolumeRecent10YearAvg += purchaseService.yearSalesVolumeSelect9();}
		if(purchaseService.yearSalesVolumeSelect10() != null) {SalesVolumeRecent10YearAvg += purchaseService.yearSalesVolumeSelect10();}
		if(purchaseService.yearSalesVolumeSelect11() != null) {SalesVolumeRecent10YearAvg += purchaseService.yearSalesVolumeSelect11();}
		SalesVolumeRecent10YearAvg = SalesVolumeRecent10YearAvg/10;
		
		// 매출액 평균
		long priceRecentFourDaysAvg = 0L;
		if(purchaseService.daySalesVolumeSelect1() != null) {priceRecentFourDaysAvg += purchaseService.dayPriceTotalSelect();}
		if(purchaseService.daySalesVolumeSelect2() != null) {priceRecentFourDaysAvg += purchaseService.dayPriceTotalSelect2();}
		if(purchaseService.daySalesVolumeSelect3() != null) {priceRecentFourDaysAvg += purchaseService.dayPriceTotalSelect3();}
		if(purchaseService.daySalesVolumeSelect4() != null) {priceRecentFourDaysAvg += purchaseService.dayPriceTotalSelect4();}
		priceRecentFourDaysAvg = priceRecentFourDaysAvg/4;
				
		long priceRecent12MonthAvg = 0L;
		if(purchaseService.monthSalesVolumeSelect1() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect1();}
		if(purchaseService.monthSalesVolumeSelect2() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect2();}
		if(purchaseService.monthSalesVolumeSelect3() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect3();}
		if(purchaseService.monthSalesVolumeSelect4() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect4();}
		if(purchaseService.monthSalesVolumeSelect5() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect5();}
		if(purchaseService.monthSalesVolumeSelect6() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect6();}
		if(purchaseService.monthSalesVolumeSelect7() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect7();}
		if(purchaseService.monthSalesVolumeSelect8() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect8();}
		if(purchaseService.monthSalesVolumeSelect9() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect9();}
		if(purchaseService.monthSalesVolumeSelect10() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect10();}
		if(purchaseService.monthSalesVolumeSelect11() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect11();}
		if(purchaseService.monthSalesVolumeSelect12() != null) {priceRecent12MonthAvg += purchaseService.monthPriceTotalSelect12();}
		priceRecent12MonthAvg = priceRecent12MonthAvg/12;
		
		long priceRecent10YearAvg = 0L;
		if(purchaseService.yearSalesVolumeSelect1() != null) {priceRecent10YearAvg += purchaseService.yearPriceTotalSelect1();}
		if(purchaseService.yearSalesVolumeSelect2() != null) {priceRecent10YearAvg += purchaseService.yearPriceTotalSelect2();}
		if(purchaseService.yearSalesVolumeSelect3() != null) {priceRecent10YearAvg += purchaseService.yearPriceTotalSelect3();}
		if(purchaseService.yearSalesVolumeSelect4() != null) {priceRecent10YearAvg += purchaseService.yearPriceTotalSelect4();}
		if(purchaseService.yearSalesVolumeSelect5() != null) {priceRecent10YearAvg += purchaseService.yearPriceTotalSelect5();}
		if(purchaseService.yearSalesVolumeSelect6() != null) {priceRecent10YearAvg += purchaseService.yearPriceTotalSelect6();}
		if(purchaseService.yearSalesVolumeSelect7() != null) {priceRecent10YearAvg += purchaseService.yearPriceTotalSelect7();}
		if(purchaseService.yearSalesVolumeSelect8() != null) {priceRecent10YearAvg += purchaseService.yearPriceTotalSelect8();}
		if(purchaseService.yearSalesVolumeSelect9() != null) {priceRecent10YearAvg += purchaseService.yearPriceTotalSelect9();}
		if(purchaseService.yearSalesVolumeSelect10() != null) {priceRecent10YearAvg += purchaseService.yearPriceTotalSelect10();}
		if(purchaseService.yearSalesVolumeSelect11() != null) {priceRecent10YearAvg += purchaseService.yearPriceTotalSelect11();}
		priceRecent10YearAvg = priceRecent10YearAvg/10;
		
		// 타이틀 폰트
		Font headerFont = wb.createFont();
	    headerFont.setFontName("나눔고딕");
	    headerFont.setFontHeight((short)400);
	    headerFont.setColor(IndexedColors.BLACK.getIndex());
	    headerFont.setBold(true);
	        
	    CellStyle headerStyle = wb.createCellStyle();
	    headerStyle.setAlignment(HorizontalAlignment.CENTER);
	    headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	    headerStyle.setFont(headerFont);
	    
	    // 볼드체 폰트
 		Font subTitleFont = wb.createFont();
 		subTitleFont.setFontName("나눔고딕");
 		subTitleFont.setFontHeight((short)250);
 		subTitleFont.setColor(IndexedColors.BLACK.getIndex());
 		subTitleFont.setBold(true);
 	        
 	    CellStyle subTitleStyle = wb.createCellStyle();
 	    subTitleStyle.setAlignment(HorizontalAlignment.LEFT);
 	    subTitleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
 	    subTitleStyle.setFont(subTitleFont);
	    
	    // 수치 증감 폰트 - 증가
		Font increasedFont = wb.createFont();
		increasedFont.setFontName("나눔고딕");
		increasedFont.setFontHeight((short)250);
		increasedFont.setColor(IndexedColors.RED.getIndex());
		increasedFont.setBold(true);
	        
	    CellStyle increasedStyle = wb.createCellStyle();
	    increasedStyle.setAlignment(HorizontalAlignment.LEFT);
	    increasedStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	    increasedStyle.setFont(increasedFont);
	    increasedStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
	    
	    // 수치 증감 폰트 - 감소
 		Font decreasedFont = wb.createFont();
 		decreasedFont.setFontName("나눔고딕");
 		decreasedFont.setFontHeight((short)250);
 		decreasedFont.setColor(IndexedColors.BLUE.getIndex());
 		decreasedFont.setBold(true);
 	        
 	    CellStyle decreasedStyle = wb.createCellStyle();
 	    decreasedStyle.setAlignment(HorizontalAlignment.LEFT);
 	    decreasedStyle.setVerticalAlignment(VerticalAlignment.CENTER);
 	    decreasedStyle.setFont(decreasedFont);
 	    decreasedStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
 	    
 	    // 범용 쉼표 찍기
 	    Font normalNumFormat = wb.createFont();
 	    normalNumFormat.setFontName("나눔고딕");
	        
	    CellStyle normalNumStyle = wb.createCellStyle();
	    normalNumStyle.setAlignment(HorizontalAlignment.LEFT);
	    normalNumStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	    normalNumStyle.setFont(normalNumFormat);
	    normalNumStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
		
		// 타이틀 컬럼 너비 조정
		sheet.setColumnWidth(1, 4000);
		sheet.setColumnWidth(3, 4000);
		sheet.setColumnWidth(5, 4000);
		
		// 편차 컬럼 너비조정
		sheet.setColumnWidth(2, 3700);
		sheet.setColumnWidth(4, 3700);
		sheet.setColumnWidth(6, 3700);
		
		// 1. 헤더
		row = sheet.createRow(1); //1번째 행
		cell=row.createCell(1);
		cell.setCellValue("통계");
		cell.setCellStyle(headerStyle);
		sheet.addMergedRegion(new CellRangeAddress(1,1,1,6)); // 행시작, 행끝, 열시작, 열끝

		// 2.오늘 날짜
		row = sheet.createRow(2); //2번째 행
		cell=row.createCell(5);
		cell.setCellValue("다운로드 일자: ");
		cell=row.createCell(6);
		cell.setCellValue(now.toString());
		
		// 3.일일 방문자수 누적 방문자수
		row = sheet.createRow(4); //4번째 행 => 한줄 건너띄기
		cell=row.createCell(1);
		cell.setCellValue("오늘 방문자수");
		cell.setCellStyle(subTitleStyle);
		cell=row.createCell(2);
		cell.setCellValue(vsService.todayVisit());
		
		row = sheet.createRow(5); //5번째 행
		cell=row.createCell(1);
		cell.setCellValue("누적 방문자수");
		cell.setCellStyle(subTitleStyle);
		cell=row.createCell(2);
		cell.setCellValue(vsService.accumulateVisit());
		
		// 4.판매량
		row = sheet.createRow(7); //7번째 행 => 한줄 건너띄기
		cell=row.createCell(1);
		cell.setCellValue("판매량");
		cell.setCellStyle(subTitleStyle);
		
		row = sheet.createRow(8); //8번째 행
		cell=row.createCell(1);
		cell.setCellValue("일일 판매량");
		cell.setCellStyle(subTitleStyle);
		cell=row.createCell(3);
		cell.setCellValue("월별 판매량");
		cell.setCellStyle(subTitleStyle);
		
		row = sheet.createRow(9); //9번째 행
		cell=row.createCell(1);
		cell.setCellValue("금일");
		cell=row.createCell(2);
		if(purchaseService.daySalesVolumeSelect1() != null) {cell.setCellValue(purchaseService.daySalesVolumeSelect1());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(3);
		cell.setCellValue("금월");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect1() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect1());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("금년");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect1() != null) {cell.setCellValue(purchaseService.yearSalesVolumeSelect1());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(10); //10번째 행
		cell=row.createCell(1);
		cell.setCellValue("1일전");
		cell=row.createCell(2);
		if(purchaseService.daySalesVolumeSelect2() != null) {cell.setCellValue(purchaseService.daySalesVolumeSelect2());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(3);
		cell.setCellValue("1달전");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect2() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect2());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("1년전");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect2() != null) {cell.setCellValue(purchaseService.yearSalesVolumeSelect2());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(11); //11번째 행
		cell=row.createCell(1);
		cell.setCellValue("2일전");
		cell=row.createCell(2);
		if(purchaseService.daySalesVolumeSelect3() != null) {cell.setCellValue(purchaseService.daySalesVolumeSelect3());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(3);
		cell.setCellValue("2달전");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect3() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect3());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("2년전");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect3() != null) {cell.setCellValue(purchaseService.yearSalesVolumeSelect3());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(12); //12번째 행
		cell=row.createCell(1);
		cell.setCellValue("3일전");
		cell=row.createCell(2);
		if(purchaseService.daySalesVolumeSelect4() != null) {cell.setCellValue(purchaseService.daySalesVolumeSelect4());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(3);
		cell.setCellValue("3달전");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect4() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect4());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("3년전");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect4() != null) {cell.setCellValue(purchaseService.yearSalesVolumeSelect4());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(13); //13번째 행
		cell=row.createCell(3);
		cell.setCellValue("4달전");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect5() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect5());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("4년전");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect5() != null) {cell.setCellValue(purchaseService.yearSalesVolumeSelect5());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(14); //14번째 행
		cell=row.createCell(3);
		cell.setCellValue("5달전");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect6() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect6());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("5년전");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect6() != null) {cell.setCellValue(purchaseService.yearSalesVolumeSelect6());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(15); //15번째 행
		cell=row.createCell(3);
		cell.setCellValue("6달전");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect7() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect7());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("6년전");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect7() != null) {cell.setCellValue(purchaseService.yearSalesVolumeSelect7());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(16); //16번째 행
		cell=row.createCell(3);
		cell.setCellValue("7달전");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect8() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect8());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("7년전");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect8() != null) {cell.setCellValue(purchaseService.yearSalesVolumeSelect8());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(17); //17번째 행
		cell=row.createCell(3);
		cell.setCellValue("8달전");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect9() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect9());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("8년전");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect9() != null) {cell.setCellValue(purchaseService.yearSalesVolumeSelect9());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(18); //18번째 행
		cell=row.createCell(3);
		cell.setCellValue("9달전");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect10() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect10());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("9년전");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect10() != null) {cell.setCellValue(purchaseService.yearSalesVolumeSelect10());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(19); //19번째 행
		cell=row.createCell(3);
		cell.setCellValue("10달전");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect11() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect11());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("10년전");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect11() != null) {cell.setCellValue(purchaseService.yearSalesVolumeSelect11());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(20); //20번째 행
		cell=row.createCell(3);
		cell.setCellValue("11달전");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect12() != null) {cell.setCellValue(purchaseService.monthSalesVolumeSelect12());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(21); //21번째 행 - 건너띄기
		
		row = sheet.createRow(22); //22번째 행 - 판매량 전체값 평균
		cell=row.createCell(1);
		cell.setCellValue("최근 4일 평균");
		cell=row.createCell(2);
		cell.setCellValue(SalesVolumeRecentFourDaysAvg);
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(3);
		cell.setCellValue("최근 12달 평균");
		cell=row.createCell(4);
		cell.setCellValue(SalesVolumeRecent12MonthAvg);
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("최근 10년 평균");
		cell=row.createCell(6);
		cell.setCellValue(SalesVolumeRecent10YearAvg);
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(23); //23번째 행 - 판매량 전체값 편차 
		cell=row.createCell(1);
		cell.setCellValue("금일-4일 편차");
		cell=row.createCell(2);
		if(purchaseService.daySalesVolumeSelect1() != null) {
			if((purchaseService.daySalesVolumeSelect1()-SalesVolumeRecentFourDaysAvg)>0) {
				cell.setCellValue(purchaseService.daySalesVolumeSelect1()-SalesVolumeRecentFourDaysAvg);
				cell.setCellStyle(increasedStyle);
			}else if((purchaseService.daySalesVolumeSelect1()-SalesVolumeRecentFourDaysAvg) == 0){
				cell.setCellValue(purchaseService.daySalesVolumeSelect1()-SalesVolumeRecentFourDaysAvg);
				cell.setCellStyle(subTitleStyle);
			}else {
				cell.setCellValue(purchaseService.daySalesVolumeSelect1()-SalesVolumeRecentFourDaysAvg);
				cell.setCellStyle(decreasedStyle);
			}
		}else{
			cell.setCellValue(-SalesVolumeRecentFourDaysAvg);
			cell.setCellStyle(decreasedStyle);
		}
		cell=row.createCell(3);
		cell.setCellValue("금월-12달 편차");
		cell=row.createCell(4);
		if(purchaseService.monthSalesVolumeSelect1() != null) {
			if((purchaseService.monthSalesVolumeSelect1()-SalesVolumeRecent12MonthAvg)>0) {
				cell.setCellValue(purchaseService.monthSalesVolumeSelect1()-SalesVolumeRecent12MonthAvg);
				cell.setCellStyle(increasedStyle);
			}else if((purchaseService.monthSalesVolumeSelect1()-SalesVolumeRecent12MonthAvg)==0) {
				cell.setCellValue(purchaseService.monthSalesVolumeSelect1()-SalesVolumeRecent12MonthAvg);
				cell.setCellStyle(subTitleStyle);
			}else {
				cell.setCellValue(purchaseService.monthSalesVolumeSelect1()-SalesVolumeRecent12MonthAvg);
				cell.setCellStyle(decreasedStyle);
			}
		}else{
			cell.setCellValue(-SalesVolumeRecent12MonthAvg);
			cell.setCellStyle(decreasedStyle);
		}
		cell=row.createCell(5);
		cell.setCellValue("금년-10년 편차");
		cell=row.createCell(6);
		if(purchaseService.yearSalesVolumeSelect1() != null) {
			if((purchaseService.yearSalesVolumeSelect1()-SalesVolumeRecent10YearAvg)>0) {
				cell.setCellValue(purchaseService.yearSalesVolumeSelect1()-SalesVolumeRecent10YearAvg);
				cell.setCellStyle(increasedStyle);
			}else if((purchaseService.yearSalesVolumeSelect1()-SalesVolumeRecent10YearAvg)==0) {
				cell.setCellValue(purchaseService.yearSalesVolumeSelect1()-SalesVolumeRecent10YearAvg);
				cell.setCellStyle(subTitleStyle);
			}else {
				cell.setCellValue(purchaseService.yearSalesVolumeSelect1()-SalesVolumeRecent10YearAvg);
				cell.setCellStyle(decreasedStyle);
			}
		}else{
			cell.setCellValue(-SalesVolumeRecent10YearAvg);
			cell.setCellStyle(decreasedStyle);
		}
		
		// =================== 매출액 =========================
		// 4.판매량
		row = sheet.createRow(25); //25번째 행 => 한줄 건너띄기
		cell=row.createCell(1);
		cell.setCellValue("판매액");
		cell.setCellStyle(subTitleStyle);
		
		row = sheet.createRow(26); //26번째 행
		cell=row.createCell(1);
		cell.setCellValue("일일 판매액");
		cell.setCellStyle(subTitleStyle);
		cell=row.createCell(3);
		cell.setCellValue("월별 판매액");
		cell.setCellStyle(subTitleStyle);
		
		row = sheet.createRow(27); //27번째 행
		cell=row.createCell(1);
		cell.setCellValue("금일");
		cell=row.createCell(2);
		if(purchaseService.dayPriceTotalSelect() != null) {cell.setCellValue(purchaseService.dayPriceTotalSelect());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(3);
		cell.setCellValue("금월");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect1() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect1());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("금년");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect1() != null) {cell.setCellValue(purchaseService.yearPriceTotalSelect1());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(28); //28번째 행
		cell=row.createCell(1);
		cell.setCellValue("1일전");
		cell=row.createCell(2);
		if(purchaseService.dayPriceTotalSelect2() != null) {cell.setCellValue(purchaseService.dayPriceTotalSelect2());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(3);
		cell.setCellValue("1달전");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect2() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect2());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("1년전");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect2() != null) {cell.setCellValue(purchaseService.yearPriceTotalSelect2());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(29); //29번째 행
		cell=row.createCell(1);
		cell.setCellValue("2일전");
		cell=row.createCell(2);
		if(purchaseService.dayPriceTotalSelect3() != null) {cell.setCellValue(purchaseService.dayPriceTotalSelect3());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(3);
		cell.setCellValue("2달전");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect3() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect3());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("2년전");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect3() != null) {cell.setCellValue(purchaseService.yearPriceTotalSelect3());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(30); //30번째 행
		cell=row.createCell(1);
		cell.setCellValue("3일전");
		cell=row.createCell(2);
		if(purchaseService.dayPriceTotalSelect4() != null) {cell.setCellValue(purchaseService.dayPriceTotalSelect4());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(3);
		cell.setCellValue("3달전");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect4() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect4());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("3년전");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect4() != null) {cell.setCellValue(purchaseService.yearPriceTotalSelect4());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(31); //31번째 행
		cell=row.createCell(3);
		cell.setCellValue("4달전");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect5() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect5());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("4년전");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect5() != null) {cell.setCellValue(purchaseService.yearPriceTotalSelect5());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(32); //32번째 행
		cell=row.createCell(3);
		cell.setCellValue("5달전");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect6() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect6());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("5년전");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect6() != null) {cell.setCellValue(purchaseService.yearPriceTotalSelect6());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(33); //33번째 행
		cell=row.createCell(3);
		cell.setCellValue("6달전");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect7() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect7());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("6년전");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect7() != null) {cell.setCellValue(purchaseService.yearPriceTotalSelect7());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(34); //34번째 행
		cell=row.createCell(3);
		cell.setCellValue("7달전");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect8() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect8());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("7년전");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect8() != null) {cell.setCellValue(purchaseService.yearPriceTotalSelect8());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(35); //35번째 행
		cell=row.createCell(3);
		cell.setCellValue("8달전");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect9() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect9());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("8년전");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect9() != null) {cell.setCellValue(purchaseService.yearPriceTotalSelect9());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(36); //36번째 행
		cell=row.createCell(3);
		cell.setCellValue("9달전");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect10() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect10());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("9년전");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect10() != null) {cell.setCellValue(purchaseService.yearPriceTotalSelect10());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(37); //37번째 행
		cell=row.createCell(3);
		cell.setCellValue("10달전");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect11() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect11());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("10년전");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect11() != null) {cell.setCellValue(purchaseService.yearPriceTotalSelect11());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(38); //38번째 행
		cell=row.createCell(3);
		cell.setCellValue("11달전");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect12() != null) {cell.setCellValue(purchaseService.monthPriceTotalSelect12());}else {cell.setCellValue(0);}
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(39); //39번째 행 - 건너띄기
		
		row = sheet.createRow(40); //40번째 행 - 매출 전체값 평균
		cell=row.createCell(1);
		cell.setCellValue("최근 4일 평균");
		cell=row.createCell(2);
		cell.setCellValue(priceRecentFourDaysAvg);
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(3);
		cell.setCellValue("최근 12달 평균");
		cell=row.createCell(4);
		cell.setCellValue(priceRecent12MonthAvg);
		cell.setCellStyle(normalNumStyle);
		cell=row.createCell(5);
		cell.setCellValue("최근 10년 평균");
		cell=row.createCell(6);
		cell.setCellValue(priceRecent10YearAvg);
		cell.setCellStyle(normalNumStyle);
		
		row = sheet.createRow(41); //41번째 행 - 매출 전체값 편차
		cell=row.createCell(1);
		cell.setCellValue("금일-4일 편차");
		cell=row.createCell(2);
		if(purchaseService.dayPriceTotalSelect() != null) {
			if((purchaseService.dayPriceTotalSelect()-priceRecentFourDaysAvg)>0) {
				cell.setCellValue(purchaseService.dayPriceTotalSelect()-priceRecentFourDaysAvg);
				cell.setCellStyle(increasedStyle);
			}else if((purchaseService.dayPriceTotalSelect()-priceRecentFourDaysAvg)==0) {
				cell.setCellValue(purchaseService.dayPriceTotalSelect()-priceRecentFourDaysAvg);
				cell.setCellStyle(subTitleStyle);
			}else {
				cell.setCellValue(purchaseService.dayPriceTotalSelect()-priceRecentFourDaysAvg);
				cell.setCellStyle(decreasedStyle);
			}
		}else {
			cell.setCellValue(-priceRecentFourDaysAvg);
			cell.setCellStyle(decreasedStyle);
		}
		cell=row.createCell(3);
		cell.setCellValue("금월-12달 편차");
		cell=row.createCell(4);
		if(purchaseService.monthPriceTotalSelect1() != null) {
			if((purchaseService.monthPriceTotalSelect1()-priceRecent12MonthAvg)>0) {
				cell.setCellValue(purchaseService.monthPriceTotalSelect1()-priceRecent12MonthAvg);
				cell.setCellStyle(increasedStyle);
			}else if((purchaseService.monthPriceTotalSelect1()-priceRecent12MonthAvg)==0) {
				cell.setCellValue(purchaseService.monthPriceTotalSelect1()-priceRecent12MonthAvg);
				cell.setCellStyle(subTitleStyle);
			}else {
				cell.setCellValue(purchaseService.monthPriceTotalSelect1()-priceRecent12MonthAvg);
				cell.setCellStyle(decreasedStyle);
			}
		}else {
			cell.setCellValue(-priceRecent12MonthAvg);
			cell.setCellStyle(decreasedStyle);
		}
		cell=row.createCell(5);
		cell.setCellValue("금년-10년 편차");
		cell=row.createCell(6);
		if(purchaseService.yearPriceTotalSelect1() != null) {
			if((purchaseService.yearPriceTotalSelect1()-priceRecent10YearAvg)>0) {
				cell.setCellValue(purchaseService.yearPriceTotalSelect1()-priceRecent10YearAvg);
				cell.setCellStyle(increasedStyle);
			}else if((purchaseService.yearPriceTotalSelect1()-priceRecent10YearAvg)==0) {
				cell.setCellValue(purchaseService.yearPriceTotalSelect1()-priceRecent10YearAvg);
				cell.setCellStyle(subTitleStyle);
			}else {
				cell.setCellValue(purchaseService.yearPriceTotalSelect1()-priceRecent10YearAvg);
				cell.setCellStyle(decreasedStyle);
			}
		}else {
			cell.setCellValue(-priceRecent10YearAvg);
			cell.setCellStyle(decreasedStyle);
		}
		
		
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=olgaAdminStatistics.xlsx");  //파일이름지정.
		//response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
		
	}
}
