package com.fox.bookrental.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fox.bookrental.domain.rentalDTO;

@Mapper
public interface RentalMapper {
	
	
	
	//대여날짜 삽입
	void insertRental(rentalDTO rental);
	
	
	
	//반납날짜 삽입
	void updateRental(rentalDTO rentalDTO);
	
}
