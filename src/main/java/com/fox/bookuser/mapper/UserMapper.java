package com.fox.bookuser.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.fox.bookuser.domain.userDTO;

@Mapper
public interface UserMapper {

	userDTO getUser( userDTO userDTO);
	
}
