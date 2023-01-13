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
public class NoticeVO {

	private Long ntNo;
	private String ntadmId;
	@NonNull
	private String ntCategory;
	@NonNull
	private String ntTitle;
	@NonNull
	private String ntContent;
	private String ntRegiDate;
	private String ntUpdDate;

}
