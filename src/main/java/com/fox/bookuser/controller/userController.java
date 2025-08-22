package com.fox.bookuser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fox.bookuser.domain.userDTO;
import com.fox.bookuser.mapper.UserMapper;

import jakarta.servlet.http.HttpSession;


@Controller
public class userController {

	@Autowired
	private UserMapper userMapper;
	
	
	
	@RequestMapping("/LoginForm")
	public String loginForm() {
		return "login_sample";
	}
	
	
	@RequestMapping("/login")
	public String login(userDTO userDTO, HttpSession session, Model model) {
		//DTO 형식으로 하나의 유저정보를 가져옴
		userDTO user = userMapper.getUser(userDTO);
		//db에 해당하는 id가 없으면 null 반환
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
	
	
	
	
}
