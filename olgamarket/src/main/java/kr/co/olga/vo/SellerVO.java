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
public class SellerVO {
	
	   @NonNull
	   private String selId;
	   @NonNull
	   private String selPwd;
	   @NonNull
	   private String selName;
	   private String selstlBrandName;
	   private String selEmail;
	   private String selPhone;
	   @NonNull
	   private String selAddress;
	   @NonNull
	   private String selGender;
	   @NonNull
	   private String selGrade;
	   @NonNull
	   private String selMarketUniqueNo;
	   @NonNull
	   private String selSelRegiNo;
	   private Long selChoice;
	   private Long selTypeGrade;
	   private String selRegiDate;
	   private String selUpdDate;

}
