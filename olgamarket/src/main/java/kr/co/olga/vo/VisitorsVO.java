package kr.co.olga.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisitorsVO {
	
	private long viNo; 
	private String viIp; 
	private String viTime;
}
