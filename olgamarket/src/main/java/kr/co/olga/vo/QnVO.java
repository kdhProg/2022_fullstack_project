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
public class QnVO {

	private Long otqNo;
	@NonNull
	private String otqMainCategory;
	@NonNull
	private String otqSubCategory;
	@NonNull
	private String otqTitle;
	@NonNull
	private String otqContent;
	private String otqmemId;
	private Long otqState;
	private String otqRegiDate;
	private String otqUpdDate;

}
