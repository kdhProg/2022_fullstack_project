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
public class StoreVO {

	private Long stlNo;
	private String stlBrandName;
	@NonNull
	private String stlInfo;
	@NonNull
	private String stlPhone;
	@NonNull
	private String stlEmail;
	@NonNull
	private String stlMarketUniqueNo;
	@NonNull
	private String stlSelRegiNo;
	private String stlRegiDate;
	private String stlUpdDate;

}
