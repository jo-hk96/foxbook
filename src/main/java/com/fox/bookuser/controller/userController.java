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

import jakarta.servlet.http.HttpSession;


@Controller
public class userController {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BooklistMapper booklistMapper;
	
	
	
	
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
	
	@RequestMapping("/MyPage")
	public String mypage(HttpSession session ,  Model model) {
		String yu_userid = (String) session.getAttribute("login_id");
		List<rentalDTO> rentalList = booklistMapper.rentalList(yu_userid);
		
		//유저아이디가 null일경우 = 로그인을 하지 않은 경우
		if(yu_userid == null) {
			return "redirect:/LoginForm";
		}
		//mypage 의 rentalList 담긴 rentalDTO 리스트를 보냄
		model.addAttribute("rentalList" , rentalList);
		return "mypage";
	}
	
	
	
	
	
	
}
