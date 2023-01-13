package kr.co.olga.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PagingVO {
	String pgName;  //어떤 페이지인가? 예시: 신상품=newProduct
	int currentpageno; //현재페이지 정보 ( 컨트롤러가 줘야 함 )
	int recordCountPerPage;
	int pageSize;
	int totalRecordCount;
	int firstPageNoOnPageList;  //페이징 넘버 시작
	int lastPageNoOnPageList;   //페이징 넘버 끝
	int firstRecordIndex;
	boolean xprev;
	boolean xnext;
	int realEnd;
	int contEnd;  // Rnum용도
	int contStart;  // Rnum용도
	ArrayList<String> categories = new ArrayList<String>(); // 카테고리 용도
	int sort; // 1: 등록순   2: 판매량순   3: 가격-오름차순  4:가격-내림차순
	
}
