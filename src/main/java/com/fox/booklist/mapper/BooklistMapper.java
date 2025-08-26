package com.fox.booklist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fox.booklist.domain.booklistDTO;
import com.fox.bookrental.domain.rentalDTO;
import com.fox.paging.domain.SearchDTO;

@Mapper
public interface BooklistMapper {
	
	 //책 검색 리스트
	 List<booklistDTO> bookList(@Param("keyword") String keyword, String yu_userid);
	 
	 //대여여부 N / Y
	 //void updateRentalStatus(int ybi_idx, String status);
	
	 //대여정보 리스트
	 List<rentalDTO> rentalList(@Param("params") SearchDTO params, @Param("yu_userid") String yu_userid);
	 
	 //반납정보 리스트
	 List<rentalDTO> returnList(@Param("params") SearchDTO params, @Param("yu_userid") String yu_userid);
}
