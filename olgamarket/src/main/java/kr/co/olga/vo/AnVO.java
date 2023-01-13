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
public class AnVO {

	private Long otaotqNo;
	private String otaadmId;
	@NonNull
	private String otaMainCategory;
	@NonNull
	private String otaSubCategory;
	@NonNull
	private String otaTitle;
	@NonNull
	private String otaContent;
	private String otaRegiDate;
	private String otaUpdDate;

}
