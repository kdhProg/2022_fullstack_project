package kr.co.olga.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SelAnswerVO {

	private Long sasqNo;
	private String saContents;
	private String saRegiDate;
	private String saUpdDate;
}
