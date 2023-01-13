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
public class FAQVO {

	private Long faqNo;
	private String faqadmId;
	@NonNull
	private String faqCategory;
	@NonNull
	private String faqTitle;
	@NonNull
	private String faqContent;
	private String faqRegiDate;
	private String faqUpdDate;

}
