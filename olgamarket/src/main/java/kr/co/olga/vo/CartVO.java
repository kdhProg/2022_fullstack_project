package kr.co.olga.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartVO {
	
	private Long caNo;
	private String camemId;
	private Long capdId;
	private Long caQuantity;

}
