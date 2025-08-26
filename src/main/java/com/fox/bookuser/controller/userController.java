package com.fox.bookuser.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fox.booklist.mapper.BooklistMapper;
import com.fox.bookrental.domain.rentalDTO;
import com.fox.bookrental.mapper.RentalMapper;
import com.fox.bookuser.domain.userDTO;
import com.fox.bookuser.mapper.UserMapper;
import com.fox.paging.domain.Pagination;
import com.fox.paging.domain.SearchDTO;
import com.fox.paging.mapper.PagingMapper;

import jakarta.servlet.http.HttpSession;


@Controller
public class userController {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BooklistMapper booklistMapper;
	
	@Autowired
	private PagingMapper pagingMapper;
	
	
	@RequestMapping("/LoginForm")
	public String loginForm() {
		return "login_sample";
	}
	
	
	@RequestMapping("/login")
	public String login(userDTO userDTO, HttpSession session, Model model) {
		
		userDTO user = userMapper.getUser(userDTO);
		
		if(user != null && user.getYu_passwd().equals(userDTO.getYu_passwd())) {
			session.setAttribute("login_id", user.getYu_userid());
			return "index_sample";
		}else{
		model.addAttribute("error","아이디 또는 패스워드가 틀립니다.");	
		return "redirect:/LoginForm"; // home.jsp 로 포워딩
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		//세션 해제
		session.invalidate();
		return "redirect:/";
	}
	
	
	//대여내역 리스트
	@RequestMapping("/RentalList")
	//파라미터값에 searchTxt가 들어가지않아도 페이지가 열림
	public String rentalList(String searchTxt , SearchDTO params, HttpSession session ,  Model model) {
		String yu_userid = (String) session.getAttribute("login_id");
		//리스트 가져오기
		List<rentalDTO> rentalList = booklistMapper.rentalList(params, yu_userid);
		 // 1. 대여 내역의 총 개수 조회
		int totalCount = pagingMapper.rentalCount(yu_userid, params.getKeyword());
		//pagination 
		Pagination pagination = new Pagination(totalCount , params);
		params.setPagination(pagination);
		
		//페이지가 보다 작을 경우 1로 설정
		if(params.getPage() < 0) {
			params.setPage(1);
		}
		
		//페이징,대여리스트,유저아이디
		model.addAttribute("searchDTO", params);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("rentalList" , rentalList);
		model.addAttribute("yu_userid", yu_userid);
		return "rentalList";
	}
	
	//반납내역 리스트
	@RequestMapping("/ReturnList")
	//파라미터값에 searchTxt가 들어가지않아도 페이지가 열림
	public String returnList(String searchTxt , SearchDTO params, HttpSession session , Model model) {
		String yu_userid = (String) session.getAttribute("login_id");
		List<rentalDTO> returnList = booklistMapper.returnList(params, yu_userid);
		// 1. 반납 목록의 총 개수 조회
		int totalCount = pagingMapper.returnCount(yu_userid, params.getKeyword());
		
		//페이지가 보다 작을 경우 1로 설정
		if(params.getPage() < 0) {
			params.setPage(1);
		}
		//pagination 객체 생성
		Pagination pagination = new Pagination(totalCount , params);
		params.setPagination(pagination);
		
		//페이징,대여리스트,유저아이디
		model.addAttribute("searchDTO", params);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("returnList" , returnList);
		model.addAttribute("yu_userid", yu_userid);
		return "returnList";
	}
	
}
