package com.fox.bookrental.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fox.booklist.mapper.BooklistMapper;
import com.fox.bookrental.domain.rentalDTO;
import com.fox.bookrental.mapper.RentalMapper;
import com.fox.paging.mapper.PagingMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class rentalController {
	@Autowired
	private RentalMapper rentalMapper;
	
	@Autowired
	private BooklistMapper booklistMapper;
	
	
	//대여
	@RequestMapping("/Rent")
	public String rental(@RequestParam("ybi_idx") int ybi_idx ,String ybi_subject ,HttpSession session, RedirectAttributes re) {
		//booklistDTO bookid = booklistMapper.GetBookId(ybi_idx);
		String userId = (String) session.getAttribute("login_id");
		
		//하루에 ybi_idx 기준으로 같은책은 3번 , 다른책은 5번 초과로 빌릴수없음
		// 1. 현재 대여중인 책을 renCount에서 가져옴
	    int todayRentalCount = booklistMapper.renCount(userId);

	    // 2. 오늘 같은 책(ybi_idx)을 빌린 횟수 확인 (반납 기록 포함)
	    int todaySameBookCount = rentalMapper.getTodaySameBookCount(userId , ybi_idx);
	    
	    if(todaySameBookCount >= 3) {
	    	
	    	re.addFlashAttribute("sameRentalError" , "금일 동일도서는 총 3번까지 대여/반납이 가능합니다.\\n내일 다시 신청해주세요.");
	    	
	    }else if(todayRentalCount >=10 ){
	    	 re.addFlashAttribute("todayRentalError", "하루 총 10권까지 대여가 가능합니다.");
	    	
	    }else{
	    	rentalDTO rental = new rentalDTO();
			rental.setYbi_idx(ybi_idx);
			rental.setYu_userid(userId);
			rentalMapper.insertRental(rental);
			
			re.addFlashAttribute("subject",ybi_subject);
	    }
		
	    return "redirect:/RentalList";
	    
	}
		//반납
		@RequestMapping("/ReturnBook")
		public String Returnbook(rentalDTO rentalDTO ,String ybi_subject, HttpSession session , RedirectAttributes re) {
		//login_id 세션 불러오기
		String yu_userid = (String) session.getAttribute("login_id");
		
		//유저이름 ,반납일 저장
		rentalDTO.setYu_userid(yu_userid);
		rentalMapper.updateRental(rentalDTO);
		//booklistMapper.updateRentalStatus(rentalDTO.getYbi_idx(), "N");
		re.addFlashAttribute("subject",ybi_subject);
		return "redirect:/ReturnList";	
	}
	
	
}