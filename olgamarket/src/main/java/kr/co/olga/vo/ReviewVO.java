package kr.co.olga.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class ReviewVO {
	
	private Long rvNo;
	private String rvmemId;
	private Long rvpdId;
	@NonNull
	private String rvContent;
	private String rvImg;
	private String rvRegiDate;
	private String rvUpdDate;
	private Long rvNice;
	private Long rvReport;

}
