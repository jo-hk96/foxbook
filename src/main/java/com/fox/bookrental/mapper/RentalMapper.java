package com.fox.bookrental.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.fox.bookrental.domain.rentalDTO;

@Mapper
public interface RentalMapper {

	void insertRental(rentalDTO rental);
	
	
}
