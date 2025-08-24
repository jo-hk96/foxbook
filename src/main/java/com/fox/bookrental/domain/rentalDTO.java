package com.fox.bookrental.domain;

import lombok.Data;

@Data
public class rentalDTO {
	private int yri_idx; //대여정보 고유 번호
	private int ybi_idx; // 도서목록 고유번호
	private String yri_rtdate; // 대여시작일
	private String yri_redate; // 반납일
	private String yu_userid; //사용자 ID
	private String ybi_subject;
	private String ybi_publi;
	private String ybi_name;
	
}
