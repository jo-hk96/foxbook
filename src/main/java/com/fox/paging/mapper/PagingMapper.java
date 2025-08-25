package com.fox.paging.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fox.booklist.domain.booklistDTO;
import com.fox.paging.domain.SearchDTO;

@Mapper
public interface PagingMapper {
	
	int count(SearchDTO params); 
	
	List<booklistDTO> getBookList(SearchDTO params);
	
	public List<booklistDTO> getBookList(@Param("params") SearchDTO params, @Param("yu_userid") String yu_userid);

	int count(String yu_userid, String keyword);

	int returnCount(String yu_userid, String keyword);
}
