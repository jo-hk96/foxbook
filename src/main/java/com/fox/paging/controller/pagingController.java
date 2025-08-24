package com.fox.paging.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.fox.paging.mapper.PagingMapper;

@Controller
public class pagingController {

	@Autowired
	private PagingMapper pagingMapper;
	
	
}
