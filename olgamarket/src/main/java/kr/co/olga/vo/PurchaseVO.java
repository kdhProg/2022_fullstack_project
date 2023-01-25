package kr.co.olga.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PurchaseVO {

	private Long plNo;
	private String plDate;
	private String plOrderNo;
	private String plmemId;
	private Long plpdId;
	private Long plPdQuantity;
	private Long plTotalPrice;
	private Long plSavedMoney;
	private String plPayWay;
	private String plShipAddInfo;
	private String plOrderState;

}
