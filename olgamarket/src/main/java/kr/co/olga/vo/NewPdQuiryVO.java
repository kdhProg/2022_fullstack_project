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
public class NewPdQuiryVO {

	private Long npqNo;
	private String npqselId;
	@NonNull
	private String npqTitle;
	@NonNull
	private String npqContent; 
	@NonNull
	private String npqImg;
	private Long npqState;
	private String npqRegiDate;
	private String npqUpdDate;
}
