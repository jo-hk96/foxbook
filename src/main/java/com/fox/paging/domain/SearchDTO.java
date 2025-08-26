package com.fox.paging.domain;


import lombok.Data;

@Data
public class SearchDTO {
	private int page;
	private int recordSize;
	private int pageSize;
	private String keyword;
	private String searchType;
	private Pagination pagination;
	
	
	
	public SearchDTO() {
		this.page = 1;
		this.recordSize = 10;
		this.pageSize = 5;
	}

	public int getOffset() {
		return (page - 1) * recordSize;
		
	}
	
}
