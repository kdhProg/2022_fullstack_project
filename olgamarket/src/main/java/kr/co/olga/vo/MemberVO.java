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
public class MemberVO {
	
	@NonNull
	private String memId;
	@NonNull
	private String memPwd;
	@NonNull
	private String memName;
	@NonNull
	private String memEmail;
	@NonNull
	private String memPhone;
	@NonNull
	private String memAddress;
	@NonNull
	private String memGender;
	@NonNull
	private String memGrade;
	private String memRegiDate;
	private String memUpdDate;
	private Long memChoice;


}
