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
public class QuiryVO {
	
	@NonNull
	private Long iqNo;
	private String iqmemId;
	private Long iqpdId;
	@NonNull
	private String iqTitle;
	@NonNull
	private String iqContent;
	@NonNull
	private Long iqPrivate;
	private Long iqState;
	private String iqRegiDate;
	private String iqUpdDate;


}
