package com.fox.booklist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fox.booklist.domain.booklistDTO;
import com.fox.booklist.mapper.BooklistMapper;

@Controller
public class booklistController {

	@Autowired
	private BooklistMapper booklistMapper;

	@RequestMapping("/")
	public String home() {
		return "index_sample";
	}
	
	@RequestMapping("/BookList")
	public String list(@RequestParam("search-txt") String search_txt, Model model) {
		List<booklistDTO> bookList = booklistMapper.bookList(search_txt);
		model.addAttribute("bookList", bookList);
		return "list_sample";
	}

}
