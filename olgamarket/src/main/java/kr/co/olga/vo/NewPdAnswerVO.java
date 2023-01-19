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
public class NewPdAnswerVO {

	private Long npanpqNo;
	@NonNull
	private String npaContent;
	private String npaRegiDate;
	private String npaUpdDate;
}
