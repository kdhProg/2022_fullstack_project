package kr.co.olga.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
public class InquiryRecoReportVO {
	
	private Long irrNo;
	private Long irrBno;
	private String irrmemId;
	private String irrselId;
	private Long irrGood;
	private Long irrBad;

}
