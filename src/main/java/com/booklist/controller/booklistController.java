package com.booklist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booklist.mapper.BooklistMapper;


@Controller
public class booklistController {
	
	@Autowired
	private BooklistMapper booklistMapper;
	

	@RequestMapping("/")
	public String home() {
		return "index_sample";	
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login_sample";
	}
	
	@RequestMapping("/list")
	public String list() {
		
		
		
		return "list_sample";
	}
	
	@RequestMapping("/syslist")
	public String syslist() {
		return "syslist_sample";
	}
	@RequestMapping("/join")
	public String join() {
		return "join_sample";
	}
	
	
	
}
