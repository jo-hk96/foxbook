package com.fox.bookrental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fox.booklist.domain.booklistDTO;
import com.fox.booklist.mapper.BooklistMapper;
import com.fox.bookrental.domain.rentalDTO;
import com.fox.bookrental.mapper.RentalMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class rentalController {
	@Autowired
	private RentalMapper rentalMapper;
	@Autowired
	private BooklistMapper booklistMapper;
	
	//대여
	@RequestMapping("/Rent")
	public String rental(@RequestParam("ybi_idx") int ybi_idx ,HttpSession session) {
		//booklistDTO bookid = booklistMapper.GetBookId(ybi_idx);
		String userId = (String) session.getAttribute("login_id");
		  
		rentalDTO rental = new rentalDTO();
		rental.setYbi_idx(ybi_idx);
		rental.setYu_userid(userId);
		rentalMapper.insertRental(rental);
		
		//Rental 값이 N일경우 로직 실행
		//if("N".equals(bookid.getYbi_rental())) {
			//booklistMapper.updateRentalStatus(ybi_idx, "Y");
		//}
		return "redirect:/RentalList";
	
	}
		//반납
		@RequestMapping("/ReturnBook")
		public String Returnbook(rentalDTO rentalDTO , HttpSession session , RedirectAttributes re) {
		//login_id : userid를 저장한 세션를 변수에 저장
		String yu_userid = (String) session.getAttribute("login_id");
		
		
		rentalDTO.setYu_userid(yu_userid);
		rentalMapper.updateRental(rentalDTO);
		//booklistMapper.updateRentalStatus(rentalDTO.getYbi_idx(), "N");
		re.addFlashAttribute("returnSuccecs", "반납이 완료되었습니다.");
		return "redirect:/RentalList";	
	}
	
	
}