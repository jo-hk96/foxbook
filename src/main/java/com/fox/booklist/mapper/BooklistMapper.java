package com.fox.booklist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fox.booklist.domain.booklistDTO;
import com.fox.bookrental.domain.rentalDTO;

@Mapper
public interface BooklistMapper {
	
	 //책 검색 리스트
	 List<booklistDTO> bookList(@Param("YBI_SUBJECT") String ybi_subject);
	 
	 booklistDTO GetBookId(int bookId);

	void updateRentalStatus(int ybi_idx, String status);
	 
	
	List<rentalDTO> rentalList(@Param("yu_userid") String yu_userid);

	
	
	
}
