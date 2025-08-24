package com.fox.booklist.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fox.booklist.domain.booklistDTO;
import com.fox.booklist.mapper.BooklistMapper;
import com.fox.paging.domain.Pagination;
import com.fox.paging.domain.SearchDTO;
import com.fox.paging.mapper.PagingMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class booklistController {

	@Autowired
	private BooklistMapper booklistMapper;
	
	@Autowired
	private PagingMapper pagingMapper;

	@RequestMapping("/")
	public String home() {
		return "index_sample";
	}
	
	
	
	@GetMapping("/BookList")
	public String getBookList(SearchDTO params, HttpSession session, Model model) {
		
		// 1. 세션에서 로그인 사용자 ID 가져오기
		String yu_userid = (String) session.getAttribute("login_id");
		
		// 2. 검색 조건에 맞는 전체 게시글 수 조회
		int totalCount = pagingMapper.count(params);
		
		// 3. Pagination 객체 생성 및 SearchDTO에 주입
		Pagination pagination = new Pagination(totalCount, params);
		params.setPagination(pagination);
		
		// 4. 페이지네이션 정보와 사용자 ID, 검색 조건으로 목록 조회
		List<booklistDTO> bookList = pagingMapper.getBookList(params, yu_userid); // Mapper에 DTO와 ID를 함께 넘김
		
		// 5. 모델에 데이터 담아 뷰로 전달
		model.addAttribute("searchDTO", params);
		model.addAttribute("bookList", bookList);
		
		return "list_sample";
	}
	}
	
	
	
	
	
	
	
