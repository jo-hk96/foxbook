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
	
	
	@RequestMapping("/Rent")
	public String rental(@RequestParam("ybi_idx") int ybi_idx ,HttpSession session , RedirectAttributes rttr) {
		booklistDTO bookid = booklistMapper.GetBookId(ybi_idx);
		if("N".equals(bookid.getYbi_rental())) {
			String userId = (String) session.getAttribute("yu_userid");
			rentalDTO rental = new rentalDTO();
			rental.setYbi_idx(ybi_idx);
			rental.setYu_userid(userId);
			rentalMapper.insertRental(rental);
			booklistMapper.updateRentalStatus(ybi_idx, "Y");
		}
		return "redirect:/BookList";
	}
	
	
}