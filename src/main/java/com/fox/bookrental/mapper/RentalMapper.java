package com.fox.bookrental.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fox.bookrental.domain.rentalDTO;

@Mapper
public interface RentalMapper {

	void insertRental(rentalDTO rental);
	
	void updateRental(rentalDTO rentalDTO);
	
}
