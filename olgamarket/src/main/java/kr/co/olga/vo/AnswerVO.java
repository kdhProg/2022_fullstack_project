package kr.co.olga.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AnswerVO {

	private Long iaiqNo;
	private String iaContents;
	private String iqRegiDate;
	private String iqUpdDate;

}
