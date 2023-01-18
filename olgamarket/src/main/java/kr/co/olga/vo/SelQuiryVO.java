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
public class SelQuiryVO {

	private Long sqNo;
	private String sqselId;
	private Long sqpdId;
	@NonNull
	private String sqTitle;
	@NonNull
	private String sqContent;
	private Long sqState;
	private String sqRegiDate;
	private String sqUpdDate;
}
