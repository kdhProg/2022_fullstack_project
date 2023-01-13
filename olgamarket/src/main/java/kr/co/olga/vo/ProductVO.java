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
public class ProductVO {

	@NonNull
	private Long pdId;
	@NonNull
	private String pdThumbImg;
	@NonNull
	private String pdName;
	@NonNull
	private String pdMainCategory;
	@NonNull
	private String pdSubCategory;
	private String pdstlBrandName;
	@NonNull
	private String pdStorageType;
	@NonNull
	private String pdUnit;
	@NonNull
	private String pdWeight;
	@NonNull
	private String pdCountry;
	@NonNull
	private String pdBBE;
	private String pdRegiDate;
	private String pdUpdDate;
	@NonNull
	private String pdDesInfoImg;
	@NonNull
	private String pdSeason;
	private Long pdHits;
	private Long pdSalesVolume;
	@NonNull
	private Long pdPrice;
	private Long pdSale;
	private Long pdStock;

}
